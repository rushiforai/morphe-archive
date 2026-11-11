---
name: morphe-compatibility-release
description: Use when releasing a Proteus/Morphe patches bundle, verifying it against official Morphe patches, or checking that new Reddit hooks coexist with existing ones. Covers buildAndroid, list-patches, combined APK apply, result JSON, asset digest, and release flags.
---

# Morphe compatibility and release

Use this after a patch builds and unit tests pass.

## 1. Build the Android bundle

```bash
JAVA_HOME=/tmp/opencode/jdk21 \
ANDROID_HOME=/tmp/opencode/android-sdk \
GITHUB_ACTOR=local GITHUB_TOKEN=dummy \
bash ./gradlew --init-script /tmp/opencode/local.init.gradle.kts \
  :patches:buildAndroid
```

The artifact is `patches/build/libs/patches-<version>.mpp`. Do not publish a
bundle produced by a JVM-only test task.

## 2. List what the bundle actually exposes

```bash
JAVA_HOME=/tmp/opencode/jdk21 /tmp/opencode/jdk21/bin/java \
  -jar /tmp/opencode/tools/morphe-desktop.jar list-patches \
  --patches=patches/build/libs/patches-2.2.10.mpp \
  --filter-package-name=com.reddit.frontpage \
  --with-options
```

Check names, defaults, and option keys. A renamed patch can break existing
options files and release notes.

## 3. Apply alone first

```bash
JAVA_HOME=/tmp/opencode/jdk21 /tmp/opencode/jdk21/bin/java -Xmx4g \
  -jar /tmp/opencode/tools/morphe-desktop.jar patch \
  --exclusive --unsigned \
  --patches=patches/build/libs/patches-2.2.10.mpp \
  --enable="Block AutoMod comments" \
  --enable="Show deleted posts and comments" \
  --out=/tmp/opencode/reddit42-test.apk \
  --result-file=/tmp/opencode/reddit42-test-result.json \
  /tmp/opencode/reddit-xapk/com.reddit.frontpage.apk
```

Then inspect the result JSON: `success`, `appliedPatches`, `failedPatches`.
`"failedPatches":[]` is required.

## 4. Apply combined with the official Morphe bundle

Official upstream lives at `/tmp/opencode/morphe-official`. If it has no MPP,
use the released bundle from the official repo or build it. Each `--enable`
belongs to the immediately preceding `--patches`, so group them:

```bash
--exclusive --unsigned --force \
--patches=/path/to/official-patches.mpp --enable="Hide ads" \
--patches=patches/build/libs/patches-2.2.10.mpp \
--enable="Block AutoMod comments" \
--enable="Show deleted posts and comments"
```

Putting all `--patches` first and all `--enable` last silently enables only the
last bundle's patches. `--force` is required when the official release declares
an older Reddit version; confirm the result JSON still reports every expected
patch as applied.

Rules:

- Our extension package is `app.template.extension.extension`; official is
  `app.morphe.extension.reddit`. Do not rename ours to match without checking
  for class/method collisions.
- Multiple patches may inject at the same field write. Resolve indexes from the
  current instruction list, not from a cached fingerprint index.
- Verify the combined result JSON and at least one patched DEX instruction per
  hook. Official `Hide ads` calls `hideOldPostAds` on `Listing.children`; ours
  call `hideAutoModComments` and `undeleteContent` around it. The verified order
  is `hideAutoModComments` -> `hideOldPostAds` -> `undeleteContent` -> `iput`.
  Our comment-tree hook is in `Lc5l0` and does not overlap it.

## 5. Release checks

Before publishing:

- `sha256sum` the `.mpp` and record the size.
- Confirm the release tag points at the tested commit.
- Confirm the release body lists only tested features and honest limits.
- Keep `prerelease=true` until on-device verification exists.
- Re-verify the uploaded asset digest, not a local build artifact.
- Rotate any pasted GitHub PAT after use; do not commit tokens.

Useful scripts in this repo:

- `.github/scripts/verify_android_bundle.py`
- `.github/scripts/verify_patch_source.py`
