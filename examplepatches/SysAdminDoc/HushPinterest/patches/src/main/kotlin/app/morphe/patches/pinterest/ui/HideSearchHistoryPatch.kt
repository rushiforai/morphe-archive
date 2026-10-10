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

/** Display-only: vendor search requests and account history are unchanged. */
@Suppress("unused")
val hideSearchHistoryPatch = bytecodePatch(
    name = "Hide search history",
    description = "Hides your recent searches on the search screen of this phone. It doesn't delete your account's " +
        "search history. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideSearchHistory")
        requireStatusMethod("searchHistory")
        val views = SEARCH_HISTORY_VIEWS.map { mutableClassDefBy(it) }
        views.forEach { view ->
            requireOverride(view, "setVisibility", listOf("I"))
            requireOverride(view, "onMeasure", listOf("I", "I"))
        }
        views.forEach { collapseView(it, "searchHistory") }
        enableCapability("searchHistory")
        enableStatus("hideSearchHistory")
    }
}
