"""v2.0.3-dev.12: fix ART VerifyError via Java replacement, unify save dialog,
and preserve audio-only MP3 streaming without fetching video segments.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.11/patch_214.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev11_patch",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
NATIVE_HELPERS={"DownloadUi115.java","DownloadActions116.java","PlayerDownloads116.java",
                "DownloadWorker115.java"}
OVERRIDES=frozenset(set(previous.OVERRIDES)|NATIVE_HELPERS)

def once(s,before,after,name):
    n=s.count(before)
    if n!=1:raise AssertionError(f"{name}: expected exactly one anchor, found {n}")
    return s.replace(before,after)

def patch_ui(source):
    before='static void choose(Activity a,String id,String title){String[] names={"最高画質","1080p以下","720p以下","480p以下","360p以下"};int[] heights={0,1080,720,480,360};UiDialogs.show(UiDialogs.builder(PlaybackSession.dialogContext(a)).setTitle("MP4で保存").setItems(names,(d,n)->{if(prefs(a).getString(TREE,"").isEmpty())folder(a,id,title,heights[n]);else enqueue(a,id,title,heights[n]);}).setNegativeButton(android.R.string.cancel,null).create());}'
    source=once(source,before,
        'static void choose(Activity a,String id,String title){Mp3Save214.chooseFormat(a,id,title);}',
        "common MP4/MP3 dropdown menu")
    source=once(source,
        '(r.cache?"キャッシュ":"MP4")+" · "+r.status',
        '(r.cache?"キャッシュ":Mp3Save214.isMp3(r.job)?"MP3":"MP4")+" · "+r.status',
        "download row labels in Java (no unverifiable smali edits)")
    source=once(source,'setTitle("MP4を削除しますか？")',
        'setTitle("保存済みファイルを削除しますか？")',
        "generic saved item deletion")
    source=once(source,
        'new Intent(Intent.ACTION_SEND).setType("video/mp4").putExtra(Intent.EXTRA_STREAM,Uri.parse(j.uri)):new Intent(Intent.ACTION_VIEW).setDataAndType(Uri.parse(j.uri),"video/mp4")',
        'new Intent(Intent.ACTION_SEND).setType(Mp3Save214.isMp3(j)?"audio/mpeg":"video/mp4").putExtra(Intent.EXTRA_STREAM,Uri.parse(j.uri)):new Intent(Intent.ACTION_VIEW).setDataAndType(Uri.parse(j.uri),Mp3Save214.isMp3(j)?"audio/mpeg":"video/mp4")',
        "download open MIME based on format")
    source=once(source,'share?"MP4を共有":"外部アプリで開く"',
        'share?(Mp3Save214.isMp3(j)?"MP3を共有":"MP4を共有"):"外部アプリで開く"',
        "share action title")
    source=source.replace("MP4の保存先フォルダ","動画・音声の保存先フォルダ")
    source=source.replace("保存したMP4は本アプリでは再生できません。外部の動画再生アプリをご利用ください。",
                          "保存したファイルは外部の再生アプリで開けます")
    return source

def balance_side_gutters(source):
    before="""                    normalEdgeLimits[2]=Math.min(sideReach,Math.max(0,visiblePicture.left));
                    normalEdgeLimits[3]=Math.min(sideReach,Math.max(0,parentWidth-visiblePicture.right));"""
    after="""                    int leftGutter=Math.max(0,visiblePicture.left);
                    int rightGutter=Math.max(0,parentWidth-visiblePicture.right);
                    // The old sideReach value was clamped at 108dp even
                    // when the 9:16 black gutters were 442px wide. Extend
                    // both sides to the same actual gutter width without
                    // painting inside the video or outside the player.
                    if(!split && leftGutter>0 && rightGutter>0){
                        int symmetric=Math.min(perimeterGlow.spread,
                                Math.min(leftGutter,rightGutter));
                        normalEdgeLimits[2]=symmetric;
                        normalEdgeLimits[3]=symmetric;
                    }else{
                        normalEdgeLimits[2]=Math.min(sideReach,leftGutter);
                        normalEdgeLimits[3]=Math.min(sideReach,rightGutter);
                    }
                    AmbientGeometryTrace.record("normal-gutter measured L="+leftGutter
                            +" R="+rightGutter+" draw L="+normalEdgeLimits[2]
                            +" R="+normalEdgeLimits[3]);"""
    return once(source,before,after,"symmetric full-depth normal gutters")


def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    sources=ROOT.parent/"v1.10.0/src/e/e/a"
    for name in sorted(NATIVE_HELPERS):
        source=(sources/name).read_text(encoding="utf-8")
        if name=="DownloadUi115.java":
            source=patch_ui(source)
        elif name=="DownloadActions116.java":
            source=once(source,'"MP4で保存","Save as MP4","另存為MP4"',
                '"動画・音声を保存","Save video or audio","儲存影片或音訊"',
                "long-press unified save option")
        elif name=="PlayerDownloads116.java":
            source=once(source,'"MP4で保存","Save as MP4","另存為MP4"',
                '"動画・音声を保存","Save video or audio","儲存影片或音訊"',
                "player unified save option")
        elif name=="DownloadWorker115.java":
            # Resolve Android Service explicitly when compiling with Android 16.
            source=once(source,"import android.app.*;",
                        "import android.app.*;import android.app.Service;",
                        "unambiguous native Android Service")
            source=once(source,
              'public static boolean start(Object owner,Intent input){if(!(owner instanceof Service)',
              'public static boolean start(Object owner,Intent input){if(Mp3Save214.start(owner,input))return true;if(!(owner instanceof Service)',
              "safe Java MP3 worker dispatch")
        (destination/name).write_text(source,encoding="utf-8")
    ambient=destination/"AmbientLight.java"
    ambient.write_text(balance_side_gutters(ambient.read_text(encoding="utf-8")),
                       encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
