import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location("generate_app_stubs", Path(__file__).parents[1] / "generate_app_stubs.py")
stubs = importlib.util.module_from_spec(spec)
spec.loader.exec_module(stubs)

MODEL = """.class public final Lexample/Model;
.super Ljava/lang/Object;
.field private final text:Ljava/lang/String;
.method public constructor <init>(Ljava/lang/String;)V
 .locals 0
 invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
 invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 iput-object p1, p0, Lexample/Model;->text:Ljava/lang/String;
 return-void
.end method
.method public final getText()Ljava/lang/String;
 .locals 0
 iget-object p0, p0, Lexample/Model;->text:Ljava/lang/String;
 return-object p0
.end method
"""


class AppStubGeneratorTest(unittest.TestCase):
    def test_reads_nested_and_array_descriptors_without_losing_dollar_names(self):
        self.assertEqual(stubs.descriptor_types("Ljava/lang/String;[ILexample/Outer$Inner;Z"),
                         ["Ljava/lang/String;", "[I", "Lexample/Outer$Inner;", "Z"])
        self.assertEqual(stubs.java_type("[Lexample/Outer$Inner;"), "example.Outer$Inner[]")

    def test_extracts_constructor_and_getter_contracts(self):
        model = stubs.parse_class(MODEL)
        self.assertEqual(model["descriptor"], "Lexample/Model;")
        self.assertEqual(model["fields"]["text"]["type"], "Ljava/lang/String;")
        constructor = next(m for m in model["methods"] if m["name"] == "<init>")
        self.assertEqual(constructor["parameters"], ["Ljava/lang/String;"])
        self.assertEqual(constructor["assignments"], {"text": 0})
        self.assertEqual(constructor["nonnull"], [0])
        getter = next(m for m in model["methods"] if m["name"] == "getText")
        self.assertEqual(getter["field"], "text")

    def test_generated_model_compiles_and_preserves_constructor_getter_behavior(self):
        import subprocess
        import tempfile
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            package = root / "example"
            package.mkdir()
            source = stubs.model_source(stubs.parse_class(MODEL))
            (package / "Model.java").write_text(source)
            (root / "Check.java").write_text('public class Check { public static void main(String[] args) { if (!new example.Model("kept").getText().equals("kept")) throw new AssertionError(); } }')
            result = subprocess.run(["javac", str(package / "Model.java"), str(root / "Check.java")], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)

            result = subprocess.run(["java", "-cp", str(root), "Check"], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)

    def test_generates_an_actual_consumable_interface_from_selected_descriptor(self):
        import subprocess
        import tempfile
        source = '.class public interface abstract Lexample/Flow;\n.super Ljava/lang/Object;\n.method public abstract emit(Ljava/lang/Object;)Ljava/lang/Object;\n.end method\n'
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / 'example').mkdir()
            (root / 'example/Flow.java').write_text(stubs.abi_source(stubs.parse_class(source), ['emit(Ljava/lang/Object;)Ljava/lang/Object;']))
            (root / 'Check.java').write_text('public class Check implements example.Flow { public Object emit(Object value) { return value; } public static void main(String[] args) { if (!new Check().emit("kept").equals("kept")) throw new AssertionError(); } }')
            result = subprocess.run(['javac', str(root / 'example/Flow.java'), str(root / 'Check.java')], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            result = subprocess.run(['java', '-cp', str(root), 'Check'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)

    def test_missing_selected_abi_method_fails_instead_of_silently_skipping(self):
        with self.assertRaises(ValueError):
            stubs.abi_source(stubs.parse_class(MODEL), ['missing()V'])


if __name__ == "__main__":
    unittest.main()
