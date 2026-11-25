/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/** Pinterest's own pull-down on a pin, which its servers give only some accounts (#48). */
@Suppress("unused")
val swipeToClosePinsPatch = bytecodePatch(
    name = "Swipe down to close pins",
    description = "Lets you close a pin you opened by pulling it down, a gesture Pinterest has built but only gives " +
        "some accounts. Back and the back arrow work as before. Starts off. Turn it on in HushPinterest settings > " +
        "Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch, experimentHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("swipeToClosePins")
        requireStatusMethod("pullToDismiss")
        requireExperiment("Swipe down to close pins", PULL_TO_DISMISS_EXPERIMENT)
        enableCapability("pullToDismiss")
        enableStatus("swipeToClosePins")
    }
}
