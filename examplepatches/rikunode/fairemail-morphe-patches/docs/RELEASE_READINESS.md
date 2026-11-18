# FairEmail Morphe release-readiness audit

Audit date: 2026-10-29 JST. This report is a release-blocking checklist, not a claim that installed user data can be upgraded safely. Target: **the independent Morphe patch bundle**, not an upstream FairEmail release or a pre-patched APK.

## Product requirements traced from the original design

- Unrooted Android devices; no per-user Google Cloud setup.
- Preserve Gmail OAuth login when FairEmail's official GitHub APK is re-signed.
- Preserve access to an existing official app installation; do **not** uninstall or clear its data.
- Integrate upstream Morphe Clone app behavior into the **same patch source**, enabled by default, retaining the existing `.morphe` package suffix while explicitly disabling the separate Morphe Clone app selection.
- Hide the in-app support banner permanently.
- Expose FairEmail local Pro functionality without falsely representing purchase or changing app store transactions.
- Export encrypted account/settings backups, transfer them to another device, and import successfully.
- Suppress intrusive changelog popups while preserving the manually viewable changelog.
- Make the patch bundle obtainable and updateable from Morphe Manager with a GitHub source, reproducible builds and exact APK version pins.
- Publish reproducible, reviewable, clearly unofficial GPLv3 source; do not distribute personal credentials or private keystores.

## Evidence and precise verification boundaries

| Feature | Status | Evidence / limitation |
|---|---|---|
| Source distribution via Morphe Android | VERIFIED FOR PREVIOUS BUILD | User screenshot of older source recognized. New dev.3 six-patch index and GitHub Release URL verified remotely; Android Manager on-device dev.3 refresh still pending |
| Kotlin compile, Android .mpp build and exact six-patch APK application | VERIFIED | GitHub Actions run 40826756073: compiled, all six patches applied to hashed 1.2338a APK, rebuilt unsigned APK, package name checked |
| Integrated clone (sixth patch, compiled/rebuilt) | VERIFIED CI / DEVICE PENDING | Manifest package `eu.faircode.email.morphe`; all four provider authorities match original Morphe Clone app v1.48.0 in CI. Device update/signing-key continuity still untested |
| Google consent and Gmail account-added dialog on modified build | VERIFIED UI | User-supplied Android screenshots, 2026-10-29 |
| Reading a newly received Gmail email from another account | VERIFIED UI | User-supplied FairEmail screenshot plus Gmail connector send and inbox read-back, 2026-10-29 |
| Password-backed settings export produced a nonempty file | VERIFIED FILE | User attached a 14,336-byte .backup; binary header/entropy and length match encrypted backup format, no decryption attempted |
| Account settings imported on another device | USER-REPORTED SUCCESS | User explicitly confirmed import success; the resulting Gmail sync after import has not been verified |
| FairEmail SMTP transmission to another mailbox | NOT YET VERIFIED | Gmail connector sending **to** FairEmail is not a test of outgoing SMTP **from** the modified APK |
| Imported Gmail OAuth refresh after token expiry / app restart | NOT YET VERIFIED | Must test without manually logging in again |
| Upgrade a clone in place with retained data and identical signing key | NOT YET VERIFIED | Preserve signing certificate and package identity; no uninstall/reinstall |
| Changelog popup hidden on first eligible startup | NOT YET VERIFIED | Compiled and published patch only; user has not confirmed on-device behavior for dev .2 |
| Entire local Pro feature suite | NOT YET VERIFIED | Both Pro and export-only patches were previously selected; export success cannot isolate the global Pro check |
| Other Gmail / Outlook OAuth providers or Android variants | NOT YET VERIFIED | Tested path is Gmail on the supplied build |
| Exact six-patch application to pristine pinned APK, unsigned rebuilt APK integrity | VERIFIED CI | All six applied and APK ZIP/build/manifest passed in GitHub Actions 40826756073 |

## P0 device-acceptance gates — required before claiming seamless migrations

The stable-channel v0.3.0 **patch bundle distribution** can be published with clearly labeled experimental features and non-destructive install instructions. These remaining P0 tests are **required before we can claim production-grade Gmail OAuth refresh, full SMTP behavior, or safe in-place data-preserving clone migration**. Publication does **not** mark these tests as passed.

1. Confirm the **imported** account on the destination Android device receives a **new** message, not only folders that came from the backup.
2. Send a message **from the patched FairEmail** and confirm delivery to a different mailbox (SMTP).
3. Test refresh after the existing access token expires (typically ~1 hour or greater), app restart, and another delayed sync; verify no reauthorization required. Repeat on the destination device.
4. Before an update, run the new **read-only signed clone preflight** (`scripts/check_clone_upgrade.py --candidate ...`): it refuses package, versionCode or signing certificate mismatches. Then separately test actually updating the installed clone with the **same certificate** and **same package name**, without uninstalling/clearing data, while retaining accounts and the new token. Do not copy private signing keys into the repository.
5. Confirm the published six-patch development bundle suppresses the *automatic* changelog dialog after the appropriate first-run/version transition; confirm the manual changelog is still available.
6. **CI PASS:** All six patches applied to the exact hashed upstream 1.2338a APK and rebuilt successfully; package name and four provider authorities matched pinned upstream Morphe Clone app. **Still required:** install/update the new built-in-clone APK on a device with the **same signing key**, retain accounts, confirm Gmail mail/token behavior, and verify any device permissions/provider edge cases.
7. Capture the release permissions provenance privately (user reports upstream developer and Google consent for the intended OAuth use). Do not publish private correspondence or claim that a client ID alone demonstrates permission.

