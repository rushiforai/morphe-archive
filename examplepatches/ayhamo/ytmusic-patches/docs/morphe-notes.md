# Morphe reference notes (for our private YT Music bundle)

Target: `com.google.android.apps.youtube.music`, applied next to the official bundle
(`MorpheApp/morphe-patches`) in one run, via Morphe Desktop CLI now and Morphe Manager later.

Sources (read in full, 2026-11-08):
- `MorpheApp/morphe-patcher` `docs/` (all 9 files) - cited as `patcher/<file>`
- `MorpheApp/morphe-manager` `docs/` (all 15 markdown files) - cited as `manager/<file>`
- `MorpheApp/morphe-patches-template`: README, release.yml, open_pull_request.yml, .releaserc,
  settings.gradle.kts, patches/build.gradle.kts, example patch/extension sources - cited as `template/<file>`

Anything marked **(not documented)** is a gap in the docs, not a rule.

---

## 1. Patch anatomy

### patch() is the only patch type (Patcher 2.3.0+)
- Declare every patch with `patch(name, description, default) { ... }`. `bytecodePatch`,
  `resourcePatch`, `rawResourcePatch` are deprecated; one patch can touch bytecode and resources.
  (`patcher/5_patcher_changes.md` 2.3.0, `patcher/2_patches_intro.md`)
- No context receiver anymore: helpers are plain `fun helper()`. Global functions
  (`classDefBy`, `mutableClassDefBy`, `document`, `resourceXml`, `resourceFile`, `deleteResource`,
  `decode`, `validate` ...) are imported from `app.morphe.patcher.patch`. Fingerprints need no import.
  Migration table: `get(path)`/`this[path]` -> `resourceFile(path)`, `delete(name)` -> `deleteResource(name)`,
  `Patch<*>` -> `Patch`, builders -> `PatchDefinition`. (`patcher/5_patcher_changes.md`)
- Global functions work only while an APK is being patched (inside `execute`, functions it calls,
  or fingerprint filter lambdas), never at declaration time. (`patcher/4_apis.md`, `patcher/2_patches_intro.md`)
- Old API still compiles with a deprecation warning, will stop compiling later. `bytecodeContext`/
  `resourceContext` are a stopgap for libraries that still need a context. (`patcher/5_patcher_changes.md`)

### Named vs unnamed ("hidden") patches
- `PatchLoader` only loads patches **with a name**. An unnamed `patch { }` is an internal patch:
  not listed in Manager or CLI, only runs when something `dependsOn` it.
  (`patcher/2_2_patch_anatomy.md` tips; `template/InternalPatch.kt` comment)
- The docs do not describe a separate `use` flag or `hidden` parameter **(not documented)**.
  Visibility = has a name or not. `default = true/false` = included in the recommended/default selection.

### default flag
- `default = true` puts the patch in the recommended selection (what Simple mode applies and
  what "Enable recommended patches" restores). A non-default patch shows an **Expert** badge in
  Manager and needs Expert mode to enable. (`manager/patch-sources.md` troubleshooting,
  `manager/patching-expert-mode.md`)
- Patches newly added to a source join an existing saved selection only if they are recommended.
  (`manager/batch-patching.md`)

### dependsOn
- Dependencies execute first. If a dependency throws, the dependent patch is not executed.
  (`patcher/2_2_patch_anatomy.md`)
- Patches can raise `PatchException` any time to fail. (`patcher/2_2_patch_anatomy.md`)

### extendWith / extendWithAll
- `extendWith("name.mpe")` merges a precompiled DEX (extension) into the app **before** the patch
  executes; the patch can then reference its classes. (`patcher/2_2_patch_anatomy.md`)
- `extendWith` is evaluated when the patch is built. For a variable list produced by a dependency,
  use `extendWithAll { list }`, evaluated at patch time after dependencies ran. (`patcher/2_2_patch_anatomy.md`)

### compatibleWith / Compatibility / AppTarget
- `Compatibility(name, packageName, appIconColor, formFactor = FormFactor.MOBILE, apkFileType, targets = listOf(AppTarget(...)))`.
  (`patcher/2_2_patch_anatomy.md`, `template/Constants.kt`)
