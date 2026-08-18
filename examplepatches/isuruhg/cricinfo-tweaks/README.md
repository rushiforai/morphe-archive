# cricinfo-tweaks

Patches for the ESPNcricinfo Android app (`com.july.cricinfo`), for use with
[Morphe](https://github.com/MorpheApp). They stop ads being fetched or shown, stop
the analytics SDKs from starting, remove the cold-start splash ad, and disable the
server-driven "you must update" lockout — at the source, not just network-blocked.

> **No app binaries are distributed here.** This repo contains only patch source
> code and builds a `.mpp` patch bundle. You supply your own copy of the app.

**Contents:** [What it patches](#remove-ads) · [Build](#build-the-bundle-mpp) ·
[Use](#use-it) · [Updating](#updating-for-a-new-app-version) · [Disclaimer](#disclaimer)

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/isuruhg/cricinfo-tweaks/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 ESPNcricinfo&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 26.07.24 | 26.05.11 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block tracking & telemetry](#block-tracking-telemetry) | Stops AppsFlyer, comScore, Conviva and Adobe Marketing from initializing, so they collect or send no attribution/analytics data. Leaves CleverTap intact to preserve push notifications. |  |
| [Remove ads](#remove-ads) | Stops ESPNcricinfo from fetching or showing banner, interstitial, native, rewarded and app-open ads (Google Ad Manager, Meta Audience Network, Taboola) by severing the Flutter ad plugins and skipping the ad SDK setup. |  |
| [Remove splash ad, startup delay & forced update](#remove-splash-ad-startup-delay-forced-update) | Removes the full-screen splash ad shown on every cold start (the main cause of the slow boot), the GPT interstitial, and the "you must update" blocking screen, by hiding their Firebase Remote Config keys from the app. Other remote config is untouched. |  |

</details>

<!-- PATCHES_END -->

## How this app is built (why the hooks look the way they do)

ESPNcricinfo is a **Flutter** app (`CiMainActivity extends FlutterFragmentActivity`).
The UI and ad-*placement* logic are AOT-compiled Dart inside `lib/.../libapp.so`,
which bytecode patching can't touch. But every ad must cross from Dart into the
native Android ad SDKs through **Flutter plugin glue**, and the analytics SDKs are
each started by a named **androidx.startup `Initializer`**. Both live in the DEX
with their original (non-obfuscated) class names, so we hook there. Source:
`patches/src/main/kotlin/app/template/patches/`.

### Remove ads
| Surface | Target | Change |
|---------|--------|--------|
| Interstitial / native / rewarded / rewarded-interstitial / app-open (AdMob **and** Ad Manager) | `io.flutter.plugins.googlemobileads.FlutterAdLoader.load*(…)` (all 10) | `return-void` — load never issued |
| Banners (GAM, Fluid, AdMob) | `FlutterAdManagerBannerAd.load()`, `FlutterBannerAd.load()` | `return-void` — AdView never built/requested |
| Google Mobile Ads + Teads mediation | `CiAppInitializerGoogleAds.create()` | return `Boolean.TRUE` (skip init) |
| Meta Audience Network | `CiAudienceNetworkInitializer.create()` | return `Boolean.TRUE` (skip init) |
| Taboola | `CiAppInitializerTaboola.create()` | return `Boolean.TRUE` (skip init) |

> Google Mobile Ads also self-initializes via its own `ContentProvider`, so the
> `FlutterAdLoader` no-op is the real ad-killer; the initializer no-ops additionally
> stop Meta & Taboola (which need an explicit init with publisher info) and Teads.

### Collapsing the empty ad slots
Blocking a load silently leaves the Dart widget waiting forever, so the app keeps the
slot's reserved height and you see an empty grey box where the ad used to be. The ad
slots themselves are declared by **server-driven page config**
(`MatchPageAdConfig(appAdUnitPath:)`, `CiAppAdGptUnits_incontentApp*`), so they can't
be removed from the APK — and the app has no ad-free/subscription flag to flip. Two
measures address it instead:

1. **Report "no fill"** — inline slots (`FlutterAdManagerBannerAd`, `FlutterBannerAd`,
   `FlutterNativeAd`) call `AdInstanceManager.onAdFailedToLoad(...)` instead of
   loading. That's the same signal an unsold GAM slot delivers in production, which
   the app already handles by collapsing the slot. Implemented in the extension
   (`extensions/.../ads/AdFailure.java`) purely reflectively — no stubs needed, fully
   `try`/`catch`-guarded, and it needs only `p0`, so it fits methods with very few
   registers (the plain injection would have needed 5 consecutive ones).
**Verified result:** the slots do collapse, after being visible for roughly a second.
That residual flash is structural and not fixable from bytecode: the page payload the
app fetches already contains the ad config, so Dart renders the container at its
reserved height *before* any native ad call exists to intercept — the no-fill is
delivered as early as the plugin is reachable. The page data is fetched and parsed
entirely in Dart (`cricinfo_specs_flutter` + `package:http`), never crossing into
Java/Kotlin, so the slot declaration can't be stripped en route either. Removing the
flash entirely would mean patching AOT Dart in `libapp.so`.

2. **Invalidate adaptive sizing** — every
   `FlutterAdSize$AdSizeFactory.get*AdaptiveBannerAdSize(...)` returns `AdSize.INVALID`.
   The plugin then answers `null` to Dart's size query, and the google_mobile_ads
   pattern is to skip building the ad entirely. Note `INVALID` is
   `new AdSize(0, 0, "invalid")`; the 2-arg constructor builds `"0x0_as"` and would
   *not* compare equal, so the 3-arg form is used, with the (obfuscated) AdSize type
   read from each method's own return type.

### Forced-update lockout (important)
ESPN gates old builds out of the app entirely via **server-side** remote config, so a
patched (or simply outdated) install eventually boots straight into a blocking
"you must update" page. Two independent keys drive it — both are stripped by the
patch below:

| Key | In bundled defaults? | Effect of stripping |
|---|---|---|
| `app_build_min_version_code` | yes (`8700`) | falls back to 8700, below every shipped build → gate never fires |
| `app_update_config` | **no** (JSON blob → `ISAAppUpdateConfig` w/ `FORCE_UPDATE`) | falls back to the empty value a fresh install already sees pre-fetch |

This is not caused by patching — a stock outdated install is blocked the same way.

### Remove splash ad & startup delay
The long (~6–8 s) wait on the splash screen is a full-screen **splash ad** the app
shows on every cold start. It's pure Dart UI (`getAppSplashAdInfo` → `CiAppSplashAdInfo`)
gated on Firebase Remote Config — the bundled RC *defaults* already disable it
(`app_ad_splash_screen_list = null`), so it only appears after the app fetches config
from ESPN's server at boot.

Dart reads all RC values through one native path
(`FirebaseRemoteConfigPlugin.parseParameters(Map)`); the patch strips the ad keys
(`app_ad_splash_screen_list`, `app_ad_splash_screen`, `app_ad_gpt_interstitial_enabled`, plus the two force-update keys above)
out of that map, so Dart falls back to the ad-free defaults. No splash ad, no GPT
interstitial; all other remote config is untouched. (Matched by its unique `(Map)→Map`
signature since the method may be R8-renamed.)

> The heavy analytics/ad SDK initializers (Adobe + 7 extensions, Conviva, comScore,
> AppsFlyer, Meta, Google Ads + Teads, Taboola) also ran synchronously at app start;
> the patches above already skip them, which removes more cold-start work.

### Block tracking & telemetry
No-op `create()` (return `Boolean.TRUE`) on these `com.cricinfo.app.android.initializers`:
`CiAppInitializerAppsFlyer`, `CiAppInitializerComscore`, `CiAppInitializerConviva`,
`CiAppInitializerAdobeMarketing`.

**CleverTap is deliberately left intact** — its initializer also registers the
cricket notification channels (Live Scores, Wicket, Toss, Breaking News, …) and
backs push delivery, so disabling it would break the app's core push feature. If
you want it gone anyway, add `CiAppInitializerCleverTap` to `BlockTrackingPatch.kt`.

### Not included: "Remove nags"
The in-app rating/feedback prompt is triggered **and rendered in Dart** (its KMP
`CiAppRatingViewModelResult$ShowDialog` has zero bytecode consumers), so smali
patching can't suppress it. Would require editing `libapp.so` (out of scope).

## Caveats
- **Verified versions**: 26.07.24 (versionCode 9240) and 26.05.11 (9148). All hook
  targets were confirmed byte-for-byte identical across both.
- **arm64-only**: the source XAPK only carried the `arm64_v8a` split, so the output
  APK runs on 64-bit ARM devices (essentially all modern phones). Re-run against an
  XAPK containing other ABIs if you need them.
- Empty ad slots: see [Collapsing the empty slots](#collapsing-the-empty-ad-slots).
  Interstitials / app-open simply never show.

## Build the bundle (`.mpp`)

Requires **JDK 21–24** (AGP's jlink transform fails on JDK 25+), the Android SDK,
and a GitHub `read:packages` token in `~/.gradle/gradle.properties`
(`gpr.user` / `gpr.key`).

```bash
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/24.0.2   # a real 21–24 JDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
./gradlew buildAndroid
# -> patches/build/libs/patches-1.0.0.mpp
```

> Note: Homebrew's `openjdk@24` symlink may now point at JDK 26 (installed as the
> generic `openjdk`). Use the explicit `Cellar/openjdk/24.x` path. `repatch.sh`
> auto-detects a usable JDK.

## Use it

### A) Desktop, via morphe-cli
Download the app's XAPK yourself (e.g. from APKPure), then:
```bash
./repatch.sh ~/Downloads/Cricinfo+-+Live+Cricket+Scores_26.07.24_APKPure.xapk
adb install -r out/cricinfo-noads.apk
```
`repatch.sh` expects [morphe-cli](https://github.com/MorpheApp/morphe-cli) built at
`~/morphe/morphe-cli/build/libs/morphe-cli-*-all.jar`. It merges the splits and signs
the result automatically. Uninstall the Play Store build first — the signature differs.

### B) On the phone, via Morphe Manager
1. Copy `patches/build/libs/patches-1.0.0.mpp` to the phone.
2. Morphe Manager → add a patch source → **import the local `.mpp`**.
3. Select ESPNcricinfo and patch on-device (Manager merges splits & signs).

## Updating for a new app version
Hooks are name-based, so minor app updates usually need only a rebuild + re-patch
(pass `-f` / it's already in `repatch.sh`). If the patch log reports nothing
applied for a surface, the SDK/plugin class was renamed — re-check the class names
in `RemoveAdsPatch.kt` / `BlockTrackingPatch.kt` against a fresh decompile, and bump
the version in `shared/Constants.kt`.

## Disclaimer

This project is not affiliated with, endorsed by, or associated with ESPNcricinfo,
ESPN, JioStar, or the Morphe project. "ESPNcricinfo" and all related marks belong to
their respective owners; they are referenced here only to describe what these patches
apply to.

No copyrighted application binaries are distributed by this repository. It publishes
patch source code only — you must supply your own legally obtained copy of the app.
Patching an app may violate its terms of service; this is provided for personal,
educational use, and you use it at your own risk. Patched builds are signed with a
different key than the official release, so they will not receive Play Store updates.

Licensed under GPL-3.0 (see `LICENSE`). Derived from the Morphe patches template; see
`NOTICE` for the Morphe project's name/branding terms.
