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
import app.morphe.patches.tumblr.rootmute.dashboardPagePatch

/**
 * Turns on the extension's own reblog rule. Tumblr marks every post on a blog you can edit with
 * `can_edit`, so a reblog that carries it is one you made. The dashboard page hook takes such a
 * reblog out of a dashboard page before Tumblr shows it, and leaves your blog, your review queue,
 * your Blaze lists and the rest of Tumblr alone. The rule is in `DashboardPosts`.
 */
@Suppress("unused")
val hideOwnReblogsPatch = bytecodePatch(
    name = "Hide your own reblogs",
    description = "Takes the reblogs you made out of your dashboard as each page loads. Your blog and the rest" +
        " of Tumblr still show them. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, postBridgePatch, paidPostBridgePatch, dashboardPagePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideOwnReblogs")
        requireStatusMethod("ownReblogPosts")
        enableCapability("ownReblogPosts")
        enableStatus("hideOwnReblogs")
    }
}
