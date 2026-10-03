"""Exercise local catalog exports, TSV escapes and failure-safe translation imports.

Copyright 2026 HushGram contributors. GPL-3.0-only.
https://github.com/SysAdminDoc/HushGram
"""
import hashlib
import importlib.util
import io
import json
import os
import shutil
import stat
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parent.parent
# Loading the bridge loads the generator, which stops an unsupported Python before anything is written.
spec = importlib.util.spec_from_file_location("hushgram_translation_sync", ROOT / "scripts/sync-l10n.py")
bridge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bridge)
generator = bridge.generator
SCRATCH = Path(os.environ.get("HUSHGRAM_L10N_TEST_WORK", str(ROOT / "build/l10n-tests")))
SCRATCH.mkdir(parents=True, exist_ok=True)


class TranslationTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="catalog-", dir=SCRATCH)
        self.addCleanup(self.temporary.cleanup)
        self.work = Path(self.temporary.name)
        self.root = self.work / "repo"
        self.rows = {"Hello": "Hallo", "Value %1$s": "Wert %1$s", "Bare %s and %d": "Wert %s und %d",
                     "One %1$d item": "Ein %1$d Eintrag", "%1$d items": "%1$d Eintrage"}
        self.make_repository(self.rows, ["de"], ("One %1$d item", "%1$d items"))
        self.table = self.root / bridge.TABLE_DIRECTORY / "de.tsv"
        self.input = self.work / "incoming.json"

    def make_repository(self, rows, languages, quantity=None):
        folder = self.root / bridge.TABLE_DIRECTORY
        folder.mkdir(parents=True, exist_ok=True)
        shared = self.root / "extensions/shared/library/src/main/java"
        application = self.root / "extensions/instagram/src/main/java"
        shared.mkdir(parents=True, exist_ok=True)
        application.mkdir(parents=True, exist_ok=True)
        source = "class SourceCatalog { void show() {\n"
        source += "".join(f"L10n.t({json.dumps(key, ensure_ascii=True)});\n" for key in rows
                          if not generator.PLURAL_VARIANT.match(key))
        if quantity:
            source += "L10n.quantity(count, {}, {});\n".format(*tuple(json.dumps(key) for key in quantity))
        (application / "SourceCatalog.java").write_text(source + "} }\n", encoding="utf-8")
        for language in languages:
            data = b"# Keep this context.\n" + "".join(
                generator.encode_field(key) + "\t" + generator.encode_field(value) + "\n"
                for key, value in rows.items()).encode("utf-8")
            (folder / (language + ".tsv")).write_bytes(data)

    def incoming(self, rows=None):
        self.input.write_bytes(bridge.json_bytes(self.rows if rows is None else rows))
        return self.input

    def import_rows(self, rows=None, **options):
        return bridge.import_translations(self.root, "de", self.incoming(rows), **options)

    def reject(self, data, **options):
        self.input.write_bytes(data)
        before = self.table.read_bytes()
        with self.assertRaises((ValueError, OSError)):
            bridge.import_translations(self.root, "de", self.input, **options)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_all_five_real_languages_round_trip_without_changing_any_bytes(self):
        shutil.rmtree(self.root)
        for tree in ("extensions/shared/library/src/main/java", "extensions/instagram/src/main/java",
                     str(bridge.TABLE_DIRECTORY)):
            shutil.copytree(ROOT / tree, self.root / tree)
        script = self.root / "scripts/gen-l10n.py"
        script.parent.mkdir()
        shutil.copyfile(ROOT / "scripts/gen-l10n.py", script)
        folder = self.root / bridge.TABLE_DIRECTORY
        before = {path.name: path.read_bytes() for path in folder.glob("*.tsv")}
        java = self.root / "extensions/shared/library/src/main/java/app/hushgram/extension/shared/L10nTranslations.java"
        generated = java.read_bytes()
        counts = {name[:-4]: sum(b"\t" in line for line in data.splitlines()) for name, data in before.items()}
        source_keys = {generator.decode_field(line.split(b"\t", 1)[0].decode("utf-8"))
                       for data in before.values() for line in data.splitlines() if b"\t" in line}
        output = self.work / "export"
        self.assertEqual((len(source_keys), sum(counts.values())), bridge.export_catalog(self.root, output))
        self.assertTrue({"de", "es", "in", "pt-rBR", "tr"}.issubset(counts))
        for language, count in counts.items():
            self.assertEqual((False, count, 0), bridge.import_translations(
                self.root, language, output / (language + ".json")))
        self.assertEqual(before, {path.name: path.read_bytes() for path in folder.glob("*.tsv")})
        regenerated = subprocess.run([sys.executable, "-B", str(script)], capture_output=True, text=True, check=False)
        self.assertEqual(0, regenerated.returncode, regenerated.stderr)
        self.assertEqual(generated, java.read_bytes())

    def test_identifiers_use_full_sha256_of_exact_english(self):
        english = "line\nnext \\n"
        self.assertEqual("hg_" + hashlib.sha256(english.encode("utf-8")).hexdigest(), bridge.identifier(english))
        self.assertNotEqual(bridge.identifier("a\nb"), bridge.identifier("a\\nb"))
        self.assertNotEqual(bridge.identifier("caf\u00e9"), bridge.identifier("cafe\u0301"))

    def test_export_is_deterministic_and_source_matches_code(self):
        first, second = self.work / "first", self.work / "second"
        bridge.export_catalog(self.root, first)
        bridge.export_catalog(self.root, second)
        self.assertEqual((first / "en.json").read_bytes(), (second / "en.json").read_bytes())
        self.assertEqual({bridge.identifier(key): key for key in self.rows},
                         json.loads((first / "en.json").read_bytes()))
        self.assertEqual((first / "de.json").read_bytes(), (second / "de.json").read_bytes())

    def test_partial_merge_retains_absent_rows_and_context(self):
        before = self.table.read_bytes()
        self.assertEqual((True, 1, 4), self.import_rows({"Hello": "Neu"}, partial=True))
        after = self.table.read_bytes()
        self.assertEqual(before.replace(b"Hello\tHallo\n", b"Hello\tNeu\n"), after)
        self.assertEqual("Neu", generator.read(self.table)["Hello"])

    def test_source_equal_translation_is_valid(self):
        self.assertEqual((True, 1, 4), self.import_rows({"Hello": "Hello"}, partial=True))

    def test_unchanged_import_preserves_bom_crlf_comments_and_no_final_newline(self):
        data = b"\xef\xbb\xbf" + self.table.read_bytes().replace(b"\n", b"\r\n").rstrip(b"\r\n")
        self.table.write_bytes(data)
        self.assertEqual((False, 5, 0), self.import_rows())
        self.assertEqual(data, self.table.read_bytes())

    def test_missing_row_is_rejected_by_default(self):
        self.reject(bridge.json_bytes({"Hello": "Neu"}))

    def test_json_rejects_unknown_and_duplicate_decoded_identifiers(self):
        key = bridge.identifier("Hello")
        escaped = key.replace("h", "\\u0068", 1)
        for data in (b'{"unknown":"x"}', (f'{{"{key}":"x","{escaped}":"y"}}').encode()):
            with self.subTest(data=data):
                self.reject(data, partial=True)

    def test_json_rejects_invalid_structure_constants_and_encoding(self):
        key = bridge.identifier("Hello")
        for value in (None, False, 2, [], {"nested": "x"}, "", " \n "):
            with self.subTest(value=value):
                self.reject(json.dumps({key: value}).encode(), partial=True)
        for data in (b"[]", b"{}", b"null", b'{"x":NaN}', b'{"x":Infinity}', b'{"x":-Infinity}',
                     b'{"x":"\xff"}', b'{"x":', b'\xef\xbb\xbf\xef\xbb\xbf{}'):
            with self.subTest(data=data):
                self.reject(data, partial=True)

    def test_json_bom_is_accepted(self):
        self.input.write_bytes(b"\xef\xbb\xbf" + bridge.json_bytes(self.rows))
        self.assertEqual((False, 5, 0), bridge.import_translations(self.root, "de", self.input))

    def test_controls_surrogates_and_invisibles_are_rejected(self):
        for character in ("\0", "\r", "\t", "\u2068", "\u2069", "\u202e", "\u200f", "\u200b",
                          "\ue000", "\u0378", "\u2028", "\u2029", "\ud800", "\udfff", "\u3164",
                          "\ufe0f", "\U000e0100", "\u2013", "\u2014"):
            with self.subTest(codepoint=ord(character)):
                self.reject(json.dumps({bridge.identifier("Hello"): "a" + character + "b"}).encode(), partial=True)
        self.reject(bridge.json_bytes({"Hello": "a - b"}), partial=True)

    def test_codec_round_trip_preserves_newline_backslashes_supplementary_and_rtl(self):
        value = 'quote " and apostrophe\' <tag>& literal \\n, LF\n\u0645\u0631\u062d\u0628\u0627 \u05e9\u05dc\u05d5\u05dd \U0001f680'
        self.assertEqual(value, generator.decode_field(generator.encode_field(value)))
        self.assertEqual((True, 1, 4), self.import_rows({"Hello": value}, partial=True))
        self.assertEqual(value, generator.read(self.table)["Hello"])
        self.assertIn("\\u", generator.literal(value))
        self.assertIn("\\ud83d\\ude80", generator.literal(value))
        output = self.work / "rtl"
        bridge.export_catalog(self.root, output)
        self.assertEqual((False, 5, 0), bridge.import_translations(self.root, "de", output / "de.json"))

    def test_source_key_newlines_and_literal_backslash_n_get_distinct_identifiers(self):
        rows = {"line\nnext": "Zeile\nweiter", "line\\nnext": "Zeile\\nweiter"}
        shutil.rmtree(self.root)
        self.make_repository(rows, ["de"])
        output = self.work / "escapes"
        self.assertEqual((2, 2), bridge.export_catalog(self.root, output))
        before = self.table.read_bytes()
        self.assertEqual((False, 2, 0), bridge.import_translations(self.root, "de", output / "de.json"))
        self.assertEqual(before, self.table.read_bytes())

    def test_formats_keep_bare_order_and_numbered_argument_types(self):
        for source, translated in (("%1$s %2$d", "%2$d %1$s"), ("%s %% %d", "%% %s %d"),
                                   ("%1$s %1$s", "%1$s %1$s"), ("a%n%s", "%s%n a")):
            self.assertIsNone(generator.placeholder_problem(source, translated))
        for source, translated in (("%s %d", "%d %s"), ("%1$s", "%1$d"), ("%1$s %2$s", "%1$s %1$s"),
                                   ("%1$s", "%s"), ("%1$s", "%1$s %999999999s"), ("%1$s", "%1$s %"),
                                   ("%1$s", "%1$999999s"), ("%1$s", "%1$.2s"), ("Hello", "%0$s"),
                                   ("Hello", "%1$n"), ("Hello", "%1$%"), ("%s %%", "%s"),
                                   ("%1$s", "%1$s %q"), ("%1$s", "%1$s %<s"), ("%1$s", "%1$s %tY")):
            with self.subTest(source=source, translated=translated):
                self.assertIsNotNone(generator.placeholder_problem(source, translated))
        self.reject(bridge.json_bytes({"Bare %s and %d": "Wert %d und %s"}), partial=True)
        self.reject(bridge.json_bytes({"Value %1$s": "%1$s %999999999s"}), partial=True)

    def test_real_numbered_reordering_imports(self):
        rows = {"%1$s then %2$d": "%1$s dann %2$d"}
        shutil.rmtree(self.root)
        self.make_repository(rows, ["de"])
        self.assertEqual((True, 1, 0), self.import_rows({"%1$s then %2$d": "%2$d dann %1$s"}))

    def test_mixed_formats_allow_numbered_arguments_to_move_around_bare_arguments(self):
        for source, translated in (("%2$s then %s", "%s then %2$s"),
                                   ("%3$s %s %2$d %d", "%s %d %2$d %3$s"),
                                   ("%2$s %s %% %2$s %n %d", "%% %s %d %n %2$s %2$s"),
                                   ("%s %3$S %d %3$S", "%3$S %s %3$S %d")):
            with self.subTest(source=source, translated=translated):
                self.assertIsNone(generator.placeholder_problem(source, translated))

    def test_mixed_formats_reject_bare_type_index_and_count_changes(self):
        source = "%3$s %s %2$d %d %3$s"
        for translated in ("%d %s %2$d %3$s %3$s", "%s %s %2$d %3$s %3$s",
                           "%s %d %2$s %3$s %3$s", "%s %d %1$d %3$s %3$s",
                           "%s %d %2$d %3$s", "%s %d %2$d %3$s %3$s %3$s",
                           "%s %2$d %3$s %3$s", "%s %d %d %2$d %3$s %3$s",
                           "%1$s %d %2$d %3$s %3$s", "%s %d %2$d %3$s %3$s %%",
                           "%s %d %2$d %3$s %3$s %n"):
            with self.subTest(translated=translated):
                self.assertIsNotNone(generator.placeholder_problem(source, translated))

    def test_real_mixed_reordering_imports(self):
        source = "%3$s %s %2$d %d"
        rows = {source: source}
        shutil.rmtree(self.root)
        self.make_repository(rows, ["de"])
        self.assertEqual((True, 1, 0), self.import_rows({source: "%s %d %2$d %3$s"}))
        self.assertEqual("%s %d %2$d %3$s", generator.read(self.table)[source])

    def test_reachable_plural_variant_import_export_and_partial_retention(self):
        rows = dict(self.rows, **{"%1$d items|few": "%1$d wenige Eintrage"})
        self.assertEqual((True, 6, 0), self.import_rows(rows))
        output = self.work / "plural"
        self.assertEqual((6, 6), bridge.export_catalog(self.root, output))
        self.assertEqual("%1$d items", json.loads((output / "en.json").read_bytes())[bridge.identifier("%1$d items|few")])
        before = self.table.read_bytes()
        self.assertEqual((False, 6, 0), bridge.import_translations(self.root, "de", output / "de.json"))
        self.assertEqual(before, self.table.read_bytes())
        self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(rows["%1$d items|few"], generator.read(self.table)["%1$d items|few"])
        self.reject(bridge.json_bytes(self.rows))

    def test_orphan_unreachable_unknown_and_incompatible_plural_variants_reject(self):
        for key, value in (("Hello|few", "x"), ("%1$d items|one", "%1$d x"),
                           ("%1$d items|unknown", "%1$d x"), ("%1$d items|few", "%1$s x")):
            with self.subTest(key=key):
                self.reject(bridge.json_bytes({key: value}), partial=True)

    def test_source_literal_that_ends_like_a_plural_category_is_exported_in_full(self):
        source = self.root / "extensions/instagram/src/main/java/SourceCatalog.java"
        with source.open("a", encoding="utf-8") as handle:
            handle.write('class LiteralCategory { void show() { L10n.t("Label|few"); } }')
        with self.table.open("ab") as handle:
            handle.write(b"Label|few\tBeschriftung\n")
        output = self.work / "literal-category"
        bridge.export_catalog(self.root, output)
        self.assertEqual("Label|few", json.loads((output / "en.json").read_bytes())[bridge.identifier("Label|few")])

    def test_string_limit_accepts_boundary_and_rejects_one_more(self):
        self.import_rows({"Hello": "a" * bridge.MAX_TEXT}, partial=True)
        self.reject(bridge.json_bytes({"Hello": "a" * (bridge.MAX_TEXT + 1)}), partial=True)

    def test_file_limit_accepts_boundary_and_rejects_one_more(self):
        data = bridge.json_bytes(self.rows)
        at_limit = data + b" " * (bridge.MAX_BYTES - len(data))
        self.input.write_bytes(at_limit)
        self.assertEqual((False, 5, 0), bridge.import_translations(self.root, "de", self.input))
        self.reject(at_limit + b" ")

    def test_entry_limit_accepts_boundary_and_rejects_one_more(self):
        rows = {f"key {at:04d}": f"value {at:04d}" for at in range(bridge.MAX_ENTRIES)}
        shutil.rmtree(self.root)
        self.make_repository(rows, ["de"])
        self.assertEqual((False, bridge.MAX_ENTRIES, 0), self.import_rows(rows))
        data = json.loads(bridge.json_bytes(rows))
        data["unknown"] = "x"
        self.reject(json.dumps(data).encode())

    def test_source_catalog_limit_and_missing_or_stale_table_rows_reject(self):
        for bad in (b"Unknown\tx\n", b"Hello\tHallo\nHello\tDoppelt\n", b"Hello\tHallo\tx\n",
                    b"Hello\tunknown\\q\n", b"Hello\ttrailing\\\n", b"\xef\xbb\xbf\xef\xbb\xbfHello\tHallo\n"):
            self.table.write_bytes(bad)
            self.reject(bridge.json_bytes(self.rows))
        rows = {f"key {at:04d}": "x" for at in range(bridge.MAX_ENTRIES + 1)}
        shutil.rmtree(self.root)
        self.make_repository(rows, ["de"])
        self.reject(bridge.json_bytes({"Hello": "x"}), partial=True)

    def test_tsv_does_not_silently_strip_a_carriage_return_from_translation_text(self):
        for bad in (b"Hello\tHallo\r", b"Hello\tHallo\r\r\n"):
            with self.subTest(data=bad):
                self.table.write_bytes(bad)
                self.reject(bridge.json_bytes(self.rows))

    def test_new_language_is_explicit_and_requires_complete_input(self):
        source = self.incoming({"Hello": "\uc548\ub155"})
        korean = self.table.with_name("ko.tsv")
        for options in ({}, {"new_language": True}, {"new_language": True, "partial": True}):
            with self.subTest(options=options), self.assertRaises(ValueError):
                bridge.import_translations(self.root, "ko", source, **options)
            self.assertFalse(korean.exists())
        source = self.incoming()
        self.assertEqual((True, 5, 0), bridge.import_translations(self.root, "ko", source, new_language=True))
        self.assertEqual(self.rows, generator.read(korean))
        with self.assertRaises(ValueError):
            bridge.import_translations(self.root, "ko", source, new_language=True)

    def test_language_aliases_and_unsafe_names(self):
        self.assertEqual("in", bridge.language_tag("id"))
        self.assertEqual("pt-rBR", bridge.language_tag("pt-BR"))
        self.assertEqual("pt-rBR", bridge.language_tag("pt-rbr"))
        for invalid in ("../de", "de/foo", "de\\foo", "de.tsv", "", "con", "NUL", "en", "en-XA", "ar-XB"):
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                bridge.language_tag(invalid)

    def test_identifier_collision_stops_export_before_files_are_created(self):
        output = self.work / "collision"
        with mock.patch.object(bridge, "identifier", return_value="hg_collision"), self.assertRaises(ValueError):
            bridge.export_catalog(self.root, output)
        self.assertFalse(output.exists())

    def test_source_scanner_joins_literals_and_ignores_fake_calls(self):
        source = self.root / "extensions/instagram/src/main/java/SourceCatalog.java"
        source.write_text('class SourceCatalog { void show() {\n'
                          '// L10n.t("comment");\nString x = "L10n.t(\\\"string\\\")";\n'
                          'L10n.t("Hello " + /* context */ "world");\n'
                          'L10n.quantity(2, "One\\nitem", "%1$d " + "items");\n} }', encoding="utf-8")
        keys, others = generator.source_catalog(str(self.root))
        self.assertEqual({"Hello world", "One\nitem", "%1$d items"}, keys)
        self.assertEqual({"%1$d items"}, others)

    def test_source_scanner_includes_pause_fields_and_the_constant(self):
        source = self.root / "extensions/instagram/src/main/java"
        (source / "PatchFamily.java").write_text(
            'enum PatchFamily { KEEP(FamilyNames.KEEP, "keep", "what stays"), '
            'OFF(FamilyNames.OFF, "off", null, Settings.OFF); }', encoding="utf-8")
        (source / "HushgramPreferenceFragment.java").write_text(
            'class HushgramPreferenceFragment { static final String STAYS_WHILE_PAUSED = "pause text"; }', encoding="utf-8")
        keys, _ = generator.source_catalog(str(self.root))
        self.assertEqual(set(self.rows) | {"what stays", "pause text"}, keys)

    def test_destination_race_during_staging_keeps_the_other_writers_bytes(self):
        latest = self.table.read_bytes().replace(b"Hello\tHallo", b"Hello\tLatest")
        real_fsync = bridge.os.fsync
        calls = 0

        def racing_fsync(descriptor):
            nonlocal calls
            calls += 1
            if calls == 2:
                self.table.write_bytes(latest)
            return real_fsync(descriptor)

        with mock.patch.object(bridge.os, "fsync", side_effect=racing_fsync), self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(latest, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))

    def test_stale_snapshot_and_racing_creation_are_rejected(self):
        expected = bridge.snapshot(self.table)
        latest = self.table.read_bytes().replace(b"Hello\tHallo", b"Hello\tLatest")
        self.table.write_bytes(latest)
        with self.assertRaises(ValueError):
            bridge.replace_if_unchanged(self.table, expected, b"wrong")
        self.assertEqual(latest, self.table.read_bytes())
        created = self.table.with_name("ko.tsv")
        missing = bridge.snapshot(created)
        created.write_bytes(b"created by another writer")
        with self.assertRaises(ValueError):
            bridge.replace_if_unchanged(created, missing, b"wrong")
        self.assertEqual(b"created by another writer", created.read_bytes())

    def test_separate_writer_after_final_snapshot_keeps_changed_and_new_destination(self):
        for absent in (False, True):
            with self.subTest(absent=absent):
                destination = self.table.with_name("fresh.tsv") if absent else self.table
                expected = bridge.snapshot(destination)
                latest = b"written by an unrelated process after the final snapshot"
                real_snapshot = bridge.snapshot
                calls = 0

                def after_snapshot(path, original=real_snapshot, target=destination, updated=latest):
                    nonlocal calls
                    saved = original(path)
                    if path == target:
                        calls += 1
                        if calls == 2:
                            writer = subprocess.run(
                                [sys.executable, "-B", "-c",
                                 "from pathlib import Path; import sys; Path(sys.argv[1]).write_bytes(bytes.fromhex(sys.argv[2]))",
                                 str(target), updated.hex()], capture_output=True, text=True, check=False)
                            self.assertEqual(0, writer.returncode, writer.stderr)
                    return saved

                with mock.patch.object(bridge, "snapshot", side_effect=after_snapshot), self.assertRaises(ValueError):
                    bridge.replace_if_unchanged(destination, expected, b"imported bytes")
                self.assertEqual(2, calls)
                self.assertEqual(latest, destination.read_bytes())
                self.assertEqual([], list(destination.parent.glob(".*.tmp")))
                self.assertEqual([], list(destination.parent.glob("*.import-lock")))

    def test_reader_open_across_commit_never_combines_old_and_new_file_bytes(self):
        before, after = b"a" * 8192, b"b" * 8192
        self.table.write_bytes(before)
        expected = bridge.snapshot(self.table)
        with self.table.open("rb", buffering=0) as reader:
            prefix = reader.read(4096)
            try:
                changed = bridge.replace_if_unchanged(self.table, expected, after)
            except (OSError, ValueError):
                changed = False
                self.assertEqual(before, self.table.read_bytes())
            self.assertEqual(before, prefix + reader.read())
        self.assertEqual(after if changed else before, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_unsupported_platform_volume_and_reparse_attributes_refuse_without_writes(self):
        import ctypes
        before = self.table.read_bytes()
        with mock.patch.object(bridge.sys, "platform", "linux"), self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        with mock.patch.object(ctypes, "WinDLL", side_effect=OSError("transaction API unavailable")), self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        real_calls = bridge.transaction_calls
        for kind in ("no-transactions", "other-filesystem", "read-only-volume", "reparse", "encrypted"):
            with self.subTest(kind=kind):
                calls = real_calls()
                real_volume, real_attributes = calls["volume"], calls["attributes"]

                def volume(handle, name, length, serial, maximum, flags, filesystem, capacity, scenario=kind, original=real_volume):
                    result = original(handle, name, length, serial, maximum, flags, filesystem, capacity)
                    if scenario == "no-transactions":
                        flags._obj.value &= ~0x00200000
                    elif scenario == "read-only-volume":
                        flags._obj.value |= 0x00080000
                    elif scenario == "other-filesystem":
                        filesystem.value = "FAT32"
                    return result

                def attributes(handle, category, output, size, scenario=kind, original=real_attributes):
                    result = original(handle, category, output, size)
                    if scenario == "reparse":
                        output[0] |= 0x400
                    elif scenario == "encrypted":
                        output[0] |= 0x4000
                    return result

                calls.update(volume=volume, attributes=attributes)
                with mock.patch.object(bridge, "transaction_calls", return_value=calls), self.assertRaises(ValueError):
                    self.import_rows({"Hello": "Neu"}, partial=True)
                self.assertEqual(before, self.table.read_bytes())
                self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
                self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_share_delete_reader_keeps_old_bytes_through_successful_native_commit(self):
        import ctypes
        import msvcrt
        from ctypes import wintypes

        before, after = b"a" * 8192, b"b" * 8192
        self.table.write_bytes(before)
        expected = bridge.snapshot(self.table)
        kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        open_file = kernel.CreateFileW
        open_file.argtypes = [wintypes.LPCWSTR, wintypes.DWORD, wintypes.DWORD, wintypes.LPVOID,
                              wintypes.DWORD, wintypes.DWORD, wintypes.HANDLE]
        open_file.restype = wintypes.HANDLE
        native = open_file(str(self.table), 0x80000000, 7, None, 3, 0x80, None)
        self.assertNotIn(native, (None, ctypes.c_void_p(-1).value))
        try:
            descriptor = msvcrt.open_osfhandle(native, os.O_RDONLY | os.O_BINARY | os.O_NOINHERIT)
        except BaseException:
            bridge.transaction_calls()["close"](native)
            raise
        with os.fdopen(descriptor, "rb", buffering=0) as reader:
            prefix = reader.read(4096)
            self.assertTrue(bridge.replace_if_unchanged(self.table, expected, after))
            self.assertEqual(before, prefix + reader.read())
            self.assertEqual(after, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_hard_link_destination_is_refused_and_neither_name_changes(self):
        alias = self.table.with_name("alias.tsv")
        os.link(self.table, alias)
        before = self.table.read_bytes()
        with self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual(before, alias.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_native_move_and_commit_failures_roll_back_existing_and_absent_files(self):
        import ctypes
        real_calls = bridge.transaction_calls
        for operation in ("move", "commit"):
            for absent in (False, True):
                with self.subTest(operation=operation, absent=absent):
                    destination = self.table.with_name("not-created.tsv") if absent else self.table
                    expected = bridge.snapshot(destination)
                    calls = real_calls()

                    def fail(*_):
                        ctypes.set_last_error(5)
                        return 0

                    calls[operation] = fail
                    with mock.patch.object(bridge, "transaction_calls", return_value=calls), self.assertRaises(OSError):
                        bridge.replace_if_unchanged(destination, expected, b"new imported bytes")
                    self.assertEqual(expected.data, destination.read_bytes() if destination.exists() else None)
                    self.assertEqual([], list(destination.parent.glob(".*.tmp")))
                    self.assertEqual([], list(destination.parent.glob("*.import-lock")))

    def test_post_commit_native_cleanup_failure_reports_applied_result(self):
        import ctypes
        calls = bridge.transaction_calls()
        real_close = calls["close"]
        errors = io.StringIO()

        def fail_close(handle):
            self.assertTrue(real_close(handle))
            ctypes.set_last_error(6)
            return 0

        calls["close"] = fail_close
        with mock.patch.object(bridge, "transaction_calls", return_value=calls), mock.patch.object(bridge.sys, "stderr", errors):
            self.assertEqual((True, 1, 4), self.import_rows({"Hello": "Neu"}, partial=True))
        self.assertEqual("Neu", generator.read(self.table)["Hello"])
        self.assertIn("transaction close cleanup failed", errors.getvalue())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_separate_writes_and_renames_are_excluded_after_guard_handles_close(self):
        real_calls = bridge.transaction_calls
        program = ("from pathlib import Path; import os,sys; p=Path(sys.argv[1]); "
                   "q=p.with_name('outside-source'); "
                   "p.write_bytes(b'foreign') if sys.argv[2]=='write' else "
                   "(q.write_bytes(b'foreign'), os.replace(q,p))")
        for absent in (False, True):
            with self.subTest(absent=absent):
                destination = self.table.with_name("new.tsv") if absent else self.table
                expected = bridge.snapshot(destination)
                calls = real_calls()
                real_move = calls["move"]

                def move(*arguments, target=destination, original=real_move):
                    result = original(*arguments)
                    self.assertTrue(result)
                    for operation in ("write", "replace"):
                        writer = subprocess.run([sys.executable, "-B", "-c", program, str(target), operation],
                                                capture_output=True, text=True, check=False)
                        self.assertNotEqual(0, writer.returncode, "Unrelated writer unexpectedly crossed the native boundary")
                    return result

                calls["move"] = move
                with mock.patch.object(bridge, "transaction_calls", return_value=calls):
                    self.assertTrue(bridge.replace_if_unchanged(destination, expected, b"imported"))
                self.assertEqual(b"imported", destination.read_bytes())
                self.assertEqual([], list(destination.parent.glob(".*.tmp")))
                self.assertEqual([], list(destination.parent.glob("*.import-lock")))

    def test_held_writable_handle_refuses_import_and_preserves_the_other_process(self):
        program = ('import pathlib,sys\n'
                   'with pathlib.Path(sys.argv[1]).open("r+b",buffering=0) as f:\n'
                   ' print("held",flush=True)\n'
                   ' sys.stdin.readline()\n'
                   ' f.seek(0); f.write(b"foreign held writer"); f.truncate()\n')
        process = subprocess.Popen([sys.executable, "-B", "-c", program, str(self.table)],
                                   stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        before = self.table.read_bytes()
        try:
            self.assertEqual("held", process.stdout.readline().strip())
            with self.assertRaises(OSError):
                self.import_rows({"Hello": "Neu"}, partial=True)
            self.assertEqual(before, self.table.read_bytes())
        finally:
            _, error = process.communicate("\n", timeout=10)
        self.assertEqual(0, process.returncode, error)
        self.assertEqual(b"foreign held writer", self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_changed_staging_bytes_are_refused_before_the_destination_moves(self):
        before = self.table.read_bytes()
        real_calls = bridge.transaction_calls

        def change_staging():
            staged = list(self.table.parent.glob(".*.tmp"))
            self.assertEqual(1, len(staged))
            staged[0].write_bytes(b"foreign staged bytes")
            return real_calls()

        with mock.patch.object(bridge, "transaction_calls", side_effect=change_staging), self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_a_destination_without_a_file_identity_is_refused_plainly_and_left_intact(self):
        # What Windows answers when Python can only stat an open file through FindFirstFile.
        before = self.table.read_bytes()
        real = bridge.stamp

        def unidentified(path):
            stamped = real(path)
            return (0, 0) + tuple(stamped[2:]) if Path(path) == self.table else stamped

        with mock.patch.object(bridge, "stamp", side_effect=unidentified), \
                mock.patch.object(bridge, "require_identity", wraps=bridge.require_identity) as checked, \
                self.assertRaises(bridge.ImportError) as refused:
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertIn("can't read a file's identity", str(refused.exception))
        self.assertTrue(checked.called)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_write_fsync_and_replace_failures_leave_destination_intact(self):
        before = self.table.read_bytes()
        for target in ("NamedTemporaryFile", "fsync", "conditional_commit"):
            with self.subTest(target=target):
                owner = bridge.tempfile if target == "NamedTemporaryFile" else bridge if target == "conditional_commit" else bridge.os
                original = getattr(owner, target)
                calls = 0

                def failing(*args, _target=target, _original=original, **kwargs):
                    nonlocal calls
                    calls += 1
                    if _target != "fsync" or calls == 2:
                        raise OSError("injected write failure")
                    return _original(*args, **kwargs)

                with mock.patch.object(owner, target, side_effect=failing), self.assertRaises(OSError):
                    self.import_rows({"Hello": "Neu"}, partial=True)
                self.assertEqual(before, self.table.read_bytes())
                self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
                self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_oversized_staged_table_and_read_only_destination_leave_original_intact(self):
        before = self.table.read_bytes()
        with self.assertRaises(ValueError):
            bridge.replace_if_unchanged(self.table, bridge.snapshot(self.table), b"a" * (bridge.MAX_BYTES + 1))
        self.assertEqual(before, self.table.read_bytes())
        original_mode = stat.S_IMODE(self.table.stat().st_mode)
        self.table.chmod(stat.S_IREAD)
        try:
            self.assertEqual((False, 5, 0), self.import_rows())
            with self.assertRaises(ValueError):
                self.import_rows({"Hello": "Neu"}, partial=True)
            self.assertEqual(before, self.table.read_bytes())
            self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        finally:
            self.table.chmod(original_mode)

    def test_foreign_transaction_lock_is_never_overwritten_or_removed(self):
        lock = self.table.with_name("." + self.table.name + ".import-lock")
        lock.write_bytes(b"another writer's ownership record")
        before = self.table.read_bytes()
        with self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual(b"another writer's ownership record", lock.read_bytes())

    def test_post_commit_lock_cleanup_error_reports_the_applied_result(self):
        lock = self.table.with_name("." + self.table.name + ".import-lock")
        original = Path.unlink
        errors = io.StringIO()

        def fail_cleanup(path, *args, **kwargs):
            if path == lock:
                raise OSError("injected cleanup failure")
            return original(path, *args, **kwargs)

        with mock.patch.object(Path, "unlink", autospec=True, side_effect=fail_cleanup), \
                mock.patch.object(bridge.sys, "stderr", errors):
            self.assertEqual((True, 1, 4), self.import_rows({"Hello": "Neu"}, partial=True))
        self.assertEqual("Neu", generator.read(self.table)["Hello"])
        self.assertIn("lock cleanup failed", errors.getvalue())
        lock.unlink()

    def test_lock_handle_close_failure_happens_before_the_destination_commit(self):
        before = self.table.read_bytes()
        original = bridge.os.fdopen

        def failing_close(descriptor, *args, **kwargs):
            handle = original(descriptor, *args, **kwargs)
            context = mock.MagicMock()
            context.__enter__.return_value = handle

            def close(*_):
                handle.close()
                raise OSError("injected lock close failure")

            context.__exit__.side_effect = close
            return context

        with mock.patch.object(bridge.os, "fdopen", side_effect=failing_close), \
                self.assertRaisesRegex(OSError, "lock close failure"):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_committed_import_never_stats_its_old_temporary_name(self):
        original = Path.exists

        def fail_cleanup_stat(path):
            if path.name.endswith(".tmp"):
                raise OSError("injected post-commit temporary stat failure")
            return original(path)

        with mock.patch.object(Path, "exists", autospec=True, side_effect=fail_cleanup_stat):
            self.assertEqual((True, 1, 4), self.import_rows({"Hello": "Neu"}, partial=True))
        self.assertEqual("Neu", generator.read(self.table)["Hello"])
        self.assertEqual([], list(self.table.parent.glob(".*.tmp")))
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_temporary_cleanup_error_preserves_the_original_failure(self):
        before = self.table.read_bytes()
        original = Path.unlink
        errors = io.StringIO()

        def fail_cleanup(path, *args, **kwargs):
            if path.name.endswith(".tmp"):
                raise OSError("injected temporary cleanup failure")
            return original(path, *args, **kwargs)

        with mock.patch.object(Path, "unlink", autospec=True, side_effect=fail_cleanup), \
                mock.patch.object(bridge, "conditional_commit", side_effect=OSError("injected replace failure")), \
                mock.patch.object(bridge.sys, "stderr", errors), \
                self.assertRaisesRegex(OSError, "replace failure"):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        self.assertIn("temporary cleanup failed", errors.getvalue())
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))
        remaining = list(self.table.parent.glob(".*.tmp"))
        self.assertEqual(1, len(remaining))
        remaining[0].unlink()

    def test_changed_lock_ownership_during_staging_is_preserved(self):
        lock = self.table.with_name("." + self.table.name + ".import-lock")
        before = self.table.read_bytes()
        real_fsync = bridge.os.fsync
        calls = 0

        def replace_owner(descriptor):
            nonlocal calls
            calls += 1
            if calls == 2:
                lock.write_bytes(b"replacement owner")
            return real_fsync(descriptor)

        with mock.patch.object(bridge.os, "fsync", side_effect=replace_owner), self.assertRaises(ValueError):
            self.import_rows({"Hello": "Neu"}, partial=True)
        self.assertEqual(before, self.table.read_bytes())
        self.assertEqual(b"replacement owner", lock.read_bytes())

    def test_separate_process_import_lock_excludes_a_second_writer(self):
        program = ('import importlib.util, pathlib, sys\n'
                   'spec=importlib.util.spec_from_file_location("sync",sys.argv[1])\n'
                   'module=importlib.util.module_from_spec(spec); spec.loader.exec_module(module)\n'
                   'with module.transaction_lock(pathlib.Path(sys.argv[2])):\n'
                   ' print("locked",flush=True)\n'
                   ' sys.stdin.readline()\n')
        process = subprocess.Popen([sys.executable, "-B", "-c", program, str(ROOT / "scripts/sync-l10n.py"), str(self.table)],
                                   stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        try:
            self.assertEqual("locked", process.stdout.readline().strip())
            before = self.table.read_bytes()
            with self.assertRaises(ValueError):
                self.import_rows({"Hello": "Neu"}, partial=True)
            self.assertEqual(before, self.table.read_bytes())
        finally:
            _, error = process.communicate("\n", timeout=10)
        self.assertEqual(0, process.returncode, error)
        self.assertEqual([], list(self.table.parent.glob("*.import-lock")))

    def test_cli_exports_imports_and_returns_nonzero_for_incomplete_input(self):
        command = [sys.executable, "-B", str(ROOT / "scripts/sync-l10n.py"), "--root", str(self.root)]
        output = self.work / "cli"
        exported = subprocess.run(command + ["export", "--output", str(output)], capture_output=True, text=True, check=False)
        self.assertEqual(0, exported.returncode, exported.stderr)
        imported = subprocess.run(command + ["import", "--language", "de", "--input", str(output / "de.json")],
                                  capture_output=True, text=True, check=False)
        self.assertEqual(0, imported.returncode, imported.stderr)
        self.assertIn("unchanged", imported.stdout)
        before = self.table.read_bytes()
        failed = subprocess.run(command + ["import", "--language", "de", "--input", str(self.incoming({"Hello": "Neu"}))],
                                capture_output=True, text=True, check=False)
        self.assertEqual(1, failed.returncode)
        self.assertIn("incomplete", failed.stderr)
        self.assertEqual(before, self.table.read_bytes())



class IdentityTests(unittest.TestCase):
    def test_a_stamp_without_a_file_identity_is_refused_plainly(self):
        with self.assertRaises(bridge.ImportError) as refused:
            bridge.require_identity((0, 0, 140, 1, 2, 33206))
        self.assertIn("can't read a file's identity", str(refused.exception))
        self.assertNotIn("destination changed", str(refused.exception))

    def test_a_stamp_with_an_identity_passes_through(self):
        stamped = (12, 34, 140, 1, 2, 33206)
        self.assertIs(stamped, bridge.require_identity(stamped))
        self.assertEqual((0, 7), bridge.require_identity((0, 7)))


class InterpreterTests(unittest.TestCase):
    def test_an_older_python_stops_with_one_line_naming_the_version_needed(self):
        with self.assertRaises(SystemExit) as stopped:
            generator.require_python((3, 11, 9, "final", 0))
        message = str(stopped.exception.code)
        self.assertEqual([message], message.splitlines())
        self.assertIn("need Python 3.12 or newer", message)
        self.assertIn("this is 3.11", message)

    def test_a_supported_python_goes_on(self):
        for version in ((3, 12, 0, "final", 0), (3, 13, 7, "final", 0), (4, 0, 0, "alpha", 1)):
            self.assertIsNone(generator.require_python(version))

    def test_every_tool_stops_on_an_older_python_before_writing(self):
        # Each tool runs in a child whose sys.version_info claims 3.11, from a copy of the scripts.
        root = Path(tempfile.mkdtemp(prefix="interpreter-", dir=SCRATCH))
        self.addCleanup(shutil.rmtree, root, True)
        (root / "scripts").mkdir()
        for name in ("gen-l10n.py", "sync-l10n.py", "test-l10n.py"):
            shutil.copyfile(ROOT / "scripts" / name, root / "scripts" / name)
        for name in ("gen-l10n.py", "sync-l10n.py", "test-l10n.py"):
            program = ("import runpy, sys\n"
                       "sys.version_info = (3, 11, 9, 'final', 0)\n"
                       "sys.argv = [sys.argv[1], 'export']\n"
                       "runpy.run_path(sys.argv[0], run_name='__main__')\n")
            with self.subTest(name):
                done = subprocess.run([sys.executable, "-c", program, str(root / "scripts" / name)],
                                      capture_output=True, text=True, timeout=60)
                self.assertEqual(1, done.returncode, done.stderr)
                self.assertEqual("", done.stdout)
                self.assertEqual(["HushGram's translation tools need Python 3.12 or newer, and this is 3.11. "
                                  "Run them with py -3.13."], done.stderr.splitlines())
                self.assertEqual(["scripts"], sorted(path.name for path in root.iterdir()))


if __name__ == "__main__":
    unittest.main(verbosity=2)
