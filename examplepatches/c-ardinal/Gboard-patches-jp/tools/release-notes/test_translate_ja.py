import json
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import translate_ja

DESCRIPTION = (
    "### ✨ New Features\n\n* **Gboard:** add A.\n\n### 🐛 Bug Fixes\n\n* **Gboard:** fix B.\n\n"
    "### ✨ 新功能\n\n* **Gboard:** 新增 A。\n\n### 🐛 修復\n\n* **Gboard:** 修復 B。"
)


class EnglishPartTest(unittest.TestCase):
    def test_drops_the_chinese_block(self):
        self.assertEqual(
            translate_ja.english_part(DESCRIPTION),
            "### ✨ New Features\n\n* **Gboard:** add A.\n\n### 🐛 Bug Fixes\n\n* **Gboard:** fix B.",
        )

    def test_chinese_fixes_only(self):
        text = "### 🐛 Bug Fixes\n\n* fix.\n\n### 🐛 修復\n\n* 修復。"
        self.assertEqual(translate_ja.english_part(text), "### 🐛 Bug Fixes\n\n* fix.")

    def test_without_chinese_returns_everything(self):
        self.assertEqual(translate_ja.english_part("### ✨ New Features\n\n* a.\n"), "### ✨ New Features\n\n* a.")


class MainTest(unittest.TestCase):
    def run_main(self, env):
        with tempfile.TemporaryDirectory() as tmp:
            bundle = Path(tmp, "bundle.json")
            out = Path(tmp, "notes.md")
            bundle.write_text(json.dumps({"description": DESCRIPTION}), "utf-8")
            with mock.patch.dict("os.environ", env, clear=True), \
                    mock.patch.object(translate_ja, "translate", return_value="### ✨ 新機能\n\n* 訳") as tr:
                code = translate_ja.main(["--bundle", str(bundle), "--out", str(out)])
            return code, (out.read_text("utf-8") if out.exists() else None), tr

    def test_writes_only_the_translation(self):
        code, notes, tr = self.run_main({"ANTHROPIC_API_KEY": "x"})
        self.assertEqual(code, 0)
        self.assertEqual(notes, "### ✨ 新機能\n\n* 訳\n")
        tr.assert_called_once_with(translate_ja.english_part(DESCRIPTION))

    def test_fails_without_api_key(self):
        code, notes, tr = self.run_main({})
        self.assertEqual(code, 1)
        self.assertIsNone(notes)
        tr.assert_not_called()


if __name__ == "__main__":
    unittest.main()
