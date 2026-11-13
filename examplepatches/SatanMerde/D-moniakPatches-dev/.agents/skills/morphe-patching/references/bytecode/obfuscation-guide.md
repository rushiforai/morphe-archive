# Obfuscation Guide — What Survives and What Doesn't

Understanding how R8/ProGuard obfuscation works helps write fingerprints that survive app updates.

## What Gets Obfuscated (NEVER use in fingerprints)

| Element | Before | After | Example |
|---------|--------|-------|---------|
| Class names | `com.app.PremiumManager` | `a.b.c` | Changes every update |
| Method names | `isPremium()` | `a()` | Changes every update |
| Field names | `isSubscribed` | `a` | Changes every update |
| Local variable names | `customerInfo` | removed | Not in bytecode |

## What Survives Obfuscation (SAFE for fingerprints)

| Element | Why it survives | Fingerprint field |
|---------|----------------|-------------------|
| **Return type** | Part of method signature | `returnType = "Z"` |
| **Parameter types** | Part of method signature | `parameters = listOf(...)` |
| **Access flags** | Structural, not renamed | `accessFlags = listOf(PUBLIC, STATIC)` |
| **SDK class names** | Not in app's ProGuard rules | `methodCall(definingClass = "Landroid/...")` |
| **SDK method names** | Not in app's ProGuard rules | `methodCall(name = "getEntitlements")` |
| **String constants** | Kept as-is in bytecode | `string("premium")` or `strings = listOf(...)` |
| **Literal values** | Numbers don't change | `literal(1337)` |
| **Opcodes** | Instruction types don't change | `opcode(Opcode.IF_EQZ)` |
| **Method call order** | Logic flow preserved | `filters` order |

## SDK Classes That Are NEVER Obfuscated

These are safe to use in fingerprints because they come from Android SDK or third-party libraries:

```
# Android SDK
Landroid/content/Context;
Landroid/content/SharedPreferences;
Landroid/app/Activity;
Landroid/view/View;
Landroid/os/Bundle;
Ljava/lang/String;
Ljava/util/Map;
Ljava/util/List;

# RevenueCat
Lcom/revenuecat/purchases/CustomerInfo;
Lcom/revenuecat/purchases/EntitlementInfos;
Lcom/revenuecat/purchases/Purchases;

# Google Play Billing
Lcom/android/billingclient/api/BillingClient;
Lcom/android/billingclient/api/Purchase;
Lcom/android/billingclient/api/BillingResult;

# Firebase
Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;
Lcom/google/firebase/crashlytics/FirebaseCrashlytics;

# OkHttp
Lokhttp3/CertificatePinner;
Lokhttp3/OkHttpClient;

# AdMob
Lcom/google/android/gms/ads/AdView;
Lcom/google/android/gms/ads/InterstitialAd;
```

## Obfuscation Levels

### R8 (most common — default Android build tool)
- Renames classes/methods/fields to short names
- Removes unused code (tree shaking)
- Inlines small methods
- Merges classes
- **Fingerprint strategy:** Use SDK method calls + return type + parameters

### ProGuard (older, similar to R8)
- Same renaming as R8
- Less aggressive optimization
- **Fingerprint strategy:** Same as R8

### DexGuard (commercial, aggressive)
- String encryption (strings may not be visible!)
- Control flow obfuscation
- Class encryption
- **Fingerprint strategy:** May need opcode patterns instead of strings

### Packer (e.g., Qihoo 360, Bangcle)
- Entire DEX is encrypted at rest
- Decrypted at runtime
- **Cannot patch directly** — need to dump decrypted DEX first

## How to Check Obfuscation Level

```bash
uvx apkid app.apk
# Look for: compiler, obfuscator, packer fields
```

| APKiD output | Meaning | Difficulty |
|-------------|---------|-----------|
| `compiler: r8` | Standard R8 | Normal |
| `compiler: d8` | No optimization | Easy |
| `obfuscator: proguard` | ProGuard | Normal |
| `obfuscator: dexguard` | DexGuard | Hard |
| `packer: *` | Packed/encrypted | Very hard |

## Fingerprint Strategy by Obfuscation Level

### R8/ProGuard (normal)
```kotlin
object MyFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/revenuecat/...", name = "getEntitlements"),
        methodCall(definingClass = "Lcom/revenuecat/...", name = "getActive")
    )
)
```

### DexGuard (strings encrypted)
```kotlin
// Can't use string() filters — strings are encrypted
// Use opcode patterns and method call signatures instead
object MyFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    filters = listOf(
        methodCall(name = "getEntitlements"),  // SDK name survives
        opcode(Opcode.MOVE_RESULT_OBJECT),
        methodCall(name = "getActive"),
        opcode(Opcode.INVOKE_INTERFACE),
    )
)
```

### Heavily obfuscated (last resort)
```kotlin
// Use classFingerprint to find class via toString() or unique strings
object ClassFinder : Fingerprint(
    name = "toString",
    strings = listOf("SubscriptionState(")  // toString patterns often survive
)

object TargetMethod : Fingerprint(
    classFingerprint = ClassFinder,
    returnType = "Z",
    parameters = listOf()
)
```

## Tips

1. **Always check smali** — jadx may show deobfuscated names that don't exist in bytecode
2. **Use `"L"` for obfuscated parameters** — matches any object type
3. **SDK method calls are your best friends** — they never get renamed
4. **String constants are reliable** unless DexGuard is used
5. **Opcode patterns are fragile** — use only as last resort
6. **toString() methods often contain readable strings** even in obfuscated code
7. **Kotlin data classes** generate predictable toString() patterns
