/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

@file:Suppress("SpellCheckingInspection")

package app.tada.patches.youtube.misc.litho.observer

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.litho.node.hookTreeNodeResult
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.litho.node.treeNodeElementHookPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/LayoutReloadObserverPatch;"

val layoutReloadObserverPatch = bytecodePatch(
    description = "Hooks a method to detect in the extension when the RecyclerView at the bottom of the player is redrawn."
) {
    dependsOn(
        sharedExtensionPatch,
        treeNodeElementHookPatch
    )

    execute {
        hookTreeNodeResult("$EXTENSION_CLASS->onLazilyConvertedElementLoaded")
    }
}
