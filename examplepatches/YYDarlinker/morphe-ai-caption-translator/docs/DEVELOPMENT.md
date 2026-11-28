# Development and verification

Use a Git checkout with JDK 21, Python 3.12, Android SDK platforms 35 and 36, and build-tools 36.0.0. The Gradle wrapper and version catalog pin the build, including Morphe Gradle plugin 2.1.2 and Patcher 2.6.0.

## Windows setup

Set the following variables in the current shell to use existing tools or override the checkout-relative defaults.

| Variable | Default |
| --- | --- |
| `JAVA_HOME` | `work/toolchain/jdk-21` |
| `ANDROID_HOME` | `work/toolchain/android-sdk` |
| `MORPHE_TASK_PYTHON` | `work/toolchain/python/python.exe` |
| `MORPHE_ROBOLECTRIC_DIR` | `work/toolchain/robolectric` |
| `MORPHE_MAVEN_LOCAL` | `work/maven-local` |
| `GRADLE_USER_HOME` | `work/gradle-home` |
| `ANDROID_USER_HOME` | `work/android-user-home` |

If set, `ANDROID_SDK_ROOT` must match `ANDROID_HOME`. The Windows launchers expect the checkout and writable homes on drive E. The Robolectric directory needs these `android-all-instrumented-<version>.jar` files for APIs 28, 33 and 35 respectively.

- `9-robolectric-4913185-2-i7`
- `13-robolectric-9030017-i7`
- `15-robolectric-12650502-i7`

Use authorized package-read credentials via `GITHUB_ACTOR` and `GITHUB_TOKEN`, or private Gradle properties `gpr.user` and `gpr.key`. Cached offline runs accept nonempty placeholders and need the plugin marker, Morphe plugin, patcher and transitive artifacts already resolved. The launchers accept process proxy settings without embedded credentials.

## Run checks

```powershell
.\tools\workspace\dev.cmd --offline
.\tools\workspace\dev.cmd :patches:buildAndroid --offline
.\tools\workspace\verify-full.cmd -RunId local-check-01 -Offline -RerunTests
```

Omit `--offline` or `-Offline` when resolving dependencies online. The daily command defaults to localization and both JVM unit suites. On configured Linux CI, use `python3 tools/verify_current.py` for full validation.

Full verification checks localization, tool and release contracts, source boundaries, fresh unit-test compilation, and packaged code and credential boundaries. It freezes the MPP/MPE under `build/verification/<run-id>/` and writes reports to `validation/runs/<run-id>/`. Ordinary builds place the MPP in `patches/build/libs/`. Run `buildAndroid` after JVM and resource tasks because later JVM packaging can replace the patch JAR.

Live provider probes are opt-in and are outside the default test suites. For final APK composition and artifact reuse, see [compatibility](COMPATIBILITY.md).
