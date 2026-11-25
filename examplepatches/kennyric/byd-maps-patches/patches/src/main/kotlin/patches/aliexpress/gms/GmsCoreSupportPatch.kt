/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress.gms

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import patches.aliexpress.ALIEXPRESS
import patches.aliexpress.settings.markPatchApplied
import patches.aliexpress.signin.spoofSignaturePatch

private val gmsCoreSupportMarkerPatch = bytecodePatch {
    dependsOn(spoofSignaturePatch)

    execute {
        markPatchApplied("gmsCoreSupport", checkNotNull(gmsCoreSupportPatch.description))
    }
}

@Suppress("unused")
val gmsCoreSupportPatch: BytecodePatch = gmsCoreSupportPatchFor(
    ALIEXPRESS,
    gmsCoreSupportMarkerPatch,
    default = true,
)
