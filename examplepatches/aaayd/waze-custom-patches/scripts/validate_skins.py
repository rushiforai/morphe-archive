"""Execute original and patched skins through Waze's own Lua validation/parser."""
import argparse
import hashlib
import json
import re
from pathlib import Path
from zipfile import ZipFile

from lupa.lua54 import LuaRuntime, lua_type


def compiled_version_code(manifest):
    from struct import unpack_from
    u16 = lambda pos: unpack_from('<H', manifest, pos)[0]
    u32 = lambda pos: unpack_from('<I', manifest, pos)[0]
    assert u16(0) == 3 and u32(4) == len(manifest)
    offset, resource_ids, versions = u16(2), [], []
    while offset < len(manifest):
        kind, header, size = unpack_from('<HHI', manifest, offset)
        assert size >= header >= 8 and offset + size <= len(manifest)
        if kind == 0x180:
            resource_ids = [u32(p) for p in range(offset + header, offset + size, 4)]
        elif kind == 0x102:
            ext = offset + header
            start, stride, count = unpack_from('<HHH', manifest, ext + 8)
            for index in range(count):
                attr = ext + start + index * stride
                name = u32(attr + 4)
                if name < len(resource_ids) and resource_ids[name] == 0x0101021b:
                    assert manifest[attr + 15] == 0x10
                    versions.append(u32(attr + 16))
        offset += size
    assert len(versions) == 1
    return versions[0]


def run_skin(apk, variant, mode, editor=""):
    lua = LuaRuntime(unpack_returned_tuples=True)
    messages = []
    native = {}
    def plain(value):
        if lua_type(value) == "table":
            return {str(k): plain(v) for k, v in value.items()}
        return value
    def capture(kind, *args):
        native[(kind,) + tuple(args[:-1])] = plain(args[-1])
    lua.globals().print = lambda *args: messages.append(" ".join(map(str, args)))
    lua.globals().generalValueCallbackNative = lambda *args: capture("general", *args)
    lua.globals().categoryZoomCallbackNative = lambda *args: capture("zoom", *args)
    lua.globals().categoryScreenSizePercentageCallbackNative = lambda *args: capture("percentage", *args)
    root = "assets/res/"
    skin = root + "skins/default/" + variant
    for path in [root + "scripts/enviroment.lua", skin + f"skin_values.{editor}{mode}.lua",
                 root + "scripts/structurelib.lua", skin + "skin_structure.main.lua",
                 root + "scripts/validation.lua", root + "scripts/parse.lua"]:
        lua.execute(apk.read(path).decode("utf-8"), name=path)
    counts = lua.globals().getNumParsed()
    colors = lua.globals().Colors
    return counts, messages, colors, lua, native


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("original")
    parser.add_argument("patched")
    parser.add_argument("--report", default="dist/validation.json")
    args = parser.parse_args()
    report = {"skins": []}
    with ZipFile(args.original) as original, ZipFile(args.patched) as patched:
        old_version = compiled_version_code(original.read('AndroidManifest.xml'))
        new_version = compiled_version_code(patched.read('AndroidManifest.xml'))
        assert (old_version, new_version) == (1030732, 1030733), 'Skin refresh version was not packaged'
        report['version_code'] = {'original': old_version, 'patched': new_version}
        # This patch must never rewrite code, geometry, rendering scripts or traffic values.
        for name in original.namelist():
            if name.endswith(".dex") or name.endswith(".so") or name.endswith("skin_structure.main.lua") or name.startswith("assets/res/scripts/"):
                assert original.read(name) == patched.read(name), f"Unexpected change: {name}"
        for variant in ["", "experiment/"]:
            for mode in ["day", "night"]:
                a = run_skin(original, variant, mode)
                b = run_skin(patched, variant, mode)
                assert a[0] == b[0] and min(b[0]) > 0, (a[0], b[0])
                assert a[1] == b[1], f"New Lua validation warnings: {b[1]}"
                assert a[4].keys() == b[4].keys(), "Native parser schema changed"
                changed_native = [key for key in a[4] if a[4][key] != b[4][key]]
                assert changed_native, "No renderer colours changed"
                for key in changed_native:
                    assert "color" in key[-1] or key[-1] in {"map_background", "missing"}, key
                path = f"assets/res/skins/default/{variant}skin_values.{mode}.lua"
                old = original.read(path).decode()
                new = patched.read(path).decode()
                assert old != new
                old_traffic = re.findall(r"^\s*traffic_\w+\s*=.*$", old, re.M)
                new_traffic = re.findall(r"^\s*traffic_\w+\s*=.*$", new, re.M)
                assert old_traffic == new_traffic
                theme_root = Path(__file__).resolve().parents[1] / "src/main/resources/themes"
                expected_colors = dict(line.split("=", 1) for line in
                    (theme_root / f"{mode}.colors.properties").read_text().splitlines()
                    if line and not line.startswith("#"))
                expected = expected_colors["Navigation.fill"]
                assert re.search(r"navigation\s*=\s*rgb\(0x" + expected + r"\)", new)
                assert b[2].Navigation.fill == b[3].globals().rgb(int(expected, 16))
                for key, value in expected_colors.items():
                    group, field = key.split(".")
                    convert = b[3].globals().rgb if len(value) == 6 else b[3].globals().rgba
                    assert b[2][group][field] == convert(int(value, 16)), f"Colour mismatch: {mode} {key}"
                for field in ["traffic_nav_route_colors", "traffic_nav_arrow_colors", "traffic_route_colors",
                              "traffic_arrow_colors", "traffic_unselected_route_colors"]:
                    assert list(a[2].General[field].values()) == list(b[2].General[field].values()), field
                report["skins"].append({"path": path, "parser_counts": b[0], "warnings": b[1],
                                        "exact_renderer_colours_checked": len(expected_colors),
                                        "native_colour_entries_changed": len(changed_native),
                                        "sha256": hashlib.sha256(patched.read(path)).hexdigest()})
    report["result"] = "PASS"
    report["runtime_device_tested"] = False
    Path(args.report).write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
