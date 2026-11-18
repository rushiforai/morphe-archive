# Waze navigation broadcasts and Gearslip implementation plan

Goal: independent version-specific Waze 5.26.90.901 broadcasts for the current road limit, average-speed zone progress and calculated observed average; separate default-on Support Gearslip patch.

Architecture: native LocationSensorListener.updateSpeedometer callback for road limits; typed native legacy/insights callbacks for zones. Separate Android-free state/calculation class and Android broadcast adapter, without ZoneBar or Share alerts dependencies. Version1 primitive-only snapshots with monotonic data timestamps, sequence/process session, explicit unknown/stale/disabled state, km/h values, estimated-progress and observed-average flags. Public local request action; optional target-package patch option. Source selection prevents an unrelated feed clearing an active zone; segment identity or a large remaining-distance jump resets observations.

Contract: nl.johninnl.waze.NAVIGATION_STATE and nl.johninnl.waze.NAVIGATION_STATE_REQUEST. Road TTL30s, zone TTL90s, normal sends at most1Hz, heartbeat5s while data is fresh. Average is observed remaining-distance decrease / monotonic elapsed time, after30m and3s; no claim to a whole-zone average when joined mid-zone. Insights-only progress is explicitly estimated from first observed remaining distance.

Gearslip: add only verified app.seb3thehacker.gearslip certificate SHA256 4cc56ebdd13a54d260eca9b7e2b2ae6b30e2f225bfda8f508f0709edf084948b to the existing hosts_allowlist; preserve Android Auto trust and validation.

- [x] Add state/calculation and broadcast lifecycle tests, demonstrate failure before implementation.
- [x] Implement NavigationState, NavigationBroadcasts, native bytecode bindings, runtime switch and contract documentation.
- [x] Add standalone Support Gearslip resource patch and verify positive package/certificate admission plus negative host cases.
- [x] Build, apply each new patch alone and with the entire catalog, check original resources and broadcast delivery from a separate receiver.
- [x] Independent review, regression checks, commit/push under johninnl; use the approved dev/main release flow and verify published artifacts.

Review focus: units/unknown limits; partial averages; duplicated/native feed ordering; stale/end/switch-off clearing; rate limits and process restarts; exact host certificate trust without allow-all bypass. Do not change the dirty primary checkout or unrelated app work.