- No targets = any app version. `AppTarget(version = null)` = latest and expected to work with
  future versions. `AppTarget(version = null, isExperimental = true)` = "any version, experimental".
  `versionCodes = mapOf(SupportedAbi.ARM64_V8A to ...)` only when several arch builds share a version
  name and only one code is tested. (`template/Constants.kt`)
- Always include the exact version you developed against; prefer versions available on
  APKMirror/UpToDown (Manager search redirects there, else Google). (`template/Constants.kt`)
- `apkFileType` (`ApkFileType.APK`, `APKM`, ...) must match the file type on APKMirror/UpToDown,
  otherwise Manager will not send users there. (`template/Constants.kt`)
- Compatibility is advisory: patches can still be executed on any package/version.
  No `compatibleWith` = compatible with **any package** (this is how universal patches work).
  Package with no versions = any version. (`patcher/2_2_patch_anatomy.md`)
- Manager reads targets: **Recommended** = tested version, **Experimental** targets only shown
  when the source's "Experimental app versions" toggle is on. (`manager/patching-expert-mode.md`, `manager/patch-sources.md`)

### Options
- `stringOption(name = ...)`, `option<T>(name = ...)` etc., delegated to properties
  (`val value by stringOption(...)`). Options can be declared outside and attached with
  `val v by option()` to share them across patches. Set after loading:
  `patches.first { it.name == "Patch" }.options["Inbuilt option"] = "Value"` (type checked at runtime).
  (`patcher/2_2_patch_anatomy.md`)
- Manager: Simple mode shows options under Settings -> Patch options; Expert mode per patch on the
  selection screen. Required options left empty give a red border. (`manager/patching-expert-mode.md`)

### execute / finalize order
- Order: dependencies `execute` first, then the patch; `finalize` blocks run after **all** patches
  executed, in reverse execution order. Example prints `1234`
  (dep.execute, patch.execute, patch.finalize, dep.finalize). Use case: dependency opens a file,
  dependents write, dependency's finalize closes it. (`patcher/2_2_patch_anatomy.md`)

### Lazy decoding (2.3.0)
- DEX decoded on first class/fingerprint use; manifest + resource table on first resource use;
  other files only when requested. Unused things copied as-is. (`patcher/2_patches_intro.md`, `patcher/5_patcher_changes.md`)

---

## 2. Fingerprinting

All from `patcher/2_2_1_fingerprinting.md` unless noted.

### What to match on
- A fingerprint matches only if **all** declared info matches. Fields: `definingClass`, `name`,
  `accessFlags` **or** `isStatic` (not both), `returnType`, `parameters`, `superclass`, `interfaces`,
  `strings`, `filters`, `custom`, `classFingerprint`.
- Declare fingerprints as `object XFingerprint : Fingerprint(...)` so failures name the fingerprint
  in the stack trace.
- Type descriptor comparison rules: primitive or `L...;` = equals; starts with `L` (no `;`) =
  starts-with (`"L"` = any object, `"Lcom/app/"` = package); `"/String;"` = ends-with; anything else
  = contains. Obfuscated classes: use `"L"`. `parameters` must have the exact count.
- `definingClass = "this"` in `methodCall`/`fieldAccess` = the fingerprinted method's own class
  (not super/subclasses).

### Obfuscation-safe practices
- Never use obfuscated class or method names. (TIP in fingerprinting doc; `patcher/3_structure_and_conventions.md`)
- Access flags are unstable (R8 changes visibility, final, synthetic). If only static-ness matters,
  use `isStatic = true/false`. Constructors: `name = "<init>"`, static init: `name = "<clinit>"`.
- Prefer return type + parameters + well chosen instruction filters over names.
- Resource ids change per build: use `resourceLiteral(ResourceType.X, "name")` in filters, or
  `resourceId()` / `hasResourceId()` in code. `exceptionIfResourceNotFound = false` for resources
  only some versions have (typically inside `anyInstruction`).
- `anyInstruction(a, b, location = ...)` when one instruction differs between versions
  (only the outer location is used).
- Older app version needs a different fingerprint: name it `...LegacyFingerprint` and choose via
  app version check. (`patcher/3_structure_and_conventions.md`)

