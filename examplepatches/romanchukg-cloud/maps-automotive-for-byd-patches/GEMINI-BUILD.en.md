# Build Maps + optional Google app for Gemini

Preview 8 contains **two independent Morphe patches in one `.mpp`**. Apply only the patch for the app you are building. Maps works without the optional Google/Gemini setup.

| Input | Exact supported file | Patch | Result |
| --- | --- | --- | --- |
| Maps | Maps Automotive 26.10.120001.E /1068833407, original ARM64 APK | Maps Automotive for BYD (MicroG-RE TEST) | `com.google.android.apps.maps.automotive` |
| Google | Google 17.62.11.ve.arm64 /301813762, original API 32+ APKM,120–480dpi variant | Google app for BYD (MicroG-RE TEST) | `com.google.android.googlequicksearchbox` |
| Gemini | Original Google Gemini shell;1.0.995038376 /345 tested | **No patch** | `com.google.android.apps.bard` |

The Google patch requires MicroG-RE **7.2.2+** and Google input API 32+. Maps-only support on Android 10 does not extend to this Google app. Do not substitute another Google 17.62 variant even if its version code matches; hook fingerprints also have to match.

Originals are obtained separately, for example from these third-party version listings: [Maps Automotive](https://www.apkmirror.com/apk/google-inc/google-maps-android-automotive/google-maps-android-automotive-26-10-120001-e-release/), [Google app](https://www.apkmirror.com/apk/google-inc/google-search/google-app-17-62-11-release/), [Gemini](https://www.apkmirror.com/apk/google-inc/google-gemini/google-gemini-1-0-995038376-release/). No Google APKs are distributed by this repository. Morphe and MicroG-RE downloads should come from their official [Manager](https://github.com/MorpheApp/morphe-manager/releases), [Desktop](https://github.com/MorpheApp/morphe-desktop/releases), and [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) Releases pages.

SHA-256 of the exact checked inputs:

```text
d9dc74c9fa0f5bee0911ed1594a19adc0761258d524b5031ed480674d81f5ff9  original-maps.apk
74fbc9db80cbaa88cd1a6bf3374e0ec00e314baaa6f6d7de54dcf068768dc446  original-google.apkm
6d07cf6454fcdd04b3aaacf6cd4d046d8507f5422ac40999bf7c46d96d186315  original-google-base.apk (inside that APKM)
901bded61f6930303efdca8135ad72cc031e43d1a6099c53475a898dc43ecb8d  original-gemini.apkm (tested shell)
```

## Maps in Morphe Manager

Use the existing [Manager instructions](README.md#android-morphe-manager). Add our source, select the clean Maps original and only **Maps Automotive for BYD (MicroG-RE TEST)**. Back up/export the signing key. Export the signed Maps APK and install it on the car. For an update, reuse your existing key. **Do not clear Maps data.** Switching between the project key and a personal key requires a one-time reinstall with loss of that app's local data.

## Google: reproducible computer path, preserving the split set

**This preserves the 10-split layout used on the tested Tang.** Requirements: Python3, JDK17+, Android SDK Build Tools36.0.0, pinned Morphe Desktop1.18.1 all-JAR (SHA-256 `1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b`), original Google APKM, our `.mpp`, and your **existing Maps keystore and alias**. Import/export the same keystore if Maps was signed on another device. Do not generate a separate Google key.

The helper was verified with the project’s existing keystore. A signing key exported by Manager 2.0.0 is BKS; automatic handling of that BKS format is not implemented in this Desktop helper yet. For a Manager-generated key, build both apps in the same Manager instead of creating a replacement key.

From the downloaded project source, replace the paths with your own:

```sh
python3 tools/prepare-google-splits.py \
  --input /path/to/original-google.apkm \
  --bundle /path/to/maps-automotive-for-byd-morphe-preview.10.mpp \
  --cli /path/to/morphe-desktop-1.18.1-all.jar \
  --sdk /path/to/android-sdk \
  --keystore /path/to/your-existing-maps.keystore \
  --alias your-existing-maps-alias \
  --out /path/to/new-google-output
```

Passwords are entered privately. The helper rejects a different input or Desktop JAR, validates the original Google signatures, patches only base, signs/aligns all 10 APKs with your key, verifies certificates and payloads, and writes SHA256SUMS. It creates no key, installs nothing, accesses no account, and never overwrites an existing output directory.

Check the printed **certificate SHA-256 matches your installed Maps certificate** (`apksigner verify --print-certs your-signed-maps.apk`). Then install all 10 output APKs together with a split-aware installer or Android platform-tools; never install `base.apk` alone. From the output's `signed` directory on macOS/Linux:

```sh
adb -s YOUR_CAR_SERIAL install-multiple -r ./*.apk
```

Select your own authorized target explicitly. If Android reports a different Google signing certificate, stop: an original/unrelated Google installation cannot be updated by your key. Replacing **Google app only** requires uninstalling it, losing its local data, then installing your complete set. If Google is a system app and cannot be replaced normally, this path has not been established; do not remove system packages blindly. **Maps, Gemini, MicroG-RE and their accounts do not need deleting.** Keep your keystore/password backed up; later updates use that same key.

The original Gemini APKM is installed separately with a split-aware installer; keep Google's signature. It is a launcher/front end for the patched Google app, not the app to select for our Google patch.

## Android Manager / merged Google APK: API 32 laboratory check

Morphe's [official Expert-mode guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md#optimize-for-device-architecture) describes merging APKM/APKS/XAPK into a single APK before patching. In Manager choose **Google app Gemini TEST**, the exact Google original APKM above, and **Google app for BYD (MicroG-RE TEST)**. Use the **same signing key as Maps**, and keep architecture optimization OFF when building on a phone for the car.

**Manager 2.0.0, fresh API 32 ARM64 emulator:** Local import of the combined bundle, selection of the untouched whole Google APKM, merging all 10 splits, patching, Save/export and installation through Manager’s Install button and Android’s installer passed. Use embedded VM ON, architecture optimization OFF and the same key as Maps. Google opens to its privacy screen and ART verification passes. An independent check found the same classes, method bodies, resource values and native-library payloads as the Desktop result; DEX splitting and resource file paths differ.

**Current Tang check:** the owner built/installed Google20 as a single merged APK through Morphe. Its actual revision/SHA was verified, the compact Live capsule reached LISTENING and closed normally. Spotify attenuation failed in two tests. New Live route, call and reboot checks are not claimed. Earlier split-layout results belong to Google08; the helper remains available for that layout. Do not relabel a manually merged unsigned file as an original APK or bypass signature/fingerprint checks.

In Manager 2.0.0 enable Settings → Expert mode; keep Settings → Patcher → Optimize for device architecture OFF. To avoid broad All files access, use Settings → Files → Custom file picker OFF and Android’s normal per-file picker. If Downloads looks empty after a manual file transfer, browse Internal storage → Download. Select only our Google patch (other sources 0 selected), then Patch → Save. Decide Android’s install-source permission yourself before Install. The app card can say Installed for a saved output before installation: finish the system installer and open the actual app. Back up Settings → Backup → Signing key → Export privately; this exact export was checked against both output certificates.

The Desktop merge command, for those explicitly testing the merged path, is:

```sh
java -Xmx6g -jar morphe-desktop.jar patch --unsigned --exclusive \
  -p maps-automotive-for-byd-morphe-preview.10.mpp \
  -e "Google app for BYD (MicroG-RE TEST)" \
  -o google-merged-unsigned.apk -r google-result.json -t google-scratch original-google.apkm
```

Sign this unsigned output with your **existing Maps key** before installation; see the [SDK signing commands](README.md#computer-fallback-morphe-desktop-cli). Do not use `--force` or `--continue-on-error`. Finish with the [short BYD/Gemini setup](GEMINI-SETUP.en.md).
