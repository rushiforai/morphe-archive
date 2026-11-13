# Billing & Subscription Bypass Patterns

How different community devs bypass various billing/subscription systems.

## RevenueCat

**Used by:** Our patches (Teleprompter, DocScanner, Fing, etc.)

Pattern: Find the entitlement check method and return true.

```kotlin
// Fingerprint targets: CustomerInfo → getEntitlements() → getActive()
object EntitlementCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/revenuecat/purchases/CustomerInfo;", name = "getEntitlements"),
        methodCall(definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;", name = "getActive")
    )
)

// Patch: return true at start
EntitlementCheckFingerprint.method.returnEarly(true)
```

## Google Play Billing (BillingClient)

**Used by:** Various community patches

Pattern: Override purchase validation or skip billing flow.

```kotlin
// Find: BillingClient.queryPurchases or Purchase.isAcknowledged
// Override: return success/acknowledged

// Simple approach — skip purchase check
PurchaseCheckFingerprint.method.returnEarly(true)

// Or override BillingResult to always return OK
BillingResultFingerprint.method.addInstructions(0, """
    const/4 v0, 0x0  // BillingResponseCode.OK = 0
    return v0
""")
```

## Pairip (Play Integrity API)

**Used by:** hoo-dles (universal patch)

Pattern: Client-side license check bypass (does NOT bypass server-side attestation).

```kotlin
// 1. Set responseCode to success
ProcessLicenseResponseFingerprint.method.addInstruction(0, "const/4 p1, 0x0")

// 2. Disable repeated check flag
RepeatedCheckFingerprint.matchOrNull(originalMethod)?.apply {
    val reg = instructionMatches.first().getInstruction<OneRegisterInstruction>().registerA
    method.replaceInstruction(index + 1, "const/4 v$reg, 0x0")
}

// 3. Short-circuit validation
ValidateLicenseResponseFingerprint.method.returnEarly()
```

**Note:** This only bypasses the client-side check. If the app validates with Google's servers, this won't work.

## SharedPreferences-Based Premium

**Used by:** Many simple apps

Pattern: Find where isPremium/isPro is read from SharedPreferences and override.

```kotlin
// Search for: getBoolean("is_premium", false) or similar
rg 'isPro|isPremium|isSubscribed|hasPremium' decompiled/ -g '*.java' -l

// Patch: override the getter
IsPremiumFingerprint.method.returnEarly(true)
```

## Firebase Remote Config Feature Flags

**Used by:** Apps that gate features behind remote config

Pattern: Override getBoolean/getString for specific keys.

```kotlin
// Find: RemoteConfig.getBoolean("premium_enabled")
// Override: return true for that key

RemoteConfigGetBooleanFingerprint.method.addInstructions(0, """
    const/4 v0, 0x1
    return v0
""")
```

## License Checker (Android Market)

**Used by:** Older apps using Google's LVL (License Verification Library)

Pattern: Override the license check callback.

```kotlin
// Find: LicenseChecker.checkAccess() or Policy.processServerResponse()
LicenseCheckFingerprint.method.returnEarly()  // skip check entirely

// Or override policy to always return LICENSED
PolicyFingerprint.method.addInstructions(0, """
    const/4 v0, 0x0  // Policy.LICENSED = 0
    return v0
""")
```

## Subscription Status Object Construction (hoo-dles / AdGuard)

**Used by:** Apps that check a complex subscription object

Pattern: Construct a fake "paid license" object and return it.

```kotlin
// Create a method that builds a fake PaidLicense object
val newMethod = ImmutableMethod(...).toMutable().apply {
    addInstructions(0, """
        new-instance v0, $PaidLicenseClass
        const-string v1, ""
        sget-object v2, $licenseType->Personal:$licenseType
        sget-object v3, $lifetimeDuration
        const/4 v4, 0x1
        const/4 v5, 0x3
        const-string v6, ""
        invoke-direct/range {v0 .. v6}, $PaidLicenseConstructor
        return-object v0
    """)
}
classDef.methods.add(newMethod)

// Redirect the getter to return our fake license
GetLicenseMethod.addInstructions(0, """
    invoke-static {}, $newMethod
    move-result-object v0
    return-object v0
""")
```

## Enum-Based Subscription Tiers

**Used by:** Our MacroDroid patch, various others

Pattern: Return the premium enum value.

```kotlin
// Find the enum field for PRO/PREMIUM tier
// Return it directly
PremiumStatusFingerprint.method.addInstructions(0, """
    sget-object v0, Lcom/app/SubscriptionTier;->PRO:Lcom/app/SubscriptionTier;
    return-object v0
""")
```

## Decision Guide

```
What billing system does the app use?
├── RevenueCat → Find entitlement check, returnEarly(true)
├── Google Play Billing → Override BillingResult or purchase check
├── Pairip (Play Integrity) → Client-side bypass (3-step)
├── SharedPreferences → Override isPremium getter
├── Firebase Remote Config → Override getBoolean
├── LicenseChecker (LVL) → Skip check or override policy
├── Complex subscription object → Construct fake object (method injection)
└── Enum tier → Return premium enum value
```
