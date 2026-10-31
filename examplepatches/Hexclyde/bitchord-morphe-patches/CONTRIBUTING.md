# Contributing

## Reporting a bug

Read [Troubleshooting](docs/TROUBLESHOOTING.md) first. If that doesn't help, [open an issue](https://github.com/Hexclyde/bitchord-morphe-patches/issues/new/choose) that includes:

- Phone model and Android version
- Patch, BitChord and Morphe versions
- Steps to reproduce, plus what you expected to happen
- Any error message or log, with personal details removed

For playback problems, also give the file type and size, and say whether the file plays in the official Telegram app.

Don't post your API hash, login codes, session files or private channel links. Report security issues privately as described in [SECURITY.md](SECURITY.md).

## Pull requests

See [docs/BUILDING.md](docs/BUILDING.md) for how to build and test. Keep each pull request to a single change and describe how you tested it. Don't commit APKs, `.mpp` files, audio, keystores or credentials.

To fix or add a translation, edit `translations/<language>.json` (every phrase in `translations/source.json` maps to its translation, with `{0}`, `{1}` kept), then run `python3 tools/translations.py --strict` and `python3 -m unittest tests.test_translations`.

Contributions are licensed under GPL-3.0-or-later.
