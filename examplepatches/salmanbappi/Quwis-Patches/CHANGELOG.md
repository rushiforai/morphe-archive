# [1.9.28](https://github.com/salmanbappi/Quwis-Patches/compare/v1.9.27...v1.9.28) (2026-11-07)

### Bug Fixes

* **Game Review (4.10.23):** eliminate `NullPointerException` at `GameReviewViewModel$4$stateMachine$1$12.invokeSuspend` (SourceFile:198) by setting starting position `playedMove` and `classification` to null (bypassing unplayable ply 0 move conversion), while populating all history parameters in `buildDummyMoveResult` and supplying safe non-null enum/constructor instances via `AppTypes.defaultFor` so `j0.o` handles position 0 seamlessly

# [1.9.27](https://github.com/salmanbappi/Quwis-Patches/compare/v1.9.26...v1.9.27) (2026-11-07)

### Bug Fixes

* **Game Review (4.10.23):** eliminate `IndexOutOfBoundsException: Index 55 out of bounds for length 55` at `GameReviewViewModel$4$stateMachine$1$12.invokeSuspend` (SourceFile:720) by restoring position 0 (starting board) with a non-null valid `PlayedMove`, ensuring the review list retains all `totalMoves + 1` entries while preventing NPEs in `j0.o` and making history reflection dynamic across obfuscated classes

# [1.9.26](https://github.com/salmanbappi/Quwis-Patches/compare/v1.9.25...v1.9.26) (2026-11-07)

### Performance & Bug Fixes

* **Cloud Stockfish Engine:** fixed `INVALID_FEN_VALIDATION_ERROR` rejection on `chess-api.com` caused by en-passant target notation on double pawn moves, preventing slow fallback stalls and ensuring sub-second evaluation response times across all moves

# [1.9.25](https://github.com/salmanbappi/Quwis-Patches/compare/v1.9.24...v1.9.25) (2026-11-07)

### Bug Fixes

* **Game Review (4.10.23):** eliminate `NullPointerException` at `com.chess.gamereview.v2.j0.o` by aligning `AnalyzedGameData.positions` 1-to-1 with played history plies (avoiding prepended unplayed starting position with null `playedMove`), restore static register mapping (`p0, p1`), and support 4.10.23 obfuscated classification enums and `MoveConverterKt.b`

# [1.9.24](https://github.com/salmanbappi/Quwis-Patches/compare/v1.9.23...v1.9.24) (2026-11-06)

### Bug Fixes

* **Game Review (4.10.23):** fixed `NullPointerException` at `com.chess.gamereview.v2.j0.o` caused by off-by-one register passing in `GameReviewV2V0JFingerprint` bytecode instructions and hardened dummy move generation against renamed history reflection classes

# [1.9.23](https://github.com/salmanbappi/Quwis-Patches/compare/v1.9.22...v1.9.23) (2026-11-06)

### Features

* **Cloud Stockfish Engine:** integrated high-speed Stockfish REST APIs (`chess-api.com` & `stockfish.online`) for sub-second evaluations without phone CPU heating or battery drain
* **In-game Move Suggestions:** real-time best-move arrows are now active during live games, bot matches, daily games, and puzzles
* **Zero 80 MB Download:** eliminated the heavy `stockfish-android-arm64-universal.tar.gz` download at patch time
* **Unblocked Game Review:** removed fair-play check aborting post-game reviews and cleaned suggestion arrows off the Game Review screen

# [1.9.22](https://github.com/quwi26/Quwis-Patches/compare/v1.9.21...v1.9.22) (2026-11-04)

### Bug Fixes

* **Game Review:** moves are marked closer to chess.com. Its Blunder starts at 0.20 expected points, so a move that gives up less than that is now a Mistake, where Lichess's winning chances made it a Blunder. A move that lets go of a winning position the best move still had, or of a forced mate, is a Miss, as chess.com marks it, instead of a Blunder. The winning position and the expected points themselves are still an approximation: chess.com adjusts both to the player's rating and does not publish them. Reviews in Lichess mode keep Lichess's own rules, unchanged

