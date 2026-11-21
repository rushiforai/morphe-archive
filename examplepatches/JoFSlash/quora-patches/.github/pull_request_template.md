## What this changes

<!-- What the change does and why. Link the issue it fixes with "Closes #N". -->

## How it was tested

<!-- The Quora version, and whether you tried it in the app on a phone or an emulator. -->

- Quora version:
- Tried in the app:

## Checklist

- [ ] The title is a [Conventional Commit](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:` ...), as the release notes are made from it.
- [ ] A changed page script has a check in `.github/page-scripts/dom-test.js`, and `.github/page-scripts/run.sh` passes.
- [ ] A new text in the settings is added to every `Texts<Lang>.java` (`python .github/scripts/check_texts.py`).
- [ ] A new or changed patch has a `description` that says what it does; the README list is generated from it at release.
