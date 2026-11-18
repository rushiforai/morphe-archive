# X Patch

One Morphe patch source, six selectable enhancements for X. **Keep your existing source:** update it; no need to add a second source.

## Install or update
Source: https://github.com/rikunode/x-feed-cleanup-patches

Stable version: 1.12.2-x.3 · 6 patches · X **12.31.0-prod.01** / **12.32.0-prod.01**.

| Patch | Function |
|---|---|
| Fix external post links | Open linked posts without requiring Home / For You |
| Hide Find more | Hide Discover more recommendations |
| Hide Who to follow | Hide follow recommendations |
| Hide sports scores | Suppress sports ScoreCard tiles and live-game pills (experimental behavior) |
| Hide search relevance prompt | Hide yes/no relevance feedback card in X Search (experimental behavior) |
| Copy media URL | Copy direct image/video/GIF URLs from post options and image URL from photo long-press; native video long-press is not yet supported |

All six can be selected for **the same X version** in one patching run. The last two filters have been merged from the earlier five-patch beta without removing the existing URL copy patch.
Image long-press adds a Copy media URL action to the existing photo sheet. This passed compilation and real 12.31.0 APK patch-application checks, but device UI is still unverified. Video direct MP4 URLs are handled from post options; video long-press and photo-viewer three-dot menu are not implemented. The obsolete native video-download hook was removed because its fingerprint does not exist in X 12.31.0.

**Prerelease toggle:** Morphe compares stable and dev manifests and chooses the newer version. This stable 1.12.2-x.3 is newer than the old dev `1.12.1-legacy.4-beta.4`; switching the toggle off is not needed to get the latest unified version.

**Display name:** X Patch. If the source has a custom local name, change it using the pencil icon in Morphe.

## Verify
`python3 scripts/test-morphe-metadata.py`, `bash scripts/test-recommendation-filter.sh` and `./gradlew :patches:buildAndroid :patches:test` validate metadata, Java fixtures, and the patch bundle. Full patch application requires a compatible X APK; actual UI should be tested on an Android device.

## License
GNU GPLv3 — see LICENSE.