### Filters
`opcode`, `string`, `methodCall`, `fieldAccess`, `literal` (Int/Long/Float/Double/lambda),
`resourceLiteral`, `newInstance`, `checkCast`, `instanceOf`, `anyInstruction`.
`methodCall(smali = "Landroid/net/Uri;->parse(...)...")` / `fieldAccess(smali = ...)` accept
copy-pasted un-obfuscated smali. Custom `InstructionFilter`/`OpcodeFilter` possible but slower.
- Filters must be declared in instruction order (unless a `MatchBefore*` location is used);
  any number of instructions may sit between filters.
- Lambdas can reference another fingerprint's match:
  `newInstance(type = { OtherFingerprint.originalClassDef })`,
  `methodCall(reference = { Other.originalMethod })`. (Also `patcher/5_patcher_changes.md` 2.3.0)

### Strings
- Preferred: `filters = listOf(string("foo"), ...)` (ordered, can have locations).
- `strings = listOf(...)` is unordered; only for many randomly ordered strings (e.g. enum init).
  Results go to `stringMatches`, not `instructionMatches`.
- Since 2.0.0 raw `strings` must **equal** a method string (not contains). Use
  `string("x", StringComparisonType.STARTS_WITH/CONTAINS)` for partial. (`patcher/5_patcher_changes.md`)

### Literals
- `literal(1337)` matches a `const` loading that number; `literal(2.0)` for doubles.

### Instruction locations
`MatchAfterAnywhere()` (default), `MatchAfterImmediately()`, `MatchAfterWithin(n)`, `MatchFirst()`,
`MatchAfterLast()`, `MatchBeforeAnywhere()`, `MatchBeforeImmediately()`, `MatchBeforeWithin(n)`,
`MatchBeforeFirst()`. As first filter: Immediately/Before* not allowed (throws when matched),
`MatchFirst` required to be first, `MatchAfterWithin(n)` = within first n+1 instructions.
- Retrying (2.0.0+): if a filter cannot match, earlier filters are retried with their next
  candidate, back to the first. Only changes results with Immediately/Within/Last/Before locations.
- With `MatchBefore*`, `instructionMatches` indexes are not ascending, and a filter can match the
  same instruction as an earlier one.
- Convention: prefer filter match indexes over custom instruction searching; if you need another
  instruction's index, add a filter for it. (`patcher/3_structure_and_conventions.md`)

### classFingerprint and manual matching
- `classFingerprint = Fingerprint(...)` finds the class first (e.g. via a `toString` with unique
  strings), then the rest matches a method in that class.
- Manual: `fp.match(classDef)`, `fp.match(method)` / `match(method, classDef)`, all with `OrNull`.
- `matchAll()`, `matchAll(range)`, `matchAll(classDef)`; `matchAllMethodIndicesForEach()` for every
  matching instruction (single filter only, visits last-to-first, `requireMatches = false`).
  (`patcher/4_apis.md`)
- `matchSingle()` throws if more than one method matches; use for apps without a version
  constraint. CLI `--validate` makes every fingerprint match-single and logs slow fingerprints.
  (`patcher/4_apis.md`)

### Using results
- `instructionMatches[i]` -> `index`, `instruction`, `getInstruction<T>()`, `methodReference`,
  `fieldReference`, `getMethodCalled()`, `getFieldAccessed()`.
- `original*` = immutable (use for read-only); `method`/`classDef` = mutable copy that replaces the
  class in the app on first access.
- Non-OrNull accessors throw `PatchException` on no match; use `matchOrNull()`, `methodOrNull` etc.
  when "no match" is legitimate. `patchException()` builds the standard error.
- A fingerprint matches **once** and caches the result (shared across patches).

### Common mistakes
- Modifying a method several times with stale indexes: modify from last index to first, or
  `clearMatch()` then re-match.
- **Shared fingerprints across patches**: another patch may have inserted instructions; execution
  order between unrelated patches is "not always known". Call `clearMatch()` before using indexes
  of a fingerprint other patches modify. (Very relevant with the official bundle in the same run,
  see section 5.)
