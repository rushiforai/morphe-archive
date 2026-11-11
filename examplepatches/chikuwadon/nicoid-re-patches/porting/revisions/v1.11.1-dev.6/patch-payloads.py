#!/usr/bin/env python3
"""Apply audited development overlays to a temporary copy of v1.10.1 smali.

The published v1.10.1 source and tags remain immutable. Each replacement is
exact and fails the build if the upstream release baseline changes.
"""
from pathlib import Path
import sys

ROOT = Path(sys.argv[1]).resolve()
HELPERS = ROOT / "helpers" / "e" / "e" / "a"


def method(name, signature, old, new):
    path = HELPERS / name
    source = path.read_text(encoding="utf-8")
    start = source.find(signature)
    if start < 0:
        raise RuntimeError(f"Missing method {name}: {signature}")
    end = source.find("\n.end method", start)
    if end < 0:
        raise RuntimeError(f"Unterminated method {name}: {signature}")
    block = source[start:end]
    if block.count(old) != 1:
        raise RuntimeError(f"Unexpected method baseline {name}: {old[:80]!r}; count {block.count(old)}")
    patched = block.replace(old, new)
    path.write_text(source[:start] + patched + source[end:], encoding="utf-8")



# One original VideoView spans foreground/background; the native Service
# only posts a media notification and never initializes another HLS decoder.
def native_method(name,signature,old,new):
    path=ROOT/"method-delta/com/sauzask/nicoid"/name
    src=path.read_text(encoding="utf-8")
    start=src.find(signature)
    end=src.find("\n.end method",start)
    if start<0 or end<0:raise RuntimeError("Missing native method "+name)
    block=src[start:end]
    if block.count(old)!=1:raise RuntimeError("Native overlay baseline mismatch "+name)
    path.write_text(src[:start]+block.replace(old,new)+src[end:],encoding="utf-8")

native_method("NicoidPopupViewService.smali",
  ".method public onStartCommand(Landroid/content/Intent;II)I",
  "    invoke-static/range {p0 .. p1}, Le/e/a/MediaClose248;->consume(Landroid/app/Service;Landroid/content/Intent;)Z",
  "    invoke-static/range {p0 .. p1}, Le/e/a/RetainedPlayback137;->serviceStart(Landroid/app/Service;Landroid/content/Intent;)Z\n"
  "    move-result v0\n"
  "    if-eqz v0, :nicoid_native_service_137\n"
  "    const/4 v0, 0x2\n"
  "    return v0\n"
  "    :nicoid_native_service_137\n"
  "    invoke-static/range {p0 .. p1}, Le/e/a/MediaClose248;->consume(Landroid/app/Service;Landroid/content/Intent;)Z")
native_method("NicoidPopupViewService.smali",
  ".method public onDestroy()V",
  "    invoke-static {p0}, Le/e/a/DirectBackground235;->terminated(Ljava/lang/Object;)V",
  "    invoke-static {p0}, Le/e/a/RetainedPlayback137;->serviceDestroyed(Landroid/app/Service;)V\n\n"
  "    invoke-static {p0}, Le/e/a/DirectBackground235;->terminated(Ljava/lang/Object;)V")

# Prevent Android onStop from pausing the retained ORIGINAL VideoView.
method("PlaybackLifecycle219.smali",
  ".method public static retain(Ljava/lang/Object;)Z",
  "    const/4 v0, 0x0\n\n    .line 13",
  "    invoke-static {p0}, Le/e/a/RetainedPlayback137;->retains(Ljava/lang/Object;)Z\n"
  "    move-result v0\n"
  "    if-eqz v0, :nicoid_not_retained_137\n"
  "    return v0\n"
  "    :nicoid_not_retained_137\n"
  "    const/4 v0, 0x0\n\n    .line 13")

# Explicit normal-player destruction invalidates the retained session.
method("AppSwitchGuard$2.smali",
  ".method public onActivityDestroyed(Landroid/app/Activity;)V",
  "    .line 87",
  "    invoke-static {p1}, Le/e/a/RetainedPlayback137;->destroyed(Landroid/app/Activity;)V\n\n"
  "    .line 87")

# Legacy Service-based notification Stop is eliminated. Signed broadcast
# uses the already-active MediaControls.receiver and never resurrects Service.
media_path=HELPERS/"MediaControls.smali"
media_src=media_path.read_text(encoding="utf-8")
media_sig=".method static action(Le/e/a/MediaControls$State;Ljava/lang/String;I)Landroid/app/PendingIntent;"
media_begin=media_src.find(media_sig)
media_end=media_src.find("\n.end method",media_begin)
if media_begin<0 or media_end<0:raise RuntimeError("MediaControls.action not found")
media_block=media_src[media_begin:media_end]
head=media_block.index('    const-string v0, "stop"')
tail=media_block.index("    .line 49\n    :cond_11\n    new-instance v0, Landroid/content/Intent;")
media_new=media_block[:head]+media_block[tail:].replace(
    "    .line 49\n    :cond_11\n","    .line 49\n",1)
media_path.write_text(media_src[:media_begin]+media_new+media_src[media_end:],encoding="utf-8")

# MediaControls delegates the stop action to MediaStop240 in this baseline.
# Close the foreground notification even when playback uses the retained mini player.
method("MediaStop240.smali",
       ".method public static stop(Ljava/lang/Object;Ljava/lang/Object;Z)V",
       "    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V\n\n"
       "    return-void",
       "    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V\n\n"
       "    instance-of v0, p0, Landroid/app/Service;\n"
       "    if-eqz v0, :nicoid_media_stop_done\n"
       "    check-cast p0, Landroid/app/Service;\n"
       "    const/4 p1, 0x1\n"
       "    invoke-virtual {p0, p1}, Landroid/app/Service;->stopForeground(Z)V\n"
       "    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V\n"
       "    :nicoid_media_stop_done\n"
       "    return-void")
method("MediaStop240.smali",
       ".method public static stop(Ljava/lang/Object;Ljava/lang/Object;Z)V",
       "    check-cast p0, Landroid/app/Service;\n\n"
       "    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V",
       "    check-cast p0, Landroid/app/Service;\n\n"
       "    const/4 v0, 0x1\n"
       "    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(Z)V\n\n"
       "    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V")

# PlaybackTransfer221.policy is the sole Back/app-switch controller.
# A preparation failure returns false to native Back, never starts another route.
def replace_method(name,signature,body):
    path=HELPERS/name
    source=path.read_text(encoding="utf-8")
    start=source.find(signature)
    end=source.find("\n.end method",start)
    if start<0 or end<0:raise RuntimeError("Missing baseline method "+name)
    path.write_text(source[:start]+body+source[end+len("\n.end method"):],encoding="utf-8")

replace_method("PlaybackSession.smali",
    ".method public static leave(Ljava/lang/Object;Z)Z",
    """.method public static leave(Ljava/lang/Object;Z)Z
    .registers 3
    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->policy(Ljava/lang/Object;Z)I
    move-result v0
    if-ltz v0, :nicoid_not_handled
    return v0
    :nicoid_not_handled
    const/4 v0, 0x0
    return v0
.end method""")

# Retain the verified v1.10.2 PlaybackTransfer221 prepared/complete flow.
# Experimental two-player overlapping audio and progress gating introduced
# a codec stop race and unwanted seeks. These changes are rolled back.
#
# App-wide lifecycle tracking stays active, but must execute before the
# original onActivityStopped overwrites p1 (Activity) with a Runnable.
method("AppSwitchGuard$2.smali",
       ".method public onActivityStarted(Landroid/app/Activity;)V",
       "    .line 69",
       "    invoke-static {p1}, Le/e/a/Dev111;->appStarted(Landroid/app/Activity;)V\n"
       "    invoke-static {p1}, Le/e/a/RetainedPlayback137;->started(Landroid/app/Activity;)V\n\n"
       "    .line 69")
method("AppSwitchGuard$2.smali",
       ".method public onActivityStopped(Landroid/app/Activity;)V",
       "    .line 81",
       "    invoke-static {p1}, Le/e/a/Dev111;->appStopped(Landroid/app/Activity;)V\n"
       "    invoke-static {p1}, Le/e/a/RetainedPlayback137;->stopped(Landroid/app/Activity;)V\n\n"
       "    .line 81")

# Never modify PopupReturn244 smali registers. Retained state is handled in Java.

# Use one retained decoder handoff and never fall back to PlaybackTransfer.capture.
method("AppSwitchGuard.smali",
       ".method public static intercept(Ljava/lang/Object;Z)Z",
       "    invoke-static {p0}, Le/e/a/PlaybackTransfer;->capture(Landroid/app/Activity;)Ljava/lang/Runnable;\n\n"
       "    move-result-object p1",
       "    invoke-static {p0}, Le/e/a/RetainedPlayback137;->capture(Landroid/app/Activity;)Ljava/lang/Runnable;\n\n"
       "    move-result-object p1")

# Pending retained returns must be cancellable with Back, not silently ignored.
method("PlaybackNavigation114.smali",
       ".method public static back(Landroid/app/Activity;)Z",
       "    if-eqz v1, :cond_18\n\n"
       "    return v2",
       "    if-eqz v1, :cond_18\n\n"
       "    invoke-static {p0}, Le/e/a/Dev111;->cancelPendingReturn(Landroid/app/Activity;)Z\n"
       "    move-result v1\n"
       "    if-eqz v1, :cond_18\n"
       "    return v2")

# Only the previously captured Runnable can run after an external onStop.
# The legacy reflection retry that created a new Service decoder is removed.
replace_method("AppSwitchGuard$1.smali", ".method public run()V",
    """.method public run()V
    .registers 5
    iget-object v0, p0, Le/e/a/AppSwitchGuard$1;->val$reference:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
    if-eqz v0, :nicoid137_done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :nicoid137_done
    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z
    move-result v1
    if-nez v1, :nicoid137_done
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :nicoid137_done
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$2()Ljava/lang/ref/WeakReference;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :nicoid137_done
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/util/WeakHashMap;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    iget-object v1, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;
    if-eqz v1, :nicoid137_done
    invoke-static {}, Le/e/a/RetainedPlayback137;->left()V
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :nicoid137_done
    return-void
.end method""")

