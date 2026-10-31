# 👋 Contribution guidelines

Thank you for considering contributing to Sync Up.

> [!WARNING]
> This project has been primarily driven by AI, and only the patches the maintainer uses
> are tested. Treat existing code as unverified and review it critically.

## 📖 Scope

Sync Up only patches **Sync for Reddit** (`com.laurencedawson.reddit_sync` and its `.pro` and
`.dev` variants). Patches for any other third party Reddit client belong in
[Patcheddit](https://github.com/wchill/patcheddit), the upstream project this one is derived
from.

## 🙏 Submitting a feature request

Open an issue using the
[feature request template](https://github.com/RashKash103/sync-up/issues/new?labels=Feature+request&template=feature_request.yml&title=feat%3A+).

## 🐞 Submitting a bug report

Open an issue using the
[bug report template](https://github.com/RashKash103/sync-up/issues/new?labels=Bug+report&template=bug_report.yml&title=bug%3A+).

If the bug also reproduces with the Patcheddit bundle, report it there instead — it most
likely belongs upstream.

## 📝 How to contribute

1. Before contributing, it is recommended to open an issue to discuss your change.
2. Development happens on the `dev` branch. Fork the repository and branch from `dev`.
3. Verify your change against a real APK before submitting it. `uv run test/test_all_apks.py`
   rebuilds the bundle and patches every APK in `test/`. Say in the pull request which app
   version you tested on and what you checked in the patched app.
4. Use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
   messages — the release notes and the version number are generated from them:
   - `feat:` for a new patch or capability (minor release)
   - `fix:` for a fix to an existing patch (patch release)
   - `bump:` for supporting a new app version
   - `perf:` for improvements to existing behaviour
   - `chore:` for anything that should not appear in the user facing changelog
5. Open a pull request against `dev` and reference the issues it closes.
6. Do not commit generated files: `CHANGELOG.md`, `patches-list.json`, `patches-bundle.json`
   and the patches list section of `README.md` are written by the release workflow.

## 📜 Licensing of contributions

Sync Up is GPLv3 with additional Section 7 conditions inherited from Patcheddit and Morphe;
see [NOTICE](NOTICE). By contributing you agree that your contribution is licensed under the
same terms. Keep the existing copyright headers on ported files intact — they are the
attribution the upstream licenses require.

❤️ Thank you for considering contributing to Sync Up.
