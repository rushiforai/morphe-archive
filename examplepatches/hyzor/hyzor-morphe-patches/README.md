# 🧩 Hyzor Patches

Patches for apps I use, for use with [Morphe](https://morphe.software).

| App | Package | Supported versions |
|---|---|---|
| [Sleep as Android](docs/apps/sleep-as-android.md) | `com.urbandroid.sleep` | `20261006`, `20260616` |
| [SnoreLab](docs/apps/snorelab.md) | `com.snorelab.app` | `2.33.5.7814` |
| [NYT Games](docs/apps/nyt-games.md) | `com.nytimes.crossword` | `6.48.0` |
| [Chess.com](docs/apps/chess-com.md) | `com.chess` | `4.10.18`, `4.10.23` |
| [Duolingo](docs/apps/duolingo.md) | `com.duolingo` | `6.104.3` |

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
> **[v1.4.1](https://github.com/hyzor/hyzor-morphe-patches/releases/tag/v1.4.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;29 patches total
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
<summary>📦 Duolingo&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 6.104.3 |
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

Sleep as Android validates purchases on-device: Play Billing's signature is checked against
an RSA key in `classes4.dex`, the result is written as a plain `BS = 42` in the `TVF`
preferences, and `TrialFilter` turns that into `isTrial = false`. The patches rewrite that
decision — and clear the two tamper signals a re-signed sideload sets — instead of forging a
receipt. The paid `com.urbandroid.sleep.full.key` unlocker does not work alongside them:
Morphe re-signs the app, so the `checkSignatures()` comparison between the two packages
fails.

[How the app decides you are premium →](docs/apps/sleep-as-android.md)

## 📱 SnoreLab

Supported target: `2.33.5.7814` (XAPK).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |

The patch forces the local premium source (`vp.h.q()` and `mp.d.p(...)`) to `true`, so the
billing merge always reports `Premium`; the backend still sees the real account.

Recording needs microphone access: without it, **Start** silently bounces back to the
landing page, because `NightViewActivity` finishes itself when `RECORD_AUDIO` is missing.
Grant it in the app's permissions, or
`adb shell pm grant com.snorelab.app android.permission.RECORD_AUDIO`, and re-check after
every install — reinstalling forgets runtime permissions.

[Port notes, verification and billing details →](docs/apps/snorelab.md)

## 📱 NYT Games

Supported target: `6.48.0` (APKM).

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

Supported targets: `4.10.18` and `4.10.23` (both `-googleplay`).

20 patches, most backed by the bundle's Java extension. The **Noam's Patches** row in the
More tab turns the feature patches on and off, and only the patches you selected appear
there. Stockfish analysis downloads the official arm64 engine (about 80 MB) while patching,
so it needs internet; Clone Chess.com installs the app as `com.chess.noam` next to the real
one and is off by default.

[Patch groups, caveats and credits →](docs/apps/chess-com.md)

## 📱 Duolingo

Supported target: `6.104.3` (APKM, versionCode 2492).

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

[6.104.3 hook changes and on-device verification →](docs/apps/duolingo.md)

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
device checklist is in [AGENTS.md](AGENTS.md#testing-on-a-phone).

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

- Make changes on `dev`. `fix:` / `feat:` commits produce pre-releases, `chore:`
  commits do not.
- Merge `dev` into `main` (merge, don't squash) for a stable release.
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
  (GPLv3). The 20261006 compatibility target, the two extra fingerprint hooks and the cloud
  patch are new here.
- **SnoreLab:** port of
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPLv3).
- **NYT Games:** port of
  [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) (GPLv3).
- **Chess.com:** port of
  [Noam's Morphe Patches](https://github.com/ImNoammm/Noams-Morphe-Patches) (GPLv3); the
  4.10.23 support is new here. The clone patch derives from
  [PrathxmOp/Prathxm-Patches](https://github.com/PrathxmOp/Prathxm-Patches) (GPL-3.0).
- **Duolingo:** port of
  [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPLv3), re-resolved
  for 6.104.3.

Original patch code is © the upstream authors and contributors — ImNoammm, hoo-dles,
rushiranpise, Entree3k, PrathxmOp and their contributors. New code in this repository is
© hyzor.

Not affiliated with Urbandroid, The New York Times, Duolingo, Chess.com, the Morphe
project, or the above authors.

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
