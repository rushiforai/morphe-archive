# Combined Runtime APK Install Decision - Step 76

This document records the runtime APK install decision for the held combined Boost-for-Reddit candidate.

## Candidate

- Branch: `work/boost-combined-bundle-dev1`
- Local candidate version: `1.4.32`
- Reserved tag: `morphe-patches-32`
- Candidate APK: `local-artifacts/boost-candidates/20260629-103817-combined-runtime-1432-noverify-settings/boost-candidate.apk`
- Candidate APK SHA256: `d3bcf9636749b5cf767dd05b9ec96382f4bc0bc5a5ac27c5af4857b9d89ef726`
- Publish status: `HELD_NOT_PUBLISHED`
- End-user release: `NO`

The candidate APK was built from the original APKMirror Boost 1.12.12 APK with:

- no SDK verifier
- `Boost Morphe settings` enabled
- `Spoof client` enabled
- `Modify login WebView` enabled
- `Fix Boost target SDK 35 compatibility` enabled
- `Automatically undelete Reddit content` enabled
- runtime media tap-action settings present

## Installed package

Installed normal package detected by ADB:

- Package: `com.rubenmayayo.reddit`
- Version: `1.12.12`
- targetSdk: `35`
- Installer: `app.morphe.manager`

## Signer comparison

- Candidate signer SHA256: `5082634544a591c79c2cc0a76045fbd7dcc87ede6bc3cd5babeab33055fba8e4`
- Installed signer SHA256: `9b335d56295b9674b47848122129b746f3944b7f074564124e28fc7003ac4bc8`

These signers do not match.

## Decision

`adb install -r` over the installed normal package is blocked.

- Install decision: `DO_NOT_DIRECT_UPDATE_SIGNER_MISMATCH`
- Install allowed: `NO`
- Install performed: `NO`

Do not run direct `adb install -r` with this candidate over the installed normal Boost package.

## Safe next paths

### Preferred path: Manager-signed runtime path

Use a Manager-controlled patch/update flow if runtime testing must preserve the existing installed package, signer compatibility, appdata, and login state.

This is the preferred path for normal-package runtime validation.

### Alternative path: explicit clean install

A clean install can be considered only after an explicit decision to accept appdata/login reset risk.

This path must be treated as destructive unless proven otherwise.

## Release rule

This signer mismatch does not invalidate the local MPP or source gates. It only blocks direct CLI-built APK update over the Manager-installed normal package.

The combined bundle remains held and must not be published until runtime validation is completed or explicitly classified.
