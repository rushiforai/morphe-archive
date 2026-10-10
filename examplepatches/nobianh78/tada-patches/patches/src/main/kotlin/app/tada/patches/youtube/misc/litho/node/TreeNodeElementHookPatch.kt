/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.misc.litho.node

import app.tada.patches.shared.misc.litho.context.conversionContextPatch
import app.tada.patches.shared.misc.litho.node.createTreeNodeElementHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch

val treeNodeElementHookPatch = createTreeNodeElementHookPatch(
    sharedExtensionPatch,
    conversionContextPatch,
    false,
    useLegacyContextRegister = { false }
)
