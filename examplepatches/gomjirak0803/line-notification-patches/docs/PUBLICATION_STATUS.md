# Publication Status — 2026-11-23

## Latest release (`v0.1.12-dev`)

* **Repository**: https://github.com/gomjirak0803/line-notification-patches
* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.12-dev
* **Add in Morphe Manager**: https://morphe.software/add-source?github=gomjirak0803/line-notification-patches
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45045235396 (success)
* **Source commit**: `8a6fad2` (metadata commit: `c8fd0c5`)

The published `line-notification-patches-0.1.12-dev.mpp` is `150,358` bytes with SHA-256 `645ac1a650f5ec37888ca3309b92aa3816183a2c935cfb6c7813585b398f8860`, matching `SHA256SUMS.txt` and the directly downloaded asset. Comparing all 18 ZIP entries against the local build (`061d3091dce1aa0c53610272e13bbd911434a282a9ebbeef0e3f210e9d28a54c`, the bundle used for the S10e-tested APK) confirmed byte-for-byte parity across every executable class, DEX, extension, resource, and manifest entry (differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings). The source archive SHA-256 is `b867db725da3d4dff1327608b60852ff6729cb096897d84d26e196e1c247552c`. `main/patches-bundle.json` was updated to `"created_at": "2026-11-22T16:42:24"` and `"version": "0.1.12-dev"`, passing all 18 Python tests (including `tests/test_bundle_metadata.py`).

## Previous releases

### `v0.1.11-dev` (2026-11-20)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.11-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/44724380693 (success, 1m 12s)
* **Source commit**: `0a34c85f49ff67ad40fc0d1bf7899e0da3defa4b` (metadata commit: `1d0d45f`)
* **Published MPP** (`129,907` bytes): `2eb3a9df3113c288549ddcc1c495a868c307e585fbeb146a05af855743cbb891` (ZIP entry parity across all 17 entries with local build `e8cd50e81f6133f2561d18e78ad46ebe96b239e7a11aec3a353447d29a865f57`, differing only in `THIRD_PARTY_NOTICES.md` line endings).
* **Source ZIP SHA-256**: `9026b7fc0fd8fa28b9c5122217bfa29a4ccc2df7cb876abf3c48936beaca5d59`.
* `main/patches-bundle.json`: `"created_at": "2026-11-20T11:04:15"`, `"version": "0.1.11-dev"`.


### `v0.1.10-dev` (2026-11-20)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.10-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/44716250040 (success, 1m 4s)
* **Source commit**: `5212f2f6258828ad1e789e123ad75b1b7df77429` (metadata commit: `38a6376`)
* **Published MPP** (`125,636` bytes): `29e2bad20b46db8b731b928cfde5096c1dbd9de202d25655d792389454a4a186` (ZIP entry parity across all 17 entries with S10e-tested bundle `126d6d972ecf75f4dd439197c78c472b5739f23cad21f5fcf9af2351c3219453`, differing only in `THIRD_PARTY_NOTICES.md` line endings).
* **Source ZIP SHA-256**: `9e519a465954b6dc6cff4e8e03181d8355fc4571c470f45dc587a1fe1b83ffd5`.
* `main/patches-bundle.json`: `"created_at": "2026-11-20T10:06:33"`, `"version": "0.1.10-dev"`.

### `v0.1.9-dev` (2026-11-20)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.9-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/44698544166 (success, 1m 3s)
* **Source commit**: `950a9d4ea3dedbcdf3d22610ac8b0446b79dd399` (metadata commit: `131990a`)
* **Published MPP** (`131,929` bytes): `45cd8e71747a67552e21ef9b0782107cc50da2db35f791efdf7f2adaf9cfdbcb` (ZIP entry parity across all 18 entries with S10e-tested bundle `7d34bdd0f028b728f315919692e8a2eb9dc5c6c4197f7c338b23dd874bf2d401`, differing only in `THIRD_PARTY_NOTICES.md` line endings).
* **Source ZIP SHA-256**: `dd49cb237dc064a2c14c5c22cb9f0e02d425a80a01c64eb4d3b55ec6ed15cde3`.
* Verified live remote auto-update (`0.1.8-dev → 0.1.9-dev`) in Morphe Manager `2.6.0` on Galaxy S10e (`main/patches-bundle.json` `"created_at": "2026-11-20T07:56:27"` → GitHub Releases download → `0.1.9-dev` active).

### `v0.1.8-dev` (2026-11-18)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.8-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/44096981707 (success)
* **Source commit**: `41d58b1fc62190af00a532223296c0a362da4a3a`
* **Published MPP** (`127,693` bytes): `45233180b1accc88e4ad0f37bc643a60db9a6792df9a5d5b83e21dfeca146a85` (ZIP parity with S10e-tested bundle `9fcb3100f2e09933c8ac48226d7fb88ebf42cf8b13cbc15d786c9cf3ef39a168`).
* **Source ZIP SHA-256**: `5a5b03cebe4b71232ec4c72cb21eb37e71f45a4ba35ffc9cecc95a05b4adcee1`.
* Verified download and 6-patch loading via Morphe Desktop 2.1.1 / Patcher 2.3.0 with `--prerelease -x`.

Every release includes the `.mpp`, matching source ZIP, `LICENSE`, `NOTICE`, `THIRD_PARTY_NOTICES.md`, `patches-list.json`, `patches-bundle.json`, and `SHA256SUMS.txt`. Original/patched LINE APKs/APKMs, signing keys, account DBs, and private device logs/screenshots are excluded. Bundle publisher signatures are not yet configured; `SHA256SUMS.txt` provides integrity comparison only.

## Android Morphe Manager `2.6.0` on-device verification — 2026-11-20

Tested on Galaxy S10e (`SM-G970N`, Android 12 / API 31) with `app.morphe.manager` `2.6.0` (`versionCode 39922687`), without overwriting the existing LINE installation:

1. **Remote source metadata compatibility fix (`2da3dba6`)**:
   * Adding `https://github.com/gomjirak0803/line-notification-patches` causes Morphe Manager to fetch `https://raw.githubusercontent.com/gomjirak0803/line-notification-patches/main/patches-bundle.json` (and `dev/patches-bundle.json` when Pre-release patches is enabled).
   * Unlike Morphe Desktop, Morphe Manager `2.6.0` does not fall back to the GitHub Releases API, and its `LocalDateTimeSerializer` uses `java.time.LocalDateTime.parse`, which rejected timezone offsets (`+00:00`) with `DateTimeParseException` / `JsonDecodingException`.
   * Updated `scripts/prepare_release.py` and `patches-bundle.json` to emit UTC `YYYY-MM-DDTHH:MM:SS` without offset and added regression tests in `tests/test_bundle_metadata.py`.
   * Re-verified on S10e Morphe Manager `2.6.0`: remote source fetching and updates succeeded with both **Pre-release patches** OFF and ON, showing `LINE` (`26.16.0` / `261600106`, 6 patches) without error banners.
2. **On-device LINE `26.16.0` APKM patching**:
   * With **Expert mode** and **Experimental app versions** enabled, patched the official ARM64 APKM (`26.16.0` / `261600106`) with all 6 patches: merged 4 split APKs, applied 6/6 patches, recompiled resources, and signed in 28.5s (`output.apk` 221,809,392 bytes). Did not install over the existing app.
