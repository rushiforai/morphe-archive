# Build and release

## Building locally

Put your own copy of the Ather APK and its config splits in `base/`:

```text
base/com.athermobileapp.apk
base/config.arm64_v8a.apk
base/config.en.apk
base/config.mdpi.apk
```

Then build:

```bash
bash scripts/build.sh          # incremental
bash scripts/build.sh --clean  # rebuild the patch bundle from scratch
```

The script defaults `JAVA_HOME` to Android Studio's bundled JBR and `ANDROID_HOME` to `~/Library/Android/sdk`.
It downloads the Morphe CLI 1.16.0 into `build/tools/` and verifies its SHA-256 before it patches anything.

The output is an installable split set:

```text
out/signed/base.apk
out/signed/config.arm64_v8a.apk
out/signed/config.en.apk
out/signed/config.mdpi.apk
```

Install it with:

```bash
adb install-multiple out/signed/base.apk out/signed/config.arm64_v8a.apk out/signed/config.en.apk out/signed/config.mdpi.apk
```

## Signing rules

- Every APK in an install set must be signed with the same key, or the package manager rejects the install.
  This is why `scripts/build.sh` patches first and signs in a separate step.
- `scripts/sign-all.sh` expects `keystore/ather-morphe.jks`, alias `ather` and password `atherpatch`.
  Override `KS`, `KS_ALIAS` and `KS_PASS` in the environment to use your own values.
- Generate your own key with `keytool`:

```bash
keytool -genkeypair -v -keystore keystore/ather-morphe.jks -alias ather \
  -keyalg RSA -keysize 4096 -validity 10000 \
  -storepass atherpatch -keypass atherpatch
```

- Never commit a keystore.
  The `.gitignore` excludes `keystore/`, `base/`, `build/` and `out/`.
- `sign-all.sh` runs `zipalign -p -f 4` and then `apksigner sign` with v1, v2 and v3 signing enabled and v4 disabled.
- The patched app carries your key instead of Ather's.
  The `Report Ather's signing certificate` patch reports Ather's original SHA-1 to Google's APIs, so Firebase login keeps working.
- Only a build signed with the same key updates an existing install.
  Losing the key means uninstalling first, which erases the app data.

## CI jobs

The workflow runs on every push to `master`, every pull request and on demand.

| Job       | What it does                                                                   |
| --------- | ------------------------------------------------------------------------------ |
| shell     | Runs `shellcheck` over `scripts/*.sh`.                                         |
| extension | Compiles both extension source trees with `javac` and packages them with `d8`. |
| patch-set | Fails when a patch calls an extension class without declaring `extendWith`.    |
| spelling  | Runs `typos`, with `_typos.toml` allowing `Ather` and `ather`.                 |
| markdown  | Runs `markdownlint-cli2` over the root Markdown files.                         |

No CI job builds or publishes an APK.

## Release plan

This repository releases only the patch bundle, `patches/build/libs/patches-<version>.mpp`.
It does not release patched APKs or vendor binaries.
A separate repository would build the app releases from the bundle.
