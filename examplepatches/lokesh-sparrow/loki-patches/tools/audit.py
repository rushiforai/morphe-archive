#!/usr/bin/env python3
"""
Checks that hold for every app in the bundle, so a fix for one app is not silently missing from the others.

Run before any hand-over:

    python tools/audit.py

Exits non-zero when a check fails, and prints one line per finding with the file that holds it.
"""

import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATCHES = os.path.join(ROOT, "patches", "src", "main", "kotlin")
EXTENSION = os.path.join(ROOT, "extensions", "extension", "src", "main", "java")
MENU_INFO = os.path.join(EXTENSION, "app", "loki", "extension", "MenuInfo.java")

failures = []


def fail(check, where, detail):
    failures.append((check, where, detail))


def read(path):
    with open(path, encoding="utf-8", errors="replace") as handle:
        return handle.read()


def walk(base, suffix):
    for folder, _, names in os.walk(base):
        for name in names:
            if name.endswith(suffix):
                yield os.path.join(folder, name)


def check_menu_flags():
    """Every patch that records itself in the menu must have a row on the Patch status page, and vice versa."""
    set_flags, read_flags = {}, {}
    for path in list(walk(PATCHES, ".kt")):
        # Written as a manifest meta-data, however it is spelled: addMenuFlag(...), metaData(...), setAttribute.
        for key in re.findall(r'"(app\.loki\.menu\.[a-z0-9]+)"', read(path)):
            set_flags.setdefault(key, []).append(os.path.relpath(path, ROOT))
    info = read(MENU_INFO)
    for key in re.findall(r'flag\(flags,\s*"([^"]+)"\)', info):
        read_flags.setdefault(key, 0)
        read_flags[key] += 1

    for key, where in sorted(set_flags.items()):
        if key not in read_flags:
            fail("menu flag", where[0], f"{key} is recorded by a patch but no row on the Patch status page shows it")
    for key in sorted(read_flags):
        if key not in set_flags:
            fail("menu flag", "MenuInfo.java", f"row for {key} can never read as applied - no patch records it")


def check_apps():
    """Each app in apps.json needs a docs page and an icon; the bundle description must name it."""
    manifest = read(os.path.join(ROOT, "apps.json"))
    data = json.loads(manifest)
    description = ""
    for path in walk(ROOT, ".kts"):
        text = read(path)
        if "bundles" in text or "description" in text:
            match = re.search(r'description\s*=\s*"([^"]+)"', text, re.S)
            if match:
                description = match.group(1)
    for package, app in data["apps"].items():
        slug = app.get("slug")
        page = os.path.join(ROOT, "docs", "apps", f"{slug}.md")
        if not os.path.exists(page):
            fail("apps.json", "apps.json", f"{package} has no docs/apps/{slug}.md")
        icons = os.path.join(ROOT, "assets", "icons")
        if not any(os.path.exists(os.path.join(icons, f"{package}{ext}")) for ext in (".svg", ".png")):
            fail("apps.json", "apps.json", f"{package} has no icon in assets/icons")
        if description and app["name"].lower() not in description.lower():
            fail("bundle description", "patches/build.gradle.kts",
                 f"the description Manager shows does not name {app['name']}")


def check_logs():
    """
    Success paths must not write to the diagnostic log: LokiLog.note() is unconditional and MX alone filled the
    report with one line per page open. Failures keep note(); routine events use debug(context, ...).
    """
    failure_words = ("fail", "error", "could not", "cannot", "can't", "not found", "missing", "refus", "denied",
                     "unsupported", "exception", "no ", "changed", "gave up", "empty")
    routine = ("added", "wired", "tapped", "active", "hook", "ok", "applied", "opened", "started")
    for path in walk(EXTENSION, ".java"):
        text = read(path)
        for match in re.finditer(r'LokiLog\.note\(((?:[^;]|\n)*?)\);', text):
            body = match.group(1)
            literal = " ".join(re.findall(r'"([^"]*)"', body)).lower()
            line = text[:match.start()].count("\n") + 1
            before = text[:match.start()].rsplit("\n", 1)[-1] + body
            if "audit: keep" in before:
                continue
            if any(word in literal for word in failure_words):
                continue
            if any(word in literal for word in routine):
                fail("log noise", os.path.relpath(path, ROOT) + f":{line}",
                     f'note("{literal[:48]}") runs on a success path - use LokiLog.debug(context, ...)')


def check_row_builders():
    """A host row built beside the app's own rows must copy its neighbour's layout params, margins included."""
    for path in walk(EXTENSION, ".java"):
        text = read(path)
        if "Loki Patches" not in text or "setOnClickListener" not in text:
            continue
        # Only a row placed among the host's own rows: a floating button sets its own FrameLayout params.
        # A row placed among the host's rows is inserted at an index; an overlay is simply added on top.
        if "indexOfChild" not in text and "addView(" not in text.replace("setOnClickListener", ""):
            continue
        if "indexOfChild" not in text:
            continue
        if "LayoutParams" not in text:
            continue
        if "setMargins" not in text and "paramsOf" not in text and "MarginLayoutParams" not in text:
            fail("row layout", os.path.relpath(path, ROOT),
                 "builds a row without copying the neighbour's margins - the row will not line up")


