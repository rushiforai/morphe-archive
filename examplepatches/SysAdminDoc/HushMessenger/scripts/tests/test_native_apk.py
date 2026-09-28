#!/usr/bin/env python3
"""Native APK checks using real ZIP archives and small ELF fixtures."""

import argparse
import hashlib
import io
import struct
import tempfile
import unittest
import zlib
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path
from unittest.mock import patch
from zipfile import ZIP_DEFLATED, ZIP_STORED, ZipFile, ZipInfo

from scripts import check_install as checker

LIBRARY = "lib/arm64-v8a/libsample.so"
MANIFEST = "E: manifest (line=1)\n  E: application (line=2)\n    A: http://schemas.android.com/apk/res/android:extractNativeLibs(0x010104ea)=true\n"


def elf(alignment=16384, machine=183, address=0):
    data = bytearray(152)
    data[:7] = b"\x7fELF\x02\x01\x01"
    struct.pack_into("<HHI", data, 16, 3, machine, 1)
    struct.pack_into("<Q", data, 32, 64)
    struct.pack_into("<HHH", data, 52, 64, 56, 1)
    struct.pack_into(
        "<IIQQQQQQ", data, 64, 1, 4, 0, address, 0, len(data), len(data), alignment
    )
    return bytes(data)


def apk_file(path, data=None, name=LIBRARY, compression=ZIP_DEFLATED, aligned=False):
    entry = ZipInfo(name)
    entry.compress_type = compression
    if aligned:
        padding = (-(30 + len(name.encode("utf-8")))) % 16384
        entry.extra = struct.pack("<HH", 0xD935, padding - 4) + bytes(padding - 4)
    with ZipFile(path, "w") as archive:
        archive.writestr(entry, elf() if data is None else data)