# [1.9.21](https://github.com/quwi26/Quwis-Patches/compare/v1.9.20...v1.9.21) (2026-11-03)

### Features

* **Find the computer on the network:** a patch of its own, next to Game Review on your computer. It adds a "Find on the network" row to the bridge settings that sweeps the phone's own Wi-Fi on the bridge's port and fills in the address sf-bridge answers on, so the address is never read off ipconfig and does not go stale when the router hands out a different one. Only a host that greets the way sf-bridge does is offered; mobile data and VPN interfaces are skipped, and when several bridges answer they are listed with their core counts to choose from
* **Saved addresses:** an address a review connected through is kept, newest first, and a review tries the set address and then the saved ones, so the computer is found again after the router moves it. The settings list them, with a note that an address the network hands out by lease is not worth keeping
* **Find the computer automatically:** a switch, on by default, that lets a review sweep the Wi-Fi once when neither the set address nor a saved one answers, and search where it found the bridge

### Documentation

* **sf-bridge:** the firewall command now allows the port on public networks too (`profile=any remoteip=localsubnet`). Windows ignores a private-only rule on a café, office or co-working network, and the phone then cannot connect at all

# [1.9.20](https://github.com/quwi26/Quwis-Patches/compare/v1.9.19...v1.9.20) (2026-11-03)

### Bug Fixes

* **Customize Home screen:** on 4.10.18 the older Home prints its tiles as `QuickGameTile`, `PuzzleTile`, `DailyPuzzleTile`, `VsBotTile`, `VsCoachTile` and `NextLessonTile`, which the tile filter did not recognise, so hiding Play Online, Puzzles, Daily Puzzle, Play Bots, Play Coach or Lessons did nothing there. They now answer to the same switches as on 4.10.23. Hiding every middle bottom-bar tab and the Puzzles tile from 1.9.18 is unchanged

# [1.9.19](https://github.com/quwi26/Quwis-Patches/compare/v1.9.18...v1.9.19) (2026-11-03)

### Bug Fixes

* **Stockfish analysis:** the 80 MB Stockfish download was cached in the system's temp folder, which cleaners, updates and Android's own cache handling empty, so every re-patch downloaded it again. The cache now lives in the user's home folder on a computer and in the patcher's app data on a phone. A copy left in temp is moved there once, and an existing copy is checked against its SHA-256 before it is reused

# [1.9.18](https://github.com/quwi26/Quwis-Patches/compare/v1.9.17...v1.9.18) (2026-11-03)

### Bug Fixes

* **Customize bottom bar:** Puzzles no longer stays pinned right after Play: every tab between Home and More, Puzzles included, follows the saved order. Turning every middle tab off now leaves just Home and More instead of bringing the app's defaults back
* **Customize Home screen:** on 4.10.23 hiding and reordering the tiles was silently ignored, because the section was rebuilt through a constructor that version no longer has. It is now rebuilt through the app's own copy helper, so the tiles change again. The redesign's Recommended Match row reuses the Challenges section, so "Suggested opponents" and "Challenges" are now told apart by the section title and keep working independently
* **Quwi's Patches settings:** Home changes now show the restart bar, since the Home content is cached until the app restarts, instead of claiming they appear when you go back

# [1.9.17](https://github.com/quwi26/Quwis-Patches/compare/v1.9.16...v1.9.17) (2026-11-03)

### Bug Fixes

* **Game Review:** on 4.10.23 a castling move was handed to the app as king-takes-rook (`e1h1`), which the app's replayer no longer accepts, so the review crashed with a bare `NullPointerException`. Moves are now named by the app's own converter, and castling is normalised when that converter is absent. A game whose moves still cannot be read now stops with the review's error screen instead of crashing

# [1.9.16](https://github.com/quwi26/Quwis-Patches/compare/v1.9.15...v1.9.16) (2026-11-03)

### Bug Fixes

