# NYT Games

Package `com.nytimes.crossword`, supported target `6.48.0` (APKM).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/nytgames/`](../../patches/src/main/kotlin/dev/hyzor/patches/nytgames/).

| Patch | Default | What it does |
|---|---|---|
| Unlock Subscription | on | Reports the account as an active Games subscriber (client-side only). |
| AMOLED Black | on | Native UI only: paints the app's own dark theme pure black (`#000000`). The games are WebViews and stay dark grey. |

This is a port of [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches)'
6.33.0 patch. The newer build flattened the delegate chain that patch's fingerprint was
written against, so the hook had to be re-resolved; `Fingerprints.kt` documents how the
method was identified.

## How the app decides you are a subscriber

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

## On-device verification

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
