/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

@file:Suppress("SpellCheckingInspection")

package app.tada.patches.music.misc.litho.filter

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.shared.misc.litho.context.conversionContextPatch
import app.tada.patches.shared.misc.litho.filter.sharedLithoFilterPatch

val lithoFilterPatch = sharedLithoFilterPatch(
    // Supported YT Music versions always use the native Upb encode path.
    hookNonNativeBuffer = { false },
    // YT Music does not ship the Upb feature flag.
    overrideUpbFeatureFlag = { false },
    useLegacyLithoFiltering = { false }
) {
    dependsOn(
        sharedExtensionPatch,
        conversionContextPatch
    )
}
