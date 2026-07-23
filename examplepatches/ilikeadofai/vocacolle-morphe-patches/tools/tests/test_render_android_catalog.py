import csv
import importlib.util
import io
import pathlib
import unittest
import xml.etree.ElementTree as ET


SCRIPT = pathlib.Path(__file__).parents[1] / "render_android_catalog.py"
SPEC = importlib.util.spec_from_file_location("render_android_catalog", SCRIPT)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"Cannot load {SCRIPT}")
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class AndroidCatalogRendererTest(unittest.TestCase):
    def rows(self):
        source = io.StringIO(
            "resource_id,resource_type,key,item_qualifier,source,source_language,"
            "format_tokens,formatted,markup,en_markup,screen_hint,source_kind,en,en_status,reviewer,notes\n"
            "1,string,greeting,,設定,ja,,false,,,app,resource,Settings,machine_verified,x,x\n"
            "2,plurals,songs,one,%d曲,ja,%d,,,,app,resource,%d song,machine_verified,x,x\n"
            "2,plurals,songs,other,%d曲,ja,%d,,,,app,resource,%d songs,machine_verified,x,x\n"
            "3,string-array,speeds,0,通常,ja,,,,,app,resource,Normal,machine_verified,x,x\n"
        )
        return list(csv.DictReader(source))

    def test_renders_strings_plurals_and_arrays(self):
        rendered = MODULE.render_resources(self.rows(), "en")

        strings = ET.fromstring(rendered["strings.xml"])
        self.assertEqual("Settings", strings.findall("string")[0].text)
        self.assertEqual("false", strings.findall("string")[0].attrib["formatted"])

        plurals = ET.fromstring(rendered["plurals.xml"])
        self.assertEqual(["one", "other"], [item.attrib["quantity"] for item in plurals.findall("plurals/item")])

        arrays = ET.fromstring(rendered["arrays.xml"])
        self.assertEqual("Normal", arrays.findall("string-array/item")[0].text)

    def test_excludes_launcher_app_name_from_locale_resources(self):
        rows = self.rows() + [{
            "resource_type": "string",
            "key": "app_name",
            "item_qualifier": "",
            "en": "VocaColle",
        }]
        rendered = MODULE.render_resources(rows, "en")
        names = [element.attrib["name"] for element in ET.fromstring(rendered["strings.xml"]).findall("string")]
        self.assertNotIn("app_name", names)

    def test_rejects_duplicate_resource_identity(self):
        rows = self.rows()
        rows.append(dict(rows[0]))
        with self.assertRaisesRegex(ValueError, "duplicate"):
            MODULE.render_resources(rows, "en")

    def test_markup_at_start_does_not_gain_indentation_whitespace(self):
        row = {
            "resource_id": "4",
            "resource_type": "string",
            "key": "limit",
            "item_qualifier": "",
            "source": "上限です",
            "source_language": "ja",
            "format_tokens": "",
            "markup": "b:0,4",
            "en_markup": "<b>Limit reached.</b> Upgrade to continue.",
            "screen_hint": "dialog",
            "source_kind": "resource",
            "en": "Limit reached. Upgrade to continue.",
            "en_status": "machine_verified",
            "reviewer": "x",
            "notes": "x",
        }
        rendered = MODULE.render_resources([row], "en")
        element = ET.fromstring(rendered["strings.xml"]).findall("string")[0]
        self.assertEqual("Limit reached. Upgrade to continue.", "".join(element.itertext()))


if __name__ == "__main__":
    unittest.main()
