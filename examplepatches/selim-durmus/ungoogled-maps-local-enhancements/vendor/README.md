# Preserved upstream patches

This directory includes unmodified source from:

- Repository: https://github.com/bearinmindcat/morphe-patches
- Commit: 35421159e2149d1ca972ffd0f16b79666569035c
- Release: v1.3.0
- Source snapshot: morphe-patches/
- Published bundle: artifacts/patches-1.3.0.mpp
- Bundle SHA-256: 72c1e94d736b3214f560414bb8c700f551d28ff9d3d5800a79abd6207f982e80
- Bundle origin: https://github.com/bearinmindcat/morphe-patches/releases/download/v1.3.0/patches-1.3.0.mpp

Original LICENSE and NOTICE are retained inside morphe-patches/. The source-file checksum manifest is upstream-files.sha256.json. Attribution remains with the upstream authors. This independent project uses the Morphe name only to describe compatibility and build dependencies.

The compiled bundle is included so routine APK builds do not require rebuilding the upstream Gradle project or contacting its package registry. Our extension Java sources are compiled locally on every build. The vendored snapshot is the original source corresponding to the upstream release, not a decompilation of Google Maps. Google APKs, the Morphe Desktop executable and personal signing keys are not included here.

To update upstream, import a reviewed source revision and its matching bundle together, regenerate the manifest, update the locked inputs/options, and test the complete pipeline. Do not replace only the MPP file or relax the version checks.
