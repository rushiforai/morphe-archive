#!/usr/bin/env python3
"""Writes Translations.java from translations/*.json.

translations/source.json lists every English phrase the patch's pages show. Each
translations/<language>.json maps those phrases to that language; a phrase that's missing shows
in English. {0}, {1} and so on stand for numbers and names and must stay in the translation.
"""

import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
FOLDER = ROOT / "translations"
OUT = ROOT / "extensions/telegram/src/main/java/app/bitchord/telegram/Translations.java"


def literal(text):
    return json.dumps(text, ensure_ascii=True)


def load():
    source = json.loads((FOLDER / "source.json").read_text(encoding="utf-8"))
    languages = {}
    for path in sorted(FOLDER.glob("*.json")):
        if path.stem == "source":
            continue
        languages[path.stem] = json.loads(path.read_text(encoding="utf-8"))
    return source, languages


def problems(source, languages):
    found = []
    known = set(source)
    for lang, table in languages.items():
        for english, translated in table.items():
            if english not in known:
                found.append(
                    f"{lang}: not an English phrase the pages use: {english!r}"
                )
            elif sorted(re.findall(r"\{\d\}", english)) != sorted(
                re.findall(r"\{\d\}", translated)
            ):
                found.append(
                    f"{lang}: placeholders differ: {english!r} -> {translated!r}"
                )
        for english in source:
            if english not in table:
                found.append(f"{lang}: missing {english!r}")
    return found


def java(source, languages):
    lines = [
        "package app.bitchord.telegram;",
        "",
        "/** Made by tools/translations.py from translations/*.json; edit those, not this. */",
        "final class Translations {",
        "    private Translations() {}",
        "",
        "    /** English phrase, translation, English phrase, translation, ... */",
        "    static String[] table(String language) {",
        "        switch (language) {",
    ]
    for lang in languages:
        lines.append(f'            case "{lang}":')
        lines.append(f"                return {lang}();")
    lines += [
        "            default:",
        "                return new String[0];",
        "        }",
        "    }",
    ]
    for lang, table in languages.items():
        lines += [
            "",
            f"    private static String[] {lang}() {{",
            "        return new String[] {",
        ]
        for english in source:
            if english in table:
                lines.append(f"            {literal(english)},")
                lines.append(f"            {literal(table[english])},")
        lines += ["        };", "    }"]
    lines.append("}")
    return "\n".join(lines) + "\n"


def main():
    source, languages = load()
    if "--check" in sys.argv:
        # Only checks the named languages, writing nothing: python3 tools/translations.py --check de
        wanted = sys.argv[sys.argv.index("--check") + 1 :]
        issues = problems(source, {lang: languages[lang] for lang in wanted})
        for issue in issues:
            print(issue, file=sys.stderr)
        print(f"{len(issues)} problems in {', '.join(wanted)}")
        return 1 if issues else 0
    issues = problems(source, languages)
    for issue in issues:
        print(issue, file=sys.stderr)
    OUT.write_text(java(source, languages), encoding="utf-8")
    print(
        f"{len(source)} phrases, {len(languages)} languages -> {OUT.relative_to(ROOT)}"
    )
    return 1 if issues and "--strict" in sys.argv else 0


if __name__ == "__main__":
    sys.exit(main())
