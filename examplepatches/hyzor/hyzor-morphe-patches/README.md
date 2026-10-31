# 🧩 Hyzor Patches

Patches for apps I use, for use with [Morphe](https://morphe.software).

Currently supports **Sleep as Android** (`com.urbandroid.sleep`),
**SnoreLab** (`com.snorelab.app`), **NYT Games** (`com.nytimes.crossword`) and
**Chess.com** (`com.chess`, 4.10.18 and 4.10.23).

### Credits

The chess.com patches are a port of [Noam's Morphe Patches](https://github.com/ImNoammm/Noams-Morphe-Patches)
(GPLv3), extended with chess.com 4.10.23 support. Original patch code © ImNoammm and
contributors; the 4.10.23 port lives here.

### How to use these patches

Add this source to Morphe:

```
https://morphe.software/add-source?github=hyzor/hyzor-morphe-patches
```

Then patch a stock APK (or APKM/XAPK bundle) of a supported version. The output is
re-signed by Morphe, so the stock app has to be uninstalled first — back up your data
before you do.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/hyzor/hyzor-morphe-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;25 patches total
<details open>
<summary>📦 NYT Games&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 6.48.0 |
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

| 4.10.18-googleplay | 4.10.23-googleplay |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED black](#amoled-black) | Pure black backgrounds instead of chess.com's dark grey, in the newer and the older screens. Switch it in Noam's Patches (then restart the app). |  |
| [Accent color](#accent-color) | Your own colour in place of chess.com's green, chosen in Noam's Patches → Accent color: buttons, highlights, icons and text of the app. |  |
| [Arcade animations](#arcade-animations) | Adds the chess.com website's Arcade piece animations to every board: light trails, bursts when a piece is picked up, dropped or captured, a flash on check, outlined last-move squares and animated move hints. Switch it in Noam's Patches. |  |
| [Arrows in games](#arrows-in-games) | Adds Arrows and Clear buttons to the game bars (live, daily, archived, pass and play, bots, coach). While Arrows is on, dragging on the board draws an arrow and tapping marks a square, as on the website, and pieces don't move. |  |
| [Board colors](#board-colors) | Choose the board's square colours: your own, or one of chess.com's colour themes, on every board of the app. In Noam's Patches → Board colors. |  |
| [Clone Chess.com](#clone-chess-com) | Renames the app to com.chess.noam so it installs next to the real Chess.com app instead of over it. Leave it off to keep updating your current install. |  |
| [Customize Home screen](#customize-home-screen) | Choose which tiles and sections the Home screen shows, and the order of the tiles. Works on both of chess.com's Home screens (the older list and the redesign). |  |
| [Customize bottom bar](#customize-bottom-bar) | Choose the tabs between Home and More (Puzzles, Learn, Watch, Bots, Train) and their order, in Noam's Patches → Bottom bar. |  |
| [Hide Premium-only content](#hide-premium-only-content) | Free accounts no longer see what only Premium members can use: Premium-only bots are not listed, and the Premium toolbar button, the Home and More banners and the Settings Upgrade row, the Home diamond, the sale banner and More's Membership row are gone. Nothing is unlocked. |  |
| [Lichess Puzzles](#lichess-puzzles) | Puzzles from Lichess becomes the Puzzles tab's big button, with chess.com's Solve Puzzles above it. Lichess's puzzles play in chess.com's own puzzle screen (board, coach, sounds), rated on the phone the way Lichess rates them; nothing is sent to chess.com. |  |
| [Limits as toasts](#limits-as-toasts) | When a free limit is reached (Game Review, puzzles, lessons, drills, videos…) a short toast says so instead of a full-screen Premium offer, and promotional pop-ups are not shown. Nothing is unlocked: the limits stay exactly as they are. |  |
| [No ads](#no-ads) | Banner, full-screen and game-over ads are not loaded or shown, and neither are their Remove Ads links: the app's own "ads enabled" state and the account's show-ads flag, which are off for members, stay off. |  |
| [No rating prompts](#no-rating-prompts) | The app doesn't ask you to rate it on Google Play. Switch it in Noam's Patches. |  |
| [Noam's Patches settings](#noam-s-patches-settings) | Adds a Noam's Patches row at the top of the More tab, where the other patches of this bundle are switched on and off. Patches you did not select do not show up there. |  |
| [Stockfish analysis](#stockfish-analysis) | Stockfish 19 on your phone, offline (arm64): best-move arrows on finished games, the analysis boards, the game explorer and Game Review (in a Lichess review, on the moves Lichess didn't mark), and an eval bar where chess.com has none of its own. It never shows while a game is being played or in puzzles. Patching downloads the official Stockfish 19 (80 MB) from Stockfish's GitHub, so it needs internet. |  |
| [Time controls under a minute](#time-controls-under-a-minute) | The custom time slider goes below one minute: 10, 15, 20, 30 and 45 seconds, with or without increment, the way the website allows. Labels read "30 sec" and "0:30+1". |  |
| [Unlimited Game Review](#unlimited-game-review) | Game Review asks who reviews the game: chess.com, Lichess's servers (online, with your Lichess account) or, with the Stockfish analysis patch, Stockfish on your phone (offline, no daily limit). The phone and Lichess judge moves the Lichess way (?! inaccuracies, ? mistakes, ?? blunders, accuracy and centipawn loss) in chess.com's own review screen, and the phone marks the moves Lichess leaves unmarked Best, Excellent or Good, as chess.com does. Finished games only; a live game on screen is never analysed. |  |
| [Unlimited Play Coach](#unlimited-play-coach) | Removes the one-free-game-per-day limit on Play Coach, a bot-only practice mode. |  |
| [Unlock Premium content](#unlock-premium-content) | The app's own premium-tier check always answers with the top tier, so content gated on it (lessons, drills, insights, themes, puzzle-rush extras and anything else that reads the account's tier) treats the account as a member. The server still decides what you may actually play online. |  |
| [Unlock all bots](#unlock-all-bots) | Every bot in Versus Bots can be played, including ones only Premium members may play. |  |

</details>

<details open>
<summary>📦 Sleep as Android&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 20261006 | 20260616 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Cloud Premium](#enable-cloud-premium) | Reports the Sleep Cloud subscription as active. Client side only; the backend may still refuse. |  |
| [Enable Premium](#enable-premium) | Unlocks Sleep as Android Premium. Tap Wait I already Paid when Prompted |  |

</details>

<details open>
<summary>📦 SnoreLab&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.33.5.7814 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Enables app features locked behind the subscription paywall. |  |

</details>

<!-- PATCHES_END -->

## 📱 Sleep as Android

Supported targets: `20261006`, `20260616`.

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |
| Enable Cloud Premium | off | Reports the Sleep Cloud subscription as active (client-side only). |

### How the app decides you are premium

Sleep as Android validates in-app purchases entirely on-device:

1. Play Billing returns a purchase; the app verifies Play's signature over it with an
   RSA key embedded in `classes4.dex` (`Billing.verify`, `SHA1withRSA`).
2. On success it writes `BS = 42` into the `TVF` SharedPreferences file — a plain
   `long`, no MAC, no Keystore wrapping.
3. `TrialFilter.refresh()` maps that to `isTrial = false`, which 58 call sites read.

There is no server-issued licence. The patches therefore rewrite the decision
(`isTrial`, `hasUnlock`, `isUnlockAcked`) rather than trying to forge a receipt, and
additionally clear the two tamper signals a re-signed sideload triggers
(`isOurSignature`, `isUnknownSource`).

The genuine paid unlocker (`com.urbandroid.sleep.full.key`) is *not* required and
does **not** work alongside these patches — Morphe re-signs the app, so the
`checkSignatures()` comparison between the two packages no longer matches.

## 📱 SnoreLab

Supported target: `2.33.5.7814` (XAPK).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |

This is a port of [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches)'
2.27.3.6291 patch. The newer build is not a drop-in replacement for its fingerprints:
the prefs class gained two more boolean getters, and a second class now matches the
"public one-object constructor" anchor, so both reference fingerprints become
ambiguous. `Fingerprints.kt` pins the exact method / premium-source interface and
documents why.

The port was verified end-to-end on a Pixel 9 (Android 17): a premium-only
soundscape (`Soundscape.FOREST`) selects and plays without opening the purchase
screen, Trends renders without its upgrade banner, and *Settings → Profile → Your
Subscription* reports “You have the Premium version of SnoreLab”.

### How the app decides you are premium

SnoreLab uses the `lib-billing` library. `BasePremiumRepository` (`pl.c`) merges Play
Billing with a local premium source (`mp.d`):

1. `mp.d` reads `remotePremiumActive` and `remotePremiumExpirationDate` from the
   user-data SharedPreferences (`vp.h`).
2. It emits `Premium` when the flag is set and the expiry is in the future;
   otherwise `Expired` or `Free`.
3. `pl.c` keeps a local `Premium` even when Play Billing returns no purchases, and
   `pl.a0.isPremium()` follows the merged state.

The patch forces the two inputs of the local source (`vp.h.q()` → true and
`mp.d.p(...)` → true), so the merge always produces `Premium`. It only changes the
client-side decision; anything that authenticates against SnoreLab's backend still
needs a real account.

### Recording immediately returns to the landing page

SnoreLab will not start a session without microphone access, and it does not show
an error when the permission is missing. `NightViewActivity` checks `RECORD_AUDIO`
in `onCreate`, then calls `finish()` and relaunches `MainActivity`, so tapping
**Start** looks like it bounces straight back to the home screen.

Grant the permission and try again:

- **Settings → Apps → SnoreLab → Permissions → Microphone → Allow while using app**, or
- `adb shell pm grant com.snorelab.app android.permission.RECORD_AUDIO`

Reinstalling or updating the app can reset runtime permissions, so re-check this
after every install. A test session can also be stopped from the ongoing
notification's **STOP** action; the in-app slide-to-stop control shows the
30-minute minimum-recording warning first.

## 📱 NYT Games

Supported target: `6.48.0` (APKM).

| Patch | Default | What it does |
|---|---|---|
| Unlock Subscription | on | Reports the account as an active Games subscriber (client-side only). |
| AMOLED Black | on | Native UI only: paints the app's own dark theme pure black (`#000000`). The games are WebViews and stay dark grey. |

This is a port of [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches)'
6.33.0 patch. The newer build flattened the delegate chain that patch's fingerprint was
written against, so the hook had to be re-resolved; `Fingerprints.kt` documents how the
method was identified.

### How the app decides you are a subscriber

The games code does not verify a receipt. The subauth library keeps a local user state
(`NYTUserState`) with three booleans — signed in, has an active entitlement, has a linked
entitlement — and `SubauthEntitlementClientImpl` exposes them:

| Method | Name (from the in-app developer settings) | Reads |
|---|---|---|
| `P()` | `isSubscribedForGames` | the active-entitlement bit |
| `E()` | `isSubscribedAndLinked` | `SubscriptionLevel` is *registered + subscribed + linked* |
| `K()` | `isSubscribedViaGooglePlay` | Play entitlements contain `Games` |
| `R()` | `hasUnlinkedSubscription` | `SubscriptionLevel` is an unlinked subscriber |

`P()` is the one the rest of the app treats as "subscribed":

- `AppEntitlementsImpl.e()` → `UserEntitlements.statusFlow` → `EntitlementStatus`, which
  `GameAvailabilityCalculator`, the archive screens and the bonus-puzzle paywall read;
- `GamesHybridUserConfig.isSubscribed`, handed to the WebView games;
- `GamesSubauth2PurchaseClientImpl.d()` plus ads/analytics targeting.

The patch forces only `P()` to `true`. The signed-in and linked bits are left alone on
purpose: forcing them changes `NYTUserImpl.d()` to *registered + subscribed + linked*, and
the app then tries to load a profile for a session that does not exist — that is the
"Oops, something went wrong" Me-page bug noted in the reference patch.

The port was verified end-to-end on a Pixel 9 (Android 17) with a signed-in **free** NYT
account. Installing only the patched DEX over the stock build (same app data, same
throwaway signing key) flips every subscription surface in the app:

| Surface | Stock | Patched |
|---|---|---|
| Me → Settings | `NOT SUBSCRIBED`, **Subscribe** row | `NYT GAMES SUBSCRIBER`, no Subscribe row |
| Home hero | “Subscribe to Games” banner | normal greeting |
| Crossword / Wordle / Connections / Strands archive | “Access our archives with a subscription” | full calendar; archived puzzles open and play |
| Bonus puzzles | free *Starter set* + “Unlock new Weekly drops” tile | the current weekly drop, playable |

The same comparison holds with no account signed in (anonymous users get the same
unlocks), and the Me page keeps working throughout — no “Oops, something went wrong”.

### Limitations

Only the client-side decision is changed. Anything the NYT backend decides for itself
(account/subscription pages, purchase and restore, pushes) still sees the real account
state, and an anonymous user stays anonymous — the patch reports *subscribed*, not
*signed in*. Game **Packs** are one-time purchases rather than a subscription and are not
covered by this patch.

### AMOLED Black (native UI only)

The games inside this app — Wordle, Connections, Strands, Spelling Bee, Sudoku, ... — are
**WebViews** (`GamesHybridHostActivity`). Their screens are a website rendered by the app, and
they keep the website's own dark theme (`#121213`), which this patch does not touch. Everything
the patch does cover is the app's **native** UI: home, Me, settings, archive sheets, tab bar,
dialogs, puzzle toolbars and the system bars.

The app's dark theme is dark grey, not black: pages are `#121212`, sheets and modals
`#2A2A2A`. On an OLED panel those pixels still light up. The patch paints them `#000000`,
in both places the app gets its theme from:

- the Compose design system keeps its palette as plain ARGB constants in
  `ExtendedColorsKt.<clinit>` — one `const-wide` per colour, rewritten in place;
- the XML views (bottom tab bar, archive sheet, dialogs, puzzle toolbars) resolve
  `res/values-night/colors.xml`, plus the `*AlwaysDark` variants in the default file and
  the theme's window/navigation-bar colour.

Light mode is untouched: only the night configuration and the always-dark values change.
The calendar cells of the archive (`#363636`) and `backgroundTertiary` (`#424242`) are kept
slightly grey on purpose — pure black would make those small surfaces disappear.

**Not covered:** the games that run in a WebView (`GamesHybridHostActivity` — Wordle,
Connections, Strands, ...) draw their own dark theme from the web bundle (`#121213`), which
no resource or bytecode patch can reach. Those screens stay dark grey.

Injecting a stylesheet into the WebView is mechanically possible — the hybrid host funnels
every page through `WebViewClientProxy.onPageFinished`, and a wildcard test stylesheet does
repaint the page. It is not worth it here: the bundles are served from nytimes.com with
content-hashed filenames and hashed CSS-module class names, the puzzle framework applies its
dark colours from nested containers instead of a theme class on `html`/`body`, and the web
app ships independently of the APK. Any targeted rule would be guesswork that silently stops
working on the next web deploy.

## ✅ Verification

`tools/verify_fingerprints.py` re-checks every fingerprint against an APK's DEX
files without running Gradle, Morphe or a disassembler. It detects the app from the
classes that are present:

```
python3 tools/verify_fingerprints.py /path/to/app.apk
```

APK, APKM and XAPK all work: bundles are opened through their nested `base.apk`.

Run it after every app update before bumping the matching `Constants.kt`.

## 🚀 Development

Requires JDK 21+ and a GitHub token with `read:packages`, because the
`app.morphe.patches` Gradle plugin resolves from GitHub Packages:

```
export GITHUB_ACTOR=<your-github-username>
export GITHUB_TOKEN=<token with read:packages>
./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/libs/patches-*.mpp`.

- Make changes on `dev`. `fix:` / `feat:` commits produce pre-releases, `chore:`
  commits do not.
- Merge `dev` into `main` (merge, don't squash) for a stable release.
- Enable *Allow GitHub Actions to create and approve pull requests* in
  Settings → Actions → General → Workflow permissions, or the `dev` → `main` PR
  job fails.

## ⚖️ Licence and credits

GPLv3 — see [LICENSE](LICENSE) and [NOTICE](NOTICE).

- Built from [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
- The Sleep as Android patches descend from
  [Entree3k/Morning-Entree-Patches](https://github.com/Entree3k/Morning-Entree-Patches)
  (GPLv3). The 20261006 compatibility target, the two extra fingerprint hooks and the
  cloud patch are new here.
- The SnoreLab patch is a port of
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPLv3).
- The NYT Games patch is a port of
  [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) (GPLv3).
- Not affiliated with Urbandroid, The New York Times, the Morphe project, or the above
  authors.

Patches are provided for interoperability and private study of software I already
have the right to run. They bypass a licence check; using them to avoid paying for
software you use is your call, not mine.
