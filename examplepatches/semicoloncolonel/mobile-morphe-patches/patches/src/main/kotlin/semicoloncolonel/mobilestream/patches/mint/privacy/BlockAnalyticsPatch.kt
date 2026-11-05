package semicoloncolonel.mobilestream.patches.mint.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import semicoloncolonel.mobilestream.patches.mint.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Mint Mobile 2.3.40. Each SDK is stopped where it starts or sends:
//   Amplitude: reports that the user opted out, so no event is sent. The
//     instance and its device ID stay, since the app reuses that ID.
//   Braze (marketing pushes, in-app messages, content cards): never configured.
//   Branch: sessions never start.
//   Optimizely: events are never dispatched. The promo text it supplies
//     still loads.
// Firebase Analytics is switched off in the manifest.
//
// Not touched: LaunchDarkly feature flags, ThreatMetrix fraud checks, sign-in,
// payments, and activation.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        fun stop(sdk: String, classFilter: (String) -> Boolean, methodFilter: (Method) -> Boolean, smali: String) {
            val count = forEachMatchingMethod({ classFilter(it.type) }, methodFilter) { it.returnEarly(smali) }
            if (count == 0) throw PatchException("$sdk entry point not found")
        }

        stop(
            "Amplitude",
            { it == "Lcom/amplitude/core/Configuration;" || it == "Lcom/amplitude/android/Configuration;" },
            { it.name == "getOptOut" && it.returnType == "Z" && it.parameterTypes.isEmpty() },
            "const/4 v0, 0x1\nreturn v0",
        )
        stop(
            "Braze",
            { it == "Lcom/braze/Braze\$Companion;" },
            { it.name == "configure" && it.returnType == "Z" },
            "const/4 v0, 0x0\nreturn v0",
        )
        stop(
            "Branch",
            { it == "Lio/branch/referral/Branch\$InitSessionBuilder;" },
            { (it.name == "init" || it.name == "reInit") && it.returnType == "V" && it.parameterTypes.isEmpty() },
            "return-void",
        )
        stop(
            "Optimizely",
            { it == "Lcom/optimizely/ab/android/event_handler/DefaultEventHandler;" },
            { it.name == "dispatchEvent" && it.returnType == "V" },
            "return-void",
        )

        blockTrackers()
    }
}
