import copy
import importlib.util
import os
from pathlib import Path
import subprocess
import shutil
import tempfile
import unittest

root = Path(__file__).parents[1]
spec = importlib.util.spec_from_file_location("verify_extension", root / "verify_extension.py")
extension = importlib.util.module_from_spec(spec)
spec.loader.exec_module(extension)


class ExtensionAbiTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory()
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.root = Path(cls.temporary.name)
        package = cls.root / "example"
        package.mkdir()
        (package / "Model.java").write_text('package example; public class Model { public String token; private String text; public Model(String text) { this.text=text; this.token=text; } public String getText() { return text; } }')
        (cls.root / "MediumReaderAbiProbe.java").write_text('public class MediumReaderAbiProbe { public String read() { example.Model m = new example.Model("x"); return m.getText()+m.token; } }')
        (cls.root / "MediumReaderEmptyProbe.java").write_text('public class MediumReaderEmptyProbe { public String read() { return "empty"; } }')
        subprocess.run([shutil.which("javac") or "javac", "--release", "8", str(package / "Model.java"),
                        str(cls.root / "MediumReaderAbiProbe.java"), str(cls.root / "MediumReaderEmptyProbe.java")], check=True, capture_output=True)
        sdk = Path(os.environ.get("ANDROID_HOME", Path.home() / "Library/Android/sdk"))
        d8 = sorted((sdk / "build-tools").glob("*/d8"))[-1]
        for name, files in [("valid", ["MediumReaderAbiProbe.class"]), ("bundled", ["MediumReaderAbiProbe.class", "example/Model.class"]), ("empty", ["MediumReaderEmptyProbe.class"])]:
            directory = cls.root / name
            directory.mkdir()
            subprocess.run([str(d8), "--min-api", "32", "--lib", str(sdk / "platforms/android-36/android.jar"),
                            "--classpath", str(cls.root), "--output", str(directory), *[str(cls.root / f) for f in files]], check=True, capture_output=True)
        cls.abi = {"classes": {"Lexample/Model;": {"fields": {"token": {"type": "Ljava/lang/String;"}}, "methods": [
            {"name": "<init>", "parameters": ["Ljava/lang/String;"], "returns": "V"},
            {"name": "getText", "parameters": [], "returns": "Ljava/lang/String;"},
        ]}}}

    def test_verifies_real_dex_method_and_field_references(self):
        report = extension.verify(self.root / "valid/classes.dex", self.abi)
        self.assertEqual(report["definitions"], 1)
        self.assertGreaterEqual(report["verified_app_members"], 3)

    def test_rejects_app_stubs_accidentally_bundled_into_extension(self):
        with self.assertRaises(ValueError):
            extension.verify(self.root / "bundled/classes.dex", self.abi)

    def test_rejects_wrong_method_descriptor_even_when_name_matches(self):
        abi = copy.deepcopy(self.abi)
        abi["classes"]["Lexample/Model;"]["methods"][1]["returns"] = "I"
        with self.assertRaises(ValueError):
            extension.verify(self.root / "valid/classes.dex", abi)

    def test_rejects_wrong_field_descriptor(self):
        abi = copy.deepcopy(self.abi)
        abi["classes"]["Lexample/Model;"]["fields"]["token"]["type"] = "I"
        with self.assertRaises(ValueError):
            extension.verify(self.root / "valid/classes.dex", abi)

    def test_empty_native_adapter_does_not_pass_as_verified_integration(self):
        with self.assertRaises(ValueError):
            extension.verify(self.root / "empty/classes.dex", self.abi)


if __name__ == "__main__":
    unittest.main()
