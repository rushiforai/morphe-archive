# Feeder: zoom article images

**Zoom article images** is a Morphe-compatible patch for the exact official project-release F-Droid-flavor Feeder **2.25.0** APK. Use the [generated catalogue](../README.md#generated-patch-catalogue) and [releases](https://github.com/pengusto/penguin-patches/releases) for the current published bundle.

## Current upstream assessment

Checked on 2026-10-24: [#391](https://github.com/spacecowboy/Feeder/issues/391)
is open with ten thumbs-up reactions. The maintainer proposed opening images
in a separate viewer, with an explicit choice for linked images, and reported
that an earlier inline-zoom experiment caused problems. Searches for zoom/image
PRs and the complete open PR list found no competing implementation.

The latest official project release is [2.25.0](https://github.com/spacecowboy/Feeder/releases/tag/2.25.0).
Master `8a12258fc5e8a898bb94be0d8d727051cc9f25e1` is three commits ahead;
its reader changes add article actions and read-aloud highlighting, not image
zoom. The patch deliberately targets the tested release, not master.

## Original APK provenance

| Property | Verified value |
| --- | --- |
| Publisher / source | spacecowboy/Feeder official GitHub release, F-Droid flavor |
| APK | [app-fdroid-release.apk](https://github.com/spacecowboy/Feeder/releases/download/2.25.0/app-fdroid-release.apk) |
| Package | `com.nononsenseapps.feeder` |
| Version / code | `2.25.0` / `4191` |
| Original SHA-256 | `3e03c3f9fd3ac6131eea56e513b129c71df11dadfccb836221480f9204f50766` |
| Official certificate SHA-256 | `c5eeff22488135ffc2583c3a43b053a161ca869862961ab8534f44c75fd57d97` |
| Source tag commit | `fdaf50e55b03c6086f3ec26b968ad32432b11f13` |
| License | GPL-3.0; see repository LICENSE and NOTICE |

This is the **project's GitHub APK**, not an independently built F-Droid.org
APK. The Play flavor, other store builds and other versions are untested and
excluded. Canonical class guards reject modified and already patched bytecode;
only debug items are normalized. No force-compatibility option is used.

## Behavior and implementation

- Tap an article-body image or the large reader header image to open a separate
  viewer. Feed-list thumbnails remain unchanged.
- Pinch to zoom, drag to pan, double-tap for 3×/reset. Accessible buttons provide
  zoom in, zoom out and reset; zoom stays between fit and 8× with bounded panning.
- Linked body images offer **View image / Open link**. The latter calls an
  unchanged copy of Feeder's original link callback, including fragment lookup.
  Text links, captions, selection and article scrolling retain their native paths.
- The viewer uses the existing application ImageLoader, image caches, interceptors,
  metered-network policy and 2500-pixel decode cap. It adds no network client or
  runtime library. Declared `srcset` resolutions take precedence over unknown-size
  fallbacks; proportional distance from 2500 pixels selects among declared sizes.
- Loading errors offer retry. Back, Close and Activity stop dismiss the viewer
  and cancel its native coroutine Job. Weak callbacks and generation checks reject
  results arriving after dismissal or a retry. Recreation returns to the reader;
  an open viewer and its temporary zoom position are not restored.
- English and German viewer strings are included; other locales use English.
  The native app's database, article blobs, subscriptions and preferences are not
  rewritten by the patch.

An isolated Java extension is rebound to the exact R8 ABI in this APK. The
compile-only continuation superclass is replaced with the shipped coroutine
superclass and constructor. It is not packaged. Native API references are checked
against the resulting APK and then exercised on Android; compile stubs alone do
not establish compatibility. Existing runtime extensions must remain byte-identical.

## Verification and limits

Repeatable acceptance, bundle isolation, metadata inventory and rejection tests
are in [tests/feeder](../tests/feeder/README.md). The prototype run passed **10 original-regression assertions and 284 patched assertions**, same-key update preservation, all four rejection cases and Android Lint (**no issues found**). The resulting APK has 22 extension classes; all 162 checked app/extension method and field references resolve. The current combined release contains 12 patches for nine apps; the existing Fossify runtime is isolated from Feeder. Release validation checks the exact generated metadata against the actual Morphe Desktop inventory.

The target is a disposable rooted AOSP Android 15 / API 35 ARM64 emulator,
with synthetic fixtures only. The unmodified original payload
is re-signed with an existing disposable local test key for the before/after
update test. That is not the publisher's signing identity. Package and test key
stay the same across the update; no uninstall or data clearing is performed.

Synthetic fixtures cover PNG, JPEG, static GIF and WebP, body/header/table images,
`srcset`, missing captions, broken images, actual multi-pointer gestures, links,
cache/network behavior, lifecycle and German controls at 150% font scale. The application's built-in Feeder News
subscription and downloaded articles are retained alongside the test feed.
Data-URI `srcset` resolution is not supported by the native HTML parser; the
`srcset` fixture therefore uses an owned local file URL. The patch does not
replace that parser.

Physical/OEM devices, other Android versions, TalkBack navigation, animated GIF,
SVG/AVIF, authenticated image servers and arbitrary remote feeds remain unproven.
A native source PR is a separate implementation and awaits maintainer greenlight.

## Separately authorized public evidence

On 2026-10-24, exactly one [issue comment](https://github.com/spacecowboy/Feeder/issues/391#issuecomment-6378583788)
was posted under explicit user authorization. It includes the matched original /
Morphe zoomed comparison, links to the initial viewer and linked-image menu,
the Penguin repository and provenance/results, and asks whether a focused native
Compose PR would be welcome. It explicitly identifies the local Morphe prototype
and its absence from the public release at the time of that comment; it does not claim a native fix.

Four raw screenshots and two curated evidence documents are pinned to evidence-only commit
[`ad8026a`](https://github.com/pengusto/penguin-patches/tree/ad8026ad5e4266cfcf848be980e296bc1be947a0/feeder-391/2026-10-24/).
The evidence comment originally described the unpublished prototype; publication
of the Morphe patch was subsequently authorized separately. It is not evidence
of a native source fix. Await maintainer greenlight before opening a native PR;
read the issue and own comment freshly before any later edit.

| Original APK payload | Morphe patch, zoomed |
| --- | --- |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/ad8026ad5e4266cfcf848be980e296bc1be947a0/feeder-391/2026-10-24/before.png" width="280" alt="Original article image at article width" /> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/ad8026ad5e4266cfcf848be980e296bc1be947a0/feeder-391/2026-10-24/zoomed.png" width="280" alt="Same diagram enlarged in the separate image viewer" /> |
