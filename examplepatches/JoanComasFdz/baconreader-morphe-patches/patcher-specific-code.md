<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Patcher-specific: code (Morphe)

How patch and extension code is written for Morphe in this repo. The shared rules are in [STYLE.md](STYLE.md).

## Layout

```text
patches/src/main/kotlin/io/github/joancomasfdz/patches/
  shared/Constants.kt          compatibility: packages, app names, pinned version
  baconreader/<area>/[<feature>/]
    <Name>Patch.kt             one patch per file
    Fingerprints.kt            the fingerprints of the patches in the folder
  baconreader/misc/extension/  sharedExtensionPatch, stringsResourcePatch, EXTENSION_PACKAGE
  baconreader/misc/settings/   settingsPatch, markPatchIncluded
patches/src/main/resources/baconreader/strings.xml
                               the strings of the patches and their settings
extensions/baconreader/src/main/java/io/github/joancomasfdz/extension/baconreader/<feature>/
                               Java added to the app, one package per feature
extensions/baconreader/stub/   stand-ins for BaconReader classes the extension compiles against
extensions/shared/             bundles Morphe's extensions library as extensions/shared.mpe
```

- Areas: `api` (Spoof client), `fix/<feature>`, `inbox` (Reddit chat), `layout/<feature>`, `misc/<feature>`.
- The extension's root package holds the helpers several patches use (`GlideUtils`, `ImageDownloader`, `DownloadProgress`) and a few patch classes (`FixListThumbnailsPatch`, `FixRedgifsApiPatch`, `TextPostIconPatch`). `errors/ErrorDialog` and `settings/` are shared too. There is no separate common module.
- Patch packages are `io.github.joancomasfdz.patches.baconreader.<area>[.<feature>]`, extension packages `io.github.joancomasfdz.extension.baconreader[.<feature>]`. Stubs use BaconReader's packages.
- A patch's ID is its `name`. Morphe has no other ID: Morphe Desktop saves options as `<patch name>.<option key>`, and also remembers selected patches by name, packages and description. Package and property names don't affect saved options.
- Users' settings are stored under their keys (`revanced_baconreader_*`). Don't rename a patch, an option key or a settings key after a release.

## Patches

```kotlin
private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/<feature>/<Name>Patch;"

// Why the patch exists: what broke, or what the app does that it shouldn't.
@Suppress("unused")
val fixSomethingPatch = bytecodePatch(
    name = "Fix something",
    description = "Fixes something not loading.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch)

    val option = stringOption(key = "...", default = "...", title = "...", description = "...")

    execute {
        markPatchIncluded("fixSomething")

        // Why this edit, when the code doesn't say.
        SomethingFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onSomething(Ljava/lang/Object;)V",
        )
    }
}
```

