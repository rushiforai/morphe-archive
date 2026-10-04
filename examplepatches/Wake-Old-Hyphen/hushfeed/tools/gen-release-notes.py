"""Embed published CHANGELOG entries from 0.60.0 onward in the Android extension."""

from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[1]
CHANGELOG = ROOT / "CHANGELOG.md"
OUTPUT = ROOT / "extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/ReleaseNotesData.java"
START = (0, 60, 0)
HEADING = re.compile(r"^## (\d+)\.(\d+)\.(\d+) \(", re.MULTILINE)


def published(text: str) -> str:
    text = text.replace("\r\n", "\n")
    matches = list(HEADING.finditer(text))
    if not matches:
        raise ValueError("CHANGELOG has no published release headings")
    sections = []
    previous = None
    for index, match in enumerate(matches):
        version = tuple(map(int, match.groups()))
        if previous is not None and version >= previous:
            raise ValueError("CHANGELOG releases are not newest first")
        previous = version
        if version < START:
            break
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        sections.append(text[match.start():end].strip())
    if not sections:
        raise ValueError("CHANGELOG has no release at or above 0.60.0")
    return "\n\n".join(sections) + "\n"


def main() -> None:
    notes = published(CHANGELOG.read_text(encoding="utf-8"))
    # CONSTANT_Utf8 counts NUL twice and supplementary characters as two surrogates.
    parts = []
    start = 0
    size = 0
    for index, character in enumerate(notes):
        code = ord(character)
        width = 1 if 0 < code < 128 else 2 if code < 2048 else 3 if code <= 65535 else 6
        if size + width > 30_000:
            parts.append(notes[start:index])
            start = index
            size = 0
        size += width
    parts.append(notes[start:])
    lines = [
        "/*",
        " * Copyright 2026 Hushfeed contributors",
        " * https://github.com/SysAdminDoc/hushfeed",
        " *",
        " * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).",
        " */",
        "package app.morphe.extension.tiktok.settings.preference;",
        "",
        "/** Published CHANGELOG entries carried inside the patched app. Run tools/gen-release-notes.py after release edits. */",
        "public final class ReleaseNotesData {",
        "    private ReleaseNotesData() {}",
        "    public static final String TEXT = new StringBuilder()",
    ]
    for part in parts:
        escaped = "".join(
            "\\\\" if character == "\\" else '\\"' if character == '"'
            else f"\\{ord(character):03o}" if ord(character) < 32 or ord(character) == 127
            else character for character in part
        )
        lines.append(f'            .append("{escaped}")')
    lines.append("            .toString();")
    lines.append("}")
    OUTPUT.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
    print(f"embedded {len(notes.splitlines())} published changelog lines in {len(parts)} chunks")


if __name__ == "__main__":
    main()
