/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val removePaywallDialogsPatch: BytecodePatch = bytecodePatch(
    name = "Remove paywall/upgrade dialogs",
    description = "Removes paywall and upgrade dialogs.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // Paywall dialogs are shown in various activities - intercept the methods that show them
        // Look for methods that display upgrade prompts or paywall UI
        val clazz = findClass("Lcom/protonvpn/android/redesign/app/ui/upsell/TvUpsellActivity;")
        val showMethod = clazz.findMethod("onCreate", "(Landroid/os/Bundle;)V")
            ?: throw IllegalStateException("Upsell activity method not found")
        showMethod.clearBody()
        showMethod.addInstructions(0, "return-void")
    }
}
