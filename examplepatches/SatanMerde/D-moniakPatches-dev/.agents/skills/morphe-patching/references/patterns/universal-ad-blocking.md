# Universal Ad Blocking — Per-SDK Patterns

From adobo repo — the most comprehensive ad blocking framework. Covers every major ad SDK with specific bypass techniques.

## Architecture: Modular Ad Blocker

Each ad SDK has its own patch module with a boolean option. The master patch iterates all modules:

```kotlin
val disableMobileAdsPatch = bytecodePatch(name = "Disable mobile ads", default = false) {
    val adMobOption = disableGoogleAdMobOption()
    val unityOption = disableUnityOption()
    val appLovinOption = disableAppLovinMaxOption()
    // ... 11 ad SDKs total

    execute {
        mapOf(
            adMobOption to ::applyGoogleAdMobPatch,
            unityOption to ::applyUnityPatch,
            appLovinOption to ::applyAppLovinMaxPatch,
        ).forEach { (option, patch) ->
            val isEnabled by option
            if (!isEnabled!!) return@forEach
            val results = patch()
            // Log success/partial/skip
        }
    }
}
```

## Google AdMob

**Target:** Load methods for all ad formats (Banner, Interstitial, Native, Rewarded, App Open).

**Detection:** Find methods with these precondition strings:
- `"Context cannot be null."`
- `"AdUnitId cannot be null."`
- `"#008 Must be called on the main UI thread."`

```kotlin
classDefForEach { classDef ->
    classDef.filterMethods { _, method ->
        method.returnType == "V" &&
        method.parameters.first().type == "Landroid/content/Context;" &&
        // Check if method contains all 3 precondition strings
        containsAllStrings(preconditions)
    }.forEach { method ->
        mutableClassDefBy(method.definingClass)
            .findMutableMethodOf(method).returnEarly()
    }
}

// Also disable legacy mediation adapter
mutableClassDefBy("Lcom/google/ads/mediation/AbstractAdViewAdapter;")
    .filterMethods { _, m -> m.name in setOf("requestBannerAd", "requestInterstitialAd", "showInterstitial") }
    .forEach { it.returnEarly() }
```

## Unity Ads

**Target:** `initialize`, `isInitialized`, `isSupported`, `load`, `show`, `loadWebPlayer`

```kotlin
val adMethods = setOf("initialize", "isInitialized", "isSupported", "load", "show", "loadWebPlayer")

setOf(unityAdsClass, "Lcom/unity3d/services/banners/BannerView;").forEach { definingClass ->
    mutableClassDefBy(definingClass)
        .filterMethods { _, method -> method.name in adMethods }
        .forEach { it.returnEarly() }
}
```

## AppLovin MAX

**Target:** `loadAd`, `showAd`, `startAutoRefresh` methods.

## Meta Audience Network (Facebook Ads)

**Target:** `loadAd`, `show`, `loadAdFromBid` methods on `AdView`, `InterstitialAd`, `NativeAd`, `RewardedVideoAd`.

## Mintegral

**Target:** `load`, `show`, `preload` methods.

## Pangle (TikTok/ByteDance ads)

**Target:** `loadAd`, `showAd` methods.

## Vungle (Liftoff)

**Target:** `load`, `play`, `canPlayAd` methods.

## Yandex Ads

**Target:** `loadAd`, `show` methods on `BannerAdView`, `InterstitialAd`, `RewardedAd`.

## TopOn (mediation platform)

**Target:** `loadAd`, `show`, `isAdReady` methods.

## Bigo Ads

**Target:** `loadAd`, `show` methods.

## MyTarget (VK/Mail.ru ads)

**Target:** `load`, `show` methods.

## Hosts-Based Blocking

Block ad domains at the network level by modifying the hosts file or intercepting DNS:

```kotlin
class HostsBlocker private constructor(private val blocklist: HashSet<String>) {
    fun isBlocked(host: String, wildcard: Boolean = true): Boolean {
        // Exact match
        if (blocklist.contains(host)) return true
        // Subdomain matching: ads.example.com blocked if example.com is in list
        if (wildcard) {
            var h = host
            while (h.contains('.')) {
                h = h.substringAfter('.')
                if (blocklist.contains(h)) return true
            }
        }
        return false
    }

    companion object {
        fun fromFile(file: File): HostsBlocker  // Parse hosts file
        fun fromString(input: String): HostsBlocker  // Parse inline blocklist
    }
}
```

## Key Takeaway: Universal Ad Blocking Strategy

```
1. Identify which ad SDKs the app uses:
   rg "AdMob|Unity|AppLovin|Mintegral|Pangle|Vungle|Yandex|TopOn|Bigo|MyTarget|AudienceNetwork" decompiled/ -g "*.java" -l

2. For each SDK found:
   - Find the main class (usually well-known, non-obfuscated)
   - Find load/show/initialize methods
   - returnEarly() on each

3. For mediation platforms (AdMob mediation, TopOn, MAX):
   - Also disable the mediation adapter classes
```
