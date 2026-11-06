# AMOLED theme

Optional patch, off by default. It is a **build-time resource patch**: it rewrites colour values
while the APK is patched and has no runtime switch. Undoing it means patching again without it.

## What it changes

Every colour whose brightest channel is `0x60` or lower becomes `#000000`, with its alpha kept.
That includes the canvas (`#121212`, `#161823`), the surface grays (`#1b1b1b` to `#333333`), the
borders (`#303030`, `#3a3a3a`) and the light-gray controls (`#545454`). Text and icons above the
threshold are left as they are.

A translucent sheet or scrim such as `#80161823` becomes `#80000000` and keeps its transparency.
`res/values*/colors.xml`, `res/values*/styles.xml`, and the fills in `res/drawable*/*.xml` and
`res/color*/*.xml` are rewritten. In drawables only `solid`, `item` and gradient fills are changed;
a `stroke` keeps its border colour, and vector `fillColor` (an icon) is left alone.

The threshold is `DARK_MAX` in `AmoledPatch.kt`. It is a single constant because this is the total
variant: there is no separate surface or border tier any more.

A second, dependent patch (`AMOLED code colours`) replaces the same opaque surface values when they
are held as constants in the dex instead of as resources. That is what reaches Compose colour
schemes and views that build their background from a literal, such as the Notes composer. It only
runs while it is pulled in by `AMOLED theme`.

## What it does not do

- **It is not a burn-in cure.** Panel aging and power use depend mostly on brightness, static
  bright elements and cumulative screen-on time. A black theme helps large areas, but it does not
  replace lowering brightness or avoiding a static bright UI.
- **It removes the surface and border tiers.** With borders, buttons and cards turned black too,
  the only separation left is text, icons and whatever sits above `DARK_MAX`. That is the trade-off
  of the total variant.
- **It does not cover every screen.** Colours baked into images (PNG, 9-patch), drawn by a WebView
  page, or held in a secondary resource package are outside this patch, so a screen can stay gray.
  Code and Compose constants are handled by the dependent `AMOLED code colours` pass.
- **There is one values set.** TikTok 47.7.x does not ship `values-night`, so a colour shared by
  both themes can change in the light theme too.
- **It cannot be switched off in Tweaks.** The choice is made when the APK is patched.

## Before using it

- Keep the unpatched APK, or be ready to patch again without this patch.
- Check the comment sheet, share sheet, profile panel, Settings, and the light theme.
- If a screen stays gray, note which one. A diagnostic build can log the background colour of
  each view, which is how the remaining values are mapped without guessing.
