# RainViewer privacy implementation plan

> Use the executing-plans skill to implement the tasks inline.

**Goal:** Create Morphe patches for RainViewer 8.4.1 (44084) that remove advertisements and tracking, skip subscription and consent screens, and deliver an evidence-based audit of locally implemented premium features.

**Architecture:** Follow the existing per-app bytecode/resource patch pattern. Pin the original signing certificate and version. Disable the final ad configuration gates so cached and remote configurations cannot re-enable placements. Keep billing and premium entitlement logic intact for the audit.

**Tech stack:** Kotlin, Morphe patcher, smali/DEX, Python, adb.

## Constraints and review focus

- Work on `feat/rainviewer-privacy`; preserve unrelated changes in the primary checkout.
- Do not promote this app to main without user confirmation. Do not manually change release metadata.
- Any Git operation creating or publishing commits must pass the repository identity checks.
- Preserve map data, location choice, notification delivery, user-initiated billing, and lifecycle callbacks.
- Check cached consent/telemetry settings, queue replay, ad completion callbacks, original split APKs, and cold starts.

## Tasks

- [x] Add an independent emitted-DEX verifier; prove it rejects the unpatched APK.
- [x] Add original input compatibility and the minimal local Play licensing fix needed for re-signing.
- [x] Disable main/forecast/sharing/post-play/post-premium/in-house ads and chart promotions.
- [x] Disable app/Firebase analytics, Clarity recording, performance/crash telemetry, advertising IDs, and publisher session/paywall events, including queued transports.
- [x] Skip subscription onboarding and recurring subscription prompts, and skip Google UMP without recording consent.
- [x] Build the MPP, apply patches to the original complete bundle, inspect emitted DEX/resources, and test on Android without deleting the user's installed app data.
- [x] Complete the premium audit using exact gate, renderer, persistence, and network evidence for each feature.
- [x] Add user documentation and validation results; run relevant regression/build checks and review before delivery.

## Verification ledger

- Decompiled the original supplied bundle; retained all proprietary analysis under the ignored primary `.analysis/rainviewer-8.4.1` directory.
- Verifier rejected the unpatched original and subsequently caught remaining map purchase hints and cached startup-screen handling before those were fixed.
- Built with Gradle and ran patch unit checks. Applied all controls together and each independently to the original APKM with unique fingerprint validation.
- Executed emitted instructions for cached ad gates, purchase/weather hints, queued CCT acknowledgements, the inert crash facade, merged constructor variants and cached startup-offer completion.
- Verified runtime onboarding/map/search/Amsterdam forecast, Settings offer removal, playback and local video creation on the dedicated API36 emulator. Physical phone data was retained.
- Recorded all 19 comparison rows and the additional sharing watermark restriction; documented remote dependencies and untested premium/server behavior.
- Ran 413 Python tests (45 existing skips), Markdown-link validation, and a fresh independent code review with no Important/Critical findings.
- Ruling: keep user-initiated billing and weather/notification services operational; the requested premium deliverable is an audit, not a paid-entitlement override.
- Ruling: suppress all automatic startup/web notices, including cached notices, because they can carry promotions outside the recurring paywall event sender. The docs state this broader UI scope.
- No stable promotion or generated release metadata change. Delivery remains on the feature branch.
