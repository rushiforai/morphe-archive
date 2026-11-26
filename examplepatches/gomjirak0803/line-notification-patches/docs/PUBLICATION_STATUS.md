# Publication Status — 2026-11-25

## Latest release (`v0.1.19-dev`)

* **Repository**: https://github.com/gomjirak0803/line-notification-patches
* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.19-dev
* **Add in Morphe Manager**: https://morphe.software/add-source?github=gomjirak0803/line-notification-patches
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45584419030 (success, 1m 15s; `Build patch-only assets` + `Run full Python test suite` gated before publish)
* **Source commit**: `483f016` (metadata commit: `c90db01`)

Adds 64-bit random non-zero `SLOT_EPOCH` alongside monotonic `SLOT_GEN` in a unified 256-cap `SLOT_LEDGER`, pre-SQL and strict numeric `isVerifiedReadAtOrBefore` READ-boundary checks (with `DISCARD` redaction on privacy-OFF active refreshes), `QUIET`/`NORMAL` channel preservation across hide/unhide and crash recovery (`pending_hide`, single-`STATE_LOCK` `hideDisposition` without native I/O, worker-based `onHideCompletedAsync` + lock-verified `cancelConfirmedHiddenChats`, `RECONCILING_ACCOUNTS`/`RECONCILED_ACCOUNTS` retry), privacy-OFF redaction of active plaintext/summary/sticker/car/wearable/remote-input extras and rebuilt summary `publicVersion.shortcutId`, standalone `No reply` original contextual-action restoration (`ORIG_CONTEXTUAL_ACTIONS`), and `enqueuedSeq`-ordered shared-summary `PENDING_POSTS` (verified with 224 `NotificationPolicy` assertions, 271 `ExtensionRuntimeTest` JVM behavioral checks across 44 scenarios, 27 Python tests, 5 APK static contract suites — 3,165 ARM64/Universal, 3,103 `read-only`, 3,125 `info-only`, 3,143 `silent-only` — and live Galaxy S10e verification covering Smokes 1, 2, 4, 5, 6A/6B PC LINE read-sync, and 7). The published `line-notification-patches-0.1.19-dev.mpp` is `210,430` bytes with SHA-256 `a1567ed3a4f0c8025f570058cb70f3711c7107e511e3e2c37a1486142fed0f41`, matching `SHA256SUMS.txt` and the directly downloaded asset. Comparing all 18 ZIP entries against the local build (`490bd01f14c70d4827d2c05f2f0c7de8e3cf9d289a19c05ef35bc3434e72ab8b`) confirmed byte-for-byte parity across every executable class, DEX, extension, resource, and manifest entry (differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings). The source archive (`381,651` bytes, 135 files) SHA-256 is `2c493650973db8240cbbbe7953b0cea9a9d4f47333bd564126ec401b0edd0bd0`. `main/patches-bundle.json` was updated to `"created_at": "2026-11-25T09:21:15"` and `"version": "0.1.19-dev"`, passing all 27 Python tests.

## Previous releases

