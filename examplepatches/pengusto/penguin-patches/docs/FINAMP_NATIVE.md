# Finamp 1.0.1: selectable Penguin patches

These patches apply directly to the **original official Finamp APK** through
Morphe. They are separate from the earlier rebuilt `Finamp Debug` preview and
from the upstream source PRs.

## Supported input and output

| Property | Verified profile |
| --- | --- |
| Input | [Finamp-1.0.1-universal.apk](https://github.com/finamp-app/finamp/releases/download/1.0.1/Finamp-1.0.1-universal.apk) |
| Package/version | `com.unicornsonlsd.finamp` / `1.0.1` |
| Original APK SHA-256 | `0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581` |
| Official signer SHA-256 | `2061c5c9289c00020881b7e5334d93a02dfa4be980af20c05db4e529c8da5b54` |
| Output architecture | **ARM64 (`arm64-v8a`) only**; other native ABIs are removed |
| Runtime test environment | Disposable Android 15 / API 35 ARM64 emulator, synthetic Jellyfin library |

Other versions, F-Droid/recompiled binaries and earlier `Finamp Debug` APKs do
not have declared compatibility. Repatch the original APK with all desired
selections together; an already patched snapshot is deliberately rejected.

## Seven independent selections

| Patch name in Morphe | Behavior | Upstream contribution |
| --- | --- | --- |
| **Fix section title validation** | Typing or clearing a custom section title refreshes validation and Save; cursor/IME state is retained | [PR #1830](https://github.com/finamp-app/finamp/pull/1830) **merged into `redesign` on 2026-10-29**; [issue #1798](https://github.com/finamp-app/finamp/issues/1798) |
| **Song artist order** | Adds **Layout & Theme → Song artist order** with album artists first, metadata order, first credit first and alphabetical modes | [PR #1831](https://github.com/finamp-app/finamp/pull/1831), [issue #1833](https://github.com/finamp-app/finamp/issues/1833) |
| **Load artist pages faster** | Uses bounded preview/count requests, stable loading/error counts and accurate guest-track download warnings; full enumeration stays on demand | [PR #1832](https://github.com/finamp-app/finamp/pull/1832), [issue #1732](https://github.com/finamp-app/finamp/issues/1732) |
| **Fix offline artist tracks** | Excludes unrelated tracks from downloaded shared albums when browsing a performing artist | [PR #1834](https://github.com/finamp-app/finamp/pull/1834), [issue #1689](https://github.com/finamp-app/finamp/issues/1689) |
| **Fix track alphabet navigation** | Uses consistent case when comparing Tracks titles with a selected alphabet letter; preserves existing paging | [PR #1835](https://github.com/finamp-app/finamp/pull/1835), [issue #1790](https://github.com/finamp-app/finamp/issues/1790) |
| **Keep player output controls accessible** | Adds Output, Queue and Lyrics at the bottom of the player menu when bottom actions are hidden; respects the gesture setting and avoids duplicate actions | [PR #1836](https://github.com/finamp-app/finamp/pull/1836), [issue #1355](https://github.com/finamp-app/finamp/issues/1355) |
| **Fix quick settings banner contrast** | Uses the matching foreground color for banner text with custom accents | Existing [`hotfix-1.0.2` fix](https://github.com/finamp-app/finamp/commit/124edc8b94ea8fcba637a1dba31e7bd266644aa8); duplicate [PR #1837](https://github.com/finamp-app/finamp/pull/1837) **closed on 2026-10-29**; [issue #1756](https://github.com/finamp-app/finamp/issues/1756) |

All seven are optional (`default=false`). Choose any subset of the seven in
one Morphe run. The artist-order default promotes only album artists also
credited on the song, then alphabetizes remaining credits. With no matching
album artist, it retains song metadata order. It does not rewrite music tags or
server metadata, or create a per-song lead role that Jellyfin does not provide.

**Upstream status checked 2026-10-29:** the title fix is merged and the banner
fix exists on the hotfix branch, while the latest official release remains
[1.0.1](https://github.com/finamp-app/finamp/releases/tag/1.0.1). **Both backports
and all seven selections remain available for the original 1.0.1 APK.** A source
merge or unreleased hotfix does not update that APK or extend compatibility to
future versions. [Exact upstream refs and release status](FINAMP.md#upstream-status-2026-10-29).

The title patch retains the existing validity rule: an empty title is invalid;
it does not introduce whitespace trimming or change which section types require
a title. The performance patch does not cap the eventual playback queue.

The player patch follows the reviewed upstream source at
[`0092a059`](https://github.com/pengusto/finamp/commit/0092a0593a9d69dfc461834d0e4e6c580d112379).
Both the menu button and the artwork context menu follow the actual layout:
the three replacement actions appear only when the bottom actions are hidden,
including when space is too limited to show them. Disabled gestures stay disabled
on Player and Lyrics. The Lyrics screen's menu retains Output and Queue without
adding another Lyrics route. The existing selectable patch name and bit remain
unchanged; no setting or stored data format is added.

[Released1.6.1 Manager and APK acceptance](../tests/finamp/evidence/2026-10-30-player/released-1.6.1/README.md)
records the normal source download and retained settings/downloads.

Refresh the Penguin source in Morphe, select the supported original APK and the
desired patches, then build and sign using your normal Morphe key. Keep that key
for later updates. This uses the original package name; switching from the
official signing certificate may require your existing backup/migration process.
Same-key update/removal tests are distinct from changing signing certificates.

## Native implementation and source

Flutter compiles this Dart logic into `libapp.so`. A shared raw-resource patch
collects seven selection bits (1 title, 2 artists, 4 loading, 8 offline artist
filtering, 16 Tracks alphabet, 32 player output, 64 banner contrast) and applies
one precomposed delta for masks 1–127. The original APK's native and engine hashes are
checked before the snapshot is replaced; the selected output is checked against
its own SHA-256 and size. Unsupported input fails before an APK is published.

The original release source is
[`65c1a78`](https://github.com/finamp-app/finamp/tree/65c1a78b1d04dd8525825ecdf2cf39c7442b51e9).
The fixes are backported to that release rather than replacing it with current
`redesign` or a debug app. Each complete selection tree is published in the
[source matrix](../tests/finamp/native-sources.json), including
[all seven fixes](https://github.com/pengusto/finamp/tree/9da1d0158adf7393c8447eda0a26490e2320833a).

Build toolchain: Flutter **3.47.2**, Dart **3.13.2**, framework
`d3b14c876900e553bc736ca19295fc09e3853e8e`, engine
`a804b261645ef8c13eb3d5c44a5c2fb0340c5539`. Normal Android stripping of that
SDK's ARM64 engine produces the exact original APK engine bytes. The app snapshot
version hash and feature flags also match. SDK-required dependency locks are
recorded in every source tree; other app features are not pulled from later
`redesign` commits.

Real Morphe runs for all 127 combinations verify that every retained APK entry
except ARM64 `libapp.so` matches the original: DEX, manifest, engine, resources
and Flutter assets remain byte-identical. Other CPU architectures are removed
so they cannot silently run an unpatched snapshot. Snapshot files remain exactly
22,283,144 bytes for this profile; runtime RAM changes have not been measured.

## Preference compatibility

The native backport keeps artist-mode persistence in a separate Hive box using
primitive integers. The original main settings adapter remains unchanged. Builds
without the artist patch ignore the auxiliary box, and reapplying the feature
can restore its saved mode. Layout reset resets that mode too.

This differs from the earlier source/debug preview's field-161/adapter-128
implementation, which lives in a different package. Native compatibility tests
read saved settings with the frozen original adapter **without adapter 128**.

## Current verification

### Reviewed Artist counts

The Artist backport follows final PR1832 commit
`3f463b0e697f11aeebc37e1a6b614cde391b7f7f`. One bounded `ArtistIds` query
counts the union of album and track credits without adding overlapping totals.
The music row displays the localized loading/error state instead of a false
zero. Download status counts direct album and track links, while the size
warning separately resolves the real union track count, including guest-only
artists. A count error prevents Add rather than starting an unconfirmed download.

The historical source pins for all 64 combinations containing bit 4 remain in
the matrix, but their branches and local backup were intentionally removed
(see [source availability and rebuild limits](../tests/finamp/README.md#rebuild-native-payloads)); their published deltas are
verified; the other 63 nonempty selections retain the published Player base.
The [Artist acceptance](../tests/finamp/evidence/2026-10-30-artist-review/README.md)
separates source runs (22 / 26 / 49 / 107 passing, with overlap), all 127 actual Desktop
selections, all 127 native replays, four rejected inputs and seven actual
Manager JVM/ART exports of the complete private candidate. Its same-key
update/removal/reapply chain preserves login, Dark theme, the download warning
threshold, 22 downloaded media files and the primitive Metadata-order setting.
Raw matched installed-APK PNG/XML and source/output hashes accompany the reports.

The [repeatable workflow](../tests/finamp/README-artist-review.md) also records
Loading/Error, offline-artist and Artist/Player integration probes. The release
API isolate serializes requests: a held count can delay its second preview
query. These fixtures do not measure live-server latency or runtime RAM.

### Player and earlier verification

The player-output and banner-contrast fixes extend the matrix to 127 native
selections. See [the UI-fix acceptance workflow](../tests/finamp/README-ui-fixes.md)
and [reviewed player acceptance](../tests/finamp/evidence/2026-10-30-player/README.md)
for the passing source regressions, matched original-APK comparisons, all 127
Desktop selections and actual Manager JVM/ART exports.
The [1.2.0 acceptance](../tests/finamp/README-next-fixes.md) records the earlier
31-selection release.

The reviewed player source passes27 focused regressions; the previous player
source passes5 and fails22 of the same cases. All64 affected compositions pass
their complete suites (4,096 overlapping executions;101 in mask127), followed
by native compilation. The other63 payloads remain byte-identical. The patcher
marks its extracted temporary libapp.so with a distinct NIO file time so same-size
writes remain detectable on Android ART. The real Patcher2.0.1 metadata regression
runs in CI, alongside actual exported-native hash checks in Android acceptance.
The earlier [banner comparison and seven-fix admission](../tests/finamp/evidence/2026-10-29-ui/README.md)
remain historical evidence for the unchanged native features.


## Historical 1.1.0 verification

- **224 source tests** across the seven selected source trees: 4 / 36 / 40 / 16 /
  20 / 52 / 56. These are separate runs with overlapping tests, not 224 unique
  cases. The full three-fix tree passes 56 tests.
- All **seven** payloads replay to their pinned output hashes, compile into the
  MPP, and apply through real Morphe Desktop 1.18.1 / Patcher 1.15.1 and Desktop 1.19.1 / Patcher 2.0.1. All seven
  resulting APKs pass retained-entry and ARM64-only checks.
- Four altered-input cases (app snapshot, engine, missing ARM64, forced wrong
  version) fail closed with no output APK. The selected finalizers' version check also
  applies when the CLI's compatibility filter is forced.
- PFD1 codec probes cover corruption, bounds, truncation, hash failures and
  producer/decoder interoperability. Python probes and JVM probes are separate.
- APKs are aligned for 16 KiB native loading and signed with one disposable test
  certificate for update acceptance.

The [recorded Android acceptance](../tests/finamp/evidence/2026-10-28/verification.json)
passes the same-key **0 → 7 → 1 → 7 → 0 → 7** update chain. Synthetic login and
Dark theme remain available in every stage. Metadata-order selection survives
cold restart, feature removal and reapplication. The all-fix APK verifies live
title validation before hiding the keyboard, album-first credits, the visible
setting and bounded artist requests while unbounded requests are held. See
[actual APK captures](../tests/finamp/evidence/2026-10-28/README.md).

The current [Manager 2.2.0 loader](https://github.com/MorpheApp/morphe-manager/blob/v2.2.0/app/src/main/java/app/morphe/manager/patcher/patch/PatchBundle.kt)
uses Patcher 2.0.1: ART retains the MPP through DexClassLoader; the embedded JVM
uses URLClassLoader over the MPP. Both support the bundle-anchored resources.
Manager filters unselected dependency results, so the composition runs once
through the **selected patches' finalizers**, with failures propagated to every
selection. The hidden dependency only initializes invocation state. Source
inspection is now complemented by the actual Android Manager run below.

The synthetic HTTP fixture is local and serves generated WAV audio, not personal
music or accounts. Neither its response timing nor widget captures are a
live-server performance or RAM benchmark. Physical/OEM devices and other Android
versions remain outside this profile.

## Historical 1.1.0 Android Manager acceptance

[Manager 2.2.0 acceptance](../tests/finamp/evidence/2026-10-28-manager/README.md)
passes on the Android 15/API 35 ARM64 emulator. The remote source downloads the
exact released Penguin 1.1.0 bundle. All three rows are off by default and can
be selected independently. Title-only, artists-only, loading-only and all-three
runs succeed with the default embedded JVM; all-three also succeeds in Android
ART. All five exported APKs match their native output hashes, retained APK
entries, expected signer, uncompressed native entries and 16 KiB ZIP alignment.

Manager's combined export installs through the Android update UI and starts
with the existing synthetic login, Dark theme and Metadata order. A controlled
corrupted-input test visibly fails through a selected patch; after restoring
the original test input, ART succeeds again. No production patch change was
needed. [Workflow and verification tools](../tests/finamp/README-manager.md).
This establishes Android Manager execution on the emulator, not physical phones
or other Android/Manager releases; pairwise masks remain Desktop-tested.

## Rebuild and licenses

See [tests/finamp/README.md](../tests/finamp/README.md) for pinned source rebuild,
PFD1 verification, real patcher combinations, rejection checks and Android
acceptance. Source, the MPL-2.0 license, Flutter's BSD license and original
third-party notices accompany the native resources. Kotlin patch logic remains
under Penguin's GPL-3.0 license. This is an independent Penguin contribution;
it is not an upstream-signed Finamp release.
