# Maps validation

## Branding verification

Build with `./gradlew :patches:buildAndroid :patches:test` in the normal authenticated
repository build environment. The Maps group keeps its existing patch entries;
**Change app name** now contains both `appName` and `appIcon` options.

Run the complete resource matrix:

```sh
python3 scripts/maps/verify_branding.py --bundle /path/to/patches.mpp --apk /path/to/original-maps.apk --cli /path/to/morphe-desktop-all.jar --aapt2 /path/to/sdk/aapt2 --output /path/to/evidence
```

This checks all twelve light/dark styles, Original, Automatic with Legacy icon,
and Automatic without Legacy icon. Every branding-only result must retain the
original DEX hashes. Compiled resource references, background colors, image bytes
and resolved app labels are checked independently with Android SDK aapt2.
Intermediate APKs are removed after validation unless `--keep-apks` is passed.

Run the existing name fixture and the new same-process selection fixture with the
desktop JAR on the Java classpath. Each takes bundle, original APK and scratch
folder as arguments:

```sh
java -cp /path/to/morphe-desktop-all.jar tests/MapsAppNameRegression.java /path/to/patches.mpp /path/to/original-maps.apk /path/to/name-scratch
java -cp /path/to/morphe-desktop-all.jar tests/MapsBrandingSelectionRegression.java /path/to/patches.mpp /path/to/original-maps.apk /path/to/selection-scratch
```

For each complete Maps profile, use `validate.py --app-icon STYLE --app-name NAME`
with `--android-jar` to verify APK signing and Android references, then inspect its
branding with `verify_branding.py --inspect-apk /path/to/result.apk --style STYLE
--name NAME` and the same required paths. These checks do not install Maps or
prove device-launcher, microG sign-in or live navigation behavior.

`tests/MapsIconRenderingRegression.java` runs on Android via app_process. It loads
the icon from a compiled APK without installing or launching that APK, renders it
at 16, 24, 32, 48, 64, 72 and 96dp, and fails when the artwork disappears or becomes
too small. Use a custom dark icon and the same Android SDK platform JAR when
compiling it with javac and converting it with d8. Push the test DEX ZIP and APK
to an isolated `/data/local/tmp/` folder, then invoke its main class with the APK
and output folder as arguments. This catches fixed-padding regressions that XML
and APK-rebuild checks alone cannot detect.
