/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.collections

import app.morphe.patcher.patch.rawResourcePatch
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.NativeData
import app.smtgpm.patches.belote.shared.applyNativeEdits
import app.smtgpm.patches.belote.shared.resignFixPatch
import app.smtgpm.patches.belote.shared.verifyNativeLibraryPatch

/**
 * Turns on the game's debug auto pack opening: CollectionManager.IsDebugAutoPackOpeningActive
 * returns true, and its delay before each pack drops from 3 s to 0.25 s. The same flag lets the
 * album/collection complete animations continue on their own.
 */
@Suppress("unused")
val autoOpenPacksPatch = rawResourcePatch(
    name = "Auto-open packs",
    description = "Opening \"My packs\" opens every unopened collection pack one after another.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch, verifyNativeLibraryPatch)

    execute {
        applyNativeEdits(NativeData.AUTO_OPEN_PACKS)
    }
}