# Run the optional return decision after the existing return controller.
method("AppSwitchGuard$2.smali", ".method public onActivityResumed(Landroid/app/Activity;)V",
       "    invoke-static {p1}, Le/e/a/PlaybackReturn;->foreground(Landroid/app/Activity;)V",
       "    invoke-static {p1}, Le/e/a/RetainedPlayback137;->resumed(Landroid/app/Activity;)V")

# Install preferences and sort only after all legacy preference installers have run.
method("SettingsPlacement233.smali", ".method public static finish(Landroid/preference/PreferenceActivity;)V",
       "    invoke-static {p0}, Le/e/a/SettingsPlacement233;->apply(Landroid/preference/PreferenceActivity;)V",
       "    invoke-static {p0}, Le/e/a/SettingsPlacement233;->apply(Landroid/preference/PreferenceActivity;)V\n\n"
       "    invoke-static {p0}, Le/e/a/Dev111;->settings(Landroid/preference/PreferenceActivity;)V")

# Existing SavedTabs227 persists position/top. Clear old values only when disabled,
# keeping normal in-process capture and restoration intact.
method("MultiTabs227.smali", ".method static data()Le/e/a/SavedTabs227;",
       "    sput-object v0, Le/e/a/MultiTabs227;->model:Le/e/a/SavedTabs227;",
       "    sput-object v0, Le/e/a/MultiTabs227;->model:Le/e/a/SavedTabs227;\n\n"
       "    sget-object v1, Le/e/a/MultiTabs227;->app:Landroid/app/Application;\n\n"
       "    invoke-static {v0, v1}, Le/e/a/Dev111;->loadedTabs(Ljava/lang/Object;Landroid/content/Context;)V")

# Initial native Fragment does not go through the ordinary tab activate path.
method("MultiTabs227$Host.smali", ".method resume()V",
       "    :cond_6c\n    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->bar()V",
       "    :cond_6c\n    invoke-static {p0}, Le/e/a/Dev111;->initialTab(Ljava/lang/Object;)V\n\n"
       "    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;\n\n"
       "    invoke-static {v0}, Le/e/a/Dev111;->pageResumed(Landroid/app/Activity;)V\n\n"
       "    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->bar()V")

# Native page tabs reuse Views and Activities. Refresh a cached playlist page
# when switching back instead of waiting for a visit to the playlist index.
method("TabRoutes228.smali",
       ".method static switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V",
       "    invoke-virtual {v1, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
       "    invoke-virtual {v1, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n\n"
       "    invoke-static {v0}, Le/e/a/Dev111;->capturePage(Landroid/app/Activity;)V")
method("TabRoutes228.smali",
       ".method static switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V",
       "    invoke-virtual {v0, v5}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V",
       "    invoke-virtual {v0, v5}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V\n\n"
       "    invoke-static {v0}, Le/e/a/Dev111;->preparePlaylist(Landroid/app/Activity;)V")
method("TabRoutes228.smali",
       ".method static switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V",
       "    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V",
       "    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V\n\n"
       "    invoke-static {v0}, Le/e/a/Dev111;->enteredPage(Landroid/app/Activity;)V")

# Non-tab navigation also creates a new playlist Page with the active folder.
method("LocalPlaylists.smali", ".method public static open(Landroid/app/Activity;)Z",
       "    :cond_e\n    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;",
       "    :cond_e\n    invoke-static {p0}, Le/e/a/Dev111;->preparePlaylist(Landroid/app/Activity;)V\n\n"
       "    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;")

# The old render cache used object identity, even though read() always created
# a new LocalPlaylistData. Compare the persisted snapshots instead.
method("LocalPlaylists$Page.smali", ".method render()V",
       "    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->renderedData:Le/e/a/LocalPlaylistData;\n\n"
       "    if-ne v7, v5, :cond_b2",
       "    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->renderedData:Le/e/a/LocalPlaylistData;\n\n"
       "    if-eqz v7, :cond_b2\n\n"
       "    invoke-virtual {v7}, Le/e/a/LocalPlaylistData;->toString()Ljava/lang/String;\n\n"
       "    move-result-object v7\n\n"
       "    invoke-virtual {v5}, Le/e/a/LocalPlaylistData;->toString()Ljava/lang/String;\n\n"
       "    move-result-object v8\n\n"
       "    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n\n"
       "    move-result v7\n\n"
       "    if-eqz v7, :cond_b2")

# Persist non-list native pages when leaving the app as well as on tab switches.
method("MultiTabs227$1.smali", ".method public onActivityPaused(Landroid/app/Activity;)V",
       "    .line 21\n    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;",
       "    .line 21\n    invoke-static {p1}, Le/e/a/Dev111;->capturePage(Landroid/app/Activity;)V\n\n"
       "    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;")

# SettingsTools finishes asynchronously on the ListView message queue.
# Repeat the idempotent installation after color/menu/watch-progress preferences exist.
method("SettingsTools.smali", ".method static synthetic lambda$1(Landroid/preference/PreferenceActivity;)V",
       "    invoke-static {p0}, Le/e/a/SettingsIntegrity;->stripSummaries(Landroid/preference/PreferenceActivity;)V",
       "    invoke-static {p0}, Le/e/a/SettingsIntegrity;->stripSummaries(Landroid/preference/PreferenceActivity;)V\n\n"
       "    invoke-static {p0}, Le/e/a/Dev111;->settings(Landroid/preference/PreferenceActivity;)V")

# A playlist write can finish after the user already returned to its tab.
# Notify visible pages only after the serialized transaction reports success.
method("LocalPlaylists.smali",
       ".method static synthetic lambda$1(Landroid/content/Context;ZLjava/util/function/Consumer;)V",
       "    :cond_28\n    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;",
       "    :cond_28\n    if-eqz p1, :nicoid_after_playlist_notify\n\n"
       "    invoke-static {}, Le/e/a/Dev111;->playlistsChanged()V\n\n"
       "    :nicoid_after_playlist_notify\n"
       "    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;")


# Distinct vertical up/down turns need an extra deliberate movement before the
# recognizer claims the scrolling touch event. Other gestures are unaffected.
method("GestureControls110.smali", ".method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z",
       "    if-nez v0, :cond_1b1\n\n    iput-boolean v5, v3, Le/e/a/GestureControls110$State;->claimed:Z",
       "    if-nez v0, :cond_1b1\n\n"
       "    invoke-static {v3, p1, v1}, Le/e/a/Dev112;->verticalTurnReady(Ljava/lang/Object;Landroid/view/MotionEvent;F)Z\n\n"
       "    move-result v0\n\n    if-eqz v0, :cond_1b1\n\n"
       "    iput-boolean v5, v3, Le/e/a/GestureControls110$State;->claimed:Z")

# Do not clamp an unloaded deep list position to the end of the first page.
method("MultiTabs227$Host$1.smali", ".method public onLayoutChange(Landroid/view/View;IIIIIIII)V",
       "    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I\n\n    move-result p2\n\n",
       "")
method("MultiTabs227$Host$1.smali", ".method public onLayoutChange(Landroid/view/View;IIIIIIII)V",
       "    invoke-virtual {p1, p2, p3}, Landroid/widget/ListView;->setSelectionFromTop(II)V",
       "    invoke-static {p1, p2, p3}, Le/e/a/Dev112;->restoreList(Landroid/widget/ListView;II)V")

# Add context-specific playlist move and delete actions to both popup and
# Android standard long-press menus; other list types stay unchanged.
method("ListActions.smali",
       ".method private static addExtra(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;I)V",
       "    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z\n\n"
       "    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z",
       "    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z\n\n"
       "    invoke-static/range {p0 .. p5}, Le/e/a/Dev112;->notUsedPlaceholder()V\n\n"
       "    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z")
# Replace range placeholder with regular 5-register invocation: p2,p4,p0,p1,p5
path=HELPERS/"ListActions.smali"
text=path.read_text(encoding="utf-8")
old="invoke-static/range {p0 .. p5}, Le/e/a/Dev112;->notUsedPlaceholder()V"
assert text.count(old)==1
text=text.replace(old,"invoke-static {p2, p4, p0, p1, p5}, Le/e/a/Dev112;->playlistMenu(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/Menu;Ljava/util/List;I)V")
path.write_text(text,encoding="utf-8")

# Back press is captured by the shared Activity only when tabbed list pages are
# active; video playback and other screens continue to use their existing Back.
native=ROOT/"method-delta/com/sauzask/nicoid/NicoidActivity.smali"
text=native.read_text(encoding="utf-8")
assert ".method public onBackPressed()V" not in text
text += '''\n.method public onBackPressed()V
    .registers 2

    invoke-static {p0}, Le/e/a/Dev112;->back(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :dev_back_done

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onBackPressed()V

    :dev_back_done
    return-void
.end method
'''
native.write_text(text,encoding="utf-8")

# The published recovered payload hardcoded v1.10.1 in two classes. Replace
# both values on the staged copy, using the selected Gradle development version.
version=sys.argv[2] if len(sys.argv)>2 else "1.11.1-dev.6"
assert version == "1.11.1-dev.6"
method("PatchVersion237.smali", ".method public static value()Ljava/lang/String;",
       'const-string v0, "1.10.1"', 'const-string v0, "'+version+'"')
versionFile=HELPERS/"ModernShorts.smali"
code=versionFile.read_text(encoding="utf-8")
old='.field private static final PATCH_VERSION:Ljava/lang/String; = "v1.10.1 @chikuwadon"'
assert code.count(old)==1
code=code.replace(old,'.field private static final PATCH_VERSION:Ljava/lang/String; = "v'+version+' @chikuwadon"')
old_value='const-string v1, "v1.10.1 @chikuwadon"'
assert code.count(old_value)==1
code=code.replace(old_value,'const-string v1, "v'+version+' @chikuwadon"')
versionFile.write_text(code,encoding="utf-8")

# Only safe instruction cleanup: redundant unlabelled NOPs added by the
# gesture experiment. Keep the actual recognizer and reflection entrypoints.
gesture=HELPERS/"GestureControls110.smali"
code=gesture.read_text(encoding="utf-8")
code=code.replace('    nop\n\n    nop\n\n    nop\n\n    invoke-static {p1}, Landroid/view/MotionEvent;->obtain',
                  '    invoke-static {p1}, Landroid/view/MotionEvent;->obtain')
gesture.write_text(code,encoding="utf-8")

