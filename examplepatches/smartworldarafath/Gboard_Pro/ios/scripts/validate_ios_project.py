import os
import re
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ERRORS = []


def check_xml(path: Path):
    try:
        ET.parse(path)
    except Exception as exc:
        ERRORS.append(f"Invalid XML/plist in {path}: {exc}")


def check_swift_syntax_heuristics(path: Path):
    text = path.read_text(encoding="utf-8")
    stack = []
    pairs = {"{": "}", "(": ")", "[": "]"}
    closing = {v: k for k, v in pairs.items()}
    in_line_comment = False
    in_block_comment = False
    in_string = False
    escape = False
    i = 0
    n = len(text)
    while i < n:
        ch = text[i]
        nxt = text[i + 1] if i + 1 < n else ""
        if in_line_comment:
            if ch == "\n":
                in_line_comment = False
        elif in_block_comment:
            if ch == "*" and nxt == "/":
                in_block_comment = False
                i += 1
        elif in_string:
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == '"':
                in_string = False
        else:
            if ch == "/" and nxt == "/":
                in_line_comment = True
                i += 1
            elif ch == "/" and nxt == "*":
                in_block_comment = True
                i += 1
            elif ch == '"':
                in_string = True
            elif ch in pairs:
                stack.append(ch)
            elif ch in closing:
                if not stack or stack[-1] != closing[ch]:
                    ERRORS.append(f"Unmatched '{ch}' in {path}")
                    return
                stack.pop()
        i += 1
    if in_string or in_block_comment or stack:
        ERRORS.append(f"Unclosed delimiter/string in {path}: remaining={stack}")

    for pattern in [r"AIzaSy", r"ghp_", r"gho_", r"github_pat_", r"AKIA", r"BEGIN .* PRIVATE KEY"]:
        if re.search(pattern, text):
            ERRORS.append(f"Potential secret pattern '{pattern}' found in {path}")


def main():
    required = [
        ROOT / "project.yml",
        ROOT / "Package.swift",
        ROOT / "xtool.yml",
        ROOT / "Config" / "App-Info.plist",
        ROOT / "Config" / "App.entitlements",
        ROOT / "Config" / "Keyboard-Info.plist",
        ROOT / "Config" / "Keyboard.entitlements",
        ROOT.parent / ".github" / "workflows" / "ios-build-and-test.yml",
    ]
    for p in required:
        if not p.exists():
            ERRORS.append(f"Missing required file: {p}")

    for plist in (ROOT / "Config").glob("*"):
        if plist.suffix in (".plist", ".entitlements"):
            check_xml(plist)

    swift_files = list(ROOT.rglob("*.swift"))
    if len(swift_files) < 8:
        ERRORS.append(f"Expected >= 8 Swift files, found {len(swift_files)}")

    for sf in swift_files:
        check_swift_syntax_heuristics(sf)

    app_cfg = (ROOT / "Sources" / "Shared" / "Config" / "AppGroupConfig.swift").read_text(encoding="utf-8")
    app_ent = (ROOT / "Config" / "App.entitlements").read_text(encoding="utf-8")
    kb_ent = (ROOT / "Config" / "Keyboard.entitlements").read_text(encoding="utf-8")
    group_id = "group.com.smartworldarafath.gboardpro"
    for label, content in [("AppGroupConfig.swift", app_cfg), ("App.entitlements", app_ent), ("Keyboard.entitlements", kb_ent)]:
        if group_id not in content:
            ERRORS.append(f"App Group '{group_id}' missing in {label}")

    if ERRORS:
        print("FAILED iOS structural validation:")
        for e in ERRORS:
            print(" -", e)
        raise SystemExit(1)

    print(f"[PASS] Validated {len(swift_files)} Swift files, XML plists, entitlements, App Groups, and CI workflow.")


if __name__ == "__main__":
    main()
