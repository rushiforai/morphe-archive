---
name: morphe-verify-patch
description: Build and verify changed Santodan Morphe patches against original app DEX and packaged bundles, then review the diff and report evidence.
---

# Verify a patch

Work from `E:\Morphe\santodan-patches` in PowerShell. Java 21
(`E:\Morphe\jdk-21.0.2`) and `sdk.dir=E:/Morphe/SDK` are already the defaults. Do not
rediscover them. `build-local.ps1` loads `.env` credentials. Never print `.env`.

## Run cheaply

Run Gradle in the background and redirect to a log in the scratchpad. Then read
only failures, not the full log (it is 1,500+ lines):

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:<verifyTasks> --continue --no-daemon *> $log
```
```bash
grep -nE 'FAILED|What went wrong|Exception in thread|Check failed|AssertionError|error:' "$log" | head -30
```

Find a failing check with `rg -n 'check\(' <verifier>` near the reported line. A
bare `Check failed.` is a `check(...)` without a message. `--continue` keeps other
*tasks* running, but a failing verifier program stops its remaining modes, so rerun
after a fix.

## Task map (inspect `patches/build.gradle.kts` before inventing names)

- NuvioTV 1.1.1: `verifyNuvioLatest` aggregates every current static, runtime and
  bundle check (including `verifyNuvio111Bundle`, which applies standalone and
  combined selections). Delivered-APK audits are separate:
  `verifyNuvio111Apk`, `verifyNuvioLabelsApk`, `-Pnuvio111TransitionApk=<apk>`.
- Monet 1.1.2: `verifyMonet`, `verifyMonetBundle` (`verifyMonet111` retained),
  `verifyMonetDisplayedCards112`/`verifyMonetCatalog112` (+`Runtime`/`Bundle`/`Apk`; the
  unversioned card/catalog tasks run these). Retained 1.1.1: `verifyMonetDisplayedCards111`
  and `verifyMonetCatalog111` (+`Runtime`/`Bundle`/`Apk`).
- Pillo 0.6.27: `verifyPillo627Runtime`, `verifyPillo627Bundle`, feature `*Bundle` tasks.
- Car Scanner 2.2.42: `verifyCarScanner242`, `verifyCarScanner242Bundle`.
- Fylo 2.6: `verifyFylo`, `verifyFyloBundle`, `verifyFyloApk`. TFD: `verifyFirstDescendant*`.
- Release: `verifyAndroidBundle`. `verifyMorpheDesktopImport` uses the newest
  `E:\Morphe\morphe-desktop-*-all.jar` (logged as `Morphe Desktop JAR: ...`);
  `-PmorpheDesktopJar=<jar>` overrides it. Report the Desktop version used.
- Metadata changes: `generatePatchesList`, then review the `patches-list.json` diff.
- `:patches:test` does not run the `JavaExec` verifiers.

## What counts

- Matchers: unique real-input match; missing/changed/ambiguous/already-patched
  rejection; mutation scope; DEX write/reload. Runtime: failures and lifecycle, not
  only success. Do not weaken a validator or invent fixture methods to pass.
- Bundles: apply the built `.mpp` (`patches/build/libs/patches-<version>.mpp`) to the
  original input. Preserve APKS/APKM splits. Check merged extension classes and
  reflected bindings in the delivered APK, and record its hash under a distinct name.
  Check the local Morphe CLI's help before using its flags. Write the patched APK
  (`-o`) where Morphe Desktop does: `E:\Morphe\Apps\<App>\<App>-<version>-patches-<bundle
  version>.apk` (add `-unsigned` for base-only test builds; never overwrite). Never
  leave it in the scratchpad, and keep `morphe-data\patched-apps.json` pointing at it.
- Review: `git diff --check`, `git diff --stat`, new files. No credentials or
  original apps added, and no new older-version support. Do not commit or push
  unless asked.

Report: target package/version, changed behavior/files, exact commands and
results, bundle path, and remaining checks. State separately whether the app was
compiled, DEX-verified, rebuilt, signed, installed or device-tested. Do not
install without a request.
