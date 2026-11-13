/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3330
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

// Modified for Avito Patches (https://github.com/Nizarberyan/Avito-Patches):
// moved to a different package and limited to the Avito app.

package app.nizarberyan.patches.avito.universal

import app.nizarberyan.patches.avito.shared.Constants.COMPATIBILITY_AVITO

import app.morphe.patcher.patch.patch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch

@Suppress("unused")
val spoofSignaturePatch = patch (
    name = "Spoof signature",
    description = "Spoofs the package signature of the original APK.",
    default = false
) {
    compatibleWith(COMPATIBILITY_AVITO)

    dependsOn(spoofSignaturePatch)
}
