# Contributing

Thanks for helping. Each app is patched differently, so each has its own guide:

- [Quora](docs/quora/CONTRIBUTING.md): a WebView app; most patches inject CSS or scripts into Quora's pages.
- [Google Health](docs/google-health/CONTRIBUTING.md): an obfuscated app; patches find code by strings and
  framework calls.
- Booking.com: a Compose app whose search results and home screen come from Booking.com's servers; see
  [Patches in detail](docs/booking/patches.md) for how each patch works.
  `python .github/scripts/check_booking.py <apkm> --cli <morphe-cli.jar> --install --expect-screen` patches
  an APKM with every Booking.com patch and starts it on a phone or emulator, as the emulator test does.

Please follow the [code of conduct](CODE_OF_CONDUCT.md), and report security problems privately as described in
[SECURITY.md](SECURITY.md).

## Where things are

- `patches/src/main/kotlin/app/jofslash/patches/<app>/`: the patches. `<app>` is `quora`, `booking` or
  `googlehealth`.
- `extensions/<app>/`: the code those patches call inside the app. Each app has its own extension, so a patched
  app gets only its own code. A patch loads it with `extendWith("extensions/<app>.mpe")`.
- `docs/<app>/README.md`: the app's page. The patch tables in it are generated from the patches' descriptions
  at release (`.github/scripts/generate_<app>_readme.py`).

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
