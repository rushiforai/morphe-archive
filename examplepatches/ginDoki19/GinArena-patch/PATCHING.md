# Applying this overlay

A **source overlay**, not a patch bundle. It has no `.mpp` and cannot be installed on a phone. It is
applied to a clone of the repository, committed, and pushed — the release workflow builds the bundle.

## What it contains

```
PATCHING.md                                <- this file
README.md                                  <- the repo README + one hand-written section
patches/build.gradle.kts                   <- + buildPlayfyExtensionMpe
patches/src/main/kotlin/.../{playfy,playz,cricz,cricfy,crexify,sktech}/PinCategoriesPatch.kt
patches/src/extension/playfy/java/.../Pins.java
patches/src/extensionStub/java/android/... <- 49 files: 42 upstream + 7 new, 5 of them extended
```

Nothing is deleted, no released patch is modified, and no release-managed file is included.

## Applying it

Extract at the **root** of the clone — the folder that contains `README.md`, `patches`,
`gradle.properties`. Choose "replace" when asked: two files are modified rather than added
(`README.md`, `patches/build.gradle.kts`).

You should end up with **22 changed files: 7 modified, 15 added, 0 deleted**.

## Why `patches-list.json` is not in here

`readme-check.yml` regenerates the patch table from the **committed** `patches-list.json` and fails the
push if the result differs from the committed `README.md`. That json is rewritten by
`generatePatchesList` inside the release job, which only runs when a release is being cut.

So the overlay leaves it alone. Pushing `feat:` makes the release job regenerate both the json and the
table together — the table gains its six rows there, and this file's hand-written section, which sits
outside the `PATCHES_START`/`PATCHES_END` markers, is left untouched.

## Checking it before you push

From the repo root:

```bash
python3 .github/scripts/check_readme_links.py README.md
```

Must print `OK: all 36 in-page link(s) in README.md resolve`. (36, not 42 — the table still has the
released rows until the release job regenerates it.)
