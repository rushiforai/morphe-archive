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
import app.morphe.patches.pinterest.misc.extension.returnEarlyWhen
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags

/** The declared build registers screenshot observers through this permission-aware manager method. */
@Suppress("unused")
val hideScreenshotSharePatch = bytecodePatch(
    name = "No screenshot share menu",
    description = "Stops Pinterest from popping up sharing suggestions after you take a screenshot. Screenshots " +
        "still work as usual. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideScreenshotShare")
        requireStatusMethod("screenshotShare")
        val target = methodsWithString("sg_android_new_screenshot_api_14").filter {
            it.returnType == "V" && it.parameterTypes.size == 2 &&
                it.parameterTypes.last().toString() == "Landroidx/fragment/app/FragmentActivity;" &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }.one("Screenshot observer registration")
        mutable(target).returnEarlyWhen("Screenshot observer", "$UI_HOOKS->hideScreenshotShare()Z", "return-void")
        enableCapability("screenshotShare")
        enableStatus("hideScreenshotShare")
    }
}
