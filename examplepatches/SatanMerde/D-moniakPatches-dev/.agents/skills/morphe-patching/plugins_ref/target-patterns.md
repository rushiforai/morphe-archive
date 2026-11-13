# Target Discovery Index

Use this as an index, not as proof. Search results become viable targets only after exact call-chain analysis and smali verification.

## Architecture routing

| Indicator | Likely architecture | Analysis implication |
|---|---|---|
| Java/Kotlin DEX and no cross-platform marker | Native Android | jadx plus baksmali is the primary path |
| `assets/index.android.bundle` | React Native | Inspect native modules and Hermes/JS assets; Java may expose only bridges |
| `libflutter.so` and `libapp.so` | Flutter | App logic is usually native AOT; inspect platform channels and strings before considering reviewed native hex patterns |
| `DexClassLoader` / `PathClassLoader` | Dynamic code | Identify loaded DEX/JAR and whether it is present locally |
| Packed/encrypted DEX | Packer/protector | Static targets may be unavailable; document the blocker rather than inventing one |

Do not promise a standard bytecode fingerprint for Flutter native logic or packed code.

## Billing and feature SDK indicators

Search case-insensitively for package names and calls, then trace application-owned consumers:

```text
RevenueCat: CustomerInfo, EntitlementInfos, getEntitlements, getActive, isActive
Google Play Billing: BillingClient, queryPurchases, Purchase, BillingResult, isAcknowledged
Adapty: AdaptyProfile, accessLevels, isActive
Qonversion: QEntitlement, checkEntitlements
Local state: isPremium, isPro, isSubscribed, hasPremium, SharedPreferences.getBoolean
Remote flags: FirebaseRemoteConfig, getBoolean, getString
Legacy licensing: LicenseChecker, Policy.processServerResponse
```

Prefer the deepest stable client-side decision consumed by the app. Record when a feature is server-validated; do not attempt to compromise remote payment, account, entitlement, or attestation systems.

## Ad and analytics indicators

```text
AdMob: MobileAds, AdView, InterstitialAd, RewardedAd, loadAd, show
Unity: UnityAds, BannerView
AppLovin MAX: MaxAd, MaxInterstitialAd, loadAd, showAd
Meta Audience Network: com.facebook.ads
Analytics: FirebaseAnalytics, Crashlytics, logEvent, recordException
```

Identify the exact SDK version and app call sites. A global SDK modification can have broad side effects; prefer an app-owned gate or scoped call site when possible.

## Protection indicators

```text
Signature: getPackageInfo, GET_SIGNATURES, SigningInfo, checkSignature
Root/emulator: RootBeer, isRooted, magisk, test-keys, isEmulator
TLS: CertificatePinner, X509TrustManager, checkServerTrusted
Integrity/license: IntegrityManager, Pairip, validateLicenseResponse
Debug: isDebuggerConnected, waitForDebugger
```

Only analyze a protection when it blocks the authorized requested modification. Client-side observations do not imply that server-side validation can or should be bypassed.

## Search progression

1. Identify architecture and SDK.
2. Find application-owned callers/consumers.
3. Trace to the smallest decision point.
4. Locate the exact smali class across all DEX directories.
5. Reject candidates that lack stable structural identity or sufficient behavioral evidence.