print("Applied v1.11.1-dev.6 overlay to", ROOT)

# Missing stored image URLs follow the native thumbnail fallback already used by CacheListing.
method("LocalPlaylists$Page.smali", ".method render()V",
       "    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;\n\n"
       "    move-result-object v12",
       "    invoke-static {v14}, Le/e/a/Dev115;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;\n\n"
       "    move-result-object v12")

# Re-check status-bar insets on the next UI frame after restoring non-fullscreen flags.
method("FullscreenViewport209.smali", ".method public static restore(Landroid/view/View;)V",
       "    .line 49\n    invoke-static {p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V",
       "    .line 49\n    invoke-static {p0}, Le/e/a/Dev115;->afterFullscreenRestore(Landroid/view/View;)V\n\n"
       "    invoke-static {p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V")


# Native long-press action list: the owner is the *adapter*, not the tab Activity.
# Binding at extra() runs after the original Add-to-playlist action was appended.
method("ListActions.smali", ".method public static extra(Ljava/lang/Object;Ljava/lang/Object;)V",
       "    :cond_8c\n    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;",
       "    :cond_8c\n    move-object/from16 v0, p0\n\n    invoke-static {v3, v0, v2, v11, v14}, Le/e/a/Dev116;->playlistMenu(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/Menu;Ljava/util/List;)V\n\n"
       "    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;")

# Thumbnail UI is rebound for visible playlist rows after the native adapter
# creates each view, so old saved video entries can recover artwork online.
method("LocalPlaylists$Page$2.smali", ".method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;",
       "    iget-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;\n\n"
       "    invoke-static {p2, p3, p1}, Le/e/a/ListActions;->bind(Landroid/view/View;Ljava/lang/Object;I)V",
       "    invoke-static {p2, p0, p3}, Le/e/a/Dev116;->playlistThumbnail(Landroid/view/View;Landroid/widget/BaseAdapter;Lorg/json/JSONObject;)V\n\n"
       "    iget-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;\n\n"
       "    invoke-static {p2, p3, p1}, Le/e/a/ListActions;->bind(Landroid/view/View;Ljava/lang/Object;I)V")

# Activity actionbar home must always open the app drawer, not pop a playlist.
path=ROOT/"method-delta/com/sauzask/nicoid/NicoidVideoListActivity.smali"
text=path.read_text(encoding="utf-8")
old='.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n    .registers 9\n\n    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I'
new='.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n    .registers 9\n\n    invoke-static {p0, p1}, Le/e/a/Dev116;->drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z\n\n    move-result v0\n\n    if-eqz v0, :dev116_normal_options\n\n    const/4 v0, 0x1\n\n    return v0\n\n    :dev116_normal_options\n    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I'
assert text.count(old)==1,"unexpected video-list menu baseline"
path.write_text(text.replace(old,new),encoding="utf-8")


# The multi-tab host is NicoidActivity. Give the app drawer priority over
# playlist folder-back only for the hamburger item and a playlist page.
path=ROOT/"method-delta/com/sauzask/nicoid/NicoidActivity.smali"
text=path.read_text(encoding="utf-8")
old='.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n    .registers 5\n\n    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I'
new='.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n    .registers 5\n\n    invoke-static {p0, p1}, Le/e/a/Dev116;->drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z\n\n    move-result v0\n\n    if-eqz v0, :dev116_normal_home\n\n    const/4 v0, 0x1\n\n    return v0\n\n    :dev116_normal_home\n    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I'
assert text.count(old)==1,"Unexpected main activity menu baseline"
path.write_text(text.replace(old,new),encoding="utf-8")

# The toolbar home button is not Back. Keep the hardware Back policy separate.
path=HELPERS/"LocalPlaylists.smali"
code=path.read_text(encoding="utf-8")
signature=".method public static home(Landroid/app/Activity;Landroid/view/MenuItem;)Z"
assert code.count(signature)==1
start=code.index(signature)
end=code.index("\n.end method",start)
code=code[:start]+""".method public static home(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 3

    # Route through the native ActionBarDrawerToggle; return false to Activity on failure.
    invoke-static {p0, p1}, Le/e/a/Dev116;->drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    move-result p0
    return p0
"""+code[end:]
path.write_text(code,encoding="utf-8")

# The published b0$a.onClick opens the native popup directly. Previous
# ListActions.extra/show menu hooks were only inside a helper nobody called.
# Bridge the real native popup for local playlist rows, leaving other lists alone.
native=ROOT/"method-delta/e/e/a/b0$a.smali"
text=native.read_text(encoding="utf-8")
old="    invoke-virtual {v0}, Ld/b/q/z;->a()V"
new="""    invoke-static {p0, v0}, Le/e/a/Dev116;->nativePlaylistPopup(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :nicoid_playlist_popup_done
    invoke-virtual {v0}, Ld/b/q/z;->a()V
    :nicoid_playlist_popup_done"""
assert text.count(old)==1,"native popup baseline changed"
native.write_text(text.replace(old,new),encoding="utf-8")


# URL paste into the open device playlist. Keep the native menu and storage
# transaction intact; the helper validates the pasted host and video ID.
method("LocalPlaylists.smali",
       ".method public static options(Landroid/app/Activity;Landroid/view/Menu;)Z",
       '    :cond_27\n    const-string v1, "Create playlist"',
       '    :cond_27\n    invoke-static {p0, p1, v0}, Le/e/a/Dev113;->playlistUrlMenu(Landroid/app/Activity;Landroid/view/Menu;Ljava/lang/Object;)V\n\n'
       '    const-string v1, "Create playlist"')

# Use the existing gesture action mapping but add a ScrollView recognition path
# for the native My Page. Do not roll back its position on recognized gestures.
method("GestureControls110.smali",
       ".method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z",
       '    .registers 14\n\n    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;',
       '    .registers 14\n\n    invoke-static {p0, p1}, Le/e/a/Dev118;->myPageTouch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z\n\n'
       '    move-result v0\n\n'
       '    if-eqz v0, :nicoid113_native_gesture\n\n'
       '    const/4 v0, 0x1\n\n    return v0\n\n'
       '    :nicoid113_native_gesture\n'
       '    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;')

# Add one extra SeekBar stop, meaning "Unlimited"; use the same persistent
# option as before so existing 0..10000 settings remain compatible.
for name, method_sig in [
    ("SettingsPlacement233.smali", ".method public static finish(Landroid/preference/PreferenceActivity;)V"),
    ("SettingsTools.smali", ".method static synthetic lambda$1(Landroid/preference/PreferenceActivity;)V"),
]:
    method(name, method_sig,
           '    invoke-static {p0}, Le/e/a/Dev111;->settings(Landroid/preference/PreferenceActivity;)V',
           '    invoke-static {p0}, Le/e/a/Dev111;->settings(Landroid/preference/PreferenceActivity;)V\n\n'
           '    invoke-static {p0}, Le/e/a/Dev114;->installSettings(Landroid/preference/PreferenceActivity;)V')

# Map the unlimited sentinel to a positive effective limit and retain previous
# finite limits. The 80-request cap is removed, but server exhaustion, owner
# cancellation and memory checks still terminate the background fetch.
method("CommentHistory.smali",
       ".method public static initial(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
       '    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I\n\n'
       '    move-result v0',
       '    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I\n\n'
       '    move-result v0\n\n'
       '    invoke-static {v0}, Le/e/a/Dev114;->effectiveLimit(I)I\n\n'
       '    move-result v0')
method("CommentHistory.smali",
       ".method public static initial(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
       '    const/16 v1, 0x2710\n\n'
       '    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I\n\n'
       '    move-result v6',
       '    move v6, v0')
method("CommentHistory$Job.smali", ".method public run()V",
       '    const/16 v11, 0x50\n\n'
       '    if-ge v13, v11, :cond_2d8',
       '    const v11, 0x7fffffff\n\n'
       '    if-ge v13, v11, :cond_2d8\n\n'
       '    invoke-static {}, Le/e/a/Dev114;->memoryAvailable()Z\n\n'
       '    move-result v11\n\n'
       '    if-eqz v11, :cond_2d8')

# Build a one-pass cache index from the current directory snapshot. The normal
# media completeness checks remain the fallback for packaged archives/markers.
method("CacheListing.smali",
       ".method public static load(Ljava/util/ArrayList;Landroid/content/Context;)J",
       '    invoke-virtual {v0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;\n\n'
       '    move-result-object v9',
       '    invoke-virtual {v0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;\n\n'
       '    move-result-object v9\n\n'
       '    invoke-static {v6, v9}, Le/e/a/Dev117;->start(Ljava/lang/String;[Ljava/io/File;)V')
method("CacheListing.smali",
       ".method public static load(Ljava/util/ArrayList;Landroid/content/Context;)J",
       '    .line 12\n    return-wide v14',
       '    .line 12\n    invoke-static {}, Le/e/a/Dev117;->finish()V\n\n'
       '    return-wide v14')
method("CachedPlayback.smali",
       ".method public static completedBytes(Ljava/lang/String;Ljava/lang/String;)J",
       '    .line 9\n    const-wide/16 v0, -0x1',
       '    invoke-static {p0, p1}, Le/e/a/Dev117;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J\n\n'
       '    move-result-wide v0\n\n'
       '    const-wide/16 v2, -0x2\n\n'
       '    cmp-long v2, v0, v2\n\n'
       '    if-eqz v2, :nicoid117_normal_completion\n\n'
       '    return-wide v0\n\n'
       '    :nicoid117_normal_completion\n'
       '    .line 9\n    const-wide/16 v0, -0x1')

# Issue #112: retain the *normal* video view through a screen-off pause, if
# enabled and playing. Other lifecycle paths remain unchanged.
method("PlaybackLifecycle219.smali",
       ".method public static retain(Ljava/lang/Object;)Z",
       "    :nicoid_not_retained_137\n    const/4 v0, 0x0",
       "    :nicoid_not_retained_137\n"
       "    invoke-static {p0}, Le/e/a/Dev119;->retainWhenScreenOff(Ljava/lang/Object;)Z\n\n"
       "    move-result v0\n\n"
       "    if-eqz v0, :nicoid119_default_retain\n\n"
       "    const/4 v0, 0x1\n\n"
       "    return v0\n\n"
       "    :nicoid119_default_retain\n"
       "    const/4 v0, 0x0")

