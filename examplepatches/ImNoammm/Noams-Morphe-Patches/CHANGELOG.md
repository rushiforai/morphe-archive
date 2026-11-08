# [1.5.1](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.5.0...v1.5.1) (2026-11-07)

### Bug Fixes

* **Block Blast:** the mods no longer disappear after you close and reopen the game. Its newer updater downloaded a game update in the background and swapped it in at the next start, and it's blocked now
* **Chess.com:** board coordinates show again with Board colors on. Its two coordinate colours were swapped, so each label took the colour of its own square, thanks to @quwi26

# [1.5.0](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.4.3...v1.5.0) (2026-10-29)

### Features

* **Gboard:** a new Keep the clipboard switch under Always use incognito mode, on by default, so copying and pasting keeps working while everything else stays incognito. Private browser tabs stay protected like in normal Gboard

### Bug Fixes

* **Block Blast:** the mods stay on every launch. The game was quietly loading its own downloaded update when it restarted, which is why the mods came and went

# [1.4.3](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.4.2...v1.4.3) (2026-10-29)

### Bug Fixes

* **Chess.com:** Time controls under a minute patches again in Morphe Manager 2.2.0 when Morphe's own patches are patched along
* **Chess.com:** the Stockfish download tries 3 times, and if it still fails it tells you which server didn't answer and what to check

# [1.4.2](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.4.1...v1.4.2) (2026-10-27)

### Bug Fixes

* **Chess.com:** Lichess puzzles work when you're signed out of chess.com. Its own guest puzzles got in the way and every puzzle ended in "Something went wrong"

# [1.4.1](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.4.0...v1.4.1) (2026-10-26)

### Bug Fixes

* **Chess.com:** Analyze with Lichess works again. Lichess moved its game pages and started asking for a login to export games, so every game ended in "Lichess couldn't import this game"

# [1.4.0](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.3.0...v1.4.0) (2026-10-26)

### Features

* **Chess.com:** Local Stockfish also marks moves Excellent and Good
* **Geocaching:** sign in to geocaching.com again from the map's menu
* **Geocaching:** logging a Premium-only cache tells you geocaching.com won't take it from a Basic account

### Bug Fixes

* **Chess.com:** Lichess puzzles no longer run into chess.com's daily puzzle limit, and the Puzzles tab keeps its own rating and progress after them, thanks to @hyzor
* **Chess.com:** rotating the phone during a Lichess puzzle no longer ends in "Resource not found"
* **Chess.com:** downloading a big puzzle pack no longer freezes the app
* **Chess.com:** chess.com's own Game Review shows its real move comments again
* **Geocaching:** map search finds caches again
* **Geocaching:** your finds show as found, deleting lists works, Trails doesn't ask for Premium and the terrain map is fixed
* **Block Blast:** the mods stay after the game goes online, and phones that lost them get them back without clearing data

# [1.3.0](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.2.0...v1.3.0) (2026-10-18)

### Features

* **Gboard:** dictionaries for languages other than English, so Italian, Hebrew and the rest get word suggestions and autocorrect. Turn on Download dictionaries from Google in No-Google settings, and the helper app fetches them from Google's dictionary folder and nowhere else
* **Gboard:** with that switch off, a note on the keyboard tells you when a language has no dictionary
* **Gboard:** a new Always use incognito mode switch, so Gboard doesn't learn from what you type or keep history in any app

### Bug Fixes

* **Gboard:** GIF providers no longer needs an error message the 18.2.4 beta build doesn't have

# [1.2.0](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.1.0...v1.2.0) (2026-10-18)

### Features

* **Chess.com:** Game Review asks who reviews each game: chess.com, Lichess with your Lichess account, or Stockfish 19 on your phone, offline and with no daily limit. The local and Lichess reviews are still in beta
* **Chess.com:** Stockfish shows its best moves on finished games, the analysis boards and the game explorer, with an eval bar where chess.com has none. The patch downloads the official Stockfish 19 (80 MB) while Morphe Manager patches, so patching needs internet
* **Chess.com:** Lichess puzzles play offline in chess.com's own puzzle screen and get rated on your phone the way Lichess rates them
* **Chess.com:** a short setup screen the first time you open the patched app
* **Chess.com:** every bot can be played, Play Coach has no daily limit, and content the app itself keeps for Premium opens up
* **Chess.com:** Clone Chess.com (off by default) installs the patched app next to the real one
* **Chess.com:** Review on Lichess is gone, Game Review's Lichess option replaces it

# [1.1.0](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.0.1...v1.1.0) (2026-10-14)

### Features

* **Geocaching:** new app, Geocaching 10.21.0, with every feature as its own switch. Map filters, statistics from your finds, log templates, lists, experimental features and finds and hides sorting work without Premium, and the upgrade badges are gone
* **Geocaching:** caches the app locks behind Premium open too, with what geocaching.com shows your account. Map search comes from geocaching.com as well, and the caches you see on the map or open stay on the phone for offline use
* **Geocaching:** a map that needs no Google key, with free street, satellite, terrain and hybrid layers, that comes back faster when you switch tabs
* **Geocaching:** a native description viewer, photo downloads and one sign-in for the app and the website

### Bug Fixes

* **Gboard:** the app icon works again and walks you through setup: it opens the keyboard list to turn it on, then the picker to choose it, and Gboard's settings once it's all set

# [1.0.1](https://github.com/ImNoammm/Noams-Morphe-Patches/compare/v1.0.0...v1.0.1) (2026-10-06)

### Bug Fixes

* **Block Blast:** Block themes no longer fails when you patch in Morphe Manager. Android's regex engine rejected one of its patterns, thanks to @alan7383 for the fix (#4)

# 1.0.0 (2026-10-02)

### Features

* **Chess.com:** arrows and marked squares in every game, your own board and accent colours, AMOLED black, the website's Arcade animations, a Home screen and bottom bar you choose, time controls under a minute and Game Review on Lichess, with no ads, rating prompts or Premium upsells
* **Block Blast:** Classic trays dealt by the iOS game's own code, its colour, block, menu and animation themes and its extra effects, no ads, no revive offer, no impossible trays, a quicker game over and an optional fake best score
* **Gboard:** no internet permission and no Google services, voice typing and translation that run on the phone, GIFs from sources you pick through a small helper app, and the keyboard no longer mirrors for right-to-left languages, plus a few features ported from jasonwu1994's Gboard patches
