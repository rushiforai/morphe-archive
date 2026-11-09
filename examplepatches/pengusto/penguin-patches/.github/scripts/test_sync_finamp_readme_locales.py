import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

HERE = Path(__file__).parent
spec = importlib.util.spec_from_file_location("finamp_locale_sync", HERE / "sync_finamp_readme_locales.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class FinampLocaleSyncTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        (self.root / "docs/readme").mkdir(parents=True)
        (self.root / "patches-list.json").write_text(json.dumps({
            "patches": [{"name": "Finamp Complete"}]}))
        for locale, (old, _) in module.LABELS.items():
            (self.root / "docs/readme" / f"README.{locale}.md").write_text(
                f"before [{old}](../../README.md#{module.OLD_SLUG}) after\n", encoding="utf-8")

    def test_updates_all_locales_and_is_idempotent(self):
        self.assertEqual(module.sync(self.root), 7)
        self.assertEqual(module.sync(self.root), 0)
        for locale, (_, label) in module.LABELS.items():
            text = (self.root / "docs/readme" / f"README.{locale}.md").read_text(encoding="utf-8")
            self.assertEqual(text, f"before [{label}](../../README.md#{module.NEW_SLUG}) after\n")

    def test_unexpected_link_fails_before_any_writes(self):
        bad = self.root / "docs/readme/README.ko.md"
        bad.write_text("unexpected", encoding="utf-8")
        before = (self.root / "docs/readme/README.de.md").read_text(encoding="utf-8")
        with self.assertRaises(ValueError):
            module.sync(self.root)
        self.assertEqual((self.root / "docs/readme/README.de.md").read_text(encoding="utf-8"), before)

    def test_rejects_wrong_release_metadata(self):
        (self.root / "patches-list.json").write_text(json.dumps({"patches": []}))
        with self.assertRaises(ValueError):
            module.sync(self.root)


if __name__ == "__main__":
    unittest.main()
