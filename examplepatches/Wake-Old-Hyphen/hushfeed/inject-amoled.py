#!/usr/bin/env python3
"""
inject-amoled.py
Injects custom AMOLED dark theme IDs into Hushfeed's AmoledThemePatch.kt
before the Gradle build. This allows us to keep the main branch perfectly
synced with upstream (SysAdminDoc/hushfeed) without merge conflicts.

Usage: python3 inject-amoled.py
"""

import re
import sys

FILE_PATH = "patches/src/main/kotlin/app/morphe/patches/tiktok/misc/theme/AmoledThemePatch.kt"

# Your massive list of custom IDs for SHEET_STYLE_ITEMS
NEW_SHEET_ITEMS = '''
    // Original sheet tokens (Comments, Share, and general sheets)
    "agk", "c3", "aia",
    
    // #161823 literal items (Followers/Following/Suggested sheets)
    "eyq", "cbx", "eze", "f2a", "f8g", "f8j",
    
    // #1e1e1e literal items (dark gray surfaces)
    "ccr", "cd4", "f38", "f39", "f3d", "f3e", "f5_", "agg", "agh", "agm", "agn",
    
    // #121212 literal items (material dark surfaces)
    "bo", "bx", "c1", "c8p", "c8r", "c8z", "c90", "eu8", "ezu", "f2t", "aag", "ae5", "ag2", "apn", "a3i"
'''

# Your massive list of custom IDs for DECLARED_ONLY_ITEMS
NEW_DECLARED_ITEMS = '''
    "aia",
    // New items only valid on declared builds (47.0.3+)
    "eyq", "cbx", "eze", "f2a", "f8g", "f8j",
    "ccr", "cd4", "f38", "f39", "f3d", "f3e", "f5_", "agg", "agh", "agm", "agn",
    "bo", "bx", "c1", "c8p", "c8r", "c8z", "c90", "eu8", "ezu", "f2t", "aag", "ae5", "ag2", "apn", "a3i"
'''


def main():
    try:
        with open(FILE_PATH, "r") as f:
            content = f.read()
    except FileNotFoundError:
        print(f"❌ ERROR: Could not find {FILE_PATH}")
        print("Are you running this from the repository root?")
        sys.exit(1)

    original_content = content

    # Regex to find SHEET_STYLE_ITEMS assignment regardless of formatting
    sheet_pattern = r'(internal val SHEET_STYLE_ITEMS\s*=\s*setOf\()\s*.*?\s*(\))'
    content = re.sub(
        sheet_pattern,
        r'\1' + NEW_SHEET_ITEMS + r'\2',
        content,
        flags=re.DOTALL
    )

    # Regex to find DECLARED_ONLY_ITEMS assignment regardless of formatting
    declared_pattern = r'(private val DECLARED_ONLY_ITEMS\s*=\s*setOf\()\s*.*?\s*(\))'
    content = re.sub(
        declared_pattern,
        r'\1' + NEW_DECLARED_ITEMS + r'\2',
        content,
        flags=re.DOTALL
    )

    if content == original_content:
        print("⚠️  WARNING: Could not find SHEET_STYLE_ITEMS or DECLARED_ONLY_ITEMS.")
        print("   The author might have renamed them. Proceeding with author's defaults.")
    else:
        print("✅ AMOLED IDs successfully injected into author's code!")

    with open(FILE_PATH, "w") as f:
        f.write(content)


if __name__ == "__main__":
    main()