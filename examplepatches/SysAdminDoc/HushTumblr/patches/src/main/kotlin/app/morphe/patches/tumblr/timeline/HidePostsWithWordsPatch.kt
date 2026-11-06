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
 * Turns on the extension's word list rule. The timeline hook takes a post out of a page before
 * Tumblr shows it when its text blocks, its reblog trail's text blocks, its tags or its summary hold
 * a word or phrase from the list on the Feed page, ignoring case, as whole words. The rule is in
 * `PostRules`.
 */
@Suppress("unused")
val hidePostsWithWordsPatch = bytecodePatch(
    name = "Hide posts with these words",
    description = "Hides posts matching your word list. Choose whether to check current text, the reblog trail," +
        " tags or summaries. Allowed words can keep a matching post, but other enabled filters still apply." +
        " Both word editors let you type a made-up post and see what the word filter would do with it." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, postBridgePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hidePostsWithWords")
        requireStatusMethod("postWords")
        enableCapability("postWords")
        enableStatus("hidePostsWithWords")
    }
}
