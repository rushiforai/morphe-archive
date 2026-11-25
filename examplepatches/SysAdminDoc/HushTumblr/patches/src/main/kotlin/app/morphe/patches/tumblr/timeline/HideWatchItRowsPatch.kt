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
 * Turns on the extension's Watch it rule. The timeline hook takes Tumblr TV's video hub rows and
 * cards out of a page before Tumblr shows them, with the heading in front of them. The kinds are in
 * `TimelineFilter`.
 */
@Suppress("unused")
val hideWatchItRowsPatch = bytecodePatch(
    name = "Hide Watch it rows",
    description = "Takes Tumblr TV's Watch it rows and video hub cards out of your dashboard and other feeds, along" +
        " with their headings. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Navigation")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, timelineCarouselPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideWatchItRows")
        requireStatusMethod("watchItRows")
        enableCapability("watchItRows")
        enableStatus("hideWatchItRows")
    }
}
