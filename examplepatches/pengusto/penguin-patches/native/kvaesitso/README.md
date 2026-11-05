# Kvaesitso #1504 source candidate

`1504-edit-widgets.patch` is a native source diff against upstream Kvaesitso
v1.41.0 (`328073f38f8472118a377f69cce34a2c86372ab9`). It is not an MPP file.
The separate local Morphe implementation for the official 1.41.0 APK is
documented in [`docs/KVAESITSO.md`](../../docs/KVAESITSO.md).

From a clean, separate checkout of that tag:

```sh
git apply --check /absolute/path/to/1504-edit-widgets.patch
git apply /absolute/path/to/1504-edit-widgets.patch
./gradlew :app:app:assembleDefaultDebug :app:ui:lintDebug
./gradlew :app:app:assembleDefaultRelease \
  :core:base:testDebugUnitTest :data:locations:testDebugUnitTest
```

Use the upstream build requirements and disposable test signing material.
Full input provenance, validation results and limitations:
[`docs/KVAESITSO.md`](../../docs/KVAESITSO.md).
The upstream source and derivative changes are GPL-3.0-or-later; preserve
upstream attribution and license notices. No APKs or signing keys belong here.
