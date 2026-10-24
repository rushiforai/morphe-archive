/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch

/**
 * Turns on the extension's filtered post rule. Tumblr sends a post that matches one of your
 * filtered tags or words with a note naming what matched, and covers it with "This post contains
 * filtered content". The timeline hook takes a post with that note out of a page before Tumblr
 * shows it. The rule is in `PostRules`.
 */
@Suppress("unused")
val hideFilteredPostsPatch = bytecodePatch(
    name = "Hide filtered posts",
    description = "Takes the posts Tumblr covers with \"This post contains filtered content\" out of your" +
        " dashboard, searches and other feeds, so your filtered tags and words hide them completely." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, filteredPostBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideFilteredPosts")
        requireStatusMethod("filteredPosts")
        enableCapability("filteredPosts")
        enableStatus("hideFilteredPosts")
    }
}
