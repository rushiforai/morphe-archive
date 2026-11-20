#!/usr/bin/env python3
"""Capture what Lurk relies on in Kick's chat page into tests/kick/chat-page-contract.json.

Usage: python3 -I tests/kick/refresh_chat_page_contract.py [--check]

Kick serves its chat page (https://chat.mobile.kick.com) itself and can change it at any time, so Lurk can't
check it while patching. This downloads the live page, its script and its stylesheet, and records the class names
the page uses and whether each behavior Lurk depends on is still there (REQUIRED below). It stores names and yes/no
results only, never Kick's code. With --check it writes nothing: it compares the live page with the stored file
and fails if anything Lurk needs has gone. Without --check it rewrites the file, and still fails (after writing)
when something required is missing, so the diff shows what changed. tests/kick/test_chat_page.py checks offline
that every selector KickChat and the page scripts use is in the stored list.
"""
import argparse
import datetime
import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path

PAGE = "https://chat.mobile.kick.com/"
FIXTURE = Path(__file__).resolve().with_name("chat-page-contract.json")
USER_AGENT = "Mozilla/5.0 (Linux; Android 16) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0 Mobile Safari/537.36"

# What Lurk's chat page scripts and KickChat need, with the patch that needs it. "class" entries must be class
# names the page uses; "code" entries are patterns that must match the page's script, "css" ones its stylesheet.
REQUIRED = {
    "class:message-container": "7TV emotes, Chat keywords, Chat search, Chat timestamps (each chat line)",
    "class:message-content": "7TV emotes, Chat keywords, Chat search (a line's text)",
    "class:username": "Chat keywords, Chat search (a line's sender)",
    "class:emote": "7TV emotes (Kick's own emote images)",
    "class:subscription-container": "Hide chat highlights: Hide sub and gift messages",
    "class:subgift-container": "Hide chat highlights: Hide sub and gift messages",
    "class:host-container": "Hide chat highlights: Hide host messages",
    "class:reward-redeem-container": "Hide chat highlights: Hide reward redemptions",
    "class:line-through": "Show deleted messages (moderator view marks removed lines)",
    "class:timestamp": "Chat timestamps clock (each line's time)",
    "code:message-list": r"""getElementById\(["']app["']\)""",
    "code:config-from-bridge-first": r"""injectedObjectJson\)\?window\.ReactNativeWebView\.injectedObjectJson\(\):new URL\(location\.href\)\.searchParams\.get\(["']config["']\)""",
    "code:moderator-view": r"""userCanModerate""",
    "code:clear-empties-list": r"""\.innerHTML\s*=\s*["']{2}""",
    "code:sender-id-attribute": r"""data-sender-id""",
    "css:timestamps-display": r"""\.timestamp\{[^}]*display:\s*var\(--timestamps-display\)""",
    "code:timestamp-format": r"""toLocaleTimeString\([^,()]+,\{hour:["']2-digit["'],minute:["']2-digit["']\}\)""",
    "css:chatroom-font-size": r"""font-size:\s*var\(--chatroom-font-size\)""",
    "css:message-gap": r"""row-gap:\s*var\(--message-gap\)""",
}
CODE_PURPOSE = {
    "code:message-list": "every chat page feature (the #app message list)",
    "code:config-from-bridge-first": "Show deleted messages (the page prefers ReactNativeWebView.injectedObjectJson)",
    "code:moderator-view": "Show deleted messages",
    "code:clear-empties-list": "Ignore chat clears (a clear empties the list through innerHTML)",
    "code:sender-id-attribute": "Chat keywords (blocked users, by sender ID)",
    "css:timestamps-display": "Chat timestamps (each line's time shows through --timestamps-display)",
    "code:timestamp-format": "Chat timestamps clock (the page writes each time with toLocaleTimeString, 2-digit hour "
                             "and minute)",
    "css:chatroom-font-size": "Chat text size (the text follows --chatroom-font-size)",
    "css:message-gap": "Compact chat (lines are spaced by --message-gap)",
}


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read().decode("utf-8", errors="replace")


def capture():
    html = fetch(PAGE)
    scripts = re.findall(r"""<script[^>]+src=["'](/assets/[^"']+\.js)["']""", html)
    styles = re.findall(r"""<link[^>]+href=["'](/assets/[^"']+\.css)["']""", html)
    if not scripts:
        sys.exit("FAIL: the chat page names no /assets/*.js script")
    code = "".join(fetch(PAGE.rstrip("/") + path) for path in scripts)
    css = "".join(fetch(PAGE.rstrip("/") + path) for path in styles)
    # Class names: every class the stylesheet styles, and every class the script adds, tests or writes in markup.
    names = set(re.findall(r"\.(-?[A-Za-z_][\w-]*)", re.sub(r"url\([^)]*\)|\d+\.\d+", "", css)))
    for call in re.findall(r"classList\.(?:add|remove|toggle|contains)\(([^)]*)\)", code):
        names.update(re.findall(r"""["']([A-Za-z_][\w-]*)["']""", call))
    for attribute in re.findall(r"""class(?:Name)?\s*=\s*\\?["']([^"'\\]+)""", code):
        names.update(name for name in attribute.split() if re.fullmatch(r"[A-Za-z_][\w-]*", name))
    names.update(re.findall(r"""querySelector(?:All)?\(\s*["'`]\.([A-Za-z_][\w-]*)""", code))
    checks = {}
    for key, value in REQUIRED.items():
        kind, name = key.split(":", 1)
        checks[key] = name in names if kind == "class" else bool(re.search(value, css if kind == "css" else code))
    return {
        "page": PAGE,
        "captured": datetime.date.today().isoformat(),
        "scripts": scripts,
        "scriptSha256": hashlib.sha256(code.encode()).hexdigest(),
        "required": {key: {"present": checks[key],
                           "for": REQUIRED[key] if key.startswith("class:") else CODE_PURPOSE[key]}
                     for key in REQUIRED},
        "classes": sorted(names),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--check", action="store_true", help="compare with the stored file, write nothing")
    args = parser.parse_args()
    live = capture()
    missing = [key for key, value in live["required"].items() if not value["present"]]
    if args.check:
        stored = json.loads(FIXTURE.read_text())
        gone = sorted(set(stored["classes"]) - set(live["classes"]))
        new = sorted(set(live["classes"]) - set(stored["classes"]))
        print(f"live script {', '.join(live['scripts'])}; stored {', '.join(stored['scripts'])} ({stored['captured']})")
        if gone:
            print("classes gone since the capture: " + ", ".join(gone))
        if new:
            print("classes new since the capture: " + ", ".join(new))
    else:
        FIXTURE.write_text(json.dumps(live, indent=1) + "\n")
        print(f"wrote {FIXTURE.name}: {len(live['classes'])} classes from {', '.join(live['scripts'])}")
    for key in missing:
        print(f"MISSING {key}: needed by {live['required'][key]['for']}")
    if missing:
        sys.exit(f"FAIL: Kick's chat page no longer has {len(missing)} thing(s) Lurk relies on")
    print("PASS: Kick's live chat page has everything Lurk relies on")


if __name__ == "__main__":
    main()
