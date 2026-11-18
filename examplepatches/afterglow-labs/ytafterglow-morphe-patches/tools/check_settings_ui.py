#!/usr/bin/env python3
"""Check the generated Android settings spec against tools/ios-settings-ui.json.

1. Regenerates SettingsSpec.java in memory and diffs it with the file on disk
   (catches a stale spec or hand edits).
2. Parses SettingsSpec.java independently and compares it with the JSON: page
   order, row ids and kinds per page in order, picker option values, the
   Comments picker's trailing rows, and the search index (count, order, and that
   every entry's page chain and row exist).
3. Compares hand-ported constants with the JSON: TabStore's allowed/default tab
   lists and LiteMode's forced key sets.
4. Runs tools/jvm/SettingsVisibilityTest (javac + java from $JDK, android.jar from
   $ANDROID_JAR) on the installed-tweak row rules: every current tweak installed, and
   only "Shorts layout and buttons" installed.

Run: python3 tools/check_settings_ui.py   (exit status 1 on any mismatch)
"""
from __future__ import annotations

import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
ROOT = TOOLS.parent
sys.path.insert(0, str(TOOLS))
import generate_settings_ui as gen  # noqa: E402

EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
errors: list[str] = []


def fail(message: str) -> None:
    errors.append(message)


def calls(text: str, name: str) -> list[str]:
    """Argument text of every `name(...)` call outside string literals."""
    out, i, n = [], 0, len(text)
    in_str = False
    while i < n:
        ch = text[i]
        if in_str:
            if ch == "\\":
                i += 2
                continue
            if ch == '"':
                in_str = False
            i += 1
            continue
        if ch == '"':
            in_str = True
            i += 1
            continue
        if text.startswith(name + "(", i) and (i == 0 or not (text[i - 1].isalnum() or text[i - 1] == "_")):
            depth, j, s = 0, i + len(name), False
            start = j + 1
            while j < n:
                c = text[j]
                if s:
                    if c == "\\":
                        j += 2
                        continue
                    if c == '"':
                        s = False
                elif c == '"':
                    s = True
                elif c == "(":
                    depth += 1
                elif c == ")":
                    depth -= 1
                    if depth == 0:
                        out.append(text[start:j])
                        break
                j += 1
            i = j + 1
            continue
        i += 1
    return out


def last_arg(args: str) -> str:
    depth, in_str, cut = 0, False, -1
    i = 0
    while i < len(args):
        c = args[i]
        if in_str:
            if c == "\\":
                i += 2
                continue
            if c == '"':
                in_str = False
        elif c == '"':
            in_str = True
        elif c in "([{":
            depth += 1
        elif c in ")]}":
            depth -= 1
        elif c == "," and depth == 0:
            cut = i
        i += 1
    return args[cut + 1:].strip()


def strings(text: str) -> list[str]:
    return [m.group(1) for m in re.finditer(r'"((?:[^"\\]|\\.)*)"', text)]


