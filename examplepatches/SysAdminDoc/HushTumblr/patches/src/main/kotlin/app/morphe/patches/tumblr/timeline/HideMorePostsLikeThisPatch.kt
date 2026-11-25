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
 * Turns on the extension's More posts like this rule. Tumblr loads the related posts under a post
 * you open as a page of their own: a "More posts like this" heading, then rows of post tiles
 * (`CHICLET_ROW`). The timeline hook takes the rows out of that page before Tumblr shows them, and
 * the heading goes with the row after it. The kinds are in `TimelineFilter`.
 */
@Suppress("unused")
val hideMorePostsLikeThisPatch = bytecodePatch(
    name = "Hide More posts like this",
    description = "Takes the \"More posts like this\" grid out from under a post you open, along with its heading." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideMorePostsLikeThis")
        requireStatusMethod("morePostsLikeThis")
        enableCapability("morePostsLikeThis")
        enableStatus("hideMorePostsLikeThis")
    }
}
