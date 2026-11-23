with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'r', encoding='utf-8') as f:
    text = f.read()

target = '''                        if ("blush_lilac".equals(selectedTheme)) {
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
            }'''

replacement = '''                        if ("blush_lilac".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF181122, 0xFF241C2E, 0xFF322840, 0x44D0BCFF,
                            0xFF4F378B, Color.parseColor("#3F2D16"), 0xFF322840,
                            0xFFF5EEFF, 0xFFCCC2DC, 0x77CCC2DC, 0xFFD0BCFF, 0x33D0BCFF);
                } else {
                    return new Palette(
                            0xFFF5EFF9, 0xFFFFFFFF, 0xFFE4CEFF, 0x33522781,
                            0xFFE4CEFF, Color.parseColor("#FEF3C7"), 0xFFF0ECF8,
                            0xFF1F1A24, 0xFF5F4B6E, 0x775F4B6E, 0xFF522781, 0x26522781);
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF1F1117, 0xFF2E1922, 0xFF402330, 0x44FF80AB,
                            0xFF880E4F, Color.parseColor("#3F2D16"), 0xFF402330,
                            0xFFFCE4EC, 0xFFF8BBD0, 0x77F8BBD0, 0xFFFF80AB, 0x33FF80AB);
                } else {
                    return new Palette(
                            0xFFFFE7EB, 0xFFFFFFFF, 0xFFFFAACD, 0x33B80056,
                            0xFFFFAACD, Color.parseColor("#FEF3C7"), 0xFFFCECF2,
                            0xFF201A1B, 0xFF6D4352, 0x776D4352, 0xFFB80056, 0x26B80056);
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF1C1310, 0xFF281C17, 0xFF372720, 0x44FF8A65,
                            0xFF5D2416, Color.parseColor("#3F2D16"), 0xFF372720,
                            0xFFFBE9E7, 0xFFFFCCBC, 0x77FFCCBC, 0xFFFF7043, 0x33FF7043);
                } else {
                    return new Palette(
                            0xFFFEE9E6, 0xFFFFFFFF, 0xFFFF936F, 0x33D05A2C,
                            0xFFFF936F, Color.parseColor("#FEF3C7"), 0xFFFDF0EC,
                            0xFF241A16, 0xFF6E443A, 0x776E443A, 0xFFD05A2C, 0x26D05A2C);
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF0E1815, 0xFF162520, 0xFF20342E, 0x4480CBC4,
                            0xFF0E3E37, Color.parseColor("#3F2D16"), 0xFF20342E,
                            0xFFE0F2F1, 0xFFB2DFDB, 0x77B2DFDB, 0xFF4DB6AC, 0x334DB6AC);
                } else {
                    return new Palette(
                            0xFFEFF5F3, 0xFFFFFFFF, 0xFFCEEED6, 0x33036564,
                            0xFFCEEED6, Color.parseColor("#FEF3C7"), 0xFFEEFAF6,
                            0xFF191C1B, 0xFF3F5C5A, 0x773F5C5A, 0xFF036564, 0x26036564);
                }
            }'''

if target in text:
    text = text.replace(target, replacement)
    with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'w', encoding='utf-8') as f:
        f.write(text)
    print("Updated GboardPatchesSettingsActivity palette successfully!")
else:
    print("Target not found")
