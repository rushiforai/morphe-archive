#!/usr/bin/env python3
"""Release-candidate source/behavior audit. Run in CI before building the MPP.

This augments (not replaces) Android manifest, APK/DEX verification, unit tests,
API continuity checks, GitHub workflow lockfile verification and device tests.
"""
from __future__ import annotations
import pathlib
import re

ROOT=pathlib.Path(__file__).resolve().parents[3]
REV=pathlib.Path(__file__).resolve().parent
HELPERS=REV/"java/e/e/a"
VERSION="1.11.1-dev.13"
checks=0

def verify(ok:bool,reason:str)->None:
    global checks
    checks+=1
    if not ok:
        raise AssertionError(reason)

sources={f.stem:f.read_text(encoding="utf-8") for f in HELPERS.glob("*.java")}
verify(len(sources)>=31,f"Expected all 31 current helper sources, got {len(sources)}")
must_have=("Dev111","Dev112","Dev113","Dev114","Dev115","Dev116",
           "Dev118","Dev119","Dev120","Dev121","Dev122","Dev128","Dev130",
           "Dev131","Dev132","Dev134","Dev135","PostingPolicy122","PopupTouch125",
           "PopupTouchPolicy125","RankingTabIdentity133","GestureTurnPolicy128")
for name in must_have:verify(name in sources,f"Missing {name}")

# Ensure newly generated helper source cannot launch shell programs, load
# arbitrary dex, or silently accept untrusted WebView origins.
dangerous=(
    r"\bRuntime\s*\.\s*getRuntime\(\)\s*\.\s*exec\s*\(",
    r"\bProcessBuilder\s*\(",
    r"\bDexClassLoader\b",
    r"\bPathClassLoader\b",
    r"\bSystem\s*\.\s*loadLibrary\s*\(",
    r"\bsetAllowFileAccess\s*\(\s*true\s*\)",
    r"\bsetJavaScriptEnabled\s*\(\s*true\s*\)",
)
for name,body in sources.items():
    for pattern in dangerous:
        verify(re.search(pattern,body) is None,f"Suspicious execution capability in {name}: {pattern}")

# All literal HTTPS domains introduced by current helper Java classes should
# be niconico delivery / official API endpoints. Existing native APK traffic
# is assessed separately; no assumption is made about user-provided URLs.
allowed={
    "sp.nicovideo.jp","www.nicovideo.jp","ext.nicovideo.jp",
    "nvapi.nicovideo.jp","nicovideo.cdn.nimg.jp",
    "public.nvcomment.nicovideo.jp",
}
hosts=set()
for name,body in sources.items():
    if "http://" in body:
        # Dev116 accepts legacy thumbnail URL text only to convert it to
        # HTTPS before handing it to the image loader. This is not a
        # cleartext network call; fail any other unapproved http literal.
        verify(name in ("Dev115","Dev116"),f"Unexpected cleartext HTTP constant in {name}")
        if name=="Dev115":
            verify('if(image.startsWith("http://"))image="https://"+image.substring(7);' in body,
                   "Legacy playlist thumbnail URL must be upgraded to HTTPS")
        else:
            verify('url.replaceFirst("^http://","https://")' in body,
                   "Legacy thumbnail URLs must be upgraded to HTTPS")
            verify("loadImage(safeImage(original), image)" in body,
                   "Thumbnail HTTP upgrade must precede image load")
    for host in re.findall(r'https://([a-zA-Z0-9._-]+)',body):
        host=host.lower()
        if host:
            hosts.add(host)
            verify(host in allowed,f"Unexpected helper URL domain: {name}: {host}")
verify(bool(hosts),"Missing recognizable production HTTP endpoints")
print("PASS: helper security checks, no cleartext HTTP, official outbound domains",
      ",".join(sorted(hosts)))

# Main-thread and resource protections in critical recently modified features.
audio=sources["Dev131"]
verify('getBoolean(KEY, false)' in audio,"Audio focus default not OFF")
verify("ownedByService(context)" in audio,"Service double audio-focus request not guarded")
post=sources["PostingPolicy122"]
verify('throw new IOException("Unsupported' in post,
       "Comment post endpoint allowlist missing")
verify("POST_SERVER" in post,"Comment posting endpoint policy missing")
popup=sources["PopupTouch125"]
verify("if (view instanceof ViewGroup) return false;" in popup,
       "Popup video/container stealing child controls")
verify("interactiveHit(root, (View) player" in popup,
       "Popup control hit detection missing")
verify("state.routing()" in popup and "state.cancel()" in popup,
       "Popup cancellation routing missing")
