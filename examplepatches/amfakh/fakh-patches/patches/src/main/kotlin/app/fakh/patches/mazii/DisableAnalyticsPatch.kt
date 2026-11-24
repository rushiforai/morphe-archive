/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.mazii

import app.fakh.patches.mazii.shared.Constants.COMPATIBILITY_MAZII
import app.fakh.patches.shared.disableFacebookAppEvents
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/** Turns off Facebook App Events and advertiser ID collection. */
private val analyticsManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableFacebookAppEvents()
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAZII)
    category("Privacy")
    dependsOn(firebaseManifestPatch(), analyticsManifestPatch)
}
