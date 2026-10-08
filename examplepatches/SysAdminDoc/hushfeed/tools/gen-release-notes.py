"""Embed published CHANGELOG entries from 0.60.0 onward in the Android extension.

Translated sections live in extensions/tiktok/src/main/l10n/notes/<table>.txt, one file per
settings table, each holding "## X.Y.Z (date)" sections in the CHANGELOG's own shape. A release
is translated for every table or for none (#91), so What's new never shows one language a
release in its own words and the next language the English.
"""

from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[1]
CHANGELOG = ROOT / "CHANGELOG.md"
OUTPUT = ROOT / "extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/ReleaseNotesData.java"
NOTES = ROOT / "extensions/tiktok/src/main/l10n/notes"
LANGUAGES = ("az", "de", "es", "in", "it", "pt-rBR", "ru", "tr")
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


def releases(text: str) -> dict:
    """Each "## X.Y.Z (" section of the text, keyed by its version."""
    text = text.replace("\r\n", "\n")
    matches = list(HEADING.finditer(text))
    found = {}
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        found[tuple(map(int, match.groups()))] = text[match.start():end].strip()
    return found


def bullets(section: str) -> int:
    return sum(1 for line in section.split("\n") if line.startswith("* "))


def name(version: tuple) -> str:
    return ".".join(map(str, version))


def translations(english: str) -> dict:
    """The translated notes by table, after checking every release is in every table or none."""
    shipped = releases(english)
    found = {}
    if NOTES.is_dir():
        for path in sorted(NOTES.glob("*.txt")):
            if path.stem not in LANGUAGES:
                raise ValueError(f"{path.name} has no settings table to go with it")
            sections = releases(path.read_text(encoding="utf-8"))
            if not sections:
                raise ValueError(f"{path.name} has no release heading")
            for version, section in sections.items():
                if version not in shipped:
                    raise ValueError(f"{path.name} translates {name(version)}, which the CHANGELOG "
                                     "hasn't published")
                if bullets(section) != bullets(shipped[version]):
                    raise ValueError(f"{path.name} has {bullets(section)} bullets for {name(version)}, "
                                     f"the CHANGELOG has {bullets(shipped[version])}")
            found[path.stem] = sections
    for version in sorted({v for sections in found.values() for v in sections}, reverse=True):
        missing = [language for language in LANGUAGES if version not in found.get(language, {})]
        if missing:
            raise ValueError(f"{name(version)} is translated for some tables but not "
                             f"{', '.join(missing)}: translate it for every table or none")
    return {language: "\n\n".join(sections[v] for v in sorted(sections, reverse=True)) + "\n"
            for language, sections in found.items()}


def builder(notes: str) -> list:
    """The text as StringBuilder appends of at most 30,000 class-file bytes each."""
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
    lines = []
    for part in parts:
        escaped = "".join(
            "\\\\" if character == "\\" else '\\"' if character == '"'
            else f"\\{ord(character):03o}" if ord(character) < 32 or ord(character) == 127
            else character for character in part
        )
        lines.append(f'            .append("{escaped}")')
    return lines


def constant(language: str) -> str:
    return "NOTES_" + language.upper().replace("-", "_")


def main() -> None:
    notes = published(CHANGELOG.read_text(encoding="utf-8"))
    translated = translations(notes)
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
    lines += builder(notes)
    lines.append("            .toString();")
    lines += [
        "",
        "    /** The translated notes for a settings table tag (lower case, as L10n reads it), or null. */",
        "    public static String translated(String tag) {",
        "        if (tag == null) return null;",
        "        switch (tag) {",
    ]
    for language in sorted(translated):
        # L10nTranslations reads Indonesian's table for both of Java's codes.
        for tag in [language.lower()] + (["id"] if language == "in" else []):
            lines.append(f'            case "{tag}":')
        lines.append(f'                return {constant(language)};')
    lines += ["            default: return null;", "        }", "    }"]
    for language in sorted(translated):
        lines.append("")
        lines.append(f"    private static final String {constant(language)} = new StringBuilder()")
        lines += builder(translated[language])
        lines.append("            .toString();")
    lines.append("}")
    OUTPUT.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
    print(f"embedded {len(notes.splitlines())} published changelog lines and "
          f"{len(translated)} translations")


if __name__ == "__main__":
    main()
