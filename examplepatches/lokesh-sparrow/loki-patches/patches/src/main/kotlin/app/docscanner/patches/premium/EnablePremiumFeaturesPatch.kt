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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The app's two premium gates. Both are static `()Z` methods over the same preference store, renamed every release
 * (`bm7` in 6.9.9, `n78` in 6.9.14), so they are found by the keys they read:
 * `b()` is "any paid state" (subscription, lifetime, donation or the hidden PRE_ACC_KEY flag) and is what every
 * feature lock and every ad slot asks; `a()` is "subscription only".
 */
private fun Method.readsString(value: String) =
    implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value } == true

private val anyPaidState = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.readsString("IS_DONATED") },
)

private val subscriptionState = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.readsString("PRE_ACC_KEY") && !method.readsString("IS_DONATED") },
)

private val premiumFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.premium") }
    }
}

@Suppress("unused")
val enablePremiumFeaturesPatch = bytecodePatch(
    name = "Enable premium features (Doc Scanner)",
    description = "Turns on the app's paid features (unlimited scans, cloud upload, OCR, PDF passwords, compression, " +
        "signatures, themes). Ads are removed by Hide ads (Doc Scanner).",
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
