#!/usr/bin/env python3
"""Check observable Twitch resources; use stock as the negative control."""
import argparse
from pathlib import Path
import xml.etree.ElementTree as ET

A = "{http://schemas.android.com/apk/res/android}"
ORIGINAL = "tv.twitch.android.app"
TRACKING = {"com.google.android.gms.permission.AD_ID",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"}


def verify(root, stock, *, label=None, package=None, privacy=False, icon=False, settings=False):
    manifest = ET.parse(root / "AndroidManifest.xml").getroot()
    app = manifest.find("application")
    original = ET.parse(stock / "AndroidManifest.xml").getroot()
    original_app = original.find("application")
    if privacy:
        actual = {e.get(A + "name") for e in manifest.findall("uses-permission")}
        expected = {e.get(A + "name") for e in original.findall("uses-permission")} - TRACKING
        if package:
            expected = {p.replace(ORIGINAL + ".", package + ".") for p in expected}
        assert actual == expected, f"Unexpected permission changes: {actual ^ expected}"
    if label is not None:
        labels = [e.text for e in ET.parse(root / "res/values/strings.xml").getroot()
                  if e.get("name") == "app_name"]
        assert labels == [label], f"Wrong app label: {labels}"
        assert app.get(A + "label") == "@string/app_name"
    if package:
        assert manifest.get("package") == package, "Package was not changed"
        before = {e.get(A + "name"): e for e in original_app.findall("provider")}
        after = {e.get(A + "name"): e for e in app.findall("provider")}
        assert len(after) == 9 and before.keys() == after.keys(), "Provider classes changed"
        for name, old in before.items():
            new = after[name]
            authority = old.get(A + "authorities").replace(ORIGINAL, package)
            assert new.get(A + "authorities") == authority, f"Authority not renamed: {name}"
            for attr in ("exported", "grantUriPermissions", "permission", "readPermission", "writePermission"):
                assert new.get(A + attr) == old.get(A + attr), f"Provider protection changed: {name}/{attr}"
        assert app.get(A + "name") == "tv.twitch.android.app.consumer.TwitchApplication"
        assert any(e.get(A + "name") == package + ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
                   and e.get(A + "protectionLevel") == "signature" for e in manifest.findall("permission"))
        auth_hosts = [e.get(A + "host") for e in app.findall(".//data") if e.get(A + "scheme") == "amzn"]
        assert auth_hosts == [package], "Amazon auth callback still targets stock package"
    if icon:
        assert app.get(A + "icon") == app.get(A + "roundIcon") == "@mipmap/lurk_launcher"
        adaptive = ET.parse(root / "res/mipmap-anydpi-v26/lurk_launcher.xml").getroot()
        for layer in ("background", "foreground", "monochrome"):
            node = adaptive.find(layer)
            assert node is not None, f"Missing adaptive icon {layer}"
            ref = node.get(A + "drawable")
            assert ref.startswith("@drawable/")
            assert (root / "res/drawable" / (ref.split("/")[1] + ".xml")).is_file()
        foreground = ET.parse(root / "res/drawable/lurk_launcher_foreground.xml").getroot()
        colors = {e.get(A + "fillColor", "").lower() for e in foreground.iter("path")}
        assert colors == {"#9146ff"}, f"Wrong Twitch icon color: {colors}"
    if settings:
        activity = "io.github.jordanwoodson.extension.shared.settings.SettingsActivity"
        entries = [e for e in app.findall("activity") if e.get(A + "name") == activity]
        assert len(entries) == 1 and entries[0].get(A + "exported") == "false"
        assert entries[0].find("intent-filter") is None, "The settings activity has an intent filter"
        # Its one way in from outside: the alias App info opens, for APPLICATION_PREFERENCES only.
        aliases = [e for e in app.findall("activity-alias") if e.get(A + "targetActivity") == activity]
        assert len(aliases) == 1 and aliases[0].get(A + "exported") == "true", "Missing App info alias"
        filters = aliases[0].findall("intent-filter")
        assert len(filters) == 1 and \
            [e.get(A + "name") for e in filters[0].findall("action")] == ["android.intent.action.APPLICATION_PREFERENCES"] and \
            [e.get(A + "name") for e in filters[0].findall("category")] == ["android.intent.category.DEFAULT"] and \
            filters[0].find("data") is None, "The App info alias answers more than APPLICATION_PREFERENCES"
        assert aliases[0].get(A + "permission") is None
        children = list(app)
        assert children.index(aliases[0]) > children.index(entries[0]), "The alias comes before its target"


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("decoded", type=Path)
    parser.add_argument("stock", type=Path)
    parser.add_argument("--label")
    parser.add_argument("--package")
    for flag in ("privacy", "icon", "settings"):
        parser.add_argument("--" + flag, action="store_true")
    args = vars(parser.parse_args())
    verify(args.pop("decoded"), args.pop("stock"), **args)
    print("PASS Twitch resource expectations")
