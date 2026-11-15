"""v2.0.3-dev.13: UI density, honest HLS estimate, saved action label,
NicoLive user-broadcast MediaSession artwork fallbacks and existing playback.
"""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev13_patch",ROOT/"patch_216.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)

with tempfile.TemporaryDirectory() as temporary:
    staged=Path(temporary)/"e/e/a"
    staged.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",staged)
    ui=(staged/"DownloadUi115.java").read_text(encoding="utf-8")
    assert 'Mp3Save214.chooseFormat(a,id,title)' in ui
    assert 'Mp3Save214.isMp3(r.job)?"MP3":"MP4"' in ui
    assert 'Math.ceil(r.bytes*100d/r.percent)' in ui
    assert '+"（推定）"' in ui
    assert '" / 総容量取得中"' in ui
    assert 'detail.setText(detail.getText()+" · "+amount)' in ui
    assert 'oldCapacity.setVisibility(View.GONE)' in ui
    assert '((TextView)row.getChildAt(3)).setText(amount)' not in ui
    assert 'Mp3Save214.isMp3(j)?"audio/mpeg":"video/mp4"' in ui
    assert '"動画・音声を保存"' in (staged/"DownloadActions116.java").read_text()
    assert '"動画・音声を保存"' in (staged/"PlayerDownloads116.java").read_text()
    assert "Mp3Save214.start(owner,input)" in (staged/"DownloadWorker115.java").read_text()

    data=(staged/"NicoliveData.java").read_text(encoding="utf-8")
    assert "public final ArrayList<String> mediaThumbnails" in data
    assert "NicoliveData.historyThumbnail(html,expected)" in data
    assert "addMediaArtwork(v,thumb.optString(field" in data
    assert "NicoliveArtwork.isTrusted(url)" in data
    assert 'for(String field:new String[]{"large","middle","thumbnailUrl","url","small"})' in data

    service=(staged/"NicoliveService.java").read_text(encoding="utf-8")
    assert 'for(String candidate:p.mediaThumbnails)' in service
    assert 'NicoliveArtwork.fetch(url)' in service
    assert 'NicoliveDiagnostics.record("ARTWORK"' in service
    assert 'mediaSession.setMetadata(metadata.build())' in service
    assert 'metadata.putBitmap(MediaMetadata.METADATA_KEY_ART,mediaArtwork)' in service
    assert 'metadata.putBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON,mediaArtwork)' in service
    assert 'if(bitmap!=null)updateNotification()' in service
    assert 'NicoliveDiagnostics.record("ARTWORK","candidates="' in service
    assert "programId.equals(program.id)" in service
    assert "void cornerResizePopup(" in service, "NicoLive popup corner resizing must be preserved"
    assert "clearArtwork()" in service

    ambient=(staged/"AmbientLight.java").read_text()
    assert "normalEdgeLimits[2]=symmetric" in ambient
    assert "normalEdgeLimits[3]=symmetric" in ambient
    assert "normal centered portrait/letterbox" in ambient

    assert "PlayerStart211.install(root)" in (staged/"PlayerIcons.java").read_text()
    assert "DrawerFront211.attach(host, frame, layer)" in (staged/"AppBarPlacement202.java").read_text()

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.13"' in builder
assert "from patch_216 import OVERRIDES, stage" in builder
assert 'menu_label="MenuOptions119.smali"' in builder
assert "old_label=" in builder and "menu_source.count(old_label)!=1" in builder
assert '"v2.0.3-dev.12/java"' in builder
assert "nicoid_native_mp4_fallback213" not in builder
assert "DownloadUi115$Manager.smali" not in builder
assert 'build_pinned_java_lame(work)' in builder

merge=(ROOT/"MergeLiveDex.java").read_text()
assert 'type.equals("Le/e/a/NicoliveService;")' in merge

print("PASS: saved capacity is in status row and running download has labeled total estimate")
print("PASS: stable menu ID retains user preferences while replacing legacy title")
print("PASS: trusted user-NicoLive artwork candidates and session bitmap update")
print("PASS: prior MP3 audio-only export and ambient/drawer/playback fixes retained")
print("NOT TESTED: end-to-end Android UI/notification and live network content")
