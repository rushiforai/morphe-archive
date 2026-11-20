#!/usr/bin/env python3
"""Print HomeWorkShortcuts.ChipNames for a stock Google Maps APK.

R8 renames Material's Chip internals in every Maps build and strips most public Chip setters.
This follows the setters that survive (float setters and the *Resource(int) variants) into
ChipDrawable to find each obfuscated method and the field it writes.

Usage: python tools/chip-names.py MAPS.apk --dexdump PATH/TO/build-tools/36.0.0/dexdump.exe
Reads the APK only; writes temporary files under build/.
"""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile

CHIP = "Lcom/google/android/material/chip/Chip;"
CSL = "Landroid/content/res/ColorStateList;"
SIZES = ["setChipStrokeWidth", "setChipMinHeight", "setChipStartPadding", "setChipEndPadding",
         "setIconStartPadding", "setIconEndPadding", "setTextStartPadding", "setTextEndPadding",
         "setChipIconSize"]
COLORS = ["setChipBackgroundColorResource", "setChipStrokeColorResource", "setRippleColorResource",
          "setChipIconTintResource"]


def parse(text):
    classes = {}
    for block in re.split(r"\nClass #\d+\s+-\n", text):
        m = re.search(r"Class descriptor\s+: '([^']+)'", block)
        if not m:
            continue
        sup = re.search(r"Superclass\s+: '([^']+)'", block)
        fields = re.findall(r"name\s+: '([^']+)'\n\s+type\s+: '([^']+)'\n\s+access",
                            block.split("Direct methods")[0])
        methods = {(mm.group(1), mm.group(2)): [i.split(" // ")[0] for i in re.findall(r"\|[0-9a-f]{4}: (.*)", mm.group(3))]
                   for mm in re.finditer(r"name\s+: '([^']+)'\n\s+type\s+: '([^']+)'\n(.*?)(?=\n\s+#\d+\s+: \(in |\Z)", block, re.S)}
        classes[m.group(1)] = (sup.group(1) if sup else None, dict(fields), methods)
    return classes


def calls(body, owner, sig=None):
    out = []
    for i in body:
        m = re.search(r"invoke-\S+ \{[^}]*\}, (L[^;]+;)\.([^:]+):(\S+)", i)
        if m and m.group(1) == owner and (sig is None or m.group(3) == sig):
            out.append(m.group(2))
    return out


def writes(body, owner, ftype):
    return [m.group(1) for i in body if i.startswith("iput")
            for m in [re.search(rf"{re.escape(owner)}\.([^:]+):{re.escape(ftype)}$", i)] if m]


def one(values, what):
    values = list(dict.fromkeys(values))
    if len(values) != 1:
        raise SystemExit(f"Could not identify {what}: {values}")
    return values[0]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("apk", type=Path)
    p.add_argument("--dexdump", type=Path, required=True)
    args = p.parse_args()
    work = Path(tempfile.mkdtemp(prefix="chip-names-", dir=Path(__file__).resolve().parents[1] / "build"))
    text = None
    with zipfile.ZipFile(args.apk) as z:
        for name in sorted(n for n in z.namelist() if re.fullmatch(r"classes\d*\.dex", n)):
            dex = work / name
            dex.write_bytes(z.read(name))
            out = subprocess.run([str(args.dexdump), "-d", str(dex)], capture_output=True, text=True,
                                 encoding="utf-8", errors="replace").stdout
            if f"Class descriptor  : '{CHIP}'" in out:
                text = out
                break
    if text is None:
        raise SystemExit("Chip class not found")
    classes = parse(text)
    _, chip_fields, chip = classes[CHIP]
    probe = chip[("setChipMinHeight", "(F)V")]
    drawable = one([m.group(2) for i in probe for m in [re.search(r"iget-object \S+ \S+ (L[^;]+;)\.([^:]+):(L[^;]+;)", i)]
                    if m and m.group(1) == CHIP], "Chip's drawable field")
    dtype = chip_fields[drawable]
    dsuper, dfields, dmethods = classes[dtype]
    shape_cls = classes[dsuper]

    def dmethod(name, sig):
        return dmethods.get((name, sig)) or shape_cls[2].get((name, sig)) or []

    colors = []
    for setter in COLORS:
        m = one(calls(chip[(setter, "(I)V")], dtype, f"({CSL})V"), setter)
        colors.append((one(writes(dmethod(m, f"({CSL})V"), dtype, CSL), m), m))
    ripple_refresh = one([n for n in calls(chip[("setRippleColorResource", "(I)V")], CHIP, "()V")], "ripple refresh")
    sizes = []
    for setter in SIZES:
        m = one(calls(chip[(setter, "(F)V")], dtype, "(F)V"), setter)
        sizes.append((setter, one(writes(dmethod(m, "(F)V"), dtype, "F"), m)))
    written = {f for body in dmethods.values() for f in writes(body, dtype, CSL)}
    surface = one([f for f, t in dfields.items() if t == CSL and f not in written], "surface color")
    # MaterialShapeDrawable: a no-argument getter and a one-argument setter of the same model type.
    sm = shape_cls[2]
    getters = {sig[2:]: n for (n, sig) in sm if re.fullmatch(r"\(\)L[a-z]+;", sig)}
    setters = {sig[1:-2]: n for (n, sig) in sm if re.fullmatch(r"\(L[a-z]+;\)V", sig) and n != "<init>"
               and any(i.startswith("invoke-virtual") and "invalidateSelf" in i for i in sm[(n, sig)])}
    shape = one([(getters[t], setters[t]) for t in getters if t in setters], "shape model accessors")
    resource_bool = lambda setter, owner: one(calls(chip[(setter, "(I)V")], owner, "(Z)V"), setter)
    checkable = resource_bool("setCheckableResource", dtype)
    icon_visible = resource_bool("setChipIconVisible", dtype)
    close_visible = resource_bool("setCloseIconVisible", CHIP)
    touch = one([(f, n) for (n, sig), body in chip.items() if sig == "(Z)V" and n != "setChecked"
                 for f in writes(body, CHIP, "Z") if len(body) <= 5
                 and any(re.search(rf"{re.escape(CHIP)}\.[^:]+:\(I\)V", i) for i in body)], "touch target")

    print(f'static final String DRAWABLE = "{drawable}";')
    print(f'static final String SURFACE = "{surface}";')
    print("static final String[][] COLORS = {" + ", ".join(f'{{"{f}", "{m}"}}' for f, m in colors) + "};")
    print(f'static final String RIPPLE_REFRESH = "{ripple_refresh}";')
    print("static final String[][] SIZES = {" + ", ".join(f'{{"{s}", "{f}"}}' for s, f in sizes) + "};")
    print(f'static final String SHAPE_GET = "{shape[0]}", SHAPE_SET = "{shape[1]}";')
    print(f'static final String TOUCH_TARGET = "{touch[0]}", TOUCH_TARGET_SET = "{touch[1]}";')
    print(f'static final String CHECKABLE_SET = "{checkable}", ICON_VISIBLE_SET = "{icon_visible}";')
    print(f'static final String CLOSE_ICON_VISIBLE_SET = "{close_visible}";')


if __name__ == "__main__":
    main()