* **Notification prompt:** on some EMUI devices the system returns its own wrapper around the adaptive launcher icon. The app dropped it and asked Compose to read the `<adaptive-icon>` XML, which Compose cannot do, and the notification prompt crashed. The prompt now keeps the drawable the system returned and converts it to a bitmap as before

# [1.9.15](https://github.com/quwi26/Quwis-Patches/compare/v1.9.14...v1.9.15) (2026-11-03)

### Bug Fixes

* **Arrows in games:** bot games no longer show the floating Arrows and Clear panel; it covered the board and is being replaced with proper bar buttons later. Live, daily, archived, pass and play, and coach games keep their buttons

# [1.9.14](https://github.com/quwi26/Quwis-Patches/compare/v1.9.13...v1.9.14) (2026-11-03)

### Bug Fixes

* **Arrows in reviews:** the Analysis screen is left alone again. Its bottom bar is built from a branch per state, so the two buttons could not be placed in it; Game Review keeps its own Arrows and Clear
* **Arrows in games:** bot games get the floating Arrows and Clear chip back. The patch stopped adding the chip after trying the bot bar, and the bot bar's buttons were only drawn in one game state
* **Stockfish analysis:** the patch log now says when the 80 MB engine is already downloaded and when a download starts, so missing progress lines are no longer puzzling

# [1.9.13](https://github.com/quwi26/Quwis-Patches/compare/v1.9.12...v1.9.13) (2026-11-03)

### Bug Fixes

* **Arrows in reviews:** Game Review's bar is rebuilt from the app's own actions every time it is drawn, so Clear is usually not in the list yet. Removing it then stopped Arrows from being added, and the bar came up without either button. Arrows is added whether or not Clear was there, and Clear still folds away while drawing is off

# [1.9.12](https://github.com/quwi26/Quwis-Patches/compare/v1.9.8...v1.9.12) (2026-11-03)

### Bug Fixes

* **Patching:** the bundle is built with Morphe patcher 2.1.0, the version Morphe 2.3.0 ships, so patching no longer warns that it was built for the older patcher 1.14.1. The patches themselves are unchanged

# [1.9.11](https://github.com/quwi26/Quwis-Patches/compare/v1.9.10...v1.9.11) (2026-11-02)

### Bug Fixes

* **Bundle:** 1.9.10 was packaged without the compiled patch code, so Morphe showed no patches in it. The bundle ships it again; everything from 1.9.10 is unchanged

# [1.9.10](https://github.com/quwi26/Quwis-Patches/compare/v1.9.9...v1.9.10) (2026-11-02)

### Bug Fixes

* **Arrows in reviews:** the Analysis bar's buttons no longer disappear when the screen is built before the switch is read. The draw button follows the reviews switch each time the bar is shown, and a button that stays hidden is written to the log
* **Arrows in reviews:** Clear now appears next to Arrows only while drawing is on, and folds away when Arrows is pressed again. Game Review and the Analysis bars save the space; game bars keep both buttons as before

# [1.9.9](https://github.com/quwi26/Quwis-Patches/compare/v1.9.7...v1.9.9) (2026-11-02)

### Bug Fixes

* **Stockfish analysis:** the 80 MB engine download no longer starts over after a timeout. It is kept in a partial file and continued with a Range request, and the patch log shows the progress every 10%, so a slow connection can finish in several tries

# [1.9.8](https://github.com/quwi26/Quwis-Patches/compare/v1.9.5...v1.9.8) (2026-11-02)

### Bug Fixes

* **Stockfish analysis:** the 80 MB engine download no longer starts over after a timeout. It is kept in a partial file and continued with a Range request, and the patch log shows the progress every 10%, so a slow connection can finish in several tries

# [1.9.7](https://github.com/quwi26/Quwis-Patches/compare/v1.9.6...v1.9.7) (2026-11-02)

### Bug Fixes

* **Arrows in reviews:** pressing Arrows in Game Review answered "open a board first" because that screen's board was built without the marks layers. The button now finds the board already on screen and adds the layers before it starts drawing
* **Arrows:** 4.10.23 renamed the newer board's piece layer, so the arrows layers were not added to it; the patch now passes that version's own class name to the extension
* **Arrows in reviews:** the Analysis bar's buttons read their tag from the layout attributes when they are created, so they follow the reviews switch instead of being hidden when the tag is read late

