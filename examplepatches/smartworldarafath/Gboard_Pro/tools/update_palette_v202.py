import re

# 1. Update GboardAppearanceFeature.java
feat_path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAppearanceFeature.java'
with open(feat_path, 'r', encoding='utf-8') as f:
    feat_code = f.read()

# Update themeKeys, titles, summaries, and swatches in GboardAppearanceFeature.java
new_theme_keys = '''        String[] themeKeys = {
                "blush_lilac",
                "cotton_candy",
                "sunset_peach",
                "fresh_mint",
                "default"
        };
        String[] themeTitles = {
                "Blush Lilac",
                "Cotton Candy",
                "Sunset Peach",
                "Fresh Mint",
                "Default (System Dynamic)"
        };
        String[] themeSummaries = {
                "Signature soft pastel lilac with deep royal purple accents",
                "Gentle powder rose pink with vivid raspberry magenta accents",
                "Warm glowing peach with rich terracotta burnt orange accents",
                "Clean pale mint sage with deep pine teal accents",
                "Material You dynamic wallpaper-based system Monet palette"
        };
        int[][] themeSwatches = {
                {0xFF542983, 0xFFEBD7FA, 0xFF7E57C2, 0xFFF7EFFA},
                {0xFFB80058, 0xFFF6B0CA, 0xFFC2185B, 0xFFFDE7E9},
                {0xFFD35A2D, 0xFFFD987C, 0xFFBF360C, 0xFFFDE8E7},
                {0xFF046665, 0xFFD4FAEF, 0xFF00695C, 0xFFEFF5F5},
                {0xFF1A73E8, 0xFFE8F0FE, 0xFF4285F4, 0xFFF1F3F4}
        };'''

feat_code = re.sub(r'String\[\] themeKeys = \{.*?\};.*?int\[\]\[\] themeSwatches = \{.*?\};', new_theme_keys, feat_code, flags=re.DOTALL)

with open(feat_path, 'w', encoding='utf-8') as f:
    f.write(feat_code)
print("Updated GboardAppearanceFeature.java")

# 2. Update GboardM3Helper.java
m3_path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java'
with open(m3_path, 'r', encoding='utf-8') as f:
    m3_code = f.read()

new_m3_palette_block = '''            // Material 3 Expressive Multi-Color Theme Overrides
            if ("blush_lilac".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF181122, // windowBackground
                            0xFF241C2E, // surface
                            0xFF322840, // surfaceAlt
                            0x44D0BCFF, // surfaceStroke
                            0xFFF5EEFF, // textPrimary
                            0xFFCCC2DC, // textSecondary
                            0xFFD0BCFF, // accent
                            0xFF4F378B, // accentContainer
                            0xFFEADDFF, // onAccentContainer
                            0x33D0BCFF, // ripple
                            true
                    );
                } else {
                    return new Palette(
                            0xFFF7EFFA, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFEBD7FA, // surfaceAlt (Pill container)
                            0x33542983, // surfaceStroke
                            0xFF24152F, // textPrimary
                            0xFF5F4B6E, // textSecondary
                            0xFF542983, // accent (Royal violet switch/radio)
                            0xFFEBD7FA, // accentContainer
                            0xFF24152F, // onAccentContainer
                            0x26542983, // ripple
                            false
                    );
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF1F1117,
                            0xFF2E1922,
                            0xFF402330,
                            0x44FF80AB,
                            0xFFFCE4EC,
                            0xFFF8BBD0,
                            0xFFFF80AB,
                            0xFF880E4F,
                            0xFFFCE4EC,
                            0x33FF80AB,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFFDE7E9, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFF6B0CA, // surfaceAlt (Pill container)
                            0x33B80058, // surfaceStroke
                            0xFF2D121B, // textPrimary
                            0xFF6D4352, // textSecondary
                            0xFFB80058, // accent (Vivid raspberry magenta switch/radio)
                            0xFFF6B0CA, // accentContainer
                            0xFF2D121B, // onAccentContainer
                            0x26B80058, // ripple
                            false
                    );
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF1C1310,
                            0xFF281C17,
                            0xFF372720,
                            0x44FF8A65,
                            0xFFFBE9E7,
                            0xFFFFCCBC,
                            0xFFFF7043,
                            0xFF5D2416,
                            0xFFFFDBCF,
                            0x33FF7043,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFFDE8E7, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFFD987C, // surfaceAlt (Pill container)
                            0x33D35A2D, // surfaceStroke
                            0xFF2D1610, // textPrimary
                            0xFF6E443A, // textSecondary
                            0xFFD35A2D, // accent (Burnt orange terracotta switch/radio)
                            0xFFFD987C, // accentContainer
                            0xFF2D1610, // onAccentContainer
                            0x26D35A2D, // ripple
                            false
                    );
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF0E1815,
                            0xFF162520,
                            0xFF20342E,
                            0x4480CBC4,
                            0xFFE0F2F1,
                            0xFFB2DFDB,
                            0xFF4DB6AC,
                            0xFF0E3E37,
                            0xFFB2DFDB,
                            0x334DB6AC,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFEFF5F5, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFD4FAEF, // surfaceAlt (Pill container)
                            0x33046665, // surfaceStroke
                            0xFF0E1F1E, // textPrimary
                            0xFF3F5C5A, // textSecondary
                            0xFF046665, // accent (Pine teal switch/radio)
                            0xFFD4FAEF, // accentContainer
                            0xFF0E1F1E, // onAccentContainer
                            0x26046665, // ripple
                            false
                    );
                }
            } else if ("ocean".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF101322,
                            0xFF191D32,
                            0xFF232845,
                            0x449FA8DA,
                            0xFFE8EAF6,
                            0xFFC5CAE9,
                            0xFF7986CB,
                            0xFF1E265C,
                            0xFFE8EAF6,
                            0x337986CB,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFF6F8FE,
                            0xFFEEF2FC,
                            0xFFE0E7FA,
                            0x263949AB,
                            0xFF12182E,
                            0xFF3F4A6A,
                            0xFF3949AB,
                            0xFFD1C4E9,
                            0xFF101642,
                            0x263949AB,
                            false
                    );
                }
            }'''

