/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch

private const val PATCH = "Text size"
private const val TEXT_SIZE = "$EXTENSION_PACKAGE/ui/TextSize;"

/**
 * Turns on the extension's Text size. Tumblr sizes its text in sp, so the scale its resources report
 * reaches posts, notes, menus and Compose text alike. The settings entry's activity callbacks, which
 * the settings patch already registers as Tumblr starts, set that scale on the application and on
 * each screen as it's created and resumed (`TextSize`). Nothing in Tumblr's own code changes.
 */
@Suppress("unused")
val textSizePatch = bytecodePatch(
    name = "Text size",
    description = "Makes Tumblr's text bigger or smaller than your phone's font size, from 85% to 130%." +
        " Starts off. Turn it on and pick a size in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireExtensionHook(PATCH, "$TEXT_SIZE->application(Landroid/content/Context;)V")
        requireExtensionHook(PATCH, "$TEXT_SIZE->activity(Landroid/app/Activity;)V")
        requireExtensionHook(PATCH, "$TEXT_SIZE->destroyed(Landroid/app/Activity;)V")
        requireStatusMethod("textSize")
        requireStatusMethod("fontScale")
        enableCapability("fontScale")
        enableStatus("textSize")
    }
}