gesture=sources["GestureTurnPolicy128"]
verify("verticalOnly(pattern)" in gesture and "return enabled ||" in gesture,
       "Pure vertical gesture opt-out changed")

# Tab list / modal / default-on combined button preference.
tabs=sources["Dev132"]
summary=tabs.split("private static String buttonsSummary(",1)[1].split(
    "public static void installSettings(",1)[0]
verify('"現在："' not in summary and '"Current: "' not in summary and
       '"目前："' not in summary and '"\\n"' not in summary,
       "Tab button help reverted to multiline current-value display")
verify("左端の一覧ボタンでタブの切替・管理" in summary,
       "Japanese tab-bar control explanation missing")
verify("右端の＋ボタンでタブを追加" in summary,
       "Japanese + button explanation missing")
for item in ("MultiSelectListPreference","BUTTONS_KEY",
             "new HashSet<>(Arrays.asList(LIST_VALUE,ADD_VALUE))",
             "startDragAndDrop","ACTION_DROP","rememberClosed",
             "直前に閉じたタブを復元"):
    verify(item in tabs,f"Tab-list regression: {item}")
verify('if(wasEmpty)call(host,"select"' in tabs,
       "Restore must keep the dialog open without replacing active tab")
verify("showAddTab(Activity activity)" in tabs and "addActionName(Context c)" in tabs,
       "Gesture add-tab action must reuse native tab menu")
verify("case 11:" in tabs and "new Glyph(c,11,true)" in tabs,
       "Tab list dismiss must be distinct from per-tab close")
verify("title.setPadding(dp(c,16)" in tabs,
       "Tab list title spacing missing")
verify("roundSettings" in sources["Dev135"] and '"e.e.a.UiDialogs"' in sources["Dev135"] and '"style"' in sources["Dev135"],
       "Native preference dialogs lack unified corner styling")
verify("Dev135.roundSettings" in sources["Dev111"],
       "Preference dialog styling installer is missing")
verify("if(count<40)MAIN.postDelayed" in sources["Dev111"] and
       "PlaybackReturn" in sources["Dev111"],
       "Foreground normal-playback handoff retry missing")
verify("Set<String> shown=buttons(activity)" in tabs,
       "Tab button visibility selection not reflected in bar")

# Add-tab ranking must be second, preserve native item mapping and share the
# ordinary saved-tab lifecycle; version asserts must match the actual build.
patch_text=(REV/"patch-payloads.py").read_text(encoding="utf-8")
verify('assert version == "1.11.1-dev.13"' in patch_text,
       "Development patch version mismatches Gradle version")
verify('result[0]=existing[0]' in tabs and 'result[1]=tr(activity,"ランキング"' in tabs and
       'System.arraycopy(existing,1,result,2,existing.length-1)' in tabs,
       "Ranking is not directly below Search in add-tab list")
verify('Dev138.perform(activity,"menu_ranking")' in tabs and
       'addRankingTab(Object host)' in tabs,
       "Ranking add-tab must open the native ranking genre chooser")
for symbol in ('Dev132;->addRankingLabel', 'Dev132;->addRankingTab',
               'add-int/lit8 p3, p3, -0x1',
               'add-int/lit8 v0, v0, 0x1'):
    verify(symbol in patch_text, "Ranking menu mapping regression: "+symbol)

# Preserve the fourteen user-requested drawer destinations as opt-in actions.
gestures=sources["Dev138"]
keys=("menu_ranking","menu_shorts","menu_video_id","menu_local_history",
      "menu_local_playlists","menu_cache","menu_mypage","menu_account_history",
      "menu_mylists","menu_watch_later","menu_following","menu_nicorepo",
      "menu_settings","menu_restart")
for key in keys:
    verify('"'+key+'"' in gestures, "Missing requested gesture action "+key)
for method in ("extend(String[] existing)", "actionName(Context context,String key)",
               "perform(Activity activity,String key)", "dispatchNativeMenu(Activity activity,String key)"):
    verify(method in gestures, "Drawer routing helper missing "+method)
for hook in ("Dev138;->extend", "Dev138;->actionName", "Dev138;->perform"):
    verify(hook in patch_text, "Gesture action integration missing "+hook)
verify("Dev111.singleReturnOwner(a)" in sources["RetainedPlayback137"],
       "Direct-background callback must serialize legacy and retained returns")
verify('singleReturnOwner(Activity activity)' in sources["Dev111"] and
       'armed.set(null,null)' in sources["Dev111"],
       "Legacy and retained playback must not open parallel normal players")

