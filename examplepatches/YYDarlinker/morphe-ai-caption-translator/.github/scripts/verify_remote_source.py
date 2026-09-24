"""Anonymous end-to-end source verification: branch JSON -> asset -> DEX and identity."""
import hashlib, io, json, os, re, sys, time, urllib.request, zipfile
from pathlib import Path
from datetime import datetime
repo="YYDarlinker/morphe-ai-caption-translator"
branch=sys.argv[1] if len(sys.argv)>1 else "main"
expected=sys.argv[2] if len(sys.argv)>2 else None
out=Path(sys.argv[3]) if len(sys.argv)>3 else None
base=f"https://raw.githubusercontent.com/{repo}/{branch}"
def get(url):
    # No Authorization headers, cookies or local GitHub credentials.
    req=urllib.request.Request(url,headers={"User-Agent":"Anchored-Captions-Source-Check","Cache-Control":"no-cache"})
    with urllib.request.urlopen(req,timeout=120) as response:
        assert response.status==200
        return response.read()
for attempt in range(6):
    try:
        manifest=json.loads(get(base+"/patches-bundle.json?check="+str(time.time_ns())))
        if expected and manifest["version"]!=expected: raise ValueError("raw manifest not updated yet")
        listing=json.loads(get(base+"/patches-list.json?check="+str(time.time_ns())))
        if listing["version"]!=manifest["version"]: raise ValueError("raw list and manifest CDN versions not yet coherent")
        break
    except Exception:
        if attempt==5: raise
        time.sleep(10)
v=manifest["version"]
assert re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,9})?",manifest["created_at"])
assert datetime.fromisoformat(manifest["created_at"]).tzinfo is None
assert manifest["download_url"]==f"https://github.com/{repo}/releases/download/v{v}/patches-{v}.mpp"
expected_names={"AI caption translator"}
if tuple(map(int,v.split("-")[0].split("."))) >= (1,2,0):
    expected_names.update({"Add Simplified Chinese to auto-translate","Remember caption selection"})
assert listing["version"]==v and {p["name"] for p in listing["patches"]}==expected_names
assert len(listing["patches"])==len(expected_names)
changelog=get(base+"/CHANGELOG.md?check="+str(time.time_ns())).decode("utf-8")
heading=re.search(r"^## \[([^\]]+)\]",changelog,re.MULTILINE)
assert heading and heading.group(1)==v, "remote CHANGELOG latest version differs from manifest"
assert "`n" not in manifest["description"], "invalid description newline escapes"
body=get(manifest["download_url"])
if os.environ.get("EXPECTED_ASSET_SHA256"):
    assert hashlib.sha256(body).hexdigest()==os.environ["EXPECTED_ASSET_SHA256"], "published asset differs from final CI bundle"
with zipfile.ZipFile(io.BytesIO(body)) as z:
    assert z.testzip() is None
    assert "classes.dex" in z.namelist() and z.read("classes.dex").startswith(b"dex\n")
    mf=z.read("META-INF/MANIFEST.MF").decode().replace("\r\n ","").replace("\n ","")
    assert f"Version: {v}" in mf and repo in mf
    assert "Name: Anchored AI Captions" in mf
    dex=z.read("extensions/extension.mpe")
    assert dex.startswith(b"dex\n") and int.from_bytes(dex[32:36],"little")==len(dex)
    assert b"AnchoredCaptionPlan" in dex and b"NativeCaptionBridge" in dex
    assert b"SemanticLedgerCaptionController" not in dex and b"LocalDisplaySliceFallback" not in dex

report={"branch":branch,"version":v,"manifest_http":200,"asset_http":200,"patch_count":len(listing["patches"]),"bytes":len(body),"sha256":hashlib.sha256(body).hexdigest(),"manager_dto_valid":True,"root_dex":True,"extension_valid":True,"legacy_engines_absent":True}
if out:
    out.mkdir(parents=True,exist_ok=True)
    (out/f"patches-{v}.mpp").write_bytes(body)
    (out/f"source-verification-{branch}.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8")
print(json.dumps(report,indent=2))
