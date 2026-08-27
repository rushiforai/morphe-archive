# Testing

## Layers

1. Unit: extension cleaner/runtime behavior and Android span/Media3 object preservation.
2. Application: hash the official APK, build `.mpp`, select one patch in exclusive mode, and require all fingerprints to resolve once on both x86_64 and universal assets.
3. Inspection: verify initialization provider and metadata in the manifest, injected selector/dialog classes, preference hook, and cue hook.
4. Phone Manager: add the public GitHub source on `Pixel_10`, select one patch, export using the dedicated test key policy, and install the result on the TV target.
5. TV AVD: install/launch on `Television_4K`; collect logcat, screenshot, UI hierarchy, device facts, patch result, input/bundle digests, and the manual checklist.
6. Real Android TV: install, D-pad navigate, check persistence through force-stop/reboot, run Media3 playback/seeking/track changes, and record exact device/version/ABI results.

## Commands

```powershell
.\scripts\build.ps1 -Patch sdh-annotations
.\scripts\patch.ps1 -Patch sdh-annotations
.\scripts\patch.ps1 -Patch sdh-annotations -Abi universal
.\scripts\test.ps1 -Patch sdh-annotations -Device tv
.\scripts\test.ps1 -Patch sdh-annotations -Device tv -Asset universal
.\scripts\test.ps1 -Patch sdh-annotations -Device phone
.\scripts\test.ps1 -Patch sdh-annotations -Device real -Serial <adb-serial>
.\scripts\verify-all.ps1
```

`test.ps1` automates preparation and evidence but leaves behavioral checkboxes unchecked. A human must verify actual subtitle rendering and D-pad navigation. Real-device uninstall is never implicit; `-ReplaceOfficial` is required when signatures conflict.

## SDH sample assertions

Open the single `SDH subtitle processing` selector and visually compare its modal with Nuvio's Playback selector: width, padding, title, descriptions, focus border, selected fill, checkmark, D-pad order, dismissal, and current-value subtitle must match. Confirm a fresh preference defaults to `Normalize music symbols only`. With `Off`, use the exact source text. With `Normalize music symbols only`, verify mojibake and repeated inferred boundary tokens become note symbols without removing text. With `Remove SDH, keep lyrics`, verify supported single-line and multiline bracket/parenthetical blocks, speaker labels, and music descriptions disappear while likely lyrics remain with normalized markers. With `Full cleanup`, verify complete normal, mojibake, and inferred note-bounded lyrics and inline paired-note segments also disappear. In both cleanup modes, verify outside text, times, URLs, ratios, punctuation, cue timing/position, non-text cues, and surviving spans remain. Repeat after seeking and changing tracks; verify exactly one mode remains selected after force-stop and reboot.
