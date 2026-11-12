"""Check the candidate and Morphe output against the v1.11.1 baseline."""
from collections import Counter
import io
from pathlib import Path
import re
import struct
import sys
from zipfile import ZipFile

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "tests"))
from VerifyManifest import elements, verify


def classes(dex):
    def word(offset):
        return struct.unpack_from("<I", dex, offset)[0]

    count, table = word(96), word(100)
    strings, types = word(60), word(68)
    result = []
    for index in range(count):
        descriptor = word(types + 4 * word(table + 32 * index))
        offset = word(strings + 4 * descriptor)
        while dex[offset] & 0x80:
            offset += 1
        offset += 1
        result.append(dex[offset:dex.index(b"\0", offset)])
    return result


def names(manifest):
    namespace = "http://schemas.android.com/apk/res/android"
    return [(tag, {key: value for (ns, key), value in attrs.items() if ns == namespace})
            for tag, attrs in elements(manifest)]


def verify_live_manifest(manifest):
    verify(manifest)
    nodes = names(manifest)
    for kind, component, exported in (("activity", "NicoliveActivity", 1), ("service", "NicoliveService", 0)):
        matches = [attrs for tag, attrs in nodes if tag == kind and attrs.get("name") == "e.e.a." + component]
        assert len(matches) == 1 and matches[0]["exported"] == exported, component
        if kind == "service":
            assert matches[0]["foregroundServiceType"] == 2
    for suffix in ("FOREGROUND_SERVICE", "FOREGROUND_SERVICE_MEDIA_PLAYBACK"):
        assert sum(tag == "uses-permission" and attrs.get("name") == "android.permission." + suffix
                   for tag, attrs in nodes) == 1, suffix


with ZipFile(sys.argv[1]) as base, ZipFile(sys.argv[2]) as candidate, ZipFile(sys.argv[3]) as apk:
    assert candidate.testzip() is None and apk.testzip() is None
    changed = {name for name in base.namelist() if base.read(name) != candidate.read(name)}
    assert changed == {"META-INF/MANIFEST.MF", "nicoid/helpers.mpe", "nicoid/resources.zip"}, changed
    version = next(line.split('"')[1] for line in Path(__file__).with_name("build_mpp.py").read_text().splitlines()
                   if line.startswith('VERSION = "'))
    assert f"Version: {version}\r\n".encode() in candidate.read("META-INF/MANIFEST.MF")
    with ZipFile(io.BytesIO(base.read("nicoid/resources.zip"))) as old, \
            ZipFile(io.BytesIO(candidate.read("nicoid/resources.zip"))) as new:
        assert old.namelist() == new.namelist()
        unchanged = [name for name in old.namelist() if name != "AndroidManifest.xml"]
        assert all(old.read(name) == new.read(name) for name in unchanged)
        verify_live_manifest(new.read("AndroidManifest.xml"))
    verify_live_manifest(apk.read("AndroidManifest.xml"))
    stable = set(classes(base.read("nicoid/helpers.mpe")))
    helper = classes(candidate.read("nicoid/helpers.mpe"))
    helper_set = set(helper)
    missing = stable - helper_set
    assert all(name.startswith(b"Le/e/a/LocalPlaylists$") for name in missing), sorted(missing)
    assert {b"Le/e/a/LocalPlaylists;",b"Le/e/a/LocalPlaylists$Page;"} <= helper_set
    assert len(helper)==len(helper_set)
    assert sum(name.startswith(b"Le/e/a/Nicolive") and b"$" not in name for name in helper) >= 12
    applied = Counter(name for path in apk.namelist() if re.fullmatch(r"classes\d*\.dex", path)
                      for name in classes(apk.read(path)))
    assert all(count == 1 for count in applied.values())
    assert set(helper) <= applied.keys()
    print(f"Stable helpers preserved: {len(stable)}")
    print(f"New helpers and dependencies: {len(helper) - len(stable)}")
    print(f"Applied APK classes: {len(applied)}, duplicate classes: 0")
    print(f"Unchanged resource entries: {len(unchanged)}")
