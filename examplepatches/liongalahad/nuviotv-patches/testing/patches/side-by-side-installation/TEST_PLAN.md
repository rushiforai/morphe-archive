# Test plan

- [x] Run `SideBySideManifestTest` for package, label, permission, multi-authority, class-name preservation, and fail-closed cases.
- [x] Build the patch list and confirm `Side-by-side installation` is selected by default.
- [ ] Apply only this patch to each hash-pinned official APK asset and inspect the resulting package, label, permission, and provider authorities.
- [x] Apply all patches together and confirm every base and patch-added authority uses the `com.nuvio.morphe` prefix exactly once.
- [x] Install official `com.nuvio.tv`, then install patched `com.nuvio.morphe` without uninstalling or replacing either app.
- [x] Launch both package identities independently; Android keeps their preferences, accounts, data, and permission grants in separate package sandboxes.
- [ ] Deselect this patch in Morphe Manager and confirm the output retains package `com.nuvio.tv` and replacement-install behavior.
- [ ] Confirm install and launch logs contain no provider collision, `ClassNotFoundException`, `VerifyError`, crash, or ANR.
- [ ] Before stable release, repeat install, launch, upgrade, and uninstall isolation on a real Android TV and commit a validation report.

## Automated evidence — 2026-08-16

- The complete 173-test extension suite and the patcher unit tests passed.
- Exclusive x86_64 application produced package `com.nuvio.morphe`, label `Nuvio Morphe`, the renamed custom permission, and five unique renamed base-provider authorities.
- The exclusive output installed and launched on `Television_4K` as `com.nuvio.morphe/com.nuvio.tv.MainActivity` while `com.nuvio.tv` remained installed; the startup log contained no fatal exception, ANR, or `VerifyError`.
- Combined x86_64 application applied all ten patches without failure and produced seven unique `com.nuvio.morphe` authorities, including the settings and local-subtitle providers, with no remaining `com.nuvio.tv` authority.
- Generated APKs, screenshots, logs, and manifests remain under ignored `local/patches/side-by-side-installation/`.

## NuvioTV 0.8.5-beta automated port evidence

- [x] The 198-test extension suite passed with zero failures, errors, or skips.
- [x] This patch applied alone with an exact single match on x86_64, arm64-v8a, armeabi-v7a, and universal official APKs.
- [x] Each isolated output passed SHA-256 input verification plus post-patch manifest, injected-class, and forbidden-type inspection.
- [x] The combined ten-patch x86_64 and universal builds applied without a failed patch and passed APK signature and alignment verification.
- [x] The combined x86_64 side-by-side build installed and launched on `Television_4K`; its process remained alive with no startup `FATAL EXCEPTION`, `VerifyError`, or package ANR.
- [ ] Patch-specific D-pad, persistence, navigation, playback, and media behavior remains manual and is not marked passed by this automated port.
- [ ] Real Android TV acceptance remains pending.

## 2026-08-19 NuvioTV 0.8.6-beta port evidence

- [x] The final 198-test extension suite and three patcher manifest tests passed with zero failures, errors, or skips.
- [x] This patch applied alone on the official x86_64, arm64-v8a, armeabi-v7a, and universal APKs with no fingerprint, rebuild, signing, manifest, injected-class, or forbidden-type inspection failure.
- [x] The final combined x86_64 and universal builds applied all ten patches with zero failures and passed APK alignment plus v2/v3 signature verification.
- [x] The final x86_64 side-by-side build installed on `Television_4K`; Morphe settings, Library Saved/Cloud/Storage, H.264 Media3 playback, and end-of-file return to Storage completed without an app fatal, `VerifyError`, or package ANR.
- [ ] Patch-specific external-service, removable-storage, network, source-selection, subtitle-content, and real-TV behavior remains manual unless separately recorded above.

## 2026-08-22 NuvioTV 0.8.7-beta port evidence

- [x] The final 195-test extension suite and three patcher manifest tests passed with zero failures, errors, or skips.
- [x] This patch applied alone on the official x86_64, arm64-v8a, armeabi-v7a, and universal APKs with no fingerprint, rebuild, signing, manifest, injected-class, or forbidden-type inspection failure.
- [x] The final combined x86_64 build applied all nine retained patches with zero failures and passed APK alignment plus signature verification.
- [x] The final x86_64 side-by-side build installed on `Television_4K`; Morphe Settings opened, native category and switch rows rendered, and the Local Downloads slider rendered with no app fatal, `VerifyError`, or reflection failure.
- [ ] Patch-specific playback, network, storage, subtitle-content, source-selection, D-pad, and real-TV behavior remains manual unless separately recorded above.

## 2026-08-23 0.8.7 runtime evidence

- The official x86_64 `com.nuvio.tv` APK and combined nine-patch `com.nuvio.morphe` APK installed simultaneously on the API 36 Android TV emulator with distinct package paths.
- Both launcher activities started successfully and retained separate live process IDs. Launching either package did not uninstall, replace, or resolve through the other package.
