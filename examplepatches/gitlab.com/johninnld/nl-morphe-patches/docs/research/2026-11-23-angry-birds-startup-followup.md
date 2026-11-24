# Angry Birds startup investigation: follow-up

Date: 2026-11-23. This is a static investigation of the existing extracted copies and patch sources. The original APKS SHA-256 values are `b38bca59a94621ad53912d2eb2fd506c699469559524b5381d3fc48e58490882` (Angry Birds 2 26.7.3) and `9aef9038b4dc245d10f414779d8d37b3238d335d2a513acb9e6bcded93e7784b` (Friends 14.9.0). All extracted base, ARM64 and Angry Birds 2 asset-pack APKs were SHA-256 matched against their corresponding archive entries on this date.

## Observed failures and missing controls

The prior research records phone startup errors for both fully patched games, but no unpatched control, no attribution of an installed APK hash to a specific probe, and no runtime trace explaining either error. A static Play licence check is present; its existence does not establish that it ran, returned a particular response, or caused either error. The Angry Birds 2 asset pack being present in the archive and merged output does not establish that Play Asset Delivery or Unity loaded it successfully. Do not label the startup problem fixed or attribute it to tracking, ads, licensing, or asset delivery without further evidence.

## Specific defects or gaps in the current candidate

- `RovioBeaconAds.kt` injects a direct `onAdError` into `AdsSdk.load` and `show`. Both original inputs dispatch their work using `Globals.runOnUiThread`, which delegates to `Activity.runOnUiThread`. The injected callback runs on the caller's thread and synchronously; the original SDK callback follows the UI-dispatched load or show. The candidate's assumption that the caller is always the Android UI thread is unverified. Callback thread, timing and reentrancy therefore differ; the impact on startup and ad flows is not yet known.
- `load` and `show` are not the only advertising-related entry points. Both shipped games expose `AdsTokens.getTokensAsyncStatic` and a multi-network bidder-token collector. The Angry Birds 2 decompilation also exposes independent `*SdkInitializer.initialize` methods and `FBAudienceNetworkSdk.initializeBidderToken`. The two injected methods do not intercept those paths. Static reachability alone does not prove they execute; the claim that all ad SDKs cannot start and no ad network is contacted is unsupported.
- `DeviceInfo.getPlatformIdentifiers` in both inputs adds `androidId` from `Settings.Secure` to the JSON sent to its caller. The candidate only changes the advertising ID, tracking-enabled flag, app-set ID and attribution helpers; it does not intercept this identifier. The existence of the JSON field does not alone prove network transmission, and removing it blindly could break game identity or bootstrap.
- The game uses Unity IL2CPP, so Java decompilation describes bridge and SDK behavior, not the whole bootstrap or all telemetry. Inspect native/managed metadata and observe runtime boundaries before asserting complete coverage.

## Required next evidence

1. Identify every output APK, patch selection, signer, and installation for a reproducible comparison; the original extracted APKs already match both supplied archives. Do not rely on reused MPP names or unlabelled probe builds.
2. Prepare an owned runtime and the existing mandatory Frida observation coverage. Preserve the original data of the connected phone and other running emulators. Establish baseline original-signer unpatched controls and, if that works, isolated re-signed parked-only, ads-only, tracking-only and combined comparisons where installation provenance allows. Record failures, logs and asset-pack state without treating setup as success.
3. Determine the callback contract and actual initialization/token and identifier calls at runtime; trace Unity-side consumers and the first failing bootstrap boundary before choosing the smallest coherent product changes. Verify startup, ad suppression and tracking behavior separately, then test the car host and lifecycle.
4. Keep claims constrained to observed coverage. Release and publish nothing until product acceptance and the repository's mandatory checks and approval gates are satisfied.

The only configured AVD was already running when this note was written; it was not stopped, modified or used. No physical phone was touched in this investigation.

## Confirmed bytecode defect and first repair batch

The retained `verify-ab2/out_classes7.dex` and `verify-abf/out_classes4.dex` disassemblies both contain primitive `return v0` instructions immediately after the inserted empty string in `DeviceInfo.getAdvertisingIdentifier` and `getAppSetId`, and after inserted null in `Attribution.getMetaInstallReferrer`. These methods declare reference return types. The appropriate DEX instruction is `return-object`; this defect can cause ART class verification failure and must be corrected before diagnosing game-level policy failures. A device trace tying the reported dialogs to this rejection remains required.

The worktree candidate now selects `return-object` for reference returns. It also replaces the dispatched `AdsSdk` load/show lambda bodies, allocating a fresh local register, instead of intercepting the public UI-dispatch entries. Finally it excludes networks in `AdsTokens.getAllNetworks`; the shipped `AsyncCollector.thenRun` completes when pending count is zero, so the existing serialization path still returns an empty JSON object. This does not claim to disable independent initialization.

