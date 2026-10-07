"""Independent output verification against the clean merged input APK."""
import argparse
import json
from pathlib import Path
import zipfile
from androguard.core.dex import DEX
from androguard.core.axml import AXMLPrinter
from loguru import logger

logger.remove()
HELPER = "Lv5/RailsGoBusUpdate;"
SHOW = ("Lv5/K;", "e", "()V")
LICENSE = ("Lcom/pairip/licensecheck/LicenseClient;", "checkLicense", "(Landroid/content/Context;)V")
ANDROID = "{http://schemas.android.com/apk/res/android}"
ORIGINAL_PACKAGE = "com.waccliu.taiwanrail"


def read_methods(z):
    result = {}
    for n in z.namelist():
        if n.startswith("classes") and n.endswith(".dex"):
            for c in DEX(z.read(n)).get_classes():
                for m in c.get_methods():
                    key = (c.get_name(), m.get_name(), m.get_descriptor().replace(" ", ""))
                    assert key not in result, key
                    result[key] = [(i.get_name(), i.get_output()) for i in m.get_instructions()]
    return result


def main():
    p = argparse.ArgumentParser()
    p.add_argument("before", type=Path)
    p.add_argument("after", type=Path)
    p.add_argument("report", type=Path)
    p.add_argument("--package", default=ORIGINAL_PACKAGE)
    a = p.parse_args()
    with zipfile.ZipFile(a.before) as before, zipfile.ZipFile(a.after) as after:
        assert after.testzip() is None
        old = read_methods(before)
        new = read_methods(after)
        assert set(old) == {k for k in new if k[0] != HELPER}
        changed = [k for k in old if old[k] != new[k]]
        assert set(changed) == {SHOW, LICENSE}, changed
        show = new[SHOW]
        assert [x[0] for x in show[:4]] == ["invoke-static", "move-result", "if-eqz", "return-void"]
        assert HELPER in show[0][1]
        assert show[4:] == old[SHOW]
        assert new[LICENSE][0][0] == "return-void"
        assert new[LICENSE][1:] == old[LICENSE]
        helper = {k: v for k, v in new.items() if k[0] == HELPER}
        assert len(helper) == 3
        assert (HELPER, "<init>", "()V") in helper
        text = "\n".join(out for ins in new.values() for _, out in ins)
        assert "RailsGoTrace" not in text
        body = helper[(HELPER, "tryComplete", "(Lv5/K;)Z")]
        joined = "\n".join(x[1] for x in body)
        for expected in ("ca-app-pub-6118603149023812/5192762441", "ads/df;->i(",
                         "ads/af;->c(", "ads/af;->b(", "Lt0/b;->H(", "Lv5/B;->d(",
                         "WeakHashMap;->containsKey", "WeakHashMap;->put"):
            assert expected in joined, expected
        assert "ads/mf;->b(" not in joined
        assets = [n for n in before.namelist() if n.startswith(("assets/", "lib/")) and not n.endswith("/")]
        for n in assets:
            assert before.read(n) == after.read(n), n
        xml = AXMLPrinter(after.read("AndroidManifest.xml")).get_xml_obj()
        assert xml.attrib["package"] == a.package
        providers = xml.findall(".//provider")
        assert len(providers) == 6
        assert all(e.attrib[ANDROID + "authorities"].startswith(a.package + ".") for e in providers)
        original_xml = AXMLPrinter(before.read("AndroidManifest.xml")).get_xml_obj()
        assert xml.find("application").attrib[ANDROID + "label"] == original_xml.find("application").attrib[ANDROID + "label"]
        names = [e.attrib.get(ANDROID + "name", "") for e in xml.iter()]
        assert names.count(a.package + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION") == 2
        schemes = [e.attrib.get(ANDROID + "scheme") for e in xml.findall(".//data")]
        if a.package == ORIGINAL_PACKAGE:
            # Compare the complete identity-bearing manifest surface, not only prefixes.
            for tag in ("provider", "permission", "uses-permission", "data"):
                original_attributes = [dict(e.attrib) for e in original_xml.findall(".//" + tag)]
                patched_attributes = [dict(e.attrib) for e in xml.findall(".//" + tag)]
                assert original_attributes == patched_attributes, tag
            assert "taiwanrail" in schemes
        else:
            assert ORIGINAL_PACKAGE + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" not in names
            expected_scheme = "taiwanrail-morphe" if a.package == ORIGINAL_PACKAGE + ".morphe" else "taiwanrail-" + a.package.encode().hex()
            assert "taiwanrail" not in schemes and expected_scheme in schemes
    report = {"existing_methods_checked": len(old), "changed_methods": sorted(changed),
              "helper_methods_added": len(helper), "original_show_and_license_code_retained": True,
              "native_and_assets_byte_identical": len(assets),
              "provider_isolation_verified": 6 if a.package != ORIGINAL_PACKAGE else 0,
              "original_manifest_identity_preserved": a.package == ORIGINAL_PACKAGE,
              "diagnostic_exporter_absent": True, "original_app_label_preserved": True, "package": a.package, "android_runtime_verified": False}
    a.report.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report))


if __name__ == "__main__":
    main()
