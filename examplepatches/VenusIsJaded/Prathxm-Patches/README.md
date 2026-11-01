<div align="center">

# ♟️ Prathxm Patches

**Offline Stockfish 19 for the Chess.com Android app.**
Full game reviews, live analysis for bots and practice, unlimited Play Coach, no ads, all bots unlocked. It runs on your phone and needs no internet.

[![Latest release](https://img.shields.io/github/v/release/VenusIsJaded/Prathxm-Patches?style=flat-square&label=release&color=81B64C)](https://github.com/VenusIsJaded/Prathxm-Patches/releases/latest)
![Engine](https://img.shields.io/badge/engine-Stockfish%2019%20NNUE-262421?style=flat-square)
![Android](https://img.shields.io/badge/android-8.0%2B-3DDC84?style=flat-square&logo=android&logoColor=white)
[![License](https://img.shields.io/badge/license-GPLv3-blue?style=flat-square)](LICENSE)

[**Download**](https://github.com/VenusIsJaded/Prathxm-Patches/releases/latest) · [Install](#-install) · [Using it](#-using-it) · [Patches](#-patches) · [Build](#-build-from-source)

</div>

---

## ✨ What you get

| | |
| :-- | :-- |
| 🧠 **Stockfish 19 NNUE on your phone** | This is the newest official Stockfish. It uses every CPU core and a hash table sized to your RAM, and it picks the fastest instruction set your phone supports. |
| 📊 **Accurate Game Review** | Every move is rated with a win-probability model: Book, Brilliant, Great, Best, Excellent, Good, Inaccuracy, Mistake, Blunder and Miss. The review names the opening (offline book of 3,800+ lines) and gives Opening, Middlegame, Endgame and Tactics ratings from how you actually played each part. Reviews always run at full strength and use the full move history, so repetitions and the 50-move rule are taken into account. |
| 🎯 **Live analysis** | Best-move arrows, an evaluation bar, a Win/Draw/Loss bar, a depth & score readout, threat arrows and mate alerts. These work in bot, coach, practice and analysis games and on finished games. |
| 🧩 **Offline Lichess puzzles** | Millions of puzzles on a journey map, with streaks, Puzzle Rush and themed practice. The daily puzzle is the real Lichess puzzle of the day. |
| 🚫 **Ad-free** | Banners, interstitials and video ads are removed. |
| 🤖 **Every bot unlocked** | All Versus Bots can be played, including the premium ones. |
| 🧑‍🏫 **Unlimited Play Coach** | Play Coach is no longer limited to one free game per day. |

> [!NOTE]
> Fair play is built in. Engine arrows, bars and alerts are switched off automatically in online games (live and daily), in puzzle battles and while watching live games.

---

## 📲 Install

### Morphe Manager (recommended)

1. Install [**Morphe Manager**](https://morphe.software).
2. Add this repository as a patch source: tap **[Add source](https://morphe.software/add-source?github=VenusIsJaded/Prathxm-Patches)**, or go to **Patch sources** and paste:
   ```
   https://github.com/VenusIsJaded/Prathxm-Patches
   ```
3. Pick **Chess.com 4.10.17** (the only supported version, see below). Leave the default patches selected and tap **Patch**.

### Morphe CLI

Download `patches-<version>.mpp` from the [latest release](https://github.com/VenusIsJaded/Prathxm-Patches/releases/latest), then run:

```bash
java -jar morphe-cli.jar patch -p patches-<version>.mpp -o chess-patched.apk com.chess.apk
```

> [!TIP]
> If you want to keep the original Chess.com app installed next to the patched one, turn on the **Clone Chess.com** patch.

---

## 🎮 Using it

Everything is controlled from the **top bar of the home screen**, where the Chess.com logo is:

| Gesture | What it does |
| :-- | :-- |
| **Press and hold** | Opens **Engine Settings** |
| **Double-tap** | **Panic mode**: turns every engine overlay off or on instantly |

**Recommended settings**

- **Analysis depth 18–22** is a good balance of strength and speed on most phones. Higher depths are stronger but slower and drain more battery.
- **CPU threads** are set to all cores by default. Lower this only if your phone gets hot.
- **Game Review extra depth** adds depth on top of the Chess.com review preset (Fast, Standard, Deep or Maximum) when you want the most accurate reviews.
- **Limit engine strength (Elo)** only changes the live arrows. Game reviews always run at full strength.
- **Reset engine settings to defaults** (at the end of the advanced settings) undoes every change in one tap.

---

## 🩹 Patches

<!-- PATCHES_START -->
**Supported Chess.com version:** `4.10.17` · `4.10.17-googleplay` (recommended: `4.10.17-googleplay`)

| Patch | What it does | Default |
| :-- | :-- | :-: |
| **Local Stockfish Analysis** | Adds the offline Stockfish 19 engine for game reviews and live analysis | ✅ |
| **Lichess Puzzles** | Replaces the puzzle section with offline Lichess puzzles and no daily limits | ✅ |
| **Ad-Free** | Removes all advertisements | ✅ |
| **Unlock All Bots** | Unlocks every premium and restricted bot | ✅ |
| **Unlimited Play Coach** | Removes the one-free-game-per-day limit on Play Coach | ✅ |
| **Global Crash Handler** | Shows a readable crash screen instead of closing silently | ✅ |
| **Custom Titles** | Shows fun custom titles on some user profiles | ✅ |
| **Clone Chess.com** | Installs as `com.chess.prathxm` so it can sit next to the official app | ➖ |
<!-- PATCHES_END -->

---

## 🛠️ Build from source

```bash
# Full build (needs a GitHub token with read access to the Morphe package registry)
./.github/scripts/download_stockfish.sh
./gradlew patches:buildAndroid

# Build the .mpp without registry access (compiles patches + extension, bundles Stockfish 19)
scripts/setup_tools.sh               # one-time: JDK 17, kotlinc, morphe-cli, smali, dex2jar
scripts/build_mpp_local.sh 1.19.0   # output: out/patches-1.19.0.mpp

# Verify the extension's reflection against a real Chess.com APKM (desktop JVM)
scripts/verify_apk.sh com.chess_4.10.17.apkm com.google.android.xh4

# Regenerate the offline opening book (Lichess chess-openings, CC0)
pip install chess && python3 scripts/generate_opening_book.py

# Patch a real APKM with the local .mpp (DUMP=1 also disassembles the result)
scripts/patch_apk.sh out/patches-1.19.0.mpp com.chess_4.10.17.apkm
```

---

## ❓ FAQ

<details>
<summary><b>Game Review is slow</b></summary>

Review speed depends on the Chess.com depth preset, your extra-depth setting and your phone's CPU. Try the **Standard** preset or lower the extra depth. Positions that have already been analysed are cached, so opening the same game again is instant.
</details>

<details>
<summary><b>I don't see arrows or the eval bar</b></summary>

Check that the engine is enabled in Engine Settings and that panic mode is off (double-tap the top bar). Overlays are also hidden on purpose in live online games.
</details>

<details>
<summary><b>Which phones are supported?</b></summary>

Any phone running Android 8.0 or newer on arm64-v8a or armeabi-v7a. On 64-bit phones Stockfish picks the fastest instruction set the CPU supports.
</details>

---

## 🙏 Credits

- Original project by [**PrathxmOp**](https://github.com/PrathxmOp/Prathxm-Patches)
- [Stockfish](https://stockfishchess.org) by the Stockfish developers (GPLv3)
- Puzzles from the [Lichess open database](https://database.lichess.org) (CC0)
- Opening names from [lichess-org/chess-openings](https://github.com/lichess-org/chess-openings) (CC0)
- Built for the [Morphe](https://morphe.software) patcher

## ⚖️ License & disclaimer

Licensed under the [GNU GPL v3.0](LICENSE). This project is for educational and personal use. Modifying the app may break Chess.com's terms of service, so use it at your own risk. The authors are not responsible for account actions.
