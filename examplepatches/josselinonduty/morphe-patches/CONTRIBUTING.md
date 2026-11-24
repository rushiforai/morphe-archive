# Contributing

Contributions are welcome. Branch from `dev` and open a pull request against it.

## Development setup

1. Follow the [Morphe development setup](https://github.com/MorpheApp/morphe-documentation/tree/main/docs/morphe-development). Java 21.
2. Add `gpr.user` and `gpr.key` (a GitHub token with `read:packages`) to `~/.gradle/gradle.properties`. Morphe's dependencies are served from GitHub Packages, which requires authentication even for public repos.
3. Build: `./gradlew :patches:buildAndroid` (output: `patches/build/libs/patches-*.mpp`). Apply it locally with Morphe Desktop like any other bundle.

## Commits and releases

- Commits follow [Conventional Commits](https://www.conventionalcommits.org). Use the app as the scope: `feat(<app>): ...`, `bump(<app>): <version>`.
- `feat` and `fix` commits on `dev` create pre-releases. Merging `dev` into `main` (no squash) creates a stable release.
- Never create releases by hand: `release.yml` handles everything.
- All apps ship in one bundle and share one release version.

## Adding a new app

1. Patches: `patches/src/main/kotlin/fr/josselinonduty/<app>/`, with an `<App>.kt` holding the `Compatibility` constant and the app's patch builders. Generic helpers go in `fr/josselinonduty/shared/`, patches that work on any app in `fr/josselinonduty/all/`.
2. Extension (only if the patches need Java code): `extensions/<app>/` with `name = "extensions/<app>.mpe"` and its own `android.namespace`. Patches load it with `extendWith("extensions/<app>.mpe")`.
3. Add the app's notes to the README and to the `App` dropdown in `.github/ISSUE_TEMPLATE/`.
