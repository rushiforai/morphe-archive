"""Verify Nikkei Asia XAPK output: article-access edits, paywall removal, labels, payloads."""
import argparse
import hashlib
import io
from pathlib import Path
import re
import zipfile

MODERN = "assets/public/assets/index-9f8177ed.js"
LEGACY = "assets/public/assets/index-legacy-a206fc4c.js"
BASE_APK = "com.nikkei.asia.apk"

STOCK_SHA256 = {
    MODERN: "d168012c51dcc4c4577fc51b30c2ef603851fba290ac549f17f3d294b650e092",
    LEGACY: "9bfa49f529150862c11fef5fabcf3ba6f25b0cc6eec324fbbcf8bab4cf009d05",
}
LOCKED = "{access:!1}"
UNLOCKED = "{access:!0}"
PAYWALL_GUARD_MODERN = ("_.useEffect(d,f),n)return null", "_.useEffect(d,f),!0)return null")
PAYWALL_GUARD_LEGACY = ("wv.useEffect(t,n),a)return null", "wv.useEffect(t,n),!0)return null")
UPDATE_PROVIDER = (":{updateProviderEnabled:!0,platform:", ":{updateProviderEnabled:!1,platform:")
ACCOUNT_HEADER = '{children:"Account"}'
ACCOUNT_BRANDED = '{children:"Account Premium Unlocked by BadFella"}'
SUBSCRIBE_ROW = 'children:"Subscribe"'
SUBSCRIBE_LABEL = 'children:"Patched by BadFella"'

BUNDLE_EDITS = {
    MODERN: [
        (LOCKED, UNLOCKED),
        PAYWALL_GUARD_MODERN,
        UPDATE_PROVIDER,
        (ACCOUNT_HEADER, ACCOUNT_BRANDED),
        (SUBSCRIBE_ROW, SUBSCRIBE_LABEL),
    ],
    LEGACY: [
        (LOCKED, UNLOCKED),
        PAYWALL_GUARD_LEGACY,
        UPDATE_PROVIDER,
        (SUBSCRIBE_ROW, SUBSCRIBE_LABEL),
    ],
}


def check_bundles(base, patched):
    for name in (MODERN, LEGACY):
        before = base.read(name)
        after = patched.read(name)
        assert hashlib.sha256(before).hexdigest() == STOCK_SHA256[name], f"Unreviewed stock bundle: {name}"
        stock_text = before.decode("utf-8")
        patched_text = after.decode("utf-8")
        # Descriptive marker checks first, then the strict exact-reconstruction comparison.
        assert patched_text.count(LOCKED) == 0 and patched_text.count(UNLOCKED) == 5, (
            f"Article access edit missing: {name}")
        assert patched_text.count(",!0)return null") == 1, f"Paywall overlay not disabled: {name}"
        assert patched_text.count(SUBSCRIBE_LABEL) == 1 and SUBSCRIBE_ROW not in patched_text, (
            f"Subscribe row label missing: {name}")
        # Every edit must apply to stock exactly once, and the result must reproduce the
        # patched bundle byte for byte, so any additional difference fails the check.
        expected = stock_text
        for stock, replacement in BUNDLE_EDITS[name]:
            assert stock_text.count(stock) == 1, (
                f"Unreviewed stock bundle {name}: anchor {stock[:48]!r} count {stock_text.count(stock)}")
            expected = expected.replace(stock, replacement, 1)
        assert patched_text == expected, f"Unreviewed change in {name}"
    branded = patched.read(MODERN).decode("utf-8")
    assert branded.count(ACCOUNT_BRANDED) == 1, "Account label missing from the modern bundle"
    dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
    assert dex == {n for n in patched.namelist() if re.fullmatch(r"classes\d*\.dex", n)}, (
        "DEX inventory changed")


def check_payloads(bundle, output, patched, merged):
    changed = {MODERN, LEGACY}
    # Morphe rebuilds the manifest, resource table and res/ tree when it merges a XAPK into a
    # standalone APK. Compare the payloads the patch must never touch instead. In split mode
    # the payload entries live inside the inner base APK, not at the container root.
    rebuilt = {"AndroidManifest.xml", "resources.arsc"}
    with zipfile.ZipFile(io.BytesIO(bundle.read(BASE_APK))) as base:
        for name in base.namelist():
            if (name in changed or name in rebuilt or name.startswith("res/")
                    or name.startswith("META-INF/") or name.endswith("/")):
                continue
            assert name in patched.namelist(), "Original payload removed: " + name
            assert base.read(name) == patched.read(name), "Original payload changed: " + name
    # Native libraries ship in the ABI split; a merged APK carries them directly.
    if merged:
        with zipfile.ZipFile(io.BytesIO(bundle.read("config.arm64_v8a.apk"))) as split:
            expected = [(i.filename, split.read(i)) for i in split.infolist()
                        if i.filename.startswith("lib/")]
        natives = {n for n in output.namelist() if n.startswith("lib/") and not n.endswith("/")}
        assert natives == {name for name, _ in expected}, "Native payload set changed"
        for name, data in expected:
            assert output.read(name) == data, "Native payload changed: " + name
    else:
        splits = [n for n in bundle.namelist() if n.endswith(".apk") and n != BASE_APK]
        assert set(splits) == {n for n in output.namelist() if n.endswith(".apk") and n != BASE_APK}, (
            "Split APK set changed")
        for name in splits:
            before, after = bundle.read(name), output.read(name)
            assert before == after, "Split payload changed: " + name
            with zipfile.ZipFile(io.BytesIO(before)) as split:
                expected = {i.filename for i in split.infolist() if i.filename.startswith("lib/")}
            with zipfile.ZipFile(io.BytesIO(after)) as split:
                actual = {i.filename for i in split.infolist() if i.filename.startswith("lib/")}
            assert expected == actual, "Native payload changed: " + name


def verify(args):
    with zipfile.ZipFile(args.stock) as bundle, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        # Morphe writes a standalone merged APK; a XAPK output keeps its splits. Accept either,
        # but always compare bundles inside an APK payload rather than at the archive root.
        merged = BASE_APK not in output.namelist()
        inner = zipfile.ZipFile(io.BytesIO(output.read(BASE_APK))) if not merged else output
        try:
            with zipfile.ZipFile(io.BytesIO(bundle.read(BASE_APK))) as base:
                check_bundles(base, inner)
            check_payloads(bundle, output, inner, merged)
        finally:
            if not merged:
                inner.close()
    print("PASS: article access granted, paywall overlay and web-bundle updater disabled, "
          "account and subscribe labels applied, no other bundle, asset, DEX, split or native "
          "payload changed")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    verify(parser.parse_args())
