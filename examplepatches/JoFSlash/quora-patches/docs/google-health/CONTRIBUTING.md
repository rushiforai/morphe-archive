# Contributing

Thanks for helping. Google Health is an obfuscated app: most class and method names change with every
version, so patches find their code by strings, framework calls or the few names that stay.

## Reporting a problem

Open a [bug report](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with:

- what you expected and what happened, and on which screen,
- the versions of Google Health, the patches, Morphe Manager, MicroG-RE and Android,
- for a crash, the output of `adb logcat | grep -E "AndroidRuntime|JoFSlashPatches"`.

Please don't post health data, account names or tokens from your logs.

## How the patches work

- `patches/src/main/kotlin/app/jofslash/patches/googlehealth/` holds the patches. Each one finds code in the
  app with a fingerprint, or changes every call to a framework method (`shared/InvokeReplace.kt`), and
  inserts a call or a few instructions.
- `extensions/googlehealth/src/main/java/app/jofslash/extension/googlehealth/` holds the code those calls run
  inside the app.
- **GmsCore support** moves the app from Google Play services to MicroG-RE. MicroG-RE only lets an app use the
  Google account when it knows the app as a Google app: it knows Google Health by its package name and Fitbit's
  original signing certificate (`Constants.SIGNATURE`), not by the newer rotated one. That certificate is what
  the patch tells MicroG-RE to report.

## Testing a change

Build the bundle and apply it to an APKM from APKMirror:

```
./gradlew buildAndroid
python .github/scripts/check_google_health.py google-health.apkm --cli morphe-cli.jar --install
```

`check_google_health.py` applies every patch, lists the ones that fail, installs the patched app on the phone or
emulator connected over adb and checks that it starts without errors from the patches. Then try the change
in the app itself, signed in through MicroG-RE.

### A new Google Health version

The **Google Health version** workflow does this every day: it downloads the new APKM from APKMirror,
checks that it is signed by Google Health, keeps it in the private repository `JoFSlash/morphe-apks`,
applies every patch and starts the app on an emulator. Then it opens a pull request
`bump: Support Google Health <version>`, or an issue that says what failed. Sign in on a phone before
merging the pull request.

By hand: run `check_google_health.py` on the new APKM. When every patch applies and the app starts, add the version
with `python .github/scripts/add_google_health_version.py <version>` and upload the APKM to `JoFSlash/morphe-apks`
as a release named `google-health-<version>`, so the emulator test can use it.

## Continuous integration

- **Build** (pull requests): builds the bundle and checks the scripts.
- **Emulator test** (pull requests and before each release): applies every patch to the newest supported
  version and starts the app, and the clone, on Android 12L to 17 emulators. On Android 15 it also checks
  the patched code for the change each patch makes (`verify_google_health.py`). It needs the `APKS_TOKEN`
  secret (a fine-grained token with read and write access to the contents of `JoFSlash/morphe-apks`);
  without it, pull requests skip the test.
- **Release** (Wednesday pre-release, Saturday stable release, 08:00 UTC, or by hand): runs the emulator test, then semantic-release publishes the
  bundle when there are `feat:`, `fix:` or `bump:` commits since the last release.
- **Google Health version** (daily 05:30 UTC, or by hand with a version): tries a new Google Health
  version and opens a pull request or an issue, as described above.

## Pull requests

- Use a [Conventional Commit](https://www.conventionalcommits.org/) title (`feat:`, `fix:`, `docs:` ...);
  the release notes are made from it.
- Describe what you tested and on which Google Health version.
- New patches are off by default unless they only stop something without changing what you see.
