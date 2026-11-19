/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val DESCRIPTION_PATCH = "Hide pin title and description"

internal const val PIN_DESCRIPTION_HOOK = "$EXTENSION_PACKAGE/ui/PinPageSections;->description(Landroid/view/View;I)I"

@Suppress("unused")
val hidePinDescriptionPatch = bytecodePatch(
    name = DESCRIPTION_PATCH,
    description = "Removes the title and description under a pin you open. The likes and comments bar stays, and so " +
        "do the posted date and image size when they're on. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hidePinDescription")
        requireStatusMethod("pinDescription")
        addCloseupGate(DESCRIPTION_PATCH, PIN_DESCRIPTION_HOOK)
        enableCapability("pinDescription")
        enableStatus("hidePinDescription")
    }
}
