# Maps warning component rendering verification

The actual `CompactSpeedView` in candidate APK `a222b3a920052646a71b9b89407acddaa99e992154bba11c1022df91d03a69ad` rendered eight synthetic English/Dutch, light/dark, font-scale 1.0/1.5 cases on the owned Android 14 emulator. Target/helper signatures and installed hashes were checked. The reflection-only helper contains no target component or alert class definitions.

All cases retain the warning accessibility content. Normal-font images measure 630×329 pixels; large-font images measure 945×452. Original PNG hashes and provenance are retained in [the verification fixture](../../tests/fixtures/navigation-warnings/maps-ui-component-verification.json); local images and reports remain under `.analysis/native-warning-bindings/maps-ui-component-runtime/`.

## Correction to the initial visual assessment

The original Dutch light/large-font PNG **does contain its speed-limit badge**. The earlier missing-badge visual interpretation was incorrect. No product change was made.

Independent PNG decoding verifies an opaque-white expected badge center and 5,214 red-ring pixels in that original file. Its SHA-256 is `153294bf16c60fa9a00723d6171f2f723d40b2341f7066fbe141f255021cca18`.

Probe-only `CountingCanvas` diagnostics recorded both circles at finite coordinates, alpha 255, full component clip, white fill and red stroke, plus the `100` text. Single-case and reversed-loop runs, attached/detached Canvas snapshots, a second plain Canvas and a fresh anonymous Canvas all produced PNG bytes identical to the original. The diagnostic records and independent pixel check remain under `.analysis/native-warning-bindings/maps-ui-canvas-lifetime/`.

This verifies a component with synthetic bound values. It does not establish integrated phone placement, actual warning delivery, car-surface rendering or physical-device acceptance.
