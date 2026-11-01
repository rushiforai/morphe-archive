"""The intended NYT bytecode must reject unrelated HTML and fail open on parsing."""
import json
from pathlib import Path
import re
import tempfile
import textwrap
import unittest

from mediahuis_nyt_promo import NYT_METHOD, verify_nyt_promo
from mediahuis_sponsored_groups import GROUP_GATE
from test_mediahuis_sponsored_groups import ORIGINAL, PREFIX


class MediahuisNytPromotionTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        kotlin = Path(__file__).resolve().parents[1] / "patches/src/main/kotlin/patches/shared/MediahuisNytPromotion.kt"
        raw = re.search(r'private val NYT_PROMOTION_CODE = """(.*?)"""', kotlin.read_text(), re.S)[1]
        instructions = textwrap.dedent(raw).replace("${'$'}", "$")
        self.helper = self.write(NYT_METHOD, 6, instructions +
                                 "    .catch Ljava/lang/Exception; {:try_start .. :try_end} :parser_error\n")
        self.gate = self.write(GROUP_GATE, 2, PREFIX + ORIGINAL)
        self.fixtures = json.loads(Path(__file__).with_name("fixtures").joinpath(
            "mediahuis_nyt_promo.json").read_text())["cases"]

    def write(self, target, count, instructions):
        path = self.root / "smali" / (target[0] + ".smali")
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("a") as output:
            if path.stat().st_size == 0:
                output.write(f".class public L{target[0]};\n.super Ljava/lang/Object;\n")
            output.write(f".method public static {target[1]}\n    .locals {count}\n"
                         f"{instructions}.end method\n")
        return path

    def test_precise_types_anchor_host_path_and_parser_failure(self):
        verify_nyt_promo(self.root, True, self.fixtures)

    def test_unselected_ad_control_rejects_injected_helper(self):
        with self.assertRaisesRegex(AssertionError, "only with Hide ads"):
            verify_nyt_promo(self.root, False, self.fixtures)

    def test_missing_exception_guard_is_rejected(self):
        self.helper.write_text(re.sub(r"^.*\.catch.*\n", "", self.helper.read_text(), flags=re.M))
        with self.assertRaisesRegex(AssertionError, "fail-open"):
            verify_nyt_promo(self.root, True, self.fixtures)

    def test_wrong_target_path_is_rejected(self):
        self.helper.write_text(self.helper.read_text().replace('"/thenewyorktimes"', '"/editorial"'))
        with self.assertRaisesRegex(AssertionError, "NYT URL/type decision"):
            verify_nyt_promo(self.root, True, self.fixtures)

    def test_helper_decision_must_reach_parent_visibility(self):
        self.gate.write_text(self.gate.read_text().replace(
            "    move-result v0\n    if-eqz v0, :sponsored_theme", "    move-result v0\n    goto :sponsored_theme", 1))
        with self.assertRaisesRegex(AssertionError, "whole-parent gate"):
            verify_nyt_promo(self.root, True, self.fixtures)


if __name__ == "__main__":
    unittest.main()
