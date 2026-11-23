path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java'
with open(path, 'r', encoding='utf-8') as f:
    text = f.read()

target = '            // Material 3 Expressive Multi-Color Theme Overrides'
new_themes = '''            // Material 3 Expressive Multi-Color Theme Overrides
            if ("blush_lilac".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF181122, // windowBackground (Deep amethyst)
                            0xFF241C2E, // surface
                            0xFF322840, // surfaceAlt
                            0x44D0BCFF, // surfaceStroke
                            0xFFF5EEFF, // textPrimary
                            0xFFCCC2DC, // textSecondary
                            0xFFD0BCFF, // accent (Soft Lilac)
                            0xFF4F378B, // accentContainer
                            0xFFEADDFF, // onAccentContainer
                            0x33D0BCFF, // ripple
                            true
                    );
                } else {
                    return new Palette(
                            0xFFF8F2FA, // windowBackground (Showcase light pink / pastel lilac)
                            0xFFFFFFFF, // surface (Crisp white elevated cards)
                            0xFFF3EAF6, // surfaceAlt (Tinted tonal elements)
                            0x337E57C2, // surfaceStroke (Delicate lilac outline)
                            0xFF1D162B, // textPrimary (Deep eggplant)
                            0xFF5B4F6E, // textSecondary (Slate violet)
                            0xFF7E57C2, // accent (Vibrant violet switch/button from showcase.png)
                            0xFFEBDDFB, // accentContainer (Pastel lavender container)
                            0xFF2A0054, // onAccentContainer
                            0x267E57C2, // ripple
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
                            0xFFFDF2F7, // windowBackground (Soft pastel rose)
                            0xFFFFFFFF, // surface
                            0xFFFCE4EC, // surfaceAlt
                            0x33D81B60, // surfaceStroke
                            0xFF2B121C, // textPrimary
                            0xFF6B4354, // textSecondary
                            0xFFD81B60, // accent
                            0xFFF8BBD0, // accentContainer
                            0xFF4A0023, // onAccentContainer
                            0x26D81B60, // ripple
                            false
                    );
                }
            } else'''

norm_text = text.replace('\r\n', '\n')
norm_target = target.replace('\r\n', '\n')
norm_rep = new_themes.replace('\r\n', '\n')

if norm_target in norm_text:
    norm_text = norm_text.replace(norm_target, norm_rep, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_text)
    print("Updated GboardM3Helper with blush_lilac and cotton_candy themes!")
else:
    print("Target not found in GboardM3Helper!")
