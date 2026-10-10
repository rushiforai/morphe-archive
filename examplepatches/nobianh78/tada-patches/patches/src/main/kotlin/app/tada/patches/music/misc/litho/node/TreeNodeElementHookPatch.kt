/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.litho.node

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_32_or_greater
import app.tada.patches.shared.misc.litho.context.conversionContextPatch
import app.tada.patches.shared.misc.litho.node.createTreeNodeElementHookPatch

val treeNodeElementHookPatch = createTreeNodeElementHookPatch(
    sharedExtensionPatch,
    conversionContextPatch,
    true,
    useLegacyContextRegister = { !is_9_32_or_greater }
)
