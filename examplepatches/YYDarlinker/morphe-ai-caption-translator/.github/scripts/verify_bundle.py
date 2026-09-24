"""Validate the actual installable asset, not just the source inventory."""
import hashlib, json, sys, zipfile, io
from pathlib import Path
v=sys.argv[1]
p=Path(f"patches/build/libs/patches-{v}.mpp")
with zipfile.ZipFile(p) as z:
    assert z.testzip() is None, "corrupt MPP"
    assert "classes.dex" in z.namelist(), "Manager requires root Android DEX"
    assert "extensions/extension.mpe" in z.namelist(), "missing extension"
    assert not any(n.startswith("validation/") for n in z.namelist()), "test harness leaked into bundle"
    mf=z.read("META-INF/MANIFEST.MF").decode().replace("\r\n ","").replace("\n ","")
    assert "YYDarlinker/morphe-ai-caption-translator" in mf, "wrong repository identity"
    assert "YYDarlinker/morphe-ai-captions\n" not in mf
    assert f"Version: {v}\n" in mf.replace("\r\n", "\n"), "wrong version"
    dex=z.read("extensions/extension.mpe")
    assert dex.startswith(b"dex\n"), "Morphe extension must be raw DEX"
    assert int.from_bytes(dex[32:36],"little")==len(dex), "extension DEX length mismatch"
    assert b"AnchoredCaptionPlan" in dex and b"NativeCaptionBridge" in dex
    assert b"SemanticLedgerCaptionController" not in dex and b"LocalDisplaySliceFallback" not in dex
    if tuple(map(int,v.split("-")[0].split("."))) >= (1,2,0):
        assert b"RememberedCaptionSelection" in dex and b"CaptionQuickToggle" in dex
        locales=z.read("captionlocales/index.txt").decode().splitlines()
        assert len(locales)>=14 and len(locales)==len(set(locales))
        for locale in locales:
            assert f"captionlocales/{locale}/caption_addon_strings.xml" in z.namelist()

print(json.dumps({"asset":p.name,"bytes":p.stat().st_size,"sha256":hashlib.sha256(p.read_bytes()).hexdigest(),"root_dex":True,"extension":True}))
