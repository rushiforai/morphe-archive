# Development environment and verification

The distributable Windows entry lives in [`tools/workspace/`](../tools/workspace/). It is part of the current source inputs. `.devenv/` is ignored local compatibility material and is **not required** by a source handoff. Current product identity and evidence are in [PROJECT-STATE](PROJECT-STATE.md); routine maintenance is in the [operations guide](maintenance/OPERATIONS.md).

## Configure one process

Keep the checkout, scratch work, writable Gradle cache and outputs on E:. The entry derives its repository from its own location and fails if E: is unavailable. Shared installed tools may be elsewhere and are read through explicit paths. It never searches another checkout, Codex runtime storage, Windows User/Machine settings or `gh auth token`, and never writes `gradle.properties` or changes global environment variables.

The defaults below are repository relative. A supplied process variable takes precedence and an invalid supplied input fails; it does not fall back to another tool.

| Input | Default | Required content / use |
| --- | --- | --- |
| `JAVA_HOME` | `work/toolchain/jdk-21` | JDK 21, both `java.exe` and `javac.exe` |
| `MORPHE_TASK_PYTHON` | `work/toolchain/python/python.exe` | Python 3.12; standard library only for current verification |
| `ANDROID_HOME` | `work/toolchain/android-sdk` | API 35 and 36, build-tools 36.0.0, accepted SDK license |
| `ANDROID_SDK_ROOT` | set to selected SDK | If supplied, must agree with `ANDROID_HOME` |
| `MORPHE_ROBOLECTRIC_DIR` | `work/toolchain/robolectric` | Three instrumented SDK jars listed below |
| `GRADLE_USER_HOME` | `work/gradle-home` | Writable cache on E:; its existing settings must be understood by the caller |
| `MORPHE_MAVEN_LOCAL` | `work/maven-local` | Explicit Maven artifact input; a supplied directory must exist |
| `ANDROID_USER_HOME` | `work/android-user-home` | Writable Android build home on E:, including local debug signing material |

`TEMP`, `TMP`, Python bytecode and unit-test temporary directories are set under this checkout's `work/`. No toolchain or dependency cache is copied, cleaned or installed by initialization. Android tool paths are added to this process's PATH. Authentication is separate from tool selection.

For the existing maintainer installation, use these **explicit reuse inputs** in a new PowerShell process at the active repository (replace the Maven path for your own installation):

```powershell
$repo = (Get-Location).Path
$env:JAVA_HOME = Join-Path $repo 'work/toolchain/jdk-21'
$env:ANDROID_HOME = Join-Path $repo 'work/toolchain/android-sdk'
$env:ANDROID_SDK_ROOT = $env:ANDROID_HOME
$env:MORPHE_TASK_PYTHON = Join-Path $repo 'work/toolchain/python/python.exe'
$env:MORPHE_ROBOLECTRIC_DIR = Join-Path $repo 'work/toolchain/robolectric'
$env:GRADLE_USER_HOME = Join-Path $repo 'work/gradle-home'
# Opt in only if this existing artifact repository is available and its provenance is understood.
$env:MORPHE_MAVEN_LOCAL = Join-Path $env:USERPROFILE '.m2/repository'
# Offline-only noncredentials satisfy the plugin's eager configuration read.
$env:GITHUB_ACTOR = 'offline-cache-only'
$env:GITHUB_TOKEN = 'offline-cache-only'
.\tools\workspace\dev.cmd :translation-core:testDebugUnitTest :extensions:extension:testDebugUnitTest --offline
```

A machine with a global JDK 25 must set `JAVA_HOME` to JDK 21. The example's noncredential placeholders require `--offline` (daily) or `-Offline` (full). Online resolution needs your own authorized package settings. An existing cache does not prove that offline builds work on another machine.

## Versions, acquisition and trust boundaries

Use the repository's versions; upgrades are a separate task. The following official documentation and source locations were checked for this handoff on 2026-10-25. Installer downloads and a completely empty-cache installation were not exercised. The linked Python 3.12.14 announcement describes a source-only security release; it does not establish the origin of the current Windows python.exe or certify a Windows installer download. The entry accepts a supplied Python 3.12 executable; that executable’s provenance remains a separate input.

