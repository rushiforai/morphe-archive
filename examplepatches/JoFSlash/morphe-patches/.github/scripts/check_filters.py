"""Checks filters/selectors.json, the file the Filter updates patch downloads from main.

The app reads it as: {"format": 1, "rules": {"<patch key>": ["<CSS selector>", ...]}}. Each selector
is added, with display:none, to the pages while that patch is on. The app skips entries that break
the rules below (see FilterUpdates.java); this script fails on them instead, so they never ship.

Usage: python .github/scripts/check_filters.py [path]
Exit code 1 when the file breaks a rule.
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
FILE = ROOT / "filters/selectors.json"
CATALOG = ROOT / "extensions/quora/src/main/java/app/jofslash/extension/quora/SettingsCatalog.java"

# Keep in step with FilterUpdates.java.
FORMAT = 1
MAX_BYTES = 64 * 1024
MAX_SELECTOR = 300
MAX_PER_KEY = 50
ALLOWED = re.compile(r"""[A-Za-z0-9_\-\s.#\[\]="'*^$|~:(),>+]+""")


def valid(selector):
    if not isinstance(selector, str):
        return "not a string"
    s = selector.strip()
    if not s:
        return "empty"
    if len(s) > MAX_SELECTOR:
        return f"longer than {MAX_SELECTOR} characters"
    if not ALLOWED.fullmatch(s):
        return "has a character that isn't allowed (only plain selectors: no { } ; @ \\ < or non-ASCII)"
    lower = s.lower()
    for bad in ("url(", "/*", "image("):
        if bad in lower:
            return f"contains {bad}"
    if not specific(s):
        return ("would hide too much: each part must end in an element with a class, id or attribute "
                "(not div, * or :has() alone), with brackets and quotes closed")
    return None


def marked(compound):
    """Whether one compound selector has a class, an id or an attribute outside :has()/:not()."""
    outside, depth = [], 0
    for c in compound:
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
        elif depth == 0:
            outside.append(c)
    s = "".join(outside)
    return "." in s or "#" in s or "[" in s


def specific(selector):
    """Same as FilterUpdates.specific: every part hides only elements with a class, id or attribute."""
    depth, quote, part_start, subject = 0, None, 0, 0
    for i in range(len(selector) + 1):
        c = selector[i] if i < len(selector) else ","
        if quote:
            if i == len(selector):
                return False
            if c == quote:
                quote = None
            continue
        if c in "\"'":
            quote = c
        elif c in "([":
            depth += 1
        elif c in ")]":
            depth -= 1
            if depth < 0:
                return False
        elif depth == 0 and c in " \t\n\r>+~":
            subject = i + 1
        elif depth == 0 and c == ",":
            part = selector[part_start:i].strip()
            last = selector[max(subject, part_start):i].strip()
            if not part or not last or not marked(last):
                return False
            part_start = subject = i + 1
    return depth == 0


def main():
    path = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else FILE
    raw = path.read_bytes()
    errors = []
    if len(raw) > MAX_BYTES:
        errors.append(f"{path.name} is {len(raw)} bytes; the app reads at most {MAX_BYTES}")
    data = json.loads(raw.decode("utf8"))
    if data.get("format") != FORMAT:
        errors.append(f"format must be {FORMAT}")
    rules = data.get("rules")
    if not isinstance(rules, dict):
        sys.exit("rules must be an object")
    keys = set(re.findall(r'add\("([A-Za-z]+)"', CATALOG.read_text(encoding="utf8")))
    count = 0
    for key, selectors in rules.items():
        if key == "filterUpdates" or key not in keys:
            errors.append(f"{key}: not a patch key in SettingsCatalog")
            continue
        if not isinstance(selectors, list):
            errors.append(f"{key}: must be a list of selectors")
            continue
        if len(selectors) > MAX_PER_KEY:
            errors.append(f"{key}: {len(selectors)} selectors; the app uses the first {MAX_PER_KEY}")
        for selector in selectors:
            problem = valid(selector)
            if problem:
                errors.append(f"{key}: {selector!r} {problem}")
            count += 1
    for error in errors:
        print("FAIL filters: " + error, file=sys.stderr)
    if errors:
        sys.exit(1)
    print(f"filters: {count} selectors for {len(rules)} patches")


if __name__ == "__main__":
    main()
