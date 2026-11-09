#!/usr/bin/env python3
"""Fail fast on missing development features and incomplete payload assembly."""
import pathlib
import sys
import hashlib
import struct

root = pathlib.Path(sys.argv[1])
output = pathlib.Path(sys.argv[2])
helper = root / "helpers/e/e/a"
expected = {
    "AppSwitchGuard$1.smali": ["Dev111;->left()V"],
    "AppSwitchGuard$2.smali": ["Dev111;->resumed(Landroid/app/Activity;)V"],
    "SettingsPlacement233.smali": ["Dev111;->settings(Landroid/preference/PreferenceActivity;)V", "Dev114;->installSettings(Landroid/preference/PreferenceActivity;)V"],
    "SettingsTools.smali": ["Dev111;->settings(Landroid/preference/PreferenceActivity;)V", "Dev114;->installSettings(Landroid/preference/PreferenceActivity;)V"],
    "MultiTabs227.smali": ["Dev111;->loadedTabs(Ljava/lang/Object;Landroid/content/Context;)V"],
    "MultiTabs227$Host.smali": ["Dev111;->initialTab(Ljava/lang/Object;)V", "Dev111;->pageResumed(Landroid/app/Activity;)V"],
    "MultiTabs227$1.smali": ["Dev111;->capturePage(Landroid/app/Activity;)V"],
    "MultiTabs227$Host$1.smali": ["Dev112;->restoreList(Landroid/widget/ListView;II)V"],
    "GestureControls110.smali": ["Dev112;->verticalTurnReady(Ljava/lang/Object;Landroid/view/MotionEvent;F)Z", "Dev118;->myPageTouch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z"],
    "ListActions.smali": ["Dev116;->playlistMenu(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/Menu;Ljava/util/List;)V"],
    "CommentHistory.smali": ["Dev114;->effectiveLimit(I)I"],
    "CommentHistory$Job.smali": ["Dev114;->memoryAvailable()Z"],
    "CacheListing.smali": ["Dev117;->start(Ljava/lang/String;[Ljava/io/File;)V", "Dev117;->finish()V"],
    "CachedPlayback.smali": ["Dev117;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J"],
    "Dev113.smali": ["playlistUrlMenu", "nicoid-playlist-url"],
    "Dev114.smali": ["effectiveLimit", "memoryAvailable", "installSettings"],
    "Dev117.smali": ["completedBytes", "ThreadLocal"],
    "Dev118.smali": ["myPageTouch", "nicoid_my_page"],
    "Dev119.smali": ["retainWhenScreenOff", "nicoid_keep_audio_screen_off"],
    "Dev120.smali": ["backfill", "first_retrieve", "videoinfo"],
    "Dev121.smali": ["controls", "progress", "done", "ticket", "valid", "update"],
    "CommentBatchPolicy121.smali": ["ready"],
    "Dev122.smali": ["cachedWatch", "throttleHistory"],
    "PostingPolicy122.smali": ["postServer", "describe"],
    "PostEcho123.smali": ["accepted", "keep"],
    "PopupTouch125.smali": ["dispatch", "doubleTap", "dragging", "cancel", "showControls"],
    "PopupTouchPolicy125.smali": ["PopupTouchPolicy125"],
    "PopupTouchPolicy125$State.smali": ["markDoubleTap", "begin", "move", "end"],
    "Dev126.smali": ["publicMylistTitle", "TabTitleRules126"],
    "TabTitleRules126.smali": ["chosen", "id", "generic"],
    "TabChrome228.smali": ["Dev126;->publicMylistTitle"],
    "PopupPinchLayout.smali": ["PopupTouch125;->dispatch", "PopupTouch125;->cancel"],
    "ModernPosting.smali": ["Dev122;->cachedWatch", "PostingPolicy122;->postServer", "PostingPolicy122;->describe", "X-Client-Os-Type"],
    "PlaybackLifecycle219.smali": ["Dev119;->retainWhenScreenOff(Ljava/lang/Object;)Z"],
    "TabPagingRules233.smali": ["0x3e3851ec", "0x43fa0000"],
    "Following190$Gestures.smali": ["0x3e19999a"],
    "PlaylistUrlParser.smali": ["canonicalUrl", "nicovideo.jp"],
    "PatchVersion237.smali": ["1.10.5-dev.4"],
    "ModernShorts.smali": ["v1.10.5-dev.4 @chikuwadon"],
    "TabRoutes228.smali": [
        "Dev111;->capturePage(Landroid/app/Activity;)V",
        "Dev111;->preparePlaylist(Landroid/app/Activity;)V",
        "Dev111;->enteredPage(Landroid/app/Activity;)V",
    ],
    "LocalPlaylists.smali": ["Dev111;->preparePlaylist(Landroid/app/Activity;)V", "Dev111;->playlistsChanged()V", "Dev113;->playlistUrlMenu(Landroid/app/Activity;Landroid/view/Menu;Ljava/lang/Object;)V"],
    "LocalPlaylists$Page.smali": ["LocalPlaylistData;->toString()Ljava/lang/String;", "Dev115;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;", "Dev120;->backfill(Ljava/lang/Object;)V"],
    "FullscreenViewport209.smali": ["Dev115;->afterFullscreenRestore(Landroid/view/View;)V"],
    "Dev111.smali": ["nicoid_restore_tab_scroll", "nicoid_app_resume_playback", "nicoid_tab_scroll111_", "updateSummaries"],
    "Dev112.smali": ["nicoid_confirm_exit", "verticalTurnReady", "playlistMenu", "SCROLL_RESTORES"],
    "StorageDiagnostics112.smali": ["nicoid_storage_diagnostic", ".method public static install(Landroid/preference/PreferenceActivity;)V"],
    "Dev115.smali": ["cache_all_delete", "seamlessReturn", "afterFullscreenRestore", "thumbnail"],
    "Dev116.smali": ["playlistMenu", "nativePlaylistPopup", "playlistThumbnail", "mp4_tree_uri", "show_watch_progress", "drawer", "DIRTY_ADAPTERS", "REFRESH_ARTWORK"],
    "LocalPlaylists$Page$2.smali": ["Dev116;->playlistThumbnail(Landroid/view/View;Landroid/widget/BaseAdapter;Lorg/json/JSONObject;)V"],
    "LegacyCacheCleanup113.smali": ["nicoid_old_cache_delete", "cache_all_delete", "nicoid/nicoid_cache"],
}
for name, needles in expected.items():
    text = (helper / name).read_text(encoding="utf-8")
    for needle in needles:
        assert needle in text, f"Missing {needle} in {name}"
