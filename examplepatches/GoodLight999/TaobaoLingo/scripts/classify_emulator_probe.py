#!/usr/bin/env python3
"""Classify an Android APK emulator probe without equating CI success with app success.

All evidence is obtained after an APK install and launch attempt. A launcher
screenshot is NOT Taobao UI. A valid signature is NOT a working login.
This classifier never reads or emits user credentials or screen text.
"""
from __future__ import annotations

import argparse
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path

PACKAGE = "com.taobao.taobao"


def classify(folder: Path, package: str = PACKAGE) -> dict:
    install = (folder / "install.txt").read_text(encoding="utf-8", errors="replace") if (folder / "install.txt").exists() else ""
    observed = (folder / "process.txt").read_text(encoding="utf-8", errors="replace").strip() if (folder / "process.txt").exists() else ""
    logcat = (folder / "logcat.txt").read_text(encoding="utf-8", errors="replace") if (folder / "logcat.txt").exists() else ""
    ui = (folder / "home_ui.xml").read_text(encoding="utf-8", errors="replace") if (folder / "home_ui.xml").exists() else ""
    package_nodes = 0
    root_packages: set[str] = set()
    xml_valid = False
    try:
        tree = ET.fromstring(ui.split("UI hierchary dumped")[0].strip())
        xml_valid = True
        for node in tree.iter("node"):
            pkg = node.attrib.get("package", "")
            if pkg:
                root_packages.add(pkg)
            if pkg == package:
                package_nodes += 1
    except ET.ParseError:
        pass
    # The native ARM64 SecurityGuard plugin can crash in emulation for both
    # official and re-signed APKs. This is a platform confounder, not proof of
    # an APK-integrity rejection.
    aborts = re.findall(r"Fatal signal (\d+) \((SIG[A-Z]+)\)", logcat)
    native_bridge_signal_abort = ("libndk_translation.so" in logcat and
                                  "Cannot process signal 11" in logcat)
    signature_errors = sorted(set(re.findall(
        r"(?i)INSTALL_FAILED_[A-Z_]+|INSTALL_PARSE_FAILED_[A-Z_]+",
        install,
    )))
    installed = bool(re.search(r"(?m)^Success\s*$", install)) and not signature_errors
    pid = observed if re.fullmatch(r"[0-9 ]+", observed) else ""
    alive = bool(pid)
    ui_reached = bool(package_nodes and alive and installed)
    if not installed:
        state = "INSTALL_FAILED"
    elif not alive:
        state = "APP_NOT_RUNNING"
    elif not ui_reached:
        state = "TAOBAO_UI_NOT_REACHED"
    else:
        state = "TAOBAO_UI_REACHED"
    return {
        "state": state,
        "installed": installed,
        "install_errors": signature_errors,
        "process_alive_at_capture": alive,
        "taobao_ui_reached": ui_reached,
        "taobao_ui_node_count": package_nodes,
        "ui_xml_valid": xml_valid,
        "observed_ui_packages": sorted(root_packages),
        "observed_fatal_signals": sorted(set(name for _, name in aborts)),
        "native_bridge_signal_abort": native_bridge_signal_abort,
        "login_verified": False,
        "english_translation_verified": False,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("folder", type=Path)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    result = classify(args.folder)
    data = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(data, encoding="utf-8")
    print(data, end="")
    return 0 if result["taobao_ui_reached"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
