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
 * Turns on the extension's suggested blogs rule. The timeline hook takes each blog card, blog row
 * and carousel of them out of a page before Tumblr shows it, with the heading in front of it
 * ("Check out these blogs" is the server's text, not Tumblr's), and the "Like this? Follow to see
 * more" prompt between a blog's posts. The kinds are in `TimelineFilter`.
 */
@Suppress("unused")
val hideSuggestedBlogsPatch = bytecodePatch(
    name = "Hide suggested blogs",
    description = "Takes the blogs Tumblr suggests you follow out of your dashboard and other feeds, whether as" +
        " cards, rows or carousels, along with their headings. Starts off. Turn it on in Tumblr settings >" +
        " HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, timelineCarouselPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideSuggestedBlogs")
        requireStatusMethod("suggestedBlogCards")
        enableCapability("suggestedBlogCards")
        enableStatus("hideSuggestedBlogs")
    }
}
