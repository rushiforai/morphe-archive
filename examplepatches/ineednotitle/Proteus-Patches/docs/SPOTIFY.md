# Spotify — patch status and analysis

Spotify (`com.spotify.music`) is the default patch target of this suite. The
patches target the **9.1.94.1929** build and find their hook points by
fingerprints (class shapes, string sets and call sites), so nearby builds may
still patch; a missing anchor fails loudly at patch time instead of guessing.

## Distribution facts

| Field | Value |
|---|---|
| Package | `com.spotify.music` |
| Target version | **9.1.94.1929** |
| Form | Single APK or split bundles (APKM/XAPK) — the patches work on the dex and manifest either way |
| Min SDK | The patched app keeps Spotify's own minimum |

## What the bundle ships for Spotify

Thirteen app-scoped patches. The eight routine ones are on by default; the five
expert patches are off by default and marked below. The app-agnostic universal
patches (permission removal, analytics blocking, external browser, ...) apply
to Spotify as well.

| Patch | Default | What it does |
|---|---|---|
| Block popup ads | on | Blocks fullscreen promotions ("Pendragon" messages) shown when opening the app |
| Fix third party launchers widgets | on | Allows the Spotify widgets to be added to third party launchers |
| Hide Premium tab | on | Removes the "Premium" tab from the bottom navigation bar |
| Hide ad sections | on | Removes brand ad sections from the home and search page |
| Hide playlist ads | on | Removes ads embedded into playlists |
| Hide video ads | on | Disables the video ad plugin of the now playing view |
| Mute audio ads | on | Mutes the music stream during audio ads and restores the volume afterwards |
| Sanitize sharing links | on | Removes the tracking parameters (`si`, `utm_source`) from shared and copied links |
| Change package name | **expert** | Installs the patched app beside the original Spotify app |
| Diagnose Spotify client | **expert** | Logs signing-certificate queries and integrity-request outcomes (read-only) |
| Disable ad breaks | **expert** | Disables the ad slots that play ads between songs (experimental) |
| Hide ad views | **expert** | Hides ad banners, labels, overlay controls, the ad player and the now-playing ad layouts |
| Hide context menu upsells | **expert** | Removes "Premium" entries from the context menus of songs, albums and playlists |

## How the hooks work (and where they stop)

- **Block popup ads** — the Pendragon fetch-message requests are RxJava chains
  ending in `onErrorReturn(fallback)`. The returned request is replaced with a
  `Single` that emits the fallback directly; chains without a fallback are left
  unchanged.
- **Hide ad sections** — the `sections_` getters of the home
  (`homeapi/proto/HomeStructure` and `casita/v1/resolved/HomeStructure`) and
  browse (`browsita/v1/resolved/BrowseStructure`) protobuf structures are
  filtered before the UI reads them. Only sections positively identified as
  brand ads (protobuf oneof cases / ad metadata) are removed.
- **Hide playlist ads / Hide video ads** — the embedded-ad playlist properties
  are pinned to the `NONE` placement, and the `EmbeddedAdNpvPlugin` now-playing
  plugin entry is registered disabled. Other plugins keep their flags.
- **Mute audio ads** — every `MediaSession.setMetadata` call is routed through
  the extension, which mutes `STREAM_MUSIC` while the metadata looks like an
  ad (ad-id markers, localized "Advertisement" titles, short "Spotify" items)
  and restores the previous volume on the next real track. A stream the user
  already muted is never unmuted by the patch. Enabling **Device broadcast
  status** in the Spotify settings adds a broadcast-based fallback that
  improves the ad detection.
- **Sanitize sharing links** — the clipboard text of "Copy link" and the url
  parameter of the share sheet formatter are stripped of `si` and `utm_source`
  (case-insensitive). Other parameters, their order, and `#` fragments are
  kept; untouched URLs keep their exact original string.
- **Hide Premium tab** — the five-tab navigation constructor rewrites its tab
  parameters through the extension, which drops the `PREMIUM` tab and clears
  the tab-count flags. This hides the upsell tab only; it changes no
  subscription state.
- **Fix third party launchers widgets** — the `BIND_APPWIDGET` permission
  check returns true so any launcher can bind the widgets. If the check is not
  found in a future build, this optional fix is skipped with a warning and the
  rest of the patches still apply.
- **Hide ad views** (expert) — known ad view classes are hidden at
  construction and measure zero; ad layouts inflated by obfuscated callers are
  intercepted at the `LayoutInflater` call sites found via their resource ids.
  Layout surgery is aggressive by nature, which is why the patch is off by
  default.
- **Hide context menu upsells** (expert) — items are filtered at the context
  menu view-model constructor. Items whose signalling tag is the always-shown
  "Premium" tag (newer builds) or whose view model flags them as upsells
  (older builds) are dropped; anything unclassifiable is kept.
- **Disable ad breaks** (expert, experimental) — the app enables ad slots via
  `spotify.ads.esperanto.proto.Settings/updateSlotEnabled`; the hook sends the
  same call to disable the `stream` and `preroll` slots every two minutes,
  because the app or the server can re-enable them. Whether the server honors
  the call is outside the patcher's control.
- **Change package name** (expert) — rewrites the manifest package, custom
  permissions, provider authorities (including `@string/` authority resources)
  and the launcher label in `finalize{}`, after all other patches. The clone is
  re-signed: Play Billing, Cast and Google sign-in are signature-bound and may
  reject it. Use the clone for side-by-side installs and testing.
- **Diagnose Spotify client** (expert) — read-only. See below.

## Diagnose Spotify client — what is logged, what never is

The diagnostic observes and logs under the logcat tag **`ProteusSpotifyDiag`**
(`adb logcat -s ProteusSpotifyDiag`):

- the app's own signing certificates (SHA-256) at startup and on the
  `getPackageInfo` queries the app itself performs about **its own package**;
- the entry and outcome of the client-integrity verification (result presence,
  failure class, HTTP code);
- client-token acquisition outcomes (acquired / failure code);
- native HTTP responses by allowlisted host and service category;
- home-load failures (cause chain and code identifiers).

It **never** logs authentication tokens, account data, request bodies, raw
URLs, or exception messages — and it never changes a verdict, a response, or a
coroutine. It is a diagnostic for reading logs in bug reports, not a playback
or integrity fix. The signature anchors of this patch are the most
build-specific of the suite; expect to re-pin them on major Spotify updates.

## Verification status

- **Patch-time**: anchors are pinned to shapes of the 9.1.94.1929 build;
  every patch fails loudly (PatchException) when its required anchor is
  missing, and optional fixes degrade to stock behavior with a warning.
- **Unit tests**: URL sanitization, context-menu filtering, inflated-layout
  resolution, ad detection heuristics and the diagnostic redaction rules are
  covered by JVM tests (`:extensions:extension:testDebugUnitTest`), and the
  hook plumbing by `:patches:testSpotifyHooks`.
- **On-device**: playback behavior is not exercised by this repository's CI.
  Report findings with the patch names, the app version and logs.

## Device checklist

1. Patch the 9.1.94.1929 build and install; all selected patches should apply
   without a `PatchException`.
2. Home and search show no brand ad sections; playlists show no embedded ads;
   the now-playing view shows no video ad plugin.
3. With **Device broadcast status** enabled in Spotify settings, audio ads mute
   the music stream and the volume returns on the next track.
4. "Copy link" and the share sheet produce links without `si`/`utm_source`.
5. Widgets can be added from a third-party launcher.
6. For the diagnostic patch, `adb logcat -s ProteusSpotifyDiag` shows
   certificate and integrity lines and no token/account data.
