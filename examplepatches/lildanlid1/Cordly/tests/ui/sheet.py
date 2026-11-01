#!/usr/bin/env python3
"""Puts screenshots side by side, scaled, so several pages (or off/on, dark/light) can be compared in one image.
    python3 tests/ui/sheet.py out.png a.png b.png [c.png ...] [--scale 0.6]"""
import sys
from PIL import Image
args = sys.argv[1:]; scale = 1.0
if "--scale" in args: i = args.index("--scale"); scale = float(args[i + 1]); del args[i:i + 2]
out, files = args[0], args[1:]
ims = [Image.open(f).convert("RGB") for f in files]
ims = [im.resize((int(im.width * scale), int(im.height * scale))) for im in ims]
sheet = Image.new("RGB", (sum(im.width for im in ims) + 12 * (len(ims) - 1), max(im.height for im in ims)), (0, 0, 0))
x = 0
for im in ims: sheet.paste(im, (x, 0)); x += im.width + 12
sheet.save(out); print(out, sheet.size)
