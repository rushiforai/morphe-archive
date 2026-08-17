# Random Episode test plan

- [x] Unit tests cover fresh-default On, stored Off persistence, eligible filtering, future and malformed dates, current-episode exclusion, route immutability and random-session clearing.
- [x] Every fingerprint matches exactly once on universal, x86_64, arm64-v8a and armeabi-v7a 0.8.4 APKs.
- [x] Exclusive patch application and manifest/DEX inspection pass on all declared assets.
- [x] Combined application passes with Rating Visibility, Remove SDH Annotations and Mark SDH Subtitles.
- [ ] TV AVD verifies the Detail Page category and all eight collapsed/expanded combinations with Ratings and Subtitles.
- [ ] TV AVD verifies OFF/ON series appearance, D-pad order, click, long press, source selection, H.264/AVC playback, seeking and error return; unit tests verify movie, special and future-episode exclusion.
- [ ] TV AVD verifies random Next Episode does not repeat the current episode when alternatives exist.
- [ ] TV AVD verifies no local progress write, remote progress mutation, tracking scrobble or resume seek during random playback.
- [ ] TV AVD verifies normal playback immediately before and after random playback remains unchanged.
- [ ] Toggle persistence passes after force-stop and reboot.
- [ ] Real Android TV acceptance evidence is recorded before stable release.

## 2026-08-07 AVD evidence

- Final combined x86_64 build includes Random Episode, Rating Visibility, Remove SDH Annotations and Mark SDH Subtitles.
- Twenty consecutive `Friends` selections produced twenty distinct episodes across seasons 2, 3, 4, 6, 7, 8, 9 and 10, with no season-zero selection.
- The long-press dialog displayed `S3 E6`; source requests used `tt0108778:3:6`.
- `Friends` `S3 E6` played and sought successfully with an AVC source. Simkl diagnostics retained `media=none` and skipped start/pause scrobbles.
- Natural completion proposed random `S7 E24` instead of sequential `S3 E7`; confirmation requested `tt0108778:7:24`.
- Returning home did not add `Friends` to Continue Watching and preserved the existing Cape Fear entry at `55m Left`.
- Recomposition stress covered 50 horizontal focus changes, eight long-press open/dismiss cycles and repeated vertical detail-page focus changes without a crash.
- Full emulator reboot preserved the enabled setting and the series shuffle action.
