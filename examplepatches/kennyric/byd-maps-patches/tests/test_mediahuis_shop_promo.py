"""Footer commerce uses the shipped source parser and exact CMS/URL markers."""
import json
from pathlib import Path
import re
import shutil
import tempfile
import textwrap
import unittest

from mediahuis_group_promotions import PROMO_METHOD
from mediahuis_shop_promo import (SHOP_METHOD, SRC_EXTRACTOR,
                                 run_shipped_src_extractor, verify_shop_promo)


class MediahuisShopPromotionTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        shared = Path(__file__).resolve().parents[1] / "patches/src/main/kotlin/patches/shared"
        for name, constant, target, count in [
            ("MediahuisShopPromotion.kt", "SHOP_PROMOTION_CODE", SHOP_METHOD, 6),
            ("MediahuisGroupPromotions.kt", "GROUP_PROMOTION_CODE", PROMO_METHOD, 2),
        ]:
            raw = re.search(r'private val ' + constant + r' = """(.*?)"""', (shared / name).read_text(), re.S)[1]
            instructions = textwrap.dedent(raw).replace("${'$'}", "$")
            if target == SHOP_METHOD:
                instructions += "    .catch Ljava/lang/Exception; {:try_start .. :try_end} :parser_error\n"
            self.write(target, count, instructions)
        parser = self.root / "smali" / (SRC_EXTRACTOR[0] + ".smali")
        parser.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(Path(__file__).with_name("fixtures") / "mediahuis_iframe_source.smali", parser)
        self.helper = self.root / "smali" / (SHOP_METHOD[0] + ".smali")
        self.fixtures = json.loads(Path(__file__).with_name("fixtures").joinpath("mediahuis_shop_promo.json").read_text())["cases"]

    def write(self, target, count, instructions):
        path = self.root / "smali" / (target[0] + ".smali")
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("a") as output:
            if path.stat().st_size == 0:
                output.write(f".class public L{target[0]};\n.super Ljava/lang/Object;\n")
            output.write(f".method public static {target[1]}\n    .locals {count}\n{instructions}.end method\n")

    def test_actual_footer_shape_and_negative_editorial_navigation_cases(self):
        verify_shop_promo(self.root, True, self.fixtures)

    def test_unselected_ad_control_rejects_shop_helper(self):
        with self.assertRaisesRegex(AssertionError, "only with Hide ads"):
            verify_shop_promo(self.root, False, self.fixtures)

    def test_publisher_parser_first_src_and_quoting_contract_is_retained(self):
        for html, want in [
            ('<iframe src="target"></iframe>', "target"),
            ('<img src="first"><iframe src="second"></iframe>', "first"),
            ("<iframe src='single'></iframe>", None),
            ('<iframe src=""></iframe>', ""),
        ]:
            with self.subTest(html=html):
                self.assertEqual(run_shipped_src_extractor(self.root, html), want)

    def test_wrong_cms_marker_is_rejected(self):
        self.helper.write_text(self.helper.read_text().replace('"HTML | Webshop feed large"', '"Editorial HTML"'))
        with self.assertRaisesRegex(AssertionError, "footer Shop type/name/source decision"):
            verify_shop_promo(self.root, True, self.fixtures)

    def test_missing_parser_exception_guard_is_rejected(self):
        self.helper.write_text(re.sub(r"^.*\.catch.*\n", "", self.helper.read_text(), flags=re.M))
        with self.assertRaisesRegex(AssertionError, "fail-open"):
            verify_shop_promo(self.root, True, self.fixtures)

    def test_shop_result_must_reach_the_shared_parent_predicate(self):
        text = self.helper.read_text()
        self.assertEqual(text.count("\n:check_nyt\n"), 1)
        self.helper.write_text(text.replace(
            "\n:check_nyt\n", "\n:check_nyt\n    const/4 v0, 0x0\n    return v0\n"))
        with self.assertRaisesRegex(AssertionError, "Footer Shop reaches shared parent"):
            verify_shop_promo(self.root, True, self.fixtures)


if __name__ == "__main__":
    unittest.main()
