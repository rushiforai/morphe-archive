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

private const val AUTHOR_PATCH = "Hide pin author"

internal const val PIN_AUTHOR_HOOK = "$EXTENSION_PACKAGE/ui/PinPageSections;->author(Landroid/view/View;I)I"

@Suppress("unused")
val hidePinAuthorPatch = bytecodePatch(
    name = AUTHOR_PATCH,
    description = "Removes the creator's whole row, picture and name included, from under a pin you open. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hidePinAuthor")
        requireStatusMethod("pinAuthor")
        addCloseupGate(AUTHOR_PATCH, PIN_AUTHOR_HOOK)
        enableCapability("pinAuthor")
        enableStatus("hidePinAuthor")
    }
}
