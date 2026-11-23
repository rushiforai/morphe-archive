## Gboard Pro v2.0.1 (Beta: Dynamic colors)

### What's New & Improvements

1. **Fix: Keyboard Screen Occlusion / Black Block Fix**:
   - Diagnosed and resolved the defect shown in user screenshot `photo_1_2026-10-29_12-48-19.jpg` where typing in apps caused the entire upper screen above the keyboard to be covered in solid opaque black.
   - Root Cause: Setting background colors directly on the `InputMethodService` window/decor view made the full-screen IME dialog window opaque.
   - Fix: Removed window background color overrides in `GboardM3Helper`, explicitly enforced `Color.TRANSPARENT` on the IME dialog window and decor view, and kept display refresh rate enforcement (144Hz/120Hz) completely isolated so host apps remain 100% visible and unblocked.

2. **New Signature Appearance Theme: Blush Lilac (Showcase Light Pink)**:
   - Added the exact light pink / pastel lilac Material 3 Expressive theme matching `showcase.png`.
   - Engineered with soft blush lilac window background (`#F8F2FA`), elevated crisp white surfaces (`#FFFFFF`), delicate border strokes (`#E8DDF0`), and vibrant violet-purple accents (`#7E57C2`).

3. **Expanded Expressive Dynamic Color Palettes in Appearance**:
   - **Blush Lilac (Showcase Pink)**: Signature soft light pink with rich violet-purple accents.
   - **Cotton Candy (Pastel Rose)**: Airy pastel rose pink with gentle sky tones.
   - **Sunset Peach (Warm Apricot)**: Warm glowing peach with soft melon pink accents.
   - **Fresh Mint (Sage Teal)**: Botanical garden sage and fresh spring mint.
   - **Default (System Dynamic)**: Google Material You dynamic wallpaper-based Monet palette.

4. **Interactive Localhost Visual Look Studio**:
   - Deployed live interactive preview on localhost displaying full mobile mockups of the Pro Hub, Appearance theme switcher, Advanced Settings, and Gboard keyboard views.
