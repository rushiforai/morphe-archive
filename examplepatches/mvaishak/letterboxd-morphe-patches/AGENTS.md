# Letterboxd Morphe patches

## Start with the smallest useful change

- Check `git status -sb`, the current branch, and the target Letterboxd
  version. Keep unrelated work in place. Reuse the matching stock APK and any
  existing decoded resources or bytecode for that version.
- For a bug, identify the exact entry point, the installed build, and the
  action that should succeed. For an uncertain feature, answer the one
  question that determines feasibility before building the full feature.
  Inspect the code first. Use a temporary diagnostic build only when the
  answer depends on runtime data. Keep diagnostics out of the release and
  restore the previous APK after a temporary device probe.
- Before any UI change, read the
  [Morphe UI design playbook](docs/design/MORPHE_DESIGN_PLAYBOOK.md).
  Find the closest native or approved component and reuse it. Follow the
  design through the menus, dialogs, previews, and forms the change opens.
  For small revisions, work from code and existing references. When the
  interaction or presentation is still undecided, settle it before building
  every variant. Record new reusable patterns after the user approves them.

## Build and install one useful candidate

- Batch changes that can be reviewed together. Build the current tree with
  `./gradlew buildAndroid`. Use the fresh `.mpp` and the original,
  unpatched APK or split bundle matching the phone's app version. Reuse the
  last known working Morphe version, signing key, and patch selection
  (including options), adding the patch under review. Check the patch result
  for the intended patch names and zero failures before installing.
- For a local build in this repo, install it on the connected phone with
  `adb install -r` so app data is retained. Check `adb devices` early and
  confirm the install succeeded. Keep a known working signed APK for
  rollback. Record the candidate APK path, base version, and Morphe result
  together under a timestamped local directory. **Local means build and
  install on the phone. A push to dev requires the user's instruction.**
- A code-only request ends with the code changes. If the user is doing the
  device testing, hand off after installation with the exact path to the
  feature and a short description of what to check.

## Verify the outcome

- Use the real entry point on the exact candidate. For example, tap Export
  and check that the chooser appears before the file picker, tap Save and
  reopen a copied list to confirm it persisted, or toggle a poster setting
  and reopen the same film after restart to check the displayed image.
  Compilation, patch application, installation, and observed behavior are
  separate results. Report which ones you verified.
- Start with the changed path and its most relevant fallback or adjacent
  flow. For a dialog redesign, check the parent and affected child dialogs
  together. For a changed parser or data rule, use existing fixtures when
  they cover the behavior. For a bytecode change, verify patch application
  against every version affected before releasing support for it.
- The playbook's theme, screen size, and accessibility matrix is for changes
  that need that coverage. Expand checks only for a concrete risk or an
  explicit request. Skip screenshot sweeps, repeated installs of the same
  candidate, and broad device setting changes for routine fixes. Restore any
  device settings changed for a targeted check.

## Push and release

- When asked to push, check the live dev head and review the complete diff.
  Keep the requested What's New text. If its body changes, bump
  `ModWelcome.BUILD` so it appears once for returning users. If the user
  asks to leave it alone, keep both the text and marker intact.
- Use the repo's conventional commits and release workflow. Leave generated
  release files to CI. A successful push confirms the source reached dev.
  When publication is requested, verify the release workflow, prerelease
  tag, and downloadable `.mpp` for that push before reporting it published.
