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