# [1.9.6](https://github.com/quwi26/Quwis-Patches/compare/v1.9.5...v1.9.6) (2026-11-02)

### Bug Fixes

* **Arrows in reviews:** Game Review's bottom bar wraps each of its actions in a small holder class before drawing them, so the Arrows and Clear actions added as plain actions were skipped and the floating buttons were switched off at the same time, leaving none. They are now wrapped the same way, and the buttons appear next to Show, Best, Skills or Retry, and Share
* **Arrows in reviews:** a single-action review bar keeps a fixed-size list, which cannot take the two new actions; it is replaced with a growable one first

# [1.9.5](https://github.com/quwi26/Quwis-Patches/compare/v1.9.4...v1.9.5) (2026-11-02)

### Bug Fixes

* **Patching:** the patch set no longer runs out of memory on phones with little RAM. Two scans, Customize bottom bar and Lichess puzzles, made every class they visited mutable, and every mutable class is rewritten into a new DEX file; they now read the app's classes unchanged and make mutable only the few that get a hook. Checks that only test whether a class exists no longer make it mutable either

# [1.9.4](https://github.com/quwi26/Quwis-Patches/compare/v1.9.3...v1.9.4) (2026-11-01)

### Bug Fixes

* **Arrows in games:** on 4.10.23 the bot game's bottom bar is a Compose row of the app's own buttons, so Arrows and Clear join it there and the floating chip is gone
* **Arrows in reviews:** 4.10.23's new Analysis screen draws its own Compose bar too; Arrows and Clear are added to it, next to its buttons
* **Arrows in reviews:** Game Review's bar no longer crashes when it shows the condensed paywall. That state wraps each action in another class, so the Arrows and Clear actions are only added to the plain list

# [1.9.3](https://github.com/quwi26/Quwis-Patches/compare/v1.9.2...v1.9.3) (2026-11-01)

### Bug Fixes

* **Chess.com:** opening Settings on 4.10.23 no longer crashes. Hide Premium-only content filtered the settings rows into a plain List and stored it in an ArrayList field, which the verifier rejects; the copy is cast to the field's type now
* **Arrows in reviews:** the buttons in Game Review's bottom bar are found again. The action class was looked up by its smali name instead of its Java name, so the lookup failed and the bar stayed empty

# [1.9.2](https://github.com/quwi26/Quwis-Patches/compare/v1.9.1...v1.9.2) (2026-11-01)

### Bug Fixes

* **Chess.com:** Lichess puzzles no longer crash on opening. The empty path stats were returned as a plain object, which the app's verifier rejects; they are cast back to their own type now
* **Arrows in reviews:** Arrows and Clear now sit in Game Review's own bottom bar, as two more of its buttons, instead of a floating chip over the board

### Features

* **Chess.com:** a new optional patch, Crash details, shows a crash on a screen of its own with the stack trace and a Copy button, so a report can include what went wrong

# [1.9.1](https://github.com/quwi26/Quwis-Patches/compare/v1.9.0...v1.9.1) (2026-11-01)

### Bug Fixes

* **Chess.com:** Lichess puzzles show the rating on 4.10.23 again. The Classic layout's path stats are empty in guest mode, so the rating chip and the user rating read zero; they now carry the Lichess rating, and the review state's own rating stays in step during a session

# [1.9.0](https://github.com/quwi26/Quwis-Patches/compare/v1.8.0...v1.9.0) (2026-11-01)

### Features

* **Chess.com:** a separate Arrows in reviews patch adds Arrows and Clear to Game Review, where a small chip over the board switches drawing on, and to the Analysis boards, where they sit in the bottom bar
* **Chess.com:** Arrows in games is back to the game bars only; the Analysis board belongs to Arrows in reviews now, and the two features can be switched on and off independently

