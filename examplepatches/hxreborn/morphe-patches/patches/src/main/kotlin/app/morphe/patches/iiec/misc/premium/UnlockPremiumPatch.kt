/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.iiec.misc.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.iiec.misc.fix.signature.bypassSignatureCheckPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.asSequence
import app.morphe.util.findFreeRegister
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.matchSingle
import app.morphe.util.removeFromParent
import app.morphe.util.returnEarly
import org.w3c.dom.Element

private const val MOBILE_ADS_CLASS = "Lcom/google/android/gms/ads/MobileAds;"
private const val MOBILE_ADS_INIT_PROVIDER = "com.google.android.gms.ads.MobileAdsInitProvider"

private val removeMobileAdsInitProviderPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            val initProvider = providers.asSequence()
                .filterIsInstance<Element>()
                .singleOrNull { it.getAttribute("android:name") == MOBILE_ADS_INIT_PROVIDER }
                ?: throw PatchException("Expected exactly one $MOBILE_ADS_INIT_PROVIDER in the manifest")
            initProvider.removeFromParent()
        }
    }
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium and removes ads.",
) {
    compatibleWith(*AppCompatibilities.IIEC_APPS)

    dependsOn(bypassSignatureCheckPatch, removeMobileAdsInitProviderPatch)

    execute {
        EditorNavigationFingerprint.matchSingle()
        PremiumUserFingerprint.matchSingle().method.returnEarly(true)

        MoreIdesMenuItemFingerprint.matchSingle().method.apply {
            val visibleRegister = findFreeRegister(0)
            addInstructions(
                0,
                """
                    const/4 v$visibleRegister, 0x0
                    invoke-interface { p1, v$visibleRegister }, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
                    return-void
                """,
            )
        }

        ConsentInfoUpdateFingerprint.matchSingle().method.returnEarly()

        AdsManagerConstructorFingerprint.matchSingle().method.apply {
            findInstructionIndicesReversedOrThrow(
                methodCall(definingClass = MOBILE_ADS_CLASS),
            ).forEach { removeInstruction(it) }
        }
    }
}
