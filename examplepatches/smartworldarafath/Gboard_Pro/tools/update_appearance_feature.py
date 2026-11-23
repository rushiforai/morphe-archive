with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAppearanceFeature.java', 'r', encoding='utf-8') as f:
    text = f.read()

# Update themeSwatches
old_swatches = '''        int[][] themeSwatches = {
                {0xFF542983, 0xFFEBD7FA, 0xFF7E57C2, 0xFFF7EFFA},
                {0xFFB80058, 0xFFF6B0CA, 0xFFC2185B, 0xFFFDE7E9},
                {0xFFD35A2D, 0xFFFD987C, 0xFFBF360C, 0xFFFDE8E7},
                {0xFF046665, 0xFFD4FAEF, 0xFF00695C, 0xFFEFF5F5},
                {0xFF1A73E8, 0xFFE8F0FE, 0xFF4285F4, 0xFFF1F3F4}
        };'''

new_swatches = '''        int[][] themeSwatches = {
                {0xFF522781, 0xFFE4CEFF, 0xFF7E57C2, 0xFFF5EFF9},
                {0xFFB80056, 0xFFFFAACD, 0xFFC2185B, 0xFFFFE7EB},
                {0xFFD05A2C, 0xFFFF936F, 0xFFBF360C, 0xFFFEE9E6},
                {0xFF036564, 0xFFCEEED6, 0xFF00695C, 0xFFEFF5F3},
                {0xFF0854C4, 0xFFBBDCFB, 0xFF4285F4, 0xFFEBF3FE}
        };'''

if old_swatches in text:
    text = text.replace(old_swatches, new_swatches)
    with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAppearanceFeature.java', 'w', encoding='utf-8') as f:
        f.write(text)
    print("Updated GboardAppearanceFeature.java swatches!")
else:
    print("Old swatches not found, checking...")
