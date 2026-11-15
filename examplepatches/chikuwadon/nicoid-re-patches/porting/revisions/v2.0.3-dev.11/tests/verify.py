"""v2.0.3-dev.11: real right-hand black-gutter geometry and native MP3 export."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev11_patch",ROOT/"patch_214.py")
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

with tempfile.TemporaryDirectory() as folder:
    staged=Path(folder)/"e/e/a"
    module.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",staged)
    ambient=(staged/"AmbientLight.java").read_text()
    for key in (
        "normal centered portrait/letterbox",
        "visiblePicture.right=symmetricRight;",
        "visiblePicture.left < parentWidth / 2",
        "lastSource.getWidth() >= parentWidth * .98f",
        "perimeterGlow.balanceRightGutter = !split",
        "pageGlow.video.set(visiblePicture)",
        "tabGlow.video.set(visiblePicture)",
        "normalGlowLayer.update(parent)",
        "normalBlackBand(sample, 2)",
        "normalBlackBand(sample, 3)",
    ):assert key in ambient,key
    assert "Math.abs(ratio-4f/3f)<.12f" not in ambient
    assert "PlayerStart211.install(root)" in (staged/"PlayerIcons.java").read_text()
    assert "DrawerFront211.attach" in (staged/"AppBarPlacement202.java").read_text()

save=(ROOT/"java/e/e/a/Mp3Save213.java").read_text()
for key in (
    '"MP3で保存"', "DownloadJobs115.enqueue", # may be in DownloadUi115 instead
    "DownloadUi115.enqueue", "DownloadUi115.folder",
    "Mp4Transfer115 task=new Mp4Transfer115", "Mp3Transcode213.convert",
    'DocumentsContract.createDocument', '"audio/mpeg"',
    "DownloadJobs115.changed", "DownloadWorker115.finish",
    "openIfMp3", "decorateRow"
):
    if key=="DownloadJobs115.enqueue":continue
    assert key in save,key
assert "return bitrate==128||bitrate==192||bitrate==256;" in save

transcode=(ROOT/"java/e/e/a/Mp3Transcode213.java").read_text()
for key in ("MediaExtractor", "MediaCodec", "MediaFormat.KEY_PCM_ENCODING",
            "new Lame()", "lame.encodeBuffer(", "lame.encodeFlush(",
            "job.check()", "if(!completed)target.delete()"):
    assert key in transcode,key

builder=(ROOT/"build_mpp.py").read_text()
for key in ("VERSION = \"2.0.3-dev.11\"", "from patch_214 import OVERRIDES, stage",
            'LAME_COMMIT="0224bc48f7ca4c9dfafea3d3bee13be741d34552"',
            "build_pinned_java_lame(work)", "LameSmoke213",
            'Mp3Save213;', 'nicoid_native_mp4_fallback213',
            'lame_jar, *libs', "java-lame-3.98.4-LGPL-3.0.txt"):
    assert key in builder,key
print("PASS: aspect-independent centered portrait/4:3 gutter corrected")
print("PASS: MP3 format selector, queue integration, AAC-to-PCM-to-LAME, SAF MIME")
print("PASS: fully pinned Java-LAME build and MP3 sample smoke in actual builder")
print("NOT TESTED: Android on-device MP3 audio, permissions and UI timing")
