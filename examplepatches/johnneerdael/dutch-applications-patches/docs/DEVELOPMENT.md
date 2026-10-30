# Build and validate the patches

These instructions were moved from the README when the bilingual user documentation was introduced. The Android patch toolchain is separate from the Python-only documentation build.

## Build

Use JDK 21+, Python 3 and Android SDK build-tools. The source follows the official patches template layout and retains its release workflows.

With a GitHub PAT that has `read:packages`, configure `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties`, then run:

```sh
./gradlew buildAndroid
```

Alternatively, put the PAT alone in `.pat` in this repository or its parent directory, and run:

```sh
python3 scripts/build.py
```

The helper supplies credentials only to the build process. `.pat` is ignored by Git. Never commit the token or paste it into an issue.

The Maps patch also requires `SHARED_MAPS_API_KEY` in the build environment, or a local `.community-maps-api-key` file containing the authorized key. Git ignores that file. GitHub Actions reads the repository secret of the same name. The build generates the key constant under `patches/build/`; no key value belongs in tracked source. Supply the intended key explicitly rather than reusing generated output from an earlier build. The Maps verifier also uses the explicit environment or ignored-file input. The compiled patch and patched Android app necessarily contain the Maps API key; the Actions secret protects its build-time storage.

The bundle is written to `patches/build/libs/`. Releases use the template's existing semantic-release workflow.

## Build and install test apps

Use [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) to patch and
sign test APKs on the computer. Install the result with ADB on the explicit USB
device. Use Frida for runtime diagnosis and verification. Do not automate Morphe
Manager on the phone for builds unless the user requests that workflow.

```sh
java -jar morphe-desktop-VERSION-all.jar patch --exclusive --validate \
  --bytecode-mode FULL -p patches-VERSION.mpp -e "Patch name" \
  -o patched.apk -r patch-report.json original.apk
adb -s PHONE_SERIAL install -r patched.apk
```

With multiple bundles, place each bundle's `-e` selections after its own `-p`
argument. Check the report's applied-patch list before installation. Updating an
installed app requires its existing signing key; uninstalling to change keys
removes its data and requires the user's approval.

## Verify

```sh
python3 scripts/validate.py ../buienalarm.apk
```

Requires Java, Python, curl, apktool and Android SDK build-tools `apksigner` on PATH. The script covers Google compatibility and the two presentation patches, checking signatures and independently decoded resources/DEX. Reports and logs go to `build/validation/`. `tests/verify_privacy.py` is a separate optional static-output inspection tool; it does not establish real-world behavior.

For the other apps, pass the app and its original input:

```sh
python3 scripts/validate_targets.py buienradar ../com.supportware.Buienradar_7.4.8-7897_*.apkm
python3 scripts/validate_targets.py weeronline ../weeronline-3.61.0.apks  # zip of base.apk and split_config.*.apk
python3 scripts/validate_targets.py weerplaza ../phone-apks/weerplaza --compact
python3 scripts/validate_targets.py nunl ../phone-apks/nu.nl --compact
python3 scripts/validate_targets.py volkskrant ../phone-apks/volkskrant --compact
```

This applies each patch alone and all together, then checks the patch report, signature and the decoded bytecode, manifest, layout and asset changes, and confirms that the original input has none of them. A directory must contain `base.apk` and only APK splits. Outputs go to `build/validation/<app>/`. `--compact` removes successful temporary decoded trees and individual-selection APKs while retaining the combined APK and reports; failed checks retain their decoded evidence. Use repeatable `--selection "Patch name"` or `--selection all` for focused validation.

See [the investigation](INVESTIGATION.md) for APK identity, findings across seven reference collections, verification evidence and runtime limits.

The Buienalarm validator checks Google compatibility alone, each presentation patch with its Google dependency, and both together. The target validator checks the other apps independently. Device testing uses the USB phone; no emulator is required.

## Documentation and release channels

Publish README and User Guide updates on `main`, including updates about dev
pre-releases. The hosted guide is built from `main`; documentation left only on
`dev` does not reach users of the site.

Keep the stable catalogue generated from main's stable metadata. Describe new
dev controls and dev-only apps separately, with their release links and known
testing limits. Publishing those guide updates must not promote unfinished
patch code or replace stable metadata with a dev catalogue. Publish a pre-release
before publishing documentation that says it is available.
