# John's Morphe Patches

Custom Morphe patch based on the [official template](https://github.com/MorpheApp/morphe-patches-template). Supports **only the inspected NLZIET 5.15.3 (740503), arm64-v8a APKM** supplied for this work. Android 10+ and a device supporting native picture-in-picture are required.

**Status: bundle compiled, applied and output APK verified; successful use reported by the requester on 6 October 2026.** No ADB-connected device was available to the developer, so this is user-reported testing, not a developer-observed playback/DRM acceptance run. The compatibility entry remains experimental; device/Android version and detailed scenarios were not recorded. Nothing was installed, uninstalled or erased by the developer.

On Home/Recents departure from active **local** playback, the patch requests native Android PiP. Paused, unloaded, destroyed or casting players and non-player destinations do not enter. Only the SDK pause forwarding call is conditional on actual platform PiP mode; normal fragment pause bookkeeping, stop, unload and destroy are retained. Controls are hidden during PiP and original visibility/dimensions restored on return. Back retains NLZIET's normal navigation/cleanup rather than forcing PiP.

## Add to Morphe

**Publishing is not complete yet.** The public repository is
`DigitalPals/johns-morphe-patches`. The following link becomes usable only after
its first stable release has successfully published:

[Add John's Morphe Patches](https://morphe.software/add-source?github=DigitalPals/johns-morphe-patches)

Alternatively, open **Morphe → Sources → + → Remote** and enter
`https://github.com/DigitalPals/johns-morphe-patches`.
For a `dev` prerelease, enable prereleases in this source's settings.

Releases distribute patch bundles, not the NLZIET APK or a signing key. Supply
your own original supported APKM and sign in with your own subscription.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/DigitalPals/johns-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 NLZIET&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;5.15.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NLZIET native picture-in-picture](#nlziet-native-picture-in-picture) | Enable Android PiP on Home/Recents during active local playback. Experimental until device playback is verified. |  |

</details>

<!-- PATCHES_END -->

## Publishing and contributions

See [repository setup and release verification](docs/hosting.md) for the
one-time setup, branch/release process and checks before sharing the source.
Develop through reviewed feature pull requests to `dev`; the template publishes
prereleases from `dev` and stable releases from `main`.

## Build

Java 21, Python 3 and an internet connection are needed. The standard template build is:

```sh
# Configure GitHub Packages read access as described in the official Morphe docs.
# Keep credentials outside the repository, in ~/.gradle/gradle.properties.
# Install Android SDK platform 36 and set ANDROID_HOME (or local.properties sdk.dir).
./gradlew buildAndroid
```

The standard build could not resolve `app.morphe.patches:1.3.4` without GitHub Packages access on this computer. The verified public-release fallback requires no credentials:

```sh
sudo apt-get install -y openjdk-21-jdk-headless python3 unzip
./scripts/build-public.sh
```

This builds the **same source** into a JVM+DEX Morphe `.mpp` with the runtime DEX at `extensions/extension.mpe`. It uses pinned, SHA-256-checked public releases: Morphe Desktop 1.18.1 (includes patcher 1.15.1), Kotlin 2.4.10, R8 9.5.22 and Android SDK platform/build-tools 36. Downloads are cached under `~/.cache/nlziet-pip-tools`; override with `NLZIET_TOOL_CACHE`. The output is `patches/build/libs/patches-1.0.0.mpp`. The fallback produces the template's bundle format but does not run the inaccessible Gradle plugin; it is not a claim that the standard Gradle build passed. JAR timestamps and a newly generated signing key can vary, so reproducible here means repeatable commands, not byte-for-byte signed outputs.

## Apply to the supplied archive

Copy the original archive to a writable directory first: Desktop's split merger extracts beside its input. Never edit the original in Files.

```sh
mkdir -p build/input
cp /path/to/original.apkm build/input/nlziet-5.15.3.apkm
java -Xmx2g -jar ~/.cache/nlziet-pip-tools/morphe-desktop-1.18.1-all.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --bytecode-mode FULL \
  --out build/nlziet-5.15.3-native-pip.apk \
  --result-file build/patch-result.json \
  --temporary-files-path build/patch-tmp \
  build/input/nlziet-5.15.3.apkm
```

Desktop merges all supplied configuration splits into one APK and signs it. There are no auth, entitlement, DRM or package-name changes in this patch. It checks package, version name and version code itself, even with CLI `--force`, and aborts on missing/ambiguous inspected targets or an already patched input. Do not use `--continue-on-error` to produce an APK with a failed PiP patch.

## Verify

```sh
sudo apt-get install -y apktool adb
export ANDROID_HOME="$HOME/.cache/nlziet-pip-tools/sdk"
./gradlew -p tests/runtime test --no-daemon
unzip -p build/input/nlziet-5.15.3.apkm base.apk > build/input/base.apk
apktool d -f build/input/base.apk -o build/original-decoded
apktool d -f build/nlziet-5.15.3-native-pip.apk -o build/verified-apk
python3 tests/verify_apk.py build/verified-apk
python3 tests/verify_preservation.py build/original-decoded build/verified-apk \
  build/input/nlziet-5.15.3.apkm build/nlziet-5.15.3-native-pip.apk
./scripts/test-rejections.sh build/nlziet-5.15.3-native-pip.apk
"$ANDROID_HOME/build-tools/android-16/apksigner" verify --verbose build/nlziet-5.15.3-native-pip.apk
"$ANDROID_HOME/build-tools/android-16/zipalign" -c -P 16 4 build/nlziet-5.15.3-native-pip.apk
adb devices -l
```

The SDK archive's directory really is `build-tools/android-16` despite being build-tools **36.0.0**. Runtime tests use Android framework shadows and test-only Bitmovin API doubles; they do not stream video or acquire DRM licenses. See [inspection and verification](docs/inspection.md) for exact evidence and limitations.

## Install without deleting existing data

The output retains `nl.nlziet` but has a **different signing certificate** from the official app. It cannot update an installed official NLZIET APK. Do not uninstall that app or clear its data. Use a spare device/user profile where NLZIET is not already installed, or apply the bundle using an existing compatible patched installation's own signing key.

```sh
adb -s DEVICE_SERIAL shell pm path nl.nlziet
# Continue only if that command reports no installed NLZIET package in the intended user/profile.
adb -s DEVICE_SERIAL install build/nlziet-5.15.3-native-pip.apk
```

If installing over a compatible previously patched build, first verify matching certificates and use `adb install -r`; if Android reports a signature mismatch, stop without uninstalling or erasing data. Enable NLZIET's PiP permission in Android settings if disabled. Sign in normally with your own subscription. No credentials are included in the artifacts.

For attached APK parts, download both into the same directory and reconstruct the APK:

```sh
cat nlziet-5.15.3-native-pip.apk.part-01 nlziet-5.15.3-native-pip.apk.part-02 > nlziet-5.15.3-native-pip.apk
sha256sum -c SHA256SUMS
```

The APK was split only because conversation attachments are limited to 10 MB. The individual parts are not installable.

## On-device acceptance still required

Test authenticated live TV and VOD: Home/Recents → video/audio continue; controls hidden; fullscreen return; pause before Home → no PiP; casting → no local PiP; close PiP → normal stop/cleanup; Back → normal navigation; lock screen, audio focus loss, buffering/end/error, rotation, subtitles, DRM renewal and logout. Check `adb logcat` for `NLZIET-PiP`, player errors and crashes. Capture real PiP and restored fullscreen screenshots. Device/vendor transition behavior, gesture smoothness, subtitles and layout have not been visually verified. Fixed 16:9 is intentional for the inspected layouts; other video aspect ratios may letterbox.

## License

GPLv3; see [LICENSE](LICENSE) and [NOTICE](NOTICE). This is an independent project, not an official Morphe or NLZIET product. NLZIET and Bitmovin app binaries are not included in Git. Releases use the template's existing semantic-release workflow; these local deliverables are not a GitHub release.
