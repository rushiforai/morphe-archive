# X Patch

One Morphe patch source, six selectable enhancements for X. **Keep your existing source:** update it; no need to add a second source.

## Install or update
Source: https://github.com/rikunode/x-patch

Stable version: 1.12.2-x.8 · 6 patches · X **12.31.0-prod.01** / **12.32.0-prod.01**.

| Patch | Function |
|---|---|
| Fix external post links | Open linked posts without requiring Home / For You |
| Hide Find more | Hide Discover more recommendations |
| Hide Who to follow | Hide follow recommendations |
| Hide sports scores | Suppress sports ScoreCard tiles and live-game pills (experimental behavior) |
| Hide search relevance prompt | Hide yes/no relevance feedback card in X Search (experimental behavior) |
| Copy media URL | Copy image/video/GIF direct URLs from post options or the native media long-press menu |

All six can be selected for **the same X version** in one patching run. The last two filters have been merged from the earlier five-patch beta without removing the existing URL copy patch.
Version x.8 changes only the custom image long-press row icon to match X's native video Copy link chain icon. All URL-copy logic and other patches remain unchanged. Version x.7 fixed the loop-exit branch that skipped the x.6 long-press row insertion. It now adds the copy action after X constructs its immutable image/video sheet, leaving native actions intact. Tapping the new row reads the selected image URL (original quality) or the highest-bitrate video/GIF MP4; unavailable URLs are reported instead of silently removing the row. The post-options path and other five patches are unchanged. Real X 12.31.0 APK patch application, unit checks, and an isolated immutable-sheet action/callback test passed. The image/video long-press rows were observed on-device for x.7; the new x.8 image icon must be checked after installation. The video-viewer overflow menu is not modified.

**Prerelease toggle:** Morphe compares stable and dev manifests and chooses the newer version. This stable 1.12.2-x.8 is newer than the old dev `1.12.1-legacy.4-beta.4`; switching the toggle off is not needed to get the latest unified version.

**Display name:** X Patch. If the source has a custom local name, change it using the pencil icon in Morphe.

## Verify
`python3 scripts/test-morphe-metadata.py`, `bash scripts/test-recommendation-filter.sh` and `./gradlew :patches:buildAndroid :patches:test` validate metadata, Java fixtures, and the patch bundle. Full patch application requires a compatible X APK; actual UI should be tested on an Android device.

## License
GNU GPLv3 — see LICENSE.
