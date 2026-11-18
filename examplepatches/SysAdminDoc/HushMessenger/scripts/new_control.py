#!/usr/bin/env python3
"""
Stubs a new settings control in every file a control has to reach, so what's left is the hook itself.

    py -3.13 scripts/new_control.py <key> --title "<switch title>" --summary "<Morphe description>"
        --section <settings section> --family <scripts/compat file> [--after <key>] [--description "<settings text>"]
        [--stable] [--dry-run]

It writes the control's Kotlin file (key constant, finder, validator and inject, each a stub) and a test file with a
fixture, and wires the key into MessengerControlsPatch (validate, inject, the patch declaration), ControlHooks,
SyntheticProfile, ControlDiscoveryTest, both ExpectedTotals, Settings, SettingsActivity (the CONTROLS row, and
EXPERIMENTAL unless --stable), every translation table in src/main/l10n (rows left empty to translate), the extension
manifest, SettingsNavigationTest when it lists the section, CompatReport's PATCHES row, Controls.findControls and the
finder's mirror in scripts/compat/<family>.java.

The new control goes after --after (by default the last control in its section) wherever a list has an order. Every
edit is worked out before anything is written, and one missing anchor means nothing changes.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CONTROLS_DIR = "patches/src/main/kotlin/app/hushmessenger/patches/controls"
PATCHES_DIR = "patches/src/main/kotlin/app/hushmessenger/patches"
TESTS_DIR = "patches/src/test/kotlin/app/hushmessenger/patches/controls"
EXTENSION_DIR = "extensions/messenger/src/main/java/app/hushmessenger/extension"
EXTENSION_TESTS = "extensions/messenger/src/test/java/app/hushmessenger/extension"
L10N_DIR = "extensions/messenger/src/main/l10n"
LOCALES = ("es", "th", "tr", "vi", "zh-TW")
STRING = r'"((?:[^"\\]|\\.)*)"'


class Missing(Exception):
    """An anchor that isn't where the scaffold expects it."""


class Tree:
    """The files the scaffold touches, read once, edited in memory and written together with their own line endings."""

    def __init__(self, root: Path):
        self.root = root
        self.text: dict[str, str] = {}
        self.original: dict[str, str] = {}
        self.crlf: dict[str, bool] = {}

    def read(self, rel: str) -> str:
        if rel not in self.text:
            path = self.root / rel
            if not path.is_file():
                raise Missing(f"{rel} doesn't exist")
            raw = path.read_bytes().decode("utf-8")
            self.crlf[rel] = "\r\n" in raw
            self.text[rel] = self.original[rel] = raw.replace("\r\n", "\n")
        return self.text[rel]

    def set(self, rel: str, text: str) -> None:
        self.text[rel] = text

    def create(self, rel: str, text: str) -> None:
        if (self.root / rel).exists():
            raise Missing(f"{rel} already exists")
        self.text[rel] = text
        self.original[rel] = ""
        self.crlf[rel] = False

    def changed(self) -> list[str]:
        return sorted(rel for rel, text in self.text.items() if text != self.original[rel])

    def write(self) -> None:
        for rel in self.changed():
            text = self.text[rel]
            (self.root / rel).write_bytes((text.replace("\n", "\r\n") if self.crlf[rel] else text).encode("utf-8"))


def line_at(text: str, pattern: str, start: int = 0, end: int | None = None) -> tuple[int, int] | None:
    """The start and end (past its newline) of the first line from [start] to [end] that [pattern] matches."""
    found = re.compile(pattern, re.M).search(text, start, len(text) if end is None else end)
    if not found:
        return None
    first = text.rfind("\n", 0, found.start()) + 1
    last = text.find("\n", found.end())
    return first, len(text) if last < 0 else last + 1


def insert_after(text: str, block: str, anchors: list[str], where: str, start: int = 0, end: int | None = None) -> str:
    """[block] on the line after the first anchor that matches, the anchors tried in order."""
    for anchor in anchors:
        span = line_at(text, anchor, start, end)
        if span:
            return text[:span[1]] + block + text[span[1]:]
    raise Missing(f"{where}: no line matches {anchors[-1]!r}")


def insert_before(text: str, block: str, anchor: str, where: str, start: int = 0, end: int | None = None) -> str:
    span = line_at(text, anchor, start, end)
    if not span:
        raise Missing(f"{where}: no line matches {anchor!r}")
    return text[:span[0]] + block + text[span[0]:]


