# Local labels checkpoint

Verified on 2026-10-05 for Maps 26.36.04.973607363.

- APK SHA-256: 808c2c10e60339d8f421818909cdeaf92ad5c6f2b74a8c28a9d76672c5c5bb06.
- Same signing certificate as the previous working installation.
- Original resources, manifest, native libraries and unaffected DEX entries preserved byte-for-byte.
- Original-class changes limited to SavedPlaces.Front lifecycle, YouActivity.labelDialog, atqq label action and areb label action.
- Added extension DEX excludes compile-time stubs and tests.
- Twelve route-ownership checks, marker geometry checks including 10,000-place membership, and label ranking/normalization checks passed.

Emulator API 36 checks used public fixture locations. Existing Local saved labels appeared above native search results; exact and prefix queries, case-insensitive matching, selection, rename, removal and no-match layout restoration worked. Direct and overflow native label actions opened the local editor without sign-in. A conflicting label was rejected. A saved place retained its original name and star marker; a place with only a label acquired a marker and caption. Captions were visually inspected on the dark map. Existing labels survived an in-place APK update. Landscape search worked after dismissing the keyboard; the header hides when the keyboard leaves insufficient room. Home and Work opened route previews, and Back from Work returned to an empty search field.

The final APK was installed on the emulator and checked again through local search, native editing and Work/Back. It was then installed as an in-place update on Pixel 10. The on-device APK hash matched; the app process ran, with no extension warnings or AndroidRuntime errors in the new process's logs. No phone app-data reset was performed.

Full feature interaction on the Pixel remains for user confirmation. Active turn-by-turn navigation was not re-tested in this checkpoint. HomeWorkShortcuts.java remains unchanged. Caption collision with Google's own map text remains a known limitation. The normal native autocomplete service still receives search queries.

Before publication, the existing Git history and current source tree were checked for signing material, the local signing password, common token patterns, device serial and private LAN addresses; no matches were found. APKs, keys and device data remain outside the repository.
