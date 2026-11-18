#!/usr/bin/env python3
"""
Automated Ad-Removal Patcher for Da Fit (com.crrepa.band.dafit) v2.8.4 (15983).

Targets identified via DEX & resource static analysis:
1. smali/a8/a.smali -> d()V:
   Neutralizes the presenter method that queries BandExtendProvider for ExtendMenuModel.AD (type=4),
   fetches the banner image via Picasso, and invokes Lb8/a;->X(...). Instead, immediately invokes
   Lb8/a;->i0()V to keep the ad banner hidden (View.GONE).
2. smali_classes2/com/crrepa/band/my/home/device/BandSettingFragment.smali -> X(Lcom/squareup/picasso/t;Ljava/lang/String;)V:
   Neutralizes the view method that sets ivAdPreview to View.VISIBLE and attaches the ad URL click
   listener (BandSettingFragment$d), redirecting it to call i0()V (View.GONE).
3. smali_classes2/com/crrepa/band/my/model/band/provider/BandExtendProvider.smali -> getExtendList()Ljava/util/List;:
   Forces getExtendList() to return null so no remote or cached promotional/ad entries from BandConfig
   are returned anywhere in the app.
4. res/layout/fragment_band_setting.xml -> @id/iv_ad_preview:
   Collapses the 120dp ad banner ImageView to 0dp width/height and visibility="gone".
5. AndroidManifest.xml:
   Strips com.google.android.gms.permission.AD_ID permission.
"""

import re
import sys
from pathlib import Path


def replace_smali_method_body(smali_text: str, method_header_regex: str, new_body_lines: list[str]) -> tuple[str, int]:
    """
    Finds a smali .method ... .end method block matching `method_header_regex`,
    preserves the .method declaration line and any .annotation ... .end annotation blocks,
    and replaces the executable body with `new_body_lines`.
    """
    pattern = re.compile(
        r"(^[ \t]*\.method\s+" + method_header_regex + r"[ \t]*\r?\n)(.*?)(^[ \t]*\.end method\b)",
        re.MULTILINE | re.DOTALL,
    )

    def _repl(match: re.Match) -> str:
        header = match.group(1)
        inner = match.group(2)
        footer = match.group(3)
        annotations = re.findall(
            r"([ \t]*\.annotation\b.*?\.end annotation[ \t]*\r?\n)",
            inner,
            flags=re.DOTALL,
        )
        body_str = "\n".join(f"    {line}" if line else "" for line in new_body_lines) + "\n"
        return header + "".join(annotations) + body_str + footer

    return pattern.subn(_repl, smali_text)


def find_smali_file(root: Path, relative_path: str) -> Path:
    """Locate a smali file across smali, smali_classes2, smali_classes3, etc."""
    for smali_dir in sorted(root.glob("smali*")):
        candidate = smali_dir / relative_path
        if candidate.is_file():
            return candidate
    raise FileNotFoundError(f"Could not find {relative_path} under any smali* directory in {root}")


def patch_presenter_a8_a(root: Path) -> None:
    target = find_smali_file(root, "a8/a.smali")
    text = target.read_text(encoding="utf-8")
    new_text, count = replace_smali_method_body(
        text,
        r"[^\r\n]*?\bd\(\)V",
        [
            ".locals 1",
            "",
            "iget-object v0, p0, La8/a;->a:Lb8/a;",
            "",
            "if-eqz v0, :cond_0",
            "",
            "invoke-interface {v0}, Lb8/a;->i0()V",
            "",
            ":cond_0",
            "return-void",
        ],
    )
    if count != 1:
        raise RuntimeError(f"Expected to patch 1 occurrence of La8/a;->d()V in {target}, patched {count}")
    target.write_text(new_text, encoding="utf-8")
    print(f"[+] Patched {target.relative_to(root)} (La8/a;->d()V)")


def patch_band_setting_fragment(root: Path) -> None:
    target = find_smali_file(root, "com/crrepa/band/my/home/device/BandSettingFragment.smali")
    text = target.read_text(encoding="utf-8")
    new_text, count = replace_smali_method_body(
        text,
        r"[^\r\n]*?\bX\(Lcom/squareup/picasso/t;Ljava/lang/String;\)V",
        [
            ".locals 0",
            "",
            "invoke-virtual {p0}, Lcom/crrepa/band/my/home/device/BandSettingFragment;->i0()V",
            "",
            "return-void",
        ],
    )
    if count != 1:
        raise RuntimeError(
            f"Expected to patch 1 occurrence of BandSettingFragment->X(...)V in {target}, patched {count}"
        )
    target.write_text(new_text, encoding="utf-8")
    print(f"[+] Patched {target.relative_to(root)} (BandSettingFragment->X(...)V)")