def region(text: str, begin: str, finish: str, where: str) -> tuple[int, int]:
    """Where a function starts and the line that ends the part of it the scaffold edits."""
    head = line_at(text, begin)
    if not head:
        raise Missing(f"{where}: no line matches {begin!r}")
    tail = line_at(text, finish, head[0])
    if not tail:
        raise Missing(f"{where}: nothing after {begin!r} matches {finish!r}")
    return head[0], tail[1]


def kotlin_string(value: str) -> str:
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"').replace("$", "\\$") + '"'


def java_string(value: str) -> str:
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"') + '"'


def bump(text: str, name: str, where: str, by: int = 1) -> str:
    pattern = re.compile(rf"(\b{name} = )(\d+)")
    found = pattern.search(text)
    if not found:
        raise Missing(f"{where}: no {name} = <number>")
    return text[:found.start(2)] + str(int(found.group(2)) + by) + text[found.end(2):]


def settings_rows(tree: Tree) -> list[tuple[str, str, str, str]]:
    """SettingsActivity's CONTROLS rows as (key, title, description, section)."""
    text = tree.read(f"{EXTENSION_DIR}/SettingsActivity.java")
    start, end = region(text, r"static final String\[\]\[\] CONTROLS = \{", r"^    \};", "SettingsActivity CONTROLS")
    row = re.compile(rf"^\s*\{{{STRING}, {STRING}, {STRING}, {STRING}\}},?$", re.M)
    return [(m.group(1), m.group(2), m.group(3), m.group(4)) for m in row.finditer(text, start, end)]


def kotlin_files(tree: Tree) -> list[str]:
    return sorted(p.relative_to(tree.root).as_posix() for p in (tree.root / PATCHES_DIR).rglob("*.kt"))


def constant_for(tree: Tree, key: str) -> str | None:
    """The Kotlin constant that holds [key], if the patches declare one."""
    for rel in kotlin_files(tree):
        found = re.search(rf'^(?:internal |private )?const val (\w+) = "{re.escape(key)}"$', tree.read(rel), re.M)
        if found:
            return found.group(1)
    return None


def declaration(tree: Tree, key: str) -> tuple[str, re.Match] | None:
    """The controlPatch call for [key]: its file and a match whose group 3 is the Morphe group."""
    pattern = re.compile(rf'controlPatch\(\s*"{re.escape(key)}",\s*{STRING},\s*{STRING},\s*{STRING}')
    for rel in kotlin_files(tree):
        found = pattern.search(tree.read(rel))
        if found:
            return rel, found
    return None


def call_end(text: str, opening: int) -> int:
    """The index just past the parenthesis that closes the one at [opening], skipping string literals."""
    depth, at = 0, opening
    while at < len(text):
        char = text[at]
        if char == '"':
            at += 1
            while text[at] != '"':
                at += 2 if text[at] == "\\" else 1
        elif char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return at + 1
        at += 1
    raise Missing("an unclosed controlPatch call")


