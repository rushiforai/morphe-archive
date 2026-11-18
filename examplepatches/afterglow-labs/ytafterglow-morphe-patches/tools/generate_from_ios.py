#!/usr/bin/env python3
"""Generate the Android settings registry and translations from the iOS tweak.

The iOS repo is the single source of truth. This script reads:
  * Utils/YTAGPreferenceDescriptor.m  - every preference, action and destination
  * layout/Library/Application Support/YTAfterglow.bundle/<lang>.lproj/Localizable.strings

and writes:
  * tools/ios-registry.json                       - parsed snapshot used by parity checks
  * extensions/.../settings/Registry.java          - the same table for the extension
  * extensions/.../i18n/Strings_<lang>.java         - one string table per language
  * extensions/.../i18n/StringTables.java           - language lookup

Run: python3 tools/generate_from_ios.py /path/to/YTAfterglow
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXT_JAVA = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
REGISTRY_JAVA = EXT_JAVA / "settings/Registry.java"
I18N_DIR = EXT_JAVA / "i18n"
SNAPSHOT = ROOT / "tools/ios-registry.json"

MACROS = ("BOOLEAN", "INTEGER", "STRING", "ACTION", "DESTINATION")
CATEGORY_ORDER = [
    ("YTAGPreferenceCategoryPrivacySafety", "PRIVACY_SAFETY", "Privacy & Safety"),
    ("YTAGPreferenceCategoryAppearance", "APPEARANCE", "Appearance"),
    ("YTAGPreferenceCategoryPlayback", "PLAYBACK", "Playback"),
    ("YTAGPreferenceCategoryPlayerOverlay", "PLAYER_OVERLAY", "Player & Overlay"),
    ("YTAGPreferenceCategoryShorts", "SHORTS", "Shorts"),
    ("YTAGPreferenceCategoryFeed", "FEED", "Feed"),
    ("YTAGPreferenceCategoryDownloadsVault", "DOWNLOADS_VAULT", "Downloads & Vault"),
    ("YTAGPreferenceCategoryExperiments", "EXPERIMENTS", "Experiments"),
    ("YTAGPreferenceCategoryAdvanced", "ADVANCED", "Advanced"),
]
CATEGORY_JAVA = {objc: java for objc, java, _ in CATEGORY_ORDER}

# iOS .lproj folder -> Java class suffix and the Android language tags it serves.
LANGUAGES = {
    "en": ("en", ["en"]),
    "ar": ("ar", ["ar"]),
    "es": ("es", ["es"]),
    "fr": ("fr", ["fr"]),
    "it": ("it", ["it"]),
    "ja": ("ja", ["ja"]),
    "ko": ("ko", ["ko"]),
    "pl": ("pl", ["pl"]),
    "ru": ("ru", ["ru"]),
    "tr": ("tr", ["tr"]),
    "vi": ("vi", ["vi"]),
    "zh-Hans": ("zh_Hans", ["zh-Hans", "zh-CN", "zh-SG", "zh"]),
    "zh-Hant": ("zh_Hant", ["zh-Hant", "zh-TW", "zh-HK", "zh-MO"]),
}


# ---------------------------------------------------------------- ObjC parsing

def strip_line_comments(text: str) -> str:
    """Remove // comments that are outside string literals."""
    out = []
    for line in text.splitlines():
        in_str = False
        escaped = False
        cut = len(line)
        for i, ch in enumerate(line):
            if in_str:
                if escaped:
                    escaped = False
                elif ch == "\\":
                    escaped = True
                elif ch == '"':
                    in_str = False
            elif ch == '"':
                in_str = True
            elif ch == "/" and line[i:i + 2] == "//":
                cut = i
                break
        out.append(line[:cut])
    return "\n".join(out)


def scan_call(text: str, start: int) -> tuple[str, int]:
    """Return the argument text of a call whose '(' is at `start`, and the end index."""
    depth = 0
    in_str = False
    escaped = False
    for i in range(start, len(text)):
        ch = text[i]
        if in_str:
            if escaped:
                escaped = False
            elif ch == "\\":
                escaped = True
            elif ch == '"':
                in_str = False
            continue
        if ch == '"':
            in_str = True
        elif ch in "([{":
            depth += 1
        elif ch in ")]}":
            depth -= 1
            if depth == 0:
                return text[start + 1:i], i + 1
    raise ValueError(f"unbalanced call at {start}")


def split_args(args: str) -> list[str]:
    parts, depth, in_str, escaped, cur = [], 0, False, False, []
    for ch in args:
        if in_str:
            cur.append(ch)
            if escaped:
                escaped = False
            elif ch == "\\":
                escaped = True
            elif ch == '"':
                in_str = False
            continue
        if ch == '"':
            in_str = True
            cur.append(ch)
        elif ch in "([{":
            depth += 1
            cur.append(ch)
        elif ch in ")]}":
            depth -= 1
            cur.append(ch)
        elif ch == "," and depth == 0:
            parts.append("".join(cur).strip())
            cur = []
        else:
            cur.append(ch)
    if "".join(cur).strip():
        parts.append("".join(cur).strip())
    return parts


def decode_c_escapes(body: str) -> str:
    out, i = [], 0
    while i < len(body):
        ch = body[i]
        if ch == "\\" and i + 1 < len(body):
            nxt = body[i + 1]
            out.append({"n": "\n", "t": "\t", '"': '"', "\\": "\\", "'": "'"}.get(nxt, "\\" + nxt))
            i += 2
        else:
            out.append(ch)
            i += 1
    return "".join(out)


def objc_string(token: str) -> str:
    token = token.strip()
    if not (token.startswith('@"') and token.endswith('"')):
        raise ValueError(f"not an ObjC string: {token!r}")
    value = decode_c_escapes(token[2:-1])
    # Fallback texts were copied from .strings files, which escape quotes and
    # newlines themselves; decode that second layer too.
    return decode_c_escapes(value) if "\\" in value else value


def objc_value(token: str):
    token = token.strip()
    if token == "nil":
        return None
    if token == "@YES":
        return True
    if token == "@NO":
        return False
    if re.fullmatch(r"@-?\d+", token):
        return int(token[1:])
    if token.startswith('@"'):
        return objc_string(token)
    raise ValueError(f"unsupported default value {token!r}")


def parse_flags(token: str) -> list[str]:
    flags = []
    for part in token.split("|"):
        part = part.strip()
        if part == "YTAGPreferenceFlagAdvanced":
            flags.append("advanced")
        elif part == "YTAGPreferenceFlagRestartRequired":
            flags.append("restartRequired")
        elif part != "YTAGPreferenceFlagNone":
            raise ValueError(f"unknown flag {part!r}")
    return flags


def parse_aliases(token: str) -> list[str]:
    token = token.strip()
    if not token.startswith("ALIASES("):
        raise ValueError(f"expected ALIASES(...), got {token!r}")
    inner = token[len("ALIASES("):-1]
    return [objc_string(part) for part in split_args(inner)] if inner.strip() else []


def parse_capability(token: str) -> str | None:
    token = token.strip()
    if token == "YTAGYouTubeCapabilityCount":
        return None
    if not token.startswith("YTAGYouTubeCapability"):
        raise ValueError(f"unknown capability {token!r}")
    return token[len("YTAGYouTubeCapability"):]


def parse_registry(path: Path) -> tuple[list[dict], list[str]]:
    text = strip_line_comments(path.read_text(encoding="utf-8"))
    body_start = text.index("YTAGPreferenceBuildRegistry(void)")
    body_end = text.index("YTAGPreferenceBuildInternalKeys(void)")
    body = text[body_start:body_end]
    entries = []
    for match in re.finditer(r"\b(" + "|".join(MACROS) + r")\(", body):
        args_text, _ = scan_call(body, match.end() - 1)
        args = split_args(args_text)
        kind = match.group(1)
        entry = {"type": kind.lower()}
        if kind in ("BOOLEAN", "INTEGER", "STRING"):
            key, title_key, title, desc, category, default, flags, cap, symbol, aliases = args
            entry["default"] = objc_value(default)
            entry["destination"] = None
        elif kind == "ACTION":
            key, title_key, title, desc, category, flags, cap, symbol, aliases = args
            entry["default"] = None
            entry["destination"] = None
        else:
            key, title_key, title, desc, category, destination, flags, cap, symbol, aliases = args
            entry["default"] = None
            entry["destination"] = objc_string(destination)
        entry.update({
            "key": objc_string(key),
            "titleKey": objc_string(title_key),
            "title": objc_string(title),
            "description": objc_string(desc),
            "category": CATEGORY_JAVA[category.strip()],
            "flags": parse_flags(flags),
            "capability": parse_capability(cap),
            "symbol": objc_string(symbol),
            "aliases": parse_aliases(aliases),
        })
        entries.append(entry)

    internal_text = text[body_end:]
    internal_body, _ = scan_call(internal_text, internal_text.index("@[") + 1)
    internal = [objc_string(m.group(1)) for m in re.finditer(r"INTERNAL\((@\"(?:[^\"\\]|\\.)*\")\)", internal_body)]
    return entries, internal


# ------------------------------------------------------------ .strings parsing

STRINGS_LINE = re.compile(r'^\s*"((?:[^"\\]|\\.)*)"\s*=\s*"((?:[^"\\]|\\.)*)"\s*;', re.M)


def parse_strings(path: Path) -> dict[str, str]:
    text = path.read_text(encoding="utf-8")
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    table = {}
    for match in STRINGS_LINE.finditer(text):
        table[decode_c_escapes(match.group(1))] = decode_c_escapes(match.group(2))
    return table


# ------------------------------------------------------------- Java emission

def java_literal(value: str) -> str:
    out = ['"']
    for ch in value:
        code = ord(ch)
        if ch == "\\":
            out.append("\\\\")
        elif ch == '"':
            out.append('\\"')
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\t":
            out.append("\\t")
        elif ch == "\r":
            out.append("\\r")
        elif 0x20 <= code < 0x7F:
            out.append(ch)
        elif code > 0xFFFF:
            code -= 0x10000
            out.append("\\u%04x\\u%04x" % (0xD800 + (code >> 10), 0xDC00 + (code & 0x3FF)))
        else:
            out.append("\\u%04x" % code)
    out.append('"')
    return "".join(out)


HEADER = "// GENERATED by tools/generate_from_ios.py from the iOS YTAfterglow sources. Do not edit.\n"


def java_default(entry: dict) -> str:
    value = entry["default"]
    if value is None:
        return "null"
    if isinstance(value, bool):
        return "Boolean.TRUE" if value else "Boolean.FALSE"
    if isinstance(value, int):
        return f"Integer.valueOf({value})"
    return java_literal(value)


