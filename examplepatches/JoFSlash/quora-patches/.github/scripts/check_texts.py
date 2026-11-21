"""Checks that every language in the Patch settings has every text the app shows.

The texts are the English strings passed to the settings page's builders (linkRow, note, section,
show, confirm, field hints), to Texts.t, the catalog's categories and lines, and the option labels.
Each Texts<Lang>.java must translate all of them. Texts in a language file that the app no longer
uses are listed as a warning.

Usage: python .github/scripts/check_texts.py
Exit code 1 when a language misses a text.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
EXT = ROOT / "extensions/extension/src/main/java/app/jofslash/extension/quora"
STR = r'"((?:[^"\\]|\\.)*)"'

# Texts put together at run time, so they can't be found as one string in the code.
LISTS = ["History", "Bookmarks", "Dismissed questions"]
DYNAMIC = [f"{name} copied." for name in LISTS] + [f"Search {name.lower()}" for name in LISTS] + [
    # The kind of a History item when it has no author (see byline in SettingsPage).
    "Answer by ", "Post by ", "Question",
]


def unescape(s):
    return s.encode("utf8").decode("unicode_escape").encode("latin1").decode("utf8")


def used_texts():
    used = set(DYNAMIC)
    for path in EXT.glob("*.java"):
        if path.name.startswith("Texts"):
            continue
        src = path.read_text(encoding="utf8")
        for m in re.finditer(r'Texts\.t\(' + STR + r'\s*\)', src):
            used.add(unescape(m.group(1)))
        # Texts.t(NAME) with a String constant of this file.
        for m in re.finditer(r'Texts\.t\(([A-Z][A-Z0-9_]*)\)', src):
            const = re.search(r'String\s+' + m.group(1) + r'\s*=\s*' + STR + r'\s*;', src)
            if not const:
                sys.exit(f"{path.name}: Texts.t({m.group(1)}) needs a one-string constant")
            used.add(unescape(const.group(1)))
        # The settings page builders take English text and translate it themselves: every string in
        # their arguments, up to the end of the call's statement or the start of a lambda. A string
        # followed by + is the start of a text put together at run time (see DYNAMIC).
        if path.name == "SettingsPage.java":
            for m in re.finditer(r'\b(?:linkRow|note|section|show|confirm|search|itemList|field)\(', src):
                for tok in re.finditer(STR + r'(\s*\+)?|->|;', src[m.end():]):
                    if tok.group(0) in ("->", ";"):
                        break
                    if not tok.group(2):
                        used.add(unescape(tok.group(1)))
        # Option titles: PatchSettings.choice/text("key", "option", "Title", …).
        for m in re.finditer(r'PatchSettings\.(?:choice|text)\(\s*[\w"]+\s*,\s*' + STR + r'\s*,\s*' + STR, src):
            used.add(unescape(m.group(2)))
        # Option labels: string arrays whose items read as words ("Dim", "1 year"), not codes ("dim").
        for m in re.finditer(r'(?:String\[\]\s*\w+\s*=\s*|new String\[\]\s*)\{([^}]*)\}', src):
            items = [unescape(s.group(1)) for s in re.finditer(STR, m.group(1))]
            # All capitals ("FOLLOWING") are the app's own tab names, not labels.
            if items and all(re.match(r'[A-Z0-9]', i) and re.search(r'[a-z]', i) for i in items):
                used.update(items)
        if path.name == "SettingsCatalog.java":
            for m in re.finditer(r'add\("\w+",\s*"(\w+)",\s*' + STR + r'\)', src):
                used.add(m.group(1))
                used.add(unescape(m.group(2)))
            for m in re.finditer(r'CATEGORIES\s*=\s*\{([^}]*)\}', src):
                for s in re.finditer(STR, m.group(1)):
                    used.add(unescape(s.group(1)))
    return used


def language_texts():
    languages = {}
    for path in sorted(EXT.glob("Texts?*.java")):
        src = path.read_text(encoding="utf8")
        keys = [unescape(m.group(1)) for m in re.finditer(r'm\.put\(\s*' + STR + r'\s*,', src)]
        languages[path.stem[len("Texts"):]] = keys
    return languages


def main():
    used = used_texts()
    languages = language_texts()
    if not languages:
        sys.exit("No Texts<Lang>.java files found.")
    failed = False
    for lang, keys in languages.items():
        have = set(keys)
        dupes = sorted({k for k in keys if keys.count(k) > 1})
        missing = sorted(used - have)
        unused = sorted(have - used)
        print(f"{lang}: {len(have)} texts, {len(missing)} missing, {len(unused)} not used")
        for text in missing:
            print(f"  MISSING {text!r}")
        for text in dupes:
            print(f"  TWICE   {text!r}")
        for text in unused:
            print(f"  unused  {text!r}")
        failed |= bool(missing or dupes)
    # Every language file must be picked in Texts.load, and every language picked there must exist.
    loader = (EXT / "Texts.java").read_text(encoding="utf8")
    wired = {m.group(2): m.group(1) for m in re.finditer(r'case "([a-z]{2})":\s*Texts(\w+)\.fill', loader)}
    for lang in sorted(set(languages) - set(wired)):
        print(f"  NOT USED Texts{lang}.java isn't picked in Texts.load")
        failed = True
    for lang in sorted(set(wired) - set(languages)):
        print(f"  MISSING FILE Texts{lang}.java is picked in Texts.load but doesn't exist")
        failed = True
    for lang, code in wired.items():
        if lang.lower() != code:
            print(f"  WRONG CODE Texts{lang}.java is picked for \"{code}\"")
            failed = True
    print(f"{len(used)} texts in use, {len(languages)} languages.")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
