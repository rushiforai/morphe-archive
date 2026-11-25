"""Owned JW activation selection and exact retained asset bytes."""
PLAYER_SHA256='1f110fbbffb827e749b913866a85ef70972a1f64249aec24f0274d64ef1d8ca0'
ADS_ANCHOR='n=(0,D.A)(e.edition);if(n("ads")){'
ADS_REPLACEMENT='n=(0,D.A)(e.edition);Object.keys(t).forEach(function(e){/^(?:vast|googima|imaPluginSdk|dai|daiPluginSdk|bidding|freewheel|ssai|cnx|jwx)$/i.test((0,y.dB)(e))&&delete t[e]});if(false){'
ANALYTICS_ANCHOR='if(n("jwpsrv")){'
ANALYTICS_REPLACEMENT='Object.keys(t).forEach(function(e){/^jwpsrv(?:-dnt)?$/i.test((0,y.dB)(e))&&delete t[e]});if(false){'
MANIFEST_SHA256='f9246c48ffd493f36e5079169f1c1b4b0cdc1830026a8685b3fd223bdaf05234'
