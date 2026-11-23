## Gboard Pro v2.0.3 (Beta 3.3)

### What's New & Highlights

1. **Full App UI Dynamic Colors (Appearance Section Fix)**:
   - Fixed the dynamic theming engine so that selecting an Appearance theme now applies across the entire app UI, including all Gboard Settings sub-screens (Voice typing, Preferences, Languages, Corrections, Theme, Dictionary, Privacy, Pro, About, App Updates):
     - **Blush Lilac**:
       - Soft pastel lilac window background (`#F5EFF9`)
       - Lilac pill card container (`#E4CEFF`)
       - Deep royal violet accents (`#522781`) on switches, radio buttons, preference category headers, back navigation icons, and active controls
       - Matched to `Gemini_Generated_Image_5to93x5to93x5to9.jpg`
     - **Cotton Candy**:
       - Powder rose pink window background (`#FFE7EB`)
       - Candy pink pill card container (`#FFAACD`)
       - Vivid raspberry magenta accents (`#B80056`) on switches, radio buttons, preference category headers, back navigation icons, and active controls
       - Matched to `Gemini_Generated_Image_jg0bxijg0bxijg0b.jpg`
     - **Sunset Peach**:
       - Warm peach window background (`#FEE9E6`)
       - Apricot coral pill card container (`#FF936F`)
       - Terracotta burnt orange accents (`#D05A2C`) on switches, radio buttons, preference category headers, back navigation icons, and active controls
       - Matched to `Gemini_Generated_Image_rbx9iwrbx9iwrbx9.jpg`
     - **Fresh Mint**:
       - Pale sage mint window background (`#EFF5F3`)
       - Light mint pill card container (`#CEEED6`)
       - Deep pine emerald teal accents (`#036564`) on switches, radio buttons, preference category headers, back navigation icons, and active controls
       - Matched to `Gemini_Generated_Image_jc2k91jc2k91jc2k.jpg`
     - **Default (System Dynamic)**:
       - Restores native Material You Monet wallpaper-based system palette

2. **Dual-Layer Theming Architecture**:
   - Injected Material 3 theme style overlays (`GboardProTheme_*`) into resource styles for native attribute resolution.
   - Integrated dynamic View Hierarchy Stylist in `GboardM3Helper` that automatically colors toolbars, category headers, preference icons, radio buttons, and switch controls on any fragment navigation.
   - Automatically detects theme changes on resume and updates active settings screens seamlessly.

3. **Clipboard Section Cleanup**:
   - Completely reverted and removed all previous custom modifications in the Clipboard section.
   - Restored original standard history retention slider without any custom sliders or auxiliary activities.
   - Kept all other sections, features, and preferences intact without collateral modifications.

4. **Safety & Stability Safeguards**:
   - Preserved IME InputMethodService transparency to prevent any screen blocking during typing.
   - Fully tested and verified across all activities with zero regressions or crashes.
