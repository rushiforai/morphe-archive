#!/usr/bin/env python3
"""
Idempotent smali patcher for Gboard Pro v2.1.0 (PixelBoard 1.3.6 upstream port).
Applies:
1. Candidate emoji placement on right slot in LatinFixedCountCandidatesHolderView.smali
2. Safe keypress and drag haptic feedback hook in pny.smali and pig.smali
3. Launcher icon visibility unlock in rxk.smali and ppd.smali
4. minSdkVersion: 29 in apktool.yml (Android 10+ support)
"""
import os
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / "temp_decompiled"


def replace_once(path: Path, old: str, new: str, marker: str, label: str):
    txt = path.read_text(encoding="utf-8")
    if marker in txt:
        print(f"[SKIP] {label}: already applied")
        return
    count = txt.count(old)
    if count != 1:
        raise RuntimeError(f"[FAIL] {label}: expected 1 occurrence of target in {path}, found {count}")
    path.write_text(txt.replace(old, new, 1), encoding="utf-8")
    print(f"[OK]   {label}")


def replace_regex_in_method(path: Path, method_sig: str, pattern: str, repl: str, marker: str, label: str):
    txt = path.read_text(encoding="utf-8")
    if marker in txt:
        print(f"[SKIP] {label}: already applied")
        return
    m_start = txt.find(method_sig)
    if m_start < 0:
        raise RuntimeError(f"[FAIL] {label}: method {method_sig} not found in {path}")
    m_end = txt.find(".end method", m_start)
    if m_end < 0:
        raise RuntimeError(f"[FAIL] {label}: .end method not found after {method_sig} in {path}")
    body = txt[m_start:m_end]
    new_body, n = re.subn(pattern, repl, body, count=1, flags=re.MULTILINE | re.DOTALL)
    if n != 1:
        raise RuntimeError(f"[FAIL] {label}: pattern matched {n} times in {method_sig} of {path}")
    path.write_text(txt[:m_start] + new_body + txt[m_end:], encoding="utf-8")
    print(f"[OK]   {label}")


def main():
    print("=== Applying Gboard Pro v2.1.0 smali patches ===")

    # 1. LatinFixedCountCandidatesHolderView: candidate emoji reordering to right slot
    holder_view = ROOT / "smali_classes2" / "com" / "google" / "android" / "apps" / "inputmethod" / "latin" / "keyboard" / "widget" / "LatinFixedCountCandidatesHolderView.smali"
    replace_regex_in_method(
        holder_view,
        ".method public final D(Ljava/util/List;Ljava/util/ArrayList;)V",
        r"(\.locals 26)",
        r"""\1

    invoke-static/range {p0 .. p1}, Lcom/akshaykadam/pixelboard/extension/emoji/GboardCandidateEmojiRuntime;->reorderCandidatesForStrip(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;

    move-result-object p1""",
        "GboardCandidateEmojiRuntime;->reorderCandidatesForStrip",
        "LatinFixedCountCandidatesHolderView.D emoji reorder hook",
    )

    # 2. Keypress haptic feedback: pny.smali
    pny = ROOT / "smali_classes2" / "pny.smali"
    pny_txt = pny.read_text(encoding="utf-8")
    if "GboardKeyboardRuntime;->performHapticFeedback" in pny_txt:
        print("[SKIP] pny.smali performHapticFeedback: already applied")
    else:
        # Replace all invoke-virtual {regView, regConstant}, Landroid/view/View;->performHapticFeedback(I)Z
        pattern = r"invoke-virtual \{([^}]+)\}, Landroid/view/View;->performHapticFeedback\(I\)Z"
        repl = r"invoke-static {\1}, Lcom/akshaykadam/pixelboard/extension/keyboard/GboardKeyboardRuntime;->performHapticFeedback(Landroid/view/View;I)Z"
        new_txt, count = re.subn(pattern, repl, pny_txt)
        if count != 6:
            raise RuntimeError(f"[FAIL] pny.smali: expected 6 performHapticFeedback calls, replaced {count}")
        pny.write_text(new_txt, encoding="utf-8")
        print(f"[OK]   pny.smali performHapticFeedback ({count} calls replaced)")

    # 3. Cursor drag haptic feedback: pig.smali
    pig = ROOT / "smali_classes3" / "pig.smali"
    replace_regex_in_method(
        pig,
        ".method public final d(II)V",
        r"invoke-virtual \{p1, v2\}, Landroid/view/View;->performHapticFeedback\(I\)Z",
        r"invoke-static {p1, v2}, Lcom/akshaykadam/pixelboard/extension/keyboard/GboardKeyboardRuntime;->performHapticFeedback(Landroid/view/View;I)Z",
        "GboardKeyboardRuntime;->performHapticFeedback",
        "pig.smali cursor drag performHapticFeedback",
    )

    # 4. Launcher icon unlock: rxk.smali (Environment)
    rxk = ROOT / "smali_classes2" / "rxk.smali"
    replace_regex_in_method(
        rxk,
        ".method public static t(Landroid/content/Context;)Z",
        r"(\.locals 1)",
        r"""\1

    const/4 p0, 0x0

    return p0""",
        "const/4 p0, 0x0\n\n    return p0",
        "rxk.t launcher icon configurable unlock",
    )

    # 5. Launcher icon preference filter: ppd.smali
    ppd = ROOT / "smali_classes2" / "ppd.smali"
    replace_regex_in_method(
        ppd,
        ".method public static d(Landroid/content/Context;)Z",
        r"(\.locals 5)",
        r"""\1

    const/4 p0, 0x0

    return p0""",
        "const/4 p0, 0x0\n\n    return p0",
        "ppd.d launcher icon preference filter unlock",
    )

    # 6. apktool.yml: minSdkVersion: 29
    apktool_yml = ROOT / "apktool.yml"
    yml_txt = apktool_yml.read_text(encoding="utf-8")
    if "minSdkVersion: '29'" in yml_txt or "minSdkVersion: 29" in yml_txt:
        print("[SKIP] apktool.yml minSdkVersion 29: already applied")
    else:
        new_yml = re.sub(r"minSdkVersion: \d+", "minSdkVersion: '29'", yml_txt, count=1)
        if new_yml == yml_txt:
            raise RuntimeError("[FAIL] apktool.yml: minSdkVersion not replaced")
        apktool_yml.write_text(new_yml, encoding="utf-8")
        print("[OK]   apktool.yml minSdkVersion -> '29'")

    print("\nAll v2.1.0 patches applied successfully!")


if __name__ == "__main__":
    main()
