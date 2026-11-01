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

/**
 * Every way into the Assistant asks this one method whether it's available: the search cell, the board
 * button and options, the image search overlays and the deep link. The business profile's button has its
 * own gate and isn't touched.
 */
@Suppress("unused")
val hideAssistantPatch = bytecodePatch(
    name = "Hide Assistant",
    description = "Removes Pinterest's AI Assistant from search, boards and pins, so you don't get its buttons or " +
        "its suggestion row. Regular search keeps working. Starts off. Turn it on in HushPinterest settings > " +
        "Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideAssistant")
        requireStatusMethod("assistantEntries")
        val target = methodsWithString("ai_fwd_android_assistant_ask_mode").filter {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags)
        }.one("Assistant availability")
        mutable(target).returnEarlyWhen("Assistant availability", "$UI_HOOKS->hideAssistant()Z", """
            const/4 v0, 0x0
            return v0
        """)
        enableCapability("assistantEntries")
        enableStatus("hideAssistant")
    }
}
