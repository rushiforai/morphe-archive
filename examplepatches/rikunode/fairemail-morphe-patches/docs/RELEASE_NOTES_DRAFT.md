# DRAFT — FairEmail Morphe v0.3.0 release notes (NOT PUBLISHED)

This is an independent, unofficial Morphe patch bundle for the upstream FairEmail GitHub APK. The target stable version, date, checksum and final compatibility decisions must be set **only after the release-readiness gates pass**.

## Planned changes since v0.2.0

- Keep the permanent in-app support banner hiding patch.
- Keep experimental local Pro checks and built-in encrypted export access, both opt-in.
- Add experimental Gmail/other-provider OAuth setup entry for re-signed FairEmail 1.2338, opt-in.
- Add automatic changelog popup suppression for FairEmail 1.2338, enabled by default (manual changelog preserved).
- Add a built-in `Clone FairEmail alongside official app` patch (default ON, 1.2338 only), adapted from Morphe's GPLv3 universal Clone app and preserving `.morphe` naming. **Disable Morphe's other Clone app patch** when using it.
- Continue shipping an Android-loadable Morphe `.mpp` with `classes.dex`, not a pre-modified APK.
- Preserve original APK checks, fail-closed instruction guards, and an independent pre-release development channel.

## Verified so far

- Morphe Android recognized the earlier patched source; the six-patch development bundle built successfully and all six patches applied to a clean hashed FairEmail 1.2338a APK in GitHub Actions.
- Google consent + Gmail account added on a user test phone.
- User observed an incoming mail from a separate Gmail account using the modified app.
- Encrypted backup export file created and an account import to a different phone reported successful.

## Not yet verified — no stable claims

SMTP send from patched FairEmail, imported account *new* sync/refresh, unattended token refresh after expiration, safe in-place clone upgrades with the same key, integrated-clone **on-device upgrade** test, automatic changelog suppression on-device. **CI six-patch APK reconstruction and provider authority parity already PASS.**

## Safety notices

- Preserve old installed app and data, signing keys and a password-protected tested backup.
- Re-signed APKs cannot normally update officially signed installations in place.
- No credentials, personal backups or signing keys are distributed.
- The OAuth implementation relies on provider-side policies; the developer's and service provider's relevant permissions must be retained as release evidence.
- GPL-3.0 source; **not** an upstream FairEmail/FairCode/Morphe release.

## Release engineer placeholders

- Git commit:
- Source release:
- Upstream APK SHA-256:
- MPP SHA-256:
- CI run:
- Device + Android OS:
- App package + signing certificate fingerprint:
- Incoming test:
- Outgoing SMTP test:
- Token refresh (source and destination):
- Backup restore and read-back:
- Clone update without data wipe:
- Changelog suppression test:
- Distribution permissions check:
