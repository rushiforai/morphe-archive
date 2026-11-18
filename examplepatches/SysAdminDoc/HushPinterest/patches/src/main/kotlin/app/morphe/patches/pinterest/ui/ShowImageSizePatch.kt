/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

internal const val IMAGE_SIZE_HOOK = "$EXTENSION_PACKAGE/ui/PostedDate;->showSize(Landroid/view/View;Ljava/lang/Object;)V"

@Suppress("unused")
val showImageSizePatch = bytecodePatch(
    name = "Show image size",
    description = "Shows a picture's width and height under it when you open a pin, beside the posted date when " +
        "that's on. It reads the largest copy Pinterest sends the app, which can be smaller than the original upload. " +
        "Videos show nothing. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("showImageSize")
        requireStatusMethod("imageSize")
        // The same title module and spot as the posted date, which shares the line this adds to.
        mutable(titleModuleUpdate()).addInstructions(0, "invoke-static/range { p0 .. p1 }, $IMAGE_SIZE_HOOK")
        enableCapability("imageSize")
        enableStatus("showImageSize")
    }
}
