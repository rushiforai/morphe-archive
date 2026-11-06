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
 * Turns on the extension's Featured rule. The timeline hook takes a post out of a page when its
 * header carries the server's sparkle icon and its dismiss menu offers Tumblr's marketing-post
 * dismissal, which is how Tumblr sends the posts its staff feature. The header icon comes through the
 * post bridge, the dismiss menu from the timeline object. The checks are in `TimelineFilter`.
 */
@Suppress("unused")
val hideFeaturedPostsPatch = bytecodePatch(
    name = "Hide Featured posts",
    description = "Takes the staff-picked posts Tumblr shows under a Featured header out of your dashboard and" +
        " other feeds. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, paidPostBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideFeaturedPosts")
        requireStatusMethod("featuredPosts")
        enableCapability("featuredPosts")
        enableStatus("hideFeaturedPosts")
    }
}
