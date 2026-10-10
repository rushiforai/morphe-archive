/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

@file:Suppress("SpellCheckingInspection")

package app.tada.patches.youtube.misc.litho.filter

import app.tada.patches.shared.misc.litho.context.conversionContextPatch
import app.tada.patches.shared.misc.litho.filter.sharedLithoFilterPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.fix.backtoexitgesture.fixBackToExitGesturePatch
import app.tada.patches.youtube.misc.fix.verticalscroll.fixVerticalScrollPatch
import app.tada.patches.youtube.misc.litho.rendernext.disableRenderNextPatch
import app.tada.patches.youtube.misc.playservice.is_20_22_or_greater
import app.tada.patches.youtube.misc.playservice.is_21_15_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch

val lithoFilterPatch = sharedLithoFilterPatch(
    // YouTube 20.22+ always uses the native Upb encode path.
    hookNonNativeBuffer = { !is_20_22_or_greater },
    // Flag was removed in 21.15+.
    overrideUpbFeatureFlag = { !is_21_15_or_greater },
    useLegacyLithoFiltering = { !is_20_22_or_greater }
) {
    dependsOn(
        sharedExtensionPatch,
        conversionContextPatch,
        versionCheckPatch,
        fixBackToExitGesturePatch,
        fixVerticalScrollPatch,
        disableRenderNextPatch
    )
}
