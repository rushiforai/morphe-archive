# Yahoo Finance — Remove ads (Morphe patch)

A [Morphe](https://github.com/MorpheApp) patch bundle that removes ads from the
Yahoo Finance Android app (`com.yahoo.mobile.client.android.finance`) at the
source — the ads are never fetched, loaded or rendered (not just network-blocked).

## What it patches

The app's ad layer is **not obfuscated**, so each hook matches by exact class +
method name (robust across updates). Source lives in
`patches/src/main/kotlin/app/template/patches/example/`.

| # | Surface | Method | Change |
|---|---------|--------|--------|
| 1 | Feed / stream ads (Home, News, QSP lists) | `ads.AdFetcher.getNextAd(int)` | return a new `EmptyAdUnit` |
| 2 | Home "pencil" banner | `home.ad.PencilAdDelegate.canAdBeShown()` | return `false` |
| 3 | Markets top ad | `markets.ad.MarketsTopCenterAdDelegate.canAdBeShown()` | return `false` |
| 4 | Quote page top banner | `quote.model.TopCenterAdModule.buildRowViewModel(...)` | return `null` |
| 5 | Quote page native/pencil ads (Summary/Analysis/Financials) | `quote.model.BasePencilAdModule.buildRowViewModel(...)` | return `null` |

Hooks 4 & 5 reuse the app's own "no ad row" path (these methods already return
`null` when an ad is hidden), so there is no placeholder gap and nothing is fetched.

## Build the patches bundle (`.mpp`)

Requires JDK 21+, the Android SDK, and a GitHub `read:packages` token in
`~/.gradle/gradle.properties` (`gpr.user` / `gpr.key`).

```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk@24       # any JDK 21+
export ANDROID_HOME="$HOME/Library/Android/sdk"
./gradlew buildAndroid
# -> patches/build/libs/patches-1.0.0.mpp
```

## Use it

### A) On the phone, via Morphe Manager (recommended for updates)
1. Download the bundle to the phone:
   <https://github.com/isuruhg/fin-tweaks/releases/latest/download/patches.mpp>
2. Morphe Manager (v1.16.0+) → add a patch source → **import the local `.mpp`**
   from the file manager.
3. Select Yahoo Finance and patch on-device. Manager merges the split APKs and
   signs automatically, so future app updates are re-patched entirely on-device.

> Note: adding the **repo URL** as a source currently fails because the Morphe
> toolchain's GitHub-releases resolver can't parse the API response. Use the local
> `.mpp` import (or the direct release-asset URL) instead.

### B) On the desktop, via morphe-cli
```bash
./repatch.sh com.yahoo.mobile.client.android.finance_<version>.apkm
adb install -r out/yahoo-finance-noads.apk
```

## Updating for a new app version

Fingerprints are name-based, so minor Yahoo updates usually need no changes — just
rebuild and re-patch. If a hook stops matching, the patch log names the failed
fingerprint; update that class/method name in `Fingerprints.kt`.
