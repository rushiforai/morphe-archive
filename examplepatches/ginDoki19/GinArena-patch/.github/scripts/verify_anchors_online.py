#!/usr/bin/env python3
"""Checks that every in-page link in README.md points at a heading GitHub really produces.

Why this exists
---------------
check_readme_links.py does the same job offline, by re-implementing GitHub's rules. Every
anchor bug this repo has had came from that re-implementation being subtly wrong: punctuation
collapsed instead of deleted, headings inside code fences counted, HTML inside a heading
turned into text. An approximation cannot be trusted to grade itself.

This script asks GitHub. It renders the README through the markdown API, reads back the
heading text GitHub actually produced and the links GitHub actually emitted, and slugs the
headings with GitHub's own library (github-slugger). Nothing here has an opinion of its own.

    python3 verify_anchors_online.py [README.md] --slugger-dir DIR [--token TOKEN] [--strict]

Exit codes
----------
    0   every in-page link resolves
    1   at least one does not
    2   the check could not be set up (no README, no --slugger-dir)
    3   the check could not be run (GitHub unreachable, unusable response, no slugger)

This script reports; it does not set policy. Every outcome gets its own code and the caller
decides what to do with it. The workflow treats 3 as a warning, because a network blip must
not fail a pull request that the offline check has already cleared - and it must not look
like a pass either.

What this does not do
---------------------
It renders the working tree, not the live page. The live page lags behind the commit and, as
of this writing, still carries a hand-written anchor that the working tree no longer has.
"""

import argparse
import difflib
import html
import json
import os
import re
import shutil
import subprocess
import sys
import time
import urllib.error
import urllib.request
from html.parser import HTMLParser
from urllib.parse import unquote

API = "https://api.github.com/markdown"
USER_AGENT = "GinArena-anchor-check"

# The prefix GitHub puts in front of ids on the rendered page. The API response does not add
# it, but a hand-written raw-HTML anchor arriving some other way might carry one.
ID_PREFIX = "user-content-"

HEADINGS = {"h1", "h2", "h3", "h4", "h5", "h6"}


class Extract(HTMLParser):
    """Collects heading text and in-page hrefs from rendered markdown.

    Heading text is the concatenation of the text nodes inside the tag, with entities
    decoded and no trimming - exactly the string GitHub hands to its slugger. Tags inside a
    heading contribute nothing: that is why an <img> leaves only the space next to it.

    convert_charrefs is on, so an href written "#foo&amp;bar" arrives as "#foo&bar" and a
    heading written "&amp;" arrives as "&", which is what the slugger sees.
    """

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.headings = []          # rendered heading text, in document order
        self.hrefs = []             # every href="..." value, in document order
        self.ids = set()            # id="..." on any element, for hand-written anchors
        self._open = None
        self._buf = []

    def handle_starttag(self, tag, attrs):
        values = dict(attrs)
        identifier = values.get("id")
        if identifier:
            # GitHub prefixes raw-HTML ids on the way out: <a id="x"> in the markdown comes
            # back as id="user-content-x". Strip it so it compares like any other anchor.
            self.ids.add(strip_prefix(identifier))
        if tag == "a":
            href = values.get("href")
            if href is not None:
                self.hrefs.append(href)
        if tag in HEADINGS and self._open is None:
            self._open, self._buf = tag, []

    def handle_endtag(self, tag):
        if tag in HEADINGS and self._open == tag:
            self.headings.append("".join(self._buf))
            self._open, self._buf = None, []

    def handle_data(self, data):
        if self._open is not None:
            self._buf.append(data)


def parse(html_text):
    """Return (heading_texts, in_page_hrefs, ids) from GitHub's rendered HTML."""
    parser = Extract()
    parser.feed(html_text)
    parser.close()
    return parser.headings, parser.hrefs, parser.ids


def strip_prefix(identifier):
    return identifier[len(ID_PREFIX):] if identifier.startswith(ID_PREFIX) else identifier


def normalise(href):
    """Turn an href into the anchor id it asks for."""
    return strip_prefix(unquote(href[1:]))   # GitHub percent-encodes non-ASCII in hrefs


def slug_headings(headings, slugger_dir, node="node"):
    """Slug every heading with github-slugger. Returns (slugs, error message)."""
    helper = os.path.join(os.path.dirname(os.path.abspath(__file__)), "slug_headings.mjs")
    payload = json.dumps(headings)
    try:
        result = subprocess.run(
            [node, helper, slugger_dir],
            input=payload, capture_output=True, text=True, timeout=120,
        )
    except FileNotFoundError:
        return None, "node is not installed or not on PATH"
    except subprocess.TimeoutExpired:
        return None, "the slug helper timed out"
    if result.returncode != 0:
        return None, (result.stderr.strip() or f"the slug helper exited {result.returncode}")
    try:
        slugs = json.loads(result.stdout)
    except json.JSONDecodeError:
        return None, f"the slug helper printed something that is not JSON: {result.stdout[:200]!r}"
    if len(slugs) != len(headings):
        return None, f"asked for {len(headings)} slugs, got {len(slugs)}"
    return slugs, None


