# Morphe preview 11 — the 3D car stands still (TEST)

**30 October 2026 · Maps55K + optional Google20 (unchanged) · own patches/code only.** One `.mpp`, two app-specific patches. No Google APKs or Google model files are distributed.

## Changes since preview 10

- **The 3D car stands still.** In preview 10 the BYD Tang 2024 in navigation bobbed slightly (by about 1 cm at real size) and leaned 2.5° in turns. Now it stays still. Maps still asks for its four animations (standing, driving, left and right turns), so the model keeps them, but they no longer move the car.
- **Nothing else changes.** The Maps code is identical to preview 10; only the 3D car file differs. The Google patch is unchanged (Google20).

Everything from preview 10 stays: the 3D BYD Tang 2024 in navigation (on by default; **Instrument cluster settings → 3D car on map** turns it off and picks the colour), the flat car icon when the 3D car is off, and the round selection marks. The 3D car is adapted from ["2024 BYD Tang" by Ddiaz Design](https://sketchfab.com/3d-models/2024-byd-tang-0af7ffe7b3b64d7fb9e31d4f1bac10c1) under CC BY-NC-SA 4.0, non-commercial use only, with our own rig: [tang2024-LICENSE.txt](assets/navatars/tang2024-LICENSE.txt). See the [preview 10 notes](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/tag/morphe-preview.10) for details.

## Install / update

Refresh the Morphe source until it shows **preview11**, or import this release's `.mpp` as Local. Disable older duplicate sources for these patches. **Repatch Maps** from the same original Maps Automotive **26.10.120001.E /1068833407**, sign with **the same personal key** and install as an update; no data reset is needed. Rebuild the Google app only if you come from preview 7 or earlier. If you come from preview 8 or earlier, also turn on cluster settings → **Send to car → Keep phone routes arriving**. MicroG-RE **7.2.1+** is enough for Maps, **7.2.2+** for Gemini and Send to car; get Morphe and MicroG-RE from their official GitHub Releases. [Full guide](START-HERE.en.md).

## Verification limits

The still 3D car was checked on an Android 12 (API 32) emulator signed in to the owner's account, with MicroG-RE 7.2.1 and the test build 55K. On the map and during navigation with left and right turns it stood wheels down with the front forward and its own colours; Maps played all four animations, without crashes. The Maps output of this release is identical to 55K apart from the model's licence file (0 content differences). **The 3D car with our own rig has not yet been tested on a car.** The same Tang 2024 model ran on the tested BYD Tang (DiLink 5.0) in private builds with a different rig. Everything else in Maps is the code tested on that Tang for preview 9.

The release is rebuilt from our own sources with 593 host checks; three builds with OpenJDK 21 are byte-identical. Its runtime extensions are byte-identical to preview 10, and its Google output matches preview 10 from the same input. Public asset verification is recorded in `VERIFICATION.json`. This remains a TEST prerelease.
