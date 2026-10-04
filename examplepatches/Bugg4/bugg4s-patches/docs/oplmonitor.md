# OPL Monitor — development notes

Notes for maintaining the patches for `com.insigniadpfgmailcom.oplmonitor` (OPL Monitor —
Opel/Vauxhall/Chevrolet diagnostics app: DTC reading/clearing and DPF monitoring over
ELM327-based OBD2 dongles).

## Target app

- Package: `com.insigniadpfgmailcom.oplmonitor`
- Target version in this repo: `1.0.3.65` (versionCode 65)
- Distribution: XAPK (base APK + `config.arm64_v8a` native split + language/density splits)
- minSdk 23, targetSdk 35, arm64-v8a only
- Launcher name: "OPL Monitor"; icon: dark tile with orange (#E54701) accents

## Architecture (important!)

The app is a **.NET MAUI (Xamarin)** application. All business logic is C# compiled into
`libassemblies.arm64-v8a.blob.so` + `libaot-*.dll.so` inside the native split. The Dalvik
layer only contains Xamarin/Mono glue (`mono.*`, `crc64*` classes, `functionexecute`).

Consequences:

- Morphe patches can modify the **manifest, resources and Dalvik bytecode** only.
  They **cannot** change C# behavior (features, update checks, network fetching, purchases).
- Hooking third-party Java SDKs that the C# code calls (e.g. the AdMob SDK) is the only
  way to influence app behavior, and only for SDK-mediated features.

## Protection: PairIP

`com.pairip.licensecheck` (LicenseContentProvider → LicenseClient) runs at app startup.
It checks that the installer is the Play Store and verifies the license with Play.
Repacked/re-signed builds otherwise get a "download from Google Play" paywall
(`LicenseActivity`) and the app closes.

- **Fixed and verified on device (2026-09-30)** by the `Change installer source` patch, which
  spoofs the installer source (`InstallSourceInfo.getInstallingPackageName()` and related
  calls) so PairIP's local installer check passes. No license/tamper logic is modified.
- **Android 9 and older: the installer spoof cannot work.** The app's
  `performLocalInstallerCheck()` short-circuits on `SDK_INT < 30` ("Local install check
  bypassed due to old SDK version"), so the spoofed call never runs and the app always
  falls through to the full Google Play license verification, which fails for any
  sideloaded (re-signed) install → paywall → Play Store redirect. Verified on an Ottocast
  PICASOU (Android 9). For these devices use the `Remove license check` patch, which
  removes the PairIP ContentProvider from the manifest so the check never starts.
  It grants no entitlements and does not affect purchases.
- Alternatives without code changes: install via root mount (Morphe Manager), which keeps
  the original Play install identity, or install with the installer recorded as
  `com.android.vending` (`pm install -i com.android.vending`).

## Ads

- Google Mobile Ads SDK (unobfuscated), driven from C# through `Plugin.MauiMTAdmob`
  (Java callback glue in `crc64509fec87287e985b.*`, e.g. `InterstitialService`,
  `RewardService`, `AppOpenAdManager`, `NativeAdManager`, `UMPImplementation`).
- Ad formats referenced by the app: BANNER, INTERSTITIAL, REWARDED; ads also appear in
  the gauges panel and the DTC-clearing flow (`GaugesPanelRun*Ad`, `ClearDtcAdsShowMessage`).
- Ad unit IDs live in the .NET assemblies blob.
- The app has an ad-free IAP (`OplMonitorAdFree1yPeriod`) — purchase logic is untouched.
- SDK fingerprints are pinned to exact dex signatures; verify against the APK with
  `~/Android/Sdk/build-tools/36.0.0/dexdump` (unzip `classes*.dex` first). Watch out:
  `AdManagerAdRequest` is in `com.google.android.gms.ads.admanager` and
  `AppOpenAdLoadCallback` is a nested class (`AppOpenAd$AppOpenAdLoadCallback`).

## Update checks

- C#-driven; update-related resource keys: `DontUpdatePanel`, `AppWasUpdated`,
  `FirmwareUpdate*` (dongle firmware notices), `VersionCheckFail*`.
- Exact comparison logic is not known (inside the .NET assemblies).
- `SpoofAppVersionPatch` (manifest `versionName`) is a best-effort mitigation.
  Next iteration if it fails: also spoof `versionCode`, or fall back to removing internet.

## Network-dependent features

Relevant when disabling network access (e.g. "Remove internet permission" patch):

| Feature | Resource keys | Impact if offline |
|---|---|---|
| DTC descriptions download | `DownloadDtcDesc`, `DtcDownloadErrorMessage` | Descriptions unavailable |
| VIN decode + gauge download | `DecodeVinOnline`, `VinDecodeMessageDownloadingGauges`, `VinDecodeFailedNoDecodeData` | VIN auto-setup and gauges unavailable |
| Paid "Function" packages | `FunctionDownloadingSoftware`, `FunctionCliCanNotDownload` | Purchased functions cannot run |
| Ads / update checks / telemetry | — | Disabled (desired) |

## Patches in this repo

| Patch | File | Default | Notes |
|---|---|---|---|
| Remove ads | `patches/src/main/kotlin/app/bugg4/patches/oplmonitor/ads/RemoveAdsPatch.kt` | on | No-ops all Google Mobile Ads load methods (banner/interstitial/rewarded/rewarded interstitial/app open/native) |
| Change installer source | `.../misc/ChangeInstallerSourcePatch.kt` | on | Spoofs installer source (`com.android.vending` option); required to pass the PairIP startup license check |
| Remove license check | `.../misc/RemoveLicenseCheckPatch.kt` | off | Removes the PairIP startup check entirely. For Android ≤ 9 devices where the installer spoof cannot work (full Play verification always fails for sideloaded installs) |
| Spoof app version | `.../misc/SpoofAppVersionPatch.kt` | off | Manifest `versionName` option (default `9.9.9`) |
| Remove internet permission | `.../misc/RemoveInternetPermissionPatch.kt` | off | Removes `android.permission.INTERNET`; see table above |

## Building locally

Requires JDK 21 (AGP's `jlink` transform fails on newer JDKs such as the system JDK 27).
A user-local Temurin 21 lives at `~/.local/share/jdks/jdk-21.0.12.1+1`:

```bash
JAVA_HOME=$HOME/.local/share/jdks/jdk-21.0.12.1+1 ./gradlew buildAndroid
```

The build needs the GitHub Packages token in `~/.gradle/gradle.properties`
(`gpr.user` / `gpr.key`, scope `read:packages`).
Output: `patches/build/libs/patches-<version>.mpp`.

## Testing checklist

Use [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/latest) and the
original XAPK:

1. Apply **Remove ads** only → install → verify the app launches (PairIP!) → verify no ads
   (gauges panel, DTC flow, interstitials) → check VIN decode still works (needs internet).
2. Add **Spoof app version** → verify no update prompt appears (about screen shows spoofed version).
3. If the update prompt persists → iterate (spoof `versionCode` too, or reconsider internet removal).

## Purchases / premium

The patches do not modify or bypass Google Play Billing or the app's purchase logic.
The only license-adjacent change is the PairIP installer-source spoof, which grants
no entitlements — it only skips the "installed from Play Store" startup check.

Important caveat: patched installs are re-signed and sideloaded, and Google Play
purchases are tied to the app signature. In practice, premium purchases (ad-free period,
paid "Functions", all-modules DTC subscription) will usually **not** be recognized in a
patched install. The purchases remain safe on the Google account, and a Play-installed
app keeps them — nothing is lost or revoked.

To keep premium purchases working together with patches, install via **root mount**
(Morphe Manager), which preserves the original Play install identity and signature.

## Device testing status

| Patch | Status |
|---|---|
| Change installer source | ✅ Verified — app launches past PairIP on Android 10+ (2026-09-30) |
| Remove license check | ✅ Verified on Ottocast PICASOU, Android 9 (2026-10-03) |
| Remove ads | In use since 2026-09-30, no issues reported |
| Spoof app version | In use since 2026-09-30, no update prompt reported so far |
| Remove internet permission | Not tested (not recommended — breaks VIN/DTC/function downloads) |

Recommended combinations: on Android 10+ use "Change installer source" (with "Remove ads");
on Android 9 and older use "Remove license check" instead — the two license patches are
mutually exclusive, only one is needed.