### `v0.1.18-dev` (2026-11-24)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.18-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45352102840 (success, 56s; `Build patch-only assets` + `Run full Python test suite` gated before publish)
* **Source commit**: `a6917d7` (metadata commit: `2fc15e3`)
* **Published MPP** (`193,941` bytes): `307c347b333918e187add9685555ad9f3f3ab2f23420bff13960c6ee8420a8d7` (ZIP entry parity across all 18 entries with local build `66ef29a6e97b4c6125e02a425d72f38f982a0516f3fb3b034d1b15e6595582b2`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `f327d1a2f658ba3b62609b46584176154a77c102ce5fc53c3c797081396391fa`.
* `main/patches-bundle.json`: `"created_at": "2026-11-24T07:58:56"`, `"version": "0.1.18-dev"`.

### `v0.1.17-dev` (2026-11-24)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.17-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45344792353 (success, 52s; `Run full Python test suite` gated before publish)
* **Source commit**: `3f47d0f` (metadata commit: `71d5ad9`)
* **Published MPP** (`192,962` bytes): `7b32494555c54e44b3fdb296c8c71efc6ec9b2e3683bcb2bb099e536b155efa7` (ZIP entry parity across all 18 entries with local build `28498d47f29f80e8b3fc2bd6226639b8f3f7b05599e3365871fb794b478d0775`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `65d59e47e9367d4d4576c74874b45acc054cebbdf52f4c6d291548146b50b1b3`.
* `main/patches-bundle.json`: `"created_at": "2026-11-24T07:02:12"`, `"version": "0.1.17-dev"`.

### `v0.1.16-dev` (2026-11-24)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.16-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45332528762 (success, 1m 11s)
* **Source commit**: `c52ba2a` (metadata commit: `854660c`)
* **Published MPP** (`191,406` bytes): `2a917519d45a88917e6336111b7cb29c03cb3891352541b0a79f6afa2e88fd35` (ZIP entry parity across all 18 entries with local build `3874871e12eee720b78fbf9d3c71b2eb063afff081327da68e314f70301485fa`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `dff4079e9bef27b7c727c5faa695451183f8e9df4b596be65cb49e3d4aaa428f`.
* `main/patches-bundle.json`: `"created_at": "2026-11-24T05:20:43"`, `"version": "0.1.16-dev"`.

### `v0.1.15-dev` (2026-11-23)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.15-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45179405588 (success, 56s)
* **Source commit**: `24b8d4f` (metadata commit: `fc2c525`)
* **Published MPP** (`188,803` bytes): `fc8819928de86094aedf815cbff4281e3a0a572b58ee1bc720269257d2d1fe1f` (ZIP entry parity across all 18 entries with local build `a34d8102b3e08a415d79026dc167705c01df6f5f01b51e39151c699d54220c3a`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `ab40f3ccbed4cf2aec0ac762c820d9b37d975bfcde1ebec28fc16df7a62fb365`.
* `main/patches-bundle.json`: `"created_at": "2026-11-23T12:59:43"`, `"version": "0.1.15-dev"`.

### `v0.1.14-dev` (2026-11-23)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.14-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45176712044 (success)
* **Source commit**: `d52cf9b` (metadata commit: `661ed16`)
* **Published MPP** (`188,826` bytes): `af28222772b6554ecff45ca09e1778b407d9a86d8475608264cd7aa6b1d48ece` (ZIP entry parity across all 18 entries with local build `9238891cbaee2ca1a27045c1d73e115804ae539f73a3469fde2ee349d36441aa`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `f5c97b5baa60c41aec74945e680155beeff12a755fe8c1ce65f3037f7825de65`.
* `main/patches-bundle.json`: `"created_at": "2026-11-23T12:42:36"`, `"version": "0.1.14-dev"`.

### `v0.1.13-dev` (2026-11-23)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.13-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45126406640 (success)
* **Source commit**: `45aafdb` (metadata commit: `885ab30`)
* **Published MPP** (`153,623` bytes): `a1a9e4111f23a0f3991af17cc90658be99f02b77e4718e8d2e380b8a6dbfbddf` (ZIP entry parity across all 18 entries with local build `6bd69dc56b516d282f394492848af2b4aac7ea8c32c5c23bc865978805eaeb7d`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `b5a7cf94ddd5cc6544bc1b6d7ec75d0bdb3aff54cf282ffa58d90ded5cbb62a6`.
* `main/patches-bundle.json`: `"created_at": "2026-11-23T06:47:33"`, `"version": "0.1.13-dev"`.

### `v0.1.12-dev` (2026-11-23)

* **Release**: https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.12-dev
* **GitHub Actions run**: https://github.com/gomjirak0803/line-notification-patches/actions/runs/45045235396 (success)
* **Source commit**: `8a6fad2` (metadata commit: `c8fd0c5`, doc update: `4a6d97c`)
* **Published MPP** (`150,358` bytes): `645ac1a650f5ec37888ca3309b92aa3816183a2c935cfb6c7813585b398f8860` (ZIP entry parity across all 18 entries with local build `061d3091dce1aa0c53610272e13bbd911434a282a9ebbeef0e3f210e9d28a54c`, differing only in `THIRD_PARTY_NOTICES.md` CRLF/LF line endings).
* **Source ZIP SHA-256**: `b867db725da3d4dff1327608b60852ff6729cb096897d84d26e196e1c247552c`.
* `main/patches-bundle.json`: `"created_at": "2026-11-22T16:42:24"`, `"version": "0.1.12-dev"`.

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
