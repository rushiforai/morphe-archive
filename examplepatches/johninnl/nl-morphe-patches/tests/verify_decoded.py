"""Check requested patch effects in an independently apktool-decoded APK."""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

ANDROID = "{http://schemas.android.com/apk/res/android}"
APP = "{http://schemas.android.com/apk/res-auto}"


def verify(root: Path, ads: bool, premium: bool) -> None:
    preferences = ET.parse(root / "res/xml/preferences_general.xml").getroot()
    cards = [e for e in preferences.iter() if e.get(ANDROID + "key") == "preference_subscription"]
    assert len(cards) == 1, "Keep the preference object used by Settings setup"
    assert (cards[0].get(APP + "isPreferenceVisible") == "false") == premium, "Premium card visibility"
    for layout, view_id in [("activity_main", "banner_fragment"), ("fragment_weather", "banner1")]:
        doc = ET.parse(root / f"res/layout/{layout}.xml")
        views = [e for e in doc.iter() if e.get(ANDROID + "id") == f"@id/{view_id}"]
        assert len(views) == 1, f"Keep binding target {view_id}"
        assert (views[0].get(ANDROID + "visibility") == "gone") == ads, f"Banner space: {view_id}"
    options = list(root.glob("smali*/com/meteoplaza/android/mpbannerview/MPBannerOptions.smali"))
    assert len(options) == 1
    text = options[0].read_text()
    getter = re.search(r"\.method[^\n]*access\$getEnabled\$cp\(\)Z\n(.*?)\.end method", text, re.S)
    assert getter, "Banner enabled query exists"
    disabled = re.search(r"const(?:/4|/16)?\s+(v\d+), 0x0\s+return \1", getter[1]) is not None
    assert disabled == ads, "Banner loading enable query must return false only with Hide ads"
    decision_count = 0
    for path in root.glob("smali*/*.smali"):
        decision_count += verify_decisions(path.read_text(), ads)
    main = list(root.glob("smali*/org/yoki/android/buienalarm/activity/MainActivity.smali"))
    assert len(main) == 1
    decision_count += verify_decisions(main[0].read_text(), ads)
    assert decision_count == 2, f"Expected both main and weather ad decisions; found {decision_count}"
    print(f"PASS: ads={ads}, premium={premium}; both ad decisions, loader, containers and Settings checked")


def verify_decisions(text: str, ads: bool) -> int:
    count = 0
    for method in re.findall(r"\.method[^\n]*onResume\(\)V\n(.*?)\.end method", text, re.S):
        if "MPBannerOptions;->disableBanners()V" not in method:
            continue
        before_disable = method.split("MPBannerOptions;->disableBanners()V")[0]
        results = list(re.finditer(r"Boolean;->booleanValue\(\)Z\s+move-result ([pv]\d+)(.*?)(?=if-eqz)", before_disable, re.S))
        assert results, "Recognize the existing local ad decision"
        result = results[-1]
        forced = re.search(r"const(?:/4|/16)? " + result[1] + r", 0x1", result[2]) is not None
        assert forced == ads, "Main/weather must take their ad-disabled branches only with Hide ads"
        count += 1
    return count


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("decoded", type=Path)
    parser.add_argument("--ads", action="store_true")
    parser.add_argument("--premium", action="store_true")
    args = parser.parse_args()
    verify(args.decoded, args.ads, args.premium)
