"""Portable ED regression checks; private APKs are not required."""
import re
import tempfile
import unittest
from pathlib import Path

from ad_onboarding import parse, digest
from verify_ad import verify_filters
from verify_ed import OWNER, active_controls, restored
from ad_emitted import evaluate, obj


class EdControlTests(unittest.TestCase):
    def method(self, body):
        return parse(".method public run()Z\n.locals 2\n" + body + "\n.end method", "run()Z")

    def test_tracking_and_consent_include_only_their_audited_dependencies(self):
        flags = active_controls({"Skip consent screens"})
        self.assertTrue(flags["ads"] and flags["tracking"] and flags["consent"])
        self.assertFalse(flags["premium"] or flags["full"] or flags["marketing"])
        flags = active_controls({"Read full articles"})
        self.assertTrue(flags["full"] and flags["marketing"])
        self.assertFalse(flags["ads"] or flags["tracking"] or flags["filters"])

    def test_selected_typed_prefix_preserves_original_cfg(self):
        original = self.method("const/4 v0, 0x1\nif-eqz v0, :done\nconst/4 v0, 0x0\n:done\nreturn v0")
        emitted = self.method("const/4 v0, 0x0\nreturn v0\nconst/4 v0, 0x1\nif-eqz v0, :done\nconst/4 v0, 0x0\n:done\nreturn v0")
        row = {"class": "fixture", "signature": "run()Z", "control": "tracking", "prefix": ["const/4 v0, 0x0", "return v0"], "sites": []}
        self.assertEqual(digest(restored(emitted, row, active_controls({"Disable tracking"}))), digest(original.canonical()))
        self.assertNotEqual(digest(restored(emitted, row, active_controls(set()))), digest(original.canonical()))
        forged = self.method("const/4 v0, 0x1\nreturn v0")
        with self.assertRaises(AssertionError):
            restored(forged, row, active_controls({"Disable tracking"}))

    def test_constructor_branch_must_not_bypass_disabled_flag(self):
        original = self.method("if-eqz p0, :write\nconst/4 v0, 0x1\n:write\niput-boolean v0, p0, Lfixture;->enabled:Z\nreturn v0")
        safe = self.method("if-eqz p0, :write\nconst/4 v0, 0x1\n:write\nconst/4 v0, 0x0\niput-boolean v0, p0, Lfixture;->enabled:Z\nreturn v0")
        bypass = self.method("if-eqz p0, :write\nconst/4 v0, 0x1\nconst/4 v0, 0x0\n:write\niput-boolean v0, p0, Lfixture;->enabled:Z\nreturn v0")
        row = {"class": "fixture", "signature": "run()Z", "control": "ads", "prefix": [], "sites": [{"index": 2, "old": ["iput-boolean v0, p0, Lfixture;->enabled:Z"], "new": ["const/4 v0, 0x0", "iput-boolean v0, p0, Lfixture;->enabled:Z"]}]}
        active = active_controls({"Hide ads"})
        self.assertEqual(digest(restored(safe, row, active)), digest(original.canonical()))
        # A branch directly to iput skips the forced value. Preservation must
        # retain this distinction even though all opcode text is otherwise equal.
        self.assertNotEqual(digest(restored(bypass, row, active)), digest(original.canonical()))

    def fixture(self, ads, premium):
        directory = Path(__file__).parents[1] / "patches/src/main/kotlin/patches/ed"
        source = (directory / "ContentFiltersPatch.kt").read_text() + (directory / "VacancyWidget.kt").read_text()
        methods = []
        model, owner = "Lcom/kubus/module/network/model/", "L" + OWNER + ";"
        for name, result, params, locals_, body in re.findall(r'helper\("(morphe\w+)", "([^"]+)", (listOf\([^\n]+?\)|emptyList\(\)), (\d+), """(.*?)"""\)', source, re.S):
            values = re.findall(r'"([^"]+)"', params)
            body = body.replace("${MODEL}", model).replace("$FILTER", owner).replace("${'$'}", "$")
            values = [s.replace("${MODEL}", model) for s in values]
            result = result.replace("${MODEL}", model)
            methods.append(f".method public static {name}(" + "".join(values) + ")" + result + "\n.locals " + locals_ + "\n" + body + "\n.end method")
        self.assertGreater(len(methods), 5)
        for name, enabled in [("morpheAds", ads), ("morphePremium", premium)]:
            methods.append(f".method public static {name}()Z\n.locals 1\nconst/4 v0, 0x{int(enabled):x}\nreturn v0\n.end method")
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        root = Path(temp.name)
        path = root / "smali" / (OWNER + ".smali")
        path.parent.mkdir(parents=True)
        path.write_text(".class public " + owner + "\n.super Ljava/lang/Object;\n" + "\n".join(methods))
        return root

    def test_ed_emitted_dto_policy_for_every_independent_flag_combination(self):
        for ads, premium in [(False, False), (True, False), (False, True), (True, True)]:
            with self.subTest(ads=ads, premium=premium):
                verify_filters(self.fixture(ads, premium), ads, premium)

    def test_vacancy_widget_is_removed_without_removing_editorial_embeds(self):
        widget = 'https://mobileapi.ed.nl/static/widgets/nationalevacaturebank-blue.html'
        commercial = [
            f'<iframe title="Nationale Vacaturebank" src="{widget}"></iframe>',
            f"<IFRAME SRC = '{widget}?region=eindhoven&amp;theme=blue'></IFRAME>",
        ]
        editorial = [
            None, '', '<p>Editorial article text</p>',
            f'<!-- Editorial example > <iframe src="{widget}"></iframe> -->',

            f'<iframe src={widget}?region=eindhoven srcdoc=Editorial></iframe>',
            f'<!DOCTYPE html PUBLIC "<iframe src=\'{widget}\'>"><p>Editorial</p>',
            f'<![CDATA[<iframe src="{widget}"></iframe>]]>',
            f'<iframe src\xa0="{widget}"></iframe>',

            f'<iframe src="https://www.youtube.com/embed/editorial"><iframe src="{widget}"></iframe></iframe>',
            f'<noscript><iframe src="{widget}"></iframe></noscript>',
            f'<xmp><iframe src="{widget}"></iframe></xmp>',
            f'<plaintext>Example <iframe src="{widget}"></iframe>',

            f'<iframe title=" src=\'{widget}\'" src="https://www.youtube.com/embed/editorial"></iframe>',
            f'<script>const example = \'<iframe src="{widget}"></iframe>\';</script><iframe src="https://www.youtube.com/embed/editorial"></iframe>',
            f'<div title=\'<iframe src="{widget}"></iframe>\'>Editorial</div>',
            f'<textarea><iframe src="{widget}"></iframe></textarea>',
            f'<iframe src="https://www.youtube.com/embed/editorial" src="{widget}"></iframe>',
            f'<iframe src="{widget}" srcdoc="Editorial inline content"></iframe>',

            '<iframe src="https://www.youtube.com/embed/editorial"></iframe>',
            f'<a href="{widget}">An editorial link</a>',
            f'<!-- <iframe src="{widget}"></iframe> -->',
            f'<iframe data-src="{widget}"></iframe>',
            f'<iframe src="{widget}.editorial"></iframe>',
            '<iframe src="https://mobileapi.ed.nl.evil.test/static/widgets/nationalevacaturebank-blue.html"></iframe>',
            '<iframe src="https://mobileapi.ed.nl/static/widgets/editorial.html"></iframe>',
        ]
        for ads, premium in [(False, False), (True, False), (False, True), (True, True)]:
            root = self.fixture(ads, premium)
            for html in commercial + editorial:
                for field in ['d', 'e']:
                    with self.subTest(ads=ads, premium=premium, html=html, field=field):
                        item = obj('com/kubus/module/network/model/HtmlEmbedDataTeaser', d=None, e=None)
                        item[field] = html
                        result = evaluate(root, 'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;', [item])
                        if ads and html in commercial:
                            self.assertIn(result, (None, 0))
                        else:
                            self.assertIs(result, item)

    def test_loading_listening_cards_are_hidden_and_real_history_enters_original_renderer(self):
        source_path = Path(__file__).parents[1] / "patches/src/main/kotlin/patches/ed/ListeningCarouselPatch.kt"
        self.assertTrue(source_path.is_file(), "ED needs a guard for its clickable detailepisode_1 loading cards")
        source = source_path.read_text()
        block = re.search(r'renderer\.addInstructionsWithLabels\(0, """(.*?)"""', source, re.S)
        self.assertIsNotNone(block)
        self.assertIn('ExternalLabel("listening_content", renderer.getInstruction(0))', source)
        guard = block[1] + "\n:listening_content\n"
        signature = "g(Lix;IZLxe7;ZLyg3;I)V"
        original = parse(".method public static final " + signature + "\n.locals 20\nreturn-void\n.end method", signature)
        emitted = parse(".method public static final " + signature + "\n.locals 20\n" + guard + "\nreturn-void\n.end method", signature)
        row = {"class": "s99", "signature": signature, "control": "listening", "prefix": ["if-eqz p4, @original", "return-void"], "sites": []}
        self.assertEqual(digest(restored(emitted, row, {"listening": True})), digest(original.canonical()))
        self.assertEqual(emitted.instructions[:2], ["if-eqz p4, :listening_content", "return-void"])
        self.assertEqual(emitted.labels[":listening_content"], 2)
        self.assertTrue(active_controls({"Hide empty listening carousel"})["listening"])
        self.assertFalse(active_controls({"Hide ads"})["listening"])

    def test_automatic_section_marketing_follows_annoyance_controls(self):
        for selection, expected in [
            (set(), False), ({'Hide ads'}, False), ({'Disable tracking'}, False),
            ({'Skip consent screens'}, True), ({'Hide Premium banner'}, True),
            ({'Read full articles'}, True),
        ]:
            with self.subTest(selection=selection):
                self.assertEqual(active_controls(selection).get('automaticMarketing'), expected)


if __name__ == "__main__":
    unittest.main()
