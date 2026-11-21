"""Regression tests for the deliberately narrow, fail-closed filter converter."""
import gzip
import hashlib
import json
from pathlib import Path
import unittest
from unittest.mock import patch
from scripts import update_adblock_filters as f


class AdblockFilterTests(unittest.TestCase):
    def test_canonical_gzip_and_safe_rule_selection(self):
        source = "\n".join((
            "||ads.example.com^",
            "||ads.example.com^",  # dedupe
            "||billing.stripe.com^",  # protected
            "||news.example.com/path^",  # path excluded
            "||restricted.example.com^$third-party",  # accepted third-party-only
            "||thirdpartyanother.example.com^$third-party,script",  # excluded combo
            "||script.example.com^$script",  # excluded
            "||domain.example.com^$domain=example.org",  # excluded
            "@@||cdn.adserver.com^$third-party",  # exception wins
            "||thirdparty.example.com^$third-party",  # accepted
            "||*.invalid.com^",  # wildcard excluded
            "@@||ads.example.com^",  # exception always wins
            "||cdn.adserver.com^",
            "##.adsbygoogle",
            "example.com##.advertisement",  # domain-scoped excluded
            "##.unsafe-custom-selector",  # unapproved excluded
        ))
        with patch.object(f, "MIN_HOSTS", 1):
            document, gz = f.convert(
                [source], {".adsbygoogle"}, {"stripe.com"}, "2026-11-20T00:00:00Z"
            )
        self.assertEqual(document["hosts"], ["restricted.example.com", "thirdparty.example.com"])
        self.assertEqual(document["exceptions"], ["ads.example.com", "cdn.adserver.com"])
        self.assertEqual(document["css"], ".adsbygoogle{display:none!important}")
        self.assertEqual(json.loads(gzip.decompress(gz)), document)
        expected = hashlib.sha256(
            f.canonical(document["version"], document["generated_at"],
                        set(document["hosts"]), set(document["exceptions"]),
                        document["css"]).encode("utf-8")
        ).hexdigest()
        self.assertEqual(document["sha256"], expected)
        self.assertLessEqual(len(gz), 2 * 1024 * 1024)

    def test_snapshot_merges_embedded_seed_after_validation(self):
        helper = (Path(__file__).resolve().parents[1] /
                  'extensions/adblock/src/main/java/dev/rikunode/adblock/AdBlockHelper.java').read_text(encoding='utf-8')
        self.assertIn('hosts.addAll(Arrays.asList(SEED_HOSTS));', helper)
        self.assertIn('hosts.removeAll(snapshot.exceptions);', helper)
        self.assertIn('SEED_CSS + "\\n" + snapshot.css', helper)
        self.assertIn('loaded = withSeed(loaded);', helper)
        self.assertIn('active = withSeed(candidate);', helper)

    def test_reviewed_anti_adblock_inputs_dedupe_and_css(self):
        root = Path(__file__).resolve().parents[1] / "filter-lists"
        hosts = f.read_list(root / "anti-adblock-hosts.txt")
        selectors = f.read_list(root / "anti-adblock-css.txt")
        self.assertEqual(hosts, {"html-load.com", "css-load.com", "content-loader.com"})
        self.assertEqual(selectors, {".ad-blocker-warning", ".main_adbalert",
                                     ".pane-emediate"})
        source = "\n".join(
            ["||html-load.com^", "||html-load.com^"] +
            [f"||{h}^" for h in hosts] +
            [f"##{s}" for s in selectors]
        )
        with patch.object(f, "MIN_HOSTS", 1):
            doc, compressed = f.convert([source], selectors, set(),
                                        "2026-11-20T00:00:00Z")
        self.assertEqual(doc["hosts"], sorted(hosts))
        self.assertEqual(doc["version"], 1)
        self.assertEqual(len(doc["css"].split("display:none!important}")), 4)
        self.assertEqual(json.loads(gzip.decompress(compressed)), doc)

    def test_abnormal_host_count_refuses_publication(self):
        with self.assertRaisesRegex(ValueError, "unsafe host count"):
            f.convert(["||ads.example.com^"], set(), set(), "2026-11-20T00:00:00Z")

    def test_host_boundary(self):
        self.assertTrue(f.protected("login.stripe.com", {"stripe.com"}))
        self.assertFalse(f.protected("fake-stripe.com", {"stripe.com"}))
        self.assertFalse(f.HOST.fullmatch("bad..example.com"))
        self.assertIsNone(f.DOMAIN_RULE.fullmatch("||example.com^$popup"))
        self.assertIsNotNone(f.DOMAIN_RULE.fullmatch("||example.com^$third-party"))
        self.assertIsNotNone(f.DOMAIN_RULE.fullmatch("@@||example.com^$third-party"))
        self.assertIsNone(f.DOMAIN_RULE.fullmatch("||example.com^$third-party,script"))
        self.assertIsNone(f.DOMAIN_RULE.fullmatch("||example.com^$domain=example.org"))


if __name__ == "__main__":
    unittest.main()
