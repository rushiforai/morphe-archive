## Gboard Pro v2.0.4 (Beta)

### Overview
Gboard Pro version 2.0.4 (Beta) rolls back the full-application dynamic theming experiments introduced in v2.0.3 and cleanly purges all custom additions from the Clipboard section, restoring it to original stock Gboard functionality.

### Key Changes and Improvements

1. Rollback of v2.0.3 Full-App Dynamic Theming
- Reverted all injected Material 3 theme style overlays (GboardProTheme_*) from application resources.
- Removed runtime view hierarchy styling traversal and layout listeners from GboardM3Helper.
- Removed custom theme hooks from SettingsActivity and LatinFirstRunActivity to eliminate rendering anomalies across standard settings screens.
- Restored stable baseline theme engine and appearance behavior.

2. Complete Removal of Custom Clipboard Additions
- Completely removed custom clipboard retention slider options and auxiliary retention activity declarations.
- Removed GboardClipboardPreferenceHelper and GboardCustomClipboardRetentionActivity classes and smali references.
- Removed custom slider hooks from LabelSummarySliderPreference smali.
- Restored original stock Gboard clipboard preference structure and standard history retention options (1 hour, 24 hours, 7 days, 30 days, Never).

3. Core Feature Continuity
- Preserved background update check service (8-hour interval) and notification permission management.
- Preserved Material 3 Expressive redesign of the About section.
- Preserved Pro section organization and appearance selection within extension interfaces.
- Preserved IME window transparency to guarantee uninterrupted keyboard rendering.

### Release Artifacts
- Package Name: com.gboardpro.app
- Patch Version: 2.0.4 (Beta)
- Target Architecture: arm64-v8a
- Signature: APK Signature Scheme v1, v2, and v3 verified