- Using `custom = { }` when filters would do: much slower, cannot speed up matching.
- Opcode-only patterns (`OpcodesFilter.opcodesToFilters`): fragile, avoid.
- Overloading a fingerprint with details likely to change. (`patcher/3_structure_and_conventions.md`)

---

## 3. Smali injection rules

All from `patcher/4_apis.md` unless noted.

- **Registers above v15**: non-range `invoke` (and e.g. `const/4`) only accept 4-bit registers
  `v0..v15`. For any register number use `invoke-static/range { vN .. vN }`. The app itself may
  compile the same call either way, so read registers with `instruction.registersUsed`
  (handles both `FiveRegisterInstruction` and `RegisterRangeInstruction`). Non-static calls: first
  register is the instance; long/double take two registers.
- **Do not hardcode `v0`** in the middle of a method: the original code may still need it.
  `method.findFreeRegister(index, excludedRegs...)` follows all branches and prefers 4-bit
  registers; pass every register your injected code reads as excluded.
  `getFreeRegisterProvider(index, count, excluded...)` -> `getFreeRegister()`, `getFreeRegister4Bit()`
  (throws if not 4-bit), `getUsedAndUnAvailableRegisters()` to exclude at a later index.
  Both throw `IllegalArgumentException` if nothing is free.
- No free register: `cloneParameters()` (frees p0, p1...; not for static no-param methods) or
  `addFreeRegisters(n)` (new registers start at old `registerCount`, may be > v15). Both replace the
  method with a clone: use the returned method, and shift saved indexes by the added instruction
  count (`numberOfParameterRegistersLogical` / returned count).
- `p0Register` gives the register number of `p0`.
- Hardcoded `v0` at index 0 followed by return is fine (example in `patcher/2_2_patch_anatomy.md`,
  `template/ExamplePatch.kt`), because nothing after it runs.
- **Constant returns**: `returnEarly(value)` (skip original code) vs `returnLate(value)` (run original
  code, override every return). Primitives, strings, null; `returnEarly()` for void.
  `returnBoxedBooleanEarly(Boolean)` for `Boolean`/`Object` return types. Prefer `returnLate` when the
  method has needed side effects.
- **Labels**: added smali can define its own labels but cannot jump outside itself.
  - Jump within added code: end with `:label` + `nop`.
  - Jump to existing code: `addInstructionsWithLabels(index, smali, ExternalLabel("name", instruction|index|instructionMatch))`;
    index is pre-insertion.
  - Insert at an index that is a branch target: `addInstructions` puts code **after** the label (the
    branch skips it); `addInstructionsAtControlFlowLabel` puts it before so the branch runs it.
- Other edits used in docs: `addInstruction`, `addInstructions`, `removeInstruction`,
  `replaceInstruction`, `getInstruction<T>(index)`, `findInstructionIndicesReversed(OrThrow)`.
- Small helpers: `getReference<T>()`, `MethodReference.getMutableMethod()`.

---

## 4. Extensions

- An extension is a precompiled DEX (`.mpe`) bundled in the `.mpp`, merged into the app before the
  patch that `extendWith`s it executes. Put complex logic in Java in the extension, keep the patch
  minimal (`invoke-static` into the extension). (`patcher/2_2_patch_anatomy.md`,
  `patcher/3_structure_and_conventions.md` "Keep patches as minimal as possible")
- Template layout: Gradle module `extensions/extension/` with `build.gradle.kts`
  `extension { name = "extensions/extension.mpe" }`, `android { namespace = "app.template.extension" }`,
  an empty `<manifest/>`, Java sources under `src/main/java`. The patch calls
  `extendWith("extensions/extension.mpe")`. (`template/extensions/extension/build.gradle.kts`, `template/ExamplePatch.kt`)
- Extension methods are `public static` and referenced by full descriptor, e.g.
  `invoke-static {}, Lapp/.../ExamplePatch;->showAds()Z`. Keep the descriptor constant in one place
  (`private const val EXTENSION_CLASS = ...`). (`template/ExamplePatch.kt`)
