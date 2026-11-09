#!/usr/bin/env python3
"""Synchronize localized links to the stable Finamp Complete release name."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OLD_SLUG = "preview-finamp-complete-all-seven-fixes"
NEW_SLUG = "preview-finamp-complete"
LABELS = {
    "de": ("Finamp Complete: alle sieben Änderungen", "Finamp Complete"),
    "es": ("Finamp Complete: las siete mejoras", "Finamp Complete"),
    "fr": ("Finamp Complete : les sept améliorations", "Finamp Complete"),
    "ja": ("Finamp Complete：7 件の修正をまとめて適用", "Finamp Complete"),
    "ko": ("Finamp Complete: 7개 수정 사항", "Finamp Complete"),
    "pt-BR": ("Finamp Complete: as sete melhorias", "Finamp Complete"),
    "zh-CN": ("Finamp Complete：全部七项改进", "Finamp Complete"),
}


def sync(root):
    metadata = json.loads((root / "patches-list.json").read_text(encoding="utf-8"))
    names = {p["name"] for p in metadata["patches"]}
    if "Finamp Complete" not in names:
        raise ValueError("Expected stable Finamp Complete release metadata")
    changes = []
    for locale, (old_label, new_label) in LABELS.items():
        path = root / "docs/readme" / f"README.{locale}.md"
        text = path.read_text(encoding="utf-8")
        old = f"[{old_label}](../../README.md#{OLD_SLUG})"
        new = f"[{new_label}](../../README.md#{NEW_SLUG})"
        if text.count(old) == 1 and text.count(new) == 0:
            changes.append((path, text.replace(old, new)))
        elif text.count(old) == 0 and text.count(new) == 1:
            continue
        else:
            raise ValueError(f"Unexpected Finamp Complete link in {path}")
    for path, text in changes:
        path.write_text(text, encoding="utf-8")
    return len(changes)


if __name__ == "__main__":
    print(f"Updated {sync(ROOT)} localized Finamp links")
