## Gboard Pro v2.0.5 (Beta)

### Overview
Gboard Pro version 2.0.5 (Beta) resolves an application crash occurring when accessing the Clipboard settings section by fully aligning the clipboard configuration with the upstream PixelBoard implementation.

### Key Changes and Fixes

1. Clipboard Section Crash Fix
- Identified root cause of the immediate crash upon entering Clipboard settings: a NumberFormatException caused by a non-numeric retention value ("never") inside the native duration array being parsed via Integer.parseInt.
- Realigned array_0x7f03004a with the upstream PixelBoard reference implementation to contain valid discrete numeric hourly retention intervals: 1, 2, 3, 6, 12, 18, and 24 hours.
- Removed extraneous android:entries attribute in res/xml/setting_clipboard.xml to allow Gboard's native preference binding logic to dynamically and safely construct localized plural summary labels.
- Validated that array definitions, string identifiers, and XML preference declarations across the clipboard section match PixelBoard with complete fidelity.

2. Enhanced Clipboard Synchronization Runtime
- Updated GboardClipboardSyncRuntime with upstream reflection-safe ContentObserver dispatching and screenshot check handling.
- Enhanced stability on OEM skins (Samsung One UI, Vivo OriginOS/FuntouchOS) during foreground input focus transitions.

3. Versioning and Maintenance
- Updated patch version to 2.0.5 (Beta) across extension configuration and visual preview interfaces.
- Maintained all existing baseline customizations including background update checking, notification support, and Pro section organization.

### Technical Specifications
- Package Name: com.gboardpro.app
- Target Version: 18.4.1.985164140-release-arm64-v8a
- Build Architecture: arm64-v8a
- Signature Verification: APK Signature Scheme v3 verified
