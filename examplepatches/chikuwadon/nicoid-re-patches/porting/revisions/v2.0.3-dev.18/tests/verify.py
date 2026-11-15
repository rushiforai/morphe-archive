"""v2.0.3-dev.18: external link must win over app-switch policy.

The Nov 14 bugreport shows ACTION_VIEW at
com.sauzask.nicoid.intent.NicoidVideoActivityIntent and a media session
remaining PLAYING after the Activity finished. Confirm both class detection
and life-cycle interception, not just the preference's visible label.
"""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("_dev18",ROOT/"patch_221.py")
patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as tmp:
    dest=Path(tmp)/"e/e/a";dest.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    retained=(dest/"RetainedPlayback137.java").read_text()
    assert 'com.sauzask.nicoid.intent.NicoidVideoActivityIntent' in retained
    assert 'captureInternal(a,true)' in retained
    assert 'captureInternal(a,false)' in retained
    assert '(!explicitBack&&!enabled(a))' in retained
    assert "public static synchronized void stopExternal(Activity a)" in retained
    assert 'if(s==null||s.source!=a)return;' in retained
    assert 'finish(s,true)' in retained
    assert 'onSeekTo(long requested)' in retained
    assert 'PlaybackState.ACTION_SEEK_TO' in retained
    assert "PlayerStart215.install(root)" in (dest/"PlayerIcons.java").read_text()
    assert "normalEdgeLimits[3]=symmetric;" in (dest/"AmbientLight.java").read_text()
    assert "Mp3Save214.chooseFormat(a,id,title)" in (dest/"DownloadUi115.java").read_text()
    assert "void cornerResizePopup(" in (dest/"NicoliveService.java").read_text()

external=(ROOT/"java/e/e/a/ExternalBack218.java").read_text()
assert 'com.sauzask.nicoid.intent.NicoidVideoActivityIntent' in external
assert 'com.sauzask.nicoid.NicoidVideoActivity' in external
assert 'String cls=a.getClass().getName();' in external
assert 'if(!external)return false;' in external
assert '"nicoid-external-back","Back intercepted activity="' in external
assert 'a.isTaskRoot()&&PlaybackNavigation114.destination(a)==null' in external
for mode in ("inherit","stop","background","popup","nicoid"):
    assert '"'+mode+'"' in external
assert 'if("inherit".equals(action))return false;' in external
assert 'if("stop".equals(action)){' in external
assert 'mark(a,action);\n                stopPlayback(a);\n                a.finish();' in external
assert 'PlaybackSession.destroy(fragment,false);' in external
assert 'RetainedPlayback137.stopExternal(a);' in external
assert 'mark(a,action);\n                a.moveTaskToBack(true);' in external
assert 'Runnable committed=RetainedPlayback137.captureForExternal(a);' in external
assert 'if(a.moveTaskToBack(true)){' in external
assert 'RetainedPlayback137.cancelExternal(a);' in external
assert 'public static synchronized boolean suppressAppSwitch(Object activity)' in external
assert 'public static synchronized void resumed(Activity a)' in external

guard=(ROOT/"java/e/e/a/AppSwitchGuard.java").read_text()
assert 'if (!back && ExternalBack218.suppressAppSwitch(owner))' in guard
assert 'ExternalBack218.resumed(a);' in guard
assert 'if (back || dispatching || !(owner instanceof Activity)) return false;' in guard
assert 'PlaybackTransfer.capture(activity)' in guard
assert 'MAIN.postDelayed(pending, DELAY_MS)' in guard

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.18"' in builder
assert "from patch_221 import OVERRIDES, stage" in builder
assert '"->back(Landroid/app/Activity;)Z' in builder
assert '"    invoke-static {p0}, Le/e/a/ExternalBack218;"' in builder
assert 'Le/e/a/ExternalBack216;->back' not in builder
assert "sorted((ROOT / \"java\").rglob(\"*.java\"))" in builder
assert "build_pinned_java_lame(work)" in builder
merge=(ROOT/"MergeLiveDex.java").read_text()
assert 'type.equals("Le/e/a/AppSwitchGuard;")' in merge
assert 'type.startsWith("Le/e/a/AppSwitchGuard$")' in merge
assert 'expectedHelpers.add("Le/e/a/AppSwitchGuard;");' in merge
assert 'throw new IOException("Live dependency collides with stable helper: "' in merge
assert 'assert "Le/e/a/ExternalBack218;" in classes' in (ROOT/"verify_ci_candidate.py").read_text()
print("PASS: actual external ACTION_VIEW Activity recognized, including task-root origin")
print("PASS: Stop destroys the media controls before Activity finish")
print("PASS: Background/Popup explicit Back suppresses app-switch takeover")
print("PASS: retained player supports the external intent class and notification Stop")
print("PASS: dev.17 settings and dev.15 controls preserved")
print("NOT TESTED: device-specific onBackPressed dispatch from external Intent Activity")
