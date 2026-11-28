package semicoloncolonel.mobilestream.patches.visible.privacy

import semicoloncolonel.mobilestream.patches.shared.privacy.gatedAnalyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.visible.shared.Constants

// Visible 3.0.5:
//   Tealium: the app's page and action tracking, the older Tealium
//     library's track calls, and Tealium's self-starting provider all return
//     at once. Tealium itself is still created, since the app reads its
//     settings.
//   Swrve (marketing events, in-app messages, and push campaigns): still
//     created, since account requests, sign-up, and eSIM read its user ID,
//     but it queues no events, sends no user updates, shows no in-app
//     messages, and ignores its push campaigns.
// Firebase Analytics is switched off in the manifest.
//
// Not touched: the support chat, the eSIM location check, and the fraud
// and sign-in SDKs (Cardinal Commerce, Kount, PayPal, ForgeRock, and Ping).

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
        fun stop(what: String, minimum: Int, classFilter: (String) -> Boolean, methodFilter: (Method) -> Boolean, smali: String) {
            val count = forEachMatchingMethod({ classFilter(it.type) }, methodFilter) { it.returnEarly(smali) }
            if (count < minimum) throw PatchException("$what not found ($count)")
        }

        stop(
            "Tealium tracking", 5,
            { it == "Lcom/visible/android/core/tealium/TealiumHelper;" || it == "Lcom/tealium/library/Tealium;" },
            { it.returnType == "V" && it.name in setOf("trackPageView", "trackActionEvent", "track", "trackEvent", "trackView") },
            "return-void",
        )
        stop(
            "Tealium provider", 1,
            { it == "Lcom/tealium/core/internal/TealiumInitProvider;" },
            { it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty() },
            "const/4 v0, 0x0\nreturn v0",
        )
        stop(
            "Swrve events", 3,
            { it == "Lcom/swrve/sdk/SwrveImp;" || it == "Lcom/swrve/sdk/SwrveBase;" },
            { it.returnType == "V" && it.name in setOf("queueEvent", "_userUpdate", "displaySwrveMessage") },
            "return-void",
        )
        stop(
            "Swrve push", 1,
            { it == "Lcom/swrve/sdk/SwrvePushServiceDefault;" },
            { it.name == "handle" && it.returnType == "Z" && it.parameterTypes.size == 4 },
            "const/4 v0, 0x0\nreturn v0",
        )

        blockTrackers()
    }
}
