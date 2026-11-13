---
name: morphe-patching
description: >-
  Expert guide, reference library, and battle-tested patterns for Morphe APK reverse engineering,
  method fingerprinting, Smali bytecode manipulation, billing/subscription bypasses, ad removal,
  and anti-tamper/integrity workarounds.
---

# Morphe Patching Master Skill & Knowledge Base

This skill equips the agent with comprehensive, battle-tested knowledge for building robust, update-resilient Morphe patches for Android applications.

---

## 🧭 Directory Map & Reference Library

All detailed guides and patterns are stored locally and can be viewed on-demand:

### 1. Bytecode & Fingerprinting (`references/bytecode/`)
- [fingerprinting.md](references/bytecode/fingerprinting.md): Official Morphe fingerprinting rules, syntax, and matching semantics.
- [smali-cheat-sheet.md](references/bytecode/smali-cheat-sheet.md): Comprehensive Dalvik opcode, register, and type descriptor reference.
- [fingerprint-debugging.md](references/bytecode/fingerprint-debugging.md): Diagnosing unmatched fingerprints and ambiguous matches.
- [obfuscation-guide.md](references/bytecode/obfuscation-guide.md): Reverse engineering ProGuard, R8, and DexGuard obfuscated apps.

### 2. Bypass & Target Patterns (`references/patterns/`)
- [billing-bypass-patterns.md](references/patterns/billing-bypass-patterns.md): RevenueCat, Adapty, Qonversion, and Google Play Billing bypasses.
- [protection-bypass-patterns.md](references/patterns/protection-bypass-patterns.md): Root detection (RootBeer), SSL Pinning, Play Integrity, PairIP, Emulator detection.
- [universal-ad-blocking.md](references/patterns/universal-ad-blocking.md): Google Mobile Ads (AdMob), Unity Ads, AppLovin, IronSource.
- [firebase-analytics-bypass.md](references/patterns/firebase-analytics-bypass.md): Telemetry suppression and analytics blocking.
- [universal-patches.md](references/patterns/universal-patches.md): Cross-app patches (Play Store install check bypass, screenshot enable).

### 3. Patch Development & APIs (`references/patching/`)
- [morphe-patch-development-guide.md](references/patching/morphe-patch-development-guide.md): Complete lifecycle of a Morphe patch.
- [patcher-apis.md](references/patching/patcher-apis.md): Deep dive into Morphe Patcher core APIs and AST manipulation.
- [advanced-patching-techniques.md](references/patching/advanced-patching-techniques.md): Custom DEX injection, native hooks, resource redirection.
- [extension-development.md](references/patching/extension-development.md): Developing Morphe extensions (`.mpe`) in Java/Kotlin.

### 4. Community Battle-Tested Catalogs (`references/community/`)
- [community-patches-analysis.md](references/community/community-patches-analysis.md): Best practices extracted across top repositories.
- [hoodles-patch-catalog.md](references/community/hoodles-patch-catalog.md): Catalog of 50+ official and community patches.
- [revanced-extended-patterns.md](references/community/revanced-extended-patterns.md): Advanced YouTube & media patch patterns.
- [de-revanced-patterns.md](references/community/de-revanced-patterns.md): Techniques from RookieEnough/De-ReVanced.

### 5. Guides & Runbooks (`guides/`)
- [jadx](guides/jadx/SKILL.md) & [apk-analysis](guides/apk-analysis/SKILL.md): JADX decompilation & APK recon workflow.
- [patch-anatomy](guides/patch-anatomy/SKILL.md): Dissecting patch structure and manifests.
- [patch-examples](guides/patch-examples/SKILL.md): Real-world patch implementations.

---

## ⚡ Core Axioms of Morphe Patching

### 1. Fingerprint Resilience Over Fragility
* **Never match by obfuscated name** (`a()`, `b.c()`): Class and method names change on every single app release.
* **Match on structural invariants**:
  * Return type and parameter types (`returnType = "Z"`, `parameters = listOf(...)`).
  * Access flags (`AccessFlags.PUBLIC`, `AccessFlags.STATIC`).
  * Unique string literals referenced in the method (`"is_premium"`, `"active_subscription"`).
  * Unique method calls or field accesses.
* **Always declare fingerprints as `object`**:
  ```kotlin
  object PremiumCheckFingerprint : Fingerprint(
      returnType = "Z",
      accessFlags = listOf(AccessFlags.PUBLIC),
      filters = listOf(
          string("pro_entitlement")
      )
  )
  ```

### 2. Register Allocation Safety
* In Dalvik/Smali, method parameters occupy the highest numbered registers (`p0, p1, ...`).
* If you insert instructions or replace a method body, **never assume register `v0` is free** without checking `.registers` count.
* **Best practice for method replacement**:
  Compute dedicated registers headroom:
  ```kotlin
  val regCount = maxOf(4, method.parameters.size + 2)
  method.toMutable().replaceInstructions("""
      const/4 v0, 0x1
      return v0
  """, regCount)
  ```

### 3. Clean Paywall & Billing Spoofing Strategy
1. **Local Entitlements**: Spoof boolean gatekeepers (`isSubscribed()`, `hasPro()`, `isPremium()`) to return `1` (`true`).
2. **Google Play Billing Library**:
   * Hook `Purchase.getPurchaseState()` -> return `1` (`PURCHASED`).
   * Hook `Purchase.isAcknowledged()` -> return `true`.
   * Hook `BillingResult.getResponseCode()` -> return `0` (`OK`).
3. **RevenueCat**:
   * Entitlements map in `CustomerInfo`: hook `getActive()` or `all` to return a map containing the target entitlement active until year 2099.
4. **Play Store Installer Check**:
   * Intercept `PackageManager.getInstallerPackageName()` and return `"com.android.vending"`.