# Backfill only missing information in existing URL-added playlist entries.
# The helper throttles requests and restores the previous scroll position.
method("LocalPlaylists$Page.smali",
       ".method render()V",
       '    move-object/from16 v1, p0\n\n    const-string v0, "postedAt"',
       '    move-object/from16 v1, p0\n\n'
       '    invoke-static {v1}, Le/e/a/Dev120;->backfill(Ljava/lang/Object;)V\n\n'
       '    const-string v0, "postedAt"')

# Softer horizontal paging. The directional discrimination is unchanged so
# vertical scrolling and multi-stroke gestures keep their existing guards.
method("TabPagingRules233.smali",
       ".method public static commit(FIF)Z",
       "    const v3, 0x3e99999a    # 0.3f",
       "    const v3, 0x3e3851ec    # 0.18f")
method("TabPagingRules233.smali",
       ".method public static commit(FIF)Z",
       "    const/high16 v2, 0x44160000    # 600.0f",
       "    const/high16 v2, 0x43fa0000    # 500.0f")
method("Following190$Gestures.smali",
       ".method static shouldSwitch(FFII)Z",
       "    const v1, 0x3e4ccccd    # 0.2f",
       "    const v1, 0x3e19999a    # 0.15f")

# Preserve the user's chosen preview color after the common dialog theme has
# applied its background tint. The picker already refreshes on every RGB change.
method("CustomTheme119.smali",
       ".method static picker(Landroid/app/Activity;Landroid/widget/EditText;)V",
       "    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V\n\n"
       "    const/4 v0, -0x1",
       "    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V\n\n"
       "    const/4 v0, 0x0\n\n"
       "    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V\n\n"
       "    invoke-interface {v6}, Ljava/lang/Runnable;->run()V\n\n"
       "    const/4 v0, -0x1")

# The information-screen overflow uses Activity options rather than the video
# list's popup. Keep the native options and append one separate device action.
info = ROOT / "method-delta/com/sauzask/nicoid/NicoidVideoInfoActivity.smali"
native = info.read_text(encoding="utf-8")
old = (".method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n"
       "    .registers 9\n\n"
       "    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I")
new = (".method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n"
       "    .registers 9\n\n"
       "    invoke-static {p0, p1}, Le/e/a/Dev113;->infoSelected(Landroid/app/Activity;Landroid/view/MenuItem;)Z\n\n"
       "    move-result v0\n\n"
       "    if-eqz v0, :nicoid_info_normal_item\n\n"
       "    const/4 v0, 0x1\n\n"
       "    return v0\n\n"
       "    :nicoid_info_normal_item\n"
       "    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I")
assert native.count(old) == 1, "Unexpected information screen options implementation"
assert ".method public onPrepareOptionsMenu(Landroid/view/Menu;)Z" not in native
native = native.replace(old, new)
native += """
.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .registers 3

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z
    move-result v0

    invoke-static {p0, p1}, Le/e/a/Dev113;->infoMenu(Landroid/app/Activity;Landroid/view/Menu;)V

    return v0
.end method
"""

# Recheck ordering when the overflow is actually opened, after AppCompat has
# finished preparing the menu, without duplicating the existing item.
assert ".method public onMenuOpened(ILandroid/view/Menu;)Z" not in native
native += """
.method public onMenuOpened(ILandroid/view/Menu;)Z
    .registers 4

    invoke-super {p0, p1, p2}, Lcom/sauzask/nicoid/NicoidActivity;->onMenuOpened(ILandroid/view/Menu;)Z
    move-result v0

    invoke-static {p0, p2}, Le/e/a/Dev113;->infoMenu(Landroid/app/Activity;Landroid/view/Menu;)V

    return v0
.end method
"""
info.write_text(native, encoding="utf-8")

# Release the thread-local cache snapshot on exceptional exits as well.
path=HELPERS/"CacheListing.smali"
text=path.read_text(encoding="utf-8")
start=text.index(".method public static load(Ljava/util/ArrayList;Landroid/content/Context;)J")
end=text.index(".end method",start)
body=text[start:end]
hook="    invoke-static {v6, v9}, Le/e/a/Dev117;->start(Ljava/lang/String;[Ljava/io/File;)V"
assert body.count(hook)==1
body=body.replace(hook,hook+"\n\n    :audit136_index_start")
body+="""
    :audit136_index_end
    .catchall {:audit136_index_start .. :audit136_index_end} :audit136_index_cleanup
    :audit136_index_cleanup
    move-exception v0
    invoke-static {}, Le/e/a/Dev117;->finish()V
    throw v0
"""
path.write_text(text[:start]+body+text[end:],encoding="utf-8")

# v1.10.4 — keep published v1.10.3 sources immutable.
# ExoMedia owns the display timer, seek handling and the existing fade.
method("PopupControls193.smali",
       ".method public static attach(Ljava/lang/Object;Landroid/view/View;)V",
       "    invoke-static {p1, p0}, Le/e/a/QueueButtons110;->bind(Landroid/view/View;Ljava/lang/Object;)V",
       "    invoke-static {p0}, Le/e/a/Dev121;->controls(Ljava/lang/Object;)V\n\n"
       "    invoke-static {p1, p0}, Le/e/a/QueueButtons110;->bind(Landroid/view/View;Ljava/lang/Object;)V")
method("PlayerGestures.smali",
       ".method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z",
       "    move-object/from16 v1, p0\n\n    .line 26",
       "    move-object/from16 v1, p0\n\n"
       "    invoke-static/range {p0 .. p1}, Le/e/a/Dev121;->controls(Ljava/lang/Object;Landroid/view/MotionEvent;)V\n\n    .line 26")

# Configure normal controls on creation too, before the first user touch.
path = ROOT / "method-delta/com/sauzask/nicoid/NicoidVideoFragment.smali"
text = path.read_text(encoding="utf-8")
start = text.index(".method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;")
end = text.index(".end method", start)
block = text[start:end]
hook = "    invoke-static {v0}, Le/e/a/PopupReturn244;->created(Ljava/lang/Object;)V"
assert block.count(hook) == 3
block = block.replace(hook, "    invoke-static {v0}, Le/e/a/Dev121;->controls(Ljava/lang/Object;)V\n\n" + hook)
path.write_text(text[:start] + block + text[end:], encoding="utf-8")

# Hydration remains on the network worker. Scratch locals do not overwrite
# the live JSON/thread cursor registers or the relocated p0 parameter.
method("CommentHistory$Job.smali", ".method public run()V",
       "    :goto_ca\n    move-object/from16 v25, v11",
       "    :goto_ca\n    :audit141_job_start\n"
       "    move-object/from16 v38, p0\n"
       "    move-object/from16 v39, v18\n"
       "    move/from16 v40, v23\n"
       "    invoke-static/range {v38 .. v40}, Le/e/a/Dev121;->progress(Ljava/lang/Object;Lorg/json/JSONObject;I)V\n\n"
       "    move-object/from16 v25, v11")
method("CommentHistory$Job.smali", ".method public run()V",
       "    :goto_47f\n    return-void",
       "    :goto_47f\n    :audit141_job_end\n"
       "    invoke-static/range {p0 .. p0}, Le/e/a/Dev121;->done(Ljava/lang/Object;)V\n"
       "    return-void\n\n"
       # Dexlib forbids overlapping catch-all regions with different handlers.
       "    .catchall {:audit141_job_start .. :try_start_332} :audit141_job_cleanup\n"
       "    .catchall {:try_end_350 .. :audit141_job_end} :audit141_job_cleanup\n"
       "    :audit141_job_cleanup\n"
       "    move-exception v0\n"
       "    invoke-static/range {p0 .. p0}, Le/e/a/Dev121;->done(Ljava/lang/Object;)V\n"
       "    throw v0")
method("CommentHistory$Job.smali", ".method public run()V",
       "    .registers 39", "    .registers 42")

# Capture the watch identity when the UI runnable is queued, then recheck it
# at dispatch. Keep continuity, graph and Cast processing on their old path.
method("CommentUi.smali", ".method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    new-instance v0, Le/e/a/CommentUi$$ExternalSyntheticLambda1;\n\n"
       "    invoke-direct {v0, p0, p1}, Le/e/a/CommentUi$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    invoke-static {p0, p1}, Le/e/a/Dev121;->update(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/lang/Runnable;\n\n"
       "    move-result-object v0")

method("CommentUi.smali", ".method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    .registers 3", "    .registers 4")
method("CommentUi.smali", ".method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    invoke-static {p0, p1}, Le/e/a/CommentContinuity118;->merge",
       "    invoke-static {p0}, Le/e/a/Dev121;->ticket(Ljava/lang/Object;)Ljava/lang/Object;\n"
       "    move-result-object v1\n\n"
       "    invoke-static {p0, p1}, Le/e/a/CommentContinuity118;->merge")
method("CommentUi.smali", ".method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    invoke-static {p0, p1}, Le/e/a/Dev121;->update",
       "    invoke-static {v1, p1}, Le/e/a/Dev121;->update")

# Reject obsolete work before continuity and dependent publishers as well.
method("CommentUi.smali", ".method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    move-result-object v1\n\n    invoke-static {p0, p1}, Le/e/a/CommentContinuity118;->merge",
       "    move-result-object v1\n\n"
       "    invoke-static {v1}, Le/e/a/Dev121;->valid(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-nez v0, :audit141_comment_current\n"
       "    return-void\n"
       "    :audit141_comment_current\n"
       "    invoke-static {p0, p1}, Le/e/a/CommentContinuity118;->merge")

# Cast has its own main-thread queue; preserve the same generation there.
path = HELPERS / "CastControls218$1.smali"
text = path.read_text(encoding="utf-8")
assert text.count("# instance fields") == 1
text = text.replace("# instance fields", "# instance fields\n.field private final audit141Ticket:Ljava/lang/Object;")
path.write_text(text, encoding="utf-8")
method("CastControls218$1.smali", ".method constructor <init>(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    invoke-direct {p0}, Ljava/lang/Object;-><init>()V",
       "    invoke-direct {p0}, Ljava/lang/Object;-><init>()V\n\n"
       "    invoke-static {p1}, Le/e/a/Dev121;->ticket(Ljava/lang/Object;)Ljava/lang/Object;\n"
       "    move-result-object p1\n"
       "    iput-object p1, p0, Le/e/a/CastControls218$1;->audit141Ticket:Ljava/lang/Object;")