- **Name:** what users see, in sentence case. It is the patch's ID.
- **Description:** one sentence. Long ones are split with `+`.
- **Property:** a public `val <name>Patch` with `@Suppress("unused")`. Morphe finds patches by reflection.
- **Internal patches** (`sharedExtensionPatch`, `stringsResourcePatch`, `settingsPatch`, Reddit chat's `chatIconResourcePatch`) are `internal` or `private` and have no `name`. Morphe doesn't list a patch without a name; it only runs as a dependency.
- **Order inside the block:** `compatibleWith`, `dependsOn`, options, then `execute`.
- **Compatibility:** always `compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)` from `shared/Constants.kt`. Each is a `Compatibility` with the package, the launcher name, `ApkFileType.APK`, the icon color `0xF26522` and one `AppTarget(version = "6.1.4")`.
- **Dependencies:** `sharedExtensionPatch` for any extension call, `settingsPatch` for settings. A patch can depend on another named patch: Embed comment images depends on `fixImgurApiPatch`.
- **Fixes have no setting.** The patches under `fix/` run always.

## Fingerprints

- Fingerprints live in `Fingerprints.kt` in the patch's folder. Each patch folder has its own, even for a method another folder also uses (`CommentHolderUpdateViewFingerprint` is in four folders).
- `internal object <Class><Method>Fingerprint : Fingerprint(...)`, one method each. Name it after the app's class and method: `SetPostStatusFingerprint`, `MainActivityOnResumeFingerprint`.
- Match by `definingClass` (a descriptor, `"Lcom/onelouder/baconreader/...;"`), `name`, `returnType` and `parameters`. BaconReader isn't obfuscated.
- Add `filters` to find the instruction to edit, or the method when its name is shared: `string(...)` (`StringComparisonType.CONTAINS` for part of a string), `methodCall(...)`, `fieldAccess(...)`, `opcode(...)`, with `location = MatchAfterWithin(n)` or `MatchAfterImmediately()`.
- Matched by strings alone when the class is anonymous: Spoof client's `GetAuthorizationUrlFingerprint`, Show request errors' `runTask`.
- Class descriptors several fingerprints use are constants in the same file (`MESSAGE_CLASS_DESCRIPTOR`). Filters several fingerprints repeat are a private function (`addFeed`, `addSetting`).
- In the patch, `instructionMatches[i].index` places the edit and `getInstruction<FiveRegisterInstruction>(index).registerC` gives its registers.
- Prefer high-level edits: an extension call added at the start or after the matched instruction; `addInstructionsWithLabels` with `ExternalLabel("original", getInstruction(0))` to skip the app's code when the extension handled it; `returnEarly(...)` (`app.morphe.util`) for a constant return. Raw smali (`replaceInstructions`, `removeInstructions`, `"nop"`) is used where ReVanced does: Fix Redgifs API, Fix Imgur API, Remove awards, Remove Random feeds.

## Options and settings

- Options are values chosen once, before patching: `stringOption(key, default, title, description, required)`. Spoof client is the only patch with options. Its description strings are one line.
- An option that may be empty is read with `value?.takeIf { it.isNotBlank() }`, and the patch skips the change when it's null. Say so in its description.
- Settings are in `settings/Settings.java`, `Settings extends BaseSettings` (Morphe's extensions library): `BooleanSetting`, `IntegerSetting` and `StringSetting`, grouped by patch under a comment.
- Keys are ReVanced's, `revanced_baconreader_<name>`, so they are not renamed.
- `parent(SETTING)` and `parentNot(SETTING)` grey a setting out while its parent is off (or on). They only affect the screen.
- A setting that isn't shown passes `false, false` (no restart, no export): `OPEN_LINKS_PROMPT_SHOWN`.
- Strings are in `patches/src/main/resources/baconreader/strings.xml`. `stringsResourcePatch`, a dependency of `sharedExtensionPatch`, appends them to the app's `res/values/strings.xml`. The extension reads them with `StringRef.str(key, args...)`.
- A setting's strings are named after its key: `<key>_title`, then `<key>_summary_on` and `<key>_summary_off` for a switch, `<key>_summary` for text, `<key>_entry_0`, `_entry_1`... for a list.
- Sections are `revanced_settings_baconreader_screen_<n>_<name>_title`.

### Add a patch's settings

1. The settings in `Settings.java`, under a `// <Patch name>.` comment.
2. A method in `settings/IncludedPatches.java` that returns `false`: `public static boolean userAvatars()`.
3. The preferences in `settings/BaconReaderPreferenceFragment.java`, in their section, inside `if (IncludedPatches.userAvatars())`: `switchPreference`, `listPreference(context, setting, entryCount)`, `multiLineTextPreference`, `textPreference` (title and summary only), or `addCustomPreference` with the class name of a `Preference` that saves its setting itself (`CommentLimitPreference`, `OpenLinksPreference`).
4. Their strings in `strings.xml`.
5. In the patch, `dependsOn(sharedExtensionPatch, settingsPatch)` and, first in `execute`, `markPatchIncluded("userAvatars")`, which makes that method return `true`. A section without settings is removed from the screen.

`settingsPatch` adds the "Patches" entry and the drawer's version footer. It has no name: patches with settings bring it.

## Extensions

- **Java.** Bundled as `extensions/baconreader.mpe`. Compiled against Morphe's extensions library, `androidx.annotation`, okhttp 4.12.0 and the stubs, all `compileOnly`.
- **Loading:** `sharedExtensionPatch` in `misc/extension` wraps the library's `sharedExtensionPatch("baconreader", activityOnCreateExtensionHook("Lcom/onelouder/baconreader/BaconReader;"))`, which adds `shared.mpe` and `baconreader.mpe` and passes the context to `Utils`. It also calls `ErrorDialog.init` in `BaconReader.onCreate`, sends Morphe's `Logger.printException` to `ErrorDialog`, and depends on `stringsResourcePatch`. Every patch with extension code depends on it.
- **Descriptor:** each patch file declares `private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/<feature>/<Name>Patch;"`, with `EXTENSION_PACKAGE = "Lio/github/joancomasfdz/extension/baconreader"` from `misc/extension`.
- **Calls:** smali strings, `invoke-static { p0, v$register }, $EXTENSION_CLASS_DESCRIPTOR->method(Ljava/lang/Object;Landroid/widget/TextView;)V`, then `move-result` for a return value.
- **Extension classes:** `<Name>Patch`, `final` with a private constructor, `@SuppressWarnings("unused")`. Each method a patch calls is `public static`, and its Javadoc says where it's injected.
- **App objects** are passed as `Object` and read with reflection (`getDeclaredField`, `setAccessible(true)`), or as a stub type.
- **Errors:** catch and `ErrorDialog.printException(() -> "Could not ...", ex)`. Logging: Morphe's `Logger.printInfo` and `Logger.printDebug`.
- **Morphe's library:** `Utils.getContext()`, `StringRef.str(...)`, `ResourceUtils.getIdentifier(ResourceType.ID, name)` for the app's resources, and the settings classes.
- **Images in the app's resources:** a `resourcePatch` writes `res/drawable/<name>.xml` with `get(path, copy = false)`, and the extension finds it by name (Reddit chat's icon).
- **Stubs:** `extensions/baconreader/stub`, an Android library the extension only compiles against. BaconReader's packages, only the members the extension uses, empty bodies.
- **Only public classes and members.** The extension's package is outside BaconReader's, so Android throws `IllegalAccessError` for a member that isn't public, or protected and inherited. A stub compiles whatever it declares. Use reflection for the others: `DrawerVersionFooter` reads the private `DrawerHandler.listView`.

## Formatting

- Kotlin: `.editorconfig` sets `ktlint_code_style = intellij_idea` and allows wildcard imports; `gradle.properties` sets `kotlin.code.style = official`.
- Java: no formatter or config. The code uses 4 spaces and puts `import static` first.
- No ktlint, ktfmt or Spotless task is configured, and CI doesn't check formatting. `./gradlew buildAndroid` is the only check, so AGENTS.md's step 7 is: the changed files keep this style.

## Licensing

- The Morphe template's files and the Gradle wrapper keep their licenses; `REUSE.toml` lists them. The template's `NOTICE` terms (the name "Morphe") stay.