native = (root / "method-delta/com/sauzask/nicoid/NicoidActivity.smali").read_text(encoding="utf-8")
assert "Dev112;->back(Landroid/app/Activity;)Z" in native
popup = (root / "method-delta/com/sauzask/nicoid/NicoidPopupViewService.smali").read_text(encoding="utf-8")
doubletap = (root / "method-delta/com/sauzask/nicoid/NicoidPopupViewService$k.smali").read_text(encoding="utf-8")
assert "PopupTouch125;->dragging(Ljava/lang/Object;)Z" in popup
# Protect against the exact Android 16 VerifyError from dev.3: v1 must be
# initialized before the added branch can jump into legacy onTouch.
assert ":cond_8\n    const/4 v1, 0x1\n    invoke-static {p0}, Le/e/a/PopupTouch125;->dragging" in popup
assert "PopupTouch125;->doubleTap(Ljava/lang/Object;Landroid/view/MotionEvent;)Z" in doubletap
assert "stopService(Landroid/content/Intent;)Z" not in doubletap
video_list=(root / "method-delta/com/sauzask/nicoid/NicoidVideoListActivity.smali").read_text(encoding="utf-8")
assert "Dev116;->drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z" in video_list
assert "Dev116;->drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z" in native
for file in ["helpers.mpe", "method-delta.dex"]:
    data = (output / file).read_bytes()
    assert data[:4] == bytes((100, 101, 120, 10)), f"Invalid DEX magic: {file}"
    assert len(data) > 1000, f"Unexpected empty payload: {file}"
    print(f"{file}: {len(data)} bytes / sha256={hashlib.sha256(data).hexdigest()}")