def render(markdown, token=None, api=API, attempts=3, timeout=30):
    """Render the markdown through GitHub's API. Returns (html, error message)."""
    body = json.dumps({"text": markdown, "mode": "gfm"}).encode("utf-8")
    headers = {"Content-Type": "application/json", "User-Agent": USER_AGENT,
               "Accept": "application/vnd.github+json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"

    last = None
    for attempt in range(1, attempts + 1):
        request = urllib.request.Request(api, data=body, headers=headers)
        try:
            with urllib.request.urlopen(request, timeout=timeout) as response:
                return response.read().decode("utf-8", errors="strict"), None
        except urllib.error.HTTPError as error:
            detail = ""
            try:
                detail = error.read().decode("utf-8", "replace")[:300]
            except Exception:
                pass
            last = f"HTTP {error.code} from the markdown API{': ' + detail if detail else ''}"
            # 4xx other than a rate limit will not change on a retry.
            if 400 <= error.code < 500 and error.code != 429:
                return None, last
        except urllib.error.URLError as error:
            last = f"could not reach the markdown API: {error.reason}"
        except UnicodeDecodeError:
            last = "the markdown API returned something that is not UTF-8"
        except Exception as error:                     # noqa: BLE001 - report, never crash
            last = f"unexpected failure talking to the markdown API: {error!r}"

        if attempt < attempts:
            time.sleep(min(2 ** attempt, 10))
    return None, last


def evaluate(headings, slugs, hrefs, ids):
    """Compare the anchors the README asks for with the ones GitHub produces.

    Returns (problems, checked) where problems is a list of (href, anchor, suggestion).
    """
    targets = set(slugs) | set(ids)
    known = list(slugs)

    problems = []
    checked = 0
    for href in hrefs:
        if not href.startswith("#"):
            continue                      # an external link, or "" from an image
        checked += 1
        anchor = normalise(href)
        if anchor and anchor in targets:
            continue
        guess = difflib.get_close_matches(anchor, known, n=1, cutoff=0.6)
        problems.append((href, anchor, guess[0] if guess else None))
    return problems, checked


def main(argv):
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("readme", nargs="?", default="README.md")
    parser.add_argument("--slugger-dir", default=os.environ.get("SLUGGER_DIR"),
                        help="directory holding node_modules/github-slugger")
    parser.add_argument("--token", default=os.environ.get("GITHUB_TOKEN"))
    parser.add_argument("--api", default=API)
    args = parser.parse_args(argv[1:])

    try:
        with open(args.readme, encoding="utf-8") as handle:
            markdown = handle.read()
    except OSError as error:
        print(f"cannot read {args.readme}: {error}")
        return 2

    if not args.slugger_dir:
        print("pass --slugger-dir (the directory holding node_modules/github-slugger)")
        return 2

    rendered, error = render(markdown, token=args.token, api=args.api)
    if rendered is None:
        print(f"::warning::online anchor check did not run - {error}")
        return 3

    if not rendered.strip():
        # Answered before anything else is loaded: an empty document would "pass" trivially,
        # and saying so should not depend on the slugger being installed.
        print("::warning::GitHub returned an empty render; refusing to call that a pass")
        return 3

    headings, hrefs, ids = parse(rendered)
    slugs, error = slug_headings(headings, args.slugger_dir)
    if slugs is None:
        print(f"::warning::online anchor check did not run - {error}")
        return 3

    in_page = [h for h in hrefs if h.startswith("#")]
    if not headings and not in_page:
        print("Nothing to check: the README has no headings and no in-page links.")
        return 0

    problems, checked = evaluate(headings, slugs, hrefs, ids)
    unique = len({h for h in hrefs if h.startswith("#")})
    print(f"Rendered {args.readme} through GitHub's markdown API.")
    print(f"  headings GitHub produced : {len(headings)}")
    print(f"  in-page links            : {checked} ({unique} unique)")
    print(f"  hand-written <a id>      : {len(ids)}")

    if not problems:
        print("OK: every in-page link points at a heading GitHub really produces.")
        return 0

    for href, anchor, guess in problems:
        if not anchor:
            print(f"EMPTY ANCHOR: {href!r} jumps to the top of the page, not to a section")
        elif guess:
            print(f"DEAD LINK: {href!r} - no heading slugs to {anchor!r}; "
                  f"the closest is {guess!r}")
        else:
            print(f"DEAD LINK: {href!r} - no heading slugs to {anchor!r}")

    print(f"\n{len(problems)} bad link(s) out of {checked}, in {args.readme}.")
    print("The README is what GitHub rendered; the anchors above are what it produced.")
    return 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
