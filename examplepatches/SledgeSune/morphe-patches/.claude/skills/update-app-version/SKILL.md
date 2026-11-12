---
name: update-app-version
description: Move this repo's patches to a new version of an app they target (Sync.ME, Waze or later ones) — check every fingerprint still matches exactly one method in the new APK, fix the ones that broke, update the supported version and release. Use when the owner says an app updated, a patch "doesn't work anymore", Morphe Manager shows a patch as failing, or drops a newer APK/.apkm in the folder.
---

# Update patches for a new app version

HANDOFF.md › Patches lists every hook and the anchors its fingerprint uses.

1. **Unpack and decompile** the new `.apkm` as in `new-morphe-patch` step 1 (integrity check, version from `info.json`).
2. **Check each patch** of that app (`patches/.../<app>/`):
   - Its anchors (strings, field reads, calls, fixed class/method names) still match **exactly one** method with the
     same return type and parameters. Grep with Bash inside a sub-folder; the Grep tool times out on the whole tree.
   - The code shape the patch assumes still holds (e.g. `move-result-object` after a hooked call, a free `v0`,
     call sites that get filtered).
   - Names the extension reaches **by reflection** still exist (e.g. `ConfigManager.setConfigValueLong`,
     `AlerterInfo.getAlertId().getProviderId()`, `FirebaseAnalytics`, enum constants like `UNRECOGNIZED`).
   - If the behaviour moved (new paywall, new ad path), re-trace it with `new-morphe-patch` instead of forcing the old hook.

   Note per patch: still matches / fixed / dropped.
3. **Fix and record**
   - New anchors, still no obfuscated names; update the KDoc's obfuscated name.
   - `shared/Constants.kt`: set the tested `AppTarget(version = "<new>")`. Keep the old version only if every patch
     still matches it. Keep the experimental `version = null` target. Update `apkFileType` if APKMirror changed format.
   - Build, check all patch names are listed, revert `patches-list.json`.
   - Commit on `dev`: `fix(<App>): Support <App> <version>` (hook changes) or
     `fix(<App>): Add <App> <version> to supported versions` (version list only). `fix:` makes a release; `chore:` wouldn't.
4. **Release and hand off** — ask the owner first, then `release-morphe-patches`. Update HANDOFF.md: new tested
   version, new obfuscated names, what broke, and that the new version is untested on a phone.
