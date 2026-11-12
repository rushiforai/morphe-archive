# Contributing

Thanks for wanting to help. This project is a [Morphe](https://github.com/MorpheApp) patch
bundle: small, reviewed patches for the apps listed in the README. A patch that silently does
nothing, or that breaks the app, is worse than no patch, so the bar below is about being able to
trust what ships. Reading this first saves you a round of review.

## Before you start

- **New app or big feature:** open an [issue](https://github.com/heval99/Heval-Morphe-Patches/issues/new/choose)
  first and say what you want to patch and why. Check `docs/patch-blocklist.md` for apps that were
  tried and the reason they were dropped or blocked.
- **Small fix or an update to a newer app version:** a pull request is fine without an issue.
- **Scope.** Patches that remove ads, trackers and nags, customise the app, or unlock a feature that
  is gated by a **local** check are welcome. Out of scope: premium or paywall features that the
  **server** decides (a patch cannot honestly provide them), Wear OS work, and anything that
  harms users or other people's accounts or data.
- Apps that are already patched in another bundle are still fine here.

## Which branch

Open your pull request against **`dev`**, not `main`. Releases are cut from `dev`; `main` only
receives the stable release. GitHub shows `main` as the default branch, so change the base branch
in the pull request form.

Work on a **topic branch created from `dev`** in your fork, not on your fork's `main`. If your
fork's own release workflow runs, it commits release files (a version, a changelog, a download link
to your fork) to the branch it runs on, and those commits must never end up in a pull request.

## How the repo is laid out

| What | Where |
|---|---|
| Patches | `patches/src/main/kotlin/app/template/patches/<app>/<concern>/` (one folder per app) |
| Anchors (`Fingerprint` objects) | a `Fingerprints.kt` next to the patch |
| The app's package, signer and verified version | `COMPATIBILITY_<APP>` in `patches/src/main/kotlin/app/template/patches/shared/Constants.kt` |
| README category | `.github/scripts/app-categories.json` |
| Smoke tests | `patches/src/test/kotlin/<App>SmokeTest.kt` |
| Runtime code a patch needs | `extensions/<module>/` (only when inline smali is not maintainable; copy `extensions/shazam`) |

**Do not edit generated files:** `patches-list.json`, `patches-bundle.json`, the patch list in
`README.md`, `CHANGELOG.md` and the version in `gradle.properties` are written by the release
workflow. `patches-bundle.json` is the file Morphe Manager reads to find the download, so a change
to it would send every user to a different bundle: a pull request that touches it will not be merged.

## Rules for a patch

- **One `AppTarget` per app: the newest version you verified.** On an update, replace the target and
  the test's version, do not append. Check that the APK's signer matches the developer's and keep or
  update the `signatures` hash in the `Compatibility`.
- **Add a dated note** in `Constants.kt` saying what you verified (version, what you tested,
  what you did not). Keep it truthful: "not run on a device" is a fine thing to write.
- **Fail loudly.** Use `.method` for anchors that must match. `methodOrNull?.` makes a patch report
  "Applied" while changing nothing once an update renames the target.
- **Do not anchor on obfuscated class or method names.** They change every release. Use stable strings,
  library APIs, resource ids, or the method's shape (return type, parameters, a unique string).
- **Patch every overload or implementation that matters**, not only the first match.
- **Inline smali:** use the checked helpers in `shared/CheckedInstructions.kt`
  (`addInstructionsChecked` and friends). The inline compiler silently drops an instruction it
  rejects, such as a register above v15 in a 4-bit operand.
- **Do not hard-code resource ids** (`0x7f0a...`) or assume what a register holds (for example "v0 is
  the tab list at this return"). Ids shift between releases and registers are reassigned, so a patch
  that worked once can hide the wrong view or make the method fail verification and crash the app at
  start. Look resources up by name and pick registers from the code you are patching.
- `returnEarly()` only works on void methods; use `returnEarly(value)` for booleans and ints, and skip
  abstract methods (`implementation == null`).
- If a patch stops `MobileAds.initialize`, also stop every other concrete static on `MobileAds`, or the
  app crashes at start.
- A resource or manifest patch re-encodes the whole resource table and can change string values: diff
  the stock and patched strings.
- **Names and descriptions:** reuse the existing patch names ("Disable ads", "Disable telemetry",
  "Enable Premium", ...). A description is **one short plain sentence**, without SDK or class names.
  Optional features should default to off.
- No network calls, telemetry, extra permissions or components that are not part of what the patch
  says it does.

## Tests and checking your work

Each app has one `<App>SmokeTest.kt` that patches the real APK and asserts on the emitted bytecode.
The tests skip when the APK is missing (APKs are never committed), so run them locally:

```
.\gradlew -Pkotlin.daemon.jvmargs=-Xmx4g -Dorg.gradle.jvmargs=-Xmx3g :patches:cleanTest :patches:test --tests <App>SmokeTest --no-build-cache
```

Put the APK at `apks/<slug>/base.apk` first. The test fails if the APK's package or version differs
from the version it passes or from the patch's target, which is on purpose.

"Applied" only means the patch ran. In your pull request, say how you confirmed the real effect:
the smoke test asserts, and you looked at the patched APK (for example `apkanalyzer dex code --class
<name>`, or jadx) and saw the changed method. State plainly whether you ran it on a device.

APK sources: get the APK from Google Play or the developer, check the signer, and prefer arm64-v8a
builds. Do not use user-uploaded stores; modified repackaged APKs have been found there.

## Commits and pull requests

- **One app per pull request**, and keep it small.
- Commit messages follow Conventional Commits. `fix:` and `feat:` produce a release; `docs:`, `test:`,
  `chore:` do not. An update reads `fix(<app>): updated to version X`.
- Do not mix patch changes with changes to build files, workflows, scripts or tooling. Those get a
  closer review in a separate pull request.
- Never commit APKs, keystores, tokens, decompiled sources or local paths.
- The pull request template has a short checklist; please fill it in.

## Licence and credit

The project is GPL-3.0. By contributing you agree your work is released under it. Do not copy code
from a project whose licence is not compatible, and say in the pull request if an idea or code came
from another bundle. Tools that helped you (including AI assistants) are fine, but you are responsible
for the result: run the tests and read what you submit.

## Review

Pull requests are read before anything is built or run, because patches execute code on the
maintainer's machine. A pull request that adds anything unrelated to its description, or that touches
build, workflow or tooling files without a clear reason, will be declined. Review is by one
maintainer, so replies can take a while; there is no promised date.
