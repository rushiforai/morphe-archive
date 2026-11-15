#!/usr/bin/env python3
"""Remove the side-panel "other games" promo icons from the Unity scenes.

The main menu shows three cross-promotion icons per screen side. They are
Unity/NGUI GameObjects below "MainMenu/PromoteIcon" (six "Icon (n)" children,
three per side) and are activated at runtime by the PromoteIcon manager
script even though the container is inactive in the serialized scene.

This script hides the complete "PromoteIcon" subtree in every scene:

  * every GameObject  -> m_IsActive = False
  * every Transform   -> m_LocalScale = (0, 0, 0)

The zero scale is the important part: even if the menu script re-activates
the GameObjects at runtime, they stay invisible and their box colliders
(100x100) shrink to zero, so they cannot be tapped either.

Usage:
    python patch_promote_icons.py --input data.unity3d --out-dir out/

Requires UnityPy (tested with 1.25.4):
    pip install UnityPy
"""

import argparse
import os
import struct
import sys

import UnityPy

TARGET_NAME = "PromoteIcon"


def pptr_path_id(pptr):
    return pptr["m_PathID"] if isinstance(pptr, dict) else pptr.m_PathID


def find_gameobjects(env, name):
    found = []
    for obj in env.objects:
        if obj.type.name != "GameObject":
            continue
        try:
            if obj.read_typetree()["m_Name"] == name:
                found.append(obj)
        except Exception:
            continue
    return found


def sibling(env, assets_file, path_id, type_name):
    for obj in env.objects:
        if (obj.assets_file.name == assets_file
                and obj.path_id == path_id
                and obj.type.name == type_name):
            return obj
    return None


def collect_subtree(env, go):
    """Return [(GameObject, Transform)] for go and all its descendants."""
    af = go.assets_file.name
    go_tt = go.read_typetree()
    nodes = []

    transform = None
    for comp in go_tt["m_Component"]:
        pid = pptr_path_id(comp["component"])
        tr = sibling(env, af, pid, "Transform")
        if tr is not None:
            transform = tr
            break
    if transform is None:
        return nodes

    stack = [(go, transform)]
    while stack:
        cur_go, cur_tr = stack.pop()
        nodes.append((cur_go, cur_tr))
        for child in cur_tr.read_typetree()["m_Children"]:
            child_tr = sibling(env, af, pptr_path_id(child), "Transform")
            if child_tr is None:
                continue
            child_go = sibling(env, af, pptr_path_id(child_tr.read_typetree()["m_GameObject"]), "GameObject")
            if child_go is not None:
                stack.append((child_go, child_tr))
    return nodes


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
    ap.add_argument("--input", required=True, help="data.unity3d to patch")
    ap.add_argument("--out-dir", required=True, help="output directory")
    ap.add_argument("--pack", default="lz4", choices=["none", "lz4", "lzma"])
    args = ap.parse_args()

    env = UnityPy.load(args.input)

    roots = find_gameobjects(env, TARGET_NAME)
    if not roots:
        sys.exit(f"ERROR: GameObject {TARGET_NAME!r} not found in any scene")

    total = 0
    for root in roots:
        nodes = collect_subtree(env, root)
        if not nodes:
            sys.exit(f"ERROR: no Transform found for {TARGET_NAME} in {root.assets_file.name}")

        print(f"{root.assets_file.name}: {TARGET_NAME} subtree with {len(nodes)} GameObjects")
        for go, tr in nodes:
            go_tt = go.read_typetree()
            name = go_tt["m_Name"]
            if go_tt["m_IsActive"]:
                go_tt["m_IsActive"] = False
                go.save_typetree(go_tt)
            tr_tt = tr.read_typetree()
            scale = tr_tt["m_LocalScale"]
            if (scale["x"], scale["y"], scale["z"]) != (0.0, 0.0, 0.0):
                tr_tt["m_LocalScale"] = {"x": 0.0, "y": 0.0, "z": 0.0}
                tr.save_typetree(tr_tt)
            print(f"  {name!r}: inactive, scale (0, 0, 0)")
            total += 1

    print(f"Patched {total} GameObjects in {len(roots)} scene(s)")

    os.makedirs(args.out_dir, exist_ok=True)
    env.save(pack=args.pack, out_path=args.out_dir)

    out = os.path.join(args.out_dir, os.path.basename(args.input))
    print(f"Wrote {out} ({os.path.getsize(out)} bytes)")
    print("header:", bundle_header(out))


if __name__ == "__main__":
    main()
