#!/usr/bin/env python3
"""
Normalizes changelog bullet scopes in CHANGELOG.md and patches-bundle.json
so that Morphe Manager recognizes them as applicable to Google Photos.

Morphe Manager's ChangelogParser checks if bullet scopes match the app name
(e.g., 'Google Photos' or 'Photos', or start with 'Google Photos - ' / 'Photos - ').
If a bullet is unscoped or has an internal scope like 'flags', 'updater', or 'googlephotos',
Morphe Manager assumes it is for another app and hides the 'Update' badge on the home screen.

This script ensures every bullet is properly scoped with 'Google Photos' or 'Google Photos - <Scope>'.
"""

import json
import re
import sys
from pathlib import Path

BULLET_RE = re.compile(r"^(\s*\*\s+)(.*)$")
SCOPE_RE = re.compile(r"^\*\*(.+?):\*\*\s*(.*)$")

def normalize_bullet(line: str) -> str:
    m = BULLET_RE.match(line)
    if not m:
        return line
    prefix, body = m.group(1), m.group(2)
    
    sm = SCOPE_RE.match(body)
    if sm:
        scope = sm.group(1).strip()
        text = sm.group(2).strip()
        scope_lower = scope.lower()
        if scope_lower in ["googlephotos", "photos", "google-photos", "google photos"]:
            new_scope = "Google Photos"
        elif scope_lower.startswith("google photos - ") or scope_lower.startswith("photos - "):
            new_scope = scope
        elif scope_lower.startswith("googlephotos - ") or scope_lower.startswith("google-photos - "):
            suffix = scope.split("-", 1)[1].strip()
            new_scope = f"Google Photos - {suffix}"
        else:
            comp = scope.replace("-", " ").strip().title()
            new_scope = f"Google Photos - {comp}"
        return f"{prefix}**{new_scope}:** {text}"
    else:
        # Unscoped bullet
        return f"{prefix}**Google Photos:** {body.strip()}"

def normalize_text(text: str) -> str:
    return "\n".join(normalize_bullet(line) for line in text.splitlines())

def process_changelog(changelog_path: Path):
    if not changelog_path.exists():
        return
    content = changelog_path.read_text(encoding="utf-8")
    normalized = normalize_text(content)
    if content != normalized:
        changelog_path.write_text(normalized, encoding="utf-8")
        print(f"✅ Normalized {changelog_path}")

def process_bundle_json(bundle_path: Path):
    if not bundle_path.exists():
        return
    with open(bundle_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    desc = data.get("description")
    if desc:
        norm_desc = normalize_text(desc)
        if desc != norm_desc:
            data["description"] = norm_desc
            with open(bundle_path, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2)
                f.write("\n")
            print(f"✅ Normalized {bundle_path}")

if __name__ == "__main__":
    process_changelog(Path("CHANGELOG.md"))
    process_bundle_json(Path("patches-bundle.json"))