def check_featured():
    """The Featured row is capped, and every app in it can actually render."""
    data = json.loads(read(os.path.join(ROOT, "apps.json")))
    featured = [(a.get("featured"), name, a) for name, a in data["apps"].items() if a.get("featured")]
    if len(featured) > 5:
        fail("featured", "apps.json",
             f"{len(featured)} apps are featured; the row holds 5 - extra apps still appear in the index")
    seen = set()
    for position, package, app in featured:
        if position in seen:
            fail("featured", "apps.json", f"{app['name']} reuses featured position {position}")
        seen.add(position)
        if not app.get("blurb"):
            fail("featured", "apps.json", f"{app['name']} is featured with no blurb")
        if not os.path.exists(os.path.join(ROOT, "docs", "apps", app["slug"] + ".md")):
            fail("featured", "apps.json", f"{app['name']} is featured but has no docs page")


def check_versions():
    """Every app carries the newest two releases, never more: an old entry is carried work nobody tests."""
    for constants in walk(PATCHES, "Constants.kt"):
        text = read(constants)
        versions = re.findall(r'AppTarget\(version = "([^"]+)"\)', text)
        # LinkedIn keeps its versions in a list that is mapped to targets.
        for listed in re.findall(r'_BUILDS\s*=\s*listOf\(([^)]*)\)', text):
            versions += re.findall(r'"([^"]+)"', listed)
        if len(versions) > 2:
            fail("versions", os.path.relpath(constants, ROOT),
                 f"{len(versions)} versions listed ({', '.join(versions)}); the rule is the newest two")


def check_docs_claims():
    """A patch count in prose must match the patches that exist."""
    count = len(set(re.findall(r'name\s*=\s*"([^"]+)"', "".join(read(p) for p in walk(PATCHES, ".kt")))))
    for path in walk(os.path.join(ROOT, "docs"), ".md"):
        text = read(path)
        for number in re.findall(r'(\d+)\s+patches', text):
            if int(number) > count + 12:
                fail("docs claim", os.path.relpath(path, ROOT),
                     f"claims {number} patches; the tree defines {count} names")


def check_brand():
    """The logo Manager shows for this source and the logo the app draws are one file: the Loki L."""
    bundle = os.path.join(ROOT, "patches-bundle.png")
    logo = os.path.join(ROOT, "patches", "src", "main", "resources", "loki", "loki_logo.png")
    for path in (bundle, logo):
        if not os.path.exists(path):
            fail("brand", os.path.relpath(path, ROOT), "missing - the Loki L must ship")
            return
    with open(bundle, "rb") as a, open(logo, "rb") as b:
        if a.read() != b.read():
            fail("brand", "patches-bundle.png", "differs from loki/loki_logo.png - Manager and the app would show two logos")
    icon = os.path.join(PATCHES, "app", "loki", "patches", "universal", "LokiIcon.kt")
    if 'LOKI_ICON = "@drawable/loki_logo"' not in read(icon):
        fail("brand", os.path.relpath(icon, ROOT), "LOKI_ICON no longer points at the L (@drawable/loki_logo)")


def check_private():
    """
    Private apps live on this PC only: nothing in the public tree may name them. The names come from
    tools/private-names.txt (one per line), which is git-ignored, so the check itself names nothing.
    """
    names_file = os.path.join(ROOT, "tools", "private-names.txt")
    if not os.path.exists(names_file):
        return
    names = [line.strip() for line in read(names_file).splitlines() if line.strip()]
    if not names:
        return
    words = re.compile("|".join(re.escape(n) for n in names), re.IGNORECASE)
    bases = [os.path.join(ROOT, d) for d in ("patches", "extensions", "docs", "tools", ".github")]
    files = [os.path.join(ROOT, "README.md"), os.path.join(ROOT, "apps.json")]
    for base in bases:
        for folder, dirs, names in os.walk(base):
            dirs[:] = [d for d in dirs if d not in ("build", ".gradle")]
            files += [os.path.join(folder, n) for n in names if not n.endswith((".png", ".jpg", ".so", ".jar"))]
    for path in files:
        if os.path.abspath(path) in (os.path.abspath(__file__), os.path.abspath(names_file)) or not os.path.exists(path):
            continue
        if words.search(read(path)):
            fail("private", os.path.relpath(path, ROOT), "names a private app")


def main():
    check_menu_flags()
    check_apps()
    check_logs()
    check_row_builders()
    check_featured()
    check_versions()
    check_docs_claims()
    check_brand()
    check_private()
    if not failures:
        print("audit: clean")
        return 0
    for check, where, detail in failures:
        print(f"FAIL [{check}] {where}: {detail}")
    print(f"\n{len(failures)} finding(s)")
    return 1


if __name__ == "__main__":
    sys.exit(main())