- Package naming: the template uses `group = "app.template"` in `patches/build.gradle.kts` and
  `app.template.*` packages; Morphe's own extension classes use `app.morphe.extension.*` in doc
  examples. **Pick our own unique package** (e.g. `app.<us>.extension.music`) so our classes can never
  collide with the official bundle's `app.morphe.extension.*` classes merged into the same APK
  (collision behaviour **not documented**).
- `classDefForEach` iterates classes of the app **and its extensions**. (`patcher/4_apis.md`)
- `validate` checks are a good place to verify resources used by extension code exist. (`patcher/4_apis.md`)
- Settings/preferences API: **not documented** in these docs. The only related examples are a
  `resourceXml("res/xml/preferences.xml")` copy example and a `getFreeRegisterProvider` example adding
  a `Preference` to a `PreferenceScreen` from an extension. To hook into the official bundle's settings
  screen we would have to read `morphe-patches` source; there is no documented cross-bundle API.
  (`patcher/4_apis.md`)

---

## 5. Ordering, dependencies, multiple bundles, conflicts

- Within a run, the only documented ordering guarantee is: dependencies before dependents,
  finalizers in reverse. Order between unrelated patches "is not always known".
  (`patcher/2_2_patch_anatomy.md`, `patcher/2_2_1_fingerprinting.md` WARNING)
- **Cross-bundle dependencies are not documented.** `dependsOn` takes a patch object, so our bundle
  can only depend on patches compiled into our bundle. We cannot reference official patch objects
  without pulling their code in **(not documented; inference)**.
- `Patcher(...)` accepts any set of patches (`loadPatchesFromJar(setOf(File(...)))` takes a set of
  files), so loading two `.mpp` files into one run is the supported model. (`patcher/1_patcher_intro.md`)
- **Behaviour is decided per bundle by the `Patcher-Version` manifest attribute, but some rules
  depend on all bundles in the run** (`patcher/5_patcher_changes.md`):
  - On-demand resource decoding (2.0.0) applies **only if every bundle** is 2.0.0+.
  - Exact raw-string matching and filter retrying (2.0.0) apply **if any bundle** is 2.0.0+ (or has
    no declared version). A warning is logged when an older bundle gets newer behaviour.
  - Patches built with old patch types (pre-2.3.0) get decoded as before.
  So build ours against the same patcher line as the official bundle.
- Manager on mixing sources (`manager/patch-sources.md`, `manager/patching-expert-mode.md`):
  - Each source gets its own tab in Expert mode; action buttons act on the visible tab.
  - Enabling patches from several sources for one app "is possible but risky"; Manager asks for
    confirmation ("Multiple patch sources selected" warning).
  - **Simple mode only uses one source per app** (Select patch source dialog). So our bundle +
    official together requires **Expert mode** in Manager.
  - Batch patching: an app covered by several enabled sources is patched with all of them
    (Expert: per-source "Choose patches"; Simple: pick one). (`manager/batch-patching.md`)
  - "Copy selection from another bundle" copies only patches that exist (same name) in both sources.
  - The Update badge is tied to the source the app was patched with. (`manager/patch-sources.md`)
- Conflicts to design around (our inference from the docs above):
  - Don't name our patches the same as official ones (copy-selection matches by patch, confusing UX).
  - Re-match (`clearMatch()`) before using indexes in methods the official bundle may also edit.
  - Avoid modifying the same method lines as official patches; prefer separate hook points.
  - Official YouTube Music patches change the package name (e.g. `app.morphe.android.youtube` style
    for YouTube; YT Music also gets its own package). (`manager/patching-simple-mode.md`)

---

## 6. Patcher 2.x changes that affect us (`patcher/5_patcher_changes.md`)

- 2.3.0: single `patch` type, global functions, no contexts; filter lambdas referencing other
  fingerprints; only what patches use is decoded. Write all new code in the 2.3.0 style.
- 2.0.0:
  - Resources decoded on request; before listing/walking a dir call `decode("res/values*/strings.xml")`
    or `decode("res/xml")`; `listDecodableFiles()` to see what exists. Prefer `resourceXml` (edits
    compiled XML directly, much faster) over `document`; close with `use`. (`patcher/4_apis.md`)
  - `resourceFile(path, false)` to add/replace without decoding; a values file written this way merges
    and replaces same-named resources but removes none. `deleteResource` cannot delete manifest or
    `resources.arsc`. `listApkEntries()` reflects the input APK only.
  - Raw `strings` exact match; filter retrying; `isStatic`, `superclass`, `interfaces`,
    `MatchBefore*`/`MatchAfterLast`, `resourceLiteral`.
