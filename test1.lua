
aplist = nil
function listap(t)
  aplist = t
end

-- set mode and phymode to something else then set to what we want
wifi.setmode(wifi.SOFTAP)

wifi.setmode(wifi.STATIONAP)

local cfg={}
cfg.ssid = "nodeusb-"..node.chipid()
wifi.ap.config(cfg)

tmr.alarm(5, 1000, 0, function() wifi.sta.getap(listap) end)
tmr.alarm(0, 2000, 0, function()
  dofile("i.lc")
  end)
tmr.alarm(1, 5000, 0, function()
  wifi.setphymode(wifi.PHYMODE_B)
  wifi.setphymode(wifi.PHYMODE_G)
  end)

net.dns.setdnsserver('8.8.8.8',0)
net.dns.setdnsserver('8.8.4.4',1)
