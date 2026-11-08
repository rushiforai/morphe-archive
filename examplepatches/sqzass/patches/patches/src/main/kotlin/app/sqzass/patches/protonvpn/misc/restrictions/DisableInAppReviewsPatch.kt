/* Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.sqzass.patches.protonvpn.misc.restrictions

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities

@Suppress("unused")
val disableInAppReviewsPatch: BytecodePatch = bytecodePatch(
    name = "Disable in-app reviews",
    description = "Disables in-app review prompts.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        // In-app reviews are triggered by review prompts - intercept the method that shows them
        val clazz = findClass("Lcom/protonvpn/android/redesign/app/ui/review/ReviewPromptHandler;")
        val showMethod = clazz.findMethod("showReviewPrompt", "()V")
            ?: findMethodInClazz(clazz, "requestReview", "()V")
            ?: throw IllegalStateException("Review prompt method not found")
        showMethod.clearBody()
        showMethod.addInstructions(0, "return-void")
    }
}

private fun findMethodInClazz(clazz: any, name: String, paramDesc: String): any {
    return clazz.methods.singleOrNull { it.name == name && it.parameterTypes.size == 1 } ?: throw IllegalStateException("Method not found")
}
