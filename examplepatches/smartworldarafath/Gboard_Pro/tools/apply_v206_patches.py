#!/usr/bin/env python3
"""
Idempotent 18.4.1.985164140 smali patcher for Gboard Pro v2.0.6 (Beta 2).
Ports upstream Akshayykadam/PixelBoard (45acc60) smali hooks accurately to 18.4.1 targets.
"""
from pathlib import Path
import re
import sys

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
    # 1. fmb.smali: default clipboard retention 1h -> 24h & recent unpinned cap 5 -> 100
    fmb = ROOT / "smali_classes3" / "fmb.smali"
    replace_regex_in_method(
        fmb,
        ".method static constructor <clinit>()V",
        r"const-wide/16 v0, 0x1\b",
        "const-wide/16 v0, 0x18",
        "const-wide/16 v0, 0x18",
        "fmb.<clinit> default duration 1h -> 24h",
    )
    replace_regex_in_method(
        fmb,
        ".method public static a(Landroid/content/Context;)J",
        r'(const v0, 0x7f140911\s+(?:\.line \d+\s+)+)const-string v1, "1"',
        r'\1const-string v1, "24"',
        'const-string v1, "24"',
        "fmb.a fallback string 1 -> 24",
    )
    replace_regex_in_method(
        fmb,
        ".method public static a(Landroid/content/Context;)J",
        r"(:cond_0\s+)const-wide/32 v0, 0x36ee80\b",
        r"\1const-wide/32 v0, 0x5265c00",
        "const-wide/32 v0, 0x5265c00",
        "fmb.a disabled-flag fallback 0x36ee80 -> 0x5265c00",
    )
    replace_regex_in_method(
        fmb,
        ".method public static k(Landroid/content/Context;Z)Lwfr;",
        r"(const/4 v11, 0x5\s+(?:\.line \d+\s+)+new-array v12, v11, \[Ljava/lang/Object;)",
        r"\1\n\n    const/16 v11, 0x64",
        "const/16 v11, 0x64",
        "fmb.k recent unpinned clip limit 5 -> 100",
    )

    # 2. fkx.smali & flx.smali: recent unpinned clip cap 5 -> 100
    fkx = ROOT / "smali_classes3" / "fkx.smali"
    replace_regex_in_method(
        fkx,
        ".method public final call()Ljava/lang/Object;",
        r"const/4 v3, 0x5(\s+(?:\.line \d+\s+)+if-gt v0, v3, :cond_b)",
        r"const/16 v3, 0x64\1",
        "const/16 v3, 0x64",
        "fkx.call recent unpinned clip limit 5 -> 100",
    )
    flx = ROOT / "smali_classes3" / "flx.smali"
    replace_regex_in_method(
        flx,
        ".method public final F()V",
        r"const/4 v4, 0x5(\s+(?:\.line \d+\s+)+if-gt v2, v4, :cond_1)",
        r"const/16 v4, 0x64\1",
        "const/16 v4, 0x64",
        "flx.b recent unpinned clip limit 5 -> 100",
    )

    # 3. exc.smali: clipboard history discrete slider (1h, 24h, 7d, 30d, Never)
    exc = ROOT / "smali_classes3" / "exc.smali"
    replace_regex_in_method(
        exc,
        ".method public final b(Landroid/content/Context;Lquo;)V",
        r"(invoke-virtual \{p0\}, Landroidx/preference/Preference;->d\(\)V)",
        r"\1\n\n    invoke-static {p0, p1}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardHistoryRuntime;->configureClipboardHistorySlider(Ljava/lang/Object;Landroid/content/Context;)V",
        "GboardClipboardHistoryRuntime;->configureClipboardHistorySlider",
        "exc.b configureClipboardHistorySlider",
    )

    # 4. fku.smali, fmh.smali, fod.smali, ClipboardKeyboard.smali: honest clipboard retention texts
    fku = ROOT / "smali_classes2" / "fku.smali"
    replace_regex_in_method(
        fku,
        ".method public final f()I",
        r"(const p0, 0x7f1401a5)",
        r"\1\n\n    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardRetentionTextRuntime;->resolveText(I)I\n\n    move-result p0",
        "GboardClipboardRetentionTextRuntime;->resolveText",
        "fku.f resolveText for pin tip",
    )
    fmh = ROOT / "smali_classes3" / "fmh.smali"
    replace_regex_in_method(
        fmh,
        ".method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V",
        r"(const v3, 0x7f1401a5)",
        r"\1\n\n    invoke-static {v3}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardRetentionTextRuntime;->resolveText(I)I\n\n    move-result v3",
        "GboardClipboardRetentionTextRuntime;->resolveText",
        "fmh.onCreate resolveText for onboarding pin tip",
    )
    fod = ROOT / "smali_classes3" / "fod.smali"
    replace_regex_in_method(
        fod,
        ".method public final apply(Ljava/lang/Object;)Ljava/lang/Object;",
        r"(const v0, 0x7f14019d)",
        r"\1\n\n    invoke-static {v0}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardRetentionTextRuntime;->resolveText(I)I\n\n    move-result v0",
        "GboardClipboardRetentionTextRuntime;->resolveText",
        "fod.d resolveText for empty subtitle",
    )
    clipboard_kb = ROOT / "smali_classes3" / "com" / "google" / "android" / "apps" / "inputmethod" / "libs" / "clipboard" / "ClipboardKeyboard.smali"
    replace_regex_in_method(
        clipboard_kb,
        ".method private final Z()V",
        r"(invoke-virtual \{v11, v1, v2, v10\}, Landroid/view/LayoutInflater;->inflate\(ILandroid/view/ViewGroup;Z\)Landroid/view/View;\s+(?:\.line \d+\s+)+move-result-object v11)",
        r"\1\n\n    invoke-static {v11}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardRetentionTextRuntime;->applyIntroCardText(Landroid/view/View;)V",
        "GboardClipboardRetentionTextRuntime;->applyIntroCardText",
        "ClipboardKeyboard.Z applyIntroCardText",
    )

    # 5. AutoCenterScaleTextView.smali: symbol key label sanitizer
    actv = ROOT / "smali" / "com" / "google" / "android" / "libraries" / "inputmethod" / "widgets" / "text" / "AutoCenterScaleTextView.smali"
    replace_regex_in_method(
        actv,
        ".method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V",
        r"(\.locals \d+)",
        r"\1\n\n    invoke-static {p1}, Lcom/akshaykadam/pixelboard/extension/keyboard/GboardKeyboardRuntime;->sanitizeKeyLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;\n\n    move-result-object p1",
        "GboardKeyboardRuntime;->sanitizeKeyLabel",
        "AutoCenterScaleTextView.setText sanitizeKeyLabel",
    )

    # 6. fde.smali: Rambler voice dictation prompt fix (use invoke-static/range due to .locals 30)
    fde = ROOT / "smali" / "fde.smali"
    replace_regex_in_method(
        fde,
        ".method public final j(Laajc;Lrzc;Ljava/lang/String;)V",
        r"(\.locals 30)",
        r"\1\n\n    invoke-static/range {p0 .. p1}, Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerDictationRuntime;->filterVoiceText(Ljava/lang/Object;Ljava/lang/Object;)V",
        "GboardRamblerDictationRuntime;->filterVoiceText",
        "fde.j filterVoiceText (invoke-static/range)",
    )

    # 7. mjz.smali: Rambler toolbar mic activation
    mjz = ROOT / "smali_classes2" / "mjz.smali"
    replace_regex_in_method(
        mjz,
        ".method private static B(Landroid/content/Context;)Z",
        r"(\.locals 3)",
        r"\1\n\n    invoke-static {}, Lcom/akshaykadam/pixelboard/extension/rambler/GboardRambler1803OfficialSelectionRuntime;->shouldEnableAgenticDictation()Z\n\n    move-result v0\n\n    if-eqz v0, :cond_stock_mic\n\n    const/4 v0, 0x1\n\n    return v0\n\n    :cond_stock_mic",
        "GboardRambler1803OfficialSelectionRuntime;->shouldEnableAgenticDictation",
        "mjz.B shouldEnableAgenticDictation",
    )

    # 8. Rambler Minimize Key: fhh.smali, fgk.smali, fhe.smali
    fhh = ROOT / "smali_classes3" / "fhh.smali"
    replace_regex_in_method(
        fhh,
        ".method protected final D()Lmng;",
        r"invoke-virtual \{p0, v1, v0\}, Lfgk;->F\(ILjava/lang/Runnable;\)Lmng;\s+(?:\.line \d+\s+)+move-result-object p0\s+(?:\.line \d+\s+)+return-object p0",
        "\n".join([
            "invoke-virtual {p0, v1, v0}, Lfgk;->C(ILjava/lang/Runnable;)Lmnb;",
            "",
            "    move-result-object v0",
            "",
            "    const v1, 0x7f141679",
            "",
            "    invoke-virtual {v0, v1}, Lmnb;->h(I)V",
            "",
            "    invoke-virtual {v0}, Lmnb;->a()Lmng;",
            "",
            "    move-result-object v0",
            "",
            "    invoke-static {}, Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerMinimizeKeyRuntime;->placeMinimizeKey()I",
            "",
            "    move-result v1",
            "",
            "    if-eqz v1, :pixelboard_stock_minimize_key",
            "",
            "    invoke-static {v1, v0}, Lmnq;->a(ILmng;)V",
            "",
            "    invoke-virtual {p0}, Lfgk;->u()I",
            "",
            "    move-result v0",
            "",
            "    invoke-virtual {p0, v0}, Lfgk;->E(I)Lmng;",
            "",
            "    move-result-object v0",
            "",
            "    :pixelboard_stock_minimize_key",
            "    return-object v0",
        ]),
        "GboardRamblerMinimizeKeyRuntime;->placeMinimizeKey",
        "fhh.D moveMinimizeKeyToEndSlot",
    )
    replace_regex_in_method(
        fhh,
        ".method public final V(Landroid/view/ViewGroup;Z)V",
        r"\.locals 9(\s+(?:\.line \d+\s+)+)(if-eqz p1, :cond_5.*?)(\s+:cond_5\s+return-void)",
        r".locals 10\1move-object v9, p1\n\n    \2\n\n    :cond_5\n    invoke-static {v9}, Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerMinimizeKeyRuntime;->revealMinimizeKey(Landroid/view/ViewGroup;)V\n\n    return-void",
        "GboardRamblerMinimizeKeyRuntime;->revealMinimizeKey",
        "fhh.V revealMinimizeKey (preserving p1 in v9)",
    )

    fgk = ROOT / "smali_classes3" / "fgk.smali"
    replace_regex_in_method(
        fgk,
        ".method protected I(Lfgf;Landroid/view/View;Landroid/view/View;)V",
        r"(\.locals 1)",
        "\n".join([
            r"\1",
            "",
            "    invoke-static {}, Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerMinimizeKeyRuntime;->clearMinimizeKey()I",
            "",
            "    move-result p1",
            "",
            "    if-eqz p1, :no_minimize_key",
            "",
            '    const-string v0, "ramble_close"',
            "",
            "    invoke-static {p1, v0}, Lmnt;->a(ILjava/lang/String;)V",
            "",
            "    :no_minimize_key",
        ]),
        "GboardRamblerMinimizeKeyRuntime;->clearMinimizeKey",
        "fgk.I clearMinimizeKey",
    )

    fhe = ROOT / "smali_classes3" / "fhe.smali"
    replace_regex_in_method(
        fhe,
        ".method protected final D()Lmng;",
        r"invoke-virtual \{p0, v1, v0\}, Lfgk;->F\(ILjava/lang/Runnable;\)Lmng;\s+(?:\.line \d+\s+)+move-result-object p0",
        "\n".join([
            "invoke-virtual {p0, v1, v0}, Lfgk;->C(ILjava/lang/Runnable;)Lmnb;",
            "",
            "    move-result-object p0",
            "",
            "    const v1, 0x7f1401aa",
            "",
            "    invoke-virtual {p0, v1}, Lmnb;->h(I)V",
            "",
            "    invoke-virtual {p0}, Lmnb;->a()Lmng;",
            "",
            "    move-result-object p0",
        ]),
        "const v1, 0x7f1401aa",
        "fhe.D labelShowKeyboardKey",
    )


if __name__ == "__main__":
    main()
