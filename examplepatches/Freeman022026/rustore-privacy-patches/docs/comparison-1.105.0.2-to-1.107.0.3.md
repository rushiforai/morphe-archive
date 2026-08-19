# RuStore 1.107.0.3 patch comparison

The previous audited official APK was RuStore 1.105.0.2 (version code 1105002). The current official APK is 1.107.0.3 (version code 1107003).

| Field | 1.105.0.2 | 1.107.0.3 |
| --- | --- | --- |
| APK size | 85,502,424 bytes | 86,894,125 bytes |
| APK SHA-256 | `452b208b409f7f4a9d03d7f9aa6b80ada7c3e4fefae474401565edb051aa9a4d` | `b7b030551300b23fdbeb14a96fb9ff3f8a10bb85c802558d82f66bb1e3b273ee` |
| Signer SHA-256 | `661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914` | unchanged |
| DEX files | 5 | 5 |
| Declared permissions | 40 | 40 |
| Manifest components | 187 | 187 |
| Manifest providers | 23 | 23 |

The permission set and component counts are unchanged. The only provider identity change is the replacement of `ru.mail.omicron.util.network.state.NetworkStateListenerProvider` with `ru.mail.network.NetworkStateListenerProvider`.

The 1.107.0.3 audit replaced the monolithic patch with nine selectable patches. AppMetrica and MyTracker initialization remain disabled. The new analytics patch also covers AltCraft and Radar scheduling and returns a valid WorkManager success result from disabled workers. Separate patches now control advertisements, push services, verification hooks, background hooks, Kaspersky scheduling, the gaming profile, and update authentication.

The retained install and package-discovery capabilities are unchanged. Tracking identifiers, location, SMS, call-log, boot, VPN, usage-stat, push, advertising, and privileged-install declarations remain disabled.

The Samsung compatibility declarations `POST_NOTIFICATIONS` and `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` remain present. This preserves the confirmed first-run callback behavior that populates Samsung's installed-app list while allowing both user-facing requests to be denied.

Only RuStore 1.107.0.3 is supported by the current bundle. Version 1.105.0.2 remains in this document only as the historical comparison baseline.
