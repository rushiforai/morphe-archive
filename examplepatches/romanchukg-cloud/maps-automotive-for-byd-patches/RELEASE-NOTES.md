# Morphe preview 10 — 3D car in navigation (TEST)

**28 October 2026 · Maps55J + optional Google20 (unchanged) · own patches/code only.** One `.mpp`, two app-specific patches. No Google APKs or Google model files are distributed.

## Changes since preview 9

- **3D car in navigation.** Maps shows a 3D model of the **BYD Tang 2024** instead of the arrow. It uses Maps' own Navatars feature, which is normally switched off on the server; the patch switches it on and loads only the bundled files, without downloads. The car has red rear lamps and small animations of our own for standing (`idle`), driving (`drive`) and turns (`left`, `right`).
- **New settings — Instrument cluster settings → 3D car on map.** **Show 3D car** (on by default) and the body colour: Original, Silver, White, Black, Grey, Blue, Red or Green. Changes apply the next time Maps starts; **Apply now** restarts Maps (an active route ends).
- **Where the 3D car comes from.** The model is adapted from ["2024 BYD Tang" by Ddiaz Design](https://sketchfab.com/3d-models/2024-byd-tang-0af7ffe7b3b64d7fb9e31d4f1bac10c1), licensed CC BY-NC-SA 4.0. We removed the interior, simplified the body to about 4000 triangles (Maps shows larger models without texture), turned the materials into one palette texture and wrote it as an FBX with **our own rig and animations**. The adapted model keeps the CC BY-NC-SA 4.0 licence, non-commercial use only: [tang2024-LICENSE.txt](assets/navatars/tang2024-LICENSE.txt). It is copied into the app as `assets/navatars/`.
- **Car icon on the map.** With the 3D car off, Maps shows a flat top-down car instead of the blue arrow: blue by day and white at night, without the disc under the arrow. It is our own top-down rendering of the free CC0 model "suv-luxury" from [Kenney Car Kit 3.1](https://kenney.nl/assets/car-kit). At patch time it replaces only the image of Google's arrow (`my_location_chevron_arrow`, pinned by SHA-256) and the seven flat navigation chevrons; the five discs under them become transparent. No Google bytes are bundled.
- **Round selection marks.** The radio marks in the cluster settings were stretched into ovals; they are round now.
- **Nothing else changes in Maps.** The rest of the Maps code is identical to preview 9.
- **Google patch unchanged (Google20).** A Google app built from preview 9 is byte-identical to one built from preview 10.

## Install / update

Refresh the Morphe source until it shows **preview10**, or import this release's `.mpp` as Local. Disable older duplicate sources for these patches. **Repatch Maps** from the same original Maps Automotive **26.10.120001.E /1068833407**, sign with **the same personal key** and install as an update; no data reset is needed. Rebuild the Google app only if you come from preview 7 or earlier. If you come from preview 8 or earlier, also turn on cluster settings → **Send to car → Keep phone routes arriving** (see [preview 9](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/tag/morphe-preview.9)). MicroG-RE **7.2.1+** is enough for Maps, **7.2.2+** for Gemini and Send to car; get Morphe and MicroG-RE from their official GitHub Releases. [Full guide](START-HERE.en.md).

## Verification limits

The 3D car was checked on an Android 12 (API 32) emulator signed in to the owner's account, with MicroG-RE 7.2.1 and the test build 55J. On the map and during navigation with left and right turns it stood wheels down with the front forward and its own colours, and all four animations played, without crashes. The Maps output of this release is identical to 55J apart from the added licence file (3278 entries, 0 content differences). **The 3D car with our own rig has not yet been tested on a car.** The same Tang 2024 model ran on the tested BYD Tang (DiLink 5.0) in private builds that used a different rig, and the owner switched models in the 3D car menu there. The flat car icon was checked on the emulator by day and at night only. Everything else in Maps is the code tested on that Tang for preview 9.

The release is rebuilt from our own sources with 593 host checks; three builds with OpenJDK 21 are byte-identical. Its Google runtime extension is byte-identical to preview 9, and its Google output matches preview 9 from the same input (14031 entries, 0 differences). Both originals must pass the pinned version/signature/fingerprint checks. Public asset verification is recorded in `VERIFICATION.json`. This remains a TEST prerelease.