def patch_band_extend_provider(root: Path) -> None:
    target = find_smali_file(root, "com/crrepa/band/my/model/band/provider/BandExtendProvider.smali")
    text = target.read_text(encoding="utf-8")
    new_text, count = replace_smali_method_body(
        text,
        r"[^\r\n]*?\bgetExtendList\(\)Ljava/util/List;",
        [
            ".locals 1",
            "",
            "const/4 v0, 0x0",
            "",
            "return-object v0",
        ],
    )
    if count != 1:
        raise RuntimeError(
            f"Expected to patch 1 occurrence of BandExtendProvider->getExtendList() in {target}, patched {count}"
        )
    target.write_text(new_text, encoding="utf-8")
    print(f"[+] Patched {target.relative_to(root)} (BandExtendProvider->getExtendList())")


def patch_band_setting_layout(root: Path) -> None:
    target = root / "res/layout/fragment_band_setting.xml"
    if not target.is_file():
        print("[i] Skipping res/layout/fragment_band_setting.xml (not present in -r mode; iv_ad_preview is already visibility=gone by default)")
        return
    raw = target.read_bytes()
    if raw[:4] == b"\x03\x00\x08\x00":
        print("[i] Skipping res/layout/fragment_band_setting.xml (binary XML in -r mode; iv_ad_preview is already visibility=gone by default)")
        return
    text = raw.decode("utf-8")

    # Collapse the iv_ad_preview ImageView height/width to 0.0dip and keep visibility="gone"
    def _collapse_ad_view(match: re.Match) -> str:
        tag = match.group(0)
        tag = re.sub(r'android:layout_width="[^"]*"', 'android:layout_width="0.0dip"', tag)
        tag = re.sub(r'android:layout_height="[^"]*"', 'android:layout_height="0.0dip"', tag)
        tag = re.sub(r'android:visibility="[^"]*"', 'android:visibility="gone"', tag)
        return tag

    new_text, count = re.subn(
        r"<ImageView\b[^>]*android:id=\"@(?:\+id|id)/iv_ad_preview\"[^>]*/>",
        _collapse_ad_view,
        text,
    )
    if count != 1:
        raise RuntimeError(f"Expected to patch 1 iv_ad_preview ImageView in {target}, patched {count}")
    target.write_text(new_text, encoding="utf-8")
    print(f"[+] Patched {target.relative_to(root)} (@id/iv_ad_preview collapsed to 0dp & gone)")


def patch_manifest(root: Path) -> None:
    target = root / "AndroidManifest.xml"
    if not target.is_file():
        return
    raw = target.read_bytes()
    if raw[:4] == b"\x03\x00\x08\x00":
        print("[i] Skipping AndroidManifest.xml text patch (binary XML in -r mode)")
        return
    text = raw.decode("utf-8")
    new_text, count = re.subn(
        r'[ \t]*<uses-permission\b[^>]*android:name="com\.google\.android\.gms\.permission\.AD_ID"[^>]*/>\r?\n?',
        "",
        text,
    )
    target.write_text(new_text, encoding="utf-8")
    print(f"[+] Patched {target.relative_to(root)} (removed {count} AD_ID permission declaration(s))")


def main() -> None:
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <apktool-decompiled-dir>", file=sys.stderr)
        sys.exit(1)

    decompiled_dir = Path(sys.argv[1]).resolve()
    if not decompiled_dir.is_dir():
        raise SystemExit(f"Decompiled directory not found: {decompiled_dir}")

    patch_presenter_a8_a(decompiled_dir)
    patch_band_setting_fragment(decompiled_dir)
    patch_band_extend_provider(decompiled_dir)
    patch_band_setting_layout(decompiled_dir)
    patch_manifest(decompiled_dir)
    print("[✓] All Da Fit ad-removal patches applied successfully.")


if __name__ == "__main__":
    main()
