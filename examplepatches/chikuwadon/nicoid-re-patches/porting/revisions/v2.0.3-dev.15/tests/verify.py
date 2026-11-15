"""dev.15 regression: queue controls never appear before position correction."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("nicoid_patch_218",ROOT/"patch_218.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as tmp:
    output=Path(tmp)/"e/e/a"
    output.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",output)
    icons=(output/"PlayerIcons.java").read_text()
    assert "PlayerStart215.install(root)" in icons
    assert "PlayerStart211.install(root)" not in icons
    assert "normalEdgeLimits[3]=symmetric" in (output/"AmbientLight.java").read_text()
    assert "Mp3Save214.chooseFormat(a,id,title)" in (output/"DownloadUi115.java").read_text()
    assert "void requestArtwork(" in (output/"NicoliveService.java").read_text()
    assert "DrawerFront211.attach" in (output/"AppBarPlacement202.java").read_text()

src=(ROOT/"java/e/e/a/PlayerStart215.java").read_text()
first=src.split("  void firstFrame(){",1)[1].split("  void reveal(){",1)[0]
assert "if(separateQueueButtons(true))reveal();" in first
assert first.index("if(separateQueueButtons(true))reveal();") < first.index("FullscreenHandoff211.firstFrame(r);")
assert "pendingReveal=true;" in first
assert "unobserve();" not in first.split("if(separateQueueButtons(true))reveal();",1)[0]
predraw=src.split("@Override public boolean onPreDraw(){",1)[1].split("  void bind(TextureView t)",1)[0]
assert "separateQueueButtons(true)" in predraw
assert "separateQueueButtons(false)" in predraw
assert "void separateQueueButtons()" not in src
assert "boolean separateQueueButtons(boolean includeHidden)" in src
assert "includeHidden&&wanted[i]&&button.getVisibility()==View.INVISIBLE" in src
assert "if(button.getWidth()<1)return false" in src
assert "r.postDelayed(()->" in first
assert 'ModernDebug.record("player-center revealed only after queue spacing")' in src
assert "onSurfaceTextureUpdated(SurfaceTexture t)" in src
assert "if(previous!=null)previous.onSurfaceTextureUpdated(t);" in src
assert "w.firstFrame()" in src

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.15"' in builder
assert "from patch_218 import OVERRIDES, stage" in builder
assert '*(sorted((ROOT / "java").rglob("*.java")))' not in builder
assert 'sorted((ROOT / "java").rglob("*.java"))' in builder
assert 'build_pinned_java_lame(work)' in builder
assert (ROOT/"MergeLiveDex.java").read_text()==(ROOT.parent/"v2.0.3-dev.14/MergeLiveDex.java").read_text()
print("PASS: first decoded frame positions queued controls while invisible")
print("PASS: pre-draw monitor protects against one-frame native re-layout")
print("PASS: original TextureView listener and normal/MP3/live fixes retained")
print("NOT TESTED: real Android display compositor timing or Morphe installation")
