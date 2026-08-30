<div align="center">

# DiskWala Patches for Morphe

**Bytecode patches for DiskWala (`com.diskwalaapp`) — no ads, premium unlocked, no forced update screen.**

Patches are built with [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) and install directly into the [Morphe](https://morphe.software) app as a patch bundle, exactly like popular bundles such as `piko`.

[![Release](https://img.shields.io/github/v/release/kuntal-devrat/diskwala-patches?sort=semver&label=release)](https://github.com/kuntal-devrat/diskwala-patches/releases)
[![Bundles](https://img.shields.io/badge/bundles-.mpp-blueviolet)](https://github.com/kuntal-devrat/diskwala-patches/releases/latest)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

</div>

---

## Quick start — install in Morphe

### Option A — one click

From your phone:

**[Add source to Morphe »](https://morphe.software/add-source?github=kuntal-devrat/diskwala-patches)**

### Option B — manually in the Morphe app

1. Open **Morphe** → **Sources**
2. Tap **Add** and paste:

```
https://github.com/kuntal-devrat/diskwala-patches
```

3. Back on the patches screen, select the **DiskWala Patches** bundle, pick DiskWala `24.5` (or a compatible version) and patch.

No root is required — Morphe builds a signed, patched APK you install over the original app.

> [!TIP]
> DiskWala ships as an XAPK (base + config splits, ~79 MB). Provide the **base APK** (`com.diskwalaapp.apk`) to Morphe. After patching, reinstall with all original splits via `adb install-multiple`, or repack the XAPK.

---

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.3](https://github.com/kuntal-devrat/diskwala-patches/releases/tag/v1.0.3)**&nbsp;&nbsp;â€¢&nbsp;&nbsp;`main`&nbsp;&nbsp;â€¢&nbsp;&nbsp;3 patches total
<details open>
<summary>ðŸ“¦ DiskWala&nbsp;&nbsp;â€¢&nbsp;&nbsp;3 patches</summary>
<br>

**ðŸŽ¯ Supported versions:**

| 24.5 |
| :---: |

| ðŸ’Š&nbsp;Patch | ðŸ“œ&nbsp;Description | âš™ï¸&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Stubs AppLovin, AdMob, InMobi and other ad SDKs at the bytecode level to prevent ads from loading without breaking the app. |  |
| [Disable forced update](#disable-forced-update) | Bypasses PairIP integrity checks, Play Integrity and signature verification to remove the forced update / modded-app screen. |  |
| [Unlock premium](#unlock-premium) | Makes RevenueCat entitlements appear active so ads-free and premium features are unlocked. |  |

</details>

<!-- PATCHES_END -->

<details>
<summary><b>What each patch does — technical description</b></summary>

#### Disable ads
- Stubs SDK entry points `com.applovin.sdk.AppLovinInitProvider#onCreate`, `com.inmobi.sdk.InMobiInitProvider#onCreate` and AdMob `MobileAdsInitProvider` to `return true` without initializing the SDKs.
- Stubs the React Native bridge `com.applovin.reactnative.AppLovinMAXModule`: `initialize`, `loadInterstitial`, `showInterstitial`, `loadRewardedAd`, `showRewardedAd`, `loadAppOpenAd`, `showAppOpenAd`, `createBanner`, `createMRec` all return without touching the ad network.
- `isInterstitialReady` / `isRewardedAdReady` resolve their JS `Promise` with `false` so the Hermes bundle never hangs waiting for an ad that will never come.

#### Unlock premium
- Forces `com.revenuecat.purchases.EntitlementInfo#isActive()` → `true`.
- Forces `EntitlementInfos#getActive()` to return all entitlements, clearing the *"Buy Subscription to enjoy Ads Free Experience"* gate.

#### Disable forced update
- Neutralizes PairIP: `StartupLauncher.launch()` → `return-void`, `VMRunner.invoke()` → `null` (native `executeVM` never runs).
- `SignatureCheck.verifyIntegrity()` → no-op, `verifySignatureMatches()` → `true`.
- `com.diskwalaapp.integrity.PlayIntegrityModule.requestToken()` resolves with a stub token (`diskwala_stub_integrity_token`) instead of the real Play Integrity flow — `forceUpdate` / `Modded APK Detected` never fire.

All fingerprints are defined in `patches/src/main/kotlin/app/diskwala/patches/**/Fingerprints.kt` and target non-obfuscated class/method signatures, so most updates of DiskWala should keep working experimentally.

</details>

---

## Compatibility

| App | Package | Tested version | Notes |
|---|---|---|---|
| DiskWala | `com.diskwalaapp` | `24.5 (334)` | Other versions enabled experimentally |

Patches are fingerprinted against DiskWala `24.5` (`versionCode 334`, `arm64-v8a`). The bundle declares every newer version as *experimental* — string/opcode-based fingerprints usually survive minor app updates, but verify on a spare build first.

---

## Development

### Requirements

- JDK 21
- A GitHub personal access token (classic) with `read:packages` scope, in `~/.gradle/gradle.properties`:

  ```properties
  gpr.user=your_github_username
  gpr.key=ghp_your_token
  ```

  (Or set `GITHUB_ACTOR` / `GITHUB_TOKEN` environment variables.) This is required because Morphe publishes its patcher libraries to GitHub Packages.

### Build

```bash
./gradlew buildAndroid
# → patches/build/libs/patches-<version>.mpp
```

The `.mpp` bundle can be loaded directly in the Morphe app or Morphe Desktop CLI for testing.

### Layout

```
patches/
  build.gradle.kts          ← bundle metadata (name, author, website)
  src/main/kotlin/app/diskwala/patches/
    shared/Constants.kt     ← Compatibility declaration
    ad/                     ← Disable ads patch + fingerprints
    premium/                ← Unlock premium patch + fingerprints
    update/                 ← Disable forced update patch + fingerprints
settings.gradle.kts         ← plugin resolution (mirror + jitpack)
```

### CI / releases

- Work happens on **`dev`** — `fix:`/`feat:` commits produce `*-dev.*` pre-releases automatically.
- Merge `dev` → `main` for a stable `vX.Y.Z` release; the `patches-<version>.mpp` asset and `patches-bundle.json` are published by the release workflow.
- `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` and the patches table in this README are CI-generated. Do not hand-edit.
- Dependencies are mirrored to [`kuntal-devrat/registry`](https://github.com/kuntal-devrat/registry) so CI builds resolve without extra GitHub Packages credentials beyond `gpr.*`.

---

## Verification

After installing the patched app:

```bash
adb logcat | grep -i -E "AppLovin|InMobi|PlayIntegrity|SignatureCheck|VMRunner"
```

Expected: no ad loader traffic, no `INTEGRITY_ERROR`, no PairIP VM execution (`Executing XrSWhF7qgXWkwZNT`), and no forced-update dialog at launch.

---

## License

[GPL-3.0](LICENSE). Forks of the Morphe ecosystem must follow the Morphe brand terms: do not use the *Morphe* name/logo for branding; describe this project as *compatible with Morphe*.

## Credits

- [Morphe](https://github.com/MorpheApp) — patcher, patch framework and release tooling.