- 1.16.0: `returnEarly`/`returnLate`, `findFreeRegister`, `getFreeRegisterProvider`,
  `cloneParameters`, `addFreeRegisters`.
- Progress reporting via `PatcherConfig.progress` (host-side only). (`patcher/1_patcher_intro.md`)

---

## 7. Morphe Manager

### Adding a patch source (`manager/patch-sources.md`)
- **Remote**: GitHub or GitLab repo URL (`github.com/owner/repo`) or a direct link to bundle JSON
  metadata (`example.com/patches-bundle.json`). Repo URL enables auto-update.
- Deep link: `https://morphe.software/add-source?github=owner/repo` (`&name=`, `&app=<package>` to
  bring only one app). Only GitHub/GitLab accepted that way. Template README ships an "Add to Morphe"
  button using it. (`template/README.md`)
- **Local**: pick one or more `.mpp` files. Local sources never auto-update; "Update" on the card
  and pick the new file. A new file is recognised **by bundle name**, keeping selection and options.
  Push from PC: `adb push patches.mpp /sdcard/Download/latest.mpp`, query the media id, then
  `am start -a android.intent.action.VIEW -t application/vnd.ms-project --grant-read-uri-permission -d content://media/external/file/<id> -n app.morphe.manager/app.morphe.manager.MainActivity`
  (Manager always asks to confirm).
- Per-source "Pick which of its apps to keep" and "Bring new apps" toggles; per-app source choice via
  long-press -> Patch sources.
- Badges: Metadata N/A (no auto-update), Update Morphe (needs newer patcher), Crashed, Blocked.

### Private repos / token
- Expert mode adds a **GitHub PAT** setting in Settings -> Updates. (`manager/patching-expert-mode.md` NOTE)
- The settings backup "Sources" section carries "the GitHub token when allowed" (only if
  **Include in settings export** is on; then the JSON contains the token). (`manager/backup-and-keystore.md`)
- The docs **do not say** what the PAT is used for (private repos vs API rate limits) **(not documented)**.
  Safe documented fallback for a private bundle: **local `.mpp` source**, or a remote JSON metadata
  URL we host (its `download_url` must be reachable by the phone).

### Pre-releases
- Per-source **Pre-release patches** toggle (only on sources that publish pre-releases). Distinct
  from the app-wide "Pre-release updates" setting (Morphe app itself). **Experimental app versions**
  toggle requires pre-release on for remote sources. (`manager/patch-sources.md`)
- Template: `dev` branch releases are pre-releases; users get them via the pre-release toggle.
  (`template/README.md`, `.releaserc`)

### Root mount vs non-root (`manager/installers.md`)
- Installers: System (default, confirmation tap), Root install, Shizuku/Sui, third-party.
  "Install as Play Store" option (then turn off Play updates). Auto-uninstall on conflict (Shizuku,
  erases data). "Install anyway" (root, needs a signature-verification-bypass module).
- Root mount is a **patch mode chosen before patching** (Standard / Root mount / Ask every time);
  cannot be changed after patching. Stock app stays installed (you **do** install the original APK),
  patched APK is bind-mounted. Keeps data, no GmsCore needed, survives reboot via a Magisk-style
  module. Branding (custom icon/name) does not apply. Stock version must match exactly.
  KernelSU/APatch: disable module unmounting/hiding for the app, or use NoMount 2.2.0+.
- Standard mode = "patches as a normal APK with GmsCore support".

### Keystore / backups (`manager/backup-and-keystore.md`)
- Manager signs every build with a keystore generated on first use (alias and password `Morphe`).
  Same keystore = in-place updates keep data; new keystore (reinstall/clear data) = signature
  conflict, uninstall needed. Export via Settings -> Signing key; import **before** patching on a
  new device. Root-mount apps unaffected.
