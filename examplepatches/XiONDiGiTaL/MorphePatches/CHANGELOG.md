## [0.1.1](https://github.com/XiONDiGiTaL/MorphePatches/compare/v0.1.0...v0.1.1) (2026-11-22)

### 🐛 Bug Fixes

* **site:** keep the mirror tables inside a phone viewport ([1d6b92b](https://github.com/XiONDiGiTaL/MorphePatches/commit/1d6b92b9e9a4ddeaeaca691f93a133659a0e0bb0))

## 0.1.0 (baseline)

First release under the 0.1.x scheme. One bundle carries every patch for every supported app:
five for Tandem 6.38.0 and 6.12.0, two for Amazon A to Z on any version.

Versions now move by one patch at a time — 0.1.1, 0.1.2, 0.1.3 — regardless of whether a
change is a feature, a fix or a new app. Nothing is skipped, and the number no longer implies
which kinds of change are inside.

Each app keeps its own folder (`Tandem/`, `AmazonAtoZ/`) documenting its patches; the release
asset is the bundle Morphe reads and contains all of them.
