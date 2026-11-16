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
    assert changed=={"META-INF/MANIFEST.MF","nicoid/helpers.mpe","nicoid/method-delta.dex","nicoid/resources.zip"},changed
    expected=next((line.split('"')[1] for line in (Path(__file__).parent/"build_mpp.py").read_text().splitlines()
                   if line.startswith('VERSION = "')), None)
    assert expected and expected == "2.0.5-dev.5", expected
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
                if not (name=="Le/e/a/LocalPlaylists;" or name.startswith("Le/e/a/LocalPlaylists$") or any(name=="Le/e/a/"+n+";" or name.startswith("Le/e/a/"+n+"$") for n in ("AppSwitchGuard","RetainedPlayback137","PlayerIcons","PlayerTheme","AmbientSettings","MultiTabPlacement","DownloadUi115","DownloadActions116","PlayerDownloads116","DownloadWorker115","NicoliveService")))}
    assert not unexpected, f"Unrelated stable class disappeared: {sorted(unexpected)[:10]}"
    assert "Le/e/a/LocalPlaylists;" in classes
    assert "Le/e/a/LocalPlaylists$Page;" in classes
    assert "Le/e/a/PlaylistGestureRouter;" in classes
    assert "Le/e/a/PlaylistGesturePolicy;" in classes
    assert "Le/e/a/SmoothTabRestore204;" in classes
    assert "Le/e/a/ScrollRestorePolicy204;" in classes
    assert "Le/e/a/ScrollRestorePolicy205;" in classes
    assert "Le/e/a/NicoliveDiagnostics;" in classes
    for added in ("AppBarPlacement202", "AppBarLayoutMath202", "NicoliveAppBarPlacement",
                  "NicolivePopupCorner202", "NicoliveStatSpan202",
                  "AmbientSettings", "AmbientLight", "MultiTabPlacement"):
        assert "Le/e/a/" + added + ";" in classes, "Missing updated helper: " + added
    for added in ("MenuVisible203","FullscreenContinuity203","PlaybackContinuation203","PlaybackContinuation204","PopupFullscreen204","QueueVisibility204","NicoliveFloatingMini204","NicoliveFloatingMini205","MediaSeek205","FullscreenHandoff205","FullscreenHandoff206","RetainedPlayback137","MediaSeek206","PlayerStart206","NicoliveFloatingMini206","FullscreenHandoff208","PlayerStart208","DrawerFront208","NormalGlowLayer208","PlayerStart209","DrawerFront209","FullscreenHandoff209","PlayerStart210","DrawerFront210","FullscreenHandoff210","PlayerStart211","DrawerFront211","FullscreenHandoff211","Mp3Save213","Mp3Transcode213","PlayerStart215","Mp3Save214","Mp3Audio214","DownloadUi115","DownloadActions116","PlayerDownloads116","DownloadWorker115"):
        assert "Le/e/a/"+added+";" in classes, added
    assert "Lnet/sourceforge/lame/mp3/Lame;" in classes, "Missing genuine MP3 encoder"
    assert "META-INF/java-lame-3.98.4-LGPL-3.0.txt" in new.namelist(), "Missing LGPL source license"
    assert "Le/e/a/ExternalBack216;" in classes
    assert "Le/e/a/SettingsSummary216;" in classes
    assert "Le/e/a/SettingsSummary217;" in classes, "Missing final settings installer"
    assert "Le/e/a/ExternalBack218;" in classes, "Missing actual external-link Back policy"
    assert "Le/e/a/AppSwitchGuard;" in classes, "Missing app-switch priority guard"
    assert "Le/e/a/RetainedPlayback137;" in classes
    delta=dex_classes(new.read("nicoid/method-delta.dex"))
    assert "Lcom/sauzask/nicoid/NicoidVideoActivity;" in delta
    assert "Lcom/sauzask/nicoid/NicoidVideoFragment;" in delta
    for fixed in ("RetainedPlayback137","PlayerIcons","PlayerTheme","NicoliveEntry","NicoliveService"):
        assert "Le/e/a/"+fixed+";" in classes, fixed
    for x in ("ThumbnailCorners","NicoliveUi","NicoliveActivity","NicoliveBrowser","NicoliveData","NicoliveService","NicoliveCatalog","NicoliveSession"):
        assert "Le/e/a/"+x+";" in classes, x
    print(f"PASS: base {len(before)} classes, {len(removed)} replaced playlist classes, candidate {len(classes)} unique classes")
    print(f"PASS: version, resources, manifest & helper class checks")
    print("NOT TESTED: Morphe applying to original APK; runtime playback on Android")
print("MPP SHA-256",hashlib.sha256(candidate_path.read_bytes()).hexdigest())
