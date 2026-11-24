/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.idn.shared.Constants.SHOW_ADS
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

/** AdManagerAdView's loadAd(AdManagerAdRequest): every banner in the app is loaded through it. R8 renames the method. */
private object AdManagerLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
)

/** CleverTap's InAppController, the step that shows a campaign popup such as the full-screen promo at launch. R8 renames the SDK class. */
private object ShowInAppFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Attempting to show next In-App"),
)

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Removes the Google ad banners from the home, article, quiz, event and live screens, and the promo popups.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Ads")
    dependsOn(settingsPatch)

    execute {
        register(SHOW_ADS)
        // Skip the ad request and collapse the frame that would hold the banner, unless the user turned ads back on.
        AdManagerLoadAdFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->hideAds()Z
                    move-result v0
                    if-eqz v0, :load
                    invoke-static { p0 }, Lapp/fakh/extension/idn/HideAds;->hide(Landroid/view/View;)V
                    return-void
                """,
                ExternalLabel("load", getInstruction(0)),
            )
        }
        // Drop every CleverTap campaign popup before it is shown; push notifications do not pass through here.
        ShowInAppFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->hideAds()Z
                    move-result v0
                    if-eqz v0, :show
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }
    }
}
