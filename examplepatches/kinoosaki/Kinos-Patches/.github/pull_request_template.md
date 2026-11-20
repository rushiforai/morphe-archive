<!-- Thanks for contributing. Please read CONTRIBUTING.md and open this against `dev`, not `main`. -->

## What this changes

<!-- One app per pull request. Which app, which patches, what they do. -->

## Checklist

- [ ] The base branch is `dev`.
- [ ] The app is in `Constants.kt` with **one** `AppTarget` (the newest version I verified) and a dated note.
- [ ] I checked the APK's signer and kept or updated the `signatures` hash.
- [ ] Anchors do not rely on obfuscated names; mandatory anchors use `.method`; smali goes through the checked helpers.
- [ ] Descriptions are one short plain sentence; names match the existing ones; optional features default to off.
- [ ] I added or updated `<App>SmokeTest.kt` and it passes with the real APK.
- [ ] I did not edit generated files (`patches-list.json`, `patches-bundle.json`, the README patch list, `CHANGELOG.md`, `gradle.properties`), and my branch has no release commits from my fork.
- [ ] No APKs, keystores, tokens or local paths are included.
- [ ] I did not change build files, workflows or tooling (or I explained why below).

## How I checked it

<!-- Smoke test output; what you saw in the patched APK (method names); whether you ran it on a device
     and which version/device. "Not run on a device" is a fine answer. -->

## Anything else

<!-- Other bundles you took ideas from, known limits, apps/versions tested. -->
