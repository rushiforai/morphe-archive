"""Verify source-only MPP against the known stable release (not APK installation)."""
from pathlib import Path
from zipfile import ZipFile
import hashlib,io,struct,sys

base_path,candidate_path=map(Path,sys.argv[1:3])
def dex_classes(blob):
    u32=lambda pos: struct.unpack_from("<I",blob,pos)[0]
    number, table=u32(96),u32(100)
    str_start,ty_start=u32(60),u32(68)
    names=[]
    for i in range(number):
        typ=u32(table+32*i)
        at=u32(str_start+4*u32(ty_start+4*typ))
        while blob[at]&128: at+=1
        at+=1
        names.append(blob[at:blob.index(b"\0",at)].decode())
    return names
with ZipFile(base_path) as base,ZipFile(candidate_path) as new:
    assert base.testzip() is None and new.testzip() is None
    changed={k for k in base.namelist() if base.read(k)!=new.read(k)}
    assert changed=={"META-INF/MANIFEST.MF","nicoid/helpers.mpe","nicoid/resources.zip"},changed
    expected=next((line.split('"')[1] for line in (Path(__file__).parent/"build_mpp.py").read_text().splitlines()
                   if line.startswith('VERSION = "')), None)
    assert expected and expected == "2.0.1-dev.6", expected
    if b"Version: 2.0.0\r\n" in new.read("META-INF/MANIFEST.MF"):
        expected = "2.0.0"
    assert b"Version: "+expected.encode()+bytes((13,10)) in new.read("META-INF/MANIFEST.MF")
    with ZipFile(io.BytesIO(base.read("nicoid/resources.zip"))) as original,ZipFile(io.BytesIO(new.read("nicoid/resources.zip"))) as updated:
        assert original.namelist()==updated.namelist()
        assert all(original.read(k)==updated.read(k) for k in original.namelist() if k!="AndroidManifest.xml")
        assert original.read("AndroidManifest.xml")!=updated.read("AndroidManifest.xml")
        manifest=updated.read("AndroidManifest.xml")
        for name in ("NicoliveActivity","NicoliveService"):
            assert name.encode("utf-16le") in manifest or name.encode("utf-8") in manifest, name
    before=set(dex_classes(base.read("nicoid/helpers.mpe")))
    classes=dex_classes(new.read("nicoid/helpers.mpe"))
    assert len(classes)==len(set(classes)), "Duplicate helper class"
    # The previous LocalPlaylists family (including obsolete compiler-generated
    # lambda classes) is deliberately replaced as a whole. No unrelated stable
    # helper is allowed to disappear.
    removed=before-set(classes)
    unexpected={name for name in removed
                if not (name=="Le/e/a/LocalPlaylists;" or name.startswith("Le/e/a/LocalPlaylists$") or any(name=="Le/e/a/"+n+";" or name.startswith("Le/e/a/"+n+"$") for n in ("RetainedPlayback137","PlayerIcons","PlayerTheme")))}
    assert not unexpected, f"Unrelated stable class disappeared: {sorted(unexpected)[:10]}"
    assert "Le/e/a/LocalPlaylists;" in classes
    assert "Le/e/a/LocalPlaylists$Page;" in classes
    assert "Le/e/a/PlaylistGestureRouter;" in classes
    assert "Le/e/a/PlaylistGesturePolicy;" in classes
    assert "Le/e/a/SmoothTabRestore204;" in classes
    assert "Le/e/a/ScrollRestorePolicy204;" in classes
    assert "Le/e/a/ScrollRestorePolicy205;" in classes
    for fixed in ("RetainedPlayback137","PlayerIcons","PlayerTheme","NicoliveEntry","NicoliveService"):
        assert "Le/e/a/"+fixed+";" in classes, fixed
    for x in ("ThumbnailCorners","NicoliveUi","NicoliveActivity","NicoliveBrowser","NicoliveData","NicoliveService","NicoliveCatalog","NicoliveSession"):
        assert "Le/e/a/"+x+";" in classes, x
    print(f"PASS: base {len(before)} classes, {len(removed)} replaced playlist classes, candidate {len(classes)} unique classes")
    print(f"PASS: version, resources, manifest & helper class checks")
    print("NOT TESTED: Morphe applying to original APK; runtime playback on Android")
print("MPP SHA-256",hashlib.sha256(candidate_path.read_bytes()).hexdigest())
