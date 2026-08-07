# Morph - Tantan Android Patch Project

## Overview
This repository contains patches and tools for the Tantan Android APK (international version, v7.3.3). The project includes 10 patchsets covering premium feature unlocking, privacy protection, analytics disabling, messaging enhancements, dialog cleanup, ad removal, root/emulator detection bypass, live streaming features, UI cleanup, and Google Maps compatibility.

**Target:** International version only. China-specific features (WeChat Pay, Alipay, QQ login, Huawei services) are dead code in the international APK and should NOT be patched.

## Workspace Configuration
```json
{
  "name": "Morph",
  "path": "/Users/jonathon/RiderProjects/Morph"
}
```

## Files
- `patches/` - Individual bypass patch implementations
- `patches-list.json` - Auto-generated patch metadata
- `patches-bundle.json` - Bundle configuration
- `tantan-tribe-decompiled/` - Decompiled Tantan APK source for reverse engineering
- `tantan-decompiled-7.3.3/` - Decompiled Tantan 7.3.3 APK source (50,635 Java files)

## Build and Release Commands

### Build Patches
```bash
# Build the patch bundle with DEX bytecode and metadata (RECOMMENDED)
./gradlew :patches:repackMppWithPatchList

# This command chains:
# 1. buildAndroid - compiles Kotlin to DEX bytecode
# 2. generatePatchesList - generates patches-list.json metadata
# 3. repacks both into the .mpp file
```

**Important:** Always use `:patches:repackMppWithPatchList` to build the .mpp file. This ensures the .mpp contains both `classes.dex` (patch bytecode) and `patches-list.json` (patch metadata). Using individual tasks like `:patches:buildAndroid` or `:patches:build` alone will produce an incomplete .mpp file that Morph Manager cannot read correctly (shows "0 patches found").

**Verification:** After building, verify the .mpp contains both files:
```bash
unzip -l patches/build/libs/patches-0.0.1-dev2.mpp | grep -E "classes.dex|patches-list.json"
```
Expected output:
```
   209000  01-01-1970 01:00   classes.dex
     8633  08-05-2026 19:30   patches-list.json
```

### Local Patch Test (End-to-End Pipeline)

To produce an actual patched APK from the local source APK (useful for verifying patches before publishing):

```bash
./gradlew :patches:patchApk
```

Output: `tantan-premium-unlocked.apk` in repo root (~55 MB, signed, installable).

The pipeline is:
1. `Patcher` runs all patches from `PatchRegistry.allPatches`
2. `PatcherResult.applyTo(rebuiltApk)` overlays patched dex/resources onto the APK in-place (via `ZFile.openReadWrite`)
3. `ApkUtils.signApk(...)` signs with the dev keystore

**Do NOT call `ApkMerger.merge()` after `applyTo()`** — see "Morphe Patcher Gotchas" below.

### Upload to GitHub Release
```bash
# List current release assets
curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/JonnyVR1/morph-patches/releases/362723625/assets" | \
  python3 -c "import json, sys; data = json.load(sys.stdin); [print(f'{a[\"id\"]} {a[\"name\"]}') for a in data]"

# Delete old assets (replace ASSET_ID with actual IDs from above)
curl -s -X DELETE -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/JonnyVR1/morph-patches/releases/assets/ASSET_ID"

# Upload new .mpp file
curl -s -X POST -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @patches/build/libs/patches-0.0.1-dev2.mpp \
  "https://uploads.github.com/repos/JonnyVR1/morph-patches/releases/362723625/assets?name=patches-0.0.1-dev2.mpp" | \
  python3 -c "import json, sys; d = json.load(sys.stdin); print(f'mpp: {d.get(\"name\", \"ERR\")}')"

# Upload patches-list.json
curl -s -X POST -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  --data-binary @patches-list.json \
  "https://uploads.github.com/repos/JonnyVR1/morph-patches/releases/362723625/assets?name=patches-list.json" | \
  python3 -c "import json, sys; d = json.load(sys.stdin); print(f'json: {d.get(\"name\", \"ERR\")}')"

# Upload patches-bundle.json
curl -s -X POST -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  --data-binary @patches-bundle.json \
  "https://uploads.github.com/repos/JonnyVR1/morph-patches/releases/362723625/assets?name=patches-bundle.json" | \
  python3 -c "import json, sys; d = json.load(sys.stdin); print(f'bundle: {d.get(\"name\", \"ERR\")}')"
```

