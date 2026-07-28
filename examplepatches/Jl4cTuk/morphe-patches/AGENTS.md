# Repository instructions

## Project overview

This repository contains personal Morphe patches for Android applications.

## Development workflow

- Do all development work on the `dev` branch.
- Use the [Morphe patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md) for examples of patches and fingerprints.
- Use the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for general patch development guidance.
- Build patches with `./gradlew buildAndroid`.
- The build produces an MPP bundle at `patches/build/libs/patches-*.mpp`.
- Apply the generated bundle locally with Morphe CLI in the same way as any other patch bundle.

## Local patch testing

- Distinguish standard APK installation from root mount installation when planning runtime tests.
- On a device where Morphe has confirmed root access, prefer Morphe Manager's `Root mount installer` or Morphe CLI with `--mount`. The root workflow mounts the patched APK over the installed original, preserving the original installation and app data and avoiding the normal APK signature-update conflict.
- On KernelSU or KernelSU Next devices, keep the global `Umount modules by default` protection enabled, but disable `Umount modules` in the individual App Profile of each app tested through Morphe root mount. Do not grant root access to the target app; only change its mount visibility.
- After changing a target app's `Umount modules` profile, force-stop the target app, then apply the patch or use `Remount` before launching it again. Mount namespace visibility is established when the app process starts.
- If Morphe reports a successful mount, or ADB sees the patched APK at the installed `base.apk` path, but the app still behaves like the original, treat KernelSU mount namespace isolation as the first suspect. Verify the target app's `Umount modules` profile before changing fingerprints, repatching repeatedly, or considering direct APK replacement.
- Do not state that the original app must be uninstalled when root mount installation is available. The original app must remain installed as the mount target.
- Do not manually overwrite `/data/app/.../base.apk`; let Morphe manage the patched APK, mount, permissions, SELinux context, persistence, and unmount lifecycle.
- Verify root in the same execution context that will perform the mount. A failed `adb shell su -c id` only proves that ADB shell cannot obtain root; Morphe may still have per-app root authorization from the device's root manager.
- Without a working root mount path, standard installation can fail because the patched APK has a different signature. Do not uninstall the original app or clear its data without explicit user authorization.
- First validate that the bundle builds and that each selected patch applies successfully. Treat installation or mounting and functional behavior as a separate runtime validation step.

## Generated files

- Do not manually edit `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md`.
- Do not manually edit the generated patch-list block in `README.md` between `PATCHES_START` and `PATCHES_END`.
- The release workflow updates these files and the README patch list.
- Preserve the `EXPANDED` suffix on `PATCHES_START` so the generated patch list remains expanded.
- Remove the patch-list markers only when the user explicitly requests a manually maintained list.

## Commits

- Use [semantic commit messages](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index).
- Use `feat:` for new user-facing functionality.
- Use `fix:` for user-facing fixes.
- Use `chore:` for changes that should not appear in the user-facing changelog.
- `feat:` and `fix:` commits trigger new prereleases; `chore:` commits do not create a release.
- Before committing or pushing, stage only the files explicitly requested for the change and verify the complete staged diff and status internally to prevent unrelated changes from being included.
- Preparing a commit means updating the staged set and proposing a commit message only. Do not list or reproduce the staged files or diff unless the user explicitly asks, because the user reviews the staged changes locally.
- Treat staging and publishing as a mandatory two-step approval gate. After implementing a change, update the staged set, propose a commit message, and stop the turn so the user can review the staged changes locally.
- A request to commit or push that appears in the same message as an implementation request does not authorize publishing. Even when the user says to commit or push immediately, complete only the implementation and staging step, propose the commit message, and wait.
- Create the commit or push only after the user sends a new, separate instruction in a later message, after the staged-review checkpoint. Never implement, stage, commit, and push within the same turn.

## Releases

- Development releases are published from `dev`. Users must enable `pre-release` for this source in Morphe Manager to receive them.
- For a stable release, merge `dev` into `main` with a merge commit. Do not squash the merge.
- Always release through `.github/workflows/release.yml` and semantic-release.
- Do not manually create or upload releases because the workflow must update multiple generated files.
- Do not force-push semantic-release commits; doing so can break the release history.
- Rewriting release history, deleting a release or tag, and force-pushing require explicit user authorization. If the user asks to redo the latest release, drop the relevant semantic-release commit from `dev` or `main`, delete the associated release and tag, make the required changes, and then force-push the affected branch so `release.yml` can create the replacement release.

## Repository setup notes

- Keep links in `.github/ISSUE_TEMPLATE/` up to date.
- An optional `patches-bundle.png` can be added to show a custom bundle icon in Morphe Manager instead of the GitHub profile avatar.
