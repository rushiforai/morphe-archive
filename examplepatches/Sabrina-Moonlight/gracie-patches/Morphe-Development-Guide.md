# Guide for creating Morphe patches

Context for the AI. Only includes what's read in the official documentation or verified in this repo. Don't invent anything that isn't here: if something is missing, ask for the text or the link. The working rules (language, file delivery, compiling) are in `claude-readme-after-unzip.md`.

## 1. What Morphe is
It modifies existing Android apps (for example, removing their ads). Each change is a **patch**.
- **Morphe Patcher:** the engine that applies the patches.
- **Morphe Manager:** the Android app that patches and installs from the phone.
- **`.mpp` file:** the package with your patches. It's what Morphe Manager uses.

## 2. What a patch looks like
It's written in Kotlin; the AI writes it and she copies and pastes it.
- **Compatibility:** app package and versions. With no versions given, it works for any version.
- **bytecodePatch:** changes the app's code. **resourcePatch:** changes resources (text, images).
- **name and description:** what shows up in Morphe. Without a name it won't load.
- **default = true:** comes enabled by default.
- **dependsOn(...):** needs another patch to run first.
- **execute { ... }:** what the patch does. **finalize { ... }:** runs at the end, after all patches.
- **options:** settings the user changes before applying.
- **PatchException:** error the patch throws if it fails.

### Fingerprints
They describe a method by its characteristics so it can be found even when names get scrambled ("obfuscated") between versions.
- It only finds the method if **everything** described matches. If it doesn't find it, it throws an error; if not finding it is expected, use the "OrNull" versions.
- **Never obfuscated names.** It can be described by: class, access flags, return type, parameters, text (`string`), method calls, fields, numbers (`literal`), and `opcode`.
- Filters go in the same order as in the code. Avoid relying only on opcode sequences: it's fragile.
- Several changes in the same method: start from the last one.
- A fingerprint is looked up once and shared between patches.

### Extensions
Already-compiled code (`.mpe`) that gets mixed into the app before the patch; useful when the function is large. The patch calls it with `invoke-static`. Folder: `extensions/extension`.

