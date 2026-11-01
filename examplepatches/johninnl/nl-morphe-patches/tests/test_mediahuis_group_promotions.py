"""Shared callers remove only identified promotion parents with a finite Flow."""
from pathlib import Path
import re
import tempfile
import textwrap
import unittest

from mediahuis_group_promotions import (GROUP_COMPONENTS, PROMO_METHOD,
                                       verify_group_promotions)


COMPONENT_PREFIX = """    invoke-static/range {p2 .. p2}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->morpheIsPublisherPromotionGroup(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;)Z
    move-result v0
    if-eqz v0, :original_components
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;
    move-result-object v0
    invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
    move-result-object v0
    return-object v0
    :original_components
"""
ORIGINAL_COMPONENTS = "    const/4 v0, 0x0\n    return-object v0\n"


class MediahuisGroupPromotionsTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        kotlin = Path(__file__).resolve().parents[1] / "patches/src/main/kotlin/patches/shared/MediahuisGroupPromotions.kt"
        raw = re.search(r'private val GROUP_PROMOTION_CODE = """(.*?)"""', kotlin.read_text(), re.S)[1]
        self.helper = self.write(PROMO_METHOD, 2, textwrap.dedent(raw), static=True)
        self.components = self.write(GROUP_COMPONENTS, 33, COMPONENT_PREFIX + ORIGINAL_COMPONENTS)
        self.originals = [[*GROUP_COMPONENTS, "038d0e5aa511c1ef1265b7b7ac1735e511c8e6016e43a61f5a22ff3fd6f0c8f4"]]

    def write(self, target, count, instructions, static=False):
        path = self.root / "smali" / (target[0] + ".smali")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(f".class public L{target[0]};\n.super Ljava/lang/Object;\n"
                        f".method public {'static ' if static else ''}{target[1]}\n"
                        f"    .locals {count}\n{instructions}.end method\n")
        return path

    def test_specific_marker_or_nyt_and_real_finite_empty_list_flow(self):
        verify_group_promotions(self.root, True, self.originals)

    def test_unselected_control_rejects_new_helper(self):
        with self.assertRaisesRegex(AssertionError, "only with Hide ads"):
            verify_group_promotions(self.root, False, self.originals)

    def test_wrong_high_parameter_register_is_rejected(self):
        self.components.write_text(self.components.read_text().replace("{p2 .. p2}", "{p1 .. p1}"))
        with self.assertRaisesRegex(AssertionError, "Exact group argument"):
            verify_group_promotions(self.root, True, self.originals)

    def test_empty_flow_without_emission_is_rejected(self):
        self.components.write_text(self.components.read_text().replace(
            "invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;",
            "invoke-static {}, Lkotlinx/coroutines/flow/FlowKt;->emptyFlow()Lkotlinx/coroutines/flow/Flow;"))
        with self.assertRaisesRegex(AssertionError, "Unexpected emitted boundary"):
            verify_group_promotions(self.root, True, self.originals)

    def test_broad_unmarked_theme_is_rejected(self):
        self.helper.write_text(self.helper.read_text().replace('"sponsored-content"', '"none"'))
        with self.assertRaisesRegex(AssertionError, "shared promotion decision"):
            verify_group_promotions(self.root, True, self.originals)

    def test_primitive_return_cannot_replace_flow_object(self):
        self.components.write_text(self.components.read_text().replace(
            "    return-object v0\n    :original_components", "    return v0\n    :original_components"))
        with self.assertRaisesRegex(AssertionError, "Typed Flow object"):
            verify_group_promotions(self.root, True, self.originals)

    def test_original_component_builder_tail_must_remain(self):
        self.components.write_text(self.components.read_text().replace(
            ORIGINAL_COMPONENTS, ORIGINAL_COMPONENTS.replace("0x0", "0x1")))
        with self.assertRaisesRegex(AssertionError, "complete original component/header builder"):
            verify_group_promotions(self.root, True, self.originals)


if __name__ == "__main__":
    unittest.main()
