"""Sponsored CMS parents disappear without changing ordinary group decisions."""
import json
from pathlib import Path
import tempfile
import unittest

from mediahuis_emitted import code, locals_count
from mediahuis_sponsored_groups import (GROUP, GROUP_GATE, HOME_GROUPS, OPTIONS,
                                       run_group_gate, verify_sponsored_groups)


PREFIX = """    invoke-static {p0}, LOWNER;->morpheIsNytPromotionGroup(LOWNER;)Z
    move-result v0
    if-eqz v0, :sponsored_theme
    const/4 v0, 0x1
    return v0
    :sponsored_theme
    invoke-virtual {p0}, LOWNER;->getGroupOptions()LOPTIONS;
    move-result-object v0
    if-eqz v0, :original_group
    invoke-virtual {v0}, LOPTIONS;->getGroupTheme()Ljava/lang/String;
    move-result-object v0
    const-string v1, "sponsored-content"
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :original_group
    const/4 v0, 0x1
    return v0
    :original_group
""".replace("OWNER", GROUP).replace("OPTIONS", OPTIONS)
ORIGINAL = """    invoke-virtual {p0}, LOWNER;->getGroupOptions()LOPTIONS;
    move-result-object v0
    if-eqz v0, :no_options
    invoke-virtual {v0}, LOPTIONS;->getType()LSTORY;
    move-result-object v0
    goto :check_type
    :no_options
    const/4 v0, 0x0
    :check_type
    sget-object v1, LSTORY;->Hide:LSTORY;
    if-eq v0, v1, :hidden
    invoke-virtual {p0}, LOWNER;->isEmpty()Z
    move-result p0
    if-eqz p0, :visible
    goto :hidden
    :visible
    const/4 p0, 0x0
    return p0
    :hidden
    const/4 p0, 0x1
    return p0
""".replace("OWNER", GROUP).replace("OPTIONS", OPTIONS).replace(
    "STORY", OPTIONS.rsplit("/", 1)[0] + "/StoryBlockType")


class MediahuisSponsoredGroupsTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.gate = self.write(GROUP_GATE, 2, ORIGINAL, static=True)
        self.home = self.write(HOME_GROUPS, 1,
                               "    const/4 v0, 0x0\n    return-object v0\n")
        self.originals = [
            [*GROUP_GATE, "ac7bbefad89d096188716a99baea867b418c419c6fbf306771eacdc8819dcf76"],
            [*HOME_GROUPS, "038d0e5aa511c1ef1265b7b7ac1735e511c8e6016e43a61f5a22ff3fd6f0c8f4"],
        ]

    def write(self, target, local_count, instructions, static=False):
        path = self.root / "smali" / (target[0] + ".smali")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(f".class public L{target[0]};\n.super Ljava/lang/Object;\n"
                        f".method public {'static ' if static else ''}{target[1]}\n"
                        f"    .locals {local_count}\n{instructions}.end method\n")
        return path

    def enable(self, prefix=PREFIX):
        self.write(GROUP_GATE, 2, prefix + ORIGINAL, static=True)

    def test_original_visible_sponsored_parent_is_red_when_ads_enabled(self):
        verify_sponsored_groups(self.root, False, self.originals)
        with self.assertRaisesRegex(AssertionError, "sponsored group decision"):
            verify_sponsored_groups(self.root, True, self.originals)

    def test_exact_theme_with_original_hide_empty_and_null_paths(self):
        self.enable()
        verify_sponsored_groups(self.root, True, self.originals)

    def test_actual_sanitized_cms_shapes_remove_parent_not_individual_children(self):
        self.enable()
        lines = code(self.root, *GROUP_GATE)
        parameter_start = locals_count(self.root, *GROUP_GATE)
        fixtures = json.loads(Path(__file__).with_name("fixtures").joinpath(
            "mediahuis_sponsored_groups.json").read_text())
        for case in fixtures["cases"]:
            options = {row["key"]: row["value"] for row in case["group"]["groupOptions"]}
            with self.subTest(case=case["case"]):
                self.assertEqual(run_group_gate(lines, parameter_start,
                                                options.get("groupTheme")),
                                 case["expected_hidden"])

    def test_broad_theme_match_is_rejected(self):
        self.enable(PREFIX.replace('"sponsored-content"', '"none"'))
        with self.assertRaisesRegex(AssertionError, "sponsored group decision"):
            verify_sponsored_groups(self.root, True, self.originals)

    def test_matching_prefix_cannot_hide_original_tail_change(self):
        self.enable()
        self.gate.write_text(self.gate.read_text() + "\n")
        # A no-op in the retained tail is still an unauthorized bytecode change.
        self.gate.write_text(self.gate.read_text().replace(
            "    :visible\n", "    :visible\n    nop\n"))
        with self.assertRaises(AssertionError):
            verify_sponsored_groups(self.root, True, self.originals)

    def test_parent_builder_change_is_rejected(self):
        self.enable()
        self.home.write_text(self.home.read_text().replace("0x0", "0x1"))
        with self.assertRaisesRegex(AssertionError, "parent filtering"):
            verify_sponsored_groups(self.root, True, self.originals)


if __name__ == "__main__":
    unittest.main()
