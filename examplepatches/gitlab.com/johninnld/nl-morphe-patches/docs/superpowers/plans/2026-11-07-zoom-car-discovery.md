# Zoom car discovery correction

**Goal:** Keep the patched Zoom car service discoverable after a fresh installation and normal startup.

**Evidence:** The owner's installed 7.2.1.43844 APK retains the CALLING service and car metadata, but PackageManager records `ZmAutoServiceV3` as explicitly disabled. Both `VideoBoxApplication.checkAndInitializeCS()` and `PTUI.checkAndInitializeCS()` call `com.zipow.videobox.auto.w.a(false)` when the original availability condition fails. Earlier emulator acceptance explicitly enabled this service, so it did not qualify discovery.

**Design:** Enable only `ZmAutoServiceV3` in the manifest and keep the exact service-specific component update enabled. Preserve the existing component identity, exception handling, unsupported-process guard, host validator, native startup repair, account checks and all other components. Reject unexpected original method or manifest contracts.

**Implementation batch:**

- [x] Add guarded service-discovery resource and bytecode dependencies to the existing Zoom addon.
- [x] Add real-original-DEX tests for preservation, idempotence and changed-contract rejection.
- [x] Correct both app pages and record the earlier acceptance limitation.
- [x] Run the affected Android build/unit tests, generated catalogue and bilingual documentation gates together. Reuse the unchanged release-policy, Python and Medium evidence from v1.49.0.
- [x] Apply the complete candidate to the original APKS; independently inspect its manifest, component updater, native startup repair and unchanged unrelated libraries.
- [x] Query normal service discovery without an enable override on a clean emulator installation; start/restart Zoom with the existing passive observer and query again in one bounded session. Also reproduce an explicit disabled-component state and verify that startup repairs it. Preserve the saved emulator baseline and stop the owned runtime afterward.
- [x] Attempt one-time phone service restoration and retain the denial evidence: the phone blocks shell component changes. Preserve the installed APK/data and copy the corrected signed addon to Download. The phone's Manager signing certificate differs from the desktop test certificate, so the persistent correction requires a Manager update.

No new publication or physical-phone APK replacement is part of this local correction.