Complete verification command: `LOCAL_RELEASE_PYTHON=python3 node scripts/local-release/verify.cjs`, run in this isolated worktree. Current log: `/tmp/angry-birds-verify-20261123.log`. No new review artifact has been delivered and no runtime acceptance is claimed.

## Expanded coverage still required

| Surface | Current evidence and next work |
| --- | --- |
| Invalid bridge returns | Confirmed in both retained patched outputs; source repaired, build and ART acceptance pending. |
| Ad callback dispatch | Original public entry dispatch retained in candidate; real ad-flow acceptance pending. |
| Multi-network bidder tokens | Empty network selection candidate retains the collector completion; output and runtime verification pending. |
| SDK startup providers | Both manifests declare AppLovin, Audience Network, Vungle, Mintegral, IronSource and LevelPlay providers. The Unity Ads initializer is a child of AndroidX Startup. Inspect provider/initializer contracts and disable advertising-only work while preserving required lifecycle state. |
| Direct SDK initializers | Beacon exposes separate initializer methods; callback failure and native consumer handling need tracing before interception. |
| Advertising/app-set IDs and referrers | Existing candidate intercepts these; reference return correction is required. Permission removal alone is insufficient. |
| Platform identifiers | Android ID remains in `getPlatformIdentifiers`; distinguish account identity from advertising use at the consumer rather than replacing all device data blindly. |
| Google/Facebook analytics | Manifest flags exist; trace programmatic re-enablement and actual upload paths. |
| Sentry and native Unity telemetry | Empty Java DSN is only partial coverage; Unity/IL2CPP initialization and network paths remain in scope. |
| Game bootstrap, assets, licensing | Original-signer and re-signed controls remain required; do not forge a licence result based on static presence. |
| Parked car hosts | Actual host listing, launch, resize and lifecycle remain unverified. |

The Unity metadata files use version 39. Bounded inspection of the observed literal offset table confirms managed references to the Beacon licensing and identifier entry points; this establishes static presence only, not runtime invocation or the cause of an error dialog.

## Owner acceptance clarification

The owner reaffirmed that delivery and acceptance must use an MPP applied through Morphe's normal workflow. Produce a signed, immutable commit-derived review MPP under PUBLISHING.md, explicitly select/update that source in Morphe, choose the supplied original APKS and all requested patches, and install with the existing Morphe APK signing identity. Inspect the Morphe-installed APK for intended bytecode before claiming delivery, then verify startup, suppression and parked-host behavior. CLI-patched APK installation cannot substitute for this acceptance. Original/unpatched controls, where needed, are diagnostic evidence only.

## Expanded candidate checkpoint

Complete `scripts/local-release/verify.cjs` verification passed after adding the missing game navigation entries. The expanded source now blocks all eight Beacon ad-initialization lambdas with `onComplete(false, "Advertising disabled")` on the existing UI dispatch; it disables seven advertising-only providers and removes only the Unity Ads child of AndroidX Startup. Both tracking resource patches now invoke Privacy Sandbox permission removal. This supersedes the earlier candidate's narrower initialization coverage above. Native telemetry, programmatic Facebook events, identifier consumers and normal Morphe/device acceptance remain open. Verification log: `.tools/artifacts/angry-birds-boot-20261123/angry-birds-verify-coverage-20261123.log`.

## Normal Morphe result and local consent follow-up

The owner reported both games working after applying the review MPP, and supplied screenshots of both advertising consent forms. Package update timestamps were 16:32:32 (Angry Birds 2) and 16:32:03 (Friends). Those observations establish user-reported startup recovery; independent installed-bytecode inspection, ad-flow checks and parked-host acceptance remain open.

Both games call the separate Beacon TCF wrapper's Google UMP update and form-loading APIs. The next candidate replaces that wrapper's five entry points with local opt-out completion: optional grant and legitimate-interest bits are revoked while preserving stored bit-vector lengths, stale TCF/additional-consent receipts are cleared, advertiser consent-mode participation is disabled, and the native listener is completed on the Android UI dispatch. Geographic applicability remains untouched. Status 3 denotes completion of the local decision, not an affirmative grant or a generated CMP receipt. Status remains unknown until local revocation has completed. No UMP request or form API is called through these replaced entries.

The complete verification command passed for this batch. The generated helper DEX regression check covers revoked keys, absence of UMP/network calls in the local completion, UI dispatch and completion after preference application. Normal Morphe reapplication and the absence of forms while gameplay continues remain required device evidence.
