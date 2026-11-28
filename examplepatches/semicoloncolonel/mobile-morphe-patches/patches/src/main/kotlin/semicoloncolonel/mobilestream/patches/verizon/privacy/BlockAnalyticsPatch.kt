package semicoloncolonel.mobilestream.patches.verizon.privacy

import semicoloncolonel.mobilestream.patches.shared.privacy.gatedAnalyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
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
val blockAnalyticsPatch: BytecodePatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Blocks the tracking you choose in the patch options.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(blockSessionRecordingPatch)

    dependsOn(gatedAnalyticsKillSwitchesPatch { isOptionOn(blockAnalyticsPatch, "analytics") })

    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "analytics",
        default = false,
        title = "Analytics and tracking services",
        description = "Stops the app's analytics, ad measurement, and marketing services.",
    )
    booleanOption(
        key = "sessionRecording",
        default = true,
        title = "Session recording",
        description = "Stops Quantum Metric, which records what you do in the app.",
    )

    execute {
        if (!isOptionOn(blockAnalyticsPatch, "analytics")) return@execute
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