method("CastControls218$1.smali", ".method public run()V",
       "    .registers 4",
       "    .registers 4\n\n"
       "    iget-object v0, p0, Le/e/a/CastControls218$1;->audit141Ticket:Ljava/lang/Object;\n"
       "    invoke-static {v0}, Le/e/a/Dev121;->valid(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-nez v0, :audit141_cast_current\n"
       "    return-void\n"
       "    :audit141_cast_current")

# Release incremental indexes before the original full parse allocates its rows.
# The normal/exceptional epilogues remain idempotent fallbacks.
method("CommentHistory$Job.smali", ".method public run()V",
       "    :cond_31f\n    :goto_31f\n    if-lez v23, :cond_361",
       "    :cond_31f\n    :goto_31f\n"
       "    invoke-static/range {p0 .. p0}, Le/e/a/Dev121;->done(Ljava/lang/Object;)V\n\n"
       "    if-lez v23, :cond_361")


# v1.10.7-dev.8-dev.1: Fix comment posting without changing the published v1.10.4.
# The same-video parsed watch snapshot is authoritative and avoids an extra
# authenticated GET while video playback already has valid nvComment metadata.
method("ModernPosting.smali",
       ".method static watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;",
       "    .line 8\n    new-instance v0, Ljava/lang/StringBuilder;",
       "    .line 8\n"
       "    invoke-static {p0}, Le/e/a/Dev122;->cachedWatch(Ljava/lang/String;)Lorg/json/JSONObject;\n"
       "    move-result-object v0\n"
       "    if-eqz v0, :nicoid122_post_watch_network\n"
       "    return-object v0\n"
       "    :nicoid122_post_watch_network\n"
       "    new-instance v0, Ljava/lang/StringBuilder;")

# Honor the current posting host independently of the read server variant,
# but do not allow user-controlled or unexpected hosts or redirects.
method("ModernPosting.smali",
       ".method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V",
       "    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;\n\n"
       "    move-result-object v4",
       "    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;\n\n"
       "    move-result-object v4\n\n"
       "    invoke-static {v4}, Le/e/a/PostingPolicy122;->postServer(Ljava/lang/String;)Ljava/lang/String;\n"
       "    move-result-object v4")

# Match the authenticated official-web request headers already used by
# maintained clients. Keep the no-redirect and no-retry POST behavior.
method("ModernPosting.smali",
       ".method static jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;",
       '    const-string v3, "X-Request-With"',
       '    const-string v3, "X-Client-Os-Type"\n'
       '    const-string v4, "others"\n'
       '    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V\n\n'
       '    const-string v3, "Referer"\n'
       '    const-string v4, "https://www.nicovideo.jp/"\n'
       '    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V\n\n'
       '    const-string v3, "X-Request-With"')

# Log status/category only: never log post body, URL query, Cookie, or PostKey.
method("ModernPosting.smali",
       ".method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V",
       "    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;\n\n"
       "    move-result-object v0\n\n"
       "    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;\n\n"
       "    move-result-object v0",
       "    invoke-static {v0}, Le/e/a/PostingPolicy122;->describe(Ljava/lang/Throwable;)Ljava/lang/String;\n\n"
       "    move-result-object v0")

# v1.10.4 removed the old 80-call cap for unlimited history. Apply a shared
# background-only burst/refill guard to reduce server-side 429s, reserving
# capacity for an interactive comment POST. Preserve existing cancellation
# and low-memory guards (and the 500ms in-loop cooldown).
method("CommentHistory$Job.smali",
       ".method public run()V",
       "    const-wide/16 v27, 0x1f4\n\n"
       "    invoke-static/range {v27 .. v28}, Ljava/lang/Thread;->sleep(J)V",
       "    invoke-static {}, Le/e/a/Dev122;->throttleHistory()V\n\n"
       "    const-wide/16 v27, 0x1f4\n\n"
       "    invoke-static/range {v27 .. v28}, Ljava/lang/Thread;->sleep(J)V")


# v1.10.7-dev.8 — require a server-assigned post ID and number before success.
# The POST remains non-retried even if its outcome is ambiguous. On success,
# publish a same-session local echo via the existing CommentUi pipeline.
method("ModernPosting.smali",
       ".method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V",
       "    move-object/from16 v0, p2\n\n    :try_start_4",
       "    move-object/from16 v0, p2\n\n"
       "    invoke-static {v1}, Le/e/a/PostEcho123;->ticket(Ljava/lang/Object;)Ljava/lang/Object;\n"
       "    move-result-object p0\n\n    :try_start_4")
method("ModernPosting.smali",
       ".method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V",
       "    invoke-static {v4, v3, v0}, Le/e/a/ModernPosting;->jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;\n    :try_end_11b",
       "    invoke-static {v4, v3, v0}, Le/e/a/ModernPosting;->jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;\n"
       "    move-result-object v4\n"
       "    move-object/from16 v2, p0\n"
       "    invoke-static {v4, v1, v3, v2}, Le/e/a/PostEcho123;->accepted(Lorg/json/JSONObject;Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/Object;)V\n"
       "    :try_end_11b")

# Attach acknowledged comments to the same comment adapter used for normal
# and popup playback. After server retrieval contains the same 'no', drop
# the temporary echo without keeping duplicate rows.
method("CommentUi.smali",
       ".method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    invoke-static {p0, p1}, Le/e/a/CastControls218;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V",
       "    invoke-static {p0, p1}, Le/e/a/PostEcho123;->keep(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;\n"
       "    move-result-object p1\n\n"
       "    invoke-static {p0, p1}, Le/e/a/CastControls218;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V")


# v1.10.7-dev.8 — popup tap, double-tap, drag and pinch arbitration.
# Native edge-resize and the existing hold-to-speed detector run first.
# Non-control video streams are then routed to native window dragging, while
# video controls are toggled only on a confirmed, unmoved ACTION_UP.
method("PopupPinchLayout.smali",
       ".method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
       "    :cond_129\n    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
       "    :cond_129\n"
       "    invoke-static {v1, v3, v2}, Le/e/a/PopupTouch125;->dispatch(Landroid/view/View;Ljava/lang/Object;Landroid/view/MotionEvent;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid125_delegate_children\n"
       "    return v6\n"
       "    :nicoid125_delegate_children\n"
       "    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z")

# The parent has already consumed a real pinch or hold/edge resize. Invalidate
# any pending second-tap close; leave the respective native controllers intact.
method("PopupPinchLayout.smali",
       ".method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
       "    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z\n\n"
       "    .line 45",
       "    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z\n\n"
       "    invoke-static {v3}, Le/e/a/PopupTouch125;->cancel(Ljava/lang/Object;)V\n\n"
       "    .line 45")
method("PopupPinchLayout.smali",
       ".method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
       "    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->consuming:Z\n\n"
       "    .line 61",
       "    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->consuming:Z\n\n"
       "    invoke-static {v3}, Le/e/a/PopupTouch125;->cancel(Ljava/lang/Object;)V\n\n"
       "    .line 61")
method("PopupPinchLayout.smali",
       ".method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
       "    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V\n\n"
       "    return v6\n\n"
       "    :cond_129",
       "    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V\n\n"
       "    invoke-static {v3}, Le/e/a/PopupTouch125;->cancel(Ljava/lang/Object;)V\n"
       "    return v6\n\n"
       "    :cond_129")

# The old native gesture callback closed the service on the second ACTION_DOWN.
# This hook only arms a double-tap candidate, and PopupTouch125 finishes it
# on the second ACTION_UP after checking touch slop and pinch/drag cancellation.
def native_replace_method(name, signature, content):
    path = ROOT / "method-delta/com/sauzask/nicoid" / name
    source = path.read_text(encoding="utf-8")
    start = source.find(signature)
    if start < 0 or source.count(signature) != 1:
        raise RuntimeError(f"Missing/duplicate native method in {name}: {signature}")
    end = source.find("\n.end method", start)
    if end < 0:
        raise RuntimeError(f"Unterminated native method in {name}: {signature}")
    prior = source[start:end]
    if name.endswith("$k.smali") and "stopService" not in prior:
        raise RuntimeError("Unexpected legacy popup double-tap handler")
    path.write_text(source[:start] + content + source[end:], encoding="utf-8")

native_replace_method("NicoidPopupViewService$k.smali",
    ".method public onDoubleTap(Landroid/view/MotionEvent;)Z",
    ".method public onDoubleTap(Landroid/view/MotionEvent;)Z\n"
    "    .registers 3\n\n"
    "    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$k;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;\n"
    "    invoke-static {v0, p1}, Le/e/a/PopupTouch125;->doubleTap(Ljava/lang/Object;Landroid/view/MotionEvent;)Z\n"
    "    move-result v0\n"
    "    return v0")

# The native listener also receives forwarded popup events. Only the root
# bridge may toggle the popup chrome after a confirmed, in-region single tap.
path = ROOT / "method-delta/com/sauzask/nicoid/NicoidPopupViewService$k.smali"
source = path.read_text(encoding="utf-8")
assert "onSingleTapConfirmed" not in source
path.write_text(source + """
.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 3

    const/4 v0, 0x0
    return v0
.end method
""", encoding="utf-8")

# Skip GestureDetector after a drag has been established, so it cannot consume
# native window MOVE events. Also allow the native ACTION_DOWN initialization
# even if GestureDetector recognized a second tap at DOWN.
def native_edit(name, signature, old, new):
    path = ROOT / "method-delta/com/sauzask/nicoid" / name
    source = path.read_text(encoding="utf-8")
    start = source.find(signature)
    end = source.find("\n.end method", start)
    if start < 0 or end < 0:
        raise RuntimeError(f"Missing native method in {name}")
    block = source[start:end]
    if block.count(old) != 1:
        raise RuntimeError(f"Unexpected native baseline {name}: {old[:90]!r}; count={block.count(old)}")
    path.write_text(source[:start] + block.replace(old, new) + source[end:], encoding="utf-8")

