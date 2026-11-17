#!/usr/bin/env python3
"""Tests for the two README scripts, so the tripwire has a tripwire.

Why this exists
---------------
The link checker exists because a wrong anchor shipped twice. On 2026-11-14 it was checked
against a hand-written test file and got four of five reports wrong - the check itself was
the bug. A guard that blocks a good pull request costs more than the bug it was meant to
catch, so its behaviour is pinned here rather than trusted.

These run the real scripts as subprocesses against temporary fixtures: the generator reads
its arguments at import time, so importing it would run it. Nothing here needs the network,
a JVM or Gradle, and the whole file takes about a second.

Usage
-----
    python3 .github/scripts/test_readme_scripts.py

Exit code 0 = every test passed. Non-zero = something the scripts promise is no longer true.
"""

import contextlib
import importlib.util
import io
import json
import sys

# load_generator() below imports the generator, which would otherwise leave a __pycache__
# folder in .github/scripts. This repo has no Python in its .gitignore, so that folder shows
# up as an untracked change in GitHub Desktop the first time anyone runs these tests.
sys.dont_write_bytecode = True
import os
import re
import subprocess
import sys
import tempfile
import unittest

SCRIPTS = os.path.dirname(os.path.abspath(__file__))
GENERATE = os.path.join(SCRIPTS, "generate_patches_readme.py")
CHECK = os.path.join(SCRIPTS, "check_readme_links.py")

# Anchors as github-slugger 2.0.0 (GitHub's own library) produces them. Pinned, not derived,
# so a change in either script shows up as a failure instead of a quietly different README.
ANCHOR_VECTORS = [
    ("Remove ads & bloat", "remove-ads--bloat"),
    ("Fix  foo   bar", "fix--foo---bar"),
    ("MX Player (Pro) \u2014 codec", "mx-player-pro--codec"),
    ("\u00dcn\u00efc\u00f6d\u00e9 patch", "\u00fcn\u00efc\u00f6d\u00e9-patch"),
    ("Emoji \U0001F3AC patch", "emoji--patch"),
    # An accent typed as "e" plus U+0301 must slug like the precomposed letter.
    ("Cafe\u0301 decomposed", "cafe\u0301-decomposed"),
    ("CJK \u9690\u85cf\u5e7f\u544a", "cjk-\u9690\u85cf\u5e7f\u544a"),
    ("Underscore_name and-hyphen", "underscore_name-and-hyphen"),
    ("100% ad-free", "100-ad-free"),
    ("v2.0 \u2192 v3.0", "v20--v30"),
]

PATCH_TEMPLATE = {
    "name": "Placeholder",
    "description": "Placeholder description.",
    "compatiblePackages": [
        {
            "packageName": "com.example.app",
            "name": "Example",
            "formFactor": None,
            "targets": [{"version": "1.0", "isExperimental": False, "description": None}],
        }
    ],
}

README_TEMPLATE = """# Example

<!-- PATCHES_START -->
<!-- PATCHES_END -->

## Nothing else
"""


def make_patches(names, descriptions=None, version="1.2.3"):
    descriptions = descriptions or {}
    patches = []
    for name in names:
        patch = json.loads(json.dumps(PATCH_TEMPLATE))
        patch["name"] = name
        patch["description"] = descriptions.get(name, "Placeholder description.")
        patches.append(patch)
    return {"version": version, "patches": patches}


class Fixture:
    """A throwaway directory holding a README and a patches-list.json."""

    def __init__(self, patches, readme=README_TEMPLATE, bundle=None):
        self.dir = tempfile.mkdtemp(prefix="readme-scripts-")
        self.json = os.path.join(self.dir, "patches-list.json")
        self.readme = os.path.join(self.dir, "README.md")
        with open(self.json, "w", encoding="utf-8") as f:
            json.dump(patches, f, ensure_ascii=False)
        with open(self.readme, "w", encoding="utf-8") as f:
            f.write(readme)
        self.bundle = os.path.join(self.dir, "patches-bundle.json")
        if bundle is not None:
            with open(self.bundle, "w", encoding="utf-8") as f:
                f.write(bundle if isinstance(bundle, str) else json.dumps(bundle))

    def generate(self):
        return subprocess.run(
            [sys.executable, GENERATE, "owner/repo", "main", self.json, self.readme],
            capture_output=True, text=True,
        )

    def check(self):
        return subprocess.run(
            [sys.executable, CHECK, self.readme], capture_output=True, text=True,
        )

    def text(self):
        with open(self.readme, encoding="utf-8") as f:
            return f.read()

    def write(self, text):
        with open(self.readme, "w", encoding="utf-8") as f:
            f.write(text)


