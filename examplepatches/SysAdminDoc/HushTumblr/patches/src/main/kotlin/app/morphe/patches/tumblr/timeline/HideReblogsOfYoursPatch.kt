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
import app.morphe.patches.tumblr.rootmute.accountIdentityPatch
import app.morphe.patches.tumblr.rootmute.dashboardPagePatch

/**
 * Turns on the extension's rule for other people's reblogs of your posts. A post names the blog
 * it was reblogged from and the blog that first made it, and the signed-in account's blogs come
 * from Tumblr's last fresh user/info response, so a post that names one of them and that Tumblr
 * doesn't mark `can_edit` is someone else's reblog of yours. The dashboard page hook takes it out
 * of a dashboard page before Tumblr shows it, and leaves your blog, a post you open and the rest
 * of Tumblr alone. The rule is in `DashboardPosts`.
 */
@Suppress("unused")
val hideReblogsOfYoursPatch = bytecodePatch(
    name = "Hide reblogs of your posts",
    description = "Takes other people's reblogs of your posts out of your dashboard as each page loads. Your blog" +
        " and the rest of Tumblr still show them. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(
        settingsPatch, tumblrExtensionPatch, timelineListHookPatch, paidPostBridgePatch, dashboardPagePatch,
        accountIdentityPatch, reblogSourceBridgePatch,
    )
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideReblogsOfYours")
        requireStatusMethod("reblogsOfYours")
        enableCapability("reblogsOfYours")
        enableStatus("hideReblogsOfYours")
    }
}
