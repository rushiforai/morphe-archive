# Rating Visibility test plan

- [x] Unit tests cover defaults, all stored modes, malformed values, and watched/unwatched decisions.
- [x] Every fingerprint matches exactly once on every declared official asset.
- [x] Exclusive patch application succeeds for universal, x86_64, arm64-v8a, and armeabi-v7a.
- [x] Post-patch manifest and DEX inspection find only the Ratings category registration and required hooks.
- [ ] TV AVD verifies menu hierarchy, D-pad focus order, selection feedback, force-stop persistence, and reboot persistence.
- [ ] TV AVD verifies Overall Show/Hide on classic, grid, modern, carousel, collection, and Detail surfaces.
- [ ] TV AVD verifies Episode Show/Hide/Hide Unwatched on episode cards and the Ratings tab.
- [ ] TV AVD verifies MDBList provider precedence and checks crash, ANR, VerifyError, and fatal logs.
- [ ] Real Android TV acceptance evidence is committed before a stable release.
