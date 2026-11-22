# Moon Reader Regional Patches

A small patch bundle compatible with **Morphe Manager**, for the regional Moon+ Reader Pro APK distributed for Russian and Belarusian users. This is an independent project, not affiliated with Morphe or Moon+ Reader.

The single patch, **Remove regional and expiration restrictions**, makes the device-locale check and the fixed-expiration check take their existing acceptance branches. It adds no code to the reader, no network requests, and no third-party promotion.

## Add it to your phone

1. Install or update [Morphe Manager from its official releases](https://github.com/MorpheApp/morphe-manager/releases).
2. In Manager open **Sources → + → Remote** and enter:

   ```text
   https://github.com/salihefee/moonreader-regional-patches
   ```

   Alternatively, [open this Add source link on your phone](https://morphe.software/add-source?github=salihefee/moonreader-regional-patches&app=com.flyersoft.moonreaderp).
3. Download the original regional APK from the publisher's [Moon+ Reader download page](https://moondownload.com/). Find the section **For Russian & Belarusian paid users who can't get the app from GooglePlay** and select:

   * **`mrp_ru_arm64.apk`** (shown as 28 MB) for an ARM64 device; this is the variant tested with this patch.
   * **`mrp_ru_universal.apk`** (shown as 38 MB) if you need the universal variant. This variant has not been tested here.

   Save the APK without installing it. The filenames and sizes above identify the links in that section; the publisher may update the files and sizes later. The page provides this regional download for existing paid Pro users.
4. Return to Manager and open **Moon+ Reader Pro (regional build)**. Select **10.8**, then **No, I already have an APK**, and choose the APK you just downloaded. Manager's **Help me find an APK** button uses its own download lookup; use the official page above for this regional build.
5. Apply **Remove regional and expiration restrictions**, then install the result. In Expert mode, check the patch selection before pressing **Patch**.

You can also download `moonreader-regional-patches-1.0.1.mpp` from [Releases](https://github.com/salihefee/moonreader-regional-patches/releases/latest), copy it to Downloads, and use **Sources → + → Local** to import it.

**Back up reader settings and annotations before switching builds.** Manager signs its output with its own key. It usually cannot update an app signed by the developer, another patcher, or the earlier PC-generated APK; uninstalling that copy can erase its app data. Keep Manager's signing key backed up for future updates.

See the official [patch-source instructions](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) and [patching guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md).

## Compatibility and future versions

* Target package: `com.flyersoft.moonreaderp`.
* Tested patching input: regional **10.8 ARM64** APK, SHA-256:

  ```text
  5f0a6eddb5f8beb9c465426168f5217a132762cbeff5d4dfca7be28cfb476c67
  ```

* This patch is for the regional build. The free app, regular Play Store builds, and already-modified APKs are not supported inputs.
* Later versions are declared **experimental**. No byte offsets or expiration dates are hardcoded: the patch finds the restriction messages, locale comparisons, date comparison and acceptance targets.
* If messages or control flow change, it stops with an error. It validates both checks before editing either one. Future compatibility is not guaranteed.
* For a later version, enable the source's **Experimental app versions** option if available and select the experimental/any-version target in Expert mode. If Manager does not offer it, use Morphe Desktop with `--force` to bypass version filtering; the patch's structural checks still run.
* Device launch and on-device Manager import are not automated here. Build/patch validation does not establish behavior on every Android device.

## How it works

The fingerprint restricts matching to `ActivityMain.onCreate(Bundle)` containing both rejection messages. The patch then verifies:

1. Locale country/language reads and `ru`/`be` comparison constants precede the region warning.
2. The comparison result controls a branch around the warning, toast, `finish()` and return.
3. The expiration warning follows `Date.after(Date)`, its result, and a branch around another rejection block.

Only the first regional acceptance branch and the expiration acceptance branch are changed into unconditional `goto/16` jumps to the same targets. Other comparisons, resources and libraries are not intentionally modified. Morphe handles DEX rebuilding and APK signing.

## Build locally

Requirements: JDK 21 or newer, an Android SDK with Build Tools 35.0.0, and Internet access on the first build. No GitHub personal access token is required.

```sh
export ANDROID_SDK_ROOT=/path/to/android-sdk
./gradlew :patches:test :patches:buildAndroid
```

Output:

```text
patches/build/libs/moonreader-regional-patches-1.0.1.mpp
```

The build downloads the public Morphe Desktop 2.2.0 release, checks its pinned SHA-256, and uses its bundled Morphe Patcher 2.4.0 API as a compile-only dependency. Only this project's patch classes and their DEX are packaged in the `.mpp`; the Desktop JAR is not included. This standalone build avoids GitHub Packages authentication required by the upstream Gradle plugin. The Gradle wrapper and project scaffolding originated from the [official patches template](https://github.com/MorpheApp/morphe-patches-template); the patch implementation is in [RegionalRestrictionsPatch.kt](patches/src/main/kotlin/local/moonreader/patches/RegionalRestrictionsPatch.kt).

To patch locally using the downloaded tool:

```sh
java -jar tools/morphe-desktop-2.2.0-all.jar patch \
  --patches patches/build/libs/moonreader-regional-patches-1.0.1.mpp \
  --validate \
  --out moonreader-patched.apk \
  /path/to/original-regional.apk
```

Unit tests cover normal matching, shifted code with a later cutoff, rejection of changed date logic, a missing message, and already-patched input. The supplied regional APK is also checked locally using Morphe Desktop; it is not distributed in this repository.

## License

GPL-3.0, with the inherited Morphe project-name notice. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
