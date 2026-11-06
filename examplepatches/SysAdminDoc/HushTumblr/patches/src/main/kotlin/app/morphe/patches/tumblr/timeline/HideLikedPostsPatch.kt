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
 * Turns on the extension's liked post rule. Tumblr sends each post with whether the signed-in
 * account liked it, the state its like button starts from. The timeline hook takes a liked post
 * out of a dashboard page before Tumblr shows it, and leaves your likes, blogs and search alone.
 * The rule is in `PostRules`, and which page it's on comes from `PageSource`.
 */
@Suppress("unused")
val hideLikedPostsPatch = bytecodePatch(
    name = "Hide liked posts",
    description = "Takes the posts you've already liked out of your dashboard and the feeds like it as each" +
        " page loads. Your likes and blogs still show them. Starts off. Turn it on in Tumblr settings >" +
        " HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, likedPostBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideLikedPosts")
        requireStatusMethod("likedPosts")
        enableCapability("likedPosts")
        enableStatus("hideLikedPosts")
    }
}
