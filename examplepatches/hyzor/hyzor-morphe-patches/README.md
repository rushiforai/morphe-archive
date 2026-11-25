# 🧩 Hyzor Patches

Patches for apps I use, for use with [Morphe](https://morphe.software).

| App | Package | Supported versions |
|---|---|---|
| [Sleep as Android](docs/apps/sleep-as-android.md) | `com.urbandroid.sleep` | `20261016` |
| [SnoreLab](docs/apps/snorelab.md) | `com.snorelab.app` | `2.33.7.7953` |
| [NYT Games](docs/apps/nyt-games.md) | `com.nytimes.crossword` | `6.50.0` |
| [Chess.com](docs/apps/chess-com.md) | `com.chess` | `4.10.27` |
| [Duolingo](docs/apps/duolingo.md) | `com.duolingo` | `6.104.5` |
| [Nova Launcher](docs/apps/nova-launcher.md) | `com.teslacoilsw.launcher` | `9.0.1` |
| [FolderSync](docs/apps/foldersync.md) | `dk.tacit.android.foldersync.lite` | `4.14.0` |
| [Projectivy Launcher](docs/apps/projectivy-launcher.md) | `com.spocky.projengmenu` | `4.73` |
| [Solid Explorer](docs/apps/solidexplorer.md) | `pl.solidexplorer2` | `3.6.5` |
| [nzb360](docs/apps/nzb360.md) | `com.kevinforeman.nzb360` | `25.3` |
| [Trakt](docs/apps/trakt.md) | `tv.trakt.trakt` | `3.28.0` |
| [Sparkle TV](docs/apps/sparkle.md) | `se.hedekonsult.sparkle` | `2.4.0` |

### How to use these patches

Add this source to Morphe:

```
https://morphe.software/add-source?github=hyzor/hyzor-morphe-patches
```

Then patch a stock APK (or APKM/XAPK bundle) of a supported version. The output is
re-signed by Morphe, so the stock app has to be uninstalled first — back up your data
before you do. Updating an install signed by the same Morphe key keeps its data.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.2](https://github.com/hyzor/hyzor-morphe-patches/releases/tag/v1.10.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;37 patches total
<details open>
<summary>📦 NYT Games&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 6.50.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED Black](#amoled-black) | Paints the app's own dark theme pure black (#000000) instead of dark grey, for OLED screens. Native UI only: the games themselves are WebViews with their own web CSS and stay dark grey. |  |
| [Unlock Subscription](#unlock-subscription) | Reports the account as an active Games subscriber, unlocking subscriber-only archives and bonus puzzles. Client side only; the backend may still refuse some content. |  |

</details>

<details open>
<summary>📦 Chess.com&nbsp;&nbsp;•&nbsp;&nbsp;20 patches</summary>
<br>

**🎯 Supported versions:**

| 4.10.27-googleplay |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED black](#amoled-black) | Pure black backgrounds instead of chess.com's dark grey, in the newer and the older screens. Switch it in Noam's Patches (then restart the app). |  |
| [Accent color](#accent-color) | Your own colour in place of chess.com's green, chosen in Noam's Patches → Accent color: buttons, highlights, icons and text of the app. |  |
| [Arcade animations](#arcade-animations) | Adds the chess.com website's Arcade piece animations to the classic board (live games and the Puzzle Rush, Puzzle Battle, Learning and Review puzzle modes): light trails, bursts when a piece is picked up, dropped or captured, a flash on check, outlined last-move squares and animated move hints. The newer board used by bot games, the Daily Puzzle, Solve Puzzles and Lichess Puzzles is not covered yet. Switch it in Noam's Patches. |  |
| [Arrows in games](#arrows-in-games) | Adds Arrows and Clear buttons to the live, daily and pass-and-play game bars, and a small chip over the board in bot games. While Arrows is on, dragging on the board draws an arrow and tapping marks a square, as on the website, and pieces don't move. |  |
| [Board colors](#board-colors) | Choose the board's square colours: your own, or one of chess.com's colour themes, on every board of the app. In Noam's Patches → Board colors. |  |
| [Clone Chess.com](#clone-chess-com) | Renames the app to com.chess.noam so it installs next to the real Chess.com app instead of over it. Leave it off to keep updating your current install. |  |
| [Customize Home screen](#customize-home-screen) | Choose which tiles and sections the Home screen shows, and the order of the tiles. |  |
| [Customize bottom bar](#customize-bottom-bar) | Choose the tabs between Home and More (Puzzles, Learn, Watch, Bots, Train) and their order, in Noam's Patches → Bottom bar. |  |
| [Hide Premium-only content](#hide-premium-only-content) | Free accounts no longer see what only Premium members can use: Premium-only bots are not listed, and the Premium toolbar button, the Home and More banners and the Settings Upgrade row, the Home diamond, the sale banner and More's Membership row are gone. Nothing is unlocked. |  |
| [Lichess Puzzles](#lichess-puzzles) | Puzzles from Lichess becomes the Puzzles tab's big button, with chess.com's Solve Puzzles above it. Lichess's puzzles play in chess.com's own puzzle screen (board, coach, sounds), rated on the phone the way Lichess rates them; nothing is sent to chess.com. |  |
| [Limits as toasts](#limits-as-toasts) | When a free limit is reached (Game Review, puzzles, lessons, drills, videos…) a short toast says so instead of a full-screen Premium offer, and promotional pop-ups are not shown. Nothing is unlocked: the limits stay exactly as they are. |  |
| [No ads](#no-ads) | Banner, full-screen and game-over ads are not loaded or shown, and neither are their Remove Ads links: the app's own "ads enabled" state and the account's show-ads flag, which are off for members, stay off. |  |
| [No rating prompts](#no-rating-prompts) | The app doesn't ask you to rate it on Google Play. Switch it in Noam's Patches. |  |
| [Noam's Patches settings](#noam-s-patches-settings) | Adds a Noam's Patches row at the top of the More tab, where the other patches of this bundle are switched on and off. Patches you did not select do not show up there. |  |
| [Stockfish analysis](#stockfish-analysis) | Stockfish 19 on your phone, offline (arm64): best-move arrows on finished games, the analysis boards, the game explorer and Game Review (in a Lichess review, on the moves Lichess didn't mark), and an eval bar where chess.com has none of its own. It never shows while a game is being played or in puzzles. Patching downloads the official Stockfish 19 (80 MB) from Stockfish's GitHub, so it needs internet. |  |
| [Time controls under a minute](#time-controls-under-a-minute) | The custom time slider goes below one minute: 10, 15, 20, 30 and 45 seconds, with or without increment, the way the website allows. Labels read "30 sec" and "0:30+1". |  |
| [Unlimited Game Review](#unlimited-game-review) | Game Review asks who reviews the game: chess.com, Lichess's servers (online, with your Lichess account) or, with the Stockfish analysis patch, Stockfish on your phone (offline, no daily limit). A Lichess or phone review is scored the Lichess way (accuracy, centipawn loss, and inaccuracies, mistakes and blunders) and shown in chess.com's own review screen. Finished games only; a live game on screen is never analysed. |  |
| [Unlimited Play Coach](#unlimited-play-coach) | Removes the one-free-game-per-day limit on Play Coach, a bot-only practice mode. |  |
| [Unlock Premium content](#unlock-premium-content) | The app's own premium-tier check always answers with the top tier, so content gated on it (lessons, drills, insights, themes, puzzle-rush extras and anything else that reads the account's tier) treats the account as a member. The server still decides what you may actually play online. |  |
| [Unlock all bots](#unlock-all-bots) | Every bot in Versus Bots can be played, including ones only Premium members may play. |  |

</details>

<details open>
<summary>📦 Duolingo&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 6.104.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable dynamic app icon](#disable-dynamic-app-icon) | Prevents Duolingo from changing the app icon. Only the default icon will be available. |  |
| [Enable Premium](#enable-premium) | Enables app features locked behind the subscription paywall. Some features like AI video calls may not work. | • Type |
| [Enable debug mode](#enable-debug-mode) | Enables hidden debug menu in settings. |  |
| [Unlimited RampUp time](#unlimited-rampup-time) | The timer for RampUp challenges will never decrease. |  |

</details>

<details open>
<summary>📦 Sleep as Android&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 20261016 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Cloud Premium](#enable-cloud-premium) | Reports the Sleep Cloud subscription as active. Client side only; the backend may still refuse. |  |
| [Enable Premium](#enable-premium) | Unlocks Sleep as Android Premium. Tap Wait I already Paid when Prompted |  |

</details>

<details open>
<summary>📺 Sparkle TV (Android TV)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.4.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Plus](#enable-plus) | Unlocks the Plus subscription features, including DVR, timeshift, multiview, VOD (movies & series), multi-source setup and channel/category editing. |  |

</details>

<details open>
<summary>📦 SnoreLab&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.33.7.7953 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Enables app features locked behind the subscription paywall. |  |

</details>

<details open>
<summary>📦 Nova Launcher&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 90100 (9.0.1) |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Prime](#enable-prime) | Unlocks Nova Launcher Prime by starting the app in the prime state and reporting an active subscription, so the settings and features gated on Prime are available. |  |

</details>

<details open>
<summary>📦 Solid Explorer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.6.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Pro](#enable-pro) | Enables the features locked behind the Pro subscription. |  |

</details>

<details open>
<summary>📦 Trakt&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 3.28.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix sign-in](#fix-sign-in) | Signs in through a regular browser tab so the OAuth callback can return to a re-signed build. If the browser offers to open Trakt, choose it. |  |
| [Unlock VIP](#unlock-vip) | Reports the signed-in account as VIP to the app's own checks, unlocking the local VIP gates (the recap screens, the VIP badge and the other surfaces gated on that flag). Client side only: limits and perks the Trakt API enforces server-side still follow the real account tier. |  |

</details>

<details open>
<summary>📦 nzb360&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 25.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock All Access](#unlock-all-access) | Unlocks All Access without the in-app purchase, so every service module and the Upgrade Center behave as if the subscription is active. |  |

</details>

<details open>
<summary>📦 FolderSync&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.14.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks FolderSync's premium without the in-app purchase and removes the ads, so you get unlimited sync pairs and the advanced options. |  |

</details>

<details open>
<summary>📦 Projectivy Launcher&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.73 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks Projectivy Launcher's premium features by starting the app in its registered state, so the purchase prompts and feature locks are gone. |  |

</details>

<!-- PATCHES_END -->

## 📱 Sleep as Android

Supported target: `20261016`.

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |
| Enable Cloud Premium | off | Reports the Sleep Cloud subscription as active (client-side only). |

Sleep as Android validates purchases on-device: Play Billing's signature is checked against
an RSA key in `classes4.dex`, the result is written as a plain `BS = 42` in the `TVF`
preferences, and `TrialFilter` turns that into `isTrial = false`. The patches rewrite that
decision — and clear the two tamper signals a re-signed sideload sets — instead of forging a
receipt. The paid `com.urbandroid.sleep.full.key` unlocker does not work alongside them:
Morphe re-signs the app, so the `checkSignatures()` comparison between the two packages
fails.

[How the app decides you are premium →](docs/apps/sleep-as-android.md)

## 📱 SnoreLab

Supported target: `2.33.7.7953` (XAPK).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |

The patch forces the local premium source (`up.h.q()` and `mp.d.p(...)`) to `true`, so the
billing merge always reports `Premium`; the backend still sees the real account.

Recording needs microphone access: without it, **Start** silently bounces back to the
landing page, because `NightViewActivity` finishes itself when `RECORD_AUDIO` is missing.
Grant it in the app's permissions, or
`adb shell pm grant com.snorelab.app android.permission.RECORD_AUDIO`, and re-check after
every install — reinstalling forgets runtime permissions.

[Port notes, verification and billing details →](docs/apps/snorelab.md)

## 📱 NYT Games

Supported target: `6.50.0` (APKM).

| Patch | Default | What it does |
|---|---|---|
| Unlock Subscription | on | Reports the account as an active Games subscriber (client-side only). |
| AMOLED Black | on | Native UI only: paints the app's own dark theme pure black (`#000000`). |

The patch forces `SubauthEntitlementClientImpl.P()` (`isSubscribedForGames`), the bit the
rest of the app reads as "subscribed", while leaving the signed-in and linked bits alone.
Archives and bonus puzzles open. Anything the NYT backend decides (account pages, purchase,
restore) still sees the real account, and one-time Game **Packs** are not covered.

AMOLED Black covers the native UI only: Wordle, Connections, Strands and friends are
WebViews with the website's own dark theme and stay dark grey.

[Port notes, verification and the AMOLED write-up →](docs/apps/nyt-games.md)

## 📱 Chess.com

Supported target: `4.10.27-googleplay`. Older builds, including 4.10.23, are no longer
supported.

20 patches, most backed by the bundle's Java extension. The **Noam's Patches** row in the
More tab turns the feature patches on and off, and only the patches you selected appear
there. Stockfish analysis downloads the official arm64 engine (about 80 MB) while patching,
so it needs internet; Clone Chess.com installs the app as `com.chess.noam` next to the real
one and is off by default.

[Patch groups, caveats and credits →](docs/apps/chess-com.md)

## 📱 Duolingo

Supported target: `6.104.5` (APKM, versionCode 2494).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Reports the signed-in account as Super (or MAX) so the client unlocks subscriber features. |
| Disable dynamic app icon | off | Removes the disabled launcher aliases so only the default icon remains. |
| Enable debug mode | off | Adds the hidden **Debug options** menu to Settings. |
| Unlimited RampUp time | off | Pins the RampUp challenge timer at one hour. |

The premium fields are written on the `User` wrapped by the `LoggedIn` state, so only the
signed-in account changes and a friend's profile still shows their real state. Email login
on the re-signed build depends on the login-integrity patch, which every other Duolingo
patch depends on.

[6.104.5 hook changes and on-device verification →](docs/apps/duolingo.md)

## 📱 Nova Launcher

Supported target: `90100 (9.0.1)` (APK, versionCode `90100`).

| Patch | Default | What it does |
|---|---|---|
| Enable Prime | on | Unlocks the features gated on Nova Prime. |

Nova keeps the Prime decision on the device. The patch returns `true` from the static Prime
gate (`rw.e1.b()`), forces the persisted `"1"` value read at startup to `0x200` (the app's own
"direct licence" state), and returns `true` from the subscription-on-record check
(`lx.v0.v()`), which also keeps the licence revocation path from starting. 9.0.1 split the old
subscription check in two; only the Prime-level half is forced, so the newer Plus tier stays
gated. Client-side only: anything Nova asks its backend for still needs a real account.

[Port notes, hook map and on-device verification →](docs/apps/nova-launcher.md)

## 📱 FolderSync

Supported target: `4.14.0` (APKM, versionCode `2020100216`).

| Patch | Default | What it does |
|---|---|---|
| Unlock Premium | on | Reports the lite build as the paid version and turns off its ads. |

FolderSync keeps the licence in one `VersionFeaturesConfig` record and rebuilds it from Play
Billing on every preference change, so forcing only the preference getter would be undone a
moment after startup. The patch forces the constructor's `isPaidVersion` argument instead, which
covers every config the app builds, and forces `getPremiumVersionPurchased()` for the readers
that use the preference directly. `showAds` follows the same flag, so the dashboard ads are
gone, and the lite build already ships `Int.MAX_VALUE` for the account and folder-pair limits.
Anything FolderSync's backend verifies still sees the real account.

[Port notes, billing details and verification →](docs/apps/foldersync.md)

## 📱 Projectivy Launcher

Supported target: `4.73` (versionCode `98`), as both the APKMirror APKM and the GitHub release
APK.

| Patch | Default | What it does |
|---|---|---|
| Unlock Premium | on | Starts the app in its registered state, so the purchase prompts and feature locks are gone. |

The premium flag is one `StateFlow<Boolean>` created by `PTApplication`, and it is inverted:
`true` means **not registered**. The patch flips the constructor's `Boolean.TRUE` seed to
`FALSE` and turns the licence writer `d(Z)V` into `return-void`, so neither the startup re-check
nor the Play Billing collector can set it back.

The 4.73 release exists as two separately compiled builds with the same identity — the
APKMirror APKM and the GitHub universal APK — and they do not share R8 names, so the
fingerprints anchor on structure rather than class names, and both `APKM` and `APK` are
declared (the file type is part of compatibility). An APKM carries only its own ABIs; the
GitHub APK has all four. Every patch also depends on an internal resource patch that sets
`android:extractNativeLibs="true"`, without which a repackaged build can fail on 16 KB-page
devices with `INSTALL_FAILED_NO_MATCHING_ABIS`.

[Build variants, install notes and verification →](docs/apps/projectivy-launcher.md)

## 📱 Solid Explorer

Supported target: `3.6.5` (APKM, versionCode `306051`).

| Patch | Default | What it does |
|---|---|---|
| Enable Pro | on | Reports the free licence as Pro, so the Pro features unlock and the ads are gone. |

The licence is one immutable `LicenseDetails` record, and every gate reads its `LicenseState`:
`FeatureGate.isAccessGranted()` accepts `SUBSCRIBER` and `PREMIUM_PRO`, while `adsEnabled()` is
`state == UNLICENSED`. At the end of the constructor the patch rewrites a record that still
reports ads to `PREMIUM_PRO`, which unlocks the Pro features (folder encryption, the storage
analyser, backup sync, icon sets) and stops the ad views from being created. A record that is
already licensed keeps its state, and the product id, trial dates and server decisions are
untouched.

[Port notes, hook map and verification →](docs/apps/solidexplorer.md)

## 📱 nzb360

Supported target: `25.3` (versionCode `537`, universal APK).

| Patch | Default | What it does |
|---|---|---|
| Unlock All Access | on | Reports All Access as active, so every service module and the Upgrade Center unlock. |

All Access is decided on the device by `NZB360LicenseHelper`: `isAASubscriptionActive()` gates
`isUnlocked(Service, Z)`, and the two `isLocked` wrappers the UI calls invert it. The patch
rewrites those four licence checks plus `Contract$UIState.isSubscribed()` for the Upgrade
Center, and seeds the plan toggle on `"Yearly"`. The modules added in 25.3 need no change
because the unlock is at the All Access level; credits and Feature Bounties are separate and are
not granted, and anything the backend verifies still sees the real account.

[Port notes, hook map and verification →](docs/apps/nzb360.md)

## 📱 Trakt

Supported target: `3.28.0` (APKM, versionCode `452`).

| Patch | Default | What it does |
|---|---|---|
| Fix sign-in | on | Signs in through a regular browser tab so the OAuth callback can return to a re-signed build. If the browser offers to open Trakt, choose it. |
| Unlock VIP | on | Reports the signed-in account as VIP to the app's own checks, unlocking the local VIP gates. |

VIP is one boolean on the Kotlinx-serialized `User` model. The patch sets it in both
constructors that write it — the primary one used when mapping the API response and the
serialization synthetic used when decoding a cached session — so the local VIP gates (the recap
screens, the VIP badge, Discover → Filters) see a VIP account. Server-enforced limits and perks
still follow the real tier.

3.28 signs in through AuthTab with an `https://app.trakt.tv/…` redirect, and Chrome only
completes that hand-off after Digital Asset Links verification, which a Morphe-signed build
fails. `Fix sign-in` forces the HTTPS callback on and routes the flow to the app's regular
Custom Tab path, which `MainActivity` already accepts; the callback may ask for **Open in
Trakt** once. Without it, AuthTab fails and the retired `trakt://auth` redirect is refused.

[Sign-in, hook map and verification →](docs/apps/trakt.md)

## 📱 Sparkle TV

Supported target: `2.4.0` (APK, versionCode `204004`, Android TV only).

| Patch | Default | What it does |
|---|---|---|
| Enable Plus | on | Unlocks the Plus subscription features: DVR, timeshift, multiview, VOD, multi-source setup and channel/category editing. |

Sparkle keeps the licence in one bitmask and asks one static gatekeeper
(`kh.x.e(Context, int mask, int required, String prompt)`) from every premium surface, so
returning `true` at its entry opens all of them. The patch also forces the mask that
`MainActivity.K` and `LibUtils.h` distribute to `0xFF`, pins the feature bits the gatekeeper
compares against, and neutralises the native handshake plus the debugger and
purchase-signature checks. The setup wizard keeps its own copy of the mask: it is seeded and
then re-asserted in the overview updater (a Play Billing failure callback writes `0` into it),
and the six fragments that cache it are clamped. The VOD background artwork is capped at
960 x 540dp — still 4K at density 4 — because the stock 2000dp values ask Glide for an
8000 x 8000 bitmap on a 640 dpi TV, which Android refuses to draw and which killed
Movies/Series on entry.

Timeshift is untouched — the patch only changes the licence decision, never the session or
buffer classes. Client-side only: anything the backend verifies still sees the real account.

[Licence model, hook map and verification →](docs/apps/sparkle.md)

## ✅ Verification

`tools/verify_fingerprints.py` re-checks the pinned class/method fingerprints against an
APK's DEX files, without running Gradle, Morphe or a disassembler. It detects the app from
the classes present and accepts APK, APKM and XAPK (opened through their nested `base.apk`).

```
python3 tools/verify_fingerprints.py /path/to/app.apk
```

Duolingo's structural fingerprints (string anchors and field-usage shapes) cannot be
expressed as class/method names, so for Duolingo the script only checks its pinned
class/method signatures — build and apply the bundle for the rest.

Run it after every app update, before bumping the matching `Constants.kt`. The full
device checklist is in [AGENTS.md](AGENTS.md#testing-on-a-device).

## 🚀 Development

Read [AGENTS.md](AGENTS.md) first: it covers the repository layout, how Morphe patches
work, building, and testing on a phone.

Requires JDK 21+ and a GitHub token with `read:packages`, because the
`app.morphe.patches` Gradle plugin resolves from GitHub Packages:

```
export GITHUB_ACTOR=<your-github-username>
export GITHUB_TOKEN=<token with read:packages>
./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/libs/patches-*.mpp`.

New patching work uses the globally installed Morphe CLI (`morphe --version` →
Morphe Desktop 2.3.0) and the project signing key kept outside this repository at
`$HOME/Projects/hyzor/.signing/hyzor-morphe-patches.keystore`. Never let Morphe generate a
key, and never commit the key. The full command, the key's alias and the
`.tmp/<app>/<version>/` working-directory convention are in
[AGENTS.md](AGENTS.md#morphe-cli-and-signing).

For a new app version, scaffold the version directory first with
`tools/new-workdir.sh <app> <version>`. The stock APK/APKM/XAPK is supplied manually
(APKMirror does not always carry a plain APK); put it in the printed `in/` path. See
[AGENTS.md](AGENTS.md#supporting-a-new-app-version).

- Make changes on `dev`. `fix:` / `feat:` / `bump:` commits produce pre-releases;
  `chore:`, `docs:` and `ci:` commits do not.
- Merge `dev` into `main` (merge, don't squash) for a stable release. Documentation-only
  changes may go straight to `main` with a `docs:` commit.
- Enable *Allow GitHub Actions to create and approve pull requests* in
  Settings → Actions → General → Workflow permissions, or the `dev` → `main` PR
  job fails.

## ⚖️ Licence and credits

GPLv3 — see [LICENSE](LICENSE) and [NOTICE](NOTICE).

Every patch set here is either new work or a port; the ports keep their upstream code and
attribution:

- **Template:** built from
  [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
- **Sleep as Android:** descends from
  [Entree3k/Morning-Entree-Patches](https://github.com/Entree3k/Morning-Entree-Patches)
  (GPLv3). The 20261016 compatibility target, the two extra fingerprint hooks and the cloud
  patch are new here.
- **SnoreLab:** port of
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPLv3).
- **NYT Games:** port of
  [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) (GPLv3).
- **Chess.com:** port of
  [Noam's Morphe Patches](https://github.com/ImNoammm/Noams-Morphe-Patches) (GPLv3); the
  4.10.27 support is new here. The clone patch derives from
  [PrathxmOp/Prathxm-Patches](https://github.com/PrathxmOp/Prathxm-Patches) (GPL-3.0).
- **Duolingo:** port of
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPLv3), re-resolved
  for 6.104.5.
- **Nova Launcher:** port of
  [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) and
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (both GPLv3),
  re-resolved for 9.0.1.
- **FolderSync:** port of
  [arandomhooman/hoomans-morphe-patches](https://github.com/arandomhooman/hoomans-morphe-patches)
  (GPLv3), re-resolved for 4.14.0.
- **Projectivy Launcher:** port of the 4.71 "Unlock Premium" patch in
  [Entree3k/Morning-Entree-Patches](https://github.com/Entree3k/Morning-Entree-Patches)
  (GPLv3), re-resolved for 4.73 with the APK/APKM split targets.
- **Solid Explorer:** port of
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPLv3), re-resolved
  for 3.6.5.
- **nzb360:** port of
  [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) (GPLv3),
  re-resolved for 25.3.
- **Trakt:** port of
  [ineednotitle/Proteus-Patches](https://github.com/ineednotitle/Proteus-Patches) (GPLv3),
  re-resolved for 3.28.0.
- **Sparkle TV:** port of the "Unlock Plus" patch in
  [HSlightsteel/slight-patches](https://github.com/HSlightsteel/slight-patches) (GPLv3),
  re-resolved for 2.4.0.

Original patch code is © the upstream authors and contributors — ImNoammm, hoo-dles,
rushiranpise, Entree3k, PrathxmOp, arandomhooman, ineednotitle, HSlightsteel and their
contributors. New code in this repository is © hyzor.

Not affiliated with Urbandroid, SnoreLab, The New York Times, Chess.com, Duolingo, Nova
Launcher, TeslaCoil Software, Tacit Dynamics, Projectivy Launcher, Solid Explorer, nzb360,
Trakt, Sparkle TV, the Morphe project, or the above authors.

## ⚠️ Disclaimer

**For learning and experimentation only.** This is a personal project, not a product or a
service, and these patches are experiments: incomplete, unsupported, and likely to break when
an app updates. They exist to study how Android apps are built and how their bytecode and
resources can be changed for interoperability and private study of software I already have
the right to run. Do not redistribute patched apps.

**AI disclosure.** This repository is also an experiment in AI-assisted reverse engineering:
how well a large-language-model coding agent can carry an end-to-end workflow. Most of the
patch code, extension code, fingerprint analysis, documentation and test reports here were
produced with AI assistance — decompiling a stock app, locating and re-resolving
fingerprints, writing the patches and extension code, building the `.mpp`, applying it with
Morphe, installing the result on a physical phone connected over `adb` (a Pixel 9 on
Android 17 in the runs recorded here), and checking the behaviour on the device. A human
chooses what to patch and reviews the result, but AI output can be wrong, incomplete or
overconfident. Treat every claim in this repository as something to verify yourself, not as
a guarantee.

**Use at your own risk.** Re-signing an app changes its certificate: it can break logins,
Play Integrity, purchases and server-side features, invalidate warranties, and violate an
app's terms of service. Back up your data first. Only patch apps you have the right to use;
what is lawful depends on where you live, and you are responsible for your own use. Nothing
here is intended to encourage piracy or to deny developers their revenue.

**No warranty.** The patches are provided "as is", without warranty of any kind, express or
implied. The authors and contributors are not liable for any damage, data loss, account
restriction or other consequence arising from their use.
