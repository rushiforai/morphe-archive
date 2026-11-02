# Chess.com

Package `com.chess`, supported targets `4.10.18-googleplay` (versionCode 280075) and
`4.10.23-googleplay` (versionCode 280100).
Sources: [`patches/.../chesscom/`](../../patches/src/main/kotlin/dev/hyzor/patches/chesscom/) and
[`extensions/chesscom/`](../../extensions/chesscom/).

This is the largest set in the bundle: 20 patches, most of them backed by the Java
extension in `extensions/chesscom` (about 50 classes). The Kotlin patches find and hook the
right places, and do the resource and manifest work; the feature logic lives in the
extension, which is merged into the patched app as a DEX.

The set is a port of [Noam's Morphe Patches](https://github.com/ImNoammm/Noams-Morphe-Patches)
(GPLv3), extended with 4.10.23 support. The clone patch is derived from
[PrathxmOp/Prathxm-Patches](https://github.com/PrathxmOp/Prathxm-Patches) (GPL-3.0); the
file header keeps that attribution.

## Noam's Patches settings

Applying **Noam's Patches settings** adds a row at the top of the More tab. That screen is
part of the extension (`MorpheSettingsActivity`, registered in the manifest by a resource
patch) and groups the options into *Board*, *Look*, *Games* and *Less clutter*. Settings are
stored in the `morphe_chesscom` SharedPreferences file.

Every feature has a marker method in `Features`; the patch flips its marker to `true` when
it is applied, and the settings screen only lists the features whose marker answers `true`.
A patch you did not select therefore does not appear, and cannot be switched on. The
extension learns about the app lifecycle through a hook that
`ExtensionHookPatch` inserts into `MainApplication.onCreate()`: that gives it the
`Application` context and lets it follow which activity is on screen.

## Caveats

- **Two targets, one fingerprint set.** 4.10.18 is the build the fingerprints were written
  against; 4.10.23 is being tested against the same fingerprints. Check both when changing a
  fingerprint.
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

## Feature groups

The settings screen groups the features as follows (names as shown in *Noam's Patches*):

- **Board:** Arcade animations, Board colors, Arrows in games.
- **Look:** AMOLED black, Accent color, Home screen, Bottom bar.
- **Games:** Time controls under a minute, Stockfish analysis, Lichess Puzzles, Unlock all
  bots, Unlimited Play Coach, Unlock Premium content, Unlimited Game Review.
- **Less clutter:** Limits as toasts, Hide Premium-only content, No ads, No rating prompts.

Two further patches are not feature toggles: **Noam's Patches settings** adds the screen
itself, and **Clone Chess.com** changes the package name.
