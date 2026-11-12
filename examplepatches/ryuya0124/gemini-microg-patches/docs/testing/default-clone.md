# Default Morphe clone setup — v0.3.2

## Behavior

Keep this source's default selection, including **Automatic Clone Setup**. It creates the fixed `.morphe` package and isolates owned permission declarations and provider authorities. The dependent permission support patch updates Manifest and DEX references. The source works without loading official patches, enabling Clone app, opening Expert mode or supplying `-O` options.

The public default patch snapshots the original Manifest before optional external Clone app executes, then applies the canonical names in its finalizer. Patcher1.12 executes selected patches in name order and finalizes them in reverse order. Keeping Automatic Clone Setup selected makes old saved selections with official Clone app work with both its default false/false options and the previous true/true configuration. A custom package name is rejected before replacing a successful output. Original permission protection levels are preserved.

## Completed checks

On 2026-11-12, before publication:

- Default local Google/Gemini builds used only this source and its default compatible patches, with no official patch source, explicit patch selection or clone option flags.
- Both clone-contract checks passed: Google has 14 isolated owned permissions and 27 noncolliding providers; Gemini has 1 and 1. No stale owned-permission Manifest/DEX references remained, and protection levels were unchanged.
- Work-profile, compliance, trampoline, branch-target and cached-process verification passed. APK signatures use the existing certificate.
- The release MPP passed JVM/Android packaging verification with all **26 JVM classes** represented in Android DEX and Patcher1.12 metadata. Desktop list-patches loaded the bundle, including the default Automatic Clone Setup patch.
- `test-issue8-options.py` uses the built release MPP. All **11 assertions** passed: default-only Gemini generation and clone contract; optional official Clone app with untouched defaults; optional official Clone app with previous true/true options; custom-name rejection with previous output retained; and all 3 historical account experiments rejected before output replacement.
- Google was also rebuilt directly from the release MPP alone, without patch-selection or option flags. Its clone contract passed, and all **15 output DEX files plus AndroidManifest.xml** matched the signed device build byte-for-byte.
- API36 Google APIs emulator, dedicated `GeminiPatch_Issue8_API36`: **26/26 assertions passed** with the default-only Google/Gemini outputs.
- Android12/API31 Google APIs emulator, dedicated `GeminiPatch_Issue8_API31`: **26/26 assertions passed** with default-only builds from the original Google API30 nodpi and Gemini API29 inputs.

Both emulator runs reproduced duplicate-permission failure, v0.3.0 Lens authorization denial, unnormalized cached process names and widget-receiver ClassCastException, then verified the corrected clones, the same receiver entry without a fatal crash, and launcher routing with original Google disabled. They used normal shell UID2000 without root commands. The original Google state was restored. Original APK SDK requirements were preserved.

These are actual APK patch/install/runtime checks using the Morphe Desktop/Patcher backend and release bundle. Morphe Manager's Android GUI was not driven. No Google account or microG was added to the emulators; login/chat, full widget rendering and real Lens processing were not tested.

## Physical update

The same signed default builds were applied with data-preserving updates to Google/Gemini in Secure Folder user150 on SM-S948Q / Android17. The 3 installed APK hashes and existing certificate matched the supplied builds. LensService requires the cloned permission; user150 CE/DE data directories and the user0/10 installation state were preserved. The OS and SystemUI were not restarted. Temporary APKs and the exclusive device lease were removed afterward.

Samsung refused shell cross-user access for this profile-specific deployment, so its PackageInstaller sessions used the already authorized root connection. The regular-user emulator installations above used shell UID2000. After the update, the user confirmed that Gemini remained signed in and returned a chat reply. This user confirmation is separate from the automated APK/data checks. Deployment evidence is local-only in `local/issue8/auto-clone/device-update/`.

## Reproduction and local records

```sh
scripts/build-all.sh
scripts/sign-apks.sh
scripts/build-mpp.sh
python3 scripts/emulator/test-issue8-options.py
```

The standard build scripts now pass only `-p build/gemini-patches.jar`; all required clone behavior is in the bundle. APK inputs are pinned by `config/inputs.sha256`. For the Android12 pair and full before/after emulator commands, see [Android12 verification](issue-8-android12.md); the fixture builder now also uses only the default selection for fixed outputs. The baseline and deliberately bad fixtures still use the historical official Clone app configuration to reproduce the old failures.

Local-only evidence is under `local/issue8/auto-clone/`: `default-build.log`, `options/results.json`, `emulator-api31/results.json`, `emulator-api36/results.json`, and the corresponding assertion logs. The original APKs, signed APKs, signing keys and raw device logs are not committed or released.