def scaffold(tree: Tree, args: argparse.Namespace) -> list[str]:
    """Every edit for the new control, in memory. Returns what's left to write by hand."""
    key = args.key
    camel = "".join(part.capitalize() for part in key.split("_"))
    lower = camel[0].lower() + camel[1:]
    const = key.upper()
    problems: list[str] = []

    def step(action) -> None:
        try:
            action()
        except Missing as missing:
            problems.append(str(missing))

    rows = settings_rows(tree)
    if any(row[0] == key for row in rows):
        raise Missing(f"{key} is already in SettingsActivity's CONTROLS")
    if constant_for(tree, key) or declaration(tree, key):
        raise Missing(f"{key} is already declared in the patches")
    section = [row for row in rows if row[3] == args.section]
    if not section:
        raise Missing(f"no control sits in section {args.section!r}; the sections are {sorted({row[3] for row in rows})}")
    after = args.after or section[-1][0]
    after_row = next((row for row in section if row[0] == after), None)
    if after_row is None:
        raise Missing(f"{after} isn't in section {args.section}, so the new control can't follow it")
    group = sibling = None
    for row in [after_row] + section:
        found = declaration(tree, row[0])
        if found:
            group, sibling = found[1].group(3), row[0]
            break
    if group is None or sibling is None:
        raise Missing(f"no control in section {args.section} has a controlPatch declaration to take the Morphe group from")
    after_const = constant_for(tree, after)
    description = args.description or args.summary
    family = f"scripts/compat/{args.family}.java"
    for rel in sorted((tree.root / "scripts/compat").glob("*.java")):
        if re.search(rf"\bstatic [\w<>, ]+ {lower}\(", rel.read_text(encoding="utf-8")):
            raise Missing(f"scripts/compat/{rel.name} already has a {lower}() that Controls.java's static imports would clash with")

    def control_file() -> None:
        tree.create(f"{CONTROLS_DIR}/{camel}.kt", f"""package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/** {args.title}. */
internal const val {const} = "{key}"

/** The methods {const} hooks, by their shape on the stock builds. scripts/compat/{args.family}.java's {lower} mirrors it. */
internal fun find{camel}(classes: Iterable<ClassDef>): List<Method> = emptyList()

/** Checks a hook's stock shape before anything is changed, and refuses a shape it doesn't know. */
internal fun MutableMethod.validate{camel}() {{
    throw PatchException("Messenger controls: {key} doesn't check ${{hookId()}} yet")
}}

/** Routes the hook through Settings.{lower}() once its shape checks out. */
internal fun MutableMethod.inject{camel}() {{
    validate{camel}()
}}
""")

    def test_file() -> None:
        tree.create(f"{TESTS_DIR}/{camel}Test.kt", f"""package app.hushmessenger.patches.controls

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import kotlin.test.Test
import kotlin.test.assertEquals

private const val HOST = "LX/{camel};"
internal const val SYNTHETIC_{const} = "$HOST->A00()V"

/** The hook as the stock build writes it. */
internal fun {lower}Fixture(): List<MutableClass> = listOf(
    fixtureClass(HOST, listOf(fixtureMethod(SYNTHETIC_{const}, "return-void", 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
)

class {camel}Test {{
    @Test fun theFinderAndItsMirrorTakeTheStockHook() {{
        assertEquals(setOf(SYNTHETIC_{const}), mirroredControls({lower}Fixture()).getValue({const}).map {{ it.hookId() }}.toSet())
    }}
}}
""")

    def controls_patch() -> None:
        rel = f"{CONTROLS_DIR}/MessengerControlsPatch.kt"
        text = tree.read(rel)
        start, end = region(text, r"^internal fun MutableMethod\.validateHook\(", r"^        else -> validateSwitch\(\)", rel)
        anchors = [rf"^        {after_const} -> validate\w+\(\)$"] if after_const else []
        text = insert_after(text, f"        {const} -> validate{camel}()\n", anchors + [r"^        else -> validateSwitch\(\)"], rel, start, end) \
            if anchors and line_at(text, anchors[0], start, end) else \
            insert_before(text, f"        {const} -> validate{camel}()\n", r"^        else -> validateSwitch\(\)", rel, start, end)
        start, end = region(text, r"^internal fun injectControl\(", r"^            else -> if \(hook in pluginGates\)", rel)
        inject = f"            {const} -> method.inject{camel}()\n"
        anchor = rf"^            {after_const} -> method\.inject\w+\(\)$" if after_const else None
        if anchor and line_at(text, anchor, start, end):
            text = insert_after(text, inject, [anchor], rel, start, end)
        else:
            text = insert_before(text, inject, r"^            else -> if \(hook in pluginGates\)", rel, start, end)
        tree.set(rel, text)

    def patch_declaration() -> None:
        # Looked up again here, since the validate and inject branches already moved the text in that file.
        located = declaration(tree, sibling)
        if located is None:
            raise Missing(f"{sibling}'s controlPatch declaration went missing")
        rel, found = located
        text = tree.read(rel)
        if re.search(rf"\bval {lower}Patch\b", text):
            raise Missing(f"{rel} already has a {lower}Patch")
        opening = text.index("(", found.start())
        end = call_end(text, opening)
        end = text.find("\n", end) + 1
        block = (f'@Suppress("unused")\nval {lower}Patch = controlPatch({kotlin_string(key)}, {kotlin_string(args.title)},\n'
                 f"    {kotlin_string(args.summary)}, {kotlin_string(group)}, {const})\n")
        tree.set(rel, text[:end] + block + text[end:])

    def control_hooks() -> None:
        rel = f"{CONTROLS_DIR}/ControlHooks.kt"
        text = tree.read(rel)
        start, end = region(text, r"^private fun findControlsIn\(", r"^    return found$", rel)
        line = f"    found.getValue({const}).addAll(find{camel}(classes))\n"
        anchor = rf"^    found\.getValue\({after_const}\)\.addAll" if after_const else None
        if anchor and line_at(text, anchor, start, end):
            tree.set(rel, insert_after(text, line, [anchor], rel, start, end))
        else:
            tree.set(rel, insert_before(text, line, r"^    return found$", rel, start, end))

    def synthetic_profile() -> None:
        rel = f"{TESTS_DIR}/SyntheticProfile.kt"
        text = tree.read(rel)
        start, end = region(text, r"^internal val syntheticHooks", r"^\)$", rel)
        line = f"    {const} to setOf(SYNTHETIC_{const}),\n"
        anchor = rf"^    {after_const} to setOf\(" if after_const else None
        if anchor and line_at(text, anchor, start, end):
            tree.set(rel, insert_after(text, line, [anchor], rel, start, end))
        else:
            tree.set(rel, insert_before(text, line, r"^\)$", rel, start, end))

    def discovery_test() -> None:
        rel = f"{TESTS_DIR}/ControlDiscoveryTest.kt"
        text = tree.read(rel)
        if after_const and f", {after_const}," in text:
            text = text.replace(f", {after_const},", f", {after_const}, {const},", 1)
        elif ") + CUSTOM_FONT_HOOKS }" in text:
            text = text.replace(") + CUSTOM_FONT_HOOKS }", f", {const}) + CUSTOM_FONT_HOOKS }}", 1)
        else:
            raise Missing(f"{rel}: no exclusion set ending in ') + CUSTOM_FONT_HOOKS }}'")
        if " + customFontFixture() +" not in text:
            raise Missing(f"{rel}: no fixture union with customFontFixture()")
        tree.set(rel, text.replace(" + customFontFixture() +", f" + {lower}Fixture() + customFontFixture() +", 1))

    def totals() -> None:
        rel = f"{TESTS_DIR}/ExpectedTotals.kt"
        text = tree.read(rel)
        for name in ("CONTROLS", "DIRECTED_CONTROLS", "REPLAYED_CONTROLS", "DISCOVERY_FIXTURE_HOOKS"):
            text = bump(text, name, rel)
        tree.set(rel, text)
        rel = f"{EXTENSION_TESTS}/ExpectedTotals.java"
        tree.set(rel, bump(tree.read(rel), "CONTROLS", rel))

    def settings() -> None:
        rel = f"{EXTENSION_DIR}/Settings.java"
        text = tree.read(rel)
        if re.search(rf"\bstatic \w+ {lower}\(", text):
            raise Missing(f"{rel} already has a {lower}()")
        block = f"    /** Whether {args.title} is on. */\n    public static boolean {lower}() {{ return enabled({java_string(key)}); }}\n\n"
        tree.set(rel, insert_before(text, block, r"^    private Settings\(\) \{ \}$", rel))

    def settings_activity() -> None:
        rel = f"{EXTENSION_DIR}/SettingsActivity.java"
        text = tree.read(rel)
        row = f"        {{{java_string(key)}, {java_string(args.title)}, {java_string(description)}, {java_string(args.section)}}},\n"
        text = insert_after(text, row, [rf'^\s*\{{"{re.escape(after)}", '], rel)
        if not args.stable:
            span = line_at(text, r"^    static final Set<String> EXPERIMENTAL = Set\.of\(.*\);$")
            if not span:
                raise Missing(f"{rel}: EXPERIMENTAL isn't a one-line Set.of(...)")
            line = text[span[0]:span[1]]
            text = text[:span[0]] + line.replace(");\n", f", {java_string(key)});\n") + text[span[1]:]
        tree.set(rel, text)

    def locale(name: str) -> None:
        rel = f"{L10N_DIR}/{name}.tsv"
        rows = f"{key}.title\t\n{key}.description\t\n"
        tree.set(rel, insert_after(tree.read(rel), rows, [rf"^{re.escape(after)}\.description\t"], rel))

    def manifest() -> None:
        rel = "extensions/messenger/src/main/AndroidManifest.xml"
        line = f'        <meta-data android:name="hush.feature.{key}" android:value="true" />\n'
        tree.set(rel, insert_after(tree.read(rel), line, [rf'android:name="hush\.feature\.{re.escape(after)}"'], rel))

    def navigation_test() -> None:
        rel = f"{EXTENSION_TESTS}/SettingsNavigationTest.java"
        text = tree.read(rel)
        span = line_at(text, rf'new String\[\] \{{.*"{re.escape(after)}"')
        if not span:
            return
        line = text[span[0]:span[1]].replace(f'"{after}"', f'"{after}", "{key}"', 1)
        text = text[:span[0]] + line + text[span[1]:]
        count = re.compile(r'assertEquals\("(\d+)",\s*\(\(TextView\) heading\.getChildAt\(1\)\)')
        found = count.search(text, span[0])
        if not found:
            raise Missing(f"{rel}: the {args.section} key list has no heading count after it")
        tree.set(rel, text[:found.start(1)] + str(int(found.group(1)) + 1) + text[found.end(1):])

    def compat() -> None:
        rel = "scripts/compat/CompatReport.java"
        text = tree.read(rel)
        line = f"        PATCHES.put({java_string(args.title)}, List.of({java_string(key)}));\n"
        # After the patch that names the control it follows, or else after the last patch in the table.
        puts = list(re.finditer(r'^\s*PATCHES\.put\(.*\);$', text, re.M))
        if not puts:
            raise Missing(f"{rel}: no PATCHES.put rows")
        follow = next((put for put in puts if f'"{after}"' in put.group(0)), puts[-1])
        end = follow.end() + 1
        tree.set(rel, text[:end] + line + text[end:])
        rel = "scripts/compat/Controls.java"
        text = tree.read(rel)
        start, end = region(text, r"static Map<String, List<Method>> findControls\(", r"^        return found;$", rel)
        line = f"        found.get({java_string(key)}).addAll({lower}(classes));\n"
        anchor = rf'^        found\.get\("{re.escape(after)}"\)\.addAll'
        if line_at(text, anchor, start, end):
            tree.set(rel, insert_after(text, line, [anchor], rel, start, end))
        else:
            tree.set(rel, insert_before(text, line, r"^        return found;$", rel, start, end))
        text = tree.read(family)
        closing = text.rstrip().rfind("}")
        stub = (f"\n    /** {key}: the methods the control hooks. Mirrors find{camel} in {camel}.kt. */\n"
                f"    static List<Method> {lower}(List<ClassDef> classes) {{\n        return new ArrayList<>();\n    }}\n")
        tree.set(family, text[:closing].rstrip("\n") + "\n" + stub + text[closing:])

    for action in (control_file, test_file, controls_patch, patch_declaration, control_hooks, synthetic_profile,
                   discovery_test, totals, settings, settings_activity, *(lambda n=n: locale(n) for n in LOCALES),
                   manifest, navigation_test, compat):
        step(action)
    if problems:
        raise Missing("\n".join(problems))
    return [
        f"find{camel}, validate{camel} and inject{camel} in {CONTROLS_DIR}/{camel}.kt, and the extension behavior behind Settings.{lower}()",
        f"{lower} in {family}, the mirror the patch tests compare with find{camel} (and CompatReport.NEEDS_A_LOCAL if the inject takes a scratch register)",
        f"{lower}Fixture in {TESTS_DIR}/{camel}Test.kt with the stock method's shape, then the tests that refuse a changed shape",
        f"java scripts/CompatReport.java --record-control {key} fixtures/587 to write the hook ids into the records and ControlProfiles.kt,"
        f" then raise ExpectedTotals.HOOKS_587 by the hooks it found per build",
        f"the {len(LOCALES)} translations left empty in {L10N_DIR}/{{{','.join(LOCALES)}}}.tsv",
        "a CHANGELOG bullet under ## Unreleased, then :patches:generatePatchCatalog in the same commit",
    ]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Stub a new settings control in every file it reaches.")
    parser.add_argument("key", help="the control key, lower_snake_case")
    parser.add_argument("--title", required=True, help="the switch's title, also the Morphe patch name")
    parser.add_argument("--summary", required=True, help="the Morphe patch description")
    parser.add_argument("--section", required=True, help="the settings section id, as SettingsActivity's CONTROLS rows name it")
    parser.add_argument("--family", required=True, help="the scripts/compat file (without .java) that mirrors the finder")
    parser.add_argument("--after", help="the control the new one follows (default: the last in its section)")
    parser.add_argument("--description", help="the settings description (default: the summary)")
    parser.add_argument("--stable", action="store_true", help="leave it off EXPERIMENTAL")
    parser.add_argument("--dry-run", action="store_true", help="list the files it would change and write nothing")
    parser.add_argument("--root", type=Path, default=ROOT, help=argparse.SUPPRESS)
    args = parser.parse_args(argv)
    if not re.fullmatch(r"[a-z][a-z0-9]*(?:_[a-z0-9]+)*", args.key):
        parser.error(f"{args.key} isn't lower_snake_case")
    families = sorted(p.stem for p in (args.root / "scripts/compat").glob("*.java") if p.stem not in ("CompatReport", "Controls"))
    if args.family not in families:
        parser.error(f"--family must be one of {', '.join(families)}")
    tree = Tree(args.root)
    try:
        left = scaffold(tree, args)
    except Missing as missing:
        print(f"Nothing written:\n{missing}", file=sys.stderr)
        return 1
    changed = tree.changed()
    if not args.dry_run:
        tree.write()
    print(("Would change" if args.dry_run else "Changed") + f" {len(changed)} files:")
    for rel in changed:
        print(f"  {rel}")
    print("\nLeft to write:")
    for number, item in enumerate(left, 1):
        print(f"  {number}. {item}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
