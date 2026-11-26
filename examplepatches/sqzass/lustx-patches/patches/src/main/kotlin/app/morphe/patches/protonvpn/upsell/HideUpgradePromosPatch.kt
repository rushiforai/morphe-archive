/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.upsell

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patches.protonvpn.shared.PROTON_VPN
import app.morphe.patches.protonvpn.shared.PROTON_VPN_FOSS

private const val UPGRADE_DIALOG_V2 =
    "Lcom/protonvpn/android/ui/planupgrade/comparison_table/UpgradeDialogActivityV2;"

private const val CONGRATS_PLAN =
    "Lcom/protonvpn/android/ui/planupgrade/CongratsPlanActivity;"

private const val PROMO_OFFER =
    "Lcom/protonvpn/android/promooffers/ui/PromoOfferActivity;"

private val KILL_ON_CREATE = """
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
""".trimIndent()

@Suppress("unused")
val hideUpgradePromotionsPatch = bytecodePatch(
    name = "Hide Upgrade Promotions",
    description = "Kills the upgrade dialog, plan congrats screen, and promo offer activity on launch.",
) {
    compatibleWith(PROTON_VPN, PROTON_VPN_FOSS)

    execute {
        var killed = 0

        listOf(UPGRADE_DIALOG_V2, CONGRATS_PLAN, PROMO_OFFER).forEach { classType ->
            val clazz = mutableClassDefBy(classType)

            val onCreate = clazz.methods.singleOrNull { m ->
                m.name == "onCreate" &&
                    m.returnType == "V" &&
                    m.parameterTypes == listOf("Landroid/os/Bundle;")
            } ?: throw PatchException(
                "ProtonVPN: $classType->onCreate(Landroid/os/Bundle;)V not found (version drift?)",
            )

            onCreate.addInstructions(0, KILL_ON_CREATE)
            killed++
        }

        println("[protonvpn] upsell: killed $killed upgrade activities")
    }
}
