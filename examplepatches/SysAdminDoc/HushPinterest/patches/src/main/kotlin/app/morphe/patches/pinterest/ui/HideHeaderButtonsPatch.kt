/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/** Resource entry names distinguish optional trailing icons from back and primary text actions. */
@Suppress("unused")
val hideHeaderButtonsPatch = bytecodePatch(
    name = "Hide header buttons",
    description = "Hides the small icon buttons at the end of the top bar. Back buttons, text buttons and account " +
        "controls stay. Good for a cleaner top bar. Starts off. Turn it on in HushPinterest settings > " +
        "Interface.",
) {
    category("Navigation")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideHeaderButtons")
        requireStatusMethod("headerButtons")
        val header = mutableClassDefBy(HEADER_BAR)
        val ids = header.methods.flatMap { it.fields() }.map { it.name }.toSet()
        if (!ids.containsAll(listOf("start_container_icon_bt", "end_container_icon_bt", "end_container_icon_buttons"))) {
            throw PatchException("Header no longer distinguishes leading and trailing icon action containers")
        }
        refreshOnMeasure(header, "headerButtons")
        enableCapability("headerButtons")
        enableStatus("hideHeaderButtons")
    }
}
