<h1 align="center">Noam's Morphe Patches</h1>

<p align="center">
  My patches for the apps I use, in one source for Morphe.
</p>

<p align="center">
  <a href="https://github.com/ImNoammm/Noams-Morphe-Patches/releases/latest"><img alt="Latest release" src="https://img.shields.io/github/v/release/ImNoammm/Noams-Morphe-Patches?label=release"></a>
  <img alt="Morphe patches" src="https://img.shields.io/badge/Morphe-patches-3DDC84?logo=android&logoColor=white">
  <a href="LICENSE"><img alt="GPL-3.0" src="https://img.shields.io/badge/license-GPL--3.0-lightgrey"></a>
</p>

<p align="center">
  <a href="https://www.buymeacoffee.com/Noamm"><img alt="Buy Me A Coffee" src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png"></a>
</p>

These are the patches I make for apps I use, all in one [Morphe](https://morphe.software) source. Add it to
Morphe Manager once and you can patch any app here right on your phone. When I add patches for another app,
they show up in the same source.

## What's in it

Right now it has patches for these apps:

- Chess.com 4.10.18: arrows and marked squares in every game, like on the website. Your own board colours and
  accent colour, pure black backgrounds and the website's Arcade animations. Pick what Home and the bottom bar
  show, play time controls under a minute and send a game to Lichess for review. No ads, rating prompts or Premium
  upsells. Nothing gets unlocked, though: when you hit a free limit you get a short toast instead of a Premium
  screen. You turn it all on and off under More, Noam's Patches.
- Block Blast 10.8.1: Classic trays are dealt by the iOS version's own game code, which runs inside the app, and
  you get the iOS version's colour, block, menu and animation themes and its extra effects. No ads, no revive
  offer, no impossible trays, a quicker game over and an optional fake best score that keeps your real one
  underneath. Most of it lives in the Mod settings row of the game's settings.
- Gboard 18.2.4 (arm64): cut off from Google. It has no internet permission and never talks to Play services or
  other Google apps. Voice typing runs on the phone with Whisper and the translate panel uses on-device models.
  GIFs come back from sources you pick (GIPHY and KLIPY with your own free key, nekos.best, Wikimedia Commons and
  Openverse) through a small helper app, the only part that goes online. Right-to-left languages only change the
  letters on the keys. It installs next to the normal Gboard and its switches are under No-Google in Gboard's
  settings.

## Getting it

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. On your phone, open
   [this link](https://morphe.software/add-source?github=ImNoammm/Noams-Morphe-Patches&name=Noam%27s%20Morphe%20Patches)
   to add the source, or add `https://github.com/ImNoammm/Noams-Morphe-Patches` under Patch sources yourself.
3. Pick the app and the patches you want, and patch it.

Each app needs the version listed above. Morphe Manager signs what it patches with its own key, so if the app
is already installed with a different signature, like the Play Store version, uninstall it first.

Gboard downloads its voice and translation models in No-Google settings. Downloads and GIFs go through the
helper app, which the keyboard installs for you when it needs it (Android asks you to confirm).

## Building it

```sh
./gradlew buildAndroid
```

The bundle ends up in `patches/build/libs/`. You need JDK 17 or newer, the Android SDK, and a GitHub token with
`read:packages`, because Morphe's Gradle plugin lives on GitHub Packages. Put the token in
`~/.gradle/gradle.properties` as `gpr.user` (your GitHub name) and `gpr.key`.

Gboard's native libraries and its helper app are built on an arm64 phone in Termux, with
`gboard/native/build.sh` and `gboard/gifproxy/build.sh`. Copy them to
`patches/src/main/resources/nogoogle-native/arm64-v8a/` and `patches/src/main/resources/nogoogle-helper/gif-helper.apk`
before you build the bundle. Without them it still builds, but Offline voice typing, Offline translation and GIF
providers can't be applied. The two scripts are written for my own Termux setup: they expect
whisper.cpp, llama.cpp, slimt, xsimd and PCRE2 checked out under `~/gb` at the versions listed in
[gboard/THIRD_PARTY_NOTICES.txt](gboard/THIRD_PARTY_NOTICES.txt), source `~/gb/env.sh`, use a Morphe Desktop
jar at `~/gb/morphe-desktop.jar` and sign the helper with the keystore in `KEYSTORE`.

## Credits

- Built on [Morphe](https://github.com/MorpheApp)'s patcher and patches template.
- The Gboard trackpad, Quick Insert, emoji size, toolbar and clipboard patches are ported from
  [jasonwu1994/Gboard-patches](https://github.com/jasonwu1994/Gboard-patches) (GPL-3.0).
- Gboard's voice typing runs [whisper.cpp](https://github.com/ggml-org/whisper.cpp) and its translation runs
  [llama.cpp](https://github.com/ggml-org/llama.cpp) (both MIT) and [slimt](https://github.com/jerinphilip/slimt)
  (GPL-2.0). Their versions and licenses, and those of the libraries they use, are in
  [gboard/THIRD_PARTY_NOTICES.txt](gboard/THIRD_PARTY_NOTICES.txt). The models (Whisper, Tencent Hy-MT and
  Firefox Translations) are downloaded on the phone, not shipped here.
- Block Blast is Hungry Studio's game. The iOS generation patch runs code from its iOS version.

## License

GPL-3.0. See [LICENSE](LICENSE).