# [1.8.0](https://github.com/quwi26/Quwis-Patches/compare/v1.7.2...v1.8.0) (2026-11-01)

### Features

* **Chess.com:** Arrows in games now also adds Arrows and Clear to the Analysis board's bottom bar, so arrows and marked squares can be drawn while analysing a game, not only during play

# [1.7.2](https://github.com/quwi26/Quwis-Patches/compare/v1.7.1...v1.7.2) (2026-11-01)

### Bug Fixes

* **Chess.com:** Lichess puzzles are scored on 4.10.23 again; the score constructor's error type changed, so the local scoring fell back to chess.com's API and every wrong move or finish showed its dead-end error
* **Chess.com:** the solved Lichess puzzle screen has its XP, stats and bonuses (empty, as guest puzzles have none), instead of reading nulls
* **Chess.com:** Next opens the next Lichess puzzle during a session instead of asking chess.com for a rated one and hitting the free daily limit; chess.com's own puzzles keep their Next

# [1.7.1](https://github.com/quwi26/Quwis-Patches/compare/v1.7.0...v1.7.1) (2026-10-31)

### Bug Fixes

* **Chess.com:** the Lichess puzzles caption on the welcome screen uses the new Quwi's Patches name too

# [1.7.0](https://github.com/quwi26/Quwis-Patches/compare/v1.6.21...v1.7.0) (2026-10-31)

### New Features

* **Chess.com:** the in-app screen is now called Quwi's Patches, and the About line names Great and Brilliant moves

### Bug Fixes