def main() -> int:
    data = gen.load()
    try:
        expected = gen.render(data)
    except gen.SpecError as error:
        fail(f"generator failed: {error}")
        expected = None
    actual = gen.OUT.read_text(encoding="utf-8")
    if expected is not None and expected != actual:
        for number, (want, got) in enumerate(zip(expected.splitlines(), actual.splitlines()), 1):
            if want != got:
                fail(f"SettingsSpec.java differs from a fresh generation at line {number}; run tools/generate_settings_ui.py")
                break
        else:
            fail("SettingsSpec.java length differs from a fresh generation; run tools/generate_settings_ui.py")

    # ------------------------------------------------------------ pages and rows
    blocks = re.split(r"^    // page: (\S+)$", actual, flags=re.M)
    parsed = {}
    order = []
    for index in range(1, len(blocks), 2):
        pid, body = blocks[index], blocks[index + 1]
        order.append(pid)
        rows = []
        for line in body.splitlines():
            m = re.match(r'\s{12}r\("((?:[^"\\]|\\.)*)", Kind\.(\w+)\)', line)
            if m:
                rows.append((m.group(1), m.group(2), line))
        parsed[pid] = rows
    if order != data["pageOrder"]:
        fail(f"page order differs: {order} vs {data['pageOrder']}")

    total_rows = 0
    pickers = 0
    json_rows = {}
    for page in data["pages"]:
        want = [(r["id"], r["kind"].upper()) for r in page["rows"]]
        got = [(rid, kind) for rid, kind, _ in parsed.get(page["id"], [])]
        total_rows += len(got)
        if len(want) != len(got):
            fail(f"{page['id']}: {len(got)} rows, JSON has {len(want)}")
        for position, (w, g) in enumerate(zip(want, got)):
            if w != g:
                fail(f"{page['id']} row {position}: spec {g} vs JSON {w}")
                break
        lines = {rid: line for rid, _, line in parsed.get(page["id"], [])}
        for r in page["rows"]:
            json_rows[r["id"]] = r
            if r["kind"] != "picker":
                continue
            pickers += 1
            line = lines.get(r["id"], "")
            pk = r["picker"]
            opts = [int(last_arg(a)) for a in calls(line.split(".trailing(")[0], "opt")]
            if "optionsComputed" in pk:
                if opts:
                    fail(f"{r['id']}: computed picker should not carry static options")
            else:
                want_values = [int(o["value"]) for o in pk["options"]]
                if opts != want_values:
                    fail(f"{r['id']}: options {opts} vs JSON {want_values}")
            if pk.get("trailingRows"):
                trailing = [m.group(1) for m in re.finditer(r'tr\("((?:[^"\\]|\\.)*)", Kind\.', line)]
                want_trailing = [t["id"] for t in pk["trailingRows"]]
                if trailing != want_trailing:
                    fail(f"{r['id']}: trailing rows {trailing} vs JSON {want_trailing}")

    # ------------------------------------------------------------ search index
    markers = [int(m.group(1)) for m in re.finditer(r"^\s*// search: (\d+)$", actual, flags=re.M)]
    if markers != list(range(len(data["search"]["entries"]))):
        fail(f"search markers {len(markers)} do not match the {len(data['search']['entries'])} JSON entries in order")
    entry_lines = [line for line in actual.splitlines() if line.strip().startswith("e(SearchKind.")]
    if len(entry_lines) != len(data["search"]["entries"]):
        fail(f"{len(entry_lines)} search entries, JSON has {len(data['search']['entries'])}")
    page_rows = {pid: {rid for rid, _, _ in rows} for pid, rows in parsed.items()}
    for entry, line in zip(data["search"]["entries"], entry_lines):
        m = re.search(r'new String\[\] \{([^{}]*)\}, (true|false), new String\[\] \{([^{}]*)\}, '
                      r'("(?:[^"\\]|\\.)*"|null), "((?:[^"\\]|\\.)*)"\)', line)
        if not m:
            fail(f"search {entry['order']}: cannot parse entry")
            continue
        if (m.group(2) == "true") != entry["advancedOnly"]:
            fail(f"search {entry['order']}: advancedOnly differs")
        if m.group(5) != entry["source"]:
            fail(f"search {entry['order']}: source {m.group(5)} vs {entry['source']}")
        chain = strings(m.group(3))
        if not chain or chain[0] != data["pageOrder"][0] or any(pid not in parsed for pid in chain):
            fail(f"search {entry['order']}: bad page chain {chain}")
            continue
        row_id = None if m.group(4) == "null" else strings(m.group(4))[0]
        if row_id is not None and row_id not in page_rows[chain[-1]]:
            fail(f"search {entry['order']}: row {row_id} is not on {chain[-1]}")
        if entry["kind"] != "page" and row_id is None:
            fail(f"search {entry['order']} ({entry['title']}) does not open a row")

    # ------------------------------------------------------------ hand-ported constants
    tab_page = next(p for p in data["pages"] if p["id"] == "page:tabEditor")
    tabstore = (EXT / "settings/TabStore.java").read_text(encoding="utf-8").replace("CONTROL_CENTER_TAB_ID", '"YTAGControlCenter"')

    def java_list(source: str, name: str) -> list[str]:
        m = re.search(name + r"\s*=.*?Arrays\.asList\((.*?)\)\)", source, flags=re.S)
        return strings(m.group(1)) if m else []

    if java_list(tabstore, "ALLOWED_TABS") != tab_page["allTabIds"]:
        fail("TabStore.ALLOWED_TABS differs from the iOS tab list")
    default_tabs = [row["tabId"] for row in tab_page["sections"][0]["defaultRows"]]
    if java_list(tabstore, "DEFAULT_ACTIVE_TABS") != default_tabs:
        fail("TabStore.DEFAULT_ACTIVE_TABS differs from the iOS default tabs")
    lite = (EXT / "settings/LiteMode.java").read_text(encoding="utf-8")
    lite_json = data["sharedBehaviors"]["liteMode"]
    if set(java_list(lite, "FORCED_TRUE")) != set(lite_json["forcedTrueKeys"]):
        fail("LiteMode.FORCED_TRUE differs from iOS")
    if set(java_list(lite, "FORCED_FALSE")) != set(lite_json["forcedFalseKeys"]):
        fail("LiteMode.FORCED_FALSE differs from iOS")

    print(f"settings ui: {len(order)} pages, {total_rows} rows, {pickers} pickers, "
          f"{len(entry_lines)} search entries checked against {gen.SPEC_JSON.relative_to(ROOT)}")
    run_visibility_test()
    for error in errors:
        print("FAIL:", error, file=sys.stderr)
    return 1 if errors else 0


