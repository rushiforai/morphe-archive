#!/usr/bin/env python3
"""
inject-amoled.py
Merges custom AMOLED dark theme IDs into Hushfeed's AmoledThemePatch.kt before
the Gradle build, while PRESERVING the author's own IDs (merge mode).
Also relaxes the strict sheet-item completeness check so builds never fail on
versions where some IDs do not exist.

Usage: python3 inject-amoled.py   (run from repository root)
"""
import re
import sys

FILE_PATH = "patches/src/main/kotlin/app/morphe/patches/tiktok/misc/theme/AmoledThemePatch.kt"

# Custom IDs (discovered on 46.x / 47.0.3). Merged with whatever the author ships.
OUR_SHEET_ITEMS = ('"eyq", "cbx", "eze", "f2a", "f8g", "f8j", '
                   '"ccr", "cd4", "f38", "f39", "f3d", "f3e", "f5_", "agg", "agh", "agm", "agn", '
                   '"bo", "bx", "c1", "c8p", "c8r", "c8z", "c90", "eu8", "ezu", "f2t", '
                   '"aag", "ae5", "ag2", "apn", "a3i"')

OUR_DECLARED_ITEMS = OUR_SHEET_ITEMS

OLD_CHECK_PATTERN = (
    r"internal fun checkSheetStyleItems\(found: Set<String>, versionName: String\?, "
    r"declared: Set<String>\)\s*\{.*?if \(found\.isEmpty\(\)\) throw PatchException"
    r"\(\"No dark sheet style item was found on \$versionName\"\)\s*\}"
)

NEW_CHECK = (
    'internal fun checkSheetStyleItems(found: Set<String>, versionName: String?, declared: Set<String>) {\n'
    '    if (found.isEmpty()) throw PatchException("No dark sheet style item was found on $versionName")\n'
    '}'
)


def main():
    try:
        with open(FILE_PATH, "r") as f:
            content = f.read()
    except FileNotFoundError:
        print(f"ERROR: Could not find {FILE_PATH}")
        print("Are you running this from the repository root?")
        sys.exit(1)

    original = content

    # MERGE mode: insert our IDs right after 'setOf(', keep the author's entries.
    # Duplicates are legal in Kotlin's setOf (they dedupe), so this is safe.
    content = re.sub(
        r'(internal val SHEET_STYLE_ITEMS\s*=\s*setOf\()',
        r'\1' + OUR_SHEET_ITEMS + ', ',
        content,
        count=1
    )
    content = re.sub(
        r'(private val DECLARED_ONLY_ITEMS\s*=\s*setOf\()',
        r'\1' + OUR_DECLARED_ITEMS + ', ',
        content,
        count=1
    )

    # Relaxed completeness check: throw only when nothing at all matched.
    content = re.sub(OLD_CHECK_PATTERN, NEW_CHECK, content, flags=re.DOTALL)

    if content == original:
        print("WARNING: injection changed nothing — author may have renamed the targets.")
    else:
        print("AMOLED IDs merged with author's list; strict check relaxed.")

    with open(FILE_PATH, "w") as f:
        f.write(content)


if __name__ == "__main__":
    main()