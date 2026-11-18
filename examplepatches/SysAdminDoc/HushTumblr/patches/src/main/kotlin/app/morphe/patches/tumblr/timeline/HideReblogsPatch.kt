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
 * Turns on the extension's reblog rule. The timeline hook takes each post that names the post it
 * reblogs, or carries a reblog trail, out of a page before Tumblr shows it. The rule is in `PostRules`.
 */
@Suppress("unused")
val hideReblogsPatch = bytecodePatch(
    name = "Hide reblogs",
    description = "Takes reblogs out of your dashboard and other feeds as each page loads, and keeps the posts" +
        " people made themselves. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, postBridgePatch, communityPostBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideReblogs")
        requireStatusMethod("reblogPosts")
        enableCapability("reblogPosts")
        enableStatus("hideReblogs")
    }
}
