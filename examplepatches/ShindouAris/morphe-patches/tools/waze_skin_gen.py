#!/usr/bin/env python3
"""Lists the map colours the Waze Mod changes in Waze's lua skins, for the Morphe patch.

  python tools/waze_skin_gen.py <stock_decode> <modded_decode> <out_skin_colors.txt>

Both are APKEditor decodes. For the day, night, editor day and editor night skins (assets/res/skins/default/skin_values.<variant>.lua) every
`name = rgb(...)`/`rgba(...)` line of the Palette whose value the Mod changes is written as

  [night]
  map_background rgb(0x000000)

The patch rewrites those lines in Waze's own lua at patch time instead of shipping the Mod's copies of the files.
Each name must be a single line of the stock skin and of the experiment skin next to it; this checks that.
"""
import os
import re
import sys

PAT = re.compile(r"^([ \t]*)([A-Za-z_][A-Za-z_0-9]*)([ \t]*=[ \t]*)(rgba?\([^)]*\))", re.M)
VARIANTS = ("day", "night", "editor.day", "editor.night")
DIRS = ("", "experiment/")


def skin(decode, directory, variant):
    path = os.path.join(decode, "root", "assets", "res", "skins", "default", directory, "skin_values.%s.lua" % variant)
    return open(path, encoding="utf-8").read()


def main():
    stock, mod, out = sys.argv[1:4]
    lines = []
    for v in VARIANTS:
        a = {m.group(2): m.group(4) for m in PAT.finditer(skin(stock, "", v))}
        b = {m.group(2): m.group(4) for m in PAT.finditer(skin(mod, "", v))}
        changed = [(k, b[k]) for k in a if k in b and a[k] != b[k]]
        for d in DIRS:
            text = skin(stock, d, v)
            for k, _ in changed:
                n = len(re.findall(r"^[ \t]*%s[ \t]*=[ \t]*rgba?\(" % k, text, re.M))
                if n != 1:
                    sys.exit("%sskin_values.%s.lua: %s matches %d lines" % (d, v, k, n))
        lines.append("[%s]" % v)
        lines += ["%s %s" % kv for kv in changed]
        print(v, len(changed), "colours")
    with open(out, "w", encoding="utf-8", newline="\n") as w:
        w.write("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
