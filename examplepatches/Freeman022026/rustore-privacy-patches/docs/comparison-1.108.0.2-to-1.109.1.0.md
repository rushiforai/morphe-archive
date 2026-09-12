# RuStore 1.109.1.0 patch comparison

The previous audited official APK was RuStore 1.108.0.2 (version code 1108002). The current official APK is 1.109.1.0 (version code 1109100). The intermediate release 1.109.0.2 (version code 1109002) carried the structural changes; 1.109.1.0 is a follow-up build of the same layout.

| Field | 1.108.0.2 | 1.109.0.2 | 1.109.1.0 |
| --- | --- | --- | --- |
| APK size | 87,415,515 bytes | 86,575,127 bytes | 86,575,127 bytes |
| APK SHA-256 | `a45c63de41baed81d82cc0b3aebdbb27ee3a2d506ad5ea40b2be0960fbb5d041` | `358f2e7a6c5c2c7876b9ea36cbffffdc482719b6b6d64d50d1f25783989cd99a` | `0ff02f150a25acb9bf651488f7fb2a8552b9f004dd545ab4327481b7487d794e` |
| Signer SHA-256 | `661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914` | unchanged | unchanged |
| DEX files | 5 | 5 | 5 |
| Declared permissions | 41 | not retained | 41 |
| Manifest components | 186 | not retained | 185 |
| Manifest providers | 23 | not retained | 23 |

The permission set is unchanged. All 41 declarations in 1.109.1.0 match 1.108.0.2 exactly, and the same 20 forbidden permissions remain declared by the official app: privileged `INSTALL_PACKAGES`, `AD_ID`, usage stats, call log, phone numbers, SMS receive, location, phone state, Wi-Fi and network state changes, USB host, external storage write, billing, GSERVICES, install referrer, C2DM receive, Huawei common data, and the Sberbank personalization binding.

The component inventory changed only inside the VK push SDK. The two multi-process services `com.vk.push.pushsdk.work.multiprocess.service.WorkManagerRegistratorService` and `WorkManagerExecutorService` were removed, and a single replacement service `com.vk.push.pushsdk.work.VkpnsWorkerService` was added. The whole `com.vk.push` prefix is already inert after patching, so the replacement service is covered by the existing component disabling rather than a new rule. Provider, receiver, and activity counts are otherwise identical.

The native library `libsecrets.so` was renamed to `libplain.so` for every ABI, together with the matching class rename `com.vk.push.authsdk.Secrets` to `com.vk.push.authsdk.Plain`. Both sit inside the disabled VK push namespace. The code-level rework also replaced the push SDK's `com.vk.push.core.work` executor and registration classes with the new worker layout, which required the refreshed bytecode fingerprints and the additional worker blocking shipped in patch v1.1.9. That release also blocks the new install-reminder worker and drops the obsolete Kaspersky scheduler hook.

No new tracker SDK namespace appears. The class-level diff shows internal churn inside already-neutralized packages: `ru.mail.libverify` and `ru.mail.verify` verification controls, `ru.ok.tracer` performance-metrics and heap-dump helpers, `com.my.tracker.obfuscated` internals, `io.appmetrica.analytics.impl` internals, and VK auth verification coroutines. The only new readable dependency is `androidx.datastore`, used for app settings storage and not a tracker. Roughly 31,000 obfuscated short package names were reshuffled by the upstream build, which is normal R8 churn and carries no manifest or behavioral signal.

A fresh `patches-1.1.10.mpp` bundle was built from `main` and applied locally to the official 1.109.1.0 APK with Morphe Desktop 1.13.0. All twelve patches applied, patching, rebuilding, and signing succeeded, and the fail-closed manifest audit passed: the nine required compatibility permissions are present, all 21 forbidden permissions and 19 forbidden manifest anchors are absent, 67 components across the 16 disabled tracker prefixes are inert, no invalid component prefix leaked, and the WorkManager boot rescheduler remains the only `BOOT_COMPLETED` receiver. The new `VkpnsWorkerService` is explicitly confirmed `android:enabled="false"` in the patched output.

Only RuStore 1.109.1.0 is supported by the current bundle. Version 1.108.0.2 remains in this document only as the historical comparison baseline.
