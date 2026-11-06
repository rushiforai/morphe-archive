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

print("Applied v1.10.2-dev.1 overlay to", ROOT)
