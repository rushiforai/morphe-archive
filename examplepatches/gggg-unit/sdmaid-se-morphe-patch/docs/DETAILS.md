# Project details

[Back to the short README](../README.md)

An independent third-party patch bundle compatible with Morphe.

This project is maintained by **gggg-unit**. It is not affiliated with, endorsed
by, or an official release of SD Maid SE, d4rken, the Morphe project, Doom, or
Paresh. Names are used to identify the target app, compatibility, and references.

**[➕ Add to Morphe · Morphe’ye ekle](https://morphe.software/add-source?github=gggg-unit/sdmaid-se-morphe-patch&name=SD%20Maid%20SE%20FOSS)**

Open this link on Android with Morphe installed, then confirm adding the source.
Morphe can then download this bundle and receive future stable patch updates.
If the browser does not open Morphe, go to **Sources → + → Remote** and paste
`https://github.com/gggg-unit/sdmaid-se-morphe-patch`.

## FOSS access and supporting the original developer

SD Maid SE's GitHub/FOSS build uses a local feature state and an honor-based
support model. Its developer has explained that the normal FOSS upgrade flow
does not verify payment and trusts users to support development:
[developer's explanation](https://github.com/d4rken-org/sdmaid-se/discussions/536).
The app's own FOSS upgrade flow is available without installing this patch.

This patch forces that local feature state on. It does not verify a purchase,
make the user a sponsor, or unlock the Google Play distribution. Presenting it
as a newly defeated paid protection would misrepresent what it does.

Please support the original app and its ongoing maintenance:
[Sponsor d4rken](https://github.com/sponsors/d4rken),
[buy a coffee](https://buymeacoffee.com/tydarken), or purchase Pro through
[Google Play](https://play.google.com/store/apps/details?id=eu.darken.sdmse).

## What the patch changes

This patch enables the Pro feature state in the official GitHub FOSS APK
(`eu.darken.sdmse`). It is adapted from the earlier Doom and Paresh SD Maid SE
patch strategies for the FOSS distribution. Their existing patches target
Google Play packages, whose entitlement implementation is different.

The patch changes the Boolean value stored in `UpgradeRepoFoss.Info.isPro` when
an entitlement state is created. It has no version-number restriction: the
fingerprint locates the field write in the constructor, even if its parameters
change. If a later release changes this entitlement structure, patching fails
instead of silently modifying another instruction. New releases still need
APK-level testing before they can be confirmed as working.

Use `python tools/verify_apk.py path/to/release.apk` to check the structural
anchor of any newer official FOSS release before patching. This check does not
replace an installation and feature test on Android.
The GitHub Actions workflow checks the newest official FOSS release daily. It
builds the `.mpp`, applies it to that APK with Morphe Desktop, and verifies the
injected bytecode. It also builds on pushes and attaches the bundle to tagged
GitHub releases. The build
first uses the repository's Actions token to read Morphe's GitHub Packages;
if GitHub denies that cross-repository package read, add a repository secret
named `MORPHE_PACKAGES_TOKEN` with `read:packages` access.

The root `patches-bundle.json` supplies Morphe's remote-source metadata. After a
tagged release is built, tested, and uploaded, the workflow updates this file on
`main` from the latest stable GitHub release. A manual workflow run can also
refresh the metadata. The add-source link stays the same across patch releases.

## Build

Use JDK 21 and Gradle with access to Morphe's GitHub Packages registry. Set
`GITHUB_ACTOR` and `GITHUB_TOKEN` (a token with `read:packages`), then run
`./gradlew :patches:buildAndroid`. You can also set `gpr.user` and `gpr.key` in
Gradle properties. On Windows, `./build.ps1` configures the portable JDK in
this workspace and a short temporary path for Gradle. It uses a project-local
Gradle user directory, so use environment variables with that script.
Download the bundle from the [latest GitHub release](https://github.com/gggg-unit/sdmaid-se-morphe-patch/releases/latest),
use the [repository copy of `patches-0.1.1.mpp`](../dist/patches-0.1.1.mpp), or build
`patches/build/libs/patches-*.mpp` locally. Import it into Morphe and select **Unlock Pro (FOSS)**
for an [official FOSS APK](https://github.com/d4rken-org/sdmaid-se/releases).
The release page shows the SHA-256 of each downloadable asset. From `0.1.1`
onward, bundles also contain `LICENSE`, `NOTICE`, and the `licenses/` directory
at the archive root.

This project does not target the Google Play APK/AAB variant. Install the
patched APK under Morphe's signing key, not over an APK signed by the developer.

## Verification

The official `v2.1.0-rc0`, `v2.2.0-rc0`, `v2.2.1-rc0`, and `v2.2.2-rc0` FOSS
APKs pass the structural check. The `v2.2.2-rc0` APK has SHA-256
`11b5b9084c27ab3b30db47c92f403129244c178e81e07c0bb0ffbb64a9bb1bb6`.
The bundle was built and applied successfully to the official `v2.2.2-rc0`
FOSS APK using Morphe Desktop 1.18.1. The resulting APK's DEX contains the
injected `true` instruction. The maintainer also reported successful on-device
use of `v0.1.0` on 2026-10-21; device and Android version details were not
provided. This report does not establish compatibility with every device.

## License, notices, and credits

Project-specific patch code and scripts are distributed under GPLv3; see
[LICENSE](../LICENSE) and [NOTICE](../NOTICE). The Gradle wrapper retains its original
Apache-2.0 notices; its license is in [licenses/Gradle-APACHE-2.0.txt](../licenses/Gradle-APACHE-2.0.txt).
Build dependencies retain their own licenses.

Thanks to [d4rken and SD Maid SE contributors](https://github.com/d4rken-org/sdmaid-se),
[Doom / rushiranpise](https://github.com/rushiranpise/morphe-patches),
[Paresh Maheshwari](https://gitlab.com/Paresh-Maheshwari/paresh-patches), and the
[Morphe contributors](https://github.com/MorpheApp). The FOSS patch and project
modifications are maintained independently here; reference revisions and
preserved upstream notices are recorded in [NOTICE](../NOTICE).

The original SD Maid APK, artwork, logos, translations, and documentation are
not included in this patch bundle. SD Maid's README explicitly excludes several
of those materials from its code license; see its
[license section](https://github.com/d4rken-org/sdmaid-se#license).
No trademark rights or official endorsement are claimed.
