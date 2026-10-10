/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.misc.auth

import app.tada.patches.shared.misc.auth.authHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playservice.is_21_02_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch

internal val authHookPatch = authHookPatch(
    emptyPageIdHook = { is_21_02_or_greater },
    block = {
        dependsOn(
            sharedExtensionPatch,
            versionCheckPatch,
        )
    }
)