- Settings backup `morphe_manager_settings.json` (Appearance, Home screen, Patching and installing,
  Updates, Sources, Patch selections); Replace or Merge. Keystore not included.
- **Desktop CLI and Manager use different keystores unless we import the same one** - a build from
  one will not update an install from the other (inference from the signing rules above).

### Updating patched apps (`manager/updating-patched-apps.md`)
- Update mark = newer patches **with changes for this app** (Manager reads the source changelog) or
  a newer supported app version. Repatch reuses saved original APK and saved selection/options.
- "Moving to a newer app version" behaves like a first patch (needs new APK); "Ignore" skips one version.
- Info dialog shows "Patch source used" and "Applied patches".

### Universal patches
- Only mention: Home screen **Select other apps** (Expert mode only) patches any APK/installed app;
  "only makes sense with universal patches, or with a source that declares support for it".
  (`manager/home-screen.md`)
- Patcher side: a patch without `compatibleWith` is compatible with any package. (`patcher/2_2_patch_anatomy.md`)
- How Manager lists universal patches next to app-specific ones for YT Music is **not documented**.
  Note: an unscoped patch of ours would show up for every app; always scope ours with
  `compatibleWith(COMPATIBILITY_YT_MUSIC)`.

### Patch selection defaults (`manager/patching-expert-mode.md`, `manager/storage-and-saved-data.md`)
- Simple mode applies the recommended (`default = true`) set; Expert mode starts from the saved
  selection, else recommended. "Enable recommended patches", "Restore saved selection",
  "Copy selection from another bundle", "Enable all" (warned: conflicts), "Disable all".
- Saved selections are per app **per source**, survive uninstalling the patched app, can be
  exported/imported/reset under Settings -> Patch selections (Expert mode).
- Patches can be grouped into categories (sectioned list) if the source declares categories
  (how to declare them is **not documented** here). "Clone" badge = patch changes the package name.

### Other Manager facts
- Patching needs >= 1 GB free storage; runs in a separate process; embedded JVM (default) gets 1-3 GB.
  OOM: fewer sources/patches. Split APKs (APKM/APKS/XAPK) merged first, less reliable than full APK.
  "Optimize for device architecture" output is device-specific. (`manager/patching-process.md`, `manager/patching-expert-mode.md`)
- Manager verifies package, version and **signing certificate** of the input APK against what the
  bundle declares (helper flow: needs Android 11+ and declared signatures). (`manager/patching-simple-mode.md`, `manager/apk-download-helper.md`)
- Branding/header creators write `morphe_icons_music` / `morphe_header_music` (YT Music has a single
  dark header). (`manager/custom-app-icon.md`, `manager/custom-header-logo.md`)
- Batch intent: `app.morphe.manager.action.BATCH_PATCH` with `--esa packages ...`, needs
  "Allow external triggers"; always ends at a confirmation/preflight. (`manager/batch-patching.md`)

---

## 8. Release / signing workflow (template)

- Build locally: `./gradlew buildAndroid` -> `patches/build/libs/patches-*.mpp`; apply with Morphe
  Desktop like any bundle. Requires GitHub Packages auth even for public packages: PAT with
  `read:packages` in `~/.gradle/gradle.properties` (`gpr.user`, `gpr.key`) or `GITHUB_ACTOR` +
  `GITHUB_TOKEN` (`gh auth login --scopes read:packages; export GITHUB_TOKEN=$(gh auth token)`).
  (`patcher/2_1_setup.md`, `template/settings.gradle.kts`, `template/README.md`)
- Gradle plugin `app.morphe.patches` (template pins 2.1.0); `patches { about { name, description,
  source, author, contact, website, license } }` in `patches/build.gradle.kts`. (`template/settings.gradle.kts`, `template/patches/build.gradle.kts`)
- `release.yml`: on every push (and manual dispatch) runs semantic-release (Java 21, Node LTS) with
  `GITHUB_TOKEN` and `MORPHE_SIGNING_KEY`; attests `patches-*.mpp` build provenance when a release is
  published; otherwise just verifies `./gradlew :patches:buildAndroid`.