def load_generator(fixture=None):
    """Import generate_patches_readme.py so its functions can be called directly.

    The script does its work at module level, so loading it means running it. Handing it an
    empty fixture makes that harmless and leaves the functions available to test one at a
    time - which is the only way to reach the malformed-row guard, since correct escaping
    makes it unreachable from the outside.
    """
    fixture = fixture or Fixture(make_patches([]))
    spec = importlib.util.spec_from_file_location("generate_patches_readme", GENERATE)
    module = importlib.util.module_from_spec(spec)
    argv = sys.argv
    sys.argv = ["generate_patches_readme.py", "owner/repo", "main", fixture.json, fixture.readme]
    try:
        with contextlib.redirect_stdout(io.StringIO()):   # it announces what it injected
            spec.loader.exec_module(module)
    finally:
        sys.argv = argv
    return module


def row_cells(line):
    """Number of cells in a table row, counting an escaped pipe as text."""
    return len(re.findall(r"(?<!\\)\|", line)) - 1


class TestAnchors(unittest.TestCase):
    def test_anchors_match_github(self):
        """Every patch row links to the anchor GitHub gives that name's heading."""
        fixture = Fixture(make_patches([name for name, _ in ANCHOR_VECTORS]))
        result = fixture.generate()
        self.assertEqual(result.returncode, 0, result.stderr)

        emitted = re.findall(r"\]\(#([^)]*)\)", fixture.text())
        expected = [anchor for _, anchor in ANCHOR_VECTORS]
        self.assertEqual(sorted(emitted), sorted(expected))

    def test_anchor_is_not_empty_for_a_real_name(self):
        fixture = Fixture(make_patches(["Remove ads & bloat"]))
        fixture.generate()
        self.assertIn("](#remove-ads--bloat)", fixture.text())
        self.assertNotIn("](#)", fixture.text())


class TestTableEscaping(unittest.TestCase):
    def test_pipe_in_name_does_not_split_the_row(self):
        fixture = Fixture(make_patches(["Pipe | in name"]))
        result = fixture.generate()
        self.assertEqual(result.returncode, 0, result.stderr)

        rows = [l for l in fixture.text().splitlines() if l.startswith("| [")]
        self.assertEqual(len(rows), 1)
        self.assertEqual(row_cells(rows[0]), 3, rows[0])
        self.assertIn(r"Pipe \| in name", rows[0])

    def test_pipe_in_description_does_not_split_the_row(self):
        fixture = Fixture(
            make_patches(["Normal"], {"Normal": "A description with a | pipe inside."})
        )
        result = fixture.generate()
        self.assertEqual(result.returncode, 0, result.stderr)

        rows = [l for l in fixture.text().splitlines() if l.startswith("| [")]
        self.assertEqual(row_cells(rows[0]), 3, rows[0])
        self.assertIn(r"\|", rows[0])

    def test_angle_brackets_are_neutralised_but_br_survives(self):
        fixture = Fixture(
            make_patches(["Angle <b> name"], {"Angle <b> name": "bitrate < 2 Mbps\nsecond line"})
        )
        fixture.generate()
        text = fixture.text()
        self.assertIn("Angle &lt;b&gt; name", text)
        self.assertIn("bitrate &lt; 2 Mbps<br>second line", text)
        self.assertNotIn("<b>", text)

    def test_every_row_has_three_cells(self):
        """The general form: whatever goes in, no row may gain or lose a column."""
        fixture = Fixture(
            make_patches(
                ["a|b", "c<d", "e`f", "g&h", "\U0001F3AC"],
                {"a|b": "x|y", "c<d": "<script>", "g&h": "AT&T"},
            )
        )
        result = fixture.generate()
        self.assertEqual(result.returncode, 0, result.stderr)
        for line in fixture.text().splitlines():
            if line.startswith("| [") or line.startswith("| \U0001F48A"):
                self.assertEqual(row_cells(line), 3, line)