# Replace the theme overrides block in GboardM3Helper
m3_pattern = r'// Material 3 Expressive Multi-Color Theme Overrides.*?else if \("ocean"\.equals\(selectedTheme\)\) \{.*?\n            \}'
m3_code = re.sub(m3_pattern, new_m3_palette_block, m3_code, flags=re.DOTALL)

with open(m3_path, 'w', encoding='utf-8') as f:
    f.write(m3_code)
print("Updated GboardM3Helper.java")

# 3. Update GboardPatchesSettingsActivity.java Palette
act_path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java'
with open(act_path, 'r', encoding='utf-8') as f:
    act_code = f.read()

new_act_palette_block = '''            if ("blush_lilac".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF181122, 0xFF241C2E, 0xFF322840, 0x44D0BCFF,
                            0xFF4F378B, Color.parseColor("#3F2D16"), 0xFF322840,
                            0xFFF5EEFF, 0xFFCCC2DC, 0x77CCC2DC, 0xFFD0BCFF, 0x33D0BCFF);
                } else {
                    return new Palette(
                            0xFFF7EFFA, 0xFFFFFFFF, 0xFFEBD7FA, 0x33542983,
                            0xFFEBD7FA, Color.parseColor("#FEF3C7"), 0xFFEBD7FA,
                            0xFF24152F, 0xFF5F4B6E, 0x775F4B6E, 0xFF542983, 0x26542983);
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF1F1117, 0xFF2E1922, 0xFF402330, 0x44FF80AB,
                            0xFF880E4F, Color.parseColor("#3F2D16"), 0xFF402330,
                            0xFFFCE4EC, 0xFFF8BBD0, 0x77F8BBD0, 0xFFFF80AB, 0x33FF80AB);
                } else {
                    return new Palette(
                            0xFFFDE7E9, 0xFFFFFFFF, 0xFFF6B0CA, 0x33B80058,
                            0xFFF6B0CA, Color.parseColor("#FEF3C7"), 0xFFF6B0CA,
                            0xFF2D121B, 0xFF6D4352, 0x776D4352, 0xFFB80058, 0x26B80058);
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF1C1310, 0xFF281C17, 0xFF372720, 0x44FF8A65,
                            0xFF5D2416, Color.parseColor("#3F2D16"), 0xFF372720,
                            0xFFFBE9E7, 0xFFFFCCBC, 0x77FFCCBC, 0xFFFF7043, 0x33FF7043);
                } else {
                    return new Palette(
                            0xFFFDE8E7, 0xFFFFFFFF, 0xFFFD987C, 0x33D35A2D,
                            0xFFFD987C, Color.parseColor("#FEF3C7"), 0xFFFD987C,
                            0xFF2D1610, 0xFF6E443A, 0x776E443A, 0xFFD35A2D, 0x26D35A2D);
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF0E1815, 0xFF162520, 0xFF20342E, 0x4480CBC4,
                            0xFF0E3E37, Color.parseColor("#3F2D16"), 0xFF20342E,
                            0xFFE0F2F1, 0xFFB2DFDB, 0x77B2DFDB, 0xFF4DB6AC, 0x334DB6AC);
                } else {
                    return new Palette(
                            0xFFEFF5F5, 0xFFFFFFFF, 0xFFD4FAEF, 0x33046665,
                            0xFFD4FAEF, Color.parseColor("#FEF3C7"), 0xFFD4FAEF,
                            0xFF0E1F1E, 0xFF3F5C5A, 0x773F5C5A, 0xFF046665, 0x26046665);
                }
            } else if ("ocean".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF101322, 0xFF191D32, 0xFF232845, 0x449FA8DA,
                            0xFF1E265C, Color.parseColor("#3F2D16"), 0xFF232845,
                            0xFFE8EAF6, 0xFFC5CAE9, 0x77C5CAE9, 0xFF7986CB, 0x337986CB);
                } else {
                    return new Palette(
                            0xFFF6F8FE, 0xFFEEF2FC, 0xFFE0E7FA, 0x263949AB,
                            0xFFE8EAF6, Color.parseColor("#FEF3C7"), 0xFFE0E7FA,
                            0xFF12182E, 0xFF3F4A6A, 0x773F4A6A, 0xFF3949AB, 0x263949AB);
                }
            }'''

act_pattern = r'if \("rainbow"\.equals\(selectedTheme\)\) \{.*?\n            \} else if \("ocean"\.equals\(selectedTheme\)\) \{.*?\n            \}'
act_code = re.sub(act_pattern, new_act_palette_block, act_code, flags=re.DOTALL)

with open(act_path, 'w', encoding='utf-8') as f:
    f.write(act_code)
print("Updated GboardPatchesSettingsActivity.java Palette")
