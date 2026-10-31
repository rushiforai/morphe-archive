"""Every phrase the pages mark for translation is listed, and every language covers the list."""

from pathlib import Path
import json
import re
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import translations

SOURCE = ROOT / "extensions/telegram/src/main/java/app/bitchord/telegram"
LANGUAGES = {
    "es",
    "pt",
    "fr",
    "de",
    "ru",
    "tr",
    "ar",
    "ur",
    "hi",
    "bn",
    "zh",
    "ja",
    "ko",
    "id",
}


def marked_phrases():
    """Literal text passed to Strings.t or Strings.f, with "a" + "b" joined."""
    literal = r'"(?:[^"\\]|\\.)*"'
    joined = rf"{literal}(?:\s*\+\s*{literal})*"
    found = set()
    for path in SOURCE.glob("*.java"):
        text = path.read_text(encoding="utf-8")
        for match in re.finditer(rf"Strings\.[tf]\(\s*({joined})\s*[,)]", text):
            parts = re.findall(literal, match.group(1))
            found.add("".join(json.loads(p) for p in parts))
        # A choice between two phrases: Strings.t(x ? "a" : "b")
        for match in re.finditer(
            rf"Strings\.[tf]\(\s*[\w.()! =<>&|]+\s*\?\s*({joined})\s*:\s*({joined})",
            text,
        ):
            for group in match.groups():
                found.add("".join(json.loads(p) for p in re.findall(literal, group)))
    return found


class TranslationsTest(unittest.TestCase):
    def setUp(self):
        self.source, self.languages = translations.load()

    def test_marked_phrases_are_listed(self):
        missing = sorted(marked_phrases() - set(self.source))
        self.assertEqual([], missing, "add these to translations/source.json")

    def test_every_language_is_complete(self):
        self.assertEqual(LANGUAGES, set(self.languages))
        self.assertEqual([], translations.problems(self.source, self.languages))

    def test_generated_table_is_current(self):
        generated = translations.java(self.source, self.languages)
        on_disk = translations.OUT.read_text(encoding="utf-8")
        # The Java formatter wraps lines and splits long strings into "a" + "b".
        squash = lambda text: re.sub(r"\s+", "", text).replace('"+"', "")
        self.assertEqual(
            squash(generated), squash(on_disk), "run tools/translations.py"
        )


if __name__ == "__main__":
    unittest.main()
