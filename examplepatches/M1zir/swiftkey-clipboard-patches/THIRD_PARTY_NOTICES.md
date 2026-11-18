# Attribution

The SwiftKey privacy and cloud sign-in patches are adapted from
[arandomhooman/hoomans-morphe-patches](https://github.com/arandomhooman/hoomans-morphe-patches),
commit `018277825a611ad61f3a16a70e562291c06f4081` (GPL-3.0).
Their author is arandomhooman. The original target is SwiftKey 9.13.13.5;
this project adapts them to 9.13.19.3 and adds a toolbar editor.

Morphe Desktop/Patcher is the patch engine, developed by the Morphe project,
based in part on prior ReVanced work. This project is independent and is not
an official Morphe or Microsoft product.

The Gradle wrapper is copied from the upstream patches project. Gradle is
distributed under the Apache License 2.0. Google R8/D8 is also Apache-2.0.
Neither Desktop nor R8 is committed here: the bootstrap script downloads
public releases and checks their SHA-256 hashes.

The `catalog` generator is adapted from Morphe's official
[patches template](https://github.com/MorpheApp/morphe-patches-template),
copyright 2025 Morphe, GPL-3.0 with Section 7 conditions. Its original
[NOTICE](catalog/NOTICE) is preserved. The adaptation uses explicit bundle inputs
and validates source metadata; it is a build tool and is not included in the MPP.

SwiftKey is Microsoft's application. Its APKs, split APKs, decompiled source,
native libraries, signing keys and patched application are not distributed
in this repository or its releases.

## Custom clipboard fork (2026-11-10)

Based on murilosimao/swiftkey-patch v0.1.1, commit 2d6d054b387d5b39a8d35d35d335a478a542306b, under GPL-3.0.
Added persistent local clipboard retention, overflow-safe ordering, verification scripts, and fork documentation.
All upstream attribution and the GPL-3.0 license are preserved. This is not an upstream release.

## Arabic layout restoration (2026-11-11)

Added an optional patch exposing SwiftKey’s existing Arabic 123 legacy layout,
with emitted-DEX verification and documentation. Microsoft’s original layout
assets remain in the input APK and are not copied into the patch bundle.
