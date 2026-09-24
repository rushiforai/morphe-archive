# MiXplorer Sharing Fix

A Morphe patch bundle that works around scoped-storage file-sharing failures by returning null for `_data` to external apps. It applies to single-file and multi-file shares without checking the receiving app's package name. MiXplorer's own queries, filenames, sizes, MIME types, and content URI access are preserved.

This independent project is not affiliated with MiXplorer or Morphe. No modified MiXplorer APK is distributed.

Release **0.2.0 and later** supports stable and beta MiXplorer.

## Add to Morphe

Open this link on the Android device where Morphe is installed:

**[Add MiXplorer Sharing Fix to Morphe](https://morphe.software/add-source?github=ak800i/mixplorer-patches-for-morphe)**

Alternatively, paste this repository URL into Morphe's add-source field:

```text
https://github.com/ak800i/mixplorer-patches-for-morphe
```

For local import, download the `.mpp` from the [latest release](https://github.com/ak800i/mixplorer-patches-for-morphe/releases/latest). The root [source manifest](patches-bundle.json) points Morphe to the published bundle.

The generated [patch catalogue](patches-list.json) describes the bundle's patches and supported app builds for community indexes.

## Patches

<!-- PATCHES_START -->
> **[v0.2.3](https://github.com/ak800i/mixplorer-patches-for-morphe/releases/tag/v0.2.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch total
<details open>
<summary>📦 MiXplorer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| Any version |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix scoped-storage file sharing](#fix-scoped-storage-file-sharing) | Hides unreadable _data filesystem paths from external apps for single-file and multi-file shares, preserving content URI access and same-app queries. |  |

</details>

<details open>
<summary>📦 MiXplorer Beta&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| Any version |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix scoped-storage file sharing](#fix-scoped-storage-file-sharing) | Hides unreadable _data filesystem paths from external apps for single-file and multi-file shares, preserving content URI access and same-app queries. |  |

</details>

<!-- PATCHES_END -->

## Compatibility and tested input

The patch is offered for any version, build code, and architecture of the free stable (`com.mixplorer`) and beta (`com.mixplorer.beta`) packages on Android 11 or later. It keeps strict structural guards: if an unknown release changes the provider or signing-check layout, patching stops before those methods are modified.

Device testing is limited to these inputs:

| Edition | Package | Tested version | Tested ARM64 build |
| --- | --- | --- | --- |
| Stable (primary) | `com.mixplorer` | **6.71.15** | **26090422** |
| Beta | `com.mixplorer.beta` | **6.71.15-BETA** | **26090412** |

Android 11+; tested on Galaxy A71, Android 13 / One UI 5.1.

- Stable: `MiXplorer_v6.71.15_B26090422-arm64.apk` from the [official download folder](https://drive.google.com/drive/folders/1Rj8kOmcZwXkWhjQI48wBd21v7yG73x7D). SHA-256: `bc2627659872cfc9895155d129c03eb8ac2b3c112cbdbe7303feb718f10c83f0`.
- Beta: [official input APK](https://mixplorer.com/beta/MiXplorer_v6.71.15-BETA_B26090412-arm64.apk). SHA-256: `62b0f397ee751e90b5b0f619004dff2c39ba466a5fe5d2f8ae1a23413cf8ff98`.

Silver and other package IDs are not supported. Other versions, builds (including the universal APK), and architectures of the two listed packages are advertised but have not been device-tested. Do not continue after a patch failure; missing, ambiguous, changed, or previously patched bytecode patterns are rejected.

## Apply with Morphe Desktop

Use [Morphe Desktop 1.16.0](https://github.com/MorpheApp/morphe-desktop/releases/tag/v1.16.0) with Java 21 or newer. Its CLI was used for the on-device tests below.

1. Enable **Settings > Advanced > Expert mode**.
2. Select one of the original APKs listed above.
3. Add this repository as a source, or use **Local patch file > Browse** and select the downloaded `.mpp`.
4. Enable **Fix scoped-storage file sharing** and apply it. Its necessary local-signing support is included automatically.
5. Install the APK produced by Morphe. No root or additional receiving-app storage permission is needed.

**Back up before replacing an existing installation.** Export MiXplorer settings using Settings > More settings > Export, and keep anything important outside its app-private storage. Android will not install a re-signed APK over the officially signed version of the same package (`com.mixplorer` or `com.mixplorer.beta`). After verifying the backup, remove only that edition if it is already installed, install the patched APK, and restore settings. Other editions use different package names and can remain installed. Keep your Morphe signing key for subsequent patched updates; returning to the official app also requires a backup and reinstall.

CLI example, from a folder containing Morphe Desktop and the original APK (downloads the latest stable patch bundle from this source):

```powershell
java -jar .\morphe-desktop-1.16.0-all.jar patch .\MiXplorer_v6.71.15_B26090422-arm64.apk -p https://github.com/ak800i/mixplorer-patches-for-morphe --exclusive -e "Fix scoped-storage file sharing" -o .\MiXplorer-patched.apk
```

The source manifest advertises the released patch bundle. The bundle's compatibility metadata offers the patch for any version of the two package IDs listed above on Android 11 or later.

## What changes

### Fix scoped-storage file sharing

- **Provider fix:** A small UID check is inserted into `FileProvider.query()`'s `_data` branch. Different UID: store a null value and follow the original column continuation. Same UID: follow the original path branch. Explicit `_data` projections are covered, and the separate `path` alias is untouched.
- **Required signing support:** Both device-tested APKs contain the same guarded self-fingerprint helper, which calculates the signing certificate's CRC-32 and checks an allowed list. An unchanged, re-signed beta was verified to exit at startup. The internal dependency adds the actual installed app's fingerprint to the existing list. It does not fabricate a developer signature or change Android's signature verification. Only the free stable and beta package IDs are targeted.

Only two existing classes are modified. No extension library, new permissions, resource changes, UI changes, or receiving-app modifications are injected. Recipients that already read content URIs do not need this workaround; other recipients benefit only if they fall back to URI access when `_data` is absent.

## Verification

- Nine Kotlin/dex tests pass, covering recipient-independent naming, package-scoped any-version compatibility, high-numbered registers, original branches, missing/ambiguous matches, and repeat-application rejection.
- Official Morphe applies bundle 0.2.0 to both device-tested APKs in default `STRIP_FAST` mode without compatibility overrides and signs the results.
- The patched stable app starts and browses normally. Its native single-file share preserves the filename, size, MIME type, read grant, and exact payload hash.
- [Stable native two-file capture](evidence/patched-two-files.json): default and explicit `_data` are null, both URI grants work, and both modeled multi-file reads match the original SHA-256 hashes without using the diagnostic metadata adapter or receiver storage permission.
- [Stable same-UID instrumentation results](evidence/internal-query.txt): both fixtures retain MiXplorer's own `_data` and `path` values, and raw-path and URI payloads match. Test source is in [device-tests/InternalQueryTest.java](device-tests/InternalQueryTest.java).
- Beta previously passed the same on-device checks with published bundle 0.1.0; its APK patch application was rechecked with 0.2.0.

Public evidence uses disposable synthetic files. Device-local UID numbers have been removed; no phone serial, account data, private files, or signing keys are published. The capture's receiver-model field names have been normalized to `receiverSourceCommit`, `modeledSingleFileRead`, `modeledMultiFileRead`, and `modeledMultiFileReadWithoutData`; all recorded values are unchanged.

**Motivating case:** Telegram 12.10.3 multi-file uploads exposed the raw-path failure. The diagnostic receiver models that application's file-reading behavior at source commit `9552e5541e1274b9557c9832b204dbfcaf44b3dc`; it is not a universal model of every receiving app.

**Limit:** This validates the actual patched MiXplorer provider in the two listed APKs, not every historical or future MiXplorer layout and not a live receiving-app UI/network upload. No account-based upload was tested. Broader MiXplorer features and cross-app compatibility have not been exhaustively tested. Any-version metadata broadens patch selection; it does not expand the device-tested scope.

## Build from source

Requires JDK 21+ and authenticated read access to Morphe's GitHub Packages registry. Set `JAVA_HOME` to the JDK. Use the official `gpr.user` / `gpr.key` Gradle properties or `GITHUB_ACTOR` / `GITHUB_TOKEN` environment variables. Do not place credentials in this repository. On Windows, [build.ps1](build.ps1) can use an already authenticated GitHub CLI transiently without printing or persisting its token.

```powershell
.\build.ps1
```

Or with credentials already configured:

```shell
./gradlew :patches:test :patches:generatePatchesList
```

Both commands build `patches/build/libs/patches-<version>.mpp` and regenerate the root [patches-list.json](patches-list.json) from that exact bundle. The `generatePatchesList` task depends on `buildAndroid`; its exporter and JSON dependency are build-only and are not included in the `.mpp`. The `publish` task also requires the patch tests and catalogue generation.

Local builds do not publish releases or update the source manifest. The project uses Morphe Patcher 1.13.0, the official patches Gradle plugin 1.3.4, and the checksum-pinned Gradle 9.7.1 wrapper.

The optional instrumentation test is built with [device-tests/build.ps1](device-tests/build.ps1), supplying Android Build Tools, an API 33 android.jar, and a standard debug keystore with alias `androiddebugkey` and password `android`. It defaults to stable `com.mixplorer`; pass `-TargetPackage com.mixplorer.beta` for beta. The patched test app must be signed with that same key. It reads only the fixture URI and expected path supplied to `am instrument`.

## Development and releases

Release tooling follows the [official Morphe template](https://github.com/MorpheApp/morphe-patches-template/tree/f99b2938bd25b202a6185a774d487a07d1061915). Node.js 24.15+ is required for the locked npm dependencies; CI uses Node 24 and JDK 21. Install release dependencies with `npm ci`.

- Make development changes on `dev`. Conventional `feat`, `fix`, `bump`, and `perf` commits produce automated prereleases; ordinary `chore`, `docs`, and `build` commits do not. `build(Needs bump)` explicitly requests a patch release.
- The [release workflow](.github/workflows/release.yml) runs the patch tests before semantic-release. It generates versions, release notes, the bundle manifest, the catalogue, and this README's patch section, then commits and publishes them together. New release bundles receive GitHub build-provenance attestations.
- The [promotion workflow](.github/workflows/open_pull_request.yml) opens a `dev` to `main` pull request. Merge it without squashing or rebasing to publish a stable release. Release metadata is back-merged to `dev` automatically.
- Do not manually edit generated catalogue/release metadata, manually upload replacement releases, or force-push release commits. To correct a released bundle, publish a new version through the workflow.

GitHub Actions needs the workflow's declared permissions and **Settings > Actions > General > Allow GitHub Actions to create and approve pull requests** enabled. The existing 0.1.0 and 0.2.0 releases predate this automation and remain unchanged; their historical assets do not gain CI provenance retroactively.

The build-only catalogue exporter, Windows build helper, regression tests, device instrumentation, and evidence are intentional additions to the template. No unused example patches or extension module are included. Dependency-lock security updates are kept within the template's declared version ranges.

## License

MiXplorer Sharing Fix is licensed under [GPLv3](LICENSE). The upstream [naming notice](NOTICE) is included. MiXplorer itself is a separate product and is not redistributed here.