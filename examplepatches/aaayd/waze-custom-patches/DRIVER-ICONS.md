# Unlock driver moods

A separate Morphe patch for original Waze 5.24.5.0. Select **Unlock driver moods** in the shared `dist/waze-theme-selector-1.7.5.mpp` bundle. It does not require themes, icon sizing or the badge selector. The older standalone `dist/waze-driver-icons-1.0.0.mpp` remains available; do not enable duplicate copies from both sources.

## Behaviour

- Removes the local baby-mileage and editor-level mood eligibility checks.
- Enables the beta-mood section in the existing picker.
- Includes special/hidden entries returned by the local native mood catalogue. Entries without available drawable assets are still omitted by Waze's existing UI.
- Includes Robot, 8-bit and Dino editor moods. Some special moods can also appear under the everyday catalogue because its special-entry filter is disabled.
- Bundle 1.17 preserves Waze's original sorting flags for both catalogues, including builds that share a Boolean argument register. It supports both the original JNI loader and the inherited protobuf loader used by Waze 5.28.5.0.

This is a mood-picker patch. It does not grant editor permissions, beta programme membership or account ranks, and does not unlock unrelated vehicle models or fetch every expired campaign asset.

## What other people see

Selection still calls Waze's original `setWazerMood` and native setter. The native function stores the chosen mood and uses the normal synchronisation path. Public visibility, server acceptance and persistence across a server refresh have not been verified using another account. Do not assume an unlocked beta/editor icon is guaranteed to appear to other users.

## Original 5.24.5.0 device verification

Morphe Desktop successfully applied the independent icon patch together with the existing colour patch. The combined APK was installed as a same-signer update, preserving the previous skin and working Android Auto installer metadata. Waze launched and its populated Mood picker opened.

Canonical DEX comparison checked all 60,842 classes: only `MoodManager` and `MoodsActivity` changed, and no classes were added or lost. Decompiled output confirms `canSetMood` returns true, `isBaby` returns false, the beta section is enabled, and the catalogue calls include special entries. All non-DEX app contents, including map skins, resources, native libraries and manifest, match the previous colour build. Signature and 16 KiB ZIP alignment verification pass.

Individual mood selection, persistence and public visibility were not runtime-verified. UI checks stopped while the user was interacting with the phone.

## Build

Run `Build.ps1` once to obtain the pinned Morphe Desktop dependency if needed, then `BuildIcons.ps1`. The regular skin JAR excludes the icon patch; `iconsJar` contains only the independent icon patch.

```powershell
.\BuildIcons.ps1
& "$env:JAVA_HOME\bin\java.exe" -Xmx1536m -jar tools\morphe-desktop.jar patch --bytecode-mode STRIP_SAFE -p dist\waze-maps-skin-2.0.0.mpp -p dist\waze-driver-icons-1.0.0.mpp -o dist\waze-5.24.5.0-google-colours-icons-arm64.apk -r dist\patch-result-icons-arm64.json downloads\waze-5.24.5.0-arm64.apkm
```

The combined APK uses the existing Desktop signing key. Installing an APK signed by a different Morphe Manager key will not update it in place. The same Android Auto installation procedure is documented in `references/android-auto-installer-investigation.md`.
