<h1 align="center">Quwi's Chess Patches</h1>

<p align="center">
  A fork of <a href="https://github.com/ImNoammm/Noams-Morphe-Patches">Noam's Morphe Patches</a> for chess.com only,
  with Game Review on your own computer and Great/Brilliant marks as separate patches.
</p>

<p align="center">
  <a href="https://github.com/quwi26/Quwis-Patches/releases/latest"><img alt="Latest release" src="https://img.shields.io/github/v/release/quwi26/Quwis-Patches?label=release"></a>
  <img alt="Morphe patches" src="https://img.shields.io/badge/Morphe-patches-3DDC84?logo=android&logoColor=white">
  <a href="LICENSE"><img alt="GPL-3.0" src="https://img.shields.io/badge/license-GPL--3.0-lightgrey"></a>
</p>

Add this source to [Morphe](https://morphe.software) Manager once -
[Add to Morphe](https://morphe.software/add-source?github=quwi26/Quwis-Patches) - or paste the URL:

```
https://raw.githubusercontent.com/quwi26/Quwis-Patches/main/patches-bundle.json
```

## What this fork adds

Five patches, all for chess.com:

- **Great and Brilliant moves analysis** - marks chess.com's “!” and “!!” in a review by Local Stockfish or by
  Stockfish on your computer. Great is the engine's own best move when it was also the only one that kept the
  game good (PrathxmOp's `greatFind` rule, on the second-best line's expected points); Brilliant is a best or
  nearly best move that offers material for good (the sacrifice is read by static exchange on the position
  after the move - in the engine's line an ordinary trade is briefly down a piece too, which used to mark
  quiet moves). Great needs two lines from the engine, so it has a switch in the settings; Lichess's own
  reviews stay as Lichess sends them. The settings list the brilliant moves the saved reviews found -
  chess.com counts its own Insights on its servers, and only for Diamond.
- **Unlimited Game Review** - the base. Game Review asks who reviews the game: chess.com, Lichess's servers
  (with your Lichess account) or, with Stockfish analysis, Stockfish on your phone, offline and without the
  daily limit. The phone and Lichess judge moves the Lichess way (?! ? ??, accuracy and centipawn loss) in
  chess.com's own review screen, and the phone marks the rest Best, Excellent or Good, as chess.com does.
  Reviews are saved, so a game opens straight away the next time.
- **Game Review on your computer** - adds the fourth reviewer, “Stockfish on your computer”: instead of
  searching on the phone, the review is searched by [`sf-bridge`](#stockfish-on-your-computer) on your
  computer over the local network, with the same Stockfish 19 and the same Lichess-style marks. A review that
  took a minute on the phone takes seconds. It has its own depth (Fast 100k, Standard 300k, Deep 1M, Maximum
  5M nodes a move) and thread count, and a benchmark in the settings.
- **Arrows in reviews** - Arrows and Clear in Game Review's own bottom bar and on the Analysis boards, so arrows
  and marked squares can be drawn while analysing a game. Noam's **Arrows in games** stays separate.
- **Global Crash Handler** - if the app crashes, a screen of its own shows what went wrong, with the details
  ready to copy into a report. Turn it off for chess.com's usual crash dialog.

The two add-ons work only with **Unlimited Game Review from this bundle**: select it too. Two Unlimited Game
Review patches, one from this bundle and one from Noam's or hyzor's, cannot be applied to the same app - they
hook the same methods and share the same extension, so the second one fails.

Both add-ons are selected by default. Uncheck them for a plain Unlimited Game Review, the way Noam's and
hyzor's patch is.

The patches for other apps (Block Blast, Gboard, Geocaching) are **not** in this bundle.

Everything else is Noam's work, unchanged: chess.com 4.10.18 and 4.10.23 with arrows in games and in
reviews, board and accent colours,
AMOLED black, the website's Arcade animations, custom Home and bottom bar, time controls under a minute,
offline Stockfish analysis on the phone, Lichess reviews and offline Lichess puzzles, every bot unlocked,
no daily Play Coach limit, Premium content, no ads or rating prompts — all switched on and off under
**More → Quwi's Patches**.

## Stockfish on your computer

The computer runs `sf-bridge`, which starts a Stockfish per connection and passes UCI through a plain TCP socket:

```
server: sf-bridge 1 cores 12
client: auth <token>
server: auth ok
... plain UCI from there
```

Patch your app with **Unlimited Game Review** and **Game Review on your computer** from this bundle, then in the app:
**More → Quwi's Patches → Game Review → Stockfish on your computer**, and fill in

- **Computer address** — `192.168.1.10:7892` (the computer's address on the same Wi-Fi);
- **Token** — the one sf-bridge prints when it starts (`token.txt` next to it);
- **Computer Stockfish depth** — its own budget, apart from the phone's;
- **Computer Stockfish threads** — Auto uses every core the computer reports, with 32 MB of hash each.

Press **Test the connection**; it should answer “The computer answered: its Stockfish is ready.”
**Benchmark your computer** then runs 100k, 300k, 1M and 5M nodes on one position each, over one engine,
with the start-up time kept separate — on an i5-12450H that is 0.55 s to start and 0.08 / 0.12 / 0.28 /
1.16 s for the four budgets. The review chooser offers **Stockfish on your computer** next to chess.com,
Local Stockfish and Lichess.

### The bridge itself

It is in [`bridge/`](bridge/README.md) of this repository: one `server.js` with no dependencies, plus
`test-tcp.mjs` and `bench-tcp.mjs` to check it from a terminal. In short:

1. Install [Node.js](https://nodejs.org) and download [Stockfish](https://stockfishchess.org/download/);
2. put `server.js` and `stockfish.exe` in one folder and run `node server.js`;
3. allow TCP 7892 through the firewall (the exact command is in [bridge/README.md](bridge/README.md));
4. type the address and the token it prints into the app, and press **Test the connection**.

Nothing is sent anywhere else: the bridge only waits for your phone on your own network, and the
phone talks to your computer on that network only.

## Credits

All patches are [Noam's](https://github.com/ImNoammm/Noams-Morphe-Patches) (GPL-3.0), which itself builds on
PrathxmOp's work; the computer reviewer was added in this fork. Without Noam's Morphe Patches this project
would not exist: the whole patch tree and extension are his work, and this fork only adds the Game Review
features on top. The chess.com 4.10.23 support follows
[hyzor's port](https://github.com/hyzor/hyzor-morphe-patches) (GPL-3.0) of the same patches. The crash screen
is [PrathxmOp's crash handler](https://github.com/PrathxmOp/Prathxm-Patches) (GPL-3.0), renamed so Morphe sees
it as the same patch when both bundles are added. If you want the patches for other apps too, use Noam's own
source.

## Building

```
./gradlew :patches:generatePatchesList   # patch list, then...
./gradlew :patches:buildAndroid          # ...the bundle with classes.dex (assemble alone has no dex)
```

The bundle lands in `patches/build/libs/patches-<version>.mpp`. Building needs JDK 21+, the Android SDK
(`ANDROID_HOME`), and GitHub Packages credentials for the Morphe plugin (`gpr.user` / `gpr.key` in
`~/.gradle/gradle.properties`).
