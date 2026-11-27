# Using and Publishing with Morphe

Updated: 2026-11-26. This is an independent community patch bundle and is not an official LINE or Morphe product. See [Publication status](PUBLICATION_STATUS.md) for current release hashes and verification scope.

## Adding as a remote source

1. Use Morphe Manager supporting **Patcher 2.3.0** (verified on Morphe Manager `2.6.0`).
2. Open [Add source to Morphe Manager](https://morphe.software/add-source?github=gomjirak0803/line-notification-patches) or enter `https://github.com/gomjirak0803/line-notification-patches` under **Sources → + → Remote**.
3. Stable releases target LINE `26.19.0` with `isExperimental = false` and publish as non-prerelease releases, so neither **Pre-release patches** nor **Experimental app versions** is needed (enable **Pre-release patches** only if opting into `-dev` builds).
4. Select your own official **LINE `26.19.0` (`261900178`) full APKM** and apply the patches (all 6 patches are enabled by default with every in-app switch starting off; use **Expert mode** only if you want to deselect individual patches). See [README.md](../README.md) and [COMPATIBILITY.md](COMPATIBILITY.md) for details.

Live remote source addition, auto-update (`0.1.8-dev → 0.1.9-dev`), and on-device patching of LINE `26.16.0` ARM64 APKM have been verified on Morphe Manager `2.6.0` (Galaxy S10e, Android 12). See [official Morphe patch sources documentation](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md).

## Importing locally

Download the `.mpp` bundle from [GitHub Releases](https://github.com/gomjirak0803/line-notification-patches/releases) and import it via **Sources → + → Local**. Local sources do not auto-update; select newer `.mpp` files manually via **Update**. Compare file integrity against `SHA256SUMS.txt`. Publisher signatures (`signature_download_url`) are not currently configured.

## Cutting a new release

Release automation runs in `.github/workflows/release.yml` using the **Windows standalone build** (`scripts/bootstrap.py`, `scripts/build.py`, `scripts/prepare_release.py`). The template's npm semantic-release configuration is not used.

1. Commit updated source code, version (`VERSION` in `scripts/build.py`), release notes (`docs/RELEASE_NOTES.md`), and verification records (`docs/DEVICE_TESTS.md`) to `main`. Never overwrite existing published release tags.
2. Trigger **Actions → Release → Run workflow** on `main`.
3. The workflow prepares pinned tools, runs policy and SQLite unit tests, builds and load-tests the `.mpp`, and calls `scripts/prepare_release.py` to generate `patches-list.json`, `patches-bundle.json` (with `YYYY-MM-DDTHH:MM:SS` UTC `created_at` compatible with Morphe Manager's `LocalDateTimeSerializer`), the source ZIP, license/notice copies, and `SHA256SUMS.txt`.
4. The workflow creates a GitHub release (`v<version>`, adding `--prerelease` only when `<version>` contains `-`) and pushes updated `patches-bundle.json` and `patches-list.json` to `main`.
5. Download the published `.mpp`, verify its SHA-256 and ZIP entry parity against the locally tested bundle, and record the hashes in [PUBLICATION_STATUS.md](PUBLICATION_STATUS.md).

Original/patched LINE APKs/APKMs, `.tools/signing`, diagnostic logs, screenshots, and databases are excluded from Git and release archives. Each release ships the `.mpp` alongside the matching source ZIP, `LICENSE`, `NOTICE`, `THIRD_PARTY_NOTICES.md`, and build scripts.

## Community index

You can submit the public repository URL (`https://github.com/gomjirak0803/line-notification-patches`) via **Submit a bundle** on [Morphe Community Patches](https://morphe-patches.software/). Even before indexing, the direct remote source link works immediately in Morphe Manager. Listing on the community directory does not imply official authorship or security endorsement.
