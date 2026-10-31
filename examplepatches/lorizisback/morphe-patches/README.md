# Local Android Patches

A local Kotlin patch project for use with [Morphe](https://github.com/MorpheApp), created from the [official patches template](https://github.com/MorpheApp/morphe-patches-template) at commit `e721536ab19e30d16ce9d31ae1830ca299aad383`.

[Curve patches](docs/curve-hide-flex.md) target Curve Pay 5.63.0: Hide Flex, a dedicated Patches screen with Flex and Launchpad tile controls, optional telemetry suppression, plain-language copy through Remove Cringe, and optional acceptance of any APK signing certificate during local startup checks. The bundle supports Curve only; the template test app is no longer included.

## Install through Morphe Manager

After the first GitHub release, [add this patch source to Morphe](https://morphe.software/add-source?github=lorizisback/morphe-patches&app=com.imaginecurve.curve.prd), or enter `https://github.com/lorizisback/morphe-patches` under **Sources → + → Remote**. Use the source's Update button to fetch new bundles. Updating the source downloads patches; apply them to the supported Curve APK and install the rebuilt app to update Curve. Keep using Morphe's existing signing key.

See [publishing instructions](docs/publishing.md) to upload this project and publish the first release. The source is not available until you do that.

## Build

Use JDK 21, Android SDK platform 36, and Build Tools 36.0.0. These are installed on this Mac. The Gradle wrapper supplies Gradle; the template pins the Morphe plugin and patcher to 2.0.0.

```sh
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export PATH="$JAVA_HOME/bin:$PATH"

# The template uses GitHub Packages, including for public dependencies.
export GITHUB_ACTOR="$(gh api user --jq .login)"
export GITHUB_TOKEN="$(gh auth token)"

./gradlew clean build buildAndroid --no-daemon
```

On another machine, set the Java and SDK paths to their installed locations. The local `local.properties` SDK path is ignored by Git. GitHub authentication needs package-read access; if dependency resolution returns an authentication error, run `gh auth refresh --scopes read:packages` and refresh the environment variables. Credentials also work through `gpr.user` and `gpr.key` in user-level `~/.gradle/gradle.properties`. Keep credentials outside this repository.

The Android patch bundle is written to `patches/build/libs/patches-1.0.0.mpp`. It contains JVM patch classes, Android DEX, and the runtime extension at `extensions/extension.mpe`. A build verifies compilation and packaging. See the [Curve test instructions](tests/README.md) for bytecode and native-screen checks.

## Development

- Patch code: `patches/src/main/kotlin/app/local/patches/curve`.
- Runtime extension: `extensions/extension/src/main/java/app/local/extension/curve`.
- Bundle identity: `patches/build.gradle.kts`. Repository and issue links target `lorizisback/morphe-patches`.
- Research and installed-tool details: [workspace setup](docs/workspace-setup.md).
- Original template instructions and release workflow: [template guide](docs/template-guide.md).

The local task branch is `codex/curve-hide-flex`, based on the official template's stable `main` with the earlier setup and emulator changes preserved. The `template` remote identifies the upstream source. A local `dev` branch also tracks the template's development branch. The release destination is `lorizisback/morphe-patches`. Follow the required three-reviewer development loop for code changes.

Keep the template's semantic-release workflow for future publication. Do not hand-edit generated `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md`.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/lorizisback/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Curve Pay&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 5.63.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Accept any signing certificate](#accept-any-signing-certificate) | Disables Curve's local signing-certificate mismatch check so any APK signing key can be used. Other device checks, login and server integrity remain unchanged. |  |
| [Batch Go Back in Time](#batch-go-back-in-time) | Adds Batch GBIT to Launchpad. Select purchases, choose one funding card and follow sequential moves in a foreground progress notification. Curve eligibility and fees still apply. |  |
| [Disable optional telemetry](#disable-optional-telemetry) | Disables known analytics, marketing, crash and performance reporting. Removes Braze promotions and attribution. Account, payment, security and support services still communicate with their servers. |  |
| [Hide Flex](#hide-flex) | Hides Flex cards, promotions, transaction actions, settings and navigation. Does not cancel Flex or change the payment source. |  |
| [Patches menu](#patches-menu) | Adds Patches settings for Hide Flex and hiding selected Launchpad tiles. |  |
| [Remove Cringe](#remove-cringe) | Plain feature names and copy in English, German, Spanish, French, Italian, Lithuanian and Norwegian. Adds an optional switch in Patches. Keeps Go Back in Time, Magic link, Fronted and Flex. |  |

</details>

<!-- PATCHES_END -->

## License

The template code retains its [GPLv3 license](LICENSE) and [NOTICE](NOTICE). Local Android Patches is independent of the Morphe project.