def run_visibility_test() -> None:
    test = TOOLS / "jvm/SettingsVisibilityTest.java"
    # Every tweak id a named tweak patch marks; the test derives its expectations from them.
    marked = []
    for source in sorted((ROOT / "patches/src").rglob("*.kt")):
        for tweak in re.findall(r'markTweakInstalled\("([^"]+)"\)', source.read_text(encoding="utf-8")):
            if tweak not in marked:
                marked.append(tweak)
    if not marked:
        fail("no markTweakInstalled(\"...\") calls found under patches/src")
    jdk = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
    android_jar = Path(os.environ.get("ANDROID_JAR", str(Path.home() / "Android/Sdk/platforms/android-36/android.jar")))
    javac, java = jdk / "bin/javac", jdk / "bin/java"
    if not (javac.exists() and java.exists() and android_jar.exists()):
        print("settings visibility: skipped (set JDK and ANDROID_JAR to run the JVM test)")
        return
    sources = [EXT / "Afterglow.java", EXT / "InstalledTweaks.java", EXT / "ui/SettingsModel.java",
               EXT / "ui/SettingsSpec.java", EXT / "ui/SettingsBehavior.java", EXT / "ui/SearchIndex.java",
               EXT / "playback/PlayerBehavior.java", EXT / "playback/Autoplay.java", EXT / "playback/Captions.java", EXT / "sponsorblock/SponsorCategory.java",
               EXT / "navigation/Gate.java", EXT / "navigation/ShortsProgressPolicy.java", EXT / "navigation/ShortsFullscreenPolicy.java", EXT / "navigation/Subbar.java", EXT / "navigation/SubbarMargin.java", EXT / "navigation/SubbarAnimation.java",
               EXT / "sponsorblock/SponsorSettings.java", test]
    sources += sorted((EXT / "settings").glob("*.java")) + sorted((EXT / "i18n").glob("*.java"))
    with tempfile.TemporaryDirectory() as out:
        compiled = subprocess.run([str(javac), "-encoding", "UTF-8", "-nowarn", "-classpath", str(android_jar), "-sourcepath", str(EXT.parents[2]), "-d", out]
                                  + [str(source) for source in sources], capture_output=True, text=True)
        if compiled.returncode:
            fail("SettingsVisibilityTest does not compile:\n" + compiled.stderr[-3000:])
            return
        ran = subprocess.run([str(java), "-cp", out + os.pathsep + str(android_jar), "app.afterglow.extension.ui.SettingsVisibilityTest"] + marked,
                             capture_output=True, text=True, timeout=300)
        print(ran.stdout.strip() or ran.stderr.strip()[-3000:])
        if ran.returncode:
            fail("SettingsVisibilityTest failed")


if __name__ == "__main__":
    sys.exit(main())
