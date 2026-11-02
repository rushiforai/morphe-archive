# Download routing and settings - 0.7.0-beta.3

The phone report showed native Premium sheets even in External mode, invisible quality labels, no visible storage bar, zero free space and a broken separator. This update addresses those specific paths; native account/eligibility handling remains unchanged in Default mode.

## Native command identity and dispatch

The retained original player and playlist responses use `ypcGetOfflineUpsellEndpoint` (extension133724106), with the identity inside URL-encoded Base64 parameters. A generic eleven-byte ID scan cannot recover that identity. The old fallback also depended on a cached localized label and an exact player-view ancestor. It could therefore fall through to the native promotion.

Both original APKs expose the same single-string endpoint schema. Patch application verifies that exact extension/schema; no obfuscated class name is hardcoded. The runtime parser accepts only this command and the verified169495254 wrapper, bounded in size/depth. It validates context9/request1/identity10, distinguishes recording from playlist and rejects duplicate/conflicting/malformed identities. It never substitutes Now Playing. Only a UI sender can trigger the new route.

External mode sends the exact song URL or one canonical playlist URL through the existing selected-app review flow. In-app mode opens the existing Opus prompt or playlist batch prompt. Whole-playlist in-app downloading requires Download playlist; an absent feature produces an actionable selection message. Default remains native. Duplicate callbacks are consumed once. The native mapping may run on an executor, so the typed route consumes the command before the legacy main-thread assertion and dispatches UI work to the main thread. Normal Enable debug logging records the route without a new timer/banner.

## Settings

Personal native choice dialogs now bind their actual option labels to the host foreground, not just their preference-row summaries. Selection still uses the existing change listener and values; no competing downloader selector is introduced.

Downloads storage inventories actual audio, cover files, native/playlist metadata, chapters, preferences and partial downloads. Free space comes from StatFs on an existing volume path, even before the first download creates its child folder. A read failure is reported as unavailable instead of pretending the device has zero capacity. External YTDLnis files remain read-only and excluded from owned bytes.

The card uses colored segments, actual usage/free values, category/file-count legends and anchored callouts. Legends provide touch/accessibility access to tiny/empty segments, following the Shaders storage presentation. UTF-8 separators are preserved; segment minimum visibility is used for small categories.

## Verification and limits

Actual-source fixtures use retained native command bytes and test configured routing, mismatched/malformed identities, Default preservation, External/In-app behavior, duplicate callbacks, worker dispatch, missing playlist selection and real temporary-file storage inventory. Android views, downloader/app launch and platform storage/codec boundaries are simulated; no real media downloads are started. Existing playlist regressions rerun because PlaylistRuntime changed. Other fixtures and browser/provider evidence are inherited only after exact source hashes match; the NOTICE version-only change is separately reviewed.

The focused matrix covers both exact original arm64 targets9.42.52/94252240 and9.43.51/94351240: Full with both optional features, defaults, and features without personal lyrics; missing-Downloads guards and catalog/Jam guards also run. Generated calls, runtime references, native media contracts, Lyrics entry paths, typed routing order, dialog label color and storage API use are audited. Previous broader selection evidence belongs to the previous bundle, not this one.

Real Samsung appearance, actual button-to-app handoff, native decoding/queue/SAF, shader/video behavior and recording-free lyric smoothness still need phone acceptance. No zero-stutter claim, device/MuMu/sign/install/uninstall or cleanup. Source/MPP/metadata/checksum publication is complete only when its matching Toolkit receipt exists. Existing preferences, lyrics, offsets, credentials, downloaded files, folder grants and history are preserved. Shared Toolkit runs in place, with no global tools copied.
