"""Source regression checks for v2.0.1-dev.2 without device dependencies."""
from pathlib import Path
from tempfile import TemporaryDirectory
import sys
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root))
import patch_sources
source=root.parent/"v2.0.0-dev.1"/"java/e/e/a"
with TemporaryDirectory() as temp:
    patch_sources.stage(source,temp)
    data=(Path(temp)/"NicoliveData.java").read_text()
    browser=(Path(temp)/"NicoliveBrowser.java").read_text()
    activity=(Path(temp)/"NicoliveActivity.java").read_text()
    live=(root/"java/e/e/a/NicoliveListGestures.java").read_text()
    builder=(root/"build_mpp.py").read_text()
    assert 'getBoolean("list_gestures_display", true)' in live
    assert 'GestureControls110.Trace' in live and 'overlay.rules = rules;' in live
    assert 'activity.getWindow().superDispatchTouchEvent(cancel)' in live
    assert 'Dev128.allowClaim' in live and 'getLongPressTimeout()' in live
    assert 'void reset()' in live and 'reset();' in activity
    assert 'showProgramActions(program);' in activity
    assert 'labels.add("通常再生")' in activity
    assert 'labels.add("ポップアップ再生")' in activity
    assert 'labels.add("視聴履歴から削除")' in activity
    assert 'labels.add("タイムシフト予約を取り消す")' in activity
    assert 'Toast.LENGTH_SHORT' in activity and 'postNotice.cancel()' in activity
    assert 'accountCookie' in browser and 'cookie(context)' in browser
    assert 'missingHistory' in browser and '< 180000L' in browser
    assert 'trustedThumbnail(image)' in data and 'og:image' in data
    assert 'VERSION = "2.0.1-dev.2"' in builder
    assert 'stage(BASE_ROOT / "java/e/e/a", overrides)' in builder
    print("PASS: gestures, metadata, menu, toast, image request and build contracts")