native_edit("NicoidPopupViewService.smali",
    ".method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z",
    "    :cond_8\n    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Y:Landroid/view/GestureDetector;",
    "    :cond_8\n"
    "    invoke-static {p0}, Le/e/a/PopupTouch125;->dragging(Ljava/lang/Object;)Z\n"
    "    move-result v0\n"
    "    if-nez v0, :cond_12\n"
    "    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Y:Landroid/view/GestureDetector;")
native_edit("NicoidPopupViewService.smali",
    ".method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z",
    "    if-eqz v0, :cond_12\n\n    return v1",
    "    if-eqz v0, :cond_12\n\n"
    "    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I\n"
    "    move-result v0\n"
    "    if-eqz v0, :cond_12\n\n"
    "    return v1")


# v1.10.7-dev.8: Android 16 rejected onTouch's branch to :cond_12
# because v1 was read before initialization in the drag-suppression path.
# Initialize the register before *either* control-flow edge can reach it.
native_edit("NicoidPopupViewService.smali",
    ".method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z",
    "    :cond_8\n    invoke-static {p0}, Le/e/a/PopupTouch125;->dragging(Ljava/lang/Object;)Z",
    "    :cond_8\n    const/4 v1, 0x1\n"
    "    invoke-static {p0}, Le/e/a/PopupTouch125;->dragging(Ljava/lang/Object;)Z")

# Public mylist titles arrive asynchronously through TabChrome228.title().
# Synchronize the selected saved tab on that real title callback. No network,
# no periodic polling, and no changes to manually renamed tab labels.
method("TabChrome228.smali",
       ".method public static title(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V",
       "    invoke-static {p2}, Le/e/a/TabChrome228;->current(Ljava/lang/Object;)Z",
       "    invoke-static {p2, p1}, Le/e/a/Dev126;->publicMylistTitle(Ljava/lang/Object;Ljava/lang/CharSequence;)V\n"
       "    invoke-static {p2}, Le/e/a/TabChrome228;->current(Ljava/lang/Object;)Z")


# v1.10.7-dev.8 — fix blank account history URL in saved tabs.
# MultiTabs.describe uses Intent.getDataString(), which may be null at startup.
# The previous code persisted "" for an account-history tab and the next
# fragment treated it as an explicit URL. e0.a() then attempted an HTTP
# request with scheme=null/host=null/path="" and the spinner never cleared.
# Repair only type=4; local history and other list routes must stay intact.

# Repair existing persisted tabs as soon as their JSON is reconstructed.
method("SavedTabs227$Tab.smali",
       ".method constructor <init>(Lorg/json/JSONObject;)V",
       "    iput v0, p0, Le/e/a/SavedTabs227$Tab;->type:I",
       "    iput v0, p0, Le/e/a/SavedTabs227$Tab;->type:I\n\n"
       "    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;\n"
       "    invoke-static {v0, v2}, Le/e/a/TabHistory127;->url(ILjava/lang/String;)Ljava/lang/String;\n"
       "    move-result-object v2\n"
       "    iput-object v2, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;")

# Avoid persisting a broken new account-history tab on initial launch.
method("MultiTabs227.smali",
       ".method static describe(Landroid/app/Activity;)Le/e/a/SavedTabs227$Tab;",
       "    iput v2, v0, Le/e/a/SavedTabs227$Tab;->type:I",
       "    iput v2, v0, Le/e/a/SavedTabs227$Tab;->type:I\n\n"
       "    iget-object v4, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;\n"
       "    invoke-static {v2, v4}, Le/e/a/TabHistory127;->url(ILjava/lang/String;)Ljava/lang/String;\n"
       "    move-result-object v4\n"
       "    iput-object v4, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;\n"
       "    const/4 v4, 0x0")

# One final guard at navigation time, including in-memory legacy tabs. A
# corrected URL is written back to the same saved tab; the tab ID, name and
# scroll position are untouched.
method("TabRoutes228.smali",
       ".method static intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;",
       "    .line 17\n    new-instance v0, Landroid/content/Intent;",
       "    .line 17\n"
       "    iget v0, p1, Le/e/a/SavedTabs227$Tab;->type:I\n"
       "    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;\n"
       "    invoke-static {v0, v1}, Le/e/a/TabHistory127;->url(ILjava/lang/String;)Ljava/lang/String;\n"
       "    move-result-object v1\n"
       "    iput-object v1, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;\n\n"
       "    new-instance v0, Landroid/content/Intent;")


# Issue #113: native vertical reversals must remain scroll gestures when OFF.
# Hook after the existing threshold guard but BEFORE claiming the event,
# cancelling native touch, discarding the tab pager or changing list position.
# Three-stroke patterns UDL/UDR/DUL/DUR remain eligible at their third stroke.
method("GestureControls110.smali",
       ".method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z",
       "    invoke-static {v3, p1, v1}, Le/e/a/Dev112;->verticalTurnReady(Ljava/lang/Object;Landroid/view/MotionEvent;F)Z\n\n"
       "    move-result v0\n\n    if-eqz v0, :cond_1b1\n\n"
       "    iput-boolean v5, v3, Le/e/a/GestureControls110$State;->claimed:Z",
       "    invoke-static {v3, p1, v1}, Le/e/a/Dev112;->verticalTurnReady(Ljava/lang/Object;Landroid/view/MotionEvent;F)Z\n\n"
       "    move-result v0\n\n    if-eqz v0, :cond_1b1\n\n"
       "    iget-object v0, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;\n"
       "    iget-object v0, v0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;\n"
       "    invoke-static {p0, v0}, Le/e/a/Dev128;->allowClaim(Landroid/content/Context;Ljava/lang/String;)Z\n"
       "    move-result v0\n    if-eqz v0, :cond_1b1\n\n"
       "    iput-boolean v5, v3, Le/e/a/GestureControls110$State;->claimed:Z")

# Preserve the existing gesture configuration UI while adding a localized
# setting label/description using the application's current theme.
method("GestureControls110.smali",
       ".method static configure(Landroid/app/Activity;)V",
       "    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V\n\n"
       '    const-string v2, ""',
       "    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V\n\n"
       "    invoke-static {p0, v1}, Le/e/a/Dev128;->install(Landroid/app/Activity;Landroid/widget/LinearLayout;)V\n\n"
       '    const-string v2, ""')

# "Restore defaults" must reset the new toggle to its default OFF.
# Do not reset until the user has confirmed the existing reset dialog.
method("GestureControls110.smali",
       ".method static synthetic lambda$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V",
       "    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V\n\n"
       "    const/4 p1, 0x0",
       "    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V\n\n"
       "    invoke-static {p0}, Le/e/a/Dev128;->reset(Landroid/content/Context;)V\n\n"
       "    const/4 p1, 0x0")


# v1.10.7-dev.8: gesture sensitivity's secondary line is small and grey.
# Apply after every slider change, rather than only when opening the dialog.
method("GestureControls110.smali",
       ".method static synthetic lambda$4(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/SeekBar;)V",
       "    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V",
       "    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V\n\n"
       "    invoke-static {p0}, Le/e/a/Dev130;->styleSensitivity(Landroid/widget/TextView;)V")

# Strip only the trailing sentence stop from the instruction below the slider.
method("GestureControls110.smali",
       ".method static configure(Landroid/app/Activity;)V",
       "    const/16 v3, 0xd\n\n"
       "    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;\n\n"
       "    move-result-object v2\n\n"
       "    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V",
       "    const/16 v3, 0xd\n\n"
       "    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;\n\n"
       "    move-result-object v2\n\n"
       "    invoke-static {v2}, Le/e/a/Dev130;->stripFinalStop(Landroid/widget/TextView;)V\n\n"
       "    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V")

# The Other category exists in the original preferences and is renamed by
# SettingsTools; installer is idempotent across both settings entry points.
for settings_class, settings_sig in [
    ("SettingsPlacement233.smali", ".method public static finish(Landroid/preference/PreferenceActivity;)V"),
    ("SettingsTools.smali", ".method static synthetic lambda$1(Landroid/preference/PreferenceActivity;)V")
]:
    method(settings_class, settings_sig,
           "    invoke-static {p0}, Le/e/a/Dev114;->installSettings(Landroid/preference/PreferenceActivity;)V",
           "    invoke-static {p0}, Le/e/a/Dev114;->installSettings(Landroid/preference/PreferenceActivity;)V\n\n"
           "    invoke-static {p0}, Le/e/a/Dev131;->installSettings(Landroid/preference/PreferenceActivity;)V")

# The original VideoView.start() already goes through the platform audio focus
# helper. Configure its enabled flag before requestFocus(), on every start,
# without creating a second audio focus manager or altering playback state.
video = ROOT / "method-delta/com/devbrackets/android/exomedia/ui/widget/VideoView.smali"
source = video.read_text(encoding="utf-8")
needle = "    if-eqz v0, :cond_1e\n\n    iget-object v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->audioFocusHelper:"
assert source.count(needle) == 1, "Unexpected VideoView.start audio-focus baseline"
source = source.replace(
    needle,
    "    if-eqz v0, :cond_1e\n\n"
    "    invoke-static {p0}, Le/e/a/Dev131;->applyToPlayer(Landroid/view/View;)V\n\n"
    "    iget-object v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->audioFocusHelper:")
video.write_text(source, encoding="utf-8")

# Popup/background service uses its existing listener, and only requests focus
# if the user explicitly enables it. Unlike the normal player, the service
# owns the focus callback; do not introduce duplicate focus requests.
native_edit("NicoidPopupViewService.smali",
            ".method public onStartCommand(Landroid/content/Intent;II)I",
            "    invoke-virtual {v1, v4, v3, p3}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I",
            "    invoke-static {p0, v1, v4, v3, p3}, Le/e/a/Dev131;->requestServiceFocus(Landroid/content/Context;Landroid/media/AudioManager;Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I")


# v1.10.7-dev.8: native vertical tab manager, preserving existing tab routes.
# The gesture action is opt-in; no existing gesture bindings are changed.
method("GestureControls110.smali", ".method static constructor <clinit>()V",
       "    .registers 9", "    .registers 11")
method("GestureControls110.smali", ".method static constructor <clinit>()V",
       '    const-string v8, "righttab"',
       '    const-string v8, "righttab"\n\n    const-string v9, "tablist"\n\n    const-string v10, "addtab"')
method("GestureControls110.smali", ".method static constructor <clinit>()V",
       "    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;",
       "    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;")
