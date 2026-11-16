# Chess.com

Package `com.chess`, supported target `4.10.27-googleplay` (versionCode 280120). The patches
are written for that build only: no older version's shapes are kept as fallbacks.
Sources: [`patches/.../chesscom/`](../../patches/src/main/kotlin/dev/hyzor/patches/chesscom/) and
[`extensions/chesscom/`](../../extensions/chesscom/).

This is the largest set in the bundle: 20 patches, most of them backed by the Java
extension in `extensions/chesscom` (about 50 classes). The Kotlin patches find and hook the
right places, and do the resource and manifest work; the feature logic lives in the
extension, which is merged into the patched app as a DEX.

The set is a port of [Noam's Morphe Patches](https://github.com/ImNoammm/Noams-Morphe-Patches)
(GPLv3), ported to the supported build. The clone patch is derived from
[PrathxmOp/Prathxm-Patches](https://github.com/PrathxmOp/Prathxm-Patches) (GPL-3.0); the
file header keeps that attribution.

## Noam's Patches settings

Applying **Noam's Patches settings** adds a row at the top of the More tab (titled
*Noam's Patches · hyzor*). That screen is
part of the extension (`MorpheSettingsActivity`, registered in the manifest by a resource
patch) and groups the options into *Board*, *Look*, *Games* and *Less clutter*. Settings are
stored in the `morphe_chesscom` SharedPreferences file.

Every feature has a marker method in `Features`; the patch flips its marker to `true` when
it is applied, and the settings screen only lists the features whose marker answers `true`.
A patch you did not select therefore does not appear, and cannot be switched on. The
extension learns about the app lifecycle through a hook that
`ExtensionHookPatch` inserts into `MainApplication.onCreate()`: that gives it the
`Application` context and lets it follow which activity is on screen.

## Home screen and bottom bar

Both *Look* features rewrite lists instead of editing a layout:

- **Bottom bar.** `NavigationBarState` keeps the middle tabs. The state has no `tabs()`
  getter, so the patch rewrites the four-argument constructor's list
  (`HomeTabs.middleTabs`) and rebuilds the finished list (`HomeTabs.finalTabs`, hooked after
  the bar's list is built): Home stays first, More last (the app appends it after the hook),
  and Puzzles follows the saved order like the other tabs instead of staying pinned after
  Home. The saved list may be empty: Home and More stay, and the bar renders with just those
  two tabs. Without a saved order the bar is left as the app built it.
- **Home screen.** The redesign passes each section to `Content` separately; tiles are
  filtered and reordered in `HomeLayout.recommendedActivities`. `RecommendedActivitiesSection`
  has two enum-typed fields (the
  carousel type and `LessonSection`), so the extension only picks the enum the constructor
  uses; it rebuilds the section through the app's own copy helper
  `a(RecommendedActivitiesSection, List)` when present, and otherwise through the full
  constructor, reading its other arguments from the matching fields. Hidden sections become
  empty instances (Friends, Game history, Challenges, Suggested opponents); Stats keeps its
  empty-state frame, because the app draws the Ratings block even with an empty stats list.
  The redesign has no separate recommendations section: its `ChallengesSection` doubles as
  the Recommended Match row, so `HomeLayout.section` tells the Challenges and Suggested
  opponents switches apart by the section title (the `recommended_match` string resource).

Changes from the settings screen need a restart: the Home content is cached in its view
model, and the bar reads the state once at startup. Both pages show the restart bar.

## Accent color

The patch does not recolour components one by one. `AccentPatch` hooks the `(J)J` helper the
design system's palette calls from its `<clinit>`, and the extension swaps any colour that
matches chess.com's green palette for the matching shade of the chosen accent: shade 5
(green300, the brand green) is the accent itself, the others are mixed towards white or black
by fixed amounts. Buttons, highlights, icons, text and the section accents therefore all follow
one setting. The palette is built once per process, so a change needs a restart (the settings
page shows the restart bar).

One surface is deliberately exempt. The Puzzles tab's path background — the diagonal
checkerboard under the puzzle map — is painted from green700 plus a hardcoded 10 %-darker copy.
The copy is not a palette colour, so letting the palette half follow the accent left the two
grid colours mismatched. The patch replaces that one palette read with `Accent.PATH_GREEN`
(green700) and keeps the pair on chess.com's green. Only the green (WOOD) tier is affected:
the other tiers build their backgrounds from non-green palette colours and literals, which the
accent never touched.

## Arcade animations

A reimplementation of chess.com's website Arcade renderer on the app's classic board: a light
trail follows each move, the piece pulses while it is held with grab and drop bursts, captures
burst, the king flashes in check, the last move is outlined in the mover's colour and legal-move
hints are animated. The sprites are chess.com's own, downloaded once and cached.

The patch hooks the classic board (`com.chess.chessboard.view.ChessBoardView` and its
`viewlayers.PieceView`), which is still used by live games (`RealGameActivity`) and the Puzzle
Rush, Puzzle Battle, Learning and Review puzzle modes. The Compose board
(`com.chess.chessboard.v2.ChessBoardView`) used by bot games, the Daily Puzzle, Solve Puzzles and
Lichess puzzles is a different implementation and is not hooked, so those screens have no Arcade
effects. The in-app page says this as well.

## Board colors

The patch replaces the theme's board background with the app's own plain-colour
`DarkAndLightSquares` instance: `BoardColors.background` builds it through the constructor
whose class name the patch writes into `BoardColors.squaresClass()`, so pieces, highlights and
the rest of the board keep the app's drawing.

The coordinates are hooked in `ChessBoardTheme`'s constructor, which takes the background and
the two coordinate colours. Those parameters are named `darkSquareCoordinateColor` and
`lightSquareCoordinateColor`, but they name the two coordinate *shades*, not the squares they
are drawn on: the canvas layer paints the dark shade on the light squares and the light shade
on the dark squares. `BoardColors` therefore hands the dark shade the chosen dark colour and
the light shade the chosen light colour. Reversed, every coordinate takes the colour of the
square under it and disappears — the bug reported upstream as issue #28.

The page also has a **Use the app's board theme** switch. While it is on the hook passes the
background and both coordinate colours through unchanged, so the board chosen in *More →
Theme → Board* applies — including the app's patterned themes, which this patch does not
reproduce. Picking any preset or custom colour switches back to the patch's colours. That is
how the app's theme menu and Board colors coexist: the feature stays installed, but it only
overrides the board while one of its own colours is selected.

## Caveats

- **One target, no fallbacks.** The patches name the supported build's classes and methods
  directly; there is no older version's shape behind a lookup. A class or method that moves
  in a new build fails the patch instead of matching a stale shape.
- **Stockfish analysis needs internet while patching.** The patch downloads the official
  Stockfish 19 Android arm64 build (about 80 MB) from Stockfish's GitHub, verifies the
  archive and engine SHA-256, and places it at `lib/arm64-v8a/libstockfish.so`. It is
  arm64-only, and only runs on a device that supports it. The download is cached in the
  system temp directory between runs.
- **Patching Chess.com needs a lot of memory.** The APKM is 236 MB and its 36 modules are
  merged before patching, and every class a patch makes mutable is compiled into a new DEX
  file. Scanning the app through `mutableClassDefBy` once made all 87,519 classes mutable:
  patching every default patch at once peaked at 4.7 GB and failed with a 1.5 GB heap (see
  [issue #7](https://github.com/hyzor/hyzor-morphe-patches/issues/7)). The scans now read the
  immutable classes and make only the ~70 hooked classes mutable, so the same set completes
  with a 256 MB heap (about 2.2 GB peak without a heap limit, and 740 MB peak with a 256 MB
  cap), most of which is the merge and loading the app's eight DEX files (78 MB of dex, 87k
  classes). An arm64-only bundle is about half that input (the other three ABI splits are
  ~120 MB), so it is worth using on a small device. Morphe's *Strip libs* option
  (`--striplibs`) does not help here: it runs after the bundle is merged, so patching peaks at
  the same 2.4 GB, and only the output gets smaller (347 MB → 227 MB keeping `arm64-v8a`).
- **Clone Chess.com changes the package name** to `com.chess.noam` and renames the app's
  own permissions and provider authorities so both installs can coexist. It is off by
  default; leaving it off keeps the normal `com.chess` package that updates in place.
- **Lichess puzzles are local.** Puzzles are scored with Lichess's Glicko rating on the
  phone and nothing is sent to chess.com. Online Lichess features (server-side Game Review)
  need a Lichess login.
- **Nothing premium is unlocked on the server.** *Unlock Premium content* forces the app's
  tier check to the top tier, so every client-side gate opens; the chess.com backend still
  decides what the account may play or download.

## Lichess puzzles in the puzzle screen

*Puzzles from Lichess* opens chess.com's `RatedPuzzlesGameActivity` in guest mode, and the
session runs it as `PathPuzzlesMode.REGULAR` so the Classic layout and the rating stats load.

- Before the first batch is seeded, the extension empties chess.com's `RATED_GUEST` queue.
  The delete is a suspend DAO method, so the same table is cleared with
  `DELETE FROM tactics_problem WHERE source = 4` through Room's writable database. Without it,
  chess.com's older guest puzzles are served first and the screen shows chess.com's rating
  and history instead of Lichess's.
- The rating box reads the live Glicko rating, and the graph is drawn from a local history of
  the last 20 ratings (`lichess_puzzle_history`), not chess.com's rating history. **Reset
  rating** clears that history too.
- The in-game settings dialog hides the rows that do nothing in a Lichess session: Collect
  Puzzle Points, Always Show Rating, Show Puzzle Goals, Difficulty and Show Chat Hints.
  Mistake Feedback, Voice and Show Timer are local and stay. The full Settings → Puzzles page
  is unchanged.
- The filter holds on the next puzzle too. Next opens the replacement screen before the old
  instance is destroyed, so the extension tracks which puzzle screen is in front: the replaced
  instance's teardown must not hide its replacement. Backing out to the hub ends the session even
  inside the short Next hand-off window: the decision waits for the window to close instead of
  being skipped.

Port-tested on 4.10.27 with a clone install (`com.chess.noam`, guest account): cold start
without a crash, Noam's Patches lists every applied patch, the bottom bar honours a saved tab
set after a restart, *Puzzles from Lichess* downloads the offline set and opens chess.com's
Classic puzzle screen with the Lichess rating box and graph, and the Arrows chip appears in a
bot game. Not exercised: a signed-in free account (so the sale banner and Upgrade row side of
*Hide Premium-only content*), the custom time slider (the guest game-setup flow does not expose
it), and Stockfish (not selected in the test build).

The two oddities seen during the first ad-hoc session (a puzzle shown *Unrated* after a move,
and the Puzzles big button falling back to *Solve Puzzles*) were checked with an A/B run:
4.10.23 with the previous bundle and 4.10.27 with this one, same clone install and the same
guest flow. Both builds behave identically — a wrong move stays on the puzzle and updates the
Lichess rating (1183/−317 on 4.10.23, 1217/−283 on 4.10.27), *Next* opens the following puzzle
with the rating box intact, and Back to the hub keeps *Puzzles from Lichess* in place. They
look like transient states of that session, not version differences.

## Feature groups

The settings screen groups the features as follows (names as shown in *Noam's Patches*):

- **Board:** Arcade animations, Board colors, Arrows in games.
- **Look:** AMOLED black, Accent color, Home screen, Bottom bar.
- **Games:** Time controls under a minute, Stockfish analysis, Lichess Puzzles, Unlock all
  bots, Unlimited Play Coach, Unlock Premium content, Unlimited Game Review.
- **Less clutter:** Limits as toasts, Hide Premium-only content, No ads, No rating prompts.

Two further patches are not feature toggles: **Noam's Patches settings** adds the screen
itself, and **Clone Chess.com** changes the package name.
