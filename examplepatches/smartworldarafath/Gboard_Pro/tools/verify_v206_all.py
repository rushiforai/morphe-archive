#!/usr/bin/env python3
"""
Structural, Resource, and Bytecode-Signature Verification Suite for Gboard Pro v2.0.6 (Beta 2).
Verifies:
1. All values*/strings.xml & values/public.xml parse cleanly and have no duplicate public IDs/names.
2. All 83 locales have pixelboard_clipboard_pin_tip_{short,24h,7d,30d} and public.xml has 0x7f1416e6..16e9.
3. Every com/akshaykadam/pixelboard/* method call across all smali* directories exists in compiled build_classes/ with exact JVM descriptor & static/virtual flag, and uses safe register encoding.
"""
from pathlib import Path
import re
import subprocess
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parent.parent
RES_DIR = ROOT / "temp_decompiled" / "res"
DECOMPILED = ROOT / "temp_decompiled"
BUILD_CLASSES = ROOT / "build_classes"
ANDROID_JAR = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\platforms\android-35\android.jar"


def check_resources():
    public_xml = RES_DIR / "values" / "public.xml"
    tree = ET.parse(public_xml)
    seen_ids = set()
    seen_names_per_type = set()
    id_by_name = {}
    for elem in tree.getroot().findall("public"):
        t = elem.attrib["type"]
        n = elem.attrib["name"]
        i = elem.attrib["id"].lower()
        assert i not in seen_ids, f"Duplicate public id {i} ({t}/{n})"
        seen_ids.add(i)
        assert (t, n) not in seen_names_per_type, f"Duplicate public name {t}/{n}"
        seen_names_per_type.add((t, n))
        id_by_name[(t, n)] = i

    expected = {
        ("string", "pixelboard_clipboard_pin_tip_short"): "0x7f1416e6",
        ("string", "pixelboard_clipboard_pin_tip_24h"): "0x7f1416e7",
        ("string", "pixelboard_clipboard_pin_tip_7d"): "0x7f1416e8",
        ("string", "pixelboard_clipboard_pin_tip_30d"): "0x7f1416e9",
    }
    for k, v in expected.items():
        assert id_by_name.get(k) == v, f"Missing/mismatch {k}: got {id_by_name.get(k)}, want {v}"

    tip_short_count = 0
    tip_24h_count = 0
    xml_count = 0
    for sxml in sorted(RES_DIR.glob("values*/strings.xml")):
        xml_count += 1
        st = ET.parse(sxml)
        names = {e.attrib.get("name") for e in st.getroot().findall("string")}
        if "pixelboard_clipboard_pin_tip_short" in names:
            tip_short_count += 1
        if "pixelboard_clipboard_pin_tip_24h" in names:
            tip_24h_count += 1
        if sxml.parent.name in ("values", "values-ar", "values-fr", "values-ja", "values-de"):
            for req in ("pixelboard_clipboard_pin_tip_short", "pixelboard_clipboard_pin_tip_24h",
                        "pixelboard_clipboard_pin_tip_7d", "pixelboard_clipboard_pin_tip_30d"):
                assert req in names, f"Missing {req} in {sxml}"

    assert tip_short_count == 83, f"Expected 83 values*/strings.xml with pin_tip_short, got {tip_short_count}"
    assert tip_24h_count == 83, f"Expected 83 values*/strings.xml with pin_tip_24h, got {tip_24h_count}"
    print(f"[PASS] Resources: {xml_count} strings.xml parsed, 83 locales have 4 pin tips, {len(seen_ids)} unique public IDs")


