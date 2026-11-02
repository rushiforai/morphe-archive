# RainViewer validation

Target: **8.4.1 / 44084**, publisher minSdk29 and minSdk32 variants. Privacy baseline validated on the API32 variant on 2026-11-01; compatibility/local Pro and API29 follow-up on 2026-11-02.

- Original APKM SHA-256: `b38cf76df9235a277b8ec8fba064f67e24820ba2b962b12741986bcfdb89e91b`.
- Original base APK SHA-256: `f0449a4c5deae2273088259243a90bae9dc40842136415d99b5b1469792276c4`.
- Original signer SHA-256: `1ee1224e4ec7aa2214ae60f92f7e53fa2de148b12f7e9fa3e9c97b87844f4bcc`.
- Kotlin/native Android app; full bundle includes ABI/density/language splits. The test build merges the original complete APKM and retains arm64 libraries.

## Verified

- `:patches:buildAndroid :patches:test` passed.
- All four patches applied together and each applied independently with Morphe `--validate`; all five reports contain successful patching and rebuilding steps.
- `tests/verify_rainviewer.py` inspects the actual emitted DEX/resources. It rejects the unpatched input, checks the control boundaries and confirms unchanged entitlement calculations and PremiumWorker methods.
- Python regression suite: **413 tests, 45 skips, no failures**. The skips are existing optional fixture/device checks; they are not RainViewer runtime evidence.
- Patched APK installed successfully on a dedicated Android 16/API 36 arm64 emulator.
- Fresh setup reached the live radar map after location/notification choices and color setup, skipping policy/purchase onboarding and the automatic Google consent notice. The live radar tiles rendered.
- Purchase map hint and Settings offer cards were found during the walkthrough and added to the controls. The updated build keeps plan status `Free` and normal Settings entries without those offers.
- Final signed bundle was rebuilt and reapplied after the cached-startup change; all five application reports passed again. The final APK was installed, its app data cleared on the dedicated emulator, and a fresh full setup again reached the live map without the subscription or UMP pages.
- Playback animated the map and the sharing workflow created a local video without an intervening advertisement.
- The final fresh-start log has no AndroidRuntime, VerifyError, Crashlytics startup or Clarity entries. The error-free process trace observed weather/search/forecast, notification settings and Firebase Installations requests; it did not observe the removed optional sender endpoints in those exercised paths.
- Original comparison screen was inspected across all 19 feature rows. No paid features were unlocked for the audit.

## 2026-11-02 compatibility and local Pro follow-up

- `:patches:buildAndroid :patches:test` passed after the compatibility and UI additions. Python regression suite again passed413 tests with45 existing skips.
- The signed MPP's Ed25519 signature was verified against the repository public key. Development APK signatures verified and updates installed while retaining app settings and purchase records.
- Certificate-helper emitted-code execution confirmed the original self-SHA1 and genuine other-package fallback. Google Remote Config returned HTTP200 after certificate metadata compatibility.
- No-attestation entry and one-time anonymous credential migration were executed from emitted smali. Tests include each commit failure and persisted-state second launches. Genuine provider/token methods, billing, request signing and publisher response enforcement remain intact.
- Independent static review checked register use, coroutine resumptions, migration ordering, request limits and UI boundaries. All nine controls applied independently and both privacy-only and all-control combinations passed on the final source bundle. Bilingual app guides matched all candidate patch names/defaults.
- An initial unbounded Pro input changed map requests and later failed. The final request-model separation retained Free limits while Settings showed Pro. On the same working Free credential, the final data capture recorded34 code0 responses before the explicit AI experiment, including fresh map/forecast data and radar product metadata.
- The server purchase response remained `purchased=false`, `type=0`, no products and no trial. KMUX DBZH and VRAD0.0° images downloaded and rendered despite catalogue lock metadata. This is runtime evidence for those tested product paths, not every premium endpoint.
- Actual cached map models had24 future hourly frames per model, not72h. Ordinary Free forecast had24 hourly and8 daily points. The72h UI label alone does not establish72h payload availability.
- A separate temporary APK restored only the original AI dispatch. `/mobile/forecast/assistant` returned code210 Not allowed and no summary; later warnings/maps returned code81. The AI-enabled test APK is not the delivery build.
- Weather Warnings overlay showed an error badge and `/mobile/alerts/` returned code81. The requested cleanup removes its map control/dispatch while retaining ordinary forecast alerts. AI cleanup uses the original Gone UI state, including cached AI selection.
- Installed UI cleanup was inspected without Frida: AI controls absent, normal temperature forecast/Coastal Flood Statement retained, map warnings control absent and other overlays retained. The subsequent installed Manage cleanup also retained Pro while removing the action and chevron; its emitted constructor verifier covers both initial Manage values.

See [local Pro research](local-pro-research.md) and [integrity investigation](integrity-investigation.md) for the exact original code locations, request fields, scope and limitations.

## Android 10+ variant and default-selection fix

The additional supplied APKM has SHA-256 `b85094cea1dda691a560d6615074f897730f23b9c96292e04e7460c9c631323f`, version 8.4.1/build 44084, minSdk29, arm64-v8a and 480–640dpi. Its original signer matches the pinned publisher certificate and all three DEX files are byte-for-byte identical to the original minSdk32 input.

The published 1.24.0 bundle reproduced the reported `Unsupported RainViewer manifest minSdk` failure on this input. The corrected app-scoped guard accepts exactly 29 and 32. The shared validator, signer, package and build checks remain unchanged. The production-guard regression passed 73 assertions, including invalid metadata, foreign/mixed signers, unsupported SDKs and missing/ambiguous declarations.

All nine RainViewer controls are now enabled by default. Patching both supplied original APKMs without explicit patch selection applied all nine and completed successfully. The emitted API29 output passed the privacy, certificate, migration, local Pro, AI and warnings verifiers; output manifests preserve the respective minimum SDKs. This verifies patching of the new input; it does not constitute a physical OnePlus runtime test.

## Evidence locations

Local analysis is retained under the primary checkout's `.analysis/rainviewer-8.4.1/`: original APKs, JADX and smali, patch reports/logs, build/test logs, comparison-screen layouts, emulator screenshots and process request trace. Proprietary decompiled source is not committed.

## Limits

The physical phone supplied a baseline screenshot of the original app. Its installed app/data were not replaced. Runtime acceptance applies to the dedicated emulator and the paths exercised, not every device, account or weather service. Push delivery and manual premium purchase flows remain unverified. Endpoint entitlement findings are limited to the explicit requests above. Stable publication requires the repository's app-approval workflow.
