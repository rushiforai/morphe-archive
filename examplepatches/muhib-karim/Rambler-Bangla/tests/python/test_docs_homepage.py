#!/usr/bin/env python3
"""Checks that keep the README homepage and the GitHub Pages site honest.

Needs only Python 3 (stdlib unittest): no JDK, toolchain or network.
    python3 -m unittest discover -s tests/python -v
"""
import os
import re
import unittest
from html.parser import HTMLParser

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
README = os.path.join(ROOT, "README.md")
SITE = os.path.join(ROOT, "docs", "index.html")
REPO_URL = "https://github.com/muhib-karim/Rambler-Bangla"
SITE_URL = "https://muhib-karim.github.io/Rambler-Bangla/"


def read(path):
    with open(path, encoding="utf-8") as fh:
        return fh.read()


def headings(markdown):
    return [m.group(1).strip() for m in re.finditer(r"^#{2,3} +(.+)$", markdown, re.M)]


def github_slug(heading):
    """Anchor GitHub generates for a Markdown heading."""
    slug = re.sub(r"[^\w\- ]", "", heading.strip().lower())
    return slug.replace(" ", "-")


def css_tokens(html):
    """First definition of each --token: #hex in the page (later overrides ignored)."""
    tokens = {}
    for name, value in re.findall(r"--([a-z-]+):\s*(#(?:[0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})\b)", html):
        tokens.setdefault(name, value)
    return tokens


def relative_luminance(hex_colour):
    hex_colour = hex_colour.lstrip("#")
    if len(hex_colour) == 3:
        hex_colour = "".join(c * 2 for c in hex_colour)
    channels = [int(hex_colour[i:i + 2], 16) / 255 for i in (0, 2, 4)]
    lin = [c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4 for c in channels]
    return 0.2126 * lin[0] + 0.7152 * lin[1] + 0.0722 * lin[2]


def contrast(a, b):
    la, lb = sorted((relative_luminance(a), relative_luminance(b)), reverse=True)
    return (la + 0.05) / (lb + 0.05)


class _SiteParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.tags = []

    def handle_starttag(self, tag, attrs):
        self.tags.append((tag, dict(attrs)))


def site_tags():
    parser = _SiteParser()
    parser.feed(read(SITE))
    return parser.tags


class ReadmeHomepageTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.text = read(README)
        cls.heads = headings(cls.text)

    def test_banner_comes_first(self):
        first = self.text.lstrip().splitlines()[0]
        self.assertIn('src="docs/banner.svg"', first)
        self.assertTrue(os.path.isfile(os.path.join(ROOT, "docs", "banner.svg")))

    def test_badges_for_ci_static_suite_release_and_licence(self):
        for needle in ("actions/workflows/ci.yml/badge.svg",
                       "actions/workflows/tests.yml/badge.svg",
                       "img.shields.io/github/v/release/muhib-karim/Rambler-Bangla",
                       "img.shields.io/github/license/muhib-karim/Rambler-Bangla"):
            self.assertIn(needle, self.text)

    def test_required_sections_exist(self):
        for section in ("What it is and why", "How it works", "Device-free CI",
                        "Build from source", "Safety: fail-closed by design",
                        "Source only, no APKs", "FAQ", "Roadmap", "Links"):
            self.assertIn(section, self.heads, f"README is missing the '{section}' section")

    def test_architecture_mermaid_runs_guard_patch_runtime_verify(self):
        blocks = re.findall(r"```mermaid\n(.*?)```", self.text, re.S)
        self.assertTrue(blocks, "README has no mermaid diagram")
        flow = blocks[0]
        stages = ["Fingerprint guard", "Smali patch", "Policy runtime", "Verify"]
        positions = [flow.find(s) for s in stages]
        self.assertNotIn(-1, positions, f"mermaid diagram must name {stages}")
        self.assertEqual(positions, sorted(positions), "stages must appear in pipeline order")

    def test_source_only_and_legal_note_are_explicit(self):
        lowered = self.text.lower()
        self.assertIn("source only", lowered)
        self.assertIn("no apk", lowered)
        self.assertIn("not affiliated with google", lowered)

    def test_latest_release_is_current(self):
        self.assertIn("v29.4", self.text)
        self.assertNotRegex(self.text, r"[Ll]atest (tagged )?release[^\n]*v29\.3\b")

    def test_relative_links_resolve(self):
        slugs = {github_slug(h) for h in headings(self.text)}
        missing = []
        for target in re.findall(r"\]\(([^)\s]+)\)|(?:href|src)=\"([^\"]+)\"", self.text):
            link = next(t for t in target if t)
            if link.startswith("#"):
                if link[1:] not in slugs:
                    missing.append(link)
                continue
            if link.startswith(("http://", "https://", "mailto:")):
                continue
            path = link.split("#", 1)[0]
            if path and not os.path.exists(os.path.join(ROOT, path)):
                missing.append(link)
        self.assertEqual(missing, [])

    def test_quoted_unit_test_count_matches_suite(self):
        count = unittest.TestLoader().discover(os.path.dirname(__file__)).countTestCases()
        quoted = {int(n) for n in re.findall(r"(\d+) Python unit tests", self.text)}
        self.assertEqual(quoted, {count})

    def test_quoted_static_suite_count_matches_run_tests(self):
        script = read(os.path.join(ROOT, "tests", "run_tests.sh"))
        count = len(re.findall(r"check \$\?", script))
        patterns = [r"[Ss]tatic suite\*{0,2},?\s*(\d+) checks",
                    r"(\d+) end-to-end checks",
                    r"TEST SUITE: (\d+) passed, 0 failed"]
        for name, text in (("README", self.text), ("docs/index.html", read(SITE))):
            for pat in patterns:
                for n in re.findall(pat, text):
                    self.assertEqual(int(n), count,
                        f"{name} quotes stale static-suite count {n} != {count} ({pat})")


class PagesSiteTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.html = read(SITE)
        cls.tags = site_tags()

    def test_mobile_first_document_basics(self):
        self.assertRegex(self.html, r"<html lang=\"en\">")
        metas = [a for t, a in self.tags if t == "meta"]
        self.assertIn("width=device-width,initial-scale=1",
                      [m.get("content", "").replace(" ", "") for m in metas if m.get("name") == "viewport"])

    def test_no_external_scripts_styles_or_trackers(self):
        for tag, attrs in self.tags:
            if tag == "script":
                self.fail("the site must not load any script")
            if tag == "link" and attrs.get("href", "").startswith(("http://", "https://", "//")):
                self.fail(f"remote <link> would leak visits: {attrs.get('href')}")
            if tag in ("img", "iframe", "source"):
                src = attrs.get("src", "")
                self.assertFalse(src.startswith(("http://", "https://", "//")),
                                 f"remote {tag} would leak visits: {src}")
        for tracker in ("google-analytics", "googletagmanager", "gtag(", "plausible",
                        "matomo", "clarity.ms", "hotjar", "segment.io", "fonts.googleapis"):
            self.assertNotIn(tracker, self.html)
        self.assertNotRegex(self.html, r"@import|url\(\s*['\"]?(https?:)?//")

    def test_colour_tokens_meet_wcag_aa(self):
        tokens = css_tokens(self.html)
        for fg, bg in (("text", "bg"), ("muted", "bg"), ("accent", "bg"),
                       ("text", "surface"), ("muted", "surface"), ("on-accent", "accent")):
            self.assertIn(fg, tokens)
            self.assertIn(bg, tokens)
            self.assertGreaterEqual(contrast(tokens[fg], tokens[bg]), 4.5,
                                    f"--{fg} on --{bg} is below 4.5:1")

    def test_same_content_as_readme(self):
        ids = {a.get("id") for _, a in self.tags if a.get("id")}
        for section in ("what", "how", "ci", "build", "safety", "source-only", "faq", "roadmap", "links"):
            self.assertIn(section, ids, f"site is missing #{section}")
        self.assertIn("Not affiliated with Google", self.html)
        self.assertIn("v29.4", self.html)

    def test_has_skip_link_and_landmarks(self):
        self.assertRegex(self.html, r'<a class="skip" href="#main">')
        names = [t for t, _ in self.tags]
        for landmark in ("header", "nav", "main", "footer"):
            self.assertIn(landmark, names)

    def test_local_assets_exist(self):
        for tag, attrs in self.tags:
            ref = attrs.get("src") or (attrs.get("href") if tag == "link" else None)
            if ref and not ref.startswith(("http", "#", "//", "data:")):
                self.assertTrue(os.path.exists(os.path.join(ROOT, "docs", ref)), ref)


if __name__ == "__main__":
    unittest.main()
