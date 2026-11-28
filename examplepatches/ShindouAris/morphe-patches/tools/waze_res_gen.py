#!/usr/bin/env python3
"""Collects the resource files the Waze Mod adds to Waze for the Morphe patch.

  python tools/waze_res_gen.py <stock_decode> <modded_decode> <out_dir>

Both are APKEditor decodes (resources/package_1/res below them). Every file under res/ that the Mod adds (the
drawables of its report menu and sign icons) is copied to <out_dir>/res/<path>, listed in <out_dir>/index.txt. The
<string> entries the Mod adds to res/values/strings.xml are written to <out_dir>/mod_strings.txt as name<TAB>text, the
source of the per-language strings files the patch ships; the colour, style and layout edits of the Mod (its own
launcher colour, the disabled Google login button) are not taken over.
"""
import os
import re
import shutil
import sys


def walk(root):
    return {os.path.relpath(os.path.join(d, f), root).replace("\\", "/"): os.path.join(d, f)
            for d, _, fs in os.walk(root) for f in fs}


def strings(path):
    text = open(path, encoding="utf-8").read()
    return dict(re.findall(r'<string name="([^"]+)">(.*?)</string>', text, re.S))


def main():
    stock, mod, out = sys.argv[1:4]
    rel = os.path.join("resources", "package_1", "res")
    a, b = walk(os.path.join(stock, rel)), walk(os.path.join(mod, rel))
    shutil.rmtree(out, ignore_errors=True)
    os.makedirs(out)
    kept = []
    for path in sorted(b):
        if path in a or path.startswith("values"):
            continue
        dest = os.path.join(out, "res", path)
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        shutil.copyfile(b[path], dest)
        kept.append("res/" + path)
    with open(os.path.join(out, "index.txt"), "w", encoding="utf-8", newline="\n") as w:
        w.write("\n".join(kept) + "\n")
    sa, sb = strings(a["values/strings.xml"]), strings(b["values/strings.xml"])
    added = {k: v for k, v in sb.items() if k not in sa}
    with open(os.path.join(out, "mod_strings.txt"), "w", encoding="utf-8", newline="\n") as w:
        for k, v in added.items():
            w.write("%s\t%s\n" % (k, v))
    print("files:", len(kept), "strings:", len(added))


if __name__ == "__main__":
    main()