class NativeChecks(unittest.TestCase):
    def test_extracted_libraries_do_not_need_zip_alignment(self):
        with tempfile.TemporaryDirectory() as root:
            path = Path(root) / "native.apk"
            for compression in (ZIP_DEFLATED, ZIP_STORED):
                apk_file(path, compression=compression)
                for page_size in (4096, 16384):
                    with self.subTest(compression=compression, page_size=page_size):
                        libraries, alignment, compressed = checker.native_libraries(
                            path, page_size, True
                        )
                        self.assertEqual(
                            libraries, {LIBRARY: hashlib.sha256(elf()).hexdigest()}
                        )
                        self.assertEqual(alignment, 16384)
                        self.assertEqual(compressed, int(compression == ZIP_DEFLATED))

    def test_direct_mapping_requires_uncompressed_aligned_zip_data(self):
        with tempfile.TemporaryDirectory() as root:
            path = Path(root) / "native.apk"
            for compression in (ZIP_STORED, ZIP_DEFLATED):
                apk_file(path, compression=compression)
                with (
                    self.subTest(compression=compression),
                    self.assertRaises(ValueError),
                ):
                    checker.native_libraries(path, 16384, False)
            apk_file(path, compression=ZIP_STORED, aligned=True)
            self.assertEqual(
                checker.native_libraries(path, 16384, False)[0].keys(), {LIBRARY}
            )

    def test_invalid_elf_architecture_bounds_alignment_and_missing_libraries_fail(self):
        invalid_table = bytearray(elf())
        struct.pack_into("<Q", invalid_table, 32, 100000)
        invalid_segment = bytearray(elf())
        struct.pack_into("<Q", invalid_segment, 64 + 32, 100000)
        no_load = bytearray(elf())
        struct.pack_into("<I", no_load, 64, 0)
        with tempfile.TemporaryDirectory() as root:
            path = Path(root) / "native.apk"
            for data in (
                b"truncated",
                elf(machine=62),
                elf(4096),
                elf(address=4096),
                invalid_table,
                invalid_segment,
                no_load,
            ):
                with self.subTest(data=bytes(data[:24])):
                    apk_file(path, data)
                    with self.assertRaises(ValueError):
                        checker.native_libraries(path, 16384, True)
            for name in ("lib/x86_64/libsample.so", "assets/file.txt"):
                apk_file(path, name=name)
                with self.subTest(name=name), self.assertRaises(ValueError):
                    checker.native_libraries(path, 4096, True)

    def test_incorrect_zip_lengths_produce_a_controlled_error(self):
        with tempfile.TemporaryDirectory() as root:
            path = Path(root) / "truncated.apk"
            apk_file(path, elf()[:100], compression=ZIP_STORED)
            contents = bytearray(path.read_bytes())
            struct.pack_into("<I", contents, 22, 152)
            directory = contents.index(b"PK\x01\x02")
            struct.pack_into("<I", contents, directory + 24, 152)
            path.write_bytes(contents)
            with self.assertRaisesRegex(ValueError, "Truncated ELF"):
                checker.native_libraries(path, 4096, True)

    def test_corrupt_deflate_native_entry_has_a_controlled_cli_error(self):
        with tempfile.TemporaryDirectory() as root:
            path = Path(root) / "corrupt-deflate.apk"
            apk_file(path, compression=ZIP_DEFLATED)
            contents = bytearray(path.read_bytes())
            name_size, extra_size = struct.unpack_from("<HH", contents, 26)
            # BFINAL=1 and reserved BTYPE=3 make the actual DEFLATE stream invalid.
            contents[30 + name_size + extra_size] = 0x07
            path.write_bytes(contents)
            with self.assertRaisesRegex(zlib.error, "invalid block type"):
                checker.native_libraries(path, 4096, True)
            output = io.StringIO()
            argv = [
                "check_install.py",
                "--apk",
                str(path),
                "--serial",
                "test-only",
                "--build-tools",
                "tools",
            ]
            with (
                patch("sys.argv", argv),
                patch.object(
                    checker,
                    "check",
                    side_effect=lambda _: checker.native_libraries(path, 4096, True),
                ),
                redirect_stderr(output),
            ):
                self.assertEqual(checker.main(), 2)
            self.assertIn("CHECK FAILED:", output.getvalue())
            self.assertIn("invalid block type", output.getvalue())
            self.assertNotIn("Traceback", output.getvalue())

    def test_manifest_flag_uses_application_and_fails_on_ambiguous_values(self):
        self.assertTrue(checker.native_extraction(MANIFEST))
        self.assertFalse(checker.native_extraction(MANIFEST.replace("=true", "=false")))
        self.assertTrue(
            checker.native_extraction(
                "E: manifest\n  E: application\n    E: activity\n      A: android:extractNativeLibs=false\n"
            )
        )
        for output in (
            "",
            MANIFEST + MANIFEST,
            MANIFEST.replace("=true", "=@0x7f000000"),
            MANIFEST + "    A: android:extractNativeLibs=false\n",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.native_extraction(output)

    def test_device_metadata_and_optional_baseline_do_not_claim_preservation_without_evidence(
        self,
    ):
        with tempfile.TemporaryDirectory() as root:
            path = Path(root) / "candidate.apk"
            stock = Path(root) / "stock.apk"
            apk_file(path)
            apk_file(stock, compression=ZIP_STORED)
            candidate = checker.Apk(
                "com.facebook.orca",
                346013440,
                "580.0.0.49.91",
                frozenset(),
                frozenset(),
            )
            args = argparse.Namespace(
                apk=path, stock_apk=None, build_tools=Path("tools")
            )
            for abis, pages in (
                ("", "4096"),
                ("x86_64", "4096"),
                ("arm64-v8a", "0"),
                ("arm64-v8a", "8193"),
                ("arm64-v8a", "unknown"),
            ):
                with (
                    self.subTest(abis=abis, pages=pages),
                    patch.object(checker, "run", side_effect=[abis, pages, MANIFEST]),
                    self.assertRaises(ValueError),
                ):
                    checker.check_native(args, candidate, 28, ["adb"])
            output = io.StringIO()
            with (
                patch.object(
                    checker, "run", side_effect=["arm64-v8a", "4096", MANIFEST]
                ),
                redirect_stdout(output),
            ):
                checker.check_native(args, candidate, 28, ["adb"])
            self.assertIn("preservation not checked", output.getvalue())
            args.stock_apk = stock
            with (
                patch.object(
                    checker, "run", side_effect=["arm64-v8a", "16384", MANIFEST]
                ),
                redirect_stdout(io.StringIO()),
                self.assertRaisesRegex(ValueError, "SHA-256"),
            ):
                checker.check_native(args, candidate, 36, ["adb"])
            with patch.dict(
                checker.STOCK_SHA256,
                {346013440: hashlib.sha256(stock.read_bytes()).hexdigest()},
            ):
                with (
                    patch.object(
                        checker, "run", side_effect=["arm64-v8a", "16384", MANIFEST]
                    ),
                    redirect_stdout(io.StringIO()),
                ):
                    checker.check_native(args, candidate, 36, ["adb"])
                changed = bytearray(elf())
                changed[-1] = 1
                apk_file(path, changed)
                with (
                    patch.object(
                        checker, "run", side_effect=["arm64-v8a", "16384", MANIFEST]
                    ),
                    redirect_stdout(io.StringIO()),
                    self.assertRaisesRegex(ValueError, "differ"),
                ):
                    checker.check_native(args, candidate, 36, ["adb"])


if __name__ == "__main__":
    unittest.main()
