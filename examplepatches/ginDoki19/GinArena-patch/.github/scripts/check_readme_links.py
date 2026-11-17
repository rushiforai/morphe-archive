#!/usr/bin/env python3
"""Fails if README.md contains a link to an anchor that does not exist.

Why this exists
---------------
The patches table links every row to a heading further down the README. Two separate bugs
shipped because nothing checked that those links resolve:

  * `generate_patches_readme.py` built anchors by collapsing punctuation runs into one
    hyphen, while GitHub deletes punctuation and keeps the spaces; any patch name
    containing "&" or "," produced a dead link.
  * Three patch names were written as bold paragraphs instead of headings, so there was
    no target to link to at all.

Both were invisible until someone clicked. This script is the tripwire.

Usage
-----
    python3 .github/scripts/check_readme_links.py [README.md]

Exit code 0 = every link resolves. Exit code 1 = at least one dead link.

Notes
-----
* GitHub DROPS characters it does not allow (alphanumeric, space, "-", "_") and turns each
  remaining space into a hyphen. "Remove ads & bloat" therefore becomes
  "remove-ads--bloat" - two hyphens, not one.
* A hand-written `<a id="...">` or `<a name="...">` is a valid target with no heading.
* Repeated heading text gets "-1", "-2", ... appended in document order.
"""

import re
import sys
import collections
import unicodedata


# Unicode general categories github-slugger 2.0.0 keeps: letters, combining marks and
# numbers except the "No" group (superscripts, vulgar fractions). Everything else is deleted.
ANCHOR_CATEGORIES = frozenset({
    "Lu", "Ll", "Lt", "Lm", "Lo",   # letters
    "Mn", "Mc", "Me",               # combining marks
    "Nd", "Nl",                     # decimal and letter numbers
})


def github_anchor(text):
    """Reproduce github-slugger's heading anchor.

    Called with the heading's *rendered text*, exactly as GitHub hands it to the library.
    The one whitespace rule is important and was measured, not assumed: GitHub does not trim
    this text. GitHub's own page for MorpheApp/morphe-patches renders <h1>🧩 Patches</h1>
    with href="#-patches" - the emoji is deleted, the space it left behind becomes a hyphen,
    and the result starts with one. Trimming here would produce "patches" and quietly
    disagree with the page. Trimming the *source line* instead (see collect_targets) is what
    CommonMark does, and it is where leading and trailing spaces really go away.

    Fidelity: checked against github-slugger 2.0.0 on all 63,461 single-codepoint cases in
    the BMP, and on 4,026 random strings. 156 of the single-codepoint cases differ, and they
    are all characters the library's hand-generated character table does not know about yet
    (Arabic Extended-B, U+0870 onward, is the largest group). None of the 156 occurs anywhere
    in this README or in patches-list.json, so no anchor this repo can produce is affected.
    The category test is what keeps combining marks, so an accent typed as "e" + U+0301
    slugs the same as the precomposed letter.

    Known limit: setext headings (a line of "===" or "---" under the text) are not treated
    as headings here. This README writes every heading with "#", and has since it was made.
    """
    kept = [
        c for c in text.lower()
        if c in " -_" or unicodedata.category(c) in ANCHOR_CATEGORIES
    ]
    return "".join(kept).replace(" ", "-")


# Underscore emphasis is the one place where reading markdown source and asking GitHub give
# different answers often enough to matter. CommonMark decides it with a flanking rule that
# looks at punctuation on both sides, and a regular expression gets it wrong in both
# directions - "_it_" is literal after a symbol but emphasis after a bracket.
UNDERSCORE_EMPHASIS = re.compile(r"(?<!\w)_{1,2}(?=\S)(.+?)(?<=\S)_{1,2}(?!\w)")


def heading_text(raw, strip_underscores=True):
    """Reduce a heading's source to the text GitHub renders inside the tag.

    Inline HTML contributes no text - an <img> inside a heading leaves only the space next
    to it - while a link contributes its label and an image contributes nothing at all.
    """
    text = re.sub(r"<[^>]+>", "", raw)
    text = re.sub(r"!\[[^\]]*\]\([^)]*\)", "", text)          # images leave no text
    text = re.sub(r"\[([^\]]*)\]\([^)]*\)", r"\1", text)     # links leave their label
    # Asterisks need no handling at all - github-slugger deletes them either way.
    if strip_underscores:
        text = UNDERSCORE_EMPHASIS.sub(r"\1", text)
    return text.replace("`", "")


def strip_blocks(markdown):
    """Remove the block-level regions that cannot contain live Markdown.

    An HTML comment and a fenced code block are both inert: a "#" line inside either is not
    a heading, and a link inside either is not a link. Removing them here keeps the two
    halves of this script agreeing about what is real.

    This is deliberately NOT the same as strippable(): inline code is left alone here,
    because a heading such as "## The `foo` flag" really does slug as the-foo-flag, and
    blanking the span first would turn it into the--flag.
    """
    out = re.sub(r"<!--.*?-->", "", markdown, flags=re.S)
    out = re.sub(r"^```.*?^```", "", out, flags=re.S | re.M)
    out = re.sub(r"^~~~.*?^~~~", "", out, flags=re.S | re.M)
    return out


