# Morphe patch development workspace

This is the preparation snapshot saved before the official template was imported. See the [project README](../README.md) for the current project and build commands. The upstream sample defects described below have been corrected in the local project.

Preparation reference, checked on 29 October 2026. The local Android toolchain is installed and smoke-tested. This workspace is ready for choosing a target app and designing a patch; it does not yet contain a Morphe patch project or target APK.

## Skills available here

| Skill | Status |
| --- | --- |
| Caveman | Already installed at `/Users/mastergluteus/.agents/skills/caveman`; available in this project. |
| Ponytail | Already installed through the Ponytail plugin, version 5.3.2; full mode applies. |
| i-have-adhd | Installed locally at `.agents/skills/i-have-adhd`; available through skill discovery on the next turn. Invoke with `$i-have-adhd`. |

The local skill came from [ayghri/i-have-adhd](https://github.com/ayghri/i-have-adhd/tree/1ecea1993b7fce257ffbd686c070948b5e07eda6/skills/i-have-adhd), commit `1ecea1993b7fce257ffbd686c070948b5e07eda6`. Existing skills were reused rather than duplicated. This folder was empty and was not a Git repository when preparation began.

## Ecosystem and versions

Morphe is an independent Android patching project based on prior ReVanced work. Its current APIs must be checked independently of ReVanced tutorials. The old `morphe-cli` repository redirects to Morphe Desktop.

| Component | Role | Stable release checked |
| --- | --- | --- |
| [Manager](https://github.com/MorpheApp/morphe-manager) | Android app for selecting, applying, signing, and installing patches | [2.2.0](https://github.com/MorpheApp/morphe-manager/releases/tag/v2.2.0) |
| [Desktop](https://github.com/MorpheApp/morphe-desktop) | Desktop GUI and CLI; Java 21 or newer | [1.19.1](https://github.com/MorpheApp/morphe-desktop/releases/tag/v1.19.1) |
| [Patcher](https://github.com/MorpheApp/morphe-patcher) | Kotlin library for modifying DEX bytecode and APK resources | [2.0.1](https://github.com/MorpheApp/morphe-patcher/releases/tag/v2.0.1) |
| [Official patches](https://github.com/MorpheApp/morphe-patches) | Official collection, including YouTube, YouTube Music, and Reddit | [1.48.0](https://github.com/MorpheApp/morphe-patches/releases/tag/v1.48.0) |
| [MicroG-RE](https://github.com/MorpheApp/MicroG-RE) | GmsCore fork needed by some patched Google apps and installation modes | [7.2.2](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.2.2) |

A custom bundle can target other Android apps. A patch bundle is an `.mpp` file, applied to an original APK to produce a patched APK. Runtime extension classes are compiled into `.mpe` files and included by the patch bundle. MicroG is not a general requirement for every custom patch.

Versions above are a dated snapshot. Pin the template, plugin, patcher, Desktop, bundle, and target APK before implementation. A newer bundle may require a newer frontend patcher.

## Authoring baseline

Start with the [official patches template](https://github.com/MorpheApp/morphe-patches-template). The inspected template pins patcher and patches Gradle plugin **2.0.0**, even though patcher **2.0.1** is released. Keep the template's compatible dependency set initially.

- Project identity and bundle metadata live in `patches/build.gradle.kts`.
- Kotlin patch code lives under `patches/src/main/kotlin`; runtime extension code lives under `extensions`.
- Build with `./gradlew buildAndroid`; the bundle is written to `patches/build/libs/patches-*.mpp`.
- Reuse the template's Gradle wrapper and release workflow. Standalone Gradle and Kotlin installations are unnecessary.
- When publication is requested, preserve semantic release and generated metadata. Do not hand-edit generated `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md`.

The template develops on `dev` and releases stable versions from `main`. For this user's workflow, create `codex/` task branches from the appropriate development base, preserve the complete task diff, and follow the required three-reviewer development loop. Publication requires explicit authorization.

Sources: [template instructions](https://github.com/MorpheApp/morphe-patches-template/blob/main/README.md), [version catalog](https://github.com/MorpheApp/morphe-patches-template/blob/main/gradle/libs.versions.toml).

## Patch design

Use the smallest suitable patch type: `bytecodePatch` for behavior, `resourcePatch` for decoded resources, or `rawResourcePatch` for raw files. Declare package and version compatibility with `Compatibility` and `AppTarget`, dependencies with `dependsOn`, and changes inside `execute`. Use extensions only when runtime logic warrants them; `extendWith(...)` merges their DEX classes before patch execution.

Identify obfuscated methods using `Fingerprint(...)` and stable evidence: strings, literals, method calls, field access, types, and instruction filters. Prefer exact, unique matches to hard-coded obfuscated names or loose opcode sequences. Validate against every supported APK version. Missing or ambiguous targets should fail clearly rather than modify an arbitrary method.

Bytecode changes must respect register availability, wide values, return types, branch labels, and invoke forms. Prefer existing instruction/register helpers. Keep injected smali small. Preserve required side effects when choosing early or late returns. Cached fingerprint instruction indexes can become stale after another edit; order edits carefully and refresh matches when necessary.

Patcher 2.0 uses on-demand resource decoding. Follow the pinned API for `document(...).use`, `get`, `decode`, `listApkEntries`, and `delete`; do not assume every resource has already been decoded. Fingerprint string comparison semantics also changed across versions.

Sources: [patch anatomy](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_patch_anatomy.md), [fingerprints](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md), [advanced APIs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/4_apis.md), [patcher changelog](https://github.com/MorpheApp/morphe-patcher/blob/main/CHANGELOG.md).

## Build environment

Use **JDK 21**, matching template CI, for the first reproducible build. The inspected plugin uses Android SDK platform **36**; AGP 9.1.0 specifies Build Tools **36.0.0**. The template wrapper pins Gradle 9.8.1. Extension Java source/target is 17; that is separate from the JDK used to run Gradle.

Dependencies may require GitHub Packages authentication with `read:packages`. The project reads `gpr.user` and `gpr.key` from user Gradle properties, or `GITHUB_ACTOR` and `GITHUB_TOKEN`. A GitHub CLI login alone does not populate those values. Keep credentials outside the repository and chat.

Installed locally on 29 October 2026:

| Tool | Installed version | Location |
| --- | --- | --- |
| JDK 21 | Homebrew OpenJDK 21.0.13.0.3 | `/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home` |
| Android SDK command-line tools | 22.0, archive 15859902 | `/opt/homebrew/share/android-commandlinetools/cmdline-tools/latest` |
| Android platform | API 36, revision 2 | `/opt/homebrew/share/android-commandlinetools/platforms/android-36` |
| Android Build Tools | 36.0.0 | `/opt/homebrew/share/android-commandlinetools/build-tools/36.0.0` |
| Android platform-tools | 37.0.1 | SDK `platform-tools`; the existing Homebrew ADB is also 37.0.1 |
| JADX CLI and GUI | 1.5.6 | `/opt/homebrew/bin/jadx` and `/opt/homebrew/bin/jadx-gui` |

Homebrew installed the tools and required dependency updates. The required SDK package license was accepted during installation. JDK 21 is registered through `~/Library/Java/JavaVirtualMachines/openjdk-21.jdk`, so `/usr/libexec/java_home -v 21` resolves it. The existing default Java remains version 27.

New interactive zsh shells export `ANDROID_HOME=/opt/homebrew/share/android-commandlinetools`. The only shell-profile change was that export and its comment; the original is backed up at `~/.zshrc.morphe-backup-20261029`. For Morphe builds, select Java 21 explicitly. Run these commands in the build shell, including noninteractive sessions that do not read `.zshrc`:

```sh
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export PATH="$JAVA_HOME/bin:$PATH"
```

Verification passed: JDK 21 compiled Android source targeting Java 17; D8 generated DEX; AAPT2 packaged a temporary APK; zipalign checked its alignment; apksigner verified its v2 signature; APK Analyzer read its package identity. A separate Java-to-DEX-to-JADX round trip recovered the expected method and string. Native AAPT2 and zipalign binaries include Apple Silicon support. Temporary sources, APKs, and the temporary signing key were removed.

JADX's normal first-run settings directory was initialized. Android Studio, an emulator/system image, and external Apktool were not installed. Runtime testing still needs a physical test device or an AVD selected for the target app. A full Morphe Gradle build remains unverified until a patch project and its dependencies are available.

Sources: [template CI](https://github.com/MorpheApp/morphe-patches-template/blob/main/.github/workflows/release.yml), [extension plugin v2.0.0](https://github.com/MorpheApp/morphe-patches-gradle-plugin/blob/v2.0.0/src/main/kotlin/app/morphe/patches/gradle/ExtensionPlugin.kt), [AGP requirements](https://developer.android.com/build/releases/agp-9-1-0-release-notes), [package authentication](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md).

## Development and validation sequence

1. Record the requested behavior, package name, version name/code, APK SHA-256, architecture, and installation mode. Inspect original code with JADX and confirm the relevant DEX instructions.
2. Add the smallest patch and a focused regression check. Build the `.mpp` with the repository wrapper.
3. List bundle patches and compatibility, then apply only the intended patch to a clean original APK. Use fingerprint uniqueness validation and SDK verification.
4. Inspect the output, install on a test device or emulator, exercise the changed behavior, and inspect `adb logcat`. Test relevant app versions and patch combinations.
5. Follow the user's review loop and required automated checks before delivery. A successful build or patch run does not prove correct runtime behavior.

The following commands are reference examples for a future patch project, not commands already run. Set the three paths to actual files/directories first. Flags below are documented in Desktop v1.19.1; inspect the installed version's help when upgrading.

```sh
./gradlew buildAndroid

MORPHE_JAR="/absolute/path/to/morphe-desktop-1.19.1-all.jar"
PATCH_BUNDLE="/absolute/path/to/patches.mpp"
MORPHE_ANDROID_SDK="/absolute/path/to/android-sdk"

java -jar "$MORPHE_JAR" list-patches --patches "$PATCH_BUNDLE" \
  --with-packages --with-versions --with-options

java -jar "$MORPHE_JAR" patch --patches "$PATCH_BUNDLE" \
  --exclusive -e "Patch name" --validate --bytecode-mode FULL \
  --verify-with-sdk "$MORPHE_ANDROID_SDK" -o patched.apk original.apk
```

`--validate` detects ambiguous fingerprint matches; intentional `matchAll()` calls are unaffected. `--verify-with-sdk` checks output integrity. `FULL` is useful for establishing a development baseline and diagnosing missing-class issues. None replaces device testing. See [Desktop v1.19.1 documentation](https://github.com/MorpheApp/morphe-desktop/blob/v1.19.1/docs/documentation.md).

## Compatibility and installation

Repatch from the original APK. Desktop also accepts `.apkm`, `.xapk`, and `.apks` bundles, but split merging adds another possible failure point. Prefer a supported complete APK when available. Treat experimental versions, app A/B tests, and combinations of patch sources as separate validation cases.

Keep the signing keystore stable across updates. A differently signed APK cannot normally update the same installed package; uninstalling to resolve a conflict can lose app data. Desktop and Manager keystores must be coordinated when switching tools. Package renaming and root mounting are distinct installation choices with app-specific consequences. Root mounting requires the matching original app version; decide the mode before patching.

Sources: [keystore guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md), [installers](https://github.com/MorpheApp/morphe-manager/blob/main/docs/installers.md), [patch sources](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md).

## Known source caveats

The [general development guide](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md) explicitly needs modernization. Desktop documentation also contains an old JDK 17 build statement. Prefer pinned build configuration, current source, and installed CLI help over conflicting prose.

The inspected template example is illustrative, not a verified working patch: its Kotlin extension descriptor names `app.template.extension.ExamplePatch`, while the Java package is `app.template.extension.extension`; the injected call also adds a second semicolon. Replace and validate the example when creating the real patch. Sources: [Kotlin example](https://github.com/MorpheApp/morphe-patches-template/blob/main/patches/src/main/kotlin/app/template/patches/example/ExamplePatch.kt), [Java example](https://github.com/MorpheApp/morphe-patches-template/blob/main/extensions/extension/src/main/java/app/template/extension/extension/ExamplePatch.java).

Before distributing a derivative, retain the applicable license notices and use distinct project branding. See the template's [LICENSE](https://github.com/MorpheApp/morphe-patches-template/blob/main/LICENSE) and [NOTICE](https://github.com/MorpheApp/morphe-patches-template/blob/main/NOTICE).

## Next input

Choose the Android app and describe one behavior to change. The implementation stage will then need its exact APK/version and the intended test device or emulator.

No target APK was downloaded or modified, no Morphe patch was built, and no device installation was performed. The temporary Android toolchain smoke tests described above passed.
