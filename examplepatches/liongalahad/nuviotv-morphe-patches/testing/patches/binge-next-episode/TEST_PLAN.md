# Test plan

## Automated unit coverage

- [ ] The setting defaults to off and malformed stored values safely resolve to off.
- [ ] Off preserves both values of Nuvio's original `bingeGroupOnly` decision.
- [ ] On promotes `false` to `true` and preserves an original `true`.
- [ ] The exact category, title and description strings remain stable.
- [ ] Toggle changes are visible immediately and committed synchronously.

## Patch application and inspection

- [ ] Every declared settings fingerprint matches exactly once on universal, x86_64, arm64-v8a and armeabi-v7a 0.8.2-beta assets.
- [ ] `NextEpisodeStreamSelectionFingerprint` matches exactly once on every declared asset.
- [ ] Exclusive patch application succeeds on every declared asset.
- [ ] Post-patch inspection finds the initialization provider, Playback metadata, runtime classes, preference key and injected extension call.
- [ ] Combined application succeeds with Random Episode, Rating Visibility, Remove SDH Annotations and Mark SDH Subtitles.

## Settings UI

- [ ] Selecting only this patch shows Morphe > Playback and no unrelated category.
- [ ] The collapsed category is titled `Playback`; the expanded switch is titled `Binge Group Manual Fallback`.
- [ ] The switch defaults off, changes immediately and persists after force-stop and reboot.
- [ ] D-pad focus, focus rings, scrolling and back navigation work with Playback as the only category.
- [ ] Every expanded/collapsed combination with Detail Page, Ratings and Subtitles retains equal row bounds and stable D-pad order.

## TV AVD playback

- [ ] Use `Television_4K` and an H.264/AVC source for playback assertions; do not treat HEVC emulator decode failure as a patch failure.
- [ ] Prefer Binge Group on + patch on + matching next-episode source: Next selects the matching source automatically.
- [ ] Prefer Binge Group on + patch on + no matching source: Next waits for Nuvio's selection completion and opens the populated source picker.
- [ ] Prefer Binge Group on + patch off + no matching source: Next selects Nuvio's first eligible ordered result.
- [ ] Prefer Binge Group off + patch on: Next preserves normal Nuvio source selection.
- [ ] A matching source arriving near the end of the addon timeout is still selected rather than prematurely opening the picker.
- [ ] Selecting a source from the fallback picker starts the intended episode and Back dismisses the picker safely.
- [ ] Initial playback, explicit manual source selection and resume playback behave as before.
- [ ] Capture settings, matching-source and manual-picker screenshots plus logs proving no crash, ANR, VerifyError or fatal exception.

## Real Android TV acceptance

- [ ] Repeat all four preference combinations on an actual Android TV device using a series/addon pair with observable binge-group metadata.
- [ ] Confirm On/no-match always opens the picker and never silently changes source group.
- [ ] Confirm Off/no-match retains Nuvio's automatic fallback.
- [ ] Confirm matching next episodes remain automatic and normal playback is unaffected.
- [ ] Record device, Android version, Nuvio asset hash, addon, source labels and outcome before stable release.