def collect_targets(markdown):
    targets = set()
    markdown = strip_blocks(markdown)

    # explicit <a id="x"> / <a name="x">
    for m in re.finditer(r'<a\s+(?:id|name)=["\']([^"\']+)["\']', markdown, re.I):
        targets.add(m.group(1))

    # headings, with GitHub's -N disambiguation for repeats
    seen = collections.Counter()
    # CommonMark trims spaces and tabs around an ATX heading's content; nothing inside it.
    for m in re.finditer(r"^#{1,6}[ \t]+(.*?)[ \t]*$", markdown, re.M):
        raw = re.sub(r"(?:^|[ \t]+)#+[ \t]*$", "", m.group(1))   # an optional closing hashes

        slug = github_anchor(heading_text(raw))
        targets.add(slug if not seen[slug] else f"{slug}-{seen[slug]}")
        seen[slug] += 1

        # Other readings of the same heading, kept as extra targets rather than as further
        # headings: an extra target must not consume a "-1"/"-2" number, or it would renumber
        # the real ones.
        #
        # This makes the offline check the conservative half of the pair. Where its reading of
        # a heading might be wrong, it accepts every plausible answer, so it cannot report a
        # link dead that GitHub resolves. The price is that it can miss a link that is dead -
        # which is what verify_anchors_online.py exists for, and why both run.
        #
        # The two extra readings are the two ways underscore emphasis can be decided:
        #   * underscores left alone entirely, and
        #   * emphasis resolved first, on the raw line, then links and images substituted.
        # The order matters: "_it_[label](x)" is emphasis (the clue after the closing
        # underscore is a bracket) but "_it_label" is not, and this script literally relabels
        # the link before it looks.
        if "_" in raw:
            for other_text in (
                heading_text(raw, strip_underscores=False),
                heading_text(UNDERSCORE_EMPHASIS.sub(r"\1", raw), strip_underscores=False),
            ):
                other = github_anchor(other_text)
                if other != slug:
                    targets.add(other)

    return targets


def strippable(markdown):
    """Remove content GitHub renders as text rather than links.

    Without this the checker reports false positives, which is worse than useless in CI:
    a legitimate PR gets blocked by a link that is inside a code fence, an inline code span
    or an HTML comment. All three were seen on 2026-11-14.
    """
    out = strip_blocks(markdown)
    out = re.sub(r"`[^`\n]*`", "", out)                             # inline code
    return out


# [text](#anchor) or [text](#anchor "title"); the leading ! excludes images. The anchor may
# be empty: "[](#)" links to the top of the page, which is not where the row meant to go, and
# it used to be skipped entirely because the group needed at least one character.
#
# The label may contain escaped brackets - a patch called "Tag [beta] patch" is written
# "[Tag \[beta\] patch](#tag-beta-patch)" - so the label pattern allows an escaped character
# and otherwise refuses to cross a bracket. Before this, such a row was skipped without a
# word: the checker reported 30 links where GitHub saw 31.
LINK_RE = re.compile(r'(?<!!)\[((?:[^\[\]\\]|\\.)*)\]\(\s*#([^\s")]*)(?:\s+"[^"]*")?\s*\)')


def main(argv):
    path = argv[1] if len(argv) > 1 else "README.md"
    markdown = open(path, encoding="utf-8").read()
    targets = collect_targets(markdown)

    links = LINK_RE.findall(strippable(markdown))
    empty = [t.strip() for t, a in links if not a]
    dead = sorted({(t.strip(), a) for t, a in links if a and a not in targets})

    if dead or empty:
        for text, anchor in dead:
            print(f"DEAD LINK: [{text}](#{anchor}) - no heading or <a id> produces that anchor")
        for text in empty:
            print(f"EMPTY ANCHOR: [{text}](#) - links to the top of the page, not to a section")
        rows = sum(1 for _, a in links if not a or a not in targets)
        bad = len(dead) + len(empty)
        print(f"\n{bad} bad anchor(s), covering {rows} link(s), in {path}.")
        print("Fix generate_patches_readme.py's anchor() or add the missing heading.")
        return 1

    shared = {a: n for a, n in collections.Counter(a for _, a in links).items() if n > 1}
    print(f"OK: all {len(links)} in-page link(s) in {path} resolve ({len(targets)} anchors checked).")
    if shared:
        print("Shared anchors (several rows deliberately documenting one section):")
        for a, n in sorted(shared.items(), key=lambda x: -x[1]):
            print(f"  {n}x #{a}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
