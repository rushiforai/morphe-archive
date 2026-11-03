# Download identity correction — 0.7.0-beta.5

The new phone log disproves beta.4's assumption that client-generated download actions supply `endpoint.tag`. Every failed click has `tag=none`: the main/header sender is a Litho ComponentHost and the popup sender is a native view. A preceding menu-open command carries a valid selected recording, but beta.4 consumes the empty download action before its older flyout cache can be used. This is an implementation defect, not a user setting error.

## Implementation

Downloads now installs two native presenter owner contracts, independently of personal Lyrics and the optional Download playlist patch. Each exposes its own element container. The action-bar presenter exposes the native recording field initialized to an empty string and updated by its metadata callback. The header presenter captures its bound model at the existing native element factory. Root matching uses the clicked view's actual ancestor chain; it does not read page text, reflect over objects, use guessed resource names, or substitute the global playing song.

Header lookup is bounded and requires one unambiguous playlist identity. URL-escaped Base64 entity keys are decoded. Playlist entity kinds24/25 are distinguished from button-state entity kind318, whose key may contain a playlist-like prefix. Unknown/rebound models clear the previous target. The retained actual playlist header is tested at the same element boundary used by the hook; full page responses are not passed to the header scanner.

The native command dispatcher captures an immutable identity before it can schedule a worker. A copied map carries the result, including unresolved results, so delayed processing cannot use a newly rebound song/page. Native Default mode is preserved. Existing In-app/External settings are read at routing time; the existing prompt and selected external application's review flow remain in use.

Menu-open identity has a separate session. It must originate in the activity window; the subsequent popup is bound to a different window root. Unknown/new menus, actions from different main-window controls and popup detachment invalidate it. The initial unbound session has a30-second grace period; a bound popup may remain open longer. Internal follow-up commands retaining the original opener do not expire its session. An already captured click retains its target after dismissal. Verified header/player ownership wins when opening its menu. A row menu retains its explicit recording even when its parent playlist is present. Ambiguous menu recording IDs are rejected; no global Now Playing substitution is used.

Selected In-app/External mode continues to consume unresolved download actions with an explicit message rather than opening Premium. Normal debug logging records presenter-match, menu-capture and bounded sender ancestry diagnostics without view text or credentials. No timed logger is added. Existing files, settings, credentials, folder grants, lyric storage and downloaded audio are preserved.

## Exact inputs and limits

Original Music9.42.52 /94252240 arm64-v8a SHA256 `9c38d63907362715f6172545bcb36f11ddbd45f014938626068016f06dcc3c56`; original9.43.51 /94351240 arm64-v8a SHA256 `da28424a01714090f392f963c2d822dff10eed9dc397b443e3e34e3691cf4dd9`. Scoped fingerprints and explicit contract failures select the presenters/dispatcher; obfuscated class names are not hardcoded in production.

Full Collection only. Shaders and Download playlist remain optional. In-app playlist batches require Downloads and Download playlist. An External playlist handoff does not require personal Lyrics or the optional batching patch. Jam remains9.42.52-only. Default retains native account/eligibility behavior; this change does not enable subscription downloads or bypass paid-content access.

## Verification boundaries

The exact published beta.4 router reproduces both absent-tag failures, including a popup opened with a known recording. Current actual-source fixtures exercise no-tag presenter clicks, immutable input maps, worker dispatch after rebinding, unresolved snapshots, hidden/detached owners, ambiguous owners, actual native header entity decoding, popup dismissal, expired/unrecognized sessions, main-click invalidation and playlist routing. Android/native owner getter and downloader/app-launch seams are simulated. The concrete injected owner getters, factory hook, constructor registrations and dispatcher capture are separately checked in patched target DEX.

Final build, exact bundle/APK hashes, selection matrix, access/reference audits, tests/lint, payload isolation and evidence provenance are recorded in the delivery's verification.json. Earlier candidate directories are retained as intermediate evidence. No phone, MuMu, signing, installation, real media downloads or cleanup is performed. Actual phone click ownership and prompt/handoff behavior remain acceptance requirements. Existing native-media/SponsorBlock sidecar limitations remain; this update makes no shader, navigation or stutter acceptance claim.
