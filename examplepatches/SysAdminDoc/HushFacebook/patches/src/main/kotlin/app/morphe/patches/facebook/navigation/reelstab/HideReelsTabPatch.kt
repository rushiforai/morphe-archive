/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.reelstab

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.facebook.navigation.tabbar.tabBarFilterPatch
import app.morphe.patches.facebook.navigation.tabbar.tabLinksPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Takes the Reels tab, which some accounts call Video, off Facebook's tab bar. The tab bar filter
 * (TabBarAnchors.kt) asks the extension about each tab as Facebook builds the bar, right after
 * Facebook's own hidden-tab set answers, and the extension's ReelsTab drops the one class Facebook
 * keeps for that tab, WatchTab, while the switch is on. A tab Facebook's own tab bar settings hide
 * stays theirs. Nothing else of Reels is touched, so reel links, reels in the feed and the Reels
 * viewer still open, and Open on a chosen tab sends a start meant for the hidden tab to Home. The
 * tab links patch (TabLinkAnchors.kt) has Facebook open Reels on its own screen where a link or the
 * Menu's Reels shortcut would otherwise switch to the missing tab.
 * Facebook's Reels shortcut on its launcher icon goes too: the settings patch already sends each of
 * Facebook's ShortcutManager calls through SettingsEntry, which asks ReelsTab to leave that one out.
 *
 * Out of the default selection, like Hide Reels in the feed: picking it is the choice, and its
 * switch starts on.
 */
@Suppress("unused")
val hideReelsTabPatch = bytecodePatch(
    name = "Hide the Reels tab",
    description = "Takes the Reels tab, which some accounts call Video, off the tab bar, and its shortcut out " +
        "of the long-press menu of Facebook's icon. Reel links and the reels in your feed still open. Facebook's " +
        "own Hide in its tab bar settings keeps working, and a change to the switch shows once Facebook restarts.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, tabBarFilterPatch, tabLinksPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        enableStatus("reelsTab")
    }
}
