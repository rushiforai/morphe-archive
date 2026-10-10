/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3330
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.all.misc.signature

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch

@Suppress("unused")
val spoofSignaturePatch = resourcePatch (
    name = "Spoof signature",
    description = "Spoofs the package signature of the original APK.",
    default = false
) {
    dependsOn(spoofSignaturePatch)
}