class TestCheckerFalsePositives(unittest.TestCase):
    """The four reports the checker got wrong on 2026-11-14 must stay silent."""

    def run_check(self, body):
        fixture = Fixture(make_patches([]), readme=body)
        return fixture.check()

    def test_link_with_a_title_resolves(self):
        body = "# Hello\n\n[a](#hello \"the title\")\n"
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_link_in_a_code_fence_is_ignored(self):
        body = "# Hello\n\n```\n[gone](#nowhere)\n```\n"
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_link_in_inline_code_is_ignored(self):
        body = "# Hello\n\nWrite `[x](#nowhere)` to link.\n"
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_link_in_an_html_comment_is_ignored(self):
        body = "# Hello\n\n<!-- [gone](#nowhere) -->\n"
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_image_is_ignored(self):
        body = "# Hello\n\n![](#nowhere)\n"
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_html_anchor_counts_as_a_target(self):
        body = '# Hello\n\n<a id="made-by-hand"></a>\n\n[jump](#made-by-hand)\n'
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_a_label_with_escaped_brackets_is_still_checked(self):
        """A patch called "Tag [beta] patch" writes its label as "Tag \\[beta\\] patch".

        The link pattern used to refuse to cross a bracket, so this row was skipped in
        silence: 30 links checked where GitHub saw 31.
        """
        body = "# Tag [beta] patch\n\n[Tag \\[beta\\] patch](#tag-beta-patch)\n"
        self.assertEqual(self.run_check(body).returncode, 0)

    def test_a_dead_link_behind_escaped_brackets_is_caught(self):
        body = "# Tag [beta] patch\n\n[Tag \\[beta\\] patch](#nowhere)\n"
        self.assertEqual(self.run_check(body).returncode, 1)

    def test_repeated_headings_get_github_suffixes(self):
        body = "# Dup\n\n## Dup\n\n[one](#dup) [two](#dup-1)\n"
        self.assertEqual(self.run_check(body).returncode, 0)


class TestCheckerTruePositives(unittest.TestCase):
    def test_dead_link_fails(self):
        fixture = Fixture(make_patches([]), readme="# Hello\n\n[gone](#nowhere)\n")
        result = fixture.check()
        self.assertEqual(result.returncode, 1)
        self.assertIn("DEAD LINK", result.stdout)

    def test_empty_anchor_fails(self):
        """[](#) jumps to the top of the page; it is not a link to a section."""
        fixture = Fixture(make_patches([]), readme="# Hello\n\n[top](#)\n")
        result = fixture.check()
        self.assertEqual(result.returncode, 1)
        self.assertIn("EMPTY ANCHOR", result.stdout)

    def test_ampersand_anchor_must_double_the_hyphen(self):
        fixture = Fixture(
            make_patches([]), readme="# Remove ads & bloat\n\n[ok](#remove-ads--bloat)\n"
        )
        self.assertEqual(fixture.check().returncode, 0)

        fixture = Fixture(
            make_patches([]), readme="# Remove ads & bloat\n\n[bad](#remove-ads-bloat)\n"
        )
        self.assertEqual(fixture.check().returncode, 1)


class TestEndToEnd(unittest.TestCase):
    def test_generator_then_checker_passes(self):
        fixture = Fixture(make_patches(["Remove ads & bloat", "Emoji \U0001F3AC patch"]))
        fixture.generate()
        body = fixture.text() + "\n## Remove ads & bloat\n\n## Emoji \U0001F3AC patch\n"
        fixture.write(body)
        result = fixture.check()
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_generator_is_idempotent(self):
        fixture = Fixture(make_patches(["Remove ads & bloat"]))
        fixture.generate()
        first = fixture.text()
        fixture.generate()
        self.assertEqual(first, fixture.text())


