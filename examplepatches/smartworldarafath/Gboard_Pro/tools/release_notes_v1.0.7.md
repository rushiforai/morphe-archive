## Gboard Pro v1.0.7 (Beta)

### What's New & Improvements

1. **Keypress Vibration Scaling Fix**:
   - Resolved an issue where vibration strength on keypress only functioned at default setting and failed when scaled.
   - Implemented `GboardHapticHelper` with device-aware amplitude control detection (`hasAmplitudeControl`), fallback to standard amplitude for devices lacking HAL variable amplitude support, and scaled duration (5ms - 100ms).
   - Added dynamic live vibration feedback preview while dragging the keypress vibration duration slider in Settings.

2. **Redesigned Appearance Section**:
   - Completely revamped the Appearance UI to mirror Material 3 theme styling with elevated surface cards.
   - Added live 4-color palette swatch previews for each theme (Primary, Container, Accent, Background) across Default Dynamic, Expressive Rainbow, Fresh Botanical, and Ocean Lavender palettes.
   - Clean active selection indicators and high-contrast typography.

3. **Dedicated 'Pro' Hub in Root Settings**:
   - Added a new top-level **Pro** section placed directly beneath **About**.
   - Consolidated **Appearance**, **Board UI**, and **Advanced Settings** into this unified hub for cleaner root settings navigation.

4. **Universal Smooth Transitions**:
   - Unified motion transitions across all fragments and activities (`m3_slide_in_right`, `m3_slide_out_left`, `m3_slide_in_left`, `m3_slide_out_right`).
   - All standard and custom settings screens now enter and exit with identical fluid animations.

5. **App Icon Selection Cleanup**:
   - Removed the experimental multi-icon picker from Appearance.
   - Retained the single default app icon launcher configuration.

6. **Advanced Settings Text & Visual Parity**:
   - Generated and integrated the comprehensive localized strings catalog (`GboardSettingsTextCatalog`) containing 106 keys across 19 locales.
   - Resolved all blank/missing titles and descriptions in Advanced Settings, achieving complete parity with PixelBoard.
