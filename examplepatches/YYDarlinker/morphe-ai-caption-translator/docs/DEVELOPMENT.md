# Development and verification

Start from a Git checkout with the source, tests, locks and distributed [`tools/workspace/`](../tools/workspace/) entry. Read [current state](PROJECT-STATE.md) before changing a pending candidate. Windows frontends enforce this maintainer's E: workspace policy; configured Linux CI uses `python3 tools/verify_current.py`.

## Process inputs

Initialization never imports credentials, edits global environment variables or discovers another checkout. Explicit invalid inputs fail. Shared installed tools/artifacts may be outside E:, but writable Gradle/Android homes and project temp stay on E:.

| Variable | Default relative to repository | Requirement |
| --- | --- | --- |
| JAVA_HOME | work/toolchain/jdk-21 | JDK 21, java.exe and javac.exe |
| MORPHE_TASK_PYTHON | work/toolchain/python/python.exe | Python 3.12 |
| ANDROID_HOME | work/toolchain/android-sdk | APIs 35/36, build-tools 36.0.0, accepted SDK licence |
| ANDROID_SDK_ROOT | selected ANDROID_HOME | If supplied, it must agree |
| MORPHE_ROBOLECTRIC_DIR | work/toolchain/robolectric | Three instrumented SDK JARs below |
| GRADLE_USER_HOME | work/gradle-home | Writable on E:; caller must understand existing private configuration |
| MORPHE_MAVEN_LOCAL | work/maven-local | Explicit artifact repository; supplied path must exist |
| ANDROID_USER_HOME | work/android-user-home | Writable on E:, including local debug-build signing material |

TEMP/TMP and Python bytecode go under `work/`. The Windows init script gives each Test task its own `work/test-temp/<project>/run-<uuid>/`; successful tasks remove only their own extracted Robolectric native runtime after the worker exits. Other temporary files and failed-task directories remain. Toolchain/Gradle/Maven dependencies are not cleaned or installed by initialization.

For the existing maintainer installation, open a fresh PowerShell process at this repository:

```powershell
$repo = (Get-Location).Path
$env:JAVA_HOME = Join-Path $repo 'work/toolchain/jdk-21'
$env:ANDROID_HOME = Join-Path $repo 'work/toolchain/android-sdk'
$env:ANDROID_SDK_ROOT = $env:ANDROID_HOME
$env:MORPHE_TASK_PYTHON = Join-Path $repo 'work/toolchain/python/python.exe'
$env:MORPHE_ROBOLECTRIC_DIR = Join-Path $repo 'work/toolchain/robolectric'
$env:GRADLE_USER_HOME = Join-Path $repo 'work/gradle-home'
# Explicit opt-in artifact input for this installation; replace for your machine.
$env:MORPHE_MAVEN_LOCAL = Join-Path $env:USERPROFILE '.m2/repository'
# Noncredentials, only for already cached --offline runs:
$env:GITHUB_ACTOR = 'offline-cache-only'
$env:GITHUB_TOKEN = 'offline-cache-only'
.\tools\workspace\dev.cmd :translation-core:testDebugUnitTest --tests '*RepairAdmissionTest' --offline
```

Morphe 2.0.0 eagerly reads both package user/token settings even offline. Nonempty placeholders grant no registry access. Online resolution needs your own authorized package-read settings (`GITHUB_ACTOR`/`GITHUB_TOKEN` or private gpr.user/gpr.key); never put secrets in source, arguments or reports. A selected Gradle home may already contain private settings/init scripts; inspect it before reuse. Initialization never reads `gh auth token` or copies account configuration.

## Pinned tools and dependencies

