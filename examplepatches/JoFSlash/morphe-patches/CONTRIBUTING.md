# Contributing

Thanks for helping. Each app is patched differently, so each has its own guide, `docs/<app>/CONTRIBUTING.md`,
next to its page (for example [Quora](docs/quora/CONTRIBUTING.md) and
[Google Health](docs/google-health/CONTRIBUTING.md)). It says how the app is patched and how to try the patches
on a phone or emulator with its `check_<app>.py` script, as the emulator test does.

Please follow the [code of conduct](CODE_OF_CONDUCT.md), and report security problems privately as described in
[SECURITY.md](SECURITY.md).

## Where things are

- `patches/src/main/kotlin/app/jofslash/patches/<app>/`: the patches. The folder of each app is in its
  settings, `.github/apps/<app>.json`.
- `extensions/<app>/`: the code those patches call inside the app. Each app has its own extension, so a patched
  app gets only its own code. A patch loads it with `extendWith("extensions/<app>.mpe")`.
- `docs/<app>/README.md`: the app's page. The patch tables in it are generated from the patches' descriptions
  at release (`.github/scripts/generate_readme.py`, set up by `"readme"` in the app's settings).

## Adding an app

An app brings its own files and changes none of the shared ones, so pull requests for different apps don't
get in each other's way:

- `.github/apps/<app>.json`: the app's settings, read by the shared scripts, so a new app needs no script
  of its own:
  - its name, Play Store link, package name and one-line summary (for the README table and the issue forms),
    and its owners (for the README's "Not affiliated with" line);
  - `readme`: how its page lists the patches, `generated` from the descriptions or `kept` hand-written rows
    (`.github/scripts/generate_readme.py`);
  - where its APK is in `JoFSlash/morphe-apks`, the Android versions to test and the check command (and
    `test_inputs`, other files the check uses);
  - `checks`, only for what is special about its emulator check: the log tag for the patches' errors, the
    screen to wait for, permissions to grant, the clone patch. Every app is checked with
    `.github/scripts/check_app.py <app> <apk>`; code only one app needs goes in `.github/scripts/apps/<app>.py`
    (the docstring of `check_app.py` lists the hooks);
  - `versions`: how the daily version workflow finds and checks new versions: the version pattern, where new
    versions come from (`apkmirror`, `apkpure` or `hand`), the file kind, certificates and the pull request
    texts (see `.github/scripts/app_versions.py`). `add_version.py`, `watch_version.py` and `fetch_apk.py`
    take the app's name.

  An app is tested on the emulators after a merge into dev changes its code (`emulator-tests.yml`), and the
  release tests whatever wasn't (`.github/scripts/tested.py` keeps track). The release writes the README
  table, its owners line and the issue forms' app lists from these files (`.github/scripts/sync_apps.py`).
- `.github/workflows/emulator-<app>.yml`: runs `emulator-app.yml` for the app's own pull requests.
- `.github/workflows/<app>-version.yml`, if it has one: a short wrapper with its own schedule around
  `app-version.yml`.
- `docs/<app>/README.md` and `docs/<app>/CONTRIBUTING.md`.

## Building

Requires JDK 21 and a GitHub token with `read:packages`:

```bash
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid
```

The bundle, with every app's patches, is written to `patches/build/libs/patches-*.mpp`.

## Pull requests

Work on a branch from `dev` and open the pull request against `dev`: the weekly pre-release is made from it, and
the stable release from main. Give the pull request a [Conventional Commit](https://www.conventionalcommits.org/)
title (`feat:`, `fix:`, `docs:` ...), as the release notes are made from it.