method("GestureControls110.smali",
       ".method static name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;",
       "    .registers 12",
       "    .registers 12\n\n"
       '    const-string v0, "addtab"\n'
       "    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid135_name_tablist\n"
       "    invoke-static {p0}, Le/e/a/Dev132;->addActionName(Landroid/content/Context;)Ljava/lang/String;\n"
       "    move-result-object v0\n"
       "    return-object v0\n"
       "    :nicoid135_name_tablist\n"
       '    const-string v0, "tablist"\n'
       "    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid132_original_name\n"
       "    invoke-static {p0}, Le/e/a/Dev132;->actionName(Landroid/content/Context;)Ljava/lang/String;\n"
       "    move-result-object v0\n"
       "    return-object v0\n"
       "    :nicoid132_original_name")
method("GestureControls110.smali",
       ".method static perform(Landroid/app/Activity;Ljava/lang/String;)V",
       "    .registers 7",
       "    .registers 7\n\n"
       '    const-string v0, "addtab"\n'
       "    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid135_perform_tablist\n"
       "    invoke-static {p0}, Le/e/a/Dev132;->showAddTab(Landroid/app/Activity;)V\n"
       "    return-void\n"
       "    :nicoid135_perform_tablist\n"
       '    const-string v0, "tablist"\n'
       "    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid132_original_action\n"
       "    invoke-static {p0}, Le/e/a/Dev132;->show(Landroid/app/Activity;)V\n"
       "    return-void\n"
       "    :nicoid132_original_action")
# Add one fixed-width button to the *left* of the scrollable tab strip.
# Respect separately stored visibility preferences for the existing right +.
method("MultiTabs227$Host.smali", ".method bar()V",
       "    iput-object v7, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;",
       "    iput-object v7, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;\n\n"
       "    invoke-static {v0, v7}, Le/e/a/Dev132;->decorateBar(Ljava/lang/Object;Landroid/widget/LinearLayout;)V")


# v1.10.7-dev.8: distinguish identical rankings opened via the old startup
# URL and the public ranking menu, without conflating distinct genres/periods.
method("MultiTabs227.smali",
       ".method static match(Le/e/a/SavedTabs227$Tab;)Le/e/a/SavedTabs227$Tab;",
       "    check-cast v1, Le/e/a/SavedTabs227$Tab;",
       "    check-cast v1, Le/e/a/SavedTabs227$Tab;\n\n"
       "    invoke-static {p0, v1}, Le/e/a/Dev132;->sameRanking(Ljava/lang/Object;Ljava/lang/Object;)Z\n"
       "    move-result v2\n"
       "    if-eqz v2, :nicoid133_check_other_tabs\n"
       "    return-object v1\n"
       "    :nicoid133_check_other_tabs")

# Remember closes initiated by the horizontal strip as well as by the dialog.
method("MultiTabs227$Host.smali",
       ".method close(Le/e/a/SavedTabs227$Tab;)V",
       "    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->capture()V",
       "    invoke-static {p0, p1}, Le/e/a/Dev132;->rememberClosed(Ljava/lang/Object;Ljava/lang/Object;)V\n\n"
       "    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->capture()V")


# v1.10.7-dev.8: a ranking period change is a data/navigation
# operation, not a swipe gesture. The original spinner listener starts a
# replacement Activity and finishes the previous one with OS slide effects.
# Skip both the enter and exit activity animations; actual swipes retain
# TabPager233's user-driven animation.
method("RankingPeriod$1.smali",
       ".method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V",
       "    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V",
       "    const p4, 0x10000  # Intent.FLAG_ACTIVITY_NO_ANIMATION\n"
       "    invoke-virtual {p1, p4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;\n\n"
       "    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V\n\n"
       "    const/4 p3, 0x0\n"
       "    invoke-virtual {p2, p3, p3}, Landroid/app/Activity;->overridePendingTransition(II)V")
method("RankingPeriod$1.smali",
       ".method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V",
       "    invoke-virtual {p1}, Landroid/app/Activity;->finish()V",
       "    invoke-virtual {p1}, Landroid/app/Activity;->finish()V\n\n"
       "    invoke-virtual {p1, p3, p3}, Landroid/app/Activity;->overridePendingTransition(II)V")

# A restored or programmatically selected tab must not inherit a partially
# claimed finger swipe from an earlier page. It should appear immediately.
method("MultiTabs227$Host.smali",
       ".method select(Ljava/lang/String;)V",
       "    .line 53",
       "    .line 53\n"
       "    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;\n"
       "    invoke-static {v0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V")


# v1.10.7-dev.8: update ranking period IN PLACE.
# Retain the Activity, current tab ID, Fragment and list view; only the
# selected tab's URL/subtitle and normal refresh data source change.
# The previous startActivity/finish path is now an exceptional fallback.
method("RankingPeriod$1.smali",
       ".method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V",
       "    invoke-static {p1, p2}, Le/e/a/RankingCaption232;->intent(Landroid/content/Intent;Landroid/app/Activity;)V",
       "    invoke-static {p1, p2}, Le/e/a/RankingCaption232;->intent(Landroid/content/Intent;Landroid/app/Activity;)V\n\n"
       "    invoke-static {p2, p1}, Le/e/a/Dev134;->applyPeriod(Landroid/app/Activity;Landroid/content/Intent;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid134_legacy_fallback\n"
       "    return-void\n"
       "    :nicoid134_legacy_fallback")


# Add Ranking immediately below Search in the shared + button/gesture menu.
# The original native choice numbers stay unchanged for existing tab routes.
method("TabRoutes228.smali",
       ".method static addLabels(Landroid/app/Activity;)[Ljava/lang/String;",
       "    filled-new-array/range {v3 .. v11}, [Ljava/lang/String;\n\n"
       "    move-result-object p0\n\n"
       "    return-object p0",
       "    filled-new-array/range {v3 .. v11}, [Ljava/lang/String;\n\n"
       "    move-result-object v3\n\n"
       "    invoke-static {p0, v3}, Le/e/a/Dev132;->addRankingLabel(Landroid/app/Activity;[Ljava/lang/String;)[Ljava/lang/String;\n\n"
       "    move-result-object p0\n\n"
       "    return-object p0")
# Existing native tab labels are indexed by their old menu positions. Account
# for the single new item without changing the names of saved/restored tabs.
method("TabRoutes228.smali",
       ".method static label(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)V",
       "    aget-object p0, p0, v0",
       "    add-int/lit8 v0, v0, 0x1\n\n"
       "    aget-object p0, p0, v0")
# The native add-tab click callback keeps its old Query/Choice implementations.
# Only selection 1 opens the ranking list; later selections use index-1.
method("MultiTabs227$Host.smali",
       ".method synthetic lambda$4$e-e-a-MultiTabs227$Host([Ljava/lang/String;Landroid/content/DialogInterface;I)V",
       "    :cond_7\n    iget-object p2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;",
       "    :cond_7\n    const/4 p2, 0x1\n"
       "    if-ne p3, p2, :nicoid_ranking_other_choice\n"
       "    invoke-static {p0}, Le/e/a/Dev132;->addRankingTab(Ljava/lang/Object;)V\n"
       "    goto :goto_12\n"
       "    :nicoid_ranking_other_choice\n"
       "    iget-object p2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;")
method("MultiTabs227$Host.smali",
       ".method synthetic lambda$4$e-e-a-MultiTabs227$Host([Ljava/lang/String;Landroid/content/DialogInterface;I)V",
       "    invoke-static {p2, p3, p1}, Le/e/a/TabRoutes228;->choice(Landroid/app/Activity;ILjava/lang/String;)Le/e/a/SavedTabs227$Tab;",
       "    add-int/lit8 p3, p3, -0x1\n"
       "    invoke-static {p2, p3, p1}, Le/e/a/TabRoutes228;->choice(Landroid/app/Activity;ILjava/lang/String;)Le/e/a/SavedTabs227$Tab;")


# v1.10.7-dev.10: dispatch additional gestures to native left-drawer actions.
# Extend after the existing tab-list/add-tab choices; preserve their IDs and
# existing user gesture mappings.
method("GestureControls110.smali",
       ".method static constructor <clinit>()V",
       "    sput-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;",
       "    invoke-static {v0}, Le/e/a/Dev138;->extend([Ljava/lang/String;)[Ljava/lang/String;\n"
       "    move-result-object v0\n\n"
       "    sput-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;")
method("GestureControls110.smali",
       ".method static name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;",
       '    .registers 12\n\n    const-string v0, "addtab"',
       '    .registers 12\n\n'
       '    invoke-static {p0, p1}, Le/e/a/Dev138;->actionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;\n'
       '    move-result-object v0\n'
       '    if-eqz v0, :nicoid_menu_138_original_name\n'
       '    return-object v0\n'
       '    :nicoid_menu_138_original_name\n'
       '    const-string v0, "addtab"')
method("GestureControls110.smali",
       ".method static perform(Landroid/app/Activity;Ljava/lang/String;)V",
       '    .registers 7\n\n    const-string v0, "addtab"',
       '    .registers 7\n\n'
       '    invoke-static {p0, p1}, Le/e/a/Dev138;->perform(Landroid/app/Activity;Ljava/lang/String;)Z\n'
       '    move-result v0\n'
       '    if-eqz v0, :nicoid_menu_138_original_action\n'
       '    return-void\n'
       '    :nicoid_menu_138_original_action\n'
       '    const-string v0, "addtab"')


# v1.11.1-dev.6: keep the existing decoded output when a TextureView is
# detached and reattached to the normal screen.  VideoOutput227.bind still
# serializes all UI requests; its final connector is now idempotent.
replace_method("VideoOutput227.smali",
    ".method static connect(Landroid/view/View;Landroid/view/TextureView;)V",
    """.method static connect(Landroid/view/View;Landroid/view/TextureView;)V
    .registers 2
    invoke-static {p0, p1}, Le/e/a/Dev139;->connect(Landroid/view/View;Landroid/view/TextureView;)V
    return-void
.end method""")

# The notification's existing Activity is the return target. Do not launch a
# second watch Activity while the first is still creating its normal player.
method("MediaControls.smali", ".method static open(Le/e/a/MediaControls$State;)Landroid/app/PendingIntent;",
       "    iget-object p0, p0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;",
       "    invoke-static {p0, v0}, Le/e/a/Dev140;->markNotification(Ljava/lang/Object;Landroid/content/Intent;)V\n\n"
       "    iget-object p0, p0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;")
