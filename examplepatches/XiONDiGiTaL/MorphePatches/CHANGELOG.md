## 0.1.0 (baseline)

First release under the 0.1.x scheme. One bundle carries every patch for every supported app:
five for Tandem 6.38.0 and 6.12.0, two for Amazon A to Z on any version.

Versions now move by one patch at a time — 0.1.1, 0.1.2, 0.1.3 — regardless of whether a
change is a feature, a fix or a new app. Nothing is skipped, and the number no longer implies
which kinds of change are inside.

Each app keeps its own folder (`Tandem/`, `AmazonAtoZ/`) documenting its patches; the release
asset is the bundle Morphe reads and contains all of them.
