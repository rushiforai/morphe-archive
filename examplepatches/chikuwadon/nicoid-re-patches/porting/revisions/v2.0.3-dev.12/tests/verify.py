"""v2.0.3-dev.12: ART verifier crash fix, unified UI and audio-only downloads."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev12_patch",ROOT/"patch_215.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as tmp:
    dest=Path(tmp)/"e/e/a"
    dest.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    for name in ["DownloadUi115.java","DownloadActions116.java",
                 "PlayerDownloads116.java","DownloadWorker115.java"]:
        assert (dest/name).is_file(),name
    ui=(dest/"DownloadUi115.java").read_text()
    assert "Mp3Save214.chooseFormat(a,id,title)" in ui
    assert 'Mp3Save214.isMp3(r.job)?"MP3":"MP4"' in ui
    assert 'Mp3Save214.isMp3(j)?"audio/mpeg":"video/mp4"' in ui
    assert "MP4を削除しますか？" not in ui
    assert "Mp3Save214.start(owner,input)" in (dest/"DownloadWorker115.java").read_text()
    assert "動画・音声を保存" in (dest/"DownloadActions116.java").read_text()
    assert "動画・音声を保存" in (dest/"PlayerDownloads116.java").read_text()
    ambient=(dest/"AmbientLight.java").read_text()
    assert "normal-gutter measured L=" in ambient
    assert "normalEdgeLimits[2]=symmetric;" in ambient
    assert "normalEdgeLimits[3]=symmetric;" in ambient
    assert "normal centered portrait/letterbox" in ambient
    assert "PlayerStart211.install(root)" in (dest/"PlayerIcons.java").read_text()
    assert "DrawerFront211.attach" in (dest/"AppBarPlacement202.java").read_text()

audio=(ROOT/"java/e/e/a/Mp3Audio214.java").read_text()
for x in ("#EXT-X-MEDIA:",'"AUDIO".equals(attrs.get("TYPE"))',
          "Mp4Playlist115.parse(audioUrl,task.text(audioUrl))",
          "task.binary(seg,out)", "muxFragmented", "muxPlatform"):
    assert x in audio,x
assert "task.run(model)" not in (ROOT/"java/e/e/a/Mp3Save214.java").read_text()
mp3=(ROOT/"java/e/e/a/Mp3Save214.java").read_text()
for x in ("chooseFormat(Activity a,String id,String title)",
          "android.widget.Spinner","MP3（音声のみ）",
          "Mp3Audio214.fetch(task,model)","DownloadUi115.enqueue",
          "Mp3Transcode213.convert"):
    assert x in mp3,x
builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.12"' in builder
assert "from patch_215 import OVERRIDES, stage" in builder
assert "nicoid_native_mp4_fallback213" not in builder
assert "decorateRow(Landroid/view/View;" not in builder
assert "DownloadUi115$Manager.smali" not in builder
assert "build_pinned_java_lame(work)" in builder
print("PASS: no invalid smali register injection, shared format/quality dropdown, audio-only streaming")
print("PASS: symmetric full-depth 4:3/portrait ambient and retained playback regressions")
print("NOT TESTED: Android runtime downloads, SAF access and selected HLS stream compatibility")
