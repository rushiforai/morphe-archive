# Repository instructions

- Keep changes within the requested scope. Follow YAGNI, KISS and DRY.
- Read [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) before changing patches or releases.
- Keep user-facing and maintainer documentation in English.
- Use GitHub Actions to build and validate. Do not run local Gradle builds;
  the documented local setup lacks the Android SDK and GitHub Packages access.
- Treat fingerprints and injected references as specific to Grok
  `1.2.53-release.00` (versionCode `11253200`). Recheck them for any new version.
- Use Conventional Commits that reflect the actual change: `feat` and `fix`
  trigger releases; non-breaking `docs` and `chore` do not. Breaking changes,
  `perf`, `bump` and `build(Needs bump)` also affect releases; see DEVELOPMENT.md.
- Do not manually edit bot-managed `patches-bundle.json`, `patches-list.json`,
  `CHANGELOG.md` or `gradle.properties`.
- Never commit secrets, tokens, credential-bearing `gradle.properties` content,
  signing keys, private machine paths or personal data. Bundle signing uses the
  optional Actions secret `MORPHE_SIGNING_KEY`.
- Do not commit or distribute app APKs or proprietary app assets.
- Report checks performed and distinguish source review from CI or device testing.
