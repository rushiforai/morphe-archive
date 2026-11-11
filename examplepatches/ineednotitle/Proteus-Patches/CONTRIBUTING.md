# Contributing to Proteus Patches

Thanks for helping improve Proteus. This guide keeps reports actionable and
patches safe to ship.

## Before opening an issue

- Search existing issues and the documentation in [`docs/`](docs/README.md).
- Reproduce with the latest **Morphe Manager** and the app version listed in the
  patch catalog.
- Include the exact patch name, app version, Morphe version, Android version and
  device model.
- Attach the patcher log and the relevant crash log when available. Remove
  tokens, account names and other personal data first.

Use the issue templates for bug reports and feature requests. Report security
problems privately as described in [SECURITY.md](SECURITY.md).

## Development setup

Requirements:

- JDK 21
- Android SDK platform 36
- Git

```bash
git clone https://github.com/ineednotitle/Proteus-Patches.git
cd Proteus-Patches
./gradlew buildAndroid
```

Useful checks before submitting a change:

```bash
./gradlew :extensions:extension:testDebugUnitTest :patches:generatePatchesList
python3 -m unittest discover -s .github/scripts -p 'test_*.py'
python3 .github/scripts/verify_android_bundle.py \
  patches/build/libs/patches-<version>.mpp <version> --patch-list patches-list.json
python3 .github/scripts/verify_patch_source.py patches-bundle.json <version>
```

## Patch guidelines

- Default heuristic or potentially disruptive patches to **off**.
- Fail safe: skip bytecode that does not match a known, verified shape.
- Scope patches with `compatibleWith(...)` and target only versions that were
  actually inspected.
- Use `extendWith("extensions/extension.mpe")` when a patch needs extension
  classes, and keep the class names in the bundle verifier up to date.
- Do not bypass server-side billing, Play Integrity or hardware attestation.
- Add or update tests for parsing, URL handling and pure helper logic.
- Update the relevant page in [`docs/`](docs/README.md) when behavior, limits or
  verification status changes.

## Commit and pull request style

Use [Conventional Commits](https://www.conventionalcommits.org/), for example:

```text
feat(reddit): add hide-read-posts filter
fix(mereframe): handle missing entitlement accessor
docs: clarify universal patch defaults
```

Pull requests should explain the problem, the approach and the verification
performed. Mark unverified device behavior clearly rather than presenting it as
tested. By contributing, you agree that your changes are licensed under
GPL-3.0-only.