## 3. What the AI needs for a good patch
The AI can't see the app. Ask it for:
1. The regular **`.apk`** (the `.apks` isn't needed: the `.apk` already includes `classes.dex`).
2. What it wants to achieve.
3. Full workflow error output if something fails.

## 4. How to read an app without a computer (verified)
- The AI's environment has no internet, no apktool, no baksmali; only Java and Python.
- An APK is a ZIP. `classes.dex` is read with a custom Python script: it gives classes, methods and text, and **which method calls which**. It doesn't give the full smali.
- `strings -e l AndroidManifest.xml` shows the package, the exact `versionName`, and the screens.
- In apps with scrambled names (`A0`, `Tl`...) those names are useless; the names from the Android system, Java and known libraries (Google Ads, etc.) are still useful.

### Recipe for ads
1. In the manifest, look for `com.google.android.gms.ads.APPLICATION_ID`: if it's there, it uses AdMob.
2. Look for which of the app's own methods call `InterstitialAd.show`, `AppOpenAd.show`, `RewardedAd.show`, etc.
3. Walk up through whoever calls them until you reach the "gatekeeper" method that decides whether there's an ad.
4. Prefer having the gatekeeper say "there's no ad." Skipping only the "show" call is risky: the app can end up stuck waiting.

### Describing a method without scrambled names
- Use calls to system or library classes (`Landroid/os/ConditionVariable;`, `Ljava/lang/System;`), fixed text, return type, parameters and access flags.
- **Before delivering it**, check with the script that the description matches **exactly one** method in the whole app.

## 5. How to write and deliver the patch
- A simple patch fits in **a single `.kt`** (compatibility + fingerprint + patch). Path: `patches/src/main/kotlin/app/template/patches/<app>/PatchName.kt`. If it's new, it goes with `ROUTES.txt`.
- **Real, complete example:** `patches/src/main/kotlin/app/template/patches/orientationcontrol/DisableAdsPatch.kt`. Copy its shape: `Compatibility(name, packageName, apkFileType, appIconColor, targets = exact manifest version)`, an `object ... : Fingerprint(...)`, and the patch as a top-level public value (`@Suppress("unused") val patchName = bytecodePatch(...)`).
- Method that should always return false: `addInstructions(0, "const/4 v0, 0x0\nreturn v0")`. First check it has at least one free register (total registers greater than the input ones).
- For a method to always return a value (or do nothing if it's `void`), `returnEarly()` is simpler: see section 5.1. To change a specific instruction, see `instructionMatches` in 5.1.
- The AI's environment doesn't compile: the real test is the Release workflow.

### 5.1 Fingerprints and APIs (read from the official documentation)
**Writing the fingerprint** (everything declared must match):
- Fingerprint parameters: `definingClass`, `accessFlags` or `isStatic` (never both), `returnType`, `parameters`, `name`, `strings`, `filters`.
- Types: exact primitives (`"I"`, `"Z"`, `"V"`, `"F"`). Known class: full name `"Ljava/lang/String;"`. **Class with a scrambled name: just `"L"`.** `parameters` must have the same count as the method.
- `filters = listOf(...)` goes in the order of the code. Filters: `opcode(...)`, `string("x")`, `methodCall(...)`, `fieldAccess(...)`, `literal(value)`, `resourceLiteral(type, name)`, `newInstance`, `checkCast`, `instanceOf`, `anyInstruction(...)`.
- **`literal(value)` accepts `Int`, `Long`, `Float` and `Double`**: useful for unique numbers. Example: `literal(1544385677)` or `literal(250.0f)`.
- Location of each filter (`location`): `MatchAfterImmediately()`, `MatchAfterWithin(n)`, `MatchFirst()`, `MatchAfterLast()`, `MatchBefore...`. Default is "after, anywhere."
- `strings = listOf("a")` looks for text in any order; `string("a")` inside `filters` respects the order. If unsure, use `filters`.
- Compose-only apps: every screen function starts with a call carrying a unique fixed number (in decompiled code it looks like `a0(1544385677)`). That number works for `literal(...)`.

**Using the fingerprint in the patch:**
- Imports: `app.morphe.patcher.util.returnEarly` and `app.morphe.patcher.util.returnLate` (the import for `literal` isn't in the documentation: if it fails to compile, ask for the error).
- `Fingerprint.method.returnEarly()` → `void` method: exits immediately, does nothing.
- `Fingerprint.method.returnEarly(false)` or `(true)` → returns that value without running the code. Also accepts `null` and text.
- `Fingerprint.method.returnLate(value)` → runs the original code and changes what it returns. Use this if the method does something the app needs.
- To insert code at a specific point: `Fingerprint.instructionMatches[n].index` (filter n, starting at 0) and `addInstructions(index, "smali")`.
- Several changes in the same method: from the last position to the first. Or call `clearMatch()` and search again.
- A fingerprint only finds the first method. For all of them: `matchAll()`.
- Free registers: don't hardcode `v0` blindly; use `findFreeRegister(index, registersToExclude)`.
- If not finding the method is expected: use the `OrNull` versions (`methodOrNull`, `matchOrNull()`).

## 6. Lessons learned in this repo
- Release failed with "Dependencies lock file is not found" because of `cache: 'npm'` in `release.yml`; that line was removed and it went green.
- `gradle.properties` isn't in the repo (git ignores it) and it isn't needed.

## 7. Still to read
- Already read: `2_2_1_fingerprinting.md` and `4_apis.md` (summarized in 5.1; from `4_apis.md` only `returnEarly`, free registers and `addInstructionsWithLabels`).
- Not read yet: `1_patcher_intro.md`, `2_patches_intro.md`, `2_1_setup.md`, `3_structure_and_conventions.md`.
- `morphe-patches` repo (real example patches).
- Guide for migrating patches from ReVanced to Morphe (issue #22 of `morphe-patcher`).

## 8. Official links
- Documentation: https://github.com/MorpheApp/morphe-documentation
- Patcher (docs): https://github.com/MorpheApp/morphe-patcher/blob/main/docs/README.md
- Template: https://github.com/MorpheApp/morphe-patches-template
- Real patches: https://github.com/MorpheApp/morphe-patches
- Morphe Manager: https://github.com/MorpheApp/morphe-manager

## 9. What survives when the app "scrambles" names
*(From the community guide `morphe-ai`, not official Morphe documentation: always double-check against the real smali before using.)*

When an app is compiled, a tool called R8 (or ProGuard) renames almost everything so it's smaller and harder to read. That **changes with every app update**, so it's never useful for describing a method. These, on the other hand, almost never change:
- The method's return type and parameters (`returnType`, `parameters`).
- The access flags (`accessFlags`): public, static, etc.
- The class and method names of **known libraries** (Android, RevenueCat, Google Play Billing, Firebase, OkHttp, AdMob...), because those libraries aren't part of the app's own code.
- Fixed text (`string(...)`) and numbers (`literal(...)`).
- The order methods are called in.

**Never survives:** the app's own class or method names, field names, variable names (they don't even exist in the bytecode).

If an app uses more aggressive obfuscation (DexGuard: encrypted strings) `string(...)` filters may not work; in that case lean more on `methodCall(...)` from known libraries and on `opcode(...)`.

## 10. Ready-to-use smali patterns

For `addInstructions(...)`, depending on what's needed:

```smali
; Make the method always say "yes" (true)
const/4 v0, 0x1
return v0

; Make the method always say "no" (false)
const/4 v0, 0x0
return v0

; Make it do nothing (void method)
return-void

; Make it return an empty object (null)
const/4 v0, 0x0
return-object v0

; Make it return a fixed enum value (e.g. "PRO" tier)
sget-object v0, Lcom/app/Tier;->PRO:Lcom/app/Tier;
return-object v0

; Make it return fixed text
const-string v0, "fake_value"
return-object v0
```
For this, `returnEarly(...)` is almost always enough (see 5.1); these loose smali snippets are for when you need to insert at a specific point with `addInstructions`.

## 11. Ads: beyond AdMob
The "recipe for ads" in section 4 works for AdMob. If the manifest doesn't have AdMob, check whether the app uses another ads SDK and, inside its class, the typical "load" and "show" methods:

| Ads SDK | Methods to look for |
|---|---|
| Unity Ads | `initialize`, `isInitialized`, `load`, `show` |
| AppLovin MAX | `loadAd`, `showAd`, `startAutoRefresh` |
| Meta (Facebook) Audience Network | `loadAd`, `show`, `loadAdFromBid` |
| Mintegral | `load`, `show`, `preload` |
| Pangle (TikTok) | `loadAd`, `showAd` |
| Vungle (Liftoff) | `load`, `play`, `canPlayAd` |
| Yandex Ads | `loadAd`, `show` |
| TopOn | `loadAd`, `show`, `isAdReady` |

The idea is the same as always: make a `Fingerprint` of those methods and use `returnEarly()` so they do nothing.

## 12. Premium / subscription: common patterns
Depending on what the app uses to check if it was paid for, how to "fool it" changes:

| The app uses... | What to look for | What to do |
|---|---|---|
| **RevenueCat** | calls to `CustomerInfo` → `getEntitlements()` → `getActive()` | fingerprint that method, `returnEarly(true)` |
| **Google Play Billing** | `BillingClient`, `BillingResult`, `Purchase.isAcknowledged` | make the result always "OK" / purchased |
| **SharedPreferences** | text like `isPremium`, `isPro`, `isSubscribed`, `hasPremium` | fingerprint the method that reads that preference, `returnEarly(true)` |
| **Firebase Remote Config** | `getBoolean("premium_enabled")` or similar | make it always return `true` |
| **Tier enum** (e.g. `SubscriptionTier`) | the field for the highest tier (`PRO`, `PREMIUM`) | return that fixed value (see the smali pattern in section 10) |

First figure out which of these the app uses (by looking for that text/those classes in the code), and only then build the fingerprint.

## 13. Common problems (quick reference)
- **The fingerprint doesn't find the method:** the app probably changed version. Look at that version's smali again and adjust the fingerprint.
- **The patch doesn't do anything:** check it doesn't have `default = false` without being enabled, or that it's properly linked (`dependsOn`) if it depends on another patch.
- **Missing an extension:** if the patch uses an extension (`.mpe`), confirm the path matches the `extensions/` folder.

## 14. Preferred fingerprint style and small API notes (from current Morphe source)

Use these when writing new patches. They match how the official library works today.

**Prefer `object` fingerprints** (gives a clear name if the match fails):

```kotlin
object DisableAdsFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("showBannerAds"),
    // or ordered filters when order matters:
    // filters = listOf(
    //     string("showBannerAds"),
    //     methodCall(name = "loadAd"),
    // ),
)
```

The older `fingerprint { ... }` builder still works but is less clear when something fails.

**returnEarly / returnLate**
- `method.returnEarly()` → method does nothing (void).
- `method.returnEarly(true)` / `false` / `null` / a number / text → returns that value and skips the rest.
- `method.returnLate(true)` → the method still runs, but every return becomes that value. Use when the method must do side work.

**addInstructions needs an index**
Always pass the index (where to insert):

```kotlin
method.addInstructions(0, """
    const/4 v0, 0x1
    return v0
""".trimIndent())
```

The form without index is deprecated and will be removed.

**Private vs public source in Morphe Manager**
- If the GitHub repo is **private**, Morphe cannot download the `.mpp` → the source often shows as **Unnamed** and the red download error appears.
- After making the repo **public**, delete the broken source in Morphe and add it again with:
  `https://github.com/Sabrina-Moonlight/gracie-patches`
- Or install the `.mpp` from Releases by hand (no source needed).

## 15. Patterns from mature patch projects (practical notes)

These notes summarize how larger community patch sets stay stable across apps. They are technical habits, not product rules. Prefer them when a simple `returnEarly` is not enough.

### 15.1 Split shared logic from app-specific patches

- Put reusable work under something like `patches/.../shared/misc/<topic>/`.
- Keep one small patch per app under `patches/.../<app>/` that only sets `compatibleWith` and `dependsOn(...)`.
- Shared patches should accept several apps via `compatibleWith(...)` lists, or stay internal and be pulled in with `dependsOn`.

This avoids copy-pasting the same license or integrity logic into every app folder.

### 15.2 Chain patches with `dependsOn`

When a fix needs more than one step, make the order explicit:

```kotlin
dependsOn(
    restoreManifestEntryPatch,   // resources / AndroidManifest
    skipLocalCheckPatch,         // bytecode
    clearNativeRuntimePatch,     // raw resources under lib/
)
```

Resource patches (manifest, `lib/`, assets) often must run before bytecode that assumes the restored entry points. If the app still opens a store screen or exits on launch, check whether a required step is missing from the chain.

### 15.3 Manifest entry points

Some packs replace the real `android:name` on `<application>` and/or `android:appComponentFactory` with temporary classes that run local checks first.

Useful approach seen in the wild:

1. Read the **original** class names from constants still present in the dex (string fields on a known class).
2. In a `resourcePatch`, write those names back into `AndroidManifest.xml`.
3. Remove temporary components whose names share a fixed prefix.

Always verify the restored names against the decompiled constants for **that** version. Do not hardcode class names that only existed in an older build.

### 15.4 `versionCode` in compatibility

Prefer:

```kotlin
AppTarget(version = "1.0.2", versionCode = 12)
```

when the patch loads tables or files named like `com.example.app-12.stubs`. Matching only the marketing version string is weaker if two builds share the same label.

### 15.5 Bundled tables under `resources/`

Mature sets keep per-app data next to the code:

```
patches/src/main/resources/<topic>/
  com.example.app-12.stubs
  com.example.app-12.tsv
```

Load them at patch time (classpath resource stream). Name files with `packageName-versionCode` so one shared patch can serve many apps without branching on package strings in Kotlin.

### 15.6 When `returnEarly` is enough — and when it is not

| Situation | Usually enough |
|-----------|----------------|
| Boolean/int gate (“is premium”, “are ads enabled”) | `returnEarly(true/false)` |
| Void method that only starts a local check or opens a URL | `returnEarly()` |
| Method body was replaced by a call into a local VM / encrypted helper | **Not enough** — need restored instructions or a safe stub body |
| Native library aborts after re-sign (integrity inside `.so`) | **Not enough** — remove or replace that library under `lib/<abi>/` |
| App component factory still points at a temporary bootstrap | **Not enough** — fix the manifest first |

Rule of thumb: if the app still closes **immediately** on open after you stubbed the Java/Kotlin checks, look for a native runtime or a component factory still in the temporary path.

### 15.7 Neutralising virtualized / forwarded methods

Some builds turn real methods into thin wrappers that call a local runner. Patterns that reduce crashes:

1. List the wrappers (from a known table or by scanning calls to the runner class).
2. Replace the body with a typed safe return (`return-void`, `const/4 v0, 0` + `return v0`, `return-object v0`, etc.).
3. Optionally restore full bodies later from recovered dex + a method table (larger effort).

Always match **return type** and register width (`return-wide` for `J`/`D`). A wrong return opcode crashes at runtime even if the patch compiles.

### 15.8 Fingerprints: keep them stable and local

- Prefer `object NameFingerprint : Fingerprint(...)` so failures print a clear name.
- Put shared fingerprints in `Fingerprints.kt` next to the shared patch.
- Prefer `strings` / `methodCall` on **library** APIs over app class names.
- Use `runCatching { fingerprint.method.returnEarly() }` only for optional paths; required paths should fail loudly with `PatchException` so the Release log shows what broke.

### 15.9 Raw resource patches for `lib/` and assets

```kotlin
rawResourcePatch {
    execute {
        get("lib").listFiles()?.filter { it.isDirectory }?.forEach { abiDir ->
            abiDir.resolve("libSomeRuntime.so").takeIf { it.exists() }?.delete()
        }
    }
}
```

Use this for files that are not XML. Confirm the ABI folders that actually ship in the APK/APKS before assuming `arm64-v8a` alone is enough.

### 15.10 APK vs APKS

Some targets need split packages (`ApkFileType.APKS_REQUIRED`). If Manager applies cleanly on a single APK but the install is incomplete, check whether the upstream target was defined as APKS and whether native libs live only in a split.

### 15.11 Checklist before declaring an app “done”

1. Fingerprint matches on the **exact** version you ship (smali or jadx of that build).
2. `compatibleWith` lists the right `version` / `versionCode`.
3. Any multi-step fix is ordered with `dependsOn`.
4. Manifest entry points restored if they were temporary.
5. No leftover native runtime that checks the signing certificate at process start.
6. Premium/ads gates verified with a real open of the app, not only a green compile.
7. Names and descriptions stay neutral and short (what the toggle does in the UI).

### 15.12 What to copy from other projects — and what not to

**Copy ideas:** shared folders, `dependsOn` chains, resource tables keyed by versionCode, manifest restore from dex constants, safe stub bodies for thin VM wrappers.

**Do not copy blindly:** hardcoded offsets, keys, or class names from another app; whole files that pull half a monorepo of unrelated apps; patch names or descriptions that overclaim.

When porting, bring the **smallest** set of files that make one app stable, then grow the shared module as the next app needs the same tool.
