#!/usr/bin/env python3
"""Drive the Magisk app through 'Install -> Select and Patch a File -> <file>' via uiautomator + adb.

Exits 0 once the patched image (magisk_patched-*.img) appears on the device or the
patch-progress screen is reached. Exits 2 on timeout so the caller can fall back to
manual patching. Requires: Magisk app already installed, target image already on
/sdcard/Download/.
"""
import argparse
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET


def adb(serial, args, allow_fail=False):
    cmd = ["adb"]
    if serial:
        cmd += ["-s", serial]
    cmd += args
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0 and not allow_fail:
        print(f"adb {' '.join(args)} -> {r.stderr.strip()}", file=sys.stderr)
    return r.returncode, r.stdout.strip(), r.stderr.strip()


def dump_ui(serial):
    adb(serial, ["shell", "uiautomator", "dump", "/sdcard/ui.xml"], allow_fail=True)
    rc, out, _ = adb(serial, ["shell", "cat", "/sdcard/ui.xml"], allow_fail=True)
    if rc != 0 or not out.strip():
        return None
    try:
        return ET.fromstring(out)
    except ET.ParseError:
        return None


def center(bounds):
    m = re.findall(r"\[(\d+),(\d+)\]", bounds)
    if len(m) != 2:
        return None
    x1, y1, x2, y2 = int(m[0][0]), int(m[0][1]), int(m[1][0]), int(m[1][1])
    return (x1 + x2) // 2, (y1 + y2) // 2


def nodes(root):
    out = []
    for n in root.iter("node"):
        out.append({
            "text": (n.get("text") or "").strip(),
            "desc": (n.get("content-desc") or "").strip(),
            "bounds": n.get("bounds") or "",
        })
    return out


def find_any(nodes_list, needle, mode="text"):
    key = "text" if mode == "text" else "desc"
    for n in nodes_list:
        if n[key] and needle.lower() in n[key].lower():
            c = center(n["bounds"])
            if c:
                return c
    return None


def find_exact(nodes_list, needle, mode="text"):
    key = "text" if mode == "text" else "desc"
    for n in nodes_list:
        if n[key].lower() == needle.lower():
            c = center(n["bounds"])
            if c:
                return c
    return None


def patched_file(serial):
    rc, out, _ = adb(serial, ["shell", "ls", "/sdcard/Download/"], allow_fail=True)
    for line in out.splitlines():
        if line.startswith("magisk_patched"):
            return line.strip()
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--serial", default="")
    ap.add_argument("--file", default="boot.img")
    ap.add_argument("--timeout", type=int, default=240)
    ap.add_argument("--package", default="com.topjohnwu.magisk")
    a = ap.parse_args()
    serial = a.serial
    pkg = a.package

    rc, out, _ = adb(serial, ["shell", "pm", "list", "packages", pkg])
    if rc != 0 or pkg not in out:
        print(f"ERROR: package {pkg} not installed on device", file=sys.stderr)
        return 3

    launcher = None
    rc, out, _ = adb(serial, [
        "shell", "cmd", "package", "resolve-activity", "--brief",
        "-c", "android.intent.category.LAUNCHER", pkg,
    ])
    for line in out.splitlines():
        if pkg + "/" in line:
            launcher = line.strip()
            break
    if not launcher:
        print(f"ERROR: could not resolve launcher for {pkg}", file=sys.stderr)
        return 3
    print(f"launcher: {launcher}", file=sys.stderr)

    adb(serial, ["shell", "am", "start", "-n", launcher], allow_fail=True)
    time.sleep(6)

    deadline = time.time() + a.timeout
    phase = "install"
    tapped = set()
    attempts = 0

    while time.time() < deadline:
        root = dump_ui(serial)
        attempts += 1
        if root is None:
            time.sleep(1)
            continue
        ns = nodes(root)

        if phase == "install":
            c = find_exact(ns, "Install", "text") or find_any(ns, "Install", "desc")
            if c and "install" not in tapped:
                adb(serial, ["shell", "input", "tap", str(c[0]), str(c[1])], allow_fail=True)
                tapped.add("install")
                time.sleep(3)
                phase = "select"
                continue
            if find_any(ns, "Select and Patch a File"):
                phase = "select"
                continue
            time.sleep(1)
            continue

        if phase == "select":
            c = find_any(ns, "Select and Patch a File", "text") or find_any(ns, "Select and Patch a File", "desc")
            if c:
                adb(serial, ["shell", "input", "tap", str(c[0]), str(c[1])], allow_fail=True)
                tapped.add("select")
                time.sleep(5)
                phase = "picker"
                continue
            time.sleep(1)
            continue

        if phase == "picker":
            f = patched_file(serial)
            if f:
                print(f)
                return 0
            boot_btn = (
                find_exact(ns, a.file, "text")
                or find_exact(ns, a.file, "desc")
                or find_any(ns, a.file.split(".")[0] + ".", "text")
            )
            if boot_btn:
                adb(serial, ["shell", "input", "tap", str(boot_btn[0]), str(boot_btn[1])], allow_fail=True)
                tapped.add("file")
                time.sleep(4)
                phase = "patching"
                continue
            if "download" not in tapped:
                c = find_any(ns, "Download", "text") or find_any(ns, "Download", "desc")
                if c:
                    adb(serial, ["shell", "input", "tap", str(c[0]), str(c[1])], allow_fail=True)
                    tapped.add("download")
                    time.sleep(3)
                    continue
            if "drawer" not in tapped:
                c = find_any(ns, "roots", "desc") or find_any(ns, "Show roots", "desc")
                if c:
                    adb(serial, ["shell", "input", "tap", str(c[0]), str(c[1])], allow_fail=True)
                    tapped.add("drawer")
                    time.sleep(2)
                    continue
            if attempts % 6 == 0:
                adb(serial, ["shell", "input", "swipe", "540", "1200", "540", "350", "250"], allow_fail=True)
            time.sleep(1)
            continue

        if phase == "patching":
            f = patched_file(serial)
            if f:
                print(f)
                return 0
            time.sleep(3)
            continue

    print("GAVE_UP: could not automate Magisk patch within timeout", file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())
