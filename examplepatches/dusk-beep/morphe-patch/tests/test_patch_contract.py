from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
PATCH = ROOT / "patches/src/main/kotlin/app/focusguard/patches/firefox/ProtectLeechBlockPatch.kt"


class PatchContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = PATCH.read_text(encoding="utf-8")

    def test_patch_is_scoped_to_firefox_160(self):
        self.assertIn('compatibleWith("org.mozilla.firefox"("160.0"))', self.source)
        self.assertIn('name = "Protect LeechBlock NG"', self.source)

    def test_exact_gecko_engine_methods_are_fingerprinted(self):
        self.assertIn('name = "disableWebExtension"', self.source)
        self.assertIn('name = "uninstallWebExtension"', self.source)
        self.assertEqual(self.source.count('definingClass = "Lmozilla/components/browser/engine/gecko/GeckoEngine;"'), 2)

    def test_only_the_leechblock_extension_id_is_matched(self):
        self.assertEqual(self.source.count('"leechblockng@proginosko.com"'), 2)

    def test_disable_failure_callback_uses_function1(self):
        self.assertIn('invoke-interface {p4, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;', self.source)

    def test_uninstall_failure_callback_receives_id_then_throwable(self):
        self.assertIn('iget-object v1, p1, Lmozilla/components/concept/engine/webextension/WebExtension;->id:Ljava/lang/String;', self.source)
        self.assertIn('invoke-interface {p3, v1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;', self.source)

    def test_patch_does_not_change_register_count_or_other_manager_methods(self):
        self.assertNotIn("registerCount", self.source)
        self.assertEqual(self.source.count(".addInstructions("), 2)
        self.assertNotIn("enableWebExtension", self.source)
        self.assertNotIn("updateWebExtension", self.source)

    def test_injected_smali_has_valid_local_and_parameter_registers(self):
        import re

        blocks = re.findall(
            r'\.addInstructions\(\s*0,\s*"""(.*?)"""\.trimIndent\(\),\s*\)',
            self.source,
            re.S,
        )
        self.assertEqual(len(blocks), 2, "expected two injected Smali blocks")
        limits = ({"locals": 1, "parameters": 5}, {"locals": 1, "parameters": 4})
        for block, layout in zip(blocks, limits):
            labels = re.findall(r"^\s*:([A-Za-z0-9_]+)\s*$", block, re.M)
            branches = re.findall(r"\bif-eqz\s+v\d+,\s*:([A-Za-z0-9_]+)", block)
            self.assertEqual(len(labels), 1)
            self.assertEqual(branches, labels)
            for register in re.findall(r"\bv(\d+)\b", block):
                self.assertLess(int(register), layout["locals"] + layout["parameters"])
            for register in re.findall(r"\bp(\d+)\b", block):
                self.assertLess(int(register), layout["parameters"])
            self.assertIn("return-void", block)

    def test_protected_paths_report_failure_instead_of_silently_returning(self):
        self.assertEqual(self.source.count("Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V"), 2)
        self.assertIn("Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", self.source)
        self.assertIn("Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", self.source)


if __name__ == "__main__":
    unittest.main()
