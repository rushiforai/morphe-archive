# Rank badge selector

Independent Morphe patch for original Waze 5.24.5.0. Select **Rank badge selector** in the shared `dist/waze-theme-selector-1.7.5.mpp` bundle. It does not require themes, icon sizing or mood unlocking. The older standalone `dist/waze-badge-selector-1.0.0.mpp` remains available; do not enable duplicate copies from both sources.

Open **Waze menu > View profile > Mood > Badge appearance**. Choose Automatic (account badge), No badge, Crown, Sword, Shield, Map editor or Wings. The preference persists between launches. Automatic runs Waze's original badge renderer without changing the account-provided badge value.

This changes the badge drawn on this phone where Waze uses its own-profile badge renderer. It does not change server-side rank, contribution counts, permissions, or the badge sent to other users. The previously tested mood selection is a separate mechanism. Public badge changes have not been implemented or established.

## Files and installation

- `dist/waze-badge-selector-1.0.0.mpp`: import as a local source in Morphe; enable Rank badge selector.
- `dist/waze-5.24.5.0-colours-moods-badges-arm64.apk`: combined ARM64 build containing the colour, mood-unlock and badge patches.
- `dist/patch-result-badges-arm64.json`: successful Morphe patch result.
- `dist/validation-badges-bytecode.txt`: canonical DEX comparison.

The combined APK uses the existing Desktop signing key and was installed as an update using the previously verified Android Auto installer handoff. It retains the working Play Store installing-package / Google Package Installer initiating-package metadata. The cancelled vehicle and voice work is not included.

## Implementation

The patch inserts a preference row between the Mood screen header and existing list. It does not add ListView headers, so Waze's item-position click handler remains valid. A native Android single-choice dialog saves the badge preference in a separate private SharedPreferences file.

`MoodManager.getUpScaledAddonDrawable(Context)` reads the preference. Automatic preserves the entire original renderer; other selections return the matching original Waze drawable or no badge. The account's `mAddonIndex` is not modified, and the extension performs no network calls.

Only the existing MoodManager and MoodsActivity classes are patched, with four extension classes added by D8 (selector and listener implementations). All 60,842 original classes remain present; canonical comparison confirms all other original classes are unchanged. Map assets, resource table, manifest and native libraries match the preceding colour/mood build. Signature and 16 KiB ZIP alignment pass. Individual car-display behaviour is outside this patch.

## Build

Requires the same JDK/Android SDK dependencies as the other patches. Run `BuildBadges.ps1`. It compiles the Java extension, packages its DEX inside the independent MPP, and verifies Morphe can load it.

```powershell
.\BuildBadges.ps1
& "$env:JAVA_HOME\bin\java.exe" -Xmx1536m -jar tools\morphe-desktop.jar patch --bytecode-mode STRIP_SAFE -p dist\waze-maps-skin-2.0.0.mpp -p dist\waze-driver-icons-1.0.0.mpp -p dist\waze-badge-selector-1.0.0.mpp -o dist\waze-5.24.5.0-colours-moods-badges-arm64.apk -r dist\patch-result-badges-arm64.json downloads\waze-5.24.5.0-arm64.apkm
```
