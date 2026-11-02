#!/usr/bin/env python3
"""Builds the adaptive launcher icon bundled by the "Marketplace rename" patch.

  python tools/icon/make_icon.py            # needs Pillow + numpy

Input : tools/icon/preview.webp  (white storefront glyph on a flat #1A1A1A square)
Output: patches/src/main/resources/marketplace-icon/
          mipmap-{m,h,xh,xxh,xxxh}dpi/marketplace_adaptive_foreground.png   white glyph, transparent bg
          drawable/marketplace_adaptive_background.xml                       solid #1A1A1A
          mipmap-anydpi/marketplace_launcher.xml                             <adaptive-icon> (+ monochrome)
        tools/icon/preview-rendered.png                                      circle / squircle / square preview

The glyph's alpha is recovered from its luminance (background level -> 0, white -> 255), so the
anti-aliased edges survive. The foreground canvas is 108dp; the glyph is scaled to SCALE dp per
source pixel and centred, which keeps it inside Android's 66dp adaptive-icon safe zone.
"""
import pathlib, numpy as np
from PIL import Image, ImageDraw

HERE = pathlib.Path(__file__).resolve().parent
OUT = HERE.parent.parent / "patches/src/main/resources/marketplace-icon"
BG = (26, 26, 26)           # #1A1A1A, sampled from the source corner
SCALE = 0.100               # dp per source pixel: the 522px-wide glyph becomes ~52dp of the 108dp canvas
DENSITIES = {"mdpi": 1, "hdpi": 1.5, "xhdpi": 2, "xxhdpi": 3, "xxxhdpi": 4}

src = Image.open(HERE / "preview.webp").convert("L")
lum = np.asarray(src, dtype=np.float32)
alpha = np.clip((lum - BG[0]) / (255 - BG[0]), 0, 1)
glyph = np.zeros((*alpha.shape, 4), np.uint8)
glyph[..., :3] = 255
glyph[..., 3] = (alpha * 255).round().astype(np.uint8)
glyph = Image.fromarray(glyph, "RGBA")

def foreground(px_per_dp):
    canvas = 108 * px_per_dp
    side = round(glyph.width * SCALE * px_per_dp)
    g = glyph.resize((side, side), Image.LANCZOS)
    out = Image.new("RGBA", (round(canvas),) * 2, (255, 255, 255, 0))
    off = (round(canvas) - side) // 2
    out.paste(g, (off, off))
    return out

for name, d in DENSITIES.items():
    p = OUT / f"mipmap-{name}"; p.mkdir(parents=True, exist_ok=True)
    foreground(d).save(p / "marketplace_adaptive_foreground.png", optimize=True)

(OUT / "drawable").mkdir(parents=True, exist_ok=True)
(OUT / "drawable/marketplace_adaptive_background.xml").write_text(
'''<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <solid android:color="#FF1A1A1A" />
</shape>
''')
(OUT / "mipmap-anydpi").mkdir(parents=True, exist_ok=True)
(OUT / "mipmap-anydpi/marketplace_launcher.xml").write_text(
'''<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@drawable/marketplace_adaptive_background" />
    <foreground android:drawable="@mipmap/marketplace_adaptive_foreground" />
    <monochrome android:drawable="@mipmap/marketplace_adaptive_foreground" />
</adaptive-icon>
''')

# --- preview: what a launcher will roughly draw (adaptive mask applied to the 72dp window)
S = 432                                    # xxxhdpi canvas
fg = foreground(4)
full = Image.new("RGBA", fg.size, BG + (255,)); full.alpha_composite(fg)
win = full.crop((S * 18 // 108, S * 18 // 108, S * 90 // 108, S * 90 // 108)).resize((256, 256), Image.LANCZOS)
def masked(kind):
    m = Image.new("L", (256, 256), 0); d = ImageDraw.Draw(m)
    if kind == "circle": d.ellipse((0, 0, 255, 255), fill=255)
    elif kind == "squircle": d.rounded_rectangle((0, 0, 255, 255), radius=80, fill=255)
    else: d.rectangle((0, 0, 255, 255), fill=255)
    o = Image.new("RGBA", (256, 256), (60, 60, 60, 255)); o.paste(win, (0, 0), m); return o
sheet = Image.new("RGBA", (256 * 3 + 40, 296), (60, 60, 60, 255))
for i, k in enumerate(("circle", "squircle", "square")): sheet.paste(masked(k), (10 + i * 266, 20))
sheet.convert("RGB").save(HERE / "preview-rendered.png")
print("wrote", OUT)