print("Development overlay hooks, settings, playlist refresh and DEX output: PASS")



# Verify the assembled DEX, not merely the staged .smali files. A successful
# Smali command has previously omitted every additional development class.
def dex_classes(data):
    def u32(offset):
        return struct.unpack_from("<I", data, offset)[0]
    strings_size, strings_off = u32(0x38), u32(0x3c)
    type_size, type_off = u32(0x40), u32(0x44)
    class_size, class_off = u32(0x60), u32(0x64)
    strings = []
    for n in range(strings_size):
        pos = u32(strings_off + 4*n)
        for _ in range(5):
            byte = data[pos]
            pos += 1
            if not byte & 0x80:
                break
        end = data.index(b"\x00", pos)
        strings.append(data[pos:end].decode("utf-8", "replace"))
    types = [strings[u32(type_off + 4*i)] for i in range(type_size)]
    return {types[u32(class_off + 32*i)] for i in range(class_size)}

helper_defs = dex_classes((output / "helpers.mpe").read_bytes())
needed = ("Dev111", "Dev112", "Dev113", "Dev114", "Dev115", "Dev116", "Dev117", "Dev118", "Dev119", "Dev120", "Dev121", "CommentBatchPolicy121", "Dev122", "PostingPolicy122", "PostEcho123", "PlaylistUrlParser", "LegacyCacheCleanup113", "StorageDiagnostics112")
missing = [name for name in needed if "Le/e/a/" + name + ";" not in helper_defs]
print("Assembled helper DEX class definitions:", len(helper_defs))
print("Required development classes:", len(needed) - len(missing), "/", len(needed))
assert not missing, "Required development classes are absent: " + ", ".join(missing)

# Include generated lambda and nested classes, not merely the entry-point class.
expected_sources = list((root / "helpers/e/e/a").glob("Dev1*.smali"))
for source in expected_sources:
    descriptor = "Le/e/a/" + source.stem + ";"
    assert descriptor in helper_defs, f"Final helper DEX omitted {descriptor}"
print("Generated helper class coverage:", len(expected_sources), "of", len(expected_sources))

assert len(helper_defs) >= 1750, "Too few assembled helper classes"
print("Verified development DEX assembly and class coverage: PASS")

# Verify the precise version in the *assembled* helper DEX, not only in staged smali.
version = sys.argv[3]
assert version == "1.10.5-dev.4"
dex_data = (output / "helpers.mpe").read_bytes()
def dex_strings(data):
    strings_size, strings_off = struct.unpack_from("<II", data, 0x38)
    result = set()
    for i in range(strings_size):
        pos = struct.unpack_from("<I",data,strings_off+i*4)[0]
        while data[pos] & 0x80:
            pos += 1
        pos += 1
        end = data.index(b"\x00",pos)
        result.add(data[pos:end].decode("utf-8","replace"))
    return result
actual = dex_strings(dex_data)
assert version in actual, f"Actual helper DEX missing patch version {version}"
assert "v"+version+" @chikuwadon" in actual, "Actual ModernShorts version is missing"
print("Compiled patch-version string and ModernShorts version:",version,"PASS")

home=(helper/"LocalPlaylists.smali").read_text(encoding="utf-8").split(".method public static home(",1)[1].split(".end method",1)[0]
assert "LocalPlaylists;->back" not in home and "Dev116;->drawer" in home, "Toolbar home must invoke native drawer toggle"
print("Playlist toolbar drawer routing: PASS")

popup_native=(root/"method-delta/e/e/a/b0$a.smali").read_text(encoding="utf-8")
assert "Dev116;->nativePlaylistPopup(Ljava/lang/Object;Ljava/lang/Object;)Z" in popup_native
assert ":nicoid_playlist_popup_done" in popup_native
print("Native b0$a playlist popup bridge: PASS")
