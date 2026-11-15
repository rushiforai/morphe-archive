/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.premium

import app.docscanner.patches.shared.Constants.COMPATIBILITY_DOCSCANNER
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * The two premium gates of the app (R8 name `bm7`): `b()` is "any paid state" (lifetime, donation, subscription or the
 * hidden PRE_ACC_KEY flag) and is what every feature lock and every ad slot asks; `a()` is "subscription only".
 */
private fun gate(name: String) = Fingerprint(
    definingClass = "Lbm7;",
    name = name,
    returnType = "Z",
    parameters = listOf(),
)

private val anyPaidState = gate("b")
private val subscriptionState = gate("a")

private val premiumFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.premium") }
    }
}

@Suppress("unused")
val enablePremiumFeaturesPatch = bytecodePatch(
    name = "Enable premium features",
    description = "Turns on the app's paid features (unlimited scans, cloud upload, OCR, PDF passwords, compression, " +
        "signatures, themes). The app skips its ad slots for paid users, so the ads go away with them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOCSCANNER)
    dependsOn(premiumFlag)
    dependsOn(menuPatch)

    execute {
        for (fingerprint in listOf(anyPaidState, subscriptionState)) {
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
