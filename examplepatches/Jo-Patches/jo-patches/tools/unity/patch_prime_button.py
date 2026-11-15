#!/usr/bin/env python3
"""Remove the "Prime Button" cross-promotion from the Unity scene.

The button is a Unity/NGUI GameObject named "Prime Button" inside the
main-menu scene ("level0") of assets/bin/Data/data.unity3d. It is *not*
an AdMob view and therefore cannot be removed by patching Java bytecode.

This script edits the serialized scene in the UnityFS bundle:

  * GameObject "Prime Button" -> m_IsActive = False
  * its Transform            -> m_LocalScale = (0, 0, 0)

Setting the scale to zero additionally guarantees the button stays
invisible even if the menu script re-activates the GameObject at runtime.

All other objects are left untouched (UnityPy keeps their raw data).

Usage:
    python patch_prime_button.py --input data.unity3d --out-dir out/

Requires UnityPy (tested with 1.25.4):
    pip install UnityPy
"""

import argparse
import os
import struct
import sys

import UnityPy

SCENE_FILE = "level0"
GAMEOBJECT_NAME = "Prime Button"


def find_gameobject(env, scene, name):
    for obj in env.objects:
        if obj.assets_file.name != scene or obj.type.name != "GameObject":
            continue
        try:
            if obj.read().m_Name == name:
                return obj
        except Exception:
            continue
    return None


def bundle_header(path):
    with open(path, "rb") as f:
        f.read(8)
        struct.unpack(">I", f.read(4))[0]
        while f.read(1) not in (b"\x00", b""):
            pass
        while f.read(1) not in (b"\x00", b""):
            pass
        size = struct.unpack(">q", f.read(8))[0]
        ci = struct.unpack(">I", f.read(4))[0]
        ui = struct.unpack(">I", f.read(4))[0]
        flags = struct.unpack(">I", f.read(4))[0]
        return size, ci, ui, flags, flags & 0x3F


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--input", required=True, help="original data.unity3d")
    ap.add_argument("--out-dir", required=True, help="output directory")
    ap.add_argument("--pack", default="lz4", choices=["none", "lz4", "lzma"])
    args = ap.parse_args()

    env = UnityPy.load(args.input)

    go = find_gameobject(env, SCENE_FILE, GAMEOBJECT_NAME)
    if go is None:
        sys.exit(f"ERROR: GameObject {GAMEOBJECT_NAME!r} not found in {SCENE_FILE}")

    tt = go.read_typetree()
    tt["m_IsActive"] = False
    go.save_typetree(tt)
    print(f"GameObject {GAMEOBJECT_NAME!r}: m_IsActive -> False")

    transform = None
    for comp in tt["m_Component"]:
        pid = comp["component"]["m_PathID"]
        transform = next(
            (o for o in env.objects
             if o.assets_file.name == SCENE_FILE
             and o.path_id == pid
             and o.type.name == "Transform"),
            None,
        )
        if transform is not None:
            break

    if transform is None:
        sys.exit("ERROR: Transform of the button not found")

    tr = transform.read_typetree()
    tr["m_LocalScale"] = {"x": 0.0, "y": 0.0, "z": 0.0}
    transform.save_typetree(tr)
    print("Transform: m_LocalScale -> (0, 0, 0)")

    os.makedirs(args.out_dir, exist_ok=True)
    env.save(pack=args.pack, out_path=args.out_dir)

    out = os.path.join(args.out_dir, os.path.basename(args.input))
    print(f"Wrote {out} ({os.path.getsize(out)} bytes)")
    print("header:", bundle_header(out))


if __name__ == "__main__":
    main()