- `.releaserc`: branches `main` (stable) and `dev` (prerelease). Conventional commits:
  `feat` -> minor, `fix`/`perf`/`bump` -> patch, breaking -> major, `build(Needs bump)` -> patch;
  `chore` no release. Plugins: commit-analyzer, release notes, `@MorpheApp/changelog` writing
  `patches-bundle.json` (download URL `https://github.com/${owner}/${repo}/releases/download/v${version}/patches-${version}.mpp`,
  `publicKeyPath: morphe-signing.pub`), gradle-semantic-release-plugin, `generatePatchesList` +
  README patch list generation, git commit of CHANGELOG.md, gradle.properties, patches-bundle.json,
  patches-list.json, README.md (`[skip ci]`), GitHub release uploading the `.mpp` (and `.asc`),
  back-merge `main` -> `dev`.
- `open_pull_request.yml`: on push to `dev`, opens a `dev` -> `main` PR (needs "Allow GitHub Actions to
  create and approve pull requests").
- Workflow rules (`template/README.md`): work on `dev`; merge (not squash) dev into main for stable;
  never hand-create releases or hand-edit `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`;
  never force-push release commits; create a new release instead of fixing a broken one; when creating
  the repo from the template enable "Include all branches".
- Optional release signing: `./gradlew generateSigningKey` -> `morphe-signing.pub` (commit) and
  `morphe-signing.key` (never commit; put content in `MORPHE_SIGNING_KEY` secret, back it up, delete
  file). Manager then refuses a changed/swapped release; a new key requires users to confirm it in Manager.
- Optional `patches-bundle.png` for a custom source icon in Manager. Name must not imply authorship by
  the Morphe project (see NOTICE).

---

## 9. Gotchas

1. **Simple mode uses one source per app.** Our bundle + official together needs Expert mode, and
   Manager warns/asks to confirm mixed-source selections every time.
2. **No documented cross-bundle API.** `dependsOn` only works on patch objects we compile; we cannot
   depend on, or order ourselves relative to, official patches. Order between unrelated patches is not
   guaranteed.
3. **Shared methods**: if the official bundle edits the same method, our indexes may be stale. Call
   `clearMatch()` before using match indexes, prefer hook points they don't touch.
4. **Patcher version mixing**: 2.0.0 resource-on-demand requires *every* bundle to be 2.0.0+; exact
   string matching/retrying applies if *any* is. Build against the same patcher as the official bundle.
5. **Private repo in Manager**: a GitHub PAT setting exists (Expert mode -> Updates), but its use for
   private repos is undocumented. Local `.mpp` is the documented route; updates recognised by bundle
   name.
6. **Unnamed patches are invisible** (not loaded by PatchLoader); they run only as dependencies.
7. **Keystore mismatch** between Desktop CLI builds and Manager builds (and after reinstalling
   Manager) blocks in-place updates. Decide one keystore and back it up.
8. **Root mount**: pick the mode before patching; stock YT Music must be installed at the exact version;
   branding options ignored.
9. **Registers**: non-range invoke only takes v0-v15; use `/range` or `registersUsed`, get temps from
   `findFreeRegister`, never assume `v0` is free mid-method.
10. **`addInstructions` at a branch target** lands after the label; use
    `addInstructionsAtControlFlowLabel` if the branch must run our code.
11. **Raw `strings = listOf(...)` must be exact** since 2.0.0.
12. **Resources aren't decoded until asked**: `decode(glob)` before walking `res/` dirs.
13. **Always scope with `compatibleWith`**: without it the patch is "universal" and offered for every app.
14. **`apkFileType` must match APKMirror's file type** or Manager won't link users to the download.
15. **Template bug to fix when copying**: `ExamplePatch.java` is in package
    `app.template.extension.extension` but `ExamplePatch.kt` references `Lapp/template/extension/ExamplePatch;`.
    The descriptor must match the real Java package. Use our own unique extension package.
16. **GitHub Packages auth** (`read:packages`) is needed even to build.
17. **Don't hand-edit generated release files** or force-push release commits.
18. **Keep Morphe's "Disable DRC audio" on**: addon levels are measured against the non-DRC stream, so with DRC the addon plays quieter than YouTube. Our extension switches it on once at first start (`Features.drcOffOnce`); a user who turns it off keeps it off.
