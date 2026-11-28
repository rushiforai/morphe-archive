#!/usr/bin/env python3
"""Cross-checks the numbers and names that the docs, the manifest and the runtime all have to agree on.

    python3 scripts/audit.py            # report
    python3 scripts/audit.py --check    # exit 1 on any mismatch (runs in CI)

Each check exists because the same class of drift shipped once: a README that said 34 languages while
listing 35 names, notes that named issue numbers nothing could resolve, patch counts in three places.
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
BOOTSTRAP = ROOT / "patches/src/main/resources/japatch/bootstrap.js"
I18N = ROOT / "patches/src/main/resources/japatch/i18n"
README = ROOT / "README.md"

problems = []
notes = []


def fail(what):
    problems.append(what)


def ok(what):
    notes.append("  ok   " + what)


# "#202" is a number nothing can open: no issue, no pull request, no line of code. A colour is #fff, #5865f2 or
# #17181ccc. Three hex digits cannot be told from a small issue number, so those three are listed rather than matched:
# "ff0" is a colour one day and a typo the next, and a check that guesses is worse than no check.
COLOURS = {"#fff", "#000"}
# A colour also arrives quoted ("#fff"), which is how every style in the runtime writes it.
QUOTED_COLOUR = re.compile(r"""["'](#[0-9a-fA-F]{3}|#[0-9a-fA-F]{6}|#[0-9a-fA-F]{8})["']""")
ISSUE_REF = re.compile(r"(?<![\w&])#(\d{1,4}|[0-9a-fA-F]{3})\b(?![0-9a-fA-F])")
ISSUE_REF_LONG = re.compile(r"(?<![\w&])#(\d{1,4})\b(?![0-9a-fA-F])|(?<![\w&])#([0-9a-fA-F]{6,8})\b")


def is_colour(text):
    return text.lower() in COLOURS or re.fullmatch(r"#[0-9a-fA-F]{6}|#[0-9a-fA-F]{8}", text) is not None


def issue_refs(text):
    found = []
    for m in QUOTED_COLOUR.finditer(text):
        COLOURS.add(m.group(1).lower())
    for m in ISSUE_REF_LONG.finditer(text):
        if m.group(1) is not None:
            # A short one is a number someone meant to open unless it is one of the listed colours.
            if not is_colour(m.group(0)):
                found.append(m.group(0))
    return found


def main():
    readme = README.read_text(encoding="utf-8")
    source = BOOTSTRAP.read_text(encoding="utf-8")

    # --- languages: the picker, the files and every sentence about them ---
    index = [c for c in (I18N / "index.txt").read_text(encoding="utf-8").split() if c]
    block = source[source.index("const UI_LANGUAGES = "):]
    block = block[:block.index("];")]
    picker = re.findall(r'\["([A-Za-z-]+)",', block)
    expected = {"en"} | set(index)
    if set(picker) != expected:
        fail(f"UI_LANGUAGES {sorted(set(picker) ^ expected)} never match index.txt + en")
    else:
        ok(f"UI_LANGUAGES lists en + the {len(index)} language files")

    files = {p.stem for p in I18N.glob("*.json")}
    if files != set(index):
        fail(f"index.txt and the language files differ: {sorted(files ^ set(index))}")
    else:
        ok(f"index.txt names exactly the {len(index)} files on disk")

    # Every "N languages" sentence in the README must equal the number of shipped files. The list bug counted a
    # wrapped "Urdu and Vietnamese" as one name, so the sentence and its own list disagreed.
    claims = re.findall(r"\*\*(\d+) languages?\*\*|(\d+) languages? ", readme)
    for a, b in claims:
        n = int(a or b)
        if n != len(index):
            fail(f"README says {n} languages, {len(index)} ship")
    m = re.search(r"(\d+) languages ship with the bundle: ([^.]+)\.", readme, re.S)
    if m:
        listed = m.group(2).replace("\n", " ").replace(",", " ").replace(" and ", " ")
        listed = re.sub(r"\([^)]*\)", "", listed).split()
        # "Chinese (Simplified and Traditional)" is one bullet for two files, "Portuguese (Brazil)" one for one.
        if len(listed) != len(index):
            fail(f"README lists {len(listed)} language names, {len(index)} files ship")
        else:
            ok(f"README lists all {len(index)} languages by name")

    # --- patches: manifest, runtime table and README ---
    manifest = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
    patches = manifest["patches"]
    by_cat = {}
    for p in patches:
        by_cat[p["category"]] = by_cat.get(p["category"], 0) + 1
    # The README sentence is checked against what the app shows (further down), not against the manifest
    # split: the manifest counts every row, including the ones that are Privacy, and the app counts the
    # switches a person can actually turn on.
    total = re.search(r"\*\*(\d+) patches\*\*", readme)
    if total and int(total.group(1)) != len(patches):
        fail(f"README says {total.group(1)} patches, the manifest has {len(patches)}")
    ok(f"manifest: {len(patches)} patches = " + " + ".join(f"{v} {k}" for k, v in sorted(by_cat.items())))

    # --- the badge SVGs and the README table, which drifted by themselves for several releases ---
    # Nothing read these files, so docs/badges/languages.svg still said 29 while 34 languages shipped, and the table
    # under the header said 82 features while the manifest had 83 patches. They are drawn in the repository, so a
    # check here is the only thing that can keep them honest.
    # The features badge and the README sentence now follow the app's own count (FEATURE_ICONS keys that the
    # Kotlin side compiles in), not the manifest's row count: 77, 79 and 84 were all claimed at once.
    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
    import readme_features
    shown = sum(1 for key in readme_features._compiled_features() if key in readme_features._icon_keys())
    readme_says = re.search(r"\*\*(\d+) features\*\*", readme)
    if not readme_says:
        fail("the README no longer says how many features there are")
    elif int(readme_says.group(1)) != shown:
        fail(f"the README says {readme_says.group(1)} features, the app shows {shown}")
    else:
        ok(f"README and the app agree: {shown} features")
    for name, expected in (("languages", len(index)), ("features", shown)):
        svg = (ROOT / f"docs/badges/{name}.svg").read_text(encoding="utf-8")
        found = re.search(r'aria-label="' + name + r': (\d+)"', svg)
        if not found:
            fail(f"docs/badges/{name}.svg has no readable number")
        elif int(found.group(1)) != expected:
            fail(f"docs/badges/{name}.svg says {found.group(1)}, the real number is {expected}")
        else:
            ok(f"{name} badge shows {expected}")
    table = re.search(r'<td align="center"><b>(\d+)</b><br/>patches</td>\s*<td align="center"><b>(\d+)</b><br/>languages</td>', readme)
    if not table:
        fail("the README table no longer has the patches and languages cells")
    elif (int(table.group(1)), int(table.group(2))) != (len(patches), len(index)):
        fail(f"README table says {table.group(1)} patches and {table.group(2)} languages, real: {len(patches)} and {len(index)}")
    else:
        ok(f"README table agrees: {len(patches)} patches, {len(index)} languages")

    # --- the runtime's feature switch table has a key for every patch that has one ---
    for p in patches:
        key = p.get("settings_key") or p.get("key")
        if key and f'"{key}"' not in source:
            fail(f"patch {p.get('name')} has key {key} that the runtime never reads")

    # --- release notes: no issue numbers, and the newest entry matches the shipped version ---
    import subprocess
    version = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))["version"]
    notes_out = subprocess.run([sys.executable, ROOT / "scripts/release_info.py", "--check"],
                               capture_output=True, text=True)
    if notes_out.returncode:
        fail("release_info.py --check: " + (notes_out.stdout + notes_out.stderr).strip()[:200])
    else:
        ok("release notes pass their own check")
    body = subprocess.run([sys.executable, ROOT / "scripts/release_info.py", version],
                          capture_output=True, text=True).stdout
    if not body.strip():
        fail(f"release_info.py has no notes for the shipped version {version}")
    else:
        ok(f"notes for the shipped version {version} exist")
    refs = re.findall(r"#\d+", subprocess.run([sys.executable, ROOT / "scripts/release_info.py", "--all"],
                                             capture_output=True, text=True).stdout)
    refs = [r for r in refs if not re.fullmatch(r"#[0-9a-fA-F]{3,8}", r)]
    if refs:
        fail(f"release notes still name numbers nothing resolves: {sorted(set(refs))[:6]}")
    else:
        ok("no release note names an issue number")
    # The same rule outside the notes: the README and every patch description are what a user reads before or after
    # installing, and a bare "#202" reads like an issue or pull request that nothing can open.
    # Comments in the runtime and the extensions carry them too: a reader who opens the file sees "#145" and has
    # nothing to open. A colour (#5865f2) is not one of these.
    runtime = [ROOT / "patches/src/main/resources/japatch/bootstrap.js"]
    runtime += sorted((ROOT / "patches/src/main/kotlin").rglob("*.kt"))
    runtime += sorted((ROOT / "extensions").rglob("*.kt"))
    docs = [ROOT / "README.md"] + runtime
    leaks = []
    for path in docs:
        for ref in issue_refs(path.read_text(encoding="utf-8")):
            leaks.append(f"{path.relative_to(ROOT)}: {ref}")
    if leaks:
        fail(f"a number nothing resolves, outside the notes: {leaks[:6]}")
    else:
        ok("no README line or patch description names an issue number")

    # --- the README's own links ---
    for path in re.findall(r"\]\((?!https?:|#)([^)#]+)", readme):
        if not (ROOT / path).exists():
            fail(f"README links to {path}, which does not exist")
    ok("every relative README link resolves")

    print("\n".join(notes))
    if problems:
        print()
        for p in problems:
            print("FAIL", p)
        print(f"\naudit: {len(problems)} problem(s)")
        return 1
    print("\naudit: everything agrees")
    return 0


if __name__ == "__main__":
    raise SystemExit(main() if "--check" in sys.argv or True else 0)