### Verify Upload
```bash
# Check uploaded file sizes
curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/JonnyVR1/morph-patches/releases/362723625/assets" | \
  python3 -c "import json, sys; assets = json.load(sys.stdin); [print(f'{a[\"name\"]}: {a[\"size\"]} bytes') for a in assets]"
```

Expected file size for `patches-0.0.1-dev2.mpp`: ~880 KB (includes DEX bytecode for all 10 patches). If it's significantly smaller (~40 KB), the buildAndroid task was not run.

## Patch Architecture

The project uses 10 patches registered in `PatchRegistry.kt`. All patch files are in `patches/src/main/java/com/p1/mobile/putong/data/`:

### Premium Unlock (`PremiumUnlockPatch.kt`)
The largest and most complex patch. Handles:
- User tier status methods (isUltraPremium, isVIP, isSVIP, isPlatinum, isSupremePartner)
- Privilege gates and expiration checks (xma class)
- Subscription validation and regional gates (u59 class)
- Feature gates and display timestamps (CounterSuperlikeAndUndoLimit, CoreProduct, etc.)
- Auto-subscription dialog suppression (src0 class)
- Mystery/blur gating (sb90 Companion class)
- Daily like limit bypass (h0.b, l1.b, m1.b)
- Ad removal (NavigationBarAdmobHelper, NavigationBarAdView, NativeAdViewCard)
- Boost remaining count (n3b0.d, BoostRemainingCountView)
- Search filter expansion (Settings radius/age limits)
- Server refresh prevention (pib.W9 → Observable.just)
- VIP badge override (zva0, tm90)
- Spotlight/boost activation (gqf0, CoreBusinessServiceIml)
- Counter limits (likeLimit, superLikeLimit, undoLimit, boostLimits)
- Privacy features (hide_me_from_nearby, visitor_hide_footprint, nearby_people)
- Read receipts (intl_message_read, message_read_state)
- Ultra premium O-Diamond (isODiamond field, d79.W method)
- Purchase gate bypass (CoreProduct.S4)
- Swipe rate limit bypass (gra class)

