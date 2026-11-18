# 2dehands 16.19.0 applicable split admission

The reported failure in Dutch App Patches 1.31.1 occurs before the selected
privacy control executes. `requireCompleteResources` requires both ARM64 and
ARMv7 plus every density from the earlier eight-APK input. The supplied
five-APK input has the same base and Notifications feature, with ARM64,
XHDPI and XXHDPI splits. It is rejected despite containing complete applicable
publisher payloads.

## Artifact evidence

- Supplied XAPK SHA-256: `9f90064d21372a0e3ac0cee421e6b5bbad3bdf7e44a3ee1d62d415b49fb8c3d0`.
- Base SHA-256: `ad0dcf64e7b4e1a85bf908d821b854be79566f919496fd2576f517494967f6b1`, identical to the original pinned Belgian base.
- Notifications SHA-256: `07f7daa6456e70a873ece4c85f84152564ce2c62ba65776eaf1e311559652445`.
- All seven supplied ARM64 library hashes match the existing original contract.
- XHDPI and XXHDPI APK bytes match the corresponding splits in the earlier
  eight-APK extraction. The density profile contract records each original
  split's resource paths, with API version qualifiers normalized as by Morphe's
  resource merger. None of these paths occurs in the base.
- REA archive inspection: `ev_9687623302fcdf47c13aedf1188fd224a82a6971eb4339db79db9aaabd65617f`.
- REA/JADX base manifest inspection: `ev_1e05368da0be1f6c4cbb0cd0f221b775b66aa8e7879ca07119be2fdea225f746`.
  Package `be.tweedehands.m`, version `16.19.0`, code `633464`, SDK 32/37.
  These are static observations; REA does not verify Android signatures or
  execute this application.

## Fix

Accept one or both complete supported native ABIs. Reject absent, partial,
unknown or modified native payloads. Accept unions of complete original
density split profiles; reject absent density payloads and uncovered partial
profiles. Overlapping resource paths between density APKs are handled as sets.
Publisher identity, SDK and Notifications metadata/code checks remain required.

The independent rebuilt verifier compares native files with the supplied
original split set and checks their hashes against the original contract.
It no longer requires native libraries for an ABI absent from that input.

## Validation

- Reproduced the exact reported exception using released `patches-1.31.1.mpp`
  and the supplied five-member XAPK, before changing production code.
- The same genuine production resource guard passes after the fix. The
  standalone split regression passes 18 assertions using Patcher **2.1.0**:
  ARM64 with XHDPI/XXHDPI, each density alone, and the earlier full input;
  rejection of absent/partial/changed native payloads and absent/partial density
  resources, without manifest mutation on rejection.
- Existing publisher identity/SDK/Notifications regression passes, including
  missing feature code despite fused manifest metadata. Its class loader now
  comes from a Belgian control, rather than an arbitrary embedded patch bundle.
- Original, four individual patch selections and the combined selection pass
  patch reports, signature verification, retained graph/helper/feature checks,
  native preservation and bounded effect checks. All reports have no failed patches.
- Python: **426 tests, 40 skipped**, with genuine Belgian fixture tests enabled.
- All Gradle tasks from the release workflow's Android check step pass, including
  `:patches:buildAndroid`, `:patches:test` and the nine extension unit-test tasks.

Reproduce the split regression with the local, ignored publisher artifacts:

```sh
python3 tests/verify_tweedehands_splits.py --bundle PATCHES.mpp --input DEVICE.xapk
```

Add `--full-input FULL.apks` to verify the earlier full split set and
`--patcher PATCHER.jar` to select a particular Morphe Patcher SDK. The script
uses the existing pinned desktop JAR from `scripts/bootstrap.py` for dependencies.
Full selection verification uses `scripts/validate_targets.py 2dehands`.

Local logs and JSON reports are in the task worktree's ignored
`build/2dehands-input/` directory. Patch application and rebuilt artifact checks
are verified here; this change does not add new phone/account/payment runtime
acceptance evidence. No stable publication is part of this local validation.

## Manager 2.3.0 follow-up

The v1.33.1 resource check still failed on the OnePlus CPH2747. The phone's
downloaded 16.19.0 XAPK has the same SHA-256 as the supplied desktop artifact.
Manager 2.3.0's `patcher-core/.../split/Merger.kt` uses
`bundle.mergeModules(false)` and does not call `validateResourcesDir()`.
Desktop's normal merge path performs resource-directory normalization. Manager
therefore retains paths such as `res/drawable-xhdpi-v4/...` and
`res/drawable-anydpi-v21/...`, while the pinned density profiles use paths with
those API-version qualifiers removed. All profiles appeared incomplete even
though the selected density payloads were present.

A regression using Patcher 2.1.0 and the Manager merge options reproduces the
exact density exception with the released v1.33.1 bundle. The corrected guard
normalizes API-version qualifiers for the resource-presence comparison only;
density/layout-direction qualifiers and native library byte checks remain.
Desktop, Manager, single-density and earlier full-input admission plus corrupt
payload rejection pass **21 assertions**. Python and release integration tests
remain green, as do the release workflow's Gradle Android checks.

The corrected local MPP was copied to the connected phone. The user imported
and tested it in Manager and explicitly confirmed that this MPP works. No APK
installation was performed by the agent.

## Installed 16.20.0 compatibility assessment

The user also requested extraction and assessment of the phone's installed
`be.tweedehands.m` **16.20.0 / 633468**, SDK 32/37. The pulled set contains
`base.apk`, `split_config.arm64_v8a.apk` and `split_config.xxxhdpi.apk`. APK
payloads were preserved, and Android signature verification confirms the same
original publisher certificate. Base SHA-256:
`f69fb5e74d5e8a80d59bfd3ef451b8b03316aa0b78cce3d89ff8e891e47c44d8`.
REA/JADX package evidence:
`ev_67dec24f5d802f5d7b1a4c6cd7987b24c262af3d46d4e02bcb3b42ce11a7d5c3`.

The released v1.33.1 bundle **skips all four patches** as incompatible. Its CLI
still reports overall success after rebuilding an unchanged app, so the empty
`appliedPatches` list is decisive. The corrected local bundle also rejects
16.20.0 at the original-version guard when CLI version filtering is forced.
Comparing all 114 pinned patch bindings with the pulled base finds **54 exact
method signatures absent, 39 present bodies changed, and 21 unchanged graphs**.
Both original ThreatMetrix wrapper bodies differ. This is not a clean port and
does not justify adding 16.20.0 to the compatibility list.

The extracted original APK set, hashes and bounded comparison results are saved
under `Downloads/2dehands-16.20.0-from-phone-20261102/`; no purported patched
16.20.0 APK is delivered. This hotfix remains scoped to 16.19.0 Manager input
compatibility.
