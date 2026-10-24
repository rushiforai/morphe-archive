# Credits

This bundle is GPLv3 (see LICENSE). Some rows port work from other Morphe patch projects; their
authors' credits live here and in the per-file headers. Thank you to all of them.

## Loupric: Morphe Waze music patch
- Repository: https://github.com/Loupric/morphe-waze-music-patch (GPLv3), release v1.0.2, commit e9de88d0e579c19e8b71ee37f287eac6e48f5979
- Used by: **Additional players as audio partners**
- Ported from them: both edits, the manifest `<queries>` declaration and the `updateAppList` injection that builds the partner entry with the five-argument `au` constructor (feature bits 0x200001).
- Changed here: the fingerprint is pinned by class name and signature, and the patch also forces Waze's audio-extension switches so the partner does not depend on a server rollout.

## aaayd: Waze custom patches
- Repository: https://github.com/aaayd/waze-custom-patches (GPLv3), release waze-5.25.0.1-1030736-patches-1.15, commit b6811e594b1ea51167f22535e9d7476cb3da7554
- Used by: **Unlock driver moods** (their moods opening) and the resource refresh (SkinRefreshPatch).

## MorpheApp: morphe-patches
- Repository: https://github.com/MorpheApp/morphe-patches (GPLv3, with the Section 7 notice terms in their NOTICE; the preserved notice travels in our file header)
- Used by: **Disable Play Store updates**, adapted: the version code is locked above Play's ceiling and in-app reads of the version are preserved.

## bearinmindcat: morphe-patches
- Repository: https://github.com/bearinmindcat/morphe-patches (GPLv3), release v2.5.5, commit de89b20
- Used by: **Speed-limit sign style**, **Report speed limit**, the phone side of **Keep Waze alive**, and the extra keys folded into **Remove ads**, **Enable police & enforcement alerts** and **Alert distances**.
- Changed here: their versions are adjustable in-app; ours apply the same keys through Morphe-side options instead.