## P1 tests and hardening

- Verify optional features independently: export-only with global Pro **off**; global Pro on with export-only **off**; changing these options must not alter purchase records.
- Verify Gmail account setup with and without Clone app to distinguish the OAuth callback receiver; confirm the actual installed package identity.
- Verify failure modes: wrong backup password, damaged backup, duplicate import/account, missing credentials, corrupted/unsupported APK, missing network, and account revoked externally.
- Test fair use on 1.2337a: only the three compatible patches should appear; OAuth/changelog should be 1.2338-only.
- Check Android supported versions and ARM64/ARM32 compatibility, package and keystore migrations, and the first-launch welcome experience.
- Confirm notification/sync service behavior after reboot and with battery restrictions.
- Confirm final release notes/README match present evidence, not historical v0.2.0 test status.

## Backup security and privacy

FairEmail 1.2338 exports a JSON object including account and identity records, rules, folders, preferences, and potentially live OAuth refresh state in the account/identity `password` fields. **An exported file is credential-bearing sensitive data.**

- A **nonempty passphrase is mandatory**; the original code writes plain JSON when the password is empty.
- In 1.2338, the password-encrypted v0 format uses PBKDF2-HMAC-SHA1 (65,536 iterations), a random salt and IV, and AES-256-CBC. This provides confidentiality given a strong password but is **not authenticated encryption**; corruption/tampering is not reliably detected cryptographically.
- Use a unique strong passphrase, keep two separate private copies of the encrypted backup, and test restoration before deleting any original data.
- Never upload the user's backup, OAuth tokens, private signing keystore, or account-specific logs to public GitHub Releases, CI artifacts or README examples.
- The backup is primarily settings/account data, not a complete offline mailbox archive.

## Release artifact and channel design

- **main**: promotion candidate `v0.3.0` contains all six patches; earlier release tag/assets `v0.2.0` are never overwritten. All public claims remain scoped to verified evidence.
- **dev**: published `v0.2.1-dev.3`, six patches; GitHub source metadata and release asset agree. The integrated clone is APK-smoke-tested but **not yet data-preserving device-update verified**.
- **release/readiness-0.3.0**: documentation and tests for the next stable candidate, NOT an announcement of a completed release.
- Release candidate `v0.3.0-rc.1` has already been compiled, smoke-tested and released separately. Stable `v0.3.0` requires fresh CI validation and is published as a *new* release, never a replacement of older release assets.
- Ship the **.mpp patch bundle and source**, not a pre-signed FairEmail APK or user-specific backup.
- Provide the exact original APK link/hash, compiled bundle SHA-256, Git commit SHA, compatibility matrix, known issues, update/rollback procedure and changelog.
- Preserve version pinning; avoid rewriting a published tag or release asset. Test Morphe Android index loading, not only JVM/Gradle compilation.
- Confirm API use is covered by permissions before advertising widespread public Gmail OAuth compatibility; the user's stated permission is not independently verifiable from repository contents.

## Latest independently reproduced build evidence

- GitHub Actions: https://github.com/rikunode/fairemail-morphe-patches/actions/runs/40826756073 — PASS.
- Upstream original: FairEmail 1.2338a APK SHA-256 `666b9f4ada53f69199355f1ccc2bed73e01fa23786fc0189cf81cc51932dc5a9`.
- Official comparison: Morphe patches v1.48.0 MPP SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`.
- Integrated built APK: six patches applied, unsigned ZIP validated, package `eu.faircode.email.morphe`.
- Provider authority parity: `eu.faircode.email.morphe.androidx-startup`, `eu.faircode.email.morphe.cropper.fileprovider`, `eu.faircode.email.morphe_androidx.car.app.connection`, `eu.faircode.email.morphe_eu.faircode.email`.
- GitHub pre-release: https://github.com/rikunode/fairemail-morphe-patches/releases/tag/v0.2.1-dev.3 — MPP 67,313 bytes, SHA-256 `056d79b358e44d58d0c033a76194d12a2d12ec211bb3ffadd4b647246173afb1`.

## Go / no-go

**Current status: STABLE-CHANNEL PATCH DISTRIBUTION CANDIDATE; EXPERIMENTAL DEVICE FUNCTIONS NOT FULLY ACCEPTED.** The code/publishing chain and six-patch APK rebuild are CI-verified. Account import is user-confirmed; destination sync, outgoing SMTP, token refresh, clone update signing, real-device changelog suppression and data-preserving upgrade still require direct evidence. Do not convert these to PASS based on static tests or a successful MPP build. Stable-channel release notes prominently disclose these limitations.