| Input | Repository contract / provisioning |
| --- | --- |
| Gradle | Wrapper 9.6.1; ZIP SHA-256 9c0f7faeeb306cb14e4279a3e084ca6b596894089a0638e68a07c945a32c9e14 in gradle/wrapper/gradle-wrapper.properties. Use the wrapper |
| Java/Python | Supply JDK 21 and Python 3.12. [Temurin](https://adoptium.net/temurin/releases/), [Python](https://www.python.org/downloads/). Observing a local executable version is not proof of its installer provenance |
| Android | [sdkmanager](https://developer.android.com/tools/sdkmanager): platforms;android-35, platforms;android-36, build-tools;36.0.0, platform-tools; review/accept licences yourself |
| Morphe plugin/Patcher | app.morphe.patches plugin 2.0.0 and app.morphe:morphe-patcher:2.0.0; settings/version catalog are authoritative |
| Robolectric | 4.14.1, pinned by the Android test builds; runtime artifacts below |
| Other JVM dependencies | Build scripts, version catalog, resolved POM/module metadata. Repositories include Google Maven, Maven Central, Gradle Plugin Portal, Morphe registry and JitPack |
| Node/npm | Release tooling only, governed by package.json/package-lock.json and workflows. Not needed for ordinary application tests; `npm ci` recreates node_modules |

Provision these exact `org.robolectric:android-all-instrumented` artifacts into MORPHE_ROBOLECTRIC_DIR:

| API | Version / filename suffix |
| --- | --- |
| 28 | 9-robolectric-4913185-2-i7 |
| 33 | 13-robolectric-9030017-i7 |
| 35 | 15-robolectric-12650502-i7 |

Each filename is `android-all-instrumented-<version>.jar`. This stops Robolectric runtime downloading; it does not populate Gradle's separate dependency graph. The retired implicit Maven-copy helper is not needed.

`mavenLocal()` is evaluated early. The Windows init sets maven.repo.local before settings to the explicit input. For an offline environment provision the plugin marker app.morphe.patches:app.morphe.patches.gradle.plugin:2.0.0, app.morphe:morphe-patches-gradle-plugin:2.0.0, app.morphe:morphe-patcher:2.0.0 and resolved dependencies. Alternatively resolve from the [Morphe registry](https://maven.pkg.github.com/MorpheApp/registry) with authorized credentials. Existing local Maven publications are disclosed artifact inputs, not a verified source rebuild of the plugin.

HTTP_PROXY/HTTPS_PROXY are process inputs applied as JVM proxy properties without rewriting cache settings. Embedded credentials are rejected; fixture HTTP remains direct. No real model API variables are imported.

## Commands and outputs

```powershell
# Localization and both unit suites, normal incremental development:
.\tools\workspace\dev.cmd --offline
# Explicit build task:
.\tools\workspace\dev.cmd :patches:buildAndroid --offline
# One final candidate; identity comes from gradle.properties; use a fresh run ID:
.\tools\workspace\verify-full.cmd -RunId my-change-01 -Offline -RerunTests
```

The frontends launch Windows PowerShell without a profile. Missing tools/package settings fail before Gradle. Offline requires pre-resolved inputs; omit offline only for authorized online resolution. Use `Enter-Dev.ps1` plus `--init-script tools/workspace/workspace.init.gradle` for ad-hoc Gradle. `tools/Verify.ps1` and `tools/Enter-Workspace.ps1` remain small supported aliases; ignored `.devenv/` aliases are not prerequisites.

Full verification runs source/provenance/localization/tool contracts, both suites, UI fixture assembly, MPP build, exact MPP/MPE identity, compiled/package boundaries and credential scanning. It recreates the two Java test destinations, disables their compiled-test cache reuse and requires reset receipts; stale deleted test classes cannot count. Missing/zero/all-skipped/failed tests or changed inputs fail. No real model, publication, composition or installation occurs.

The token-cost golden test accepts `-Pgolden.write=<absolute-review-file>` to write a proposal, then deliberately fails. Review changes against the contract before replacing the fixture; regeneration is not a passing check. Ordinary UI tests keep their assertions and drawing checks without writing historical screenshot/JSON ledgers.

Both canonical frontends disable live translation. Optional `src/liveTest` probes require separate authorization, a complete provider configuration and positive `live.maxRequests`, `live.maxTokens` and `live.elapsedSeconds` budgets. A zero-provider/zero-call run cannot establish streaming success. Live probes are not part of the default application-test count.

Candidate assets: `build/maintenance/M1a/<run-id>/`. Evidence: `validation/runs/<run-id>/`. M1a and ordinary `build/n39/gradle` are inherited output contracts, not extra active versions. Extension intermediates stay in `extensions/extension/build/` for R8. Save same-run reports/receipts/required compiled evidence before subsequent builds.

A source ZIP has no Git metadata; use a real checkout for canonical source identity. Private caches, original APKs, diagnostic history, archived reports and `.devenv/` are not required source inputs. Local cached Windows builds and historical Linux CI do not certify arbitrary empty-cache provisioning, registry authentication or every installer. [Maintenance](MAINTAINING.md) describes verification strength and stopping rules.
