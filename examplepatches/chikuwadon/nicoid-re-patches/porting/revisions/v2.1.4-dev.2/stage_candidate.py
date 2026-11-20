#!/usr/bin/env python3
"""Stage app-wide performance changes on the validated local dev.1 MPP."""
import argparse
from copy import copy
import hashlib
import importlib.util
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("comment_base", HERE.parent / "v2.1.4-dev.1/stage_candidate.py")
base_tools = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base_tools)
assemble, disassemble = base_tools.assemble, base_tools.disassemble
run, require, validate_mpp = base_tools.run, base_tools.require, base_tools.validate_mpp
PREVIOUS = "2.1.4-dev.1"
VERSION = "2.1.4-dev.2"
BASE_HASH = "8723eadc14184d11898a44e2ea072b3284dd3db41310a3a60fd34a0dbebcda89"
REBUILT = {"PageCache", "PageCache$Entry", "PageCache$Flight", "VideoCounts$CountIcon", "Media3Diagnostics276"}
PATCHED = {"ListActions", "VideoRows191", "AmbientCard217$Panel", "PatchVersion237"}
OWNER = Path("e/e/a")


def once(code, before, after):
    require(code.count(before) == 1, "Unexpected hook location: " + before)
    return code.replace(before, after)


def edit(path, replacements):
    code = path.read_text()
    for before, after in replacements:
        code = once(code, before, after)
    path.write_text(code)


def apply_hooks(directory):
    row = directory / "ListActions.smali"
    signature = ".method static value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;"
    # Keep the exact original reflective fallback for any row other than the native model.
    code = row.read_text()
    begin = code.index(signature)
    edge = code.index(".end method", begin)
    method = once(code[begin:edge], "    :try_start_2\n", """    :try_start_2
    instance-of v1, p0, Le/e/a/x1;
    if-eqz v1, :reflective_value
    check-cast p0, Le/e/a/x1;
    invoke-virtual {p0, p1}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    if-nez p0, :cond_1f
    goto :goto_23

    :reflective_value
""")
    row.write_text(code[:begin] + method + code[edge:])

    edit(directory / "VideoRows191.smali", [(r"""    const-string v0, "\\n"

    const/4 v1, 0x2

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1""", """    const/16 v0, 0xa
    invoke-virtual {v14, v0}, Ljava/lang/String;->indexOf(I)I
    move-result v0
    const/4 v1, 0x0
    if-ltz v0, :first_line_whole
    invoke-virtual {v14, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    goto :goto_248

    :first_line_whole
    move-object v0, v14""")])

    # The geometry-change branch runs before checking palette differences.
    # Keep the static opacity ramp across palette updates in the same geometry.
    edit(directory / "AmbientCard217$Panel.smali", [
        ("# instance fields\n", "# instance fields\n.field private opacityRamp:Landroid/graphics/LinearGradient;\n"),
        ("    :goto_b3\n    move v8, v12", """    :goto_b3
    const/4 v8, 0x0
    iput-object v8, v0, Le/e/a/AmbientCard217$Panel;->opacityRamp:Landroid/graphics/LinearGradient;
    move v8, v12"""),
        ("    new-instance v14, Landroid/graphics/LinearGradient;", """    iget-object v14, v0, Le/e/a/AmbientCard217$Panel;->opacityRamp:Landroid/graphics/LinearGradient;
    if-nez v14, :reuse_opacity_ramp
    new-instance v14, Landroid/graphics/LinearGradient;"""),
        ("    invoke-direct/range {v14 .. v21}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V",
         """    invoke-direct/range {v14 .. v21}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V
    iput-object v14, v0, Le/e/a/AmbientCard217$Panel;->opacityRamp:Landroid/graphics/LinearGradient;

    :reuse_opacity_ramp""")
    ])
    # The original fade builder reuses v1 for a float. That register is
    # overwritten by the paint load immediately after the merge point.
    edit(directory / "PatchVersion237.smali", [(f'"{PREVIOUS}"', f'"{VERSION}"')])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("base", "output", "tools", "android-jar", "d8"):
        parser.add_argument("--" + name, required=True, type=Path)
    args = parser.parse_args()
    require(args.base.resolve() != args.output.resolve(), "Choose a separate output")
    require(hashlib.sha256(args.base.read_bytes()).hexdigest() == BASE_HASH, "Use the validated dev.1 MPP")
    validate_mpp(args.base, PREVIOUS)
    with TemporaryDirectory(prefix="nicoid-performance-") as folder, ZipFile(args.base) as base:
        tmp = Path(folder)
        classes = tmp / "classes"
        classes.mkdir()
        run("javac", "--release", "8", "-encoding", "UTF-8", "-cp", args.android_jar, "-d", classes,
            *sorted(HERE.glob("java/**/*.java")), *sorted(HERE.glob("stubs/**/*.java")))
        dex = tmp / "generated"
        dex.mkdir()
        run(args.d8, "--min-api", "28", "--lib", args.android_jar, "--output", dex,
            *sorted(p for p in classes.rglob("*.class") if p.stem in REBUILT))
        generated = disassemble(dex / "classes.dex", tmp / "generated-smali", args.tools)
        require(set(generated) == {OWNER / (name + ".smali") for name in REBUILT}, "Unexpected rebuilt classes")
        original_dex = tmp / "original.dex"
        payload = "nicoid/helpers.mpe"
        original_dex.write_bytes(base.read(payload))
        directory = tmp / "helpers"
        original = disassemble(original_dex, directory, args.tools)
        for name, data in generated.items():
            (directory / name).write_bytes(data)
        apply_hooks(directory / OWNER)
        output_dex = tmp / "output.dex"
        assemble(directory, output_dex, args.tools)
        checked = disassemble(output_dex, tmp / "checked", args.tools)
        require(checked.keys() == original.keys(), "Unexpected helper class set")
        expected = {OWNER / (name + ".smali") for name in REBUILT | PATCHED}
        changed = {p for p in original if original[p] != checked[p]}
        require(changed == expected, f"Unexpected helper diff: {changed ^ expected}")
        manifest = "META-INF/MANIFEST.MF"
        new_manifest = once(base.read(manifest).decode(), f"Version: {PREVIOUS}\r\n", f"Version: {VERSION}\r\n")
        overrides = {manifest: new_manifest.encode(), payload: output_dex.read_bytes()}
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(args.output, "w") as candidate:
            for entry in base.infolist():
                candidate.writestr(copy(entry), overrides.get(entry.filename, base.read(entry.filename)))
        with ZipFile(args.output) as candidate:
            require(candidate.namelist() == base.namelist(), "Unexpected archive layout")
            require(all(candidate.read(p) == base.read(p) for p in base.namelist() if p not in overrides),
                    "Unexpected archive entry changes")
    print(f"PASS: {len(changed)} helper classes changed; {len(checked) - len(changed)} preserved")
    print("PASS:", validate_mpp(args.output, VERSION))


if __name__ == "__main__":
    main()
