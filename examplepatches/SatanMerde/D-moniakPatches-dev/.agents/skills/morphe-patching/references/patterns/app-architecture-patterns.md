# App Architecture Patterns — What to Look For

How different app types structure their premium/billing code and where to find patch targets.

## Native Java/Kotlin Apps (most common)

**Examples:** Truecaller, Fing, MacroDroid, TickTick

**Structure:**
- Billing logic in Java/Kotlin classes
- DEX files contain all app code
- Decompile with jadx → search with rg

**Where to find targets:**
```bash
# Subscription managers
rg "SubscriptionManager|BillingManager|PurchaseManager|LicenseManager" decompiled/ -g "*.java" -l

# Premium check methods
rg "isPremium|isSubscribed|hasPurchased|checkEntitlement" decompiled/ -g "*.java" -l

# Feature gates
rg "isFeatureEnabled|canAccess|isUnlocked|isPro" decompiled/ -g "*.java" -l
```

## React Native Apps

**Examples:** Some Instagram features, many startup apps

**Detection:**
```bash
unzip -l app.apk | rg "index.android.bundle"
# If found → React Native
```

**Structure:**
- JavaScript logic compiled to Hermes bytecode in `assets/index.android.bundle`
- Native modules in Java/Kotlin DEX
- Bridge between JS and native

**Patching approach:**
- For JS logic: Use `hermesPatch` for hex-level byte replacement
- For native modules: Standard bytecode patching
- Strings in Hermes bundle can be found with `strings app.apk | rg "premium"`

## Flutter Apps

**Detection:**
```bash
unzip -l app.apk | rg "libflutter|libapp"
# libflutter.so = Flutter engine
# libapp.so = compiled Dart code
```

**Structure:**
- All Dart logic compiled to native ARM code in `libapp.so`
- Cannot decompile to readable source
- No DEX bytecode for app logic

**Patching approach:**
- Use `hexPatch` for binary patching of `libapp.so`
- Very difficult — need to find patterns in ARM assembly
- String constants may be findable: `strings lib/arm64-v8a/libapp.so | rg "premium"`
- Consider patching the platform channel (Java/Kotlin bridge) instead

## Kotlin Multiplatform Apps

**Structure:**
- Shared Kotlin code compiled to DEX (same as native)
- Platform-specific code in separate modules
- Standard jadx decompilation works

**Patching:** Same as native Java/Kotlin.

## Apps with Extensions/Plugins

**Examples:** Some apps load features as separate DEX/JAR files

**Detection:**
```bash
rg "DexClassLoader|PathClassLoader|loadClass" decompiled/ -g "*.java" -l
```

**Patching:** May need to patch the loader or the loaded code.

## Common Billing SDK Architectures

### RevenueCat
```
App → Purchases.shared → CustomerInfo → EntitlementInfos → getActive() → Map
```
**Target:** The method that checks `getActive().isEmpty()`

### Google Play Billing
```
App → BillingClient → queryPurchases() → PurchaseResult → Purchase list
```
**Target:** The callback that processes purchase results

### Adapty
```
App → Adapty.getProfile() → AdaptyProfile → getAccessLevels() → isActive
```
**Target:** The access level check method

### Local SharedPreferences
```
App → SharedPreferences.getBoolean("is_premium", false)
```
**Target:** The getter method or the preference key

## Ad SDK Architectures

### AdMob (Google)
```
App → AdView/InterstitialAd → loadAd() → AdRequest → show()
```
**Target:** loadAd() or show() methods, or the AdView initialization

### Facebook Audience Network
```
App → AdView → loadAd() → NativeAd
```

### Unity Ads
```
App → UnityAds.show() → IUnityAdsShowListener
```

### Generic pattern
```bash
rg "loadAd|showAd|AdView|InterstitialAd|RewardedAd|BannerAd|NativeAd" decompiled/ -g "*.java" -l
```

## Telemetry/Analytics Architectures

### Firebase Analytics
```bash
rg "FirebaseAnalytics|logEvent|setUserProperty" decompiled/ -g "*.java" -l
```

### Crashlytics
```bash
rg "FirebaseCrashlytics|recordException|log" decompiled/ -g "*.java" -l
```

### Custom analytics
```bash
rg "analytics|telemetry|tracking|metrics|reportEvent" decompiled/ -g "*.java" -l
```

**Bypass:** returnEarly() on init methods, or block specific event tags.

## Decision: Where to Patch

```
What type of app?
├── Native Java/Kotlin → Standard jadx + baksmali + fingerprint
├── React Native → hermesPatch for JS, standard for native modules
├── Flutter → hexPatch on libapp.so (difficult)
└── Kotlin Multiplatform → Same as native

What to patch?
├── Premium/subscription → Find billing SDK check method
├── Ads → Find ad load/show methods
├── Protections → Find security check methods
├── Telemetry → Find analytics init/send methods
└── Feature flags → Find remote config or local flag checks
```