**Note:** nullCheck() methods in these classes are NOT patched (see Gotcha #8).

### Privacy Controls (`PrivacyControlsPatch.kt`)
Unlocks privacy features:
- Hide from nearby (`hide_me_from_nearby` privilege)
- Visitor hide footprint (`visitor_hide_footprint` privilege)
- Mysterious mode (`mysterious_mode` privilege)
- Nearby people access (`nearby_people` privilege)

**Note:** nullCheck() methods in these classes are NOT patched (see Gotcha #8).

### Messaging Enhancement (`MessagingPatch.kt`)
Enhances messaging features:
- Message limits removal (ChatPartnerConfig limits)
- Pin chat unlimited (PlatinumPinChat expiration)
- Voice/video calls (LoveBuzzData remaining counts - consolidated single-pass scan)
- Quick chat features (quickchat privileges)
- Typing indicator control (conversation view model X2 method)
- Visitor message limits (ODiamondVisitorMessageGuideConfig)
- Conversation entry limits (PrologueConfig)
- Buzz call toggles (voiceBuzz, videoBuzz, textBuzz, memojiBuzz)
- Secret crush limits (CounterSecretCrushLimit)
- Boost limits (BoostLimit remaining/duration)
- Live chat limits (LiveChatLimit)

**Note:** nullCheck() methods in these classes are NOT patched (see Gotcha #8).

### Analytics Disable (`AnalyticsDisablePatch.kt`)
Disables all tracking and telemetry:
- FoxStatistics (custom analytics)
- AppsFlyer (attribution tracking)
- CleverTap (engagement analytics)
- Facebook AppEvents
- Beatles APM (crash reporting)
- OAID device fingerprinting
- Central device fingerprint collector (dk50 - IMEI, MAC, IP, LBS, UA)
- Device info collector (vrq0 - ANDROIDID, IMEI, MAC, IP)
- Device fingerprint hash generator (nuq0)

### Dialog Cleanup (`DialogCleanupPatch.kt`)
Removes annoying promotional dialogs:
- 5-star rating dialog (`p_intl_5star_dialog_view`)
- Appstore rating filter (`p_appstore_rating_filter_popup`)
- Version upgrade prompt (`p_alert_version_upgrade_popup`)
- Offline popup (`p_offline_popup`)
- Notification permission prompt (`p_prompt_notification_auth_popup_view`)
- Phone auth popups (`p_second_prompt_phone_auth_popup_view`, `p_sys_phone_auth_popup_view`, `p_prompt_phone_auth_popup_view`)
- VIP upgrade popup (`p_vip_upgrade_popup`)
- Purchase pages (`p_purchase_guide_page`, `p_purchase_expire_page`, `p_purchase_page`)
- Welcome back popup (`p_welcomeback_popup`)

### GMS Compatibility (`GmsCompatibilityPatch.kt`)
Consolidated patch that makes Google Maps and GMS-dependent features work in re-signed APKs. Includes:
- Signature spoofing via ContentProvider (hooks PackageManager to return original Tantan certificate)
- Maps auth header injection (replaces X-Android-Cert and X-Android-Package with original Tantan values)
- MicroG support (rewrites `com.google.android.gms` → `app.revanced.android.gms`, adds manifest metadata)
- GMS availability bypass (forces `isGooglePlayServicesAvailable` to return SUCCESS)

### Ad Removal (`AdRemovalPatch.kt`)
Removes all ad displays:
- Navigation bar bottom banner ads (NavigationBarAdView, NavigationBarAdmobHelper)
- Native feed ad cards disguised as user profiles (NativeAdViewCard)
- Live streaming banner ads (LiveVideoBannerAdCardView)
- Live square native ads (IntlLiveSquareFeedNativeAdView)
- Live square banner ads (IntlLiveSquareFeedBannerAdView)

### Privacy Enhancement (`PrivacyEnhancementPatch.kt`)
Advanced privacy protections:
- Root detection bypass (jmd0, mmd0 classes)
- Emulator detection bypass (ert0, DeviceUtil classes)
- ShuMeng SDK blocking (r8f0 - Chinese data collection SDK)
- Package enumeration prevention (o0e - installed app list collection)

### Shared Constants (`Constants.kt`)
Shared constants: `TANTAN_PACKAGE_NAME`, `TANTAN_USER_CLASS`, `tantanCompatibility`.

All tier overrides MUST use `isMe()` guards to ensure they only affect the current user, not other users' profiles.

### Region Detection & China vs International Features

The international APK has a critical region detection mechanism that determines which features are active:

**Master Switch:** `IntlCountryCodeController.m29114k()` (HMS check)
- Returns `TextUtils.equals("hms", "gms")` which is **ALWAYS FALSE** in the international APK
- This means ALL China-only code paths are dead code and never execute
- All features gated behind `!m29114k()` (i.e., "not China") are always enabled

**China-Only Features (DO NOT PATCH - Dead Code):**
- WeChat Pay, Alipay, Huabei, JD Pay payment flows
- WeChat Login, QQ Login flows
- Weibo sharing integration
- Huawei push/services (HWPushEngine, Huawei AppGallery)
- `nightclub_config` (international uses `intl_nightclub_config`)
- `LiveRegionTag.mainland` specific features
- Chinese locale-specific features (`zh`+`CN` checks)

**International-Only Features (SAFE TO PATCH):**
- All features with `intl_` prefix
- Google Play Billing (`IntlPayMethod.nativeMethod`)
- Facebook/Google social login
- Firebase push notifications
- All premium features (VIP, SVIP, Ultra Premium)
- All feature flags in `d79` class (gated by `!m29114k()`)
- All region-specific UI for non-China regions

**Risk Assessment:**
- Patching China-only code is harmless but pointless (never executed)
- The real risk is patching a method used by international users but misidentified as China-only
- Always verify the gating condition before patching
- Our existing patches all target international features and are safe

### Version-Agnostic Fingerprints

Patches MUST survive obfuscation churn between app versions. **Never match obfuscated names like `Lp001l/xma;` or `Lp1/...`**. Use `string()`, `methodCall()`, `fieldAccess()`, `opcode()` filters anchored against stable product strings and behavioral signatures:

| Class | Anchor |
|-------|--------|
| `User` | CamelCase stable (`com/p1/mobile/putong/data/User`) |
| `xma` | `string("/summarized-privileges?with=diamond")` |
| `sb90` Companion | `fieldAccess(localRelationship)` + `string("matched")` + `methodCall(isSupremePartnerOpenMystery)` |
| `u59` | `methodCall("Lcom/.../IntlCountryCodeController;", "k")` + `string("intl_instantmatch_open_user")` |
| `src0` | `string("recall_dlg_show")` + `string("reauto_duration")` + `string("reauto_product")` + `string("if_auto_order")` |
| `th5` | `string("vas_commercial_card_right_slide_strategy")` |
| `h6a` | `string("ttt_membership_price_diff")` |
| `qgl0` | `string("暂未激活黑金会员")` |
| `pib` | `string("users/{userId}")` (server refresh) |
| `n3b0` | `fieldAccess(likersLimit)` + `fieldAccess(boostLimits)` |
| `sja` | `string("picks")` + `string("seeWhoLikedMe")` |
| `h0/l1/m1` | Stable CamelCase (`com/p1/mobile/putong/core/newui/home/base/impl/swipe/`) |
| `NavigationBarAdmobHelper` | `string("intl_ad_show_bottom_banner")` + `string("ttt_tab_bar_bottom_banner")` |
| `NavigationBarAdView` | `string("ca-app-pub-6567608331519569/1242795139")` |
| `NativeAdViewCard` | `string("ca-app-pub-6567608331519569/7831936718")` |
| `Settings` | CamelCase stable (`com/p1/mobile/putong/data/Settings`) |
| `BoostRemainingCountView` | CamelCase stable (`com/p1/mobile/putong/core/newui/home/BoostRemainingCountView`) |
| `HiddenNearByView` | CamelCase stable + `string("hide_me_from_nearby")` |
| `MyVisitorsItemView` | CamelCase stable + `string("visitor_hide_footprint")` |
| `PrivilegeContentDlgItemView` | CamelCase stable + `string("mysterious_mode")` |
| `ChatPartnerConfig` | `fieldAccess(messageLimit)` + `fieldAccess(perday)` |
| `PlatinumPinChat` | `fieldAccess(expireTime)` |
| `LoveBuzzData` | Consolidated single-pass: `fieldAccess(LoveBuzzData.remainingVoiceBuzz/TextBuzz/VideoBuzz/MemojiBuzz)` via `classDefForEach` pre-filter |
| Typing indicator | `fieldAccess(KeepConnection.chatTypingOpen)` + `fieldAccess(KeepConnection.chatTypingInterval)` + `methodCall(interval)` |
| FoxStatistics (`zvf0`) | `string("e_request_none_oaid")` |
| AppsFlyer | `string("dmfeSDkpVxP8m6Ys6yJCpn")` (dev key) |
| CleverTap | `string("CleverTap SDK initialized with accountId")` |
| Facebook AppEvents | `string("facebook-core_release")` |
| Beatles APM | `string("com.tantanapp.beatles")` |
| OAID (`k200`) | `string("miit_oaid")` |
| Device fingerprint collector (`dk50`) | `string("[IMEI]")` + `string("[OAID]")` + `string("[MAC]")` |
| Device fingerprint hash (`nuq0`) | `string("device_fingerprint")` + device ID collection |
| Device info collector (`vrq0`) | `string("ANDROIDID")` + `string("IMEI")` + `string("MAC")` |
| Root detection (`jmd0`) | `string("/system/app/Superuser.apk")` + `string("/system/xbin/daemonsu")` |
| Root detection (`mmd0`) | `string("/system/bin/cufsdosck")` + `string("/system/bin/conbb")` |
| Emulator detection (`ert0`) | `string("ranchu")` + `string("generic")` + `string("emulator")` |
| Emulator detection (`DeviceUtil`) | `string("goldfish")` + `string("Genymotion")` + `string("vbox86p")` |
| ShuMeng SDK (`r8f0`) | `string("shumeng_init")` + `string("shuzilm")` |
| Package enumeration (`o0e`) | `string("getInstalledPackages")` + `string("firstInstallTime")` |
| Live streaming banner ad | CamelCase stable (`LiveVideoBannerAdCardView`) |
| Live square native ad | CamelCase stable (`IntlLiveSquareFeedNativeAdView`) |
| Live square banner ad | CamelCase stable (`IntlLiveSquareFeedBannerAdView`) |
| CounterSecretCrushLimit | `fieldAccess(remaining)` + `fieldAccess(total)` |
| BoostLimit | `fieldAccess(remaining)` + `fieldAccess(duration)` |
| LiveChatLimit | `fieldAccess(remaining)` + `fieldAccess(total)` |
| ODiamondVisitorMessageGuideConfig | `fieldAccess(total_limit_daily)` + `fieldAccess(user_limit_daily)` |
| PrologueConfig | `fieldAccess(enter_conv_limit)` + `fieldAccess(untalked_daily_show_count)` |

For groups of byte-identical overloaded methods (e.g. u59's U/S/O/F/Z/a0/D all return `!IntlCountryCodeController.k()`), fingerprint them as one cluster — they cannot be reliably separated.

Use **bounded** `matchAll(classDef, expectedRange)` to assert expected cardinalities (e.g. `1..2` not `0..N`).

## Morphe Patcher Gotchas

Critical non-obvious behaviors of Morphe v1.6.0 + plugin v1.3.3. **Read before touching patches or PatcherMain.**

### 1. Fingerprint caching: never resolve inside `classDefForEach`

`Fingerprint.matchOrNull(classDef)` caches its result per `classDef` **per Fingerprint instance** for the lifetime of the patcher. If you call it inside `classDefForEach { classDef -> ... matchOrNull(classDef) ... }`, it returns whatever the first classDef cached — usually the wrong class — and silently applies to every iteration, including non-matching classes. Prepending `addInstructions(0, ...)` to a loop function produces an **infinite hang at compile time** ("Stripping 275 modified classes" never finishes).

**Solution:** Restructure `execute { }` into 2 passes:
- **Pass 1** (`classDefForEach`): only iterate classes with stable identifiers (e.g. `User`, `CoreProduct` — known CamelCase names)
- **Pass 2** (top-level): resolve obfuscated class fingerprints once via `classFingerprint.matchOrNull()?.classDef?.let { ... }`

### 1b. `matchOrNull(method)` cache: same trap at method granularity

The `matchOrNull(method)` and `matchOrNull(method, classDef)` overloads share the same `_matchOrNull` cache as the class-level variants. The first call matches a method and caches it; every subsequent call returns the **cached Match** — even if you pass a different method. Consequence: in a loop like

```kotlin
classDef.methods.forEach { method ->
    if (someCondition(method)) {
        someFingerprint.matchOrNull(method)?.let { match ->
            match.method.addInstructions(0, REPLACEMENT)
        }
    }
}
```

only the FIRST method that satisfies `someCondition` is patched. Subsequent methods silently get the cached first match's `match.method`, so `addInstructions` writes the same replacement into the same first method (a no-op). Symptoms: one method patched, the rest of the set silently left original.

**Real-world case:** `CoreProduct` has 10 public no-arg boolean methods (`A4/B4/y4/T4/Q4/z4/R4/L4/O4/P4`) all sharing `accessFlags={PUBLIC}, returnType=Z, parameters=[]`. The original loop only patched `A4` (the first one in dex declaration order). `B4` and `y4` kept calling `u4("vip")`, which a sibling patch forces to `RETURN_TRUE` — so the "send message" / "see who liked me" purchase dialog gates opened and crashed with `NullPointerException` on `FreeTrialData.titleText` (`r0` was never populated).

**Solution:** once you've narrowed by class descriptor (e.g. inside `if (classDef.type == CoreProduct)`), skip the fingerprint entirely and patch methods directly:

```kotlin
mutableClassDefBy(classDef).methods
    .filter { someCondition(it) }
    .forEach { it.addInstructions(0, REPLACEMENT) }
```

`mutableClassDefBy` returns a `MutableClassDef` whose `.methods` is `List<MutableMethod>` — the only type with `addInstructions(String)`. Never call `matchOrNull(method)` per-method in a loop.

### 2. `ApkMerger` is for App Bundles, not standalone APKs

`ApkMerger.merge(input, output)` calls `extractFile()` which filters ZIP entries by `.apk` extension. A standalone single-module APK has no such entries, so it throws `IOException("No *.apk files found on: $file")`.

**`PatcherResult.applyTo(apkFile)` already produces a valid patched APK in-place** via `ZFile.openReadWrite`. Just sign after that — don't call `ApkMerger`.

### 3. jadx naming traps

When reverse-engineering decompiled Java:
- jadx renames `com.p1` → `com.p335p1`. **Always use the real `com/p1/mobile/putong/...` descriptors in patches.**
- jadx renames obfuscated package `Ll/<obf>;` (single-letter `l` package) to `Lp001l/<obf>;` for readability. **Real DEX descriptors are `Ll/<obf>;`. Never use the `p001l` prefix in fingerprints.**

### 4. Class fingerprints resolve at the patcher-class level

A `classFingerprint = parentFingerprint { ... }` chain must live as a top-level `val` (or `companion object val`), not inside a function. Inside `execute { }`, the same `matchOrNull()` call MUST NOT be called per-classDef (see #1).

### 5. Performance: avoid `classDefForEach` for stable CamelCase classes

`classDefForEach` iterates ALL ~50,000 classes in the APK. For each class it checks conditions, which is O(n) over the entire class pool. If you're looking for classes with stable CamelCase names (e.g., `NavigationBarAdView`, `ChatPartnerConfig`), use `classDefByOrNull("Lcom/p1/mobile/putong/...;")` instead — it's O(1) via the class index.

**When to use `classDefForEach`:** Only when you need to find multiple obfuscated classes that share common anchor strings/fields/methods, and there's no stable name to look up directly. Even then, merge the anchor pre-filter and data collection into a single pass to avoid scanning matching classes twice.

**When to use `classDefByOrNull`:** Always, when the class has a stable CamelCase name. This was the #1 performance bottleneck — 5 patchsets had `classDefForEach` loops scanning all classes for stable-named targets.

### 6. Performance: cache instruction iteration with WeakHashMap

Methods' `implementation?.instructions` iterates the bytecode each time. If you call `accessesField()` or similar instruction-scanning helpers multiple times on the same method, cache the materialized instruction list:

```kotlin
private val instructionCache = java.util.WeakHashMap<Method, List<Instruction>>()
private fun Method.cachedInstructions(): List<Instruction> =
    instructionCache.getOrPut(this) { implementation?.instructions?.toList() ?: emptyList() }
```

This prevents redundant iteration when the same method is analyzed multiple times across different patch blocks.

### 7. Performance: avoid cross-patch redundancy

Before adding a patch, check if another patchset already covers the same class/method. Common overlaps:
- Ad removal: `AdRemovalPatch` vs `PremiumUnlockPatch` (both had NavigationBarAdView, NativeAdViewCard)
- Root detection: `AnalyticsDisablePatch` vs `PrivacyEnhancementPatch` (both had root detection classes)
- Package enumeration: `AnalyticsDisablePatch` vs `PrivacyEnhancementPatch` (identical bytecode)
- Dialog suppression: Individual fingerprint patches vs centralized OMS blocklist in `DialogCleanupPatch`

Duplicate patches waste time (redundant class lookups + method iteration) and can cause double-injection issues.

### 8. Never patch nullCheck() methods

The `nullCheck()` methods in data classes (CounterSecretCrushLimit, BoostLimit, CounterLikeLimit, ChatPartnerConfig, LoveBuzzData, PrologueConfig, ODiamondVisitorMessageGuideConfig, LiveChatLimit, BLiveCommonConfig, GreetingCounter, IntlUltraPremiumConfig, User) are either empty no-ops or simple validation methods. Attempting to patch them with `addInstructions(0, ...)` causes bytecode verification errors:

```
java.lang.VerifyError: Verifier rejected class com.p1.mobile.putong.data.CounterSecretCrushLimit: 
void com.p1.mobile.putong.data.CounterSecretCrushLimit.nullCheck() failed to verify: 
[0x5] instance field access on object that has non-reference type IntegerConstant
```

**Why it fails:**
- The methods don't have the expected register allocation for injected instructions
- Prepending instructions breaks jump target offsets in existing bytecode
- The bytecode verifier rejects modifications to these validation methods

**Solution:** Remove all nullCheck() patches entirely. These methods don't need patching — they're either empty or perform validation that doesn't interfere with patch goals. If a nullCheck() method needs to be bypassed, find the calling code and patch it there instead.

**Real-world impact:** This caused the app to crash on startup with VerifyError, forcing users back to the login screen. All nullCheck() patches have been removed from PremiumUnlockPatch.kt, MessagingPatch.kt, and PrivacyControlsPatch.kt.

## Fable Method
Before any non-trivial backend task, apply the fable-method loop; for tasks that will run unattended or fan out subagents, use fable-loop. After completing substantive work, or whenever any agent/tool claims work is done, run a fable-judge pass before presenting it as finished.

## Using Subagents

When investigating complex issues or implementing multiple fixes, use subagents to parallelize work and get specialized focus.

### When to Use Subagents

**Use subagents for:**
- Investigating multiple unrelated issues in parallel
- Deep dives into specific features or code paths
- Implementing multiple independent fixes
- Code exploration and analysis tasks
- Build and deployment tasks after fixes are identified

**Don't use subagents for:**
- Simple single-file edits
- Quick investigations that take < 2 minutes
- Tasks that depend on each other's output

### How to Launch Subagents

Use the `task` tool with appropriate agent type:

```
task(
  description="Short description",
  subagent_type="general",  # or "explore" for read-only investigation
  prompt="Detailed task description..."
)
```

**Agent types:**
- `explore` - Read-only investigation, code search, analysis
- `general` - Implementation, file editing, build/deploy tasks

### Parallel Investigation Pattern

When multiple features are broken, launch parallel investigation subagents:

```
# Launch all investigations in parallel
task(description="Investigate feature A", subagent_type="explore", prompt="...")
task(description="Investigate feature B", subagent_type="explore", prompt="...")
task(description="Investigate feature C", subagent_type="explore", prompt="...")

# Wait for all to complete, then synthesize findings
# Launch single implementation subagent with all fixes
task(description="Fix all issues", subagent_type="general", prompt="...")
```

### Subagent Prompt Structure

Include in every subagent prompt:
1. **Context** - What's broken, what's been tried
2. **Specific investigation targets** - Files to check, methods to trace
3. **Expected deliverables** - What to report back
4. **Build/deploy instructions** - If implementing fixes
5. **Credentials** - GitHub token, release ID, etc.

### Example: Multi-Feature Investigation

```
# Investigate 6 broken features in parallel
task(description="Investigate badge display", subagent_type="explore", prompt="...")
task(description="Investigate blur issue", subagent_type="explore", prompt="...")
task(description="Investigate super likes", subagent_type="explore", prompt="...")
task(description="Investigate roaming", subagent_type="explore", prompt="...")
task(description="Investigate banner", subagent_type="explore", prompt="...")
task(description="Investigate payment dialogs", subagent_type="explore", prompt="...")

# Synthesize findings and launch comprehensive fix
task(description="Fix all issues", subagent_type="general", prompt="
  Fix 1: Change xma.e4() from RETURN_TRUE to RETURN_FALSE
  Fix 2: Remove isODiamond from true-returning set
  Fix 3: Change counter from MAX_VALUE to 200000
  ...
  Build and deploy to release 362723625
")
```

### Benefits

- **Parallelism** - Multiple investigations run simultaneously
- **Focus** - Each subagent has clear, narrow scope
- **Efficiency** - Reduces context switching for main agent
- **Completeness** - Ensures all angles are investigated