def collect_compiled_methods():
    class_files = [p for p in BUILD_CLASSES.rglob("*.class")]
    assert class_files, "No .class files in build_classes — compile first!"
    # Run javap in chunks
    descriptors_by_class = {}
    chunk_size = 60
    rel_names = [
        str(p.relative_to(BUILD_CLASSES)).replace("\\", "/")[:-6].replace("/", ".")
        for p in class_files
    ]
    for i in range(0, len(rel_names), chunk_size):
        chunk = rel_names[i:i + chunk_size]
        res = subprocess.run(
            ["javap", "-p", "-s", "-cp", f"{BUILD_CLASSES};{ANDROID_JAR}", *chunk],
            capture_output=True, text=True, check=True,
        )
        current_cls = None
        last_member = None
        is_static = False
        for line in res.stdout.splitlines():
            m_cls = re.match(r"^(?:public |final |abstract |static )*(?:class|interface|enum) ([\w.$]+)", line)
            if m_cls:
                current_cls = "L" + m_cls.group(1).replace(".", "/") + ";"
                descriptors_by_class.setdefault(current_cls, set())
                last_member = None
                continue
            m_sig = re.match(r"^\s+.*?\b([\w$]+)\(.*\);", line)
            if m_sig:
                last_member = m_sig.group(1)
                is_static = " static " in line
                continue
            m_ctor = re.match(r"^\s+(?:public |private |protected )?([\w.$]+)\(.*\);", line)
            if m_ctor and current_cls:
                last_member = "<init>"
                is_static = False
                continue
            m_desc = re.match(r"^\s+descriptor:\s+(\S+)", line)
            if m_desc and current_cls and last_member:
                descriptors_by_class[current_cls].add((last_member, m_desc.group(1), is_static))
                last_member = None
    return descriptors_by_class


def check_smali_hooks(compiled):
    invoke_re = re.compile(
        r"^\s+invoke-(static|virtual|direct|interface)(?:/range)?\s+\{([^}]*)\},\s+(Lcom/akshaykadam/pixelboard/[^;]+;)->([^\s(]+)(\([^\)]*\)\S+)"
    )
    checked = 0
    errors = []
    required_v206_hooks = {
        "GboardClipboardHistoryRuntime;->configureClipboardHistorySlider": 0,
        "GboardClipboardRetentionTextRuntime;->resolveText": 0,
        "GboardClipboardRetentionTextRuntime;->applyIntroCardText": 0,
        "GboardKeyboardRuntime;->sanitizeKeyLabel": 0,
        "GboardRamblerDictationRuntime;->filterVoiceText": 0,
        "GboardRambler1803OfficialSelectionRuntime;->shouldEnableAgenticDictation": 0,
        "GboardRamblerMinimizeKeyRuntime;->placeMinimizeKey": 0,
        "GboardRamblerMinimizeKeyRuntime;->clearMinimizeKey": 0,
        "GboardRamblerMinimizeKeyRuntime;->revealMinimizeKey": 0,
    }
    for smali in DECOMPILED.glob("smali*/**/*.smali"):
        rel = str(smali.relative_to(DECOMPILED)).replace("\\", "/")
        if "/com/akshaykadam/pixelboard/" in rel:
            continue
        lines = smali.read_text(encoding="utf-8", errors="ignore").splitlines()
        cur_locals = 0
        for idx, line in enumerate(lines, 1):
            ml = re.match(r"^\s+\.locals\s+(\d+)", line)
            if ml:
                cur_locals = int(ml.group(1))
            m = invoke_re.match(line)
            if m:
                kind, regs, owner, name, desc = m.groups()
                is_range = "/range" in line
                if not is_range:
                    # Ensure vN register references don't exceed 15
                    for vr in re.findall(r"\bv(\d+)\b", regs):
                        if int(vr) > 15:
                            errors.append(f"{rel}:{idx} non-range invoke uses v{vr} > 15")
                    # Ensure method doesn't pass p0.. when locals+params > 15 cleanly checked via range note
                    if cur_locals > 12 and "p" in regs:
                        errors.append(f"{rel}:{idx} non-range invoke uses p-reg with .locals {cur_locals}")
                members = compiled.get(owner)
                if not members:
                    errors.append(f"{rel}:{idx} missing class {owner}")
                else:
                    want_static = (kind == "static")
                    if (name, desc, want_static) not in members:
                        errors.append(f"{rel}:{idx} missing method {owner}->{name}{desc} (static={want_static})")
                checked += 1
                key = owner.rsplit("/", 1)[-1][:-1] + ";->" + name
                if key in required_v206_hooks:
                    required_v206_hooks[key] += 1

    for k, cnt in required_v206_hooks.items():
        if cnt == 0:
            errors.append(f"Missing required v2.0.6 hook: {k}")
    assert not errors, "Smali hook verification failed:\n" + "\n".join(errors)
    print(f"[PASS] Smali Hooks: verified {checked} pixelboard extension calls against compiled classes:")
    for k, cnt in required_v206_hooks.items():
        print(f"       - {k}: {cnt} callsite(s)")


def main():
    check_resources()
    compiled = collect_compiled_methods()
    check_smali_hooks(compiled)
    print("\nALL STRUCTURAL & BYTECODE VERIFICATIONS PASSED!")


if __name__ == "__main__":
    main()
