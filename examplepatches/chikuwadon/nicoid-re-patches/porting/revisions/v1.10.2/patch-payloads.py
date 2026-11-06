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


# The switch guard fires only after onStop, not during in-app navigation.
method("AppSwitchGuard$1.smali", ".method public run()V",
       "    :cond_3b\n    iget-object v1, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;",
       "    :cond_3b\n    invoke-static {}, Le/e/a/Dev111;->left()V\n\n"
       "    iget-object v1, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;")

# Run the optional return decision after the existing return controller.
method("AppSwitchGuard$2.smali", ".method public onActivityResumed(Landroid/app/Activity;)V",
       "    invoke-static {p1}, Le/e/a/PlaybackReturn;->foreground(Landroid/app/Activity;)V",
       "    invoke-static {p1}, Le/e/a/PlaybackReturn;->foreground(Landroid/app/Activity;)V\n\n"
       "    invoke-static {p1}, Le/e/a/Dev111;->resumed(Landroid/app/Activity;)V")

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
# both values on the staged copy, using the selected Gradle release version.
version=sys.argv[2] if len(sys.argv)>2 else "1.10.2"
assert version == "1.10.2", f"Expected approved release v1.10.2, got {version}"
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

print("Applied v1.10.2 overlay to", ROOT)

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
