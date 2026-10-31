# GO input-spoofing developer utility

This is a local testing tool, not a Morphe Manager patch source. It is outside all Gradle source sets and is not included in the release bundle or patch catalog.

To build a private testing bundle, apply the utility to a disposable checkout of this revision:

```sh
git apply --check utils/go-input-spoof/enable.patch
git apply utils/go-input-spoof/enable.patch
```

Then build with the normal Android patch build. This adds temporary in-app route/boarding controls and hooks the location and motion inputs inside Transit. It does not change Android location for other apps. Restarting Transit clears the override.

The utility is for controlled local testing. Synthetic observations must not be submitted as genuine ride reports. The native GO engine still makes the boarding and reminder decisions; the activity transmitter does not read this utility's toggles. Use a fresh checkout for normal releases.
