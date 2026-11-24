# v2.1.9-dev.7 reproducible staging

Device validation: user reported normal behavior for the tested MPP SHA-256
`ea951e84930b393130dff2381d2aa549ab41519ba557e15daa50b99239d68528` on 2026-11-24.

`stage_verified.py` rebuilds from the SHA-256-pinned public v2.1.8 MPP,
reviewable source diffs, the current compiled Morphe root, and SHA-256-pinned
runtime dependencies. It verifies every runtime Smali class against the tested
MPP and every other MPP member byte-for-byte. DEX reassembly can change binary
layout, so the resulting archive is not asserted to have the same SHA-256.

```sh
./gradlew :patches:buildAndroid --no-daemon
python3 porting/revisions/v2.1.9-dev.7/stage_verified.py \
  --compiled patches/build/libs/patches-2.1.9-dev.7.mpp \
  --output /tmp/nicoid-re-2.1.9-dev.7.mpp
```

Requirements: Java, Python 3, GNU patch, SDK platform android-35 with the
locked android.jar hash, and access to pinned public dependencies. The script
uses current Guava and failureaccess for Smali execution. Historical dev.6/7
stage_candidate.py scripts are retained as provenance only.

Future versions require a reviewed staging path; never distribute a raw
Gradle MPP as v2.1.9 or a later dev.7 successor. This is a development
candidate, not approval to publish a stable release.
