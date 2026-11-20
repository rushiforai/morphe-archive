# Morphe Patches

Morphe patch bundle for the apps I use — **one bundle, all apps**. Every app's patches live
in their own package inside the single `:patches` module, so the build produces one
`.mpp` that Morphe can install from a single source.

| App | Package | Supported versions | Patches |
|---|---|---|---|
| Nova Launcher | `com.teslacoilsw.launcher` | `89700 (8.9.7)` | Enable Prime, Disable telemetry, Remove internet & tracking permissions |

## Install (Morphe)

```
https://morphe.software/add-source?github=springfurst/morphe-patches
```

Then patch a stock APK of a supported version. Morphe re-signs the output, so uninstall the
stock app first (back up your data). All three patches are enabled by default.

### Nova Launcher: what it does

- **Enable Prime** — starts the app in the Prime state and reports an active subscription,
  so Prime-gated features work and the Play-licence revocation can't strip Prime from the
  re-signed install. Ported from [hyzor/hyzor-morphe-patches](https://github.com/hyzor/hyzor-morphe-patches) (GPLv3).
- **Disable telemetry** — no-ops Amplitude (incl. Session Replay), the Novalytics raw-data
  upload, the ad-mediation config fetch, and the runtime re-enable of Firebase
  Analytics/Crashlytics.
- **Remove internet & tracking permissions** — drops `INTERNET`, Ad ID, install-referrer and
  licence-check permissions, and disables Branch Search, Audience Network, FCM and GMS
  measurement components.

Offline behaviour: core launcher (home, drawer, gestures, widgets, local backup/restore,
local search) is fully local. Weather, Nova Now promo cards, Sesame integrations, Nova AI
and update checks stay empty offline — no crashes.

## Layout

```text
patches/
  build.gradle.kts                     bundle identity (name, description, author)
  src/main/kotlin/
    dev/novaoffline/patches/
      nova/shared/Constants.kt         compatibility (package, versions, APK type)
      nova/premium/                    Nova: Enable Prime + fingerprints
      nova/privacy/                    Nova: telemetry + manifest patches
      util/                            small DEX helpers shared by patches
    util/PatchListGenerator.kt         generates patches-list.json at release
patches-bundle.json                    read by Morphe add-source (updated by the release workflow)
.github/workflows/build.yml            builds the bundle on every push, uploads the .mpp
.github/workflows/release.yml          tag `v*` -> GitHub release + patches-bundle.json
```

## Adding an app

1. Add `patches/src/main/kotlin/dev/novaoffline/patches/<app>/` with
   `shared/Constants.kt` (a `Compatibility` for the package + target versions),
   `<feature>/Fingerprints.kt` and `<feature>/<Name>Patch.kt`.
2. Add a row to the table above.
3. Commit — the same bundle now includes the new app; no workflow changes needed.

## Build locally

Requires Java 21 and a GitHub token with `read:packages` (the Morphe registry needs auth even
for its public packages):

```bash
export GITHUB_TOKEN=$(gh auth token)   # or GITHUB_ACTOR + GITHUB_TOKEN
./gradlew :patches:buildAndroid --no-daemon
# output: patches/build/libs/patches-<version>.mpp
```

## Releasing

Bump `version` in `gradle.properties`, then:

```bash
git tag v1.0.0 && git push origin v1.0.0
```

`release.yml` builds the bundle, publishes it as a release asset, and rewrites
`patches-bundle.json` so Morphe's `add-source` link resolves to the new build.

## Licensing / credits

GPLv3. Ported patches keep their upstream attribution in file headers. Nova's Prime patch
derives from hyzor/hyzor-morphe-patches, which in turn ports rushiranpise/morphe-patches and
hoo-dles/morphe-patches.
