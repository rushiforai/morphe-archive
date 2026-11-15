# NYT Games

Package `com.nytimes.crossword`, supported target `6.50.0` (versionCode `6428354`, APKM).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/nytgames/`](../../patches/src/main/kotlin/dev/hyzor/patches/nytgames/).

| Patch | Default | What it does |
|---|---|---|
| Unlock Subscription | on | Reports the account as an active Games subscriber (client-side only). |
| AMOLED Black | on | Native UI only: paints the app's own dark theme pure black (`#000000`). The games are WebViews and stay dark grey. |

This is a port of [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches)'
6.33.0 patch. The newer build flattened the delegate chain that patch's fingerprint was
written against, so the hook had to be re-resolved; `Fingerprints.kt` documents how the
method was identified.

## Port notes

6.50.0 keeps the hook: `SubauthEntitlementClientImpl.P()` still returns `NYTUserState.f`
with the same single `iget-boolean`, and the class kept its name because it is the app's own
subauth bridge (`com.nytimes.games.integrations.subauth.library`), not obfuscated code. What
moved are the neighbouring one-letter getters:

| Role | 6.48.0 | 6.50.0 |
|---|---|---|
| `isSubscribedForGames` | `P()` | `P()` |
| `isSubscribedAndLinked` | `E()` | `D()` |
| `isSubscribedViaGooglePlay` | `K()` | `J()` |
| `hasUnlinkedSubscription` | `R()` | `R()` |

The class also has a `k()` helper that unions the raw entitlement values into a non-empty
check; nothing in the patch uses it.

The `AMOLED Black` hook is unchanged too: `ExtendedColorsKt.<clinit>` still builds the same
palettes from `const-wide` literals, and the two dark greys (`#121212`, `#2A2A2A`) are the
only values in `ExtendedColorsKt` that the patch rewrites. The `res/values-night/colors.xml`
names and their values are identical in 6.50.0.

## How the app decides you are a subscriber

The games code does not verify a receipt. The subauth library keeps a local user state
(`NYTUserState`) with three booleans — signed in, has an active entitlement, has a linked
entitlement — and `SubauthEntitlementClientImpl` exposes them:

| Method | Name (from the in-app developer settings) | Reads |
|---|---|---|
| `P()` | `isSubscribedForGames` | the active-entitlement bit |
| `D()` | `isSubscribedAndLinked` | `SubscriptionLevel` is *registered + subscribed + linked* |
| `J()` | `isSubscribedViaGooglePlay` | Play entitlements contain `Games` |
| `R()` | `hasUnlinkedSubscription` | `SubscriptionLevel` is an unlinked subscriber |

`P()` is the one the rest of the app treats as "subscribed":

- `AppEntitlementsImpl.e()` → `SubauthRxJavaClientImpl.i()` →
  `GamesSubauth2PurchaseClientImpl.d()` → `P()` → `UserEntitlements.statusFlow` →
  `EntitlementStatus`, which `GameAvailabilityCalculator`, the archive screens and the
  bonus-puzzle paywall read;
- `GamesHybridUserConfig.isSubscribed`, handed to the WebView games;
- ads, analytics and reporting targeting (`AppTargetingImpl`, `EventTrackerUserGeneratorImpl`,
  the Statsig Duolingo-acquisition flag, `BugReportingRepositoryImpl`).

That chain is unchanged in 6.50.0: `AppEntitlementsImpl.e()` still has 29 call sites, and the
subauth interface's `P()` is called from 12 places.

The patch forces only `P()` to `true`. The signed-in and linked bits are left alone on
purpose: forcing them changes `NYTUserImpl.d()` to *registered + subscribed + linked*, and
the app then tries to load a profile for a session that does not exist — that is the
"Oops, something went wrong" Me-page bug noted in the reference patch.

## On-device verification

6.50.0 was verified on an Android 16 (API 36) x86_64 emulator, running the arm64-v8a APKM
through the NDK ARM translation, with a signed-in **free** NYT account. The bundle was applied
to the stock APKM with Morphe CLI `--validate` (2 of 40,980 classes changed, both fingerprints
matched exactly once) and installed as a single re-signed APK; the stock screens were captured
first with the same account.

| Surface | Stock 6.50.0 | Patched 6.50.0 |
|---|---|---|
| Me → Settings | `NOT SUBSCRIBED`, **Subscribe** row | `NYT GAMES SUBSCRIBER`, no Subscribe row |
| Play home | “Limited Time Offer / Subscribe now” banner, lock badge on the Wordle tile | no banner, no lock badge |
| Wordle archive | “Unlock the archive to play over 1,000 puzzles” + Subscribe | calendar for November 2026 opens |
| Bonus puzzles | (not captured on stock) | `November Week 2` opens; *Wordle in 1* shows its **Play** button |
| Me page (signed in) | stats and badges | same stats, no “Oops, something went wrong” |

The same subscription surfaces flip with no account signed in: a fresh anonymous install
already reports `NYT GAMES SUBSCRIBER` in Settings and opens the archive calendar.

The Spelling Bee `Geniuses` stat keeps its lock badge on both builds. It is not one of the
`P()`-driven surfaces, and the 6.48.0 port behaved the same way.

AMOLED Black, dark theme (`Settings → Dark Mode → Dark`), sampled from screenshots:

| Screen | Stock | Patched |
|---|---|---|
| Settings, Me, Play home, bonus-puzzle sheet page background | `#2A2A2A` | `#000000` |
| Wordle in the WebView | the web app's own theme | unchanged (light here) |

Not exercised: the Google Play purchase/restore flow (the emulator image has no Play Store),
one-time Game Packs and pushes. The WebView games' own dark theme was not reached either —
the web app loaded in its light theme and this patch cannot reach it.

The 6.48.0 port had been verified end-to-end on a Pixel 9 (Android 17); the hook and the
resource edits are unchanged, and this build reproduces those results.

## Limitations

Only the client-side decision is changed. Anything the NYT backend decides for itself
(account/subscription pages, purchase and restore, pushes) still sees the real account
state, and an anonymous user stays anonymous — the patch reports *subscribed*, not
*signed in*. Game **Packs** are one-time purchases rather than a subscription and are not
covered by this patch.

## AMOLED Black (native UI only)

The games inside this app — Wordle, Connections, Strands, Spelling Bee, Sudoku, ... — are
**WebViews** (`GamesHybridHostActivity`). Their screens are a website rendered by the app, and
they keep the website's own dark theme (`#121213`), which this patch does not touch. Everything
the patch does cover is the app's **native** UI: home, Me, settings, archive sheets, tab bar,
dialogs, puzzle toolbars and the system bars.

The app's dark theme is dark grey, not black: pages and sheets are `#2A2A2A`, with `#121212`
on some of the darker cards. On an OLED panel those pixels still light up. The patch paints
them `#000000`, in both places the app gets its theme from:

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
