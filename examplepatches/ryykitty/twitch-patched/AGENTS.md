# Contributor instructions

## Scope

Build independent Twitch Android patches compatible with Morphe. Each feature has its own patch, runtime code and explicit dependencies.

## Layout

- `patches/src/main/kotlin/dev/twitchpatches/patches/twitch/`: patch entry points, hook contracts and bytecode transformations, grouped by feature.
- `extensions/twitch/src/main/java/dev/twitchpatches/extension/`: runtime state and policy, grouped by feature.
- `shared/ivs-api/`: compile-only SDK signatures.
- `scripts/`: reproducible build, test and APK evaluation tools.
- `config/`: tool pins and public compatibility evidence.
- `.local/`: ignored originals, tools, signing keys, research and run artifacts.

## Changes

Use Kotlin for patches and Java for extensions. Keep feature code together and share helpers when several features need them. Prefer small functions and files under 250 lines.

Resolve hooks from strings, types and control flow in the original APK. Derive obfuscated members from matched instructions. Require a unique match and a clear error for missing hooks.

Preserve register types, parameters, labels, exception handlers and Twitch's scheduler. Use typed bridges for injected calls. Keep network and parsing work off the UI thread; scope caches and cancellation to the player or channel lifecycle.

Keep preference keys stable and settings limited to selected patches. Use native Twitch layouts and concise labels. Comments should explain a constraint that the code cannot express clearly. Diagnostics use categories and counts.

Every modifying patch must depend on the shared settings integration, which includes notification registration, theme synchronization and DJ playback settings. APK inspection remains read-only.

Retain licenses and attribution when adapting upstream code. Keep originals, decompilations, signing material and run artifacts under `.local/`.

## Verification

Run `scripts/check-source.ps1`, `scripts/build.ps1`, `scripts/test.ps1` and `npm test`. Cover behavior changes with parser, lifecycle or synthetic DEX tests.

Evaluate changed hooks with full DEX recompilation and original-aware SDK verification, then test on a device. Record the app identity, patch selection and results in `config/compatibility.json`.

Device updates retain the package identity, signing key and app data. Installation and publication require an explicit request.

## Releases

Target `dev` and use semantic commits. The existing semantic-release pipeline generates release metadata. Stable releases use a normal merge from `dev` into `main`, without squash.

See [maintenance](docs/MAINTENANCE.md) for version upgrades and releases.
