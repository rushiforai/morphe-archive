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
 * Turns on the extension's own reblog rule. Tumblr marks every post on a blog you can edit with
 * `can_edit`, so a reblog that carries it is one you made. The timeline hook takes such a reblog
 * out of a dashboard page before Tumblr shows it, and leaves your blog, your likes and search
 * alone. The rule is in `PostRules`, and which page it's on comes from `PageSource`.
 */
@Suppress("unused")
val hideOwnReblogsPatch = bytecodePatch(
    name = "Hide your own reblogs",
    description = "Takes the reblogs you made out of your dashboard and the feeds like it as each page loads." +
        " Your blog still shows them. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, postBridgePatch, paidPostBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideOwnReblogs")
        requireStatusMethod("ownReblogPosts")
        enableCapability("ownReblogPosts")
        enableStatus("hideOwnReblogs")
    }
}
