# Maintaining & releasing

[← Project overview](../README.md) · [Technical reference](TECHNICAL.md) · [Troubleshooting](TROUBLESHOOTING.md)

This guide records the **existing v1.0.0 release workflow** and the checks maintainers should perform before publishing a new bundle. It is a release checklist, not a compatibility guarantee.

## Project layout

```text
.
├── README.md                         Project landing page
├── LICENSE                           GPL-3.0 license text
├── patches-bundle.json               Remote Morphe source metadata
├── build.ps1                         Desktop build entry point
├── src/tracket/morphe/
│   └── LifetimeUnlock.java           Patch source
├── dist/
│   └── patches-1.0.0.mpp             v1.0.0 bundle
└── docs/
    ├── assets/hero.svg               README artwork
    ├── banner.html                   Existing support banner source
    ├── banner.png                    Existing support banner
    ├── TECHNICAL.md                  Implementation notes
    ├── TROUBLESHOOTING.md            Compatibility and diagnostics
    └── MAINTAINING.md                This guide
```

## Manager packaging fix (1.0.1)

Issue #5 exposed that 1.0.0 was a Java-only ZIP: it had no DEX entries and its
manifest contained no bundle name or version. Manager requires nonempty DEX
before patch discovery. A successful HTTP download or ZIP CRC check does not
prove Manager compatibility. The timestamp also must omit a timezone suffix
because Manager deserializes `created_at` as `LocalDateTime` and treats it as UTC.

The 1.0.1 build compiles the existing patch source, runs pinned D8, and packages
both Java classes and `classes.dex`, plus `Name` and `Version` manifest attributes.
Patch behavior and the supported Tracket version are unchanged.

### Current build entry point

Run `python build.py` with Python 3 and JDK 17+. `build.ps1` delegates to the same
script. The script downloads checksum-pinned Morphe desktop 1.18.1 and D8 8.3.37.
For offline builds, use `--morphe-jar` and `--r8-jar` with the exact pinned files.
The output is `dist/patches-1.0.1.mpp` and its SHA-256 sidecar.

The build verifies manifest name/version, decodes all DEX instructions, and uses
the real desktop Morphe loader to discover exactly one patch targeting Tracket
0.9.38. D8-generated synthetic access classes are expected; dependency classes
must not be embedded in the DEX. ZIP headers are fixed for reproducible output.

The release workflow additionally loads the DEX with Manager 2.3.0's own patcher
on an Android 35 emulator. Publication requires that test to pass. This is a
source-loading test, not a patched Tracket gameplay test. Review the workflow
run before claiming Android verification. After publication, update the remote
manifest to the release asset and verify its download and checksum. Retest the
actual Manager Sources UI on a device; leave issue #5 open until confirmed.

The older workflow below is retained as historical context, not the current
build procedure.

## Historical 1.0.0 build prerequisites

The existing build script expects:

| Dependency | Required by project |
| :-- | :-- |
| Java Development Kit | JDK 17 or newer |
| `javac` and `jar` | Available from the chosen JDK |
| PowerShell | `pwsh` to run `build.ps1` |
| Morphe desktop CLI | `morphe-desktop-1.18.1-all.jar` |
| Input source | `src/tracket/morphe/LifetimeUnlock.java` |

In PowerShell, point to the Morphe desktop jar and run the build script:

```powershell
$env:MORPHE_JAR = 'C:\path\to\morphe-desktop-1.18.1-all.jar'
pwsh -File build.ps1
```

The current script builds `dist/patches-1.0.0.mpp` and also copies the bundle to a versioned file in the repository root. The script uses `javac --release 17`.

> [!NOTE]
> These are the repository's documented prerequisites. The documentation redesign does **not** change the patch code, rebuild an APK, or claim to have run an end-to-end Android test.

## Release metadata

Morphe Manager reads [`patches-bundle.json`](../patches-bundle.json) from the GitHub source's default branch. In the current release, its fields include:

| Field | Purpose |
| :-- | :-- |
| `version` | Published patch-bundle version |
| `created_at` | Release metadata timestamp |
| `description` | Text presented for the release |
| `download_url` | Exact URL of the downloadable `.mpp` |
| `signature_download_url` | Optional signature URL; blank in v1.0.0 |

Keep the metadata version, release tag, and bundle filename aligned.

## Next-release checklist

- [ ] Review the target app's version, package, fingerprints, and any renamed helper symbols. Do **not** advertise new compatibility without actual testing.
- [ ] Update `version` in `patches-bundle.json`.
- [ ] Update `$Version` in `build.ps1`.
- [ ] Build and inspect the expected `patches-<version>.mpp` artifact.
- [ ] Verify the bundle applies only to the app version it claims to support.
- [ ] Update the `download_url` to the corresponding versioned release asset.
- [ ] Update `created_at` and `description` to match the release.
- [ ] Keep the user-facing subscription/support information truthful and current.
- [ ] Update the compatibility matrix and README if the supported version changes.
- [ ] Commit the metadata on `main`, then publish the matching `v<version>` tag and attach the asset under the exact advertised name.
- [ ] Check the GitHub release link, the source metadata, and the published asset after release.

## Recommended validation record

Maintain a short record alongside each release to distinguish **observed** test results from assumptions:

```text
Bundle version:
Tracket version / versionCode:
Morphe CLI version:
Bytecode mode:
Build host / JDK:
Patch application result:
Android device and OS (if tested):
App launch result (if tested):
Known limitations:
Bundle SHA-256:
Test date:
```

Add a checksum only after calculating it from the **actual published artifact**. Do not copy a checksum from a different build or state that runtime validation passed unless it was performed.

## Documentation conventions

- Prefer **relative repository links** so documentation works on feature branches.
- Use explicit version numbers instead of saying a patch works with “the latest version”.
- Treat a local client grant and a verified Play purchase as different things.
- Document failures and limitations as prominently as successes.
- Keep the custom hero in `docs/assets/hero.svg`; preserve the existing subscription-support banner in `docs/banner.png` and its HTML source.
- Keep detailed implementation notes in [TECHNICAL.md](TECHNICAL.md) so the main README remains approachable.

## Responsible contact

Tracket's developer can request removal or raise issues using [contactjayclatty@pm.me](mailto:contactjayclatty@pm.me). Reports of security concerns should avoid publishing sensitive user or app data.

---

[Project overview](../README.md) · [Troubleshooting](TROUBLESHOOTING.md)
## Published 1.0.1 validation

[Verification record](verification/1.0.1.md): build, JVM discovery, DEX validation, and Android 35 loading with Manager 2.3.0 passed in CI. The remote manifest now references the published 1.0.1 release. Re-run the Sources UI check on a device before closing issue #5.
