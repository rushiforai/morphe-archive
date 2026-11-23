## Gboard Pro v1.0.9 (Beta)

### What's New & Improvements

1. **Initial Setup Process & First Run Wizard Restored**:
   - Resolved an issue where fresh installs did not prompt the 3-step keyboard activation flow (`LatinFirstRunActivity`).
   - The launcher entrypoint now intelligently detects whether Gboard Pro is enabled in system input method settings and designated as the default keyboard (`rxp.n()` and `rxp.p()`).
   - If not yet activated, it automatically opens the 3-step setup wizard so users can easily enable and select Gboard Pro. If already active, it seamlessly launches Settings.

2. **Butter-Smooth Slide Animations & Jerk/Pop Elimination**:
   - Refined the entering and exiting slide transitions (`m3_slide_in_right`, `m3_slide_out_left`, `m3_slide_in_left`, `m3_slide_out_right`).
   - Eliminated sudden opacity drops and end-of-animation jerks by ensuring full alpha and translation completion across all 280ms cycles.
   - Cleared fragment transition style flags to prevent competing system fade animations.
   - Added identical Material 3 sliding enter and exit animations to the **Theme** section.

3. **Advanced Settings Parity & Immediate Content Rendering**:
   - Directly linked "Advanced Settings" in the Pro section to `GboardAdvancedSettingsFeature`, eliminating empty state checks and ensuring all toggles appear instantly without requiring manual refresh.
   - Added the **Frequently used emojis** preference toggle with real-time Phenotype flag integration (`enable_frequent_emoji_recent_tab` and `enable_emoji_frequent_recent_switch_option`), matching PixelBoard's feature set.
   - All 5 core features are immediately accessible: Enable AI Writing Tools, Support All Keyboards, Enable Advanced Voice Typing, Rounded Keys, and Frequently used emojis.

4. **Smooth Transitions for Pro Section Sub-Pages**:
   - Integrated directional slide and alpha animations inside `GboardPatchesSettingsActivity` when navigating between the Pro hub and its child sections (**Appearance**, **Board UI**, and **Advanced Settings**).
   - Child pages smoothly slide in from the right on enter, and slide back from the left on return.
