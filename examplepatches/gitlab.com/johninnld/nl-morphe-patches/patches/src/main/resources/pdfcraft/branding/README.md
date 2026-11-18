# PdfCraft branding artwork

Two Adobe Acrobat icon images supplied for this patch are converted into adaptive
launcher icons. The glyph becomes a white 432×432 foreground (18dp inset in the
108dp canvas, original proportions kept) that also serves as the monochrome layer.

- `acrobat`: the flat 2020 icon. Background is its solid red (#B30B00).
- `acrobat_classic`: the earlier gradient icon. Its gradient is fitted as a smooth
  cubic surface over the non-glyph pixels and rendered across the full 108dp canvas
  as `morphe_pdfcraft_backdrop.png`.

Each style also has a 192×192 legacy launcher PNG. `sources.json` records the
original filenames and SHA-256 digests.

Adobe and Acrobat are trademarks of Adobe Inc. These are user-selected launcher
artwork and do not imply affiliation. PdfCraft for Android remains the upstream application:
https://github.com/artcraft-android/pdfcraft-android, built on
https://github.com/storytold/pdfcraft (MIT OR Apache-2.0). No PdfCraft source is
copied or relicensed by this resource patch.