* **Chess.com:** board coordinates are visible again: Board colors swapped the dark and light coordinate colours, so in a review the letters and numbers matched the squares under them (Noam's issue 28)

# [1.6.21](https://github.com/quwi26/Quwis-Patches/compare/v1.6.20...v1.6.21) (2026-10-31)

### Improvements

* **Chess.com:** the bundle is now Quwi's Chess Patches and lives at github.com/quwi26/Quwis-Patches; it is still a fork of Noam's Morphe Patches, GPL-3.0, with the same three Game Review patches
* **Chess.com:** the wrong Brilliant mark report link works again - Issues are enabled in the repository

# [1.6.20](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.19...v1.6.20) (2026-10-31)

### Improvements

* **Chess.com:** Game Review on your computer and Great and Brilliant moves analysis are selected by default again, as they were part of Unlimited Game Review before the split

# [1.6.19](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.18...v1.6.19) (2026-10-31)

### New Features

* **Chess.com:** the fork's Game Review additions are separate patches. Unlimited Game Review is the base; Game Review on your computer adds the fourth reviewer, and Great and Brilliant moves analysis adds the Great (!) and Brilliant (!!) marks. Both add-ons need Unlimited Game Review from this bundle, and a second Unlimited Game Review from another source still cannot be applied to the same app. After updating, select the two add-ons to keep the computer reviewer and the marks

### Improvements

* **Chess.com:** Stockfish on your computer no longer needs the Stockfish analysis patch: the search runs on the computer, so the phone's engine is not loaded for it

# [1.6.18](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.17...v1.6.18) (2026-10-31)

### Bug Fixes

* **Chess.com:** Time controls under a minute no longer moves the increment slider's minimum: the shared stepper is told apart by a range-safe check, which also clears the assembler warning on 4.10.23

# [1.6.17](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.16...v1.6.17) (2026-10-31)

### Bug Fixes

* **Chess.com:** Brilliant now asks whether you were already winning without the move, not whether the move itself wins outright: sacrifices that force mate or turn a level game into a big advantage are marked again

# [1.6.16](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.15...v1.6.16) (2026-10-31)

### Bug Fixes

* **Chess.com:** a sacrifice in an already won game is no longer marked Brilliant, where the old "winning outright" cutoff let a +9 position through and the mark depended on the review depth

# [1.6.15](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.14...v1.6.15) (2026-10-31)

### Bug Fixes

* **Chess.com:** Noam's Patches is back in the More tab on 4.10.23, where the row model keeps only its Kotlin constructor with default values

# [1.6.14](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.13...v1.6.14) (2026-10-31)

### Bug Fixes

* **Chess.com:** a sacrifice that leaves the game dead equal is no longer marked Brilliant: a bishop given for a pawn in a drawn endgame sat exactly on the 50% boundary of expected points

# [1.6.13](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.12...v1.6.13) (2026-10-31)

### New Features

* **Chess.com:** chess.com 4.10.23 is supported next to 4.10.18, with every patch in this bundle working on either version
* **Chess.com:** in 4.10.23 bot games, where the bar takes no buttons, a small chip over the board switches Arrows and clears the marks

### Improvements

* **Chess.com:** the engine review and the local Stockfish analysis read 4.10.23's renamed PGN parser, position accessors, move converter and review data classes
* **Chess.com:** the manager's changes button now shows this changelog instead of a single description

# [1.6.12](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.11...v1.6.12) (2026-10-31)

### New Features

* **Chess.com:** brilliant moves found by your reviews open the game at that move on chess.com when the review saved the game's address
* **Chess.com:** a "Report a wrong mark" row opens a GitHub issue with fields for the game, the move and what chess.com says

### Improvements

* **Chess.com:** a saved review keeps the game's address next to the moves, and reviews saved by an older version pick it up when the game is opened again

# [1.6.11](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.10...v1.6.11) (2026-10-31)

### Bug Fixes

* **Chess.com:** in the Brilliant check an ordinary trade no longer counts as a sacrifice, and a check only offers the checking piece

# [1.6.10](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.9...v1.6.10) (2026-10-31)

### Bug Fixes

* **Chess.com:** a pawn no longer counts as attacking every square on its file, which had marked some moves Brilliant that were not

# [1.6.9](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.8...v1.6.9) (2026-10-31)

### Improvements

* **Chess.com:** Brilliant is now checked as a real sacrifice by static exchange instead of material in the engine's line, so quiet moves are not marked for a brief loss in a trade
* **Chess.com:** a move within 2% of the best one can still be Brilliant, as chess.com puts it

# [1.6.8](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.7...v1.6.8) (2026-10-30)

### New Features

* **Chess.com:** Brilliant moves are marked in engine reviews
* **Chess.com:** Noam's Patches lists the brilliant moves your saved reviews found

# [1.6.7](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.6...v1.6.7) (2026-10-30)

### New Features

* **Chess.com:** Great moves are marked in engine reviews, with a switch in Noam's Patches
* **Chess.com:** the engine searches two lines per move, which is how a Great move is told from the only good one
* **Chess.com:** Game Review depth is chosen per reviewer

# [1.6.6](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.5...v1.6.6) (2026-10-30)

### Improvements

* **Chess.com:** the settings say "your computer" everywhere, never the author's machine
* **Chess.com:** the bridge that runs Stockfish on your computer ships in the repository, with a README and test scripts

# [1.6.5](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.4...v1.6.5) (2026-10-30)

### New Features

* **Chess.com:** the phone and the computer have their own review depth
* **Chess.com:** a benchmark button measures the bridge before a review

# [1.6.4](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.3...v1.6.4) (2026-10-30)

### Improvements

* **Chess.com:** the bundle carries chess.com patches only

# [1.6.3](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.2...v1.6.3) (2026-10-30)

### Bug Fixes

* **Chess.com:** Stockfish's threads and hash follow your computer, not the phone

# [1.6.2](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.1...v1.6.2) (2026-10-30)

### Improvements

* **Chess.com:** the bundle is called Noam's Morphe Patches Stockfish+

# [1.6.1](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.6.0...v1.6.1) (2026-10-30)

### Bug Fixes

* **Chess.com:** the bundle is built with its patch list and carries classes.dex, so Morphe loads it

# [1.6.0](https://github.com/quwi26/Noams-Morphe-Patches-StockfishPlus/compare/v1.5.0...v1.6.0) (2026-10-30)

### New Features

* **Chess.com:** Game Review can run on Stockfish over your local network, on your own computer