def emit_registry(entries: list[dict], internal: list[str]) -> str:
    chunk = 40
    lines = [HEADER, "package app.afterglow.extension.settings;", "",
             "/** Every Afterglow preference, action and destination, in the iOS registry order. */",
             "public final class Registry {", "    private Registry() {}", ""]
    parts = []
    for index in range(0, len(entries), chunk):
        name = f"part{index // chunk}"
        parts.append(name)
        lines.append(f"    private static Descriptor[] {name}() {{")
        lines.append("        return new Descriptor[] {")
        for e in entries[index:index + chunk]:
            flags = " | ".join(
                {"advanced": "Descriptor.FLAG_ADVANCED", "restartRequired": "Descriptor.FLAG_RESTART_REQUIRED"}[f]
                for f in e["flags"]) or "0"
            aliases = "new String[] {" + ", ".join(java_literal(a) for a in e["aliases"]) + "}"
            lines.append(
                "            new Descriptor(Descriptor.Type.%s, %s, %s, %s, %s, Category.%s, %s, %s, %s, %s, %s, %s),"
                % (e["type"].upper(), java_literal(e["key"]), java_literal(e["titleKey"]), java_literal(e["title"]),
                   java_literal(e["description"]), e["category"], java_default(e),
                   java_literal(e["destination"]) if e["destination"] else "null", flags,
                   java_literal(e["capability"]) if e["capability"] else "null", java_literal(e["symbol"]), aliases))
        lines.append("        };")
        lines.append("    }")
        lines.append("")
    lines.append("    /** All descriptors, iOS order. */")
    lines.append("    public static final Descriptor[] ALL = concat(" + ", ".join(f"{p}()" for p in parts) + ");")
    lines.append("")
    lines.append("    /** Keys for internal state (themes, migrations, records), not user-facing rows. */")
    lines.append("    public static final String[] INTERNAL_KEYS = {")
    for key in internal:
        lines.append(f"        {java_literal(key)},")
    lines.append("    };")
    lines.append("")
    lines.append("    private static Descriptor[] concat(Descriptor[]... parts) {")
    lines.append("        int total = 0;")
    lines.append("        for (Descriptor[] part : parts) total += part.length;")
    lines.append("        Descriptor[] all = new Descriptor[total];")
    lines.append("        int offset = 0;")
    lines.append("        for (Descriptor[] part : parts) {")
    lines.append("            System.arraycopy(part, 0, all, offset, part.length);")
    lines.append("            offset += part.length;")
    lines.append("        }")
    lines.append("        return all;")
    lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_strings(suffix: str, table: dict[str, str]) -> str:
    chunk = 300
    lines = [HEADER, "package app.afterglow.extension.i18n;", "", "import java.util.Map;", "",
             f"final class Strings_{suffix} {{", f"    private Strings_{suffix}() {{}}", ""]
    keys = sorted(table)
    parts = []
    for index in range(0, len(keys), chunk):
        name = f"fill{index // chunk}"
        parts.append(name)
        lines.append(f"    private static void {name}(Map<String, String> m) {{")
        for key in keys[index:index + chunk]:
            lines.append(f"        m.put({java_literal(key)}, {java_literal(table[key])});")
        lines.append("    }")
        lines.append("")
    lines.append("    static void fill(Map<String, String> m) {")
    for name in parts:
        lines.append(f"        {name}(m);")
    lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_tables(available: list[str]) -> str:
    lines = [HEADER, "package app.afterglow.extension.i18n;", "", "import java.util.Map;", "",
             "/** Maps Android language tags to the generated iOS string tables. */",
             "final class StringTables {", "    private StringTables() {}", "",
             "    /** Fills `m` with the table for an iOS lproj name; returns false if there is none. */",
             "    static boolean fill(String lproj, Map<String, String> m) {",
             "        switch (lproj) {"]
    for lproj in available:
        suffix = LANGUAGES[lproj][0]
        lines.append(f"            case {java_literal(lproj)}: Strings_{suffix}.fill(m); return true;")
    lines.append("            default: return false;")
    lines.append("        }")
    lines.append("    }")
    lines.append("")
    lines.append("    /** Android language tags (BCP 47) served by each iOS lproj, most specific first. */")
    lines.append("    static final String[][] TAGS = {")
    for lproj in available:
        tags = ", ".join(java_literal(t) for t in LANGUAGES[lproj][1])
        lines.append(f"        {{{java_literal(lproj)}, {tags}}},")
    lines.append("    };")
    lines.append("}")
    return "\n".join(lines) + "\n"


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__)
        return 2
    ios = Path(sys.argv[1]).resolve()
    entries, internal = parse_registry(ios / "Utils/YTAGPreferenceDescriptor.m")
    keys = [e["key"] for e in entries]
    if len(keys) != len(set(keys)):
        raise SystemExit("duplicate registry keys")

    bundle = ios / "layout/Library/Application Support/YTAfterglow.bundle"
    tables = {}
    for lproj in LANGUAGES:
        path = bundle / f"{lproj}.lproj/Localizable.strings"
        if path.exists():
            tables[lproj] = parse_strings(path)
    if "en" not in tables:
        raise SystemExit("missing en.lproj")

    REGISTRY_JAVA.parent.mkdir(parents=True, exist_ok=True)
    I18N_DIR.mkdir(parents=True, exist_ok=True)
    REGISTRY_JAVA.write_text(emit_registry(entries, internal), encoding="utf-8")
    for lproj, table in tables.items():
        (I18N_DIR / f"Strings_{LANGUAGES[lproj][0]}.java").write_text(
            emit_strings(LANGUAGES[lproj][0], table), encoding="utf-8")
    (I18N_DIR / "StringTables.java").write_text(emit_tables(list(tables)), encoding="utf-8")

    missing_titles = sorted(e["titleKey"] for e in entries if e["titleKey"] not in tables["en"])
    snapshot = {
        "source": str(ios),
        "counts": {t: sum(1 for e in entries if e["type"] == t) for t in sorted({e["type"] for e in entries})},
        "categories": [{"id": java, "title": title} for _, java, title in CATEGORY_ORDER],
        "entries": entries,
        "internalKeys": internal,
        "languages": {lproj: len(t) for lproj, t in tables.items()},
        "titleKeysMissingFromEnglish": missing_titles,
    }
    SNAPSHOT.write_text(json.dumps(snapshot, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps({k: snapshot[k] for k in ("counts", "languages", "titleKeysMissingFromEnglish")}, ensure_ascii=False))
    print(f"internal keys: {len(internal)}; total entries: {len(entries)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
