# Sound Connect patches

Patches for **Sony | Sound Connect** (`com.sony.songpal.mdr`), the app formerly known as Headphones Connect, for use with [Morphe](https://github.com/MorpheApp).

The first version of this project targeted ReVanced. It is kept on the [`revanced`](https://github.com/Mouchoir/sound-connect-patches/tree/revanced) branch.

## Patches

### Block Speak-to-Chat gesture

The WH-1000XM4 switches Speak-to-Chat on or off by itself when two fingers rest on the right touch panel. That happens easily when you take the headset off or put it down, and Speak-to-Chat then mutes your audio every time you speak. Sony offers no setting to turn off only this gesture: the only option is to disable the whole touch panel.

This patch keeps the touch panel and turns Speak-to-Chat back off as soon as the headset reports that it switched on by itself:

- The headset notifies the app of every on/off change. If the change to "on" does not follow an "on" request made in the app within a few seconds, the patched app sends "off" right away.
- If Speak-to-Chat is already on when the app connects and was not switched on from the app, it is turned off too.
- The in-app Speak-to-Chat switch keeps working: switch it on there and it stays on.

You may still hear the "Speak-to-chat activated" voice prompt for a moment before it is switched off.

Tested with Sound Connect 13.3.0 and a WH-1000XM4 (v1 protocol). Newer headsets that use the v2 protocol are not covered.

The patched app has to be running in the background, connected to the headset, for the guard to act. Sound Connect keeps that connection open on its own.

## Installing

Patching gives the app a different signature, so the official Sound Connect has to be uninstalled first. Settings stored in the headset are kept; settings stored only in the app are lost.

1. In Morphe Manager, open **Sources**, tap **+** and add `github.com/Mouchoir/sound-connect-patches` (or download the `.mpp` file from the [releases](https://github.com/Mouchoir/sound-connect-patches/releases) and add it as a local source).
2. Patch Sound Connect with **Block Speak-to-Chat gesture**. Sound Connect ships as split APKs, so use the APKM bundle.

## Building

The Morphe patcher and Gradle plugin are published to GitHub Packages, which needs a GitHub token with the `read:packages` scope even for public packages. Add it to `~/.gradle/gradle.properties`:

```properties
gpr.user = <GitHub user>
gpr.key = <token>
githubPackagesUsername = <GitHub user>
githubPackagesPassword = <token>
```

Then run `./gradlew :patches:buildAndroid`. The bundle lands in `patches/build/libs/`.

Pushing a `v*` tag builds the bundle on GitHub Actions, publishes a release with the `.mpp` file and updates `patches-bundle.json`.

## License

GPLv3, like the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template) this project starts from. See [NOTICE](NOTICE) for the additional terms that come with it. This project is not affiliated with Morphe or Sony.
