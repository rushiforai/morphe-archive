"""Validate one explicit installable asset. Positional VERSION keeps strict release use."""
import argparse
import hashlib
import json
import re
import struct
import zipfile
import zlib
from pathlib import Path


def dex_strings(data):
    assert data.startswith(b"dex\n") and len(data) >= 112, "invalid DEX header"
    assert int.from_bytes(data[32:36], "little") == len(data), "DEX length mismatch"
    assert data[12:32] == hashlib.sha1(data[32:]).digest(), "DEX signature mismatch"
    assert int.from_bytes(data[8:12], "little") == zlib.adler32(data[12:]), "DEX checksum mismatch"
    count, offset = struct.unpack_from("<II", data, 56)
    strings = set()
    for i in range(count):
        at = struct.unpack_from("<I", data, offset + 4 * i)[0]
        while data[at] & 128:
            at += 1
        at += 1
        strings.add(data[at:data.index(b"\0", at)].decode("utf-8", "replace"))
    return strings


def inspect_bundle(path, version, build_id, mode="release", mpe=None):
    if mode == "release":
        assert build_id == f"release-{version}", "release requires release-<version> build ID"
    with zipfile.ZipFile(path) as z:
        assert z.testzip() is None, "corrupt MPP"
        names = z.namelist()
        assert len(names) == len(set(names)), "duplicate MPP entries"
        assert "classes.dex" in names, "Manager requires root Android DEX"
        assert "extensions/extension.mpe" in names, "missing extension"
        assert len([n for n in names if n.endswith('.mpe')]) == 1, "expected one MPE"
        assert not any(n.startswith("validation/") for n in names), "test harness leaked into bundle"
        mf = z.read("META-INF/MANIFEST.MF").decode().replace("\r\n", "\n").replace("\n ", "")
        assert "YYDarlinker/morphe-ai-caption-translator" in mf, "wrong repository identity"
        assert "YYDarlinker/morphe-ai-captions\n" not in mf, "old repository identity"
        assert f"Version: {version}\n" in mf, "wrong version"
        assert "Patcher-Version: 2.0.0\n" in mf, "wrong Patcher version"
        root_dex = z.read("classes.dex")
        dex = z.read("extensions/extension.mpe")
        root_strings = dex_strings(root_dex)
        strings = dex_strings(dex)
        assert build_id in strings, f"expected build ID missing: {build_id}"
        if mode == "release":
            assert not any(s.startswith("local-") for s in strings), "local build id leaked into release extension"
        assert b"NativeCaptionBridge" in dex
        release = tuple(map(int, version.split("-")[0].split(".")))
        if release >= (1, 5, 5):
            assert b"RebuildCueProjection" in dex, "cue projection missing"
            assert b"REBUILD_CUE_PROJECTION" in dex, "cue projection diagnostics missing"
            assert b"RememberedCaptionSelection" not in dex, "removed language memory leaked"
            assert b"CaptionTargetPolicy" not in dex, "removed target policy leaked"
            assert b"Remember caption selection" not in root_dex, "removed public patch leaked"
        if release >= (1, 3, 5):
            assert b"RebuildController" in dex and b"CaptionDiagnosticArchive" in dex
        else:
            assert b"AnchoredCaptionPlan" in dex
        assert b"SemanticLedgerCaptionController" not in dex and b"LocalDisplaySliceFallback" not in dex
        for s in strings | root_strings:
            assert not re.search(r"^L(?:validation/|org/(?:robolectric|junit)/)|(?:IntegrationTest|LiveTest|UiPreviewActivity);$", s), f"test/preview class leaked: {s}"
        locales = z.read("captionlocales/index.txt").decode().splitlines()
        assert len(locales) == 14 and len(set(locales)) == 14, "expected 14 unique locales"
        for locale in locales:
            assert f"captionlocales/{locale}/caption_addon_strings.xml" in names
        embedded_hash = hashlib.sha256(dex).hexdigest()
        if mpe is not None:
            assert mpe.read_bytes() == dex, "embedded MPE differs from specified standalone MPE"
    return dict(path=str(path.resolve()), version=version, build_id=build_id, mode=mode,
                bytes=path.stat().st_size, sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                root_dex=True, extension=True, locales=len(locales), embedded_mpe_sha256=embedded_hash,
                standalone_mpe=str(mpe.resolve()) if mpe else None,
                embedded_mpe_equal_to_standalone=True if mpe else None)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("version", nargs="?", help="legacy strict release version")
    p.add_argument("--version", dest="expected_version")
    p.add_argument("--build-id")
    p.add_argument("--mode", choices=("candidate", "release"), default="release")
    p.add_argument("--mpp", type=Path)
    p.add_argument("--mpe", type=Path)
    p.add_argument("--output", type=Path)
    a = p.parse_args()
    version = a.expected_version or a.version
    if not version:
        p.error("expected --version or positional release version")
    if a.mode == "candidate" and (not a.mpp or not a.mpe or not a.build_id):
        p.error("candidate requires explicit --mpp, --mpe and --build-id")
    path = a.mpp or Path(f"build/n39/gradle/patches/libs/patches-{version}.mpp")
    try:
        result = inspect_bundle(path, version, a.build_id or f"release-{version}", a.mode, a.mpe)
    except (AssertionError, OSError, ValueError, zipfile.BadZipFile) as exc:
        result = dict(errors=[str(exc)], path=str(path), mode=a.mode)
    if a.output:
        a.output.parent.mkdir(parents=True, exist_ok=True)
        a.output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result))
    return bool(result.get("errors"))


if __name__ == "__main__":
    raise SystemExit(main())
