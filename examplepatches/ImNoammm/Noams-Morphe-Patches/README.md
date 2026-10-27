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


## [Open this link to add this repo to Morphe](https://morphe.software/add-source?github=ImNoammm/Noams-Morphe-Patches&name=Noam%27s%20Morphe%20Patches)

## What's in it

Right now it has patches for these apps:

- Chess.com 4.10.18: arrows and marked squares in every game, like on the website. Your own board colours and
  accent colour, pure black backgrounds and the website's Arcade animations. Pick what Home and the bottom bar
  show and play time controls under a minute. Game Review asks who reviews each game: chess.com, Lichess with your
  Lichess account, or Stockfish 19 right on your phone, offline and with no daily limit. The Stockfish and Lichess
  reviews are still in beta. Stockfish also shows its best moves on finished games and the analysis boards, and
  Lichess's puzzles play offline in chess.com's own puzzle screen. Every bot can be played, Play Coach has no daily limit and content the app itself keeps for
  Premium opens up. No ads, rating prompts or Premium upsells, and a clone option installs it next to the real
  app. You turn it all on and off under More, Noam's Patches.
- Block Blast 10.8.1: Classic trays are dealt by the iOS version's own game code, which runs inside the app, and
  you get the iOS version's colour, block, menu and animation themes and its extra effects. No ads, no revive
  offer, no impossible trays, a quicker game over and an optional fake best score that keeps your real one
  underneath. Most of it lives in the Mod settings row of the game's settings.
- Gboard 18.2.4 (arm64): cut off from Google. It has no internet permission and never talks to Play services or
  other Google apps. Voice typing runs on the phone with Whisper and the translate panel uses on-device models.
  GIFs come back from sources you pick (GIPHY and KLIPY with your own free key, nekos.best, Wikimedia Commons and
  Openverse) through a small helper app, the only part that goes online. Only English's dictionary comes with
  Gboard: turn on Download dictionaries from Google and the helper fetches the other languages' dictionaries, for
  word suggestions and autocorrect, from Google's dictionary folder and nowhere else on Google. A switch keeps
  Gboard in incognito mode everywhere. Right-to-left languages only change the letters on the keys. It installs
  next to the normal Gboard and its switches are under No-Google in Gboard's settings.
- Geocaching 10.21.0: Premium-only features work on a Basic account, each as its own switch: map filters,
  statistics from your own finds, log templates, lists, experimental features and sorting your finds and hides,
  and the upgrade badges are gone. Caches the app locks behind Premium open too: they load from geocaching.com the
  way c:geo does, so they show what the website shows your account. You can't log those, though: geocaching.com
  only takes logs on Premium caches from Premium accounts, and the app tells you so. Map search comes from
  geocaching.com as well, and the caches you see on the map or open stay on the phone for offline use. There's a
  map that needs no Google key, with free street, satellite, terrain and hybrid layers, it comes back faster when
  you switch tabs, and you get a native description viewer, photo downloads and one sign-in for the app and the
  website. If map search stops finding caches, sign in to geocaching.com again from the map's menu.

## Getting it

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. On your phone, open
   [this link](https://morphe.software/add-source?github=ImNoammm/Noams-Morphe-Patches&name=Noam%27s%20Morphe%20Patches)
   to add the source, or add `https://github.com/ImNoammm/Noams-Morphe-Patches` under Patch sources yourself.
3. Pick the app and the patches you want, and patch it.

Each app needs the version listed above, and you have to start from the stock app: patching a copy you already
patched doesn't work, so if Manager picks your installed patched app, choose the original APK instead. Morphe
Manager signs what it patches with its own key, so if the app is already installed with a different signature,
like the Play Store version, uninstall it first.

Chess.com's Stockfish analysis patch downloads the official Stockfish 19 (80 MB) from Stockfish's GitHub while Manager
patches, so patching chess.com with it needs internet.

After you install Gboard, tap its app icon: it takes you to turn the keyboard on and then to choose it, one step at
a time. Its voice and translation models download in No-Google settings, and so do other languages' dictionaries
once you turn on Download dictionaries from Google. Downloads and GIFs go through the helper app, which the
keyboard installs or updates for you when it needs it (Android asks you to confirm).

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
- Geocaching's map search and cache pages read geocaching.com the way [c:geo](https://github.com/cgeo/cgeo) does,
  and some of its page patterns come from c:geo (Apache-2.0). Its map layers come from OpenStreetMap, OpenTopoMap
  and Esri.
- Parts of the chess.com Stockfish analysis, Game Review, Lichess puzzles, bot and Play Coach patches and the clone
  option come from [PrathxmOp/Prathxm-Patches](https://github.com/PrathxmOp/Prathxm-Patches) (GPL-3.0).
- chess.com's Stockfish analysis runs [Stockfish](https://github.com/official-stockfish/Stockfish) 19 (GPL-3.0),
  the official arm64 build, which isn't in this repo or the bundle. Its Lichess puzzles come from the
  [Lichess puzzle database](https://database.lichess.org/#puzzles) and its opening names from
  [lichess-org/chess-openings](https://github.com/lichess-org/chess-openings), both CC0.
- Block Blast is Hungry Studio's game. The iOS generation patch runs code from its iOS version.

## License

GPL-3.0. See [LICENSE](LICENSE).
