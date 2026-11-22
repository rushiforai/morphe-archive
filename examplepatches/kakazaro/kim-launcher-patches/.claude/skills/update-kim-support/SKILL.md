---
name: update-kim-support
description: Use when a new Kim Launcher APK was added to refer-apk/, or when asked to check, update or re-verify the patches against the newest Kim app version, or to drop support for older Kim versions.
---

# Retarget the patches to the newest Kim version

**Policy: only the newest APK in `refer-apk/` is supported.** Older versions are dropped, not
kept working: every extra target is another fingerprint layout to maintain.

## Steps

1. **Find the newest.** `ls refer-apk/kim-launcher-*.apk | sort -V | tail -1` (ignore `kinex.*`).
   If it is already the only `AppTarget` in `KimCompatibility.kt` and the patch run below passes, stop: nothing to do.
2. **Build the bundle:** `set -a; source .env; set +a; ./gradlew build --no-daemon`
   (credentials: `docs/build-setup.md`).
3. **Run the patches on the newest APK** (the real applicability test):
   ```bash
   java -jar morphe/morphe-desktop-2.3.0-dev.2-all.jar patch --continue-on-error \
     -p patches/build/libs/patches-<ver>.mpp -o .work/check/<app-ver>.apk refer-apk/kim-launcher-<app-ver>.apk
   ```
   Output per patch must say it applied. A fingerprint miss or `PatchException` = broken patch.
   If the CLI rejects the version or signer, that's `KimCompatibility.kt` (step 5).
4. **If a patch fails**, find the moved code:
   - `bash tools/decompile.sh refer-apk/kim-launcher-<app-ver>.apk` (slow; regenerates `decompiled/`).
   - Obfuscated class names change every version: re-find the method by the strings/signature in the
     patch's `Fingerprint`, then adjust the fingerprint (strings, parameters, flags), never hardcode the new name.
     `docs/decompiled-code.md` maps where each feature lives.
   - Rebuild, rerun step 3.
5. **Even when fingerprints match, read the patched method's smali** in the new version.
   A match doesn't prove the inserted code is valid: register counts change (e.g. `p2` stopped
   fitting `const/4`, `p0` stopped fitting `iget-object`). Check inserted registers still exist and
   the record/parse/save helpers the patch derives are still unique.
6. **Drop old versions:**
   - `KimCompatibility.kt`: leave exactly one `AppTarget` (the newest).
   - README "Tested" table: keep only the newest row; update status from what step 3 proved
     (patched APK builds ≠ run on a device: say which).
   - Update KDoc/docs that cite old obfuscated names ("K1/uc.c in 1.0.2781, ...") to the new version only
     (`grep -rn "1\.0\.27" patches docs README.md`).
   - Ask before deleting older APKs from `refer-apk/` (large, git-ignored, may be wanted for analysis).
7. **Verify:** rerun steps 2-3 after all edits; both patches must apply.
8. **Hand off to the `release` skill** (dropping versions = at least a minor bump). Do not push or tag here.

## Common mistakes

| Mistake | Fix |
|---|---|
| Keeping the old `AppTarget` "just in case" | Policy is newest only; remove it |
| Declaring success from a green Gradle build | The build never touches an APK; step 3 is the test |
| Fixing a miss by hardcoding the new obfuscated name | Fix the fingerprint instead; names rotate each release |
| Only the latest filename sorted with plain `sort` | Use `sort -V` (`1.0.2787` vs `1.0.998`) |