| Component | Current input / lock | Official acquisition or reference |
| --- | --- | --- |
| Windows shell / Git | Rehearsal Windows PowerShell **5.1.26100.9444**, Git **2.55.0.windows.3** on PATH (`C:\Program Files\Git\cmd\git.exe`) | The `.cmd` frontends use the installed Windows `powershell.exe`. Git is required for current branch/HEAD/tracked-input queries; use a valid checkout, or the explicit read-only metadata mapping used by the isolation rehearsal. No Git/global account configuration is copied. These are observed versions, not new version locks. |
| JDK | Major 21; rehearsal Temurin `21.0.12.1+1` from `release` | [Temurin 21 releases](https://adoptium.net/temurin/releases/?arch=any&os=windows&version=21), [installation](https://adoptium.net/installation). Extract an appropriate Windows JDK to E: or supply its installed path. |
| Python | Major/minor 3.12; installed rehearsal `3.12.14` | [Python downloads](https://www.python.org/downloads/), [3.12.14 announcement](https://blog.python.org/2026/08/python-31214-31116-31021/). Supply an installed Windows Python 3.12 executable; the observed runtime's original distribution provenance was not independently certified here. |
| Gradle | `gradle/wrapper/gradle-wrapper.properties`: **9.6.1**, distribution SHA-256 `9c0f7faeeb306cb14e4279a3e084ca6b596894089a0638e68a07c945a32c9e14` | [Wrapper verification](https://docs.gradle.org/current/userguide/gradle_wrapper.html), [official checksums](https://gradle.org/release-checksums/). Use `gradlew.bat`, not a system Gradle. Existing unpacked distribution reuse is distinct from a fresh ZIP checksum check. |
| Android | API 35 rev 2, API 36 rev 2, build-tools **36.0.0** (`source.properties`) | [Android command-line tools](https://developer.android.com/tools), [sdkmanager](https://developer.android.com/tools/sdkmanager). Install command-line tools in an explicit SDK and run the command below; review/accept licenses yourself. |
| Morphe plugin / Patcher | `settings.gradle.kts`: `app.morphe.patches` **2.0.0**; `gradle/libs.versions.toml`: Patcher **2.0.0** | [Plugin source](https://github.com/MorpheApp/morphe-patches-gradle-plugin), [Patcher releases](https://github.com/MorpheApp/morphe-patcher/releases). Resolve exact coordinates below; do not substitute another project's JAR. |
| Other JVM dependencies | Build scripts/version catalog and resolved POM/module metadata | Google Maven, Maven Central, Gradle Plugin Portal, Morphe GitHub Packages and JitPack as selected by the plugin/settings. No dependency version was changed for M7a. |
| Robolectric | Tests pin **4.14.1** | [Runtime dependency configuration](https://robolectric.org/configuring/), [official SDK download explanation](https://robolectric.org/blog/2023/11/11/improving-android-all-downloading/). Provision the exact runtime jars below. |
| Node/npm | Release tooling only; observed Node **24.19.0**, npm **11.17.0** | `.github/workflows/release.yml`, `package.json` and `package-lock.json` govern the release environment. Ordinary dev/full candidate verification requires neither `npm ci` nor semantic-release. No npm install/publisher execution is part of this rehearsal. |

After obtaining Android command-line tools, install the pinned packages using that SDK's `sdkmanager.bat` (example, not run by initialization):

```powershell
& "$env:ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager.bat" --sdk_root=$env:ANDROID_HOME 'platforms;android-35' 'platforms;android-36' 'build-tools;36.0.0' 'platform-tools'
& "$env:ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager.bat" --sdk_root=$env:ANDROID_HOME --licenses
```

The three Robolectric runtime artifacts use coordinates `org.robolectric:android-all-instrumented:<version>` and filenames `android-all-instrumented-<version>.jar`:

| Android / API | Exact version |
| --- | --- |
| 9 / 28 | `9-robolectric-4913185-2-i7` |
| 13 / 33 | `13-robolectric-9030017-i7` |
| 15 / 35 | `15-robolectric-12650502-i7` |

Resolve those artifacts from Maven Central in a separately provisioned environment, preserve their origin/checksums, then supply a directory containing all three. The Windows entry requires them and sets `robolectric.offline=true` plus `robolectric.dependency.dir`; this does not make Gradle's separate plugin/dependency graph available offline. `tools/Prepare-OfflineTests.ps1` is a legacy provisioning helper that may copy from the current user's Maven cache; it is not called by the canonical flow.

## Maven repositories, credentials and proxies

The settings consult `mavenLocal()` before the plugin repositories. The canonical Windows init script sets `maven.repo.local` **before settings evaluation** to `MORPHE_MAVEN_LOCAL`, defaulting to this checkout's `work/maven-local`. It never silently uses another account's `.m2`. When preparing a first environment, either use an empty local input and authenticated package resolution, or supply verified local publications for:

- `app.morphe.patches:app.morphe.patches.gradle.plugin:2.0.0` (plugin marker POM);
- `app.morphe:morphe-patches-gradle-plugin:2.0.0` (plugin JAR/POM/module);
- `app.morphe:morphe-patcher:2.0.0` and its resolved dependencies.

Registry URL: `https://maven.pkg.github.com/MorpheApp/registry`. The project reads process `GITHUB_ACTOR` and `GITHUB_TOKEN`, or Gradle `gpr.user`/`gpr.key`. The installed Morphe 2.0.0 plugin eagerly reads **both nonempty settings even offline**. Its source JAR was inspected after the first isolated attempt failed during configuration before any tests. The canonical entry now explains missing settings before Gradle. For already cached offline runs, explicitly supplying the literal `offline-cache-only` for both variables satisfies configuration; these **noncredentials** grant no access and do not certify online authentication. For registry access use your own authorized package-read credentials per [GitHub's Gradle registry documentation](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-gradle-registry). Do not place tokens in source, command arguments, reports or generated config; the initializer does not fetch credentials from `gh` or Windows account settings. A caller-selected Gradle home can already contain private configuration/init scripts; inspect it privately before opting in. The rehearsal inventory records setting **names and hashes**, not values.

The local rehearsal explicitly selected `C:\Users\14776\.m2\repository` as a shared **artifact input**. Its three existing Morphe publications have byte inventories/POM/module metadata in `validation/runs/20261025-M7a-01/environment-inventory.json`; the original publishing commit was not established in M7a. This is a disclosed dependency provenance limit, not a claim that official registry first resolution or a source rebuild of those publications succeeded. No credential files or private project configuration were copied from C:.

`HTTP_PROXY` / `HTTPS_PROXY` are process inputs only. For Gradle the selected proxy host/port are applied as JVM properties in the init script, without rewriting the cache's `gradle.properties`; local test HTTP stays direct. Embedded proxy credentials are rejected without echoing their values. Model API variables are not imported by initialization. Candidate/full verification passes `-Ptranslation.live=false`; a fixture pass never authorizes a real paid call.

## Daily and complete commands

From any current directory, invoke the entry by its path. `.cmd` uses a fresh Windows PowerShell 5.1 process with `-NoProfile -ExecutionPolicy Bypass`; `.ps1` is available when script policy allows it.

```powershell
# Localization plus both test suites:
.\tools\workspace\dev.cmd
# Requested Gradle task(s), with normal Gradle options:
.\tools\workspace\dev.cmd :translation-core:testDebugUnitTest --tests '*RetryAfterContractTest' --offline
# One complete candidate run, fresh exclusive ID and actual tests:
.\tools\workspace\verify-full.cmd -RunId my-change-01 -ExpectedVersion 1.5.8 -ExpectedBuildId release-1.5.8 -Offline -RerunTests
```

`-Offline` requires already resolved Gradle dependencies. Omit it for authorized first resolution after provisioning network/registry inputs; **that first-resolution path is documented, not certified by M7a**. `-RerunTests` forces the two Test tasks, rather than recompiling every dependency. Missing/zero/all-skipped results, failing children or mismatched identity fail the full run. Candidate mode checks public 1.5.7 metadata internally without generating it. Every run names its exact MPP, independent MPE and UI APK. It does not compose, publish, install or contact a model.

Outputs are `build/maintenance/M1a/<RunId>/` and `validation/runs/<RunId>/`; M1a here is the inherited output contract, not a new product identity. Reports include actual task receipts, test XML/HTML, fingerprint, bundle/boundary and credential checks. Extension intermediate reports remain under `extensions/extension/build/`; archive same-run compiled classes/XML/receipt before the next Gradle invocation when creating maintenance evidence.

For an ad-hoc Gradle command, dot-source `tools/workspace/Enter-Dev.ps1` and pass `--init-script tools/workspace/workspace.init.gradle`; use the daily entry when possible. `tools/Verify.ps1` and `tools/Enter-Workspace.ps1` are compatibility aliases. The six ignored `.devenv` frontend/init files are thin local aliases only. A configured Linux/CI environment can still call `python3 tools/verify_current.py`; M7a exercised Windows locally, not remote CI or a Linux setup.

## What M7a actually exercises

The preserved `.tmp/M7a-source-rehearsal-04` contains explicit current source inputs and distributable tools, **no `.devenv`, original work/build/validation tree or user config**. A separate index plus read-only queries against original Git metadata provide branch/HEAD/tracked-input identity; original index writes are disabled. A new `powershell.exe -NoProfile` process supplies installed JDK/Python/SDK/Robolectric paths, existing E: Gradle cache, explicit Maven input and E: Android debug-build home. Real GitHub/model credential variables and JVM override/proxy variables are removed for this offline run; explicit noncredential `offline-cache-only` actor/token values satisfy the eager plugin configuration read.

This is **isolated source + installed tools + cached dependencies**. Empty-cache/new-machine install, invalid-registry-credential online failure, remote CI, device/hardware and real services remain unverified. Exact commands, input hashes, failed attempts if any, result counts, binary comparison and rollback are in [M7a result](maintenance/results/M7a-RESULT.md). Avoid describing this evidence as certified cold start.


Current local product after [M7b review](maintenance/reviews/M7b-REVIEW.md): 1.5.8 / local-1.5.8-m7b / candidate-02. M7a's cached-tool rehearsal remains valid for its documented tooling scope; runtime diagnostic-source literals changed in M7b and were separately revalidated. Device installation/observation are pending, using the user's retained on-phone Morphe Manager subject to version and signing checks. This adds no empty-cache or online-authentication certification.
