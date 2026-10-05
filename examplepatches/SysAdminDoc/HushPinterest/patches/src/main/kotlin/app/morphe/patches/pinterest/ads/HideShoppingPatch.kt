/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val hideShoppingPatch = bytecodePatch(
    name = "Hide shopping and product pins",
    description = "Hides shoppable pins, shopping stories and featured board placements. Off by default. " +
        "Turn it on in HushPinterest settings when you want a feed without shopping.",
    default = false,
) {
    category("Feed")
    dependsOn(settingsPatch, feedListHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideShopping")
        requireStatusMethod("feedShopping")
        if (feedListHoldersHooked == 0) throw PatchException("Hide shopping: no list holder was hooked")
        enableCapability("feedShopping")
        enableStatus("hideShopping")
    }
}
