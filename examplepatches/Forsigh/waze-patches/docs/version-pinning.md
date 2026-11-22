# Version pinning rule

One bundle, one Waze build. A release declares exactly the APK version it was
verified against, and nothing else.

## Why

Morphe Manager shows the patch's declared targets in its version column. A
version list reads as "somewhere in this range", and a version-less target
reads as `Any` - both invite people to patch an APK the rows were never tested
on. When that happens the patcher applies what it can, the skipped rows leave
the app in a half-patched state, and the app crashes in a way nobody can
attribute. Issue #22 is the worked example: the PiP row on 5.26.1.0.

Refusing an untested build is a better outcome than patching it badly.

## How

`WazeConstants.kt` holds the shared `Compatibility`. Its `targets` list has one
entry:

```kotlin
targets = listOf(
    AppTarget(version = "5.28.4.900"),
),
```

`NoRecentDestinationsPatch.kt` declares its own compatibility for the same
reason (its read bridge only exists on some builds) and follows the same rule.

Never add a second `AppTarget` to widen coverage, and never leave the list
empty. Bumping the Waze target and the bundle version happen together.

## Cutting a release for a new Waze build

1. Verify all rows against the new base with `--continue-on-error`; every row
   must apply.
2. Run `tools/verify-dex-branches.py` and `tools/verify-dex-frames.py`; both
   must report 0.
3. Set the single `AppTarget` to the new version, bump `gradle.properties`,
   add the CHANGELOG entry, point `patches-bundle.json` at the new asset.
4. Build with `buildAndroid generatePatchesList` in one invocation.
5. Confirm the bundle's `classes.dex` contains exactly one version string:
   `zipfile.ZipFile(mpp).read("classes.dex").count(b"5.28.4.900") == 1`, and
   that the previous version string is absent.
6. Publish, then apply the **downloaded** asset to its own base and to an older
   base: the first must apply every row, the second must skip every row as
   incompatible.

## Keeping the previous release alive

Older releases stay published with their own pin, so users who have not
updated Waze yet can still patch. `0.30.64` is pinned to `5.27.90.900`;
`0.30.65` is pinned to `5.28.4.900`. When a stable is re-issued for a new pin,
replace that release's asset and say so in its notes - do not publish two
bundles under one version.
