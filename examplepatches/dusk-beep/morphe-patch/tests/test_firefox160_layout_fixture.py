import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
FIXTURE = ROOT / "tests/fixtures/firefox-160.0-layout.json"


class Firefox160LayoutFixtureTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.layout = json.loads(FIXTURE.read_text(encoding="utf-8"))

    def test_target_apk_metadata(self):
        self.assertEqual(self.layout["package"], "org.mozilla.firefox")
        self.assertEqual(self.layout["versionName"], "160.0")
        self.assertEqual(self.layout["versionCode"], 2016194410)
        self.assertEqual(set(self.layout["dex_files"]), {"classes.dex", "classes2.dex", "classes3.dex"})

    def test_gecko_engine_method_register_layouts(self):
        targets = self.layout["targets"]
        self.assertEqual(targets["disableWebExtension"]["registers"], 6)
        self.assertEqual(targets["disableWebExtension"]["incoming_registers"], 5)
        self.assertEqual(targets["uninstallWebExtension"]["registers"], 5)
        self.assertEqual(targets["uninstallWebExtension"]["incoming_registers"], 4)

    def test_uninstall_error_contract_is_id_string_then_throwable(self):
        contract = self.layout["targets"]["uninstallWebExtension"]["failure_callback_parameter"]
        self.assertEqual(contract, "p3: Function2.invoke(extensionId: String, error: Throwable)")
        adapter = self.layout["targets"]["uninstall_error_adapter"]
        self.assertIn("->id:Ljava/lang/String;", adapter["reads"])
        self.assertEqual(adapter["callback_registers"], [1, 0, 2])
        self.assertEqual(adapter["callback_argument_order"], ["receiver", "extension_id", "throwable"])
        self.assertEqual(adapter["callback_interface"], "Lkotlin/jvm/functions/Function2;")
        self.assertEqual(
            self.layout["targets"]["disable_error_adapter"]["callback_interface"],
            "Lkotlin/jvm/functions/Function1;",
        )


if __name__ == "__main__":
    unittest.main()
