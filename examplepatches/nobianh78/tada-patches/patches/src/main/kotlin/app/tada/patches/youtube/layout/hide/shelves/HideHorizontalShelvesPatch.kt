/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.layout.hide.shelves

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.litho.filter.addLithoFilter
import app.tada.patches.youtube.misc.engagement.engagementPanelHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.litho.filter.lithoFilterPatch
import app.tada.patches.youtube.misc.litho.observer.layoutReloadObserverPatch
import app.tada.patches.youtube.misc.navigation.navigationBarHookPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch

private const val EXTENSION_FILTER =
    "Lapp/morphe/extension/youtube/patches/components/HorizontalShelvesFilter;"

internal val hideHorizontalShelvesPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch,
        lithoFilterPatch,
        playerTypeHookPatch,
        navigationBarHookPatch,
        engagementPanelHookPatch,
        layoutReloadObserverPatch
    )

    execute {
        addLithoFilter(EXTENSION_FILTER)
    }
}