# Ranking data update must retain Activity/Fragment and eliminate tab churn.
ranking=sources["Dev134"]
for item in ('applyPeriod(Activity activity,Intent next)',
             'set(tab,"url",updated)', 'set(fragment,"d0",updated)',
             'set(loader,"b",change.url)', 'Refresh192',
             'PENDING.get(a)!=change', 'activity.setIntent(next)',
             'MAX_RETRIES=100', 'new WeakReference<>(activity)'):
    verify(item in ranking,f"Ranking in-place lifecycle guard missing: {item}")
for item in ("activity.startActivity(", "activity.finish(",
             "activity.recreate(", "new Intent(activity,"):
    verify(item not in ranking,f"Ranking period unexpectedly recreates UI: {item}")
verify("same(" in sources["RankingTabIdentity133"] and
       'endsWith(".nicovideo.jp")' in sources["RankingTabIdentity133"],
       "Ranking identity origin or dedup guard missing")

# Regression coverage for reported Android 16 playback handoff faults.\nresume=sources["Dev111"]\npatches=(REV/"patch-payloads.py").read_text(encoding="utf-8")\nverify("resumeScheduled" in resume and "returnInFlight" in resume,\n       "Resume handoff must be one-shot across Activity callbacks")\nverify("Le/e/a/RetainedPlayback137;->capture" in patches,\n       "Retained decoder handoff must be preferred")\nverify('method("MediaStop240.smali"' in patches and "stopForeground(Z)V" in patches,\n       "Media stop must release foreground Service notification")\nverify('method("PlaybackSession.smali"' in patches and "return v6" in patches,\n       "Asynchronous Back handoff must consume input")\n\n# Reject any accidental restoration of the old HLS-reloading fallback.
verify('getMethod("open",Object.class)' not in sources["Dev115"],
       "PlaybackReturn.open legacy reload fallback is forbidden")
verify("duration>0" in sources["Dev111"] and "cancelPendingReturn" in sources["Dev111"],
       "Prepared decoder or pending Back cancellation check missing")
# Returning to the app must locate DirectBackground235, not just popup bindings.
verify("activeBackgroundService()" in sources["Dev111"] and
       'Class.forName("e.e.a.DirectBackground235")' in sources["Dev111"],
       "Background service locator missing from normal return path")
verify('getDeclaredField("restoring")' in sources["Dev115"],
       "Retained decoder restoration guard missing")
verify("Dev136" in sources and "completeWhenAudible" not in sources["Dev136"],
       "Concurrent two-player progress gate must stay removed")
verify("appStarted(Activity" in sources["Dev111"] and "appStopped(Activity" in sources["Dev111"],
       "App-wide foreground tracking missing")
verify("keepPending" in sources["Dev136"], "Stale normal-return handoff guard missing")
patches=(REV/"patch-payloads.py").read_text(encoding="utf-8")
verify('method("PopupReturn244.smali"' not in patches,
       "Do not patch PopupReturn244 smali: Android ART VerifyError regression")
verify("releaseStaleReturn" in sources["Dev136"] and "Dev136.releaseStaleReturn" in sources["Dev115"],
       "Stale pending-return handling must stay in typed Java")
verify('Dev111;->appStopped(Landroid/app/Activity;)V' in patches,
       "Foreground transition callback missing")
verify('    .line 81' in patches,
       "Lifecycle stopped callback must be injected before the Activity register is retyped")
verify('completeWhenAudible' not in patches and 'completeNow' not in patches,
       "Experimental overlapping audio handoff must not be reinstated")
# New app-switch architecture must retain a SINGLE original VideoView.
retained=sources["RetainedPlayback137"]
verify("startForegroundService(keeper)" in retained and
       "serviceStart(Service service,Intent intent)" in retained,
       "Foreground process/notification keeper missing")
verify("no player transfer" in retained.lower() and
       "s.player.getClass().getMethod" in retained,
       "Original player ownership and media action hooks missing")
verify("Dev111.suppressAutoReturn()" in retained,
       "Old automatic return is still running over the retained Activity")
verify("RetainedPlayback137;->capture" in patches and
       "PlaybackHandoff110;->capture" not in patches,
       "Legacy external-app transfer remains reachable")
verify("RetainedPlayback137;->serviceStart" in patches and
       "RetainedPlayback137;->retains" in patches,
       "Missing native Service bypass or pause suppression")
check=patches.split('replace_method("AppSwitchGuard$1.smali"',1)[1].split('# Run the optional return',1)[0]
verify("PlaybackSession;->leave" not in check,
       "A second Service decoder can still be started on app switch")
verify("settleNormalReturn(s,position(s.player),0)" in retained and
       "hasWindowFocus()" in retained,
       "Do not retire foreground keeper during the first Activity resume callback")
