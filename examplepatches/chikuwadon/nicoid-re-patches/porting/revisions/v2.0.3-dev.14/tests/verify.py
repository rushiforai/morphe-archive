"""Regression gates for v2.0.3-dev.14 download density and size optimization."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev14patch",ROOT/"patch_217.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)

with tempfile.TemporaryDirectory() as tmp:
    dest=Path(tmp)/"e/e/a";dest.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    ui=(dest/"DownloadUi115.java").read_text(encoding="utf-8")
    assert '"（推定）"' not in ui
    assert '" / 約"+DownloadJobs115.format' in ui
    assert 'Math.ceil(r.bytes*100d/r.percent)' in ui
    assert 'row.setMinimumHeight(PanelUi.dp(context,56))' in ui
    assert 'row.setPadding(horizontal,vertical,horizontal,vertical)' in ui
    assert 'heading.setPadding(0,0,0,0)' in ui
    assert 'details.setPadding(0,PanelUi.dp(context,3),0,0)' in ui
    assert 'row.addView(p,progressSize)' in ui
    assert 'getChildAt(3)' not in ui
    assert 'oldCapacity' not in ui
    assert 'long renderedRevision=-1' in ui
    assert 'if(mode==0)update()' in ui
    assert 'if(current!=renderedRevision)update()' in ui
    assert 'if(mode==1&&SystemClock.elapsedRealtime()-lastScan>=5000)reload()' in ui
    assert 'synchronized(DownloadJobs115.class){renderedRevision=DownloadJobs115.revision;}' in ui
    assert 'Mp3Save214.chooseFormat(a,id,title)' in ui
    assert 'Mp3Save214.isMp3(r.job)?"MP3":"MP4"' in ui
    assert "MP3を共有" in ui
    service=(dest/"NicoliveService.java").read_text()
    assert 'void requestArtwork(' in service
    assert 'void cornerResizePopup(' in service
    assert 'normalEdgeLimits[3]=symmetric' in (dest/"AmbientLight.java").read_text()

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.14"' in builder
assert "from patch_217 import OVERRIDES, stage" in builder
assert 'with ZipFile(args.output, "w", ZIP_DEFLATED, compresslevel=9) as output:' in builder
assert 'build_pinned_java_lame(work)' in builder
assert 'nicoid_native_mp4_fallback213' not in builder
assert 'DownloadUi115$Manager.smali' not in builder
assert (ROOT/"MergeLiveDex.java").read_text() == (ROOT.parent/"v2.0.3-dev.13/MergeLiveDex.java").read_text()

print("PASS: compact ListView row uses only three children and 56dp minimum target")
print("PASS: approximate total has 'about' prefix without redundant qualifier")
print("PASS: saved/error screens avoid rebuilding all rows every second")
print("PASS: MP3, ambient, popup and verifier corrections retained")
print("NOT VERIFIED: Android layout at different font scales and device runtime")
