# Pixkk Patches

A Morphe patch bundle for TikTok 47.5.3. Add `https://github.com/pixkk/pixkk-patches` as a source in Morphe Manager.

## Patches

- Expand description in place
- Sound name under description
- Scroll sound name
- Favorites button in share menu
- Right column spacing
- Don't open comments on icon swipe
- Comment menu rows
- Centered comment menu
- Animated profile covers
- Old-style seeking
- Old-style counts
- Discover tab
- Settings row and Settings menu row (the Pixkk Patches page in Settings and privacy)

## Code from other projects

The bundle is built on the same patch framework as [Hushfeed](https://github.com/SysAdminDoc/hushfeed), which in turn builds on [Morphe Patches](https://github.com/MorpheApp/morphe-patches). Some supporting code is taken from them unchanged:

- from Hushfeed: the helper code under `patches/src/main/kotlin/app/morphe/util/` and `.../tiktok/shared/` (register handling, instruction checks, fingerprint scopes, bundle verification), and the extension helpers `Reflect`, `GlobalLayoutHook` and `Dim`;
- the build setup (Gradle files and wrapper) follows the same layout.

That code is not a patch. The patches here are only the ones that are not in Hushfeed.

Files that carry a copyright header from those projects keep it.

## License

GPL-3.0, the same license as the projects above. See `LICENSE`.