verify('legacy("FeedbackMedia","apply",new Class<?>[]{MediaSession.class,MediaMetadata.class,Object.class}' in retained and
       'legacy("FeedbackFixes","bundleTitle",new Class<?>[]{Bundle.class},info)' in retained,
       "MediaSession must expose original Nicoid video metadata and artwork")
verify('setContentTitle(info.title).setContentText(info.artist)' in retained,
       "Notification still uses generic placeholder strings")
verify('seekTo(' not in retained and 'PlaybackTransfer221.popup(' not in retained,
       "Original VideoView must not be recreated or seeked during app return")
# Android 16 seamless return must keep the ORIGINAL SurfaceTexture and
# avoid duplicate MediaCodec.setOutputSurface calls for the same output.
surface=sources["Dev139"]
for token in ("onSurfaceTextureDestroyed(SurfaceTexture texture)",
              "saved=texture;return false",
              "before.texture.get()==surfaceTexture",
              "before.output.get()==existing",
              "existing.isValid()",
              "new Surface(surfaceTexture)",
              "getSurfaceTextureListener()==this"):
    verify(token in surface, "Retained texture or duplicate output guard missing: "+token)
for forbidden in ('seekTo(', 'setVideoURI(', 'prepareAsync(', 'new ExoPlayer', 'pause()'):
    verify(forbidden not in surface, "Surface bridge must not start another player: "+forbidden)
verify('Dev139.hold(p)' in retained and
       's.retainedSurface.restore()' in retained and
       's.retainedSurface.close()' in retained,
       "App-switch output retention must restore and release on all exit paths")
verify('Dev139.remember(video.get(service))' in sources["Dev115"] and
       'Dev136.releaseStaleReturn' in sources["Dev115"],
       "Notification return must snapshot its already prepared decoder first")
verify('replace_method("VideoOutput227.smali"' in patches and
       'Le/e/a/Dev139;->connect(Landroid/view/View;Landroid/view/TextureView;)V' in patches,
       "VideoOutput must use idempotent binding rather than reassigning every Surface")
# Direct-write preferences have no conventional Preference entry that
# guarantees backup registration.  Both the Java source and shipped Smali
# must have all keys and matching stable types.
backup_source=(ROOT/"extensions/extension/src/main/java/e/e/a/SettingsBackupData.java").read_text(encoding="utf-8")
for key,kind in (
    ("nicoid_single_tap_control_region","string"),
    ("nicoid_single_tap_region_open_only","boolean"),
    ("nicoid_ambient_enabled","boolean"),
    ("nicoid_ambient_sides","int"),
):
    verify(('TYPES.put("'+key+'","'+kind+'")') in backup_source,
           "Typed direct setting missing from source backup: "+key)
    verify(key in patches, "Typed direct setting missing from shipped Smali overlay: "+key)
for index in range(3):
    key="nicoid_ambient_mode_"+str(index)
    verify(key in patches, "Ambient mode missing from Smali backup: "+key)
for name in ("intensity","spread","softness","brightness","contrast",
             "saturation","vibrance","response","rate","resolution"):
    verify("nicoid_ambient_"+name in patches, "Ambient numeric setting missing from backup: "+name)
verify('method("SettingsBackupData.smali", ".method static constructor <clinit>()V"' in patches,
       "Portable setting types must be inserted into shipped SettingsBackupData Smali")
ambient=sources["AmbientLight"]
for required in (
    "AmbientSampling148.shouldSample(",
    "if (attached && sampling) MAIN.post(this);",
    "if (!attached || !sampling) return;",
    "if (ticket != generation || !attached || !sampling)",
    "if (!attached || !sampling) sample = null;",
):
    verify(required in ambient, "Ambient zero-light capture guard missing: "+required)
policy=sources["AmbientSampling148"]
verify("(directionMask & 15) != 0" in policy and "intensity > 0" in policy,
       "Non-emitting ambient settings must never schedule frame captures")

# Confirm official release is a separate manual action.
workflow=(ROOT/".github/workflows/private-build.yml").read_text(encoding="utf-8")
verify("Check ranking in-place sort and tab-bar button descriptions" in workflow,
       "Regression tests missing from workflow")
verify("Verify GitHub official workflow lockfile" in workflow,
       "Official workflow lockfile check missing")
verify("Verify final distributed MPP" in workflow,
       "Distributed MPP validation absent")

# Static assertions complement compilation and runtime policy tests, not an
# emulator or a formal proof that a crash/network call can never occur.
print(f"PASS: {checks} release source/security/behavior invariants; "
      f"{len(sources)} Java helper sources checked; version {VERSION}")