native_method("NicoidVideoActivity.smali", ".method public onCreate(Landroid/os/Bundle;)V",
       "    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V",
       "    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V\n\n"
       "    invoke-static {p0}, Le/e/a/Dev140;->prepare(Landroid/app/Activity;)Z\n"
       "    move-result v0\n"
       "    if-nez v0, :nicoid_notification_prepared\n"
       "    return-void\n"
       "    :nicoid_notification_prepared")
method("PlaybackNavigation114.smali", ".method static launch(Landroid/app/Service;Landroid/content/Intent;)V",
       "    invoke-static {p1}, Le/e/a/PlaybackNavigation114;->mark(Landroid/content/Intent;)V",
       "    invoke-static {p1}, Le/e/a/PlaybackNavigation114;->mark(Landroid/content/Intent;)V\n\n"
       "    invoke-static {p0, p1}, Le/e/a/Dev140;->consumeLaunch(Landroid/app/Service;Landroid/content/Intent;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :nicoid_launch_normally\n"
       "    return-void\n"
       "    :nicoid_launch_normally")
native_method("NicoidVideoFragment.smali", ".method public final b(Ljava/lang/String;)V",
       "    if-nez v0, :cond_99\n\n    :try_start_6",
       "    if-nez v0, :cond_99\n\n"
       "    invoke-static {p0}, Le/e/a/Dev140;->abortFailedReturn(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :try_start_6\n"
       "    return-void\n\n    :try_start_6")
native_method("NicoidVideoFragment.smali", ".method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;",
       "    if-nez v5, :cond_544\n\n    new-instance v5, Le/e/a/d0;",
       "    if-nez v5, :cond_544\n\n"
       "    invoke-static {v0}, Le/e/a/Dev140;->abortFailedReturn(Ljava/lang/Object;)Z\n"
       "    move-result v5\n"
       "    if-eqz v5, :nicoid_create_native_loader\n"
       "    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;\n"
       "    return-object v5\n"
       "    :nicoid_create_native_loader\n"
       "    new-instance v5, Le/e/a/d0;")

# Record the actual native output before the first mini/return reparent.
method("DirectBackground235.smali", ".method public static prepared(Ljava/lang/Object;)V",
       "    if-eqz v3, :cond_65\n\n    new-instance v3, Le/e/a/MiniSession225$SurfaceKeeper;",
       "    if-eqz v3, :cond_65\n\n"
       "    invoke-static {p0, v3}, Le/e/a/Dev139;->rememberOutput(Landroid/view/View;Landroid/view/TextureView;)V\n\n"
       "    new-instance v3, Le/e/a/MiniSession225$SurfaceKeeper;")

# PopupReturn244 retires its pending request before restoring portrait.
# Clear the consumed Intent token at that existing lifecycle checkpoint.
method("PlayerGestures219.smali", ".method public static fullscreen(Landroid/app/Activity;Ljava/lang/Object;Z)V",
       "    .line 72\n    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;",
       "    .line 72\n"
       "    invoke-static {p0}, Le/e/a/Dev140;->retireReturnToken(Landroid/app/Activity;)V\n\n"
       "    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;")

# Insert alongside the quiet-gesture preference once settings are assembled.
method("Review181.smali", ".method public static settings(Landroid/preference/PreferenceActivity;)V",
       "    :cond_cc\n    return-void",
       "    :cond_cc\n    invoke-static {p0}, Le/e/a/TapRegionSettings141;->install(Landroid/preference/PreferenceActivity;)V\n"
       "    return-void")

# Observe the single-tap candidate after the app's gesture and seek handlers.
native_method("NicoidVideoActivity.smali", ".method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
              "    :cond_8\n    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z",
              "    :cond_8\n"
              "    invoke-static {p0, p1}, Le/e/a/TapControls141;->activityTouch(Landroid/app/Activity;Landroid/view/MotionEvent;)V\n"
              "    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z")

# Extend the actual button registry, the stock customization dialog and the
# fullscreen reparenting list with the same stable ID.
ambient = "Le/e/a/AmbientLight;"
def ambient_array(file, signature, anchor, register, name):
    method(file, signature, anchor,
           f"    invoke-static {{{register}}}, {ambient}->{name}([Ljava/lang/String;)[Ljava/lang/String;\n"
           f"    move-result-object {register}\n\n" + anchor)

for file in ("PlayerControls194.smali", "PlayerButtons193.smali"):
    method(
        file, ".method static constructor <clinit>()V",
        f"    filled-new-array/range {{v0 .. v7}}, [Ljava/lang/String;\n\n    move-result-object v0",
        f"    filled-new-array/range {{v0 .. v7}}, [Ljava/lang/String;\n\n    move-result-object v0\n"
        f"    invoke-static {{v0}}, {ambient}->appendId([Ljava/lang/String;)[Ljava/lang/String;\n"
        f"    move-result-object v0")
ambient_array("PlayerButtons193.smali", ".method static constructor <clinit>()V",
              "    sput-object v0, Le/e/a/PlayerButtons193;->LABELS:[Ljava/lang/String;\n\n    .line 8",
              "v0", "appendLabel")
method("PlayerControls194.smali", ".method public static apply(Ljava/lang/Object;Landroid/view/View;)V",
       "    :cond_e\n    check-cast v0, Landroid/widget/LinearLayout;",
       "    :cond_e\n    check-cast v0, Landroid/widget/LinearLayout;\n"
       f"    invoke-static {{p0, p1, v0}}, {ambient}->foreground(Ljava/lang/Object;Landroid/view/View;Landroid/widget/LinearLayout;)V")
method("PlayerControls194.smali", ".method static button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;",
       "    :cond_7\n    const-string v0, \"speed\"",
       "    :cond_7\n    const-string v0, \"ambient\"\n"
       "    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n"
       "    move-result v0\n"
       "    if-eqz v0, :ambient_other\n"
       "    const-string v0, \"player-ambient\"\n"
       "    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n"
       "    move-result-object v0\n"
       "    return-object v0\n"
       "    :ambient_other\n    const-string v0, \"speed\"")
method("PopupControl222.smali", ".method public static hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;",
       "    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V",
       "    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V\n"
       f"    invoke-static {{v1, p0}}, {ambient}->defaultHidden(Ljava/util/Set;Landroid/content/SharedPreferences;)V")
method("PopupControl222.smali", ".method public static reset(Ljava/util/Set;)V",
       "    return-void", f"    invoke-static {{p0}}, {ambient}->resetHidden(Ljava/util/Set;)V\n    return-void")
for file, signature, regs, pref in (
    ("PlayerControls194.smali", ".method public static arrange(Landroid/widget/LinearLayout;Landroid/view/View;)V", "v0, v1, v2", "v0"),
    ("FullscreenScreen203$State.smali", ".method layout()V", "v1, v2, v3", "v1"),
):
    method(file, signature,
           f"    invoke-interface {{{regs}}}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;",
           f"    invoke-static {{{pref}}}, Le/e/a/PopupControl222;->hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;")
method("FullscreenScreen203$State.smali", ".method constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V",
       "    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;\n\n    move-result-object p3\n\n    const/4 p4, 0x0\n\n    :goto_d1\n    const/16 v2, 0x8",
       "    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;\n\n    move-result-object p3\n"
       f"    invoke-static/range {{p3 .. p3}}, {ambient}->appendId([Ljava/lang/String;)[Ljava/lang/String;\n"
       "    move-result-object p3\n\n    const/4 p4, 0x0\n\n    :goto_d1\n    array-length v2, p3")
method("PopupControls193.smali", ".method constructor <init>(Ljava/lang/Object;Landroid/view/View;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;)V",
       "    invoke-static {p0}, Le/e/a/PopupCenter243;->bind(Le/e/a/PopupControls193;)V",
       "    invoke-static {p0}, Le/e/a/PopupCenter243;->bind(Le/e/a/PopupControls193;)V\n"
       f"    invoke-static {{p0}}, {ambient}->popup(Ljava/lang/Object;)V")
method("FullscreenViewport209.smali", ".method public static update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V",
       "    move-object/from16 v7, p0",
       f"    invoke-static/range {{p0 .. p1}}, {ambient}->fullscreen(Landroid/view/View;Landroid/view/View;)V\n"
       "    move-object/from16 v7, p0")
method("FullscreenViewport209.smali", ".method public static restore(Landroid/view/View;)V",
       "    invoke-static {p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V",
       f"    invoke-static {{p0}}, {ambient}->restore(Landroid/view/View;)V\n"
       "    invoke-static {p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V")
method("Review181.smali", ".method public static settings(Landroid/preference/PreferenceActivity;)V",
       "    invoke-static {p0}, Le/e/a/TapRegionSettings141;->install(Landroid/preference/PreferenceActivity;)V",
       "    invoke-static {p0}, Le/e/a/TapRegionSettings141;->install(Landroid/preference/PreferenceActivity;)V\n"
       "    invoke-static {p0}, Le/e/a/AmbientSettings;->install(Landroid/preference/PreferenceActivity;)V")

# v1.11.1-dev.6: SettingsBackupData is shipped as precompiled Smali.
# Java source registration alone would NOT reach users: register the exact
# same 17 keys in its actual <clinit> before encode/decode can inspect TYPES.
method("SettingsBackupData.smali", ".method static constructor <clinit>()V",
       "    .registers 1", "    .registers 3")
method("SettingsBackupData.smali", ".method static constructor <clinit>()V",
       "    return-void", "    sget-object v0, Le/e/a/SettingsBackupData;->TYPES:Ljava/util/Map;\n    const-string v1, \"nicoid_single_tap_control_region\"\n    const-string v2, \"string\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_single_tap_region_open_only\"\n    const-string v2, \"boolean\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_enabled\"\n    const-string v2, \"boolean\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_mode_0\"\n    const-string v2, \"boolean\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_mode_1\"\n    const-string v2, \"boolean\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_mode_2\"\n    const-string v2, \"boolean\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_sides\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_intensity\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_spread\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_softness\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_brightness\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_contrast\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_saturation\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_vibrance\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_response\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_rate\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n    const-string v1, \"nicoid_ambient_resolution\"\n    const-string v2, \"int\"\n    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n\n    return-void")
