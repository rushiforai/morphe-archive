package semicoloncolonel.mobilestream.patches.verizon.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.verizon.shared.Constants

// My Verizon 22.2.5:
//   Adobe Experience Platform: its extensions are never registered, so
//     analytics, identity, and in-app marketing never start.
//   New Relic: the agent never starts, so its hooks woven through the app
//     do nothing.
//   Qualtrics surveys: no project is initialized.
// Firebase Analytics is switched off in the manifest, and the shared host
// blocklist covers the same services at the network layer.
//
// Not touched: sign-in, bill pay, and Verizon's own support chat.

internal object AdobeRegisterExtensionsFingerprint : Fingerprint(
    definingClass = "Lcom/adobe/marketing/mobile/MobileCore;",
    name = "registerExtensions",
    returnType = "V",
)

internal object NewRelicStartFingerprint : Fingerprint(
    definingClass = "Lcom/newrelic/agent/android/NewRelic;",
    name = "start",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Adobe (including its in-app marketing messages), New Relic, Qualtrics surveys, " +
        "and Firebase Analytics. Sign-in and bill pay are left alone.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        AdobeRegisterExtensionsFingerprint.method.returnEarly("return-void")
        NewRelicStartFingerprint.method.returnEarly("return-void")

        val qualtrics = forEachMatchingMethod(
            { it.type == "Lcom/qualtrics/digital/Qualtrics;" },
            { it.name == "initializeProject" && it.returnType == "V" },
        ) { it.returnEarly("return-void") }
        if (qualtrics == 0) throw PatchException("Qualtrics initializeProject not found")

        blockTrackers()
    }
}
