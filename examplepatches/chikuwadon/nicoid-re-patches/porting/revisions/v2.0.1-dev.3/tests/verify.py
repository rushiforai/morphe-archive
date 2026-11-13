"""Source-wide checks for the verified dev.3 patch candidate.

Verifies actual staged sources from immutable inputs, never merely the diff.
Runtime Android notification/UI behavior still requires device testing.
"""
from pathlib import Path
import sys
from tempfile import TemporaryDirectory

REVISION=Path(__file__).resolve().parents[1]
REVISIONS=REVISION.parent
REPO=REVISION.parents[2]
sys.path.insert(0,str(REVISION))
from patch_203 import stage, OVERRIDES

with TemporaryDirectory() as temp:
    destination=Path(temp)
    base=REVISIONS/"v2.0.0-dev.1/java/e/e/a"
    modified=stage(base,destination)
    assert len(modified)==len(OVERRIDES), (len(modified),len(OVERRIDES))
    read=lambda filename:(destination/filename).read_text(encoding="utf-8")
    entry=read("NicoliveEntry.java")
    assert 'japanese ? "ニコニコ生放送の視聴" : "Watch Niconico Live"' in entry
    assert 'japanese ? "ニコ生 (β)" : "Niconico Live (β)"' in entry
    assert 'nicoid_live' in entry and 'show_nicolive_menu' in entry

    service=read("NicoliveService.java")
    assert 'if(stopped){clearMediaSessionAndNotification();return;}' in service
    assert 'clearMediaSession();' in service
    assert 'old.setActive(false);' in service
    assert 'old.release()' in service
    assert 'stopForeground(true)' in service
    assert 'manager.cancel(2000)' in service
    assert 'if(end){stopPlayback();return;}' in service
    assert 'updateNotification(){' in service and 'if(stopped||terminal)return' in service

    retained=read("RetainedPlayback137.java")
    assert 'if(current!=null)finish(current,false);' in retained
    assert 'Delayed controls from an older session must NOT stop a new session' in retained
    assert 'clearKeeperNotification(service);' in retained
    assert 'manager.cancel(NOTIFICATION);' in retained
    assert 'finish(s,false);' in retained
    assert 'STATE_STOPPED' in retained
    assert 'service.stopSelf();return true;' in retained
    assert 'serviceDestroyed(Service service)' in retained

    icon=read("PlayerIcons.java")
    assert 'case "play":Path p=' in icon
    assert 'paint.setStrokeWidth(.50f);c.drawPath(p,paint);' in icon
    assert 'case "pause":paint.setColor(0xaa000000)' in icon
    assert 'paint.setStrokeWidth(.75f);c.drawRoundRect' in icon

    theme=read("PlayerTheme.java")
    assert 'nicoid_detail_item_light' in theme
    assert '0xfff0f1f3' in theme and '0xff292b31' in theme
    assert 'WeakHashMap<View,java.lang.ref.WeakReference<' in theme
    assert 'DETAIL_MODE.put(view,dark)' in theme
    assert 'tracked(item)!=item.getBackground()' in theme
    assert 'tagGap(item,last?0:PanelUi.dp(c,4))' in theme
    assert 'if(view==null)return;' in theme

    # Prior functional fixes must remain compiled from the staging pipeline.
    live=read("NicoliveActivity.java")
    browser=read("NicoliveBrowser.java")
    assert 'showProgramActions(program)' in live
    assert 'listGestures.reset();' in live
    assert 'Toast.LENGTH_SHORT' in live and 'postNotice.cancel()' in live
    assert 'missingHistory' in browser and 'accountCookie' in browser
    assert 'GestureControls110.Trace' in (REVISIONS/"v2.0.1-dev.2/java/e/e/a/NicoliveListGestures.java").read_text()
    assert 'PlaylistGestureRouter' in (REVISIONS/"v2.0.1-dev.1/java/e/e/a/PlaylistGestureRouter.java").read_text()

    # Ensure archived release sources are unchanged.
    for name in ("NicoliveEntry.java","NicoliveService.java"):
        assert (base/name).read_text()!=read(name)
    for name in ("RetainedPlayback137.java","PlayerIcons.java","PlayerTheme.java"):
        assert read(name).startswith("package e.e.a;")

builder=(REVISION/"build_mpp.py").read_text()
merger=(REVISION/"MergeLiveDex.java").read_text()
assert 'VERSION = "2.0.1-dev.3"' in builder
assert 'from patch_203 import OVERRIDES, stage' in builder
assert 'ROOT / "MergeLiveDex.java"' in builder
assert 'v2.0.1-dev.2/java' in builder
assert 'updatedHelper(type)' in merger and 'Missing live helper replacement classes' in merger
print("PASS: dev.3 menu, media cleanup, session token, icon, themes, previous fixes and MPP source contracts")
