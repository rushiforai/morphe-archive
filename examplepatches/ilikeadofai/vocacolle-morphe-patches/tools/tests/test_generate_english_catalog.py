import importlib.util
import pathlib
import tempfile
import unittest


SCRIPT = pathlib.Path(__file__).parents[1] / "generate_english_catalog.py"
SPEC = importlib.util.spec_from_file_location("generate_english_catalog", SCRIPT)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"Cannot load {SCRIPT}")
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class EnglishCatalogGeneratorTest(unittest.TestCase):
    def test_extracts_android_printf_tokens_with_positions(self):
        self.assertEqual(
            ["%1$d", "%2$s", "%%"],
            MODULE.extract_printf_tokens("Play %1$d songs by %2$s (100%%)"),
        )

    def test_english_source_is_preserved_verbatim(self):
        row = {
            "source": "Share with %s",
            "source_language": "en",
            "format_tokens": "%s",
        }
        self.assertEqual("Share with %s", MODULE.english_text_for_source_row(row))

    def test_output_row_preserves_formatted_attribute(self):
        row = {
            "resource_id": "1",
            "resource_type": "string",
            "key": "mixed_formats",
            "item_qualifier": "",
            "source": "%s · %d items",
            "source_language": "en",
            "format_tokens": "%s|%d",
            "formatted": "false",
            "markup": "",
            "screen_hint": "test",
            "source_kind": "resource",
            "notes": "test",
        }

        output = MODULE.output_row(row, "%s · %d items", "", generated=False)

        self.assertEqual("false", output["formatted"])

    def test_write_catalog_uses_lf_line_endings(self):
        row = {
            "resource_id": "1",
            "resource_type": "string",
            "key": "mixed_formats",
            "item_qualifier": "",
            "source": "%s · %d items",
            "source_language": "en",
            "format_tokens": "%s|%d",
            "formatted": "false",
            "markup": "",
            "screen_hint": "test",
            "source_kind": "resource",
            "notes": "test",
        }
        with tempfile.TemporaryDirectory() as temporary_directory:
            output_path = pathlib.Path(temporary_directory) / "catalog.csv"
            MODULE.write_catalog(
                output_path,
                [MODULE.output_row(row, "%s · %d items", "", generated=False)],
            )

            self.assertNotIn(b"\r\n", output_path.read_bytes())

    def test_resume_refreshes_source_metadata_and_preserves_target(self):
        source_row = {
            "resource_id": "0x7f130999",
            "resource_type": "string",
            "key": "mixed_formats",
            "item_qualifier": "",
            "source": "更新 %s · %d items",
            "source_language": "ja",
            "format_tokens": "%s|%d",
            "formatted": "false",
            "markup": "",
            "screen_hint": "updated screen",
            "source_kind": "resource",
            "notes": "updated notes",
        }
        previous = MODULE.output_row(
            {
                **source_row,
                "resource_id": "0x7f130001",
                "source": "古い %s · %d items",
                "screen_hint": "old screen",
            },
            "Saved %s · %d items",
            "",
            generated=True,
        )

        resumed = MODULE.resume_output_row(source_row, previous)

        self.assertEqual("Saved %s · %d items", resumed["en"])
        self.assertEqual("0x7f130999", resumed["resource_id"])
        self.assertEqual("更新 %s · %d items", resumed["source"])
        self.assertEqual("updated screen", resumed["screen_hint"])
        self.assertEqual("updated notes", resumed["notes"])
        self.assertEqual("machine_verified", resumed["en_status"])

    def test_rejects_translation_that_changes_format_tokens(self):
        with self.assertRaisesRegex(ValueError, "format tokens"):
            MODULE.validate_translation("Play %1$d songs", "Play songs", "row-1")

    def test_rejects_translation_that_changes_escaped_newlines(self):
        with self.assertRaisesRegex(ValueError, "newlines"):
            MODULE.validate_translation("Line one\\nLine two", "Line one Line two", "row-1b")

    def test_rejects_blank_translation(self):
        with self.assertRaisesRegex(ValueError, "blank"):
            MODULE.validate_translation("設定", "   ", "row-2")

    def test_accepts_matching_bold_markup_translation(self):
        row = {"markup": "b:0,2"}
        MODULE.validate_markup_translation(
            row,
            "Registration limit reached.",
            "<b>Registration limit reached.</b>",
            "row-3",
        )

    def test_rejects_markup_that_changes_plain_translation(self):
        row = {"markup": "b:0,2"}
        with self.assertRaisesRegex(ValueError, "differs"):
            MODULE.validate_markup_translation(
                row,
                "Registration limit reached.",
                "<b>Limit reached.</b>",
                "row-4",
            )

    def test_rejects_duplicate_translation_ids(self):
        payload = {
            "translations": [
                {"id": "7", "text": "Settings"},
                {"id": "7", "text": "Configuration"},
            ]
        }
        with self.assertRaisesRegex(ValueError, "duplicate"):
            MODULE.index_translations(payload, {"7"})

    def test_rejects_missing_translation_ids(self):
        payload = {"translations": [{"id": "7", "text": "Settings"}]}
        with self.assertRaisesRegex(ValueError, "IDs"):
            MODULE.index_translations(payload, {"7", "8"})


if __name__ == "__main__":
    unittest.main()
