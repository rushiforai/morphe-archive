"""Compile generated notes and read the exact payload back through the JVM."""

import contextlib
import importlib.util
import io
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("release_notes", ROOT / "tools/gen-release-notes.py")
generator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(generator)


class ReleaseNotesGeneratorTest(unittest.TestCase):
    def test_large_payloads_compile_and_round_trip_without_losing_history(self):
        java_home = os.environ.get("JAVA_HOME")
        java = str(Path(java_home) / "bin/java") if java_home else shutil.which("java")
        javac = str(Path(java_home) / "bin/javac") if java_home else shutil.which("javac")
        self.assertIsNotNone(java, "a JDK is required")
        self.assertIsNotNone(javac, "a JDK is required")
        payloads = {
            "one long ASCII line": "a" * 70_000,
            "supplementary characters": "🚀" * 12_000,
            "NUL uses two modified UTF-8 bytes": "a\0" * 25_000,
            "quotes backslashes and control characters": '\"\\\t\b\f\x01\x7f' * 10_000,
        }
        for name, payload in payloads.items():
            with self.subTest(name=name), tempfile.TemporaryDirectory() as folder:
                root = Path(folder)
                changelog = "## Unreleased\nDraft stays out.\n\n## 0.67.0 (date)\n" + payload
                changelog += "\n\n## 0.60.0 (date)\nOldest kept.\n\n## 0.59.0 (date)\nToo old.\n"
                source = root / "ReleaseNotesData.java"
                changelog_path = root / "CHANGELOG.md"
                changelog_path.write_text(changelog, encoding="utf-8")
                generator.CHANGELOG = changelog_path
                generator.OUTPUT = source
                generator.NOTES = root / "notes"
                with contextlib.redirect_stdout(io.StringIO()):
                    generator.main()
                capture = root / "CaptureNotes.java"
                capture.write_text(
                    'import java.nio.file.*; import java.nio.charset.StandardCharsets;\n'
                    'public class CaptureNotes { public static void main(String[] args) throws Exception {\n'
                    'String text = (String) Class.forName("app.morphe.extension.tiktok.settings.preference.ReleaseNotesData")'
                    '.getField("TEXT").get(null);\n'
                    'Files.write(Path.of(args[0]), text.getBytes(StandardCharsets.UTF_8)); } }\n',
                    encoding="utf-8",
                )
                compiled = subprocess.run(
                    [javac, "-encoding", "UTF-8", "-d", folder, str(source), str(capture)],
                    capture_output=True, text=True, encoding="utf-8",
                )
                self.assertEqual(0, compiled.returncode, compiled.stderr[-2000:])
                restored = root / "restored.txt"
                result = subprocess.run(
                    [java, "-cp", folder, "CaptureNotes", str(restored)],
                    capture_output=True, text=True, encoding="utf-8",
                )
                self.assertEqual(0, result.returncode, result.stderr[-2000:])
                self.assertEqual(generator.published(changelog).encode("utf-8"), restored.read_bytes())


class TranslatedNotesGateTest(unittest.TestCase):
    ENGLISH = "## 0.68.0 (date)" + 2 * chr(10) + "* **TikTok:** One." + 2 * chr(10) + "* **TikTok:** Two." + 2 * chr(10) + "## 0.67.0 (date)" + 2 * chr(10) + "* Old." + chr(10)
    SECTION = "## 0.68.0 (date)" + 2 * chr(10) + "* **TikTok:** Eins." + 2 * chr(10) + "* **TikTok:** Zwei." + chr(10)

    def notes(self, files):
        folder = tempfile.TemporaryDirectory()
        self.addCleanup(folder.cleanup)
        root = Path(folder.name)
        for language, text in files.items():
            (root / f"{language}.txt").write_text(text, encoding="utf-8")
        generator.NOTES = root
        return generator.translations(self.ENGLISH)

    def test_a_release_translated_for_every_table_is_embedded_for_each(self):
        found = self.notes({language: self.SECTION for language in generator.LANGUAGES})
        self.assertEqual(set(generator.LANGUAGES), set(found))
        self.assertTrue(found["de"].startswith("## 0.68.0 (date)"))

    def test_a_release_translated_for_one_table_only_fails(self):
        with self.assertRaisesRegex(ValueError, "but not az, es, in, it, pt-rBR, ru, tr"):
            self.notes({"de": self.SECTION})

    def test_a_translation_missing_a_bullet_fails(self):
        files = {language: self.SECTION for language in generator.LANGUAGES}
        files["ru"] = "## 0.68.0 (date)" + 2 * chr(10) + "* **TikTok:** Один." + chr(10)
        with self.assertRaisesRegex(ValueError, "ru.txt has 1 bullets for 0.68.0"):
            self.notes(files)

    def test_a_release_the_changelog_never_published_fails(self):
        files = {language: "## 0.69.0 (date)" + 2 * chr(10) + "* Neu." + chr(10) for language in generator.LANGUAGES}
        with self.assertRaisesRegex(ValueError, "hasn't published"):
            self.notes(files)

    def test_notes_for_a_language_without_a_table_fail(self):
        with self.assertRaisesRegex(ValueError, "fr.txt has no settings table"):
            self.notes({"fr": self.SECTION})


if __name__ == "__main__":
    unittest.main()
