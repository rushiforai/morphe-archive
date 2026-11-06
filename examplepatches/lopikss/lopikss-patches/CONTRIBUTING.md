# Contributing to Lopikss Patches

We welcome bug reports and requests for other Android games. [DM **@lopikss** on Discord](https://discord.com/users/493792470778511360) or use a [GitHub issue](https://github.com/lopikss/lopikss-patches/issues/new/choose).

## Pull requests

1. Branch from `dev`, not `main`.
2. Keep patches targeted to verified package IDs, game versions and asset hashes.
3. For compatible Unity tables, prefer the shared `UnityCostTableEditor` and add a game-specific adapter. Follow [the adapter guide](docs/ADDING_GAME_SUPPORT.md).
4. Verify which exact resources/rows change and that all other content remains untouched.
5. Run `./gradlew :patches:buildAndroid` and perform on-device testing where possible.
6. Never imply successful in-game behavior from compilation alone; distinguish **built**, **locally tested** and **user-confirmed working**.
7. Do not commit game APKs, copyrighted Unity assets, save files, receipts, account credentials or personal information.

Use conventional commits such as `feat:`, `fix:`, `docs:` and `chore:`. The official Morphe release workflow manages published bundles and generated release metadata; do not manually edit `patches-list.json`, `patches-bundle.json` or `CHANGELOG.md`.
