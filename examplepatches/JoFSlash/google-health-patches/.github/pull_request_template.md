## What this changes

<!-- What the change does and why. Link the issue it fixes with "Closes #N". -->

## How it was tested

<!-- The Google Health version, and whether you tried it in the app on a phone or an emulator. -->

- Google Health version:
- Tried in the app:

## Checklist

- [ ] The title is a [Conventional Commit](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:` ...), as the release notes are made from it.
- [ ] A new or changed patch has a `description` that says what it does; the README list is generated from it at release.
- [ ] `python .github/scripts/check_app.py <apkm> --cli <morphe-cli.jar> --install` passes on a phone or emulator.
