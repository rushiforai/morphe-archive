# CamScanner implementation contract

## Supported surface

This bundle adds five independently selectable CamScanner patches to the official
Morphe Gradle project. RailsGo behavior is not changed.

- Clean full APKM 7.26.5.2609160000 / 72651 and 7.27.0.2609220000 / 72701 only.
- Standard and Shizuku installations require the trust patch; mount is unavailable.
- Original package, app name, providers, modules, resources and OCR assets remain.
- Trust, local premium and privacy are selected by default. Ads and offline are not.
- Keep the same local signing key to update without uninstalling or clearing data.

## Code ownership

| Source | Responsibility |
| --- | --- |
| `CamScannerPatches.kt` | Patch metadata, options, dependencies, qualified bytecode/resource policy application. |
| `CamScannerTargets.kt` | Original target methods, class pins and policy groups. |
| `CamScannerVersions.kt` | Exact version/code pairs, independently measured overrides and login register layouts. |
| `CamScannerClassPins.kt` | Exact equivalent DexPool encodings measured with the two reviewed patcher runtimes. |
| `CamScannerSigning.kt` | Narrow native request-sign compatibility edit and exact input-byte guards. |
| `CamScannerStartupGate.kt` | Qualified sideload warning edits; preserve neighboring methods and real process behavior. |
| `CamScannerManifestPolicy.kt` | Fixed metadata/ad-component/INTERNET policy with ambiguity rejection. |
| `CamScannerRewardSkip.kt` | Original lottery dispatch guards, request-bound callback flow and correctly relocated branches. |
| `CamScannerLotteryInitGuard.kt` | Exact original WebView guard and silent, qualified initialization protection. |
| `LoginApiPolicy.java` | Only injected CamScanner helper: stateless API Center cache compatibility policy. |

Private research and historical diagnostic models are not product code. The
shipped bundle has no scanner patch, quota inspector, native entry/error observer,
reflection probe, diagnostic overlay or diagnostic selection. Old investigation
snapshots remain recoverable in development history, not in application payloads.

## Trust, login and startup

The trust patch retains a guarded native request-sign computation correction in
the two qualified libraries and the original login path. It does not globally
spoof certificate APIs or fabricate authentication results. Original email-login
methods and the real API Center/network request continue to run.

`LoginApiPolicy.refreshLoginApis` invalidates only the exact obsolete backup UAPI
or the qualified error-only API Center envelopes. Unknown, malformed, mixed and
valid configurations retain their original identity. No replacement service host,
token, preference or diagnostic record is stored. Its test source exercises the
actual injected helper, not a duplicate diagnostic implementation.

Startup edits target exact warning instructions only, rather than broadly
replacing process initialization or hiding arbitrary errors. Version-specific
class/native guards reject incompatible or modified input before output.

## Local premium and privacy

Local premium changes only the reviewed local feature predicates. It cannot
establish server subscription, credits, cloud storage or cloud conversion rights.
The folder cap stays original by default and has its own explicit option.

Privacy groups the fixed Firebase and app logging policies. It covers qualified
collection/re-enable/cache/reconnect paths but does not guarantee zero traffic,
zero native crash files or behavior of other applications/services. Offline does
not force premium or privacy; either can be selected independently.

## Ads and offline

Ads suppress qualified ad entry points and remove only the fixed reviewed ad
components. Login, Billing and WorkManager are not generic removal candidates.
`rewardedVideos` defaults to `block`; `skip-lottery` is explicit, online and 72701
only. See the [lottery contract](camscanner-reward-video-experiment.md).

Offline removes every app INTERNET declaration while preserving actual platform
connectivity reporting. It includes core/ads support and rejects lottery skipping.
External applications and system services are not made offline by this policy.

## Validation boundary

Official build tasks are:

```sh
./gradlew :patches:test :patches:buildAndroid :patches:generatePatchesList
npm ci
npm test
```

The extension contract checks that the CamScanner payload contains only
`Lapp/pigfoot/camscanner/LoginApiPolicy;` and no diagnostic helper/runtime copy.
Tests cover real cache policy, option/dependency defaults, strict version/pin/
manifest/native guards, startup argument/layout preservation, real-offset reward
semantics and silent initialization ownership/error behavior.

Actual APK qualification additionally checks:

1. Apply the official artifact to independently merged pristine full inputs.
2. Compare original method bodies/registers/branches/handlers outside intended
   edits, including every injected lottery cancellation/fallback destination.
3. Verify signing/startup/login/cache policy, native bytes, class inventory,
   original identity, modules and byte-identical assets against the baseline.
4. Exercise wrong-version, offline conflict, modified input and reapply rejection.
5. Compare supported normal outputs against the previously phone-accepted build.

Builds/models are not phone evidence. Device acceptance observed the corrected
preload entry/return path, an OCR prize-issued confirmation and a claimed-cloud-
reward aggregate increase matching a 50 MB prize in the qualified normal-skip
context. Effective usable OCR quota and total account storage capacity were not
independently shown. No old-prize recovery/refund or all-account guarantee follows.
Cloud Word export and broader runtime/privacy behavior are not claimed fixed.
