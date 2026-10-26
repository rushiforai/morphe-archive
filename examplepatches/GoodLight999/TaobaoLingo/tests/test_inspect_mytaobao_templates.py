"""Synthetic ZIP regression test for My Taobao template version inventory."""
import json
from pathlib import Path
import importlib.util
import tempfile
import unittest
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parents[1]
MODULE = ROOT / "scripts" / "inspect_mytaobao_templates.py"
spec = importlib.util.spec_from_file_location("inspect_mytaobao_templates", MODULE)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class MyTaobaoTemplateProbeTest(unittest.TestCase):
    def test_version_mismatch_and_matching_reference(self):
        with tempfile.TemporaryDirectory() as folder:
            apk = Path(folder) / "fixture.apk"
            live = {
                "api": "mtop.fixture.test",
                "data": {
                    "hierarchy": [[
                        {"containerType": "dinamicx", "name": "header",
                         "version": "45", "url": "https://example.invalid/45"},
                        {"containerType": "dinamicx", "name": "footer",
                         "version": 1, "url": "https://example.invalid/1"},
                        {"containerType": "native", "name": "not-a-template"}
                    ]]
                }
            }
            with ZipFile(apk, "w") as z:
                z.writestr("assets/mytaobao/mtb_2025.json",
                           json.dumps(live))
                z.writestr("assets/template/mytaobao/presetTemplateInfos.json",
                           json.dumps({
                               "header": {"version": 1},
                               "footer": {"version": 1}
                           }))
            result = module.inspect(apk)
            self.assertEqual(result["referenced_dinamicx_templates"], 2)
            self.assertEqual(result["version_mismatches"], 1)
            self.assertFalse(result["matches_studied_apk"])
            self.assertEqual(result["templates"][0]["referenced_version"], "45")
            self.assertEqual(result["templates"][0]["bundled_version"], "1")
            self.assertFalse(result["templates"][1]["version_mismatch"])


if __name__ == "__main__":
    unittest.main()
