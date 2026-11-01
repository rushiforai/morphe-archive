import importlib.util
from pathlib import Path
import struct
import tempfile
import unittest
import zipfile

spec = importlib.util.spec_from_file_location("verify_vendor", Path(__file__).parents[1] / "verify_vendor.py")
vendor = importlib.util.module_from_spec(spec)
spec.loader.exec_module(vendor)


def class_bytes(name):
    def utf(value):
        encoded = value.encode()
        return b"\x01" + struct.pack(">H", len(encoded)) + encoded
    return (struct.pack(">IHHH", 0xCAFEBABE, 0, 52, 5) + utf(name) + b"\x07\x00\x01" +
            utf("java/lang/Object") + b"\x07\x00\x03" + struct.pack(">HHHHHH", 0x21, 2, 4, 0, 0, 0))


class VendorInventoryTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def jar(self, path_name, internal_name=None):
        path = self.root / "vendor.jar"
        with zipfile.ZipFile(path, "w") as output:
            output.writestr(path_name + ".class", class_bytes(internal_name or path_name))
        return path

    def test_accepts_private_dependency_class(self):
        result = vendor.inspect_jar(self.jar(vendor.PREFIX + "Example"))
        self.assertEqual(result["class_count"], 1)

    def test_rejects_unrelocated_runtime_definition(self):
        with self.assertRaises(ValueError):
            vendor.inspect_jar(self.jar("kotlin/Unit"))

    def test_rejects_path_that_hides_original_internal_name(self):
        with self.assertRaises(ValueError):
            vendor.inspect_jar(self.jar(vendor.PREFIX + "Example", "okhttp3/Call"))

    def test_rejects_definition_already_present_in_app(self):
        directory = self.root / "app/smali"
        directory.mkdir(parents=True)
        name = vendor.PREFIX + "Example"
        (directory / "Example.smali").write_text(".class public L" + name + ";\n.super Ljava/lang/Object;\n")
        with self.assertRaises(ValueError):
            vendor.inspect_jar(self.jar(name), self.root / "app")

    def test_jsoup_optional_regex_backend_requires_both_relocated_runtime_classes(self):
        names = {vendor.PREFIX + suffix for suffix in ["jsoup/helper/Re2jRegex", "re2j/Pattern", "re2j/Matcher"]}
        path = self.root / "regex.jar"
        for missing in [None, vendor.PREFIX + "re2j/Pattern", vendor.PREFIX + "re2j/Matcher"]:
            with self.subTest(missing=missing):
                with zipfile.ZipFile(path, "w") as output:
                    for name in names - ({missing} if missing else set()):
                        output.writestr(name + ".class", class_bytes(name))
                if missing:
                    with self.assertRaisesRegex(ValueError, "RE2J backend"):
                        vendor.inspect_jar(path)
                else:
                    self.assertEqual(vendor.inspect_jar(path)["class_count"], 3)


if __name__ == "__main__":
    unittest.main()
