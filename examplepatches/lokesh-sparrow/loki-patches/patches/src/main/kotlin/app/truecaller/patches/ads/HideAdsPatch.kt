/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.ads

import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.loki.patches.universal.stopAdSdks
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.truecaller.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val FEATURE = "Lcom/truecaller/premium/data/feature/PremiumFeature;"

// Truecaller renames its classes on every release, so both hooks are found by what the method reads.

private fun Method.readsField(definingClass: String, name: String) =
    implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
            field.definingClass == definingClass && field.name == name
        } == true
    } == true

/** The premium feature gate `c(PremiumFeature, boolean)`; the NO_ADS check lives in the same class. */
private val isFeatureIncluded = Fingerprint(
    returnType = "Z",
    parameters = listOf(FEATURE, "Z"),
    strings = listOf("disabledPremiumFeatures"),
)

/**
 * The app-wide "should this install show ads" switch (22 ad placements ask it). It never consults premium: it answers
 * yes for a QA override, for a server flag, or once the `adsDisabledUntil` timer has run out.
 */
private val shouldShowAds = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("qaForceAds", "adsDisabledUntil"),
)

private val hideAdsFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.hideads") }
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads (Truecaller)",
    description = "Removes Truecaller's ads: in the call history, the after-call screen, search results and the " +
        "rest of the app. Works on its own, with or without premium.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)
    dependsOn(menuPatch, hideAdsFlag)

    execute {
        // 1. The "no ads" feature reads as included, whatever the device's disabled-feature list says.
        val noAds = isFeatureIncluded.classDef.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() && method.readsField(FEATURE, "NO_ADS")
        }
        if (noAds.size != 1) throw PatchException("NO_ADS check: expected one method, found ${noAds.size}")
        noAds.single().addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // 2. The app-wide ad switch answers no, whatever the server or the QA flags say.
        shouldShowAds.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // 3. And the ad SDKs inside the app (AdMob, Meta Audience Network, ...) never start or load an ad.
        stopAdSdks()
    }
}