class TestFenceAndCommentTargets(unittest.TestCase):
    """A "#" line inside a code fence is not a heading, so it cannot be a link target."""

    BODY = (
        "# Real title\n\n"
        "```bash\n"
        "# output: build/libs/patches.mpp\n"
        "```\n\n"
        # the exact slug of "# output: build/libs/patches.mpp": punctuation is deleted,
        # spaces become hyphens, so the fence line would be a target if fences were ignored
        "[dead](#output-buildlibspatchesmpp)\n"
    )

    def test_heading_inside_a_fence_is_not_a_target(self):
        fixture = Fixture(make_patches([]), readme=self.BODY)
        result = fixture.check()
        self.assertEqual(result.returncode, 1, result.stdout)
        self.assertIn("DEAD LINK", result.stdout)

    def test_html_comment_heading_is_not_a_target(self):
        body = "# Real\n\n<!-- ## Hidden -->\n\n[x](#hidden)\n"
        fixture = Fixture(make_patches([]), readme=body)
        self.assertEqual(fixture.check().returncode, 1)

    def test_a_real_heading_after_a_fence_still_works(self):
        body = "# Real\n\n```\n# not one\n```\n\n## After\n\n[ok](#after)\n"
        fixture = Fixture(make_patches([]), readme=body)
        self.assertEqual(fixture.check().returncode, 0, fixture.check().stdout)


class TestAnchorTrimming(unittest.TestCase):
    def test_padding_does_not_change_the_anchor(self):
        """CommonMark trims heading text before slugging, so padding must not survive."""
        module = load_generator()
        self.assertEqual(module.anchor("   Padded name   "), "padded-name")
        self.assertEqual(module.anchor("  "), "")
        self.assertEqual(module.anchor("\u00a0Non breaking\u00a0"), "non-breaking")


class TestBackslashes(unittest.TestCase):
    """The generated section is passed to re.sub; a backslash must not be read as an escape."""

    def build(self, description):
        fixture = Fixture(make_patches(["Escape test"], {"Escape test": description}))
        result = fixture.generate()
        return fixture, result

    def test_backslash_digit_does_not_crash(self):
        fixture, result = self.build(r"a \1 b")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn(r"a \1 b", fixture.text())

    def test_backslash_n_does_not_become_a_newline(self):
        fixture, result = self.build(r"literal \n here")
        self.assertEqual(result.returncode, 0, result.stderr)
        rows = [l for l in fixture.text().splitlines() if l.startswith("| [")]
        self.assertEqual(len(rows), 1, rows)
        self.assertEqual(row_cells(rows[0]), 3, rows[0])

    def test_backslash_g_does_not_crash(self):
        fixture, result = self.build(r"group \g<1> ref")
        self.assertEqual(result.returncode, 0, result.stderr)


class TestDownloadLink(unittest.TestCase):
    VERSION = "1.2.3"

    def header(self, fixture):
        return [l for l in fixture.text().splitlines() if l.startswith("> **[v")][0]

    def test_template_when_there_is_no_bundle(self):
        fixture = Fixture(make_patches(["P"], version=self.VERSION))
        fixture.generate()
        self.assertIn(
            "https://github.com/owner/repo/releases/download/v1.2.3/patches-1.2.3.mpp",
            self.header(fixture),
        )

    def test_stale_bundle_is_ignored(self):
        """A bundle left over from the previous release must not supply the link."""
        fixture = Fixture(
            make_patches(["P"], version=self.VERSION),
            bundle={"version": "9.9.9",
                    "download_url": "https://github.com/owner/repo/releases/download/v9.9.9/patches-9.9.9.mpp"},
        )
        fixture.generate()
        self.assertIn("/v1.2.3/patches-1.2.3.mpp", self.header(fixture))
        self.assertNotIn("9.9.9", self.header(fixture))

    def test_matching_bundle_is_used_and_names_the_label(self):
        """A custom asset name must be used verbatim and drive the label."""
        fixture = Fixture(
            make_patches(["P"], version=self.VERSION),
            bundle={"version": "v1.2.3",
                    "download_url": "https://github.com/owner/repo/releases/download/v1.2.3/custom-build.mpp"},
        )
        fixture.generate()
        header = self.header(fixture)
        self.assertIn("/custom-build.mpp", header)
        self.assertIn("Download custom-build.mpp", header)

    def test_corrupt_bundle_falls_back(self):
        fixture = Fixture(make_patches(["P"], version=self.VERSION), bundle="{not json")
        result = fixture.generate()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("/v1.2.3/patches-1.2.3.mpp", self.header(fixture))


