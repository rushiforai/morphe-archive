# XXLC Grok Patches

Patches by XXLC for Grok Android, compatible with Morphe Manager.

## Supported app

Supports only `ai.x.grok` **1.2.53-release.00**, versionCode **11253200**,
APKMirror **`.apkm`** input.

## Install with Morphe Manager

In Morphe Manager, add `https://github.com/XXLC/grok-morphe-patches` as a patch
source for stable releases, or use [Add to Morphe Manager](https://morphe.software/add-source?github=XXLC/grok-morphe-patches).
For prereleases, add `https://github.com/XXLC/grok-morphe-patches/tree/dev` instead.
Select the supported app file and apply the patches.

## Patches

| Patch | Behavior | Default |
| --- | --- | --- |
| Bypass license check | Skip the Pairip license check. | Enabled |
| Download all (post) | Add a separate menu item to download all media in the current Imagine post. | Enabled |
| Download all (library) | Add a separate button to download all media in the selected Imagine posts. | Enabled |

The original Download actions remain available. The two download patches share
an internal resource patch with English and Vietnamese labels.

## Verification and known limitations

- Verified on a physical Android device: `ai.x.grok` 1.2.53-release.00 patched and
  installed with Morphe Manager, using a cloned app.
- Signing in with X does not work in the patched app. Use another sign-in method.

## Disclaimer

- Not affiliated with, endorsed by, or sponsored by xAI or the Morphe project.
  "Grok" is a trademark of its owner.
- Provided "as is", without warranty of any kind. Use at your own risk.
- This repository contains only patch source code. It does not contain or distribute
  APKs or any xAI or Google assets.
- The Pairip license check bypass is intended only for personal compatibility with a
  lawfully obtained copy of the app. Modifying the app may violate its terms of
  service; you are responsible for how you use these patches.

## Development

See [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) for maintenance and release instructions.

## License

Licensed under [GPLv3](LICENSE), subject to the retained [NOTICE](NOTICE).
