## What this changes

<!-- What the change does and why. Link the issue it fixes with "Closes #N". -->

## How it was tested

<!-- The app and its version, and whether you tried it in the app on a phone or an emulator. -->

- App and version:
- Tried in the app:

## Checklist

- [ ] The title is a [Conventional Commit](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:` ...), as the release notes are made from it.
- [ ] A new or changed patch has a `description` that says what it does; the patch lists in `docs/<app>/README.md` are generated from it at release.
- [ ] `./gradlew :patches:buildAndroid` passes.
- [ ] Quora: a changed page script has a check in `.github/page-scripts/dom-test.js`, and `.github/page-scripts/run.sh` passes; a new text in the settings is added to every `Texts<Lang>.java` (`python .github/scripts/check_texts.py`).
- [ ] Google Health: `python .github/scripts/check_google_health.py <apkm> --cli <morphe-cli.jar> --install` passes on a phone or emulator.