class TestRowGuard(unittest.TestCase):
    def test_a_raw_pipe_in_a_cell_is_refused(self):
        """If escaping ever misses a pipe, the build must stop rather than publish."""
        module = load_generator()
        with self.assertRaises(SystemExit):
            module.table_row(["a|b", "c", "d"])

    def test_a_clean_row_is_returned(self):
        module = load_generator()
        self.assertEqual(module.table_row(["a", "b", "c"]), "| a | b | c |")


class TestLinkTextEscaping(unittest.TestCase):
    def test_brackets_in_a_name_do_not_end_the_link(self):
        fixture = Fixture(make_patches(["Tag [beta] patch"]))
        result = fixture.generate()
        self.assertEqual(result.returncode, 0, result.stderr)
        row = [l for l in fixture.text().splitlines() if l.startswith("| [")][0]
        self.assertIn(r"Tag \[beta\] patch", row)
        self.assertEqual(row_cells(row), 3)
        self.assertEqual(row.count("](#"), 1, row)


class TestHeadingTextAsGitHubRendersIt(unittest.TestCase):
    """Anchors come from the rendered text of a heading, not from its source.

    Every expectation here was taken from a live GitHub page or from the API renderer, not
    invented: MorpheApp/morphe-patches renders <h1>\U0001F9E9 Patches</h1> with href="#-patches".
    """

    def check(self, body):
        return Fixture(make_patches([]), readme=body).check()

    def test_emoji_leaves_its_space_behind(self):
        body = "# \U0001F9E9 Patches\n\n[ok](#-patches)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_the_trimmed_guess_is_wrong(self):
        """Guessing "patches" instead of "-patches" is the mistake this pins down."""
        body = "# \U0001F9E9 Patches\n\n[wrong](#patches)\n"
        self.assertEqual(self.check(body).returncode, 1)

    def test_html_in_a_heading_contributes_no_text(self):
        body = '# <img src="assets/icon.png" width="36" alt=""> Title\n\n[ok](#-title)\n'
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_html_does_not_leak_into_the_anchor(self):
        body = '# <img src="assets/icon.png" alt=""> Title\n\n[bad](#img-srcassetsiconpng-alt-title)\n'
        self.assertEqual(self.check(body).returncode, 1)

    def test_an_image_leaves_no_alt_text(self):
        body = "## ![a picture](x.png) Title\n\n[ok](#-title)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_a_link_leaves_its_label(self):
        body = "## See [the docs](docs.md) here\n\n[ok](#see-the-docs-here)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_source_padding_is_trimmed(self):
        body = "##    Padded heading    \n\n[ok](#padded-heading)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_closing_hashes_are_not_part_of_the_heading(self):
        body = "## Trailing hashes ##\n\n[ok](#trailing-hashes)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_intraword_underscores_are_not_emphasis(self):
        """a__b renders literally, so its underscores stay in the anchor."""
        body = "## a__b intraword\n\n[ok](#a__b-intraword)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_stripped_underscores_would_be_wrong(self):
        body = "## a__b intraword\n\n[wrong](#ab-intraword)\n"
        self.assertEqual(self.check(body).returncode, 1)

    def test_real_underline_emphasis_is_removed(self):
        body = "## __strong__ word\n\n[ok](#strong-word)\n"
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)

    def test_both_readings_of_underscores_are_accepted(self):
        """Offline is the conservative half: it must never report a link GitHub resolves.

        CommonMark decides underscore emphasis with a flanking rule this script cannot
        reproduce exactly, so it accepts every plausible reading and leaves the verdict to
        verify_anchors_online.py. These two are the same heading read both ways.
        """
        for anchor in ("#_it_", "#it"):
            body = f"## \u2192_it_\n\n[x]({anchor})\n"
            self.assertEqual(self.check(body).returncode, 0, f"{anchor}: {self.check(body).stdout}")

    def test_an_extra_reading_does_not_renumber_a_duplicate(self):
        """A reading is an extra target, not an extra heading: -1 must still land on the 2nd."""
        body = ("## _it_\n\n## it\n\n"          # "it" is both a reading and a real heading
                "[first](#it) [second](#it-1)\n")
        self.assertEqual(self.check(body).returncode, 0, self.check(body).stdout)


if __name__ == "__main__":
    unittest.main(verbosity=2)
