package semicoloncolonel.mobilestream.patches.recgov.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.recgov.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Recreation.gov 2.2.67:
//   Firebase Analytics: every screen, event, and purchase event goes through
//     the app's AnalyticsKt helpers, which now return at once. The purchase
//     events carried the reservation number, facility, tax, and payment type.
//   Ad ID, Crashlytics, and Firebase Sessions: switched off in the manifest.
//   LaunchDarkly (feature flags): put in offline mode, so the account ID and
//     device details are not sent and the app uses its built-in flag
//     defaults. It is still initialized, since booking reads a flag.
//   Mapbox map usage events: covered by the shared host blocklist.
//
// Not touched: reCAPTCHA, the permit and lottery location check, push
// notifications, sign-in, and booking.

private const val ANALYTICS = "Lcom/bah/r1smobile/utilities/AnalyticsKt;"
private const val LD_BUILDER = "Lcom/launchdarkly/sdk/android/LDConfig\$Builder;"

private val manifestSwitches = mapOf(
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
)

private val crashReportingPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = application.getElementsByTagName("meta-data")
            val existing = (0 until metaData.length)
                .mapNotNull { metaData.item(it) as? Element }
                .associateBy { it.getAttribute("android:name") }
            for ((name, value) in manifestSwitches) {
                val element = existing[name] ?: document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                element.setAttribute("android:value", value)
            }
        }
    }
}

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Firebase Analytics, which receives your reservation numbers and " +
        "payment details, the advertising ID, crash and session reporting, and Mapbox usage " +
        "reports, and keeps your account ID from LaunchDarkly. Booking, permits, and " +
        "notifications are left alone. Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch, crashReportingPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val tracking = forEachMatchingMethod(
            { it.type == ANALYTICS },
            { method ->
                AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "V" &&
                    (method.name.startsWith("track") || method.name == "setTrackUserId")
            },
        ) { it.returnEarly("return-void") }
        if (tracking < 5) throw PatchException("Recreation.gov analytics helpers not found ($tracking)")

        // LDConfig.Builder.build(): offline mode and no diagnostic events, set before building.
        val builders = forEachMatchingMethod(
            { it.type == LD_BUILDER },
            { it.name == "build" && it.parameterTypes.isEmpty() },
        ) { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    iput-boolean v0, p0, $LD_BUILDER->offline:Z
                    iput-boolean v0, p0, $LD_BUILDER->diagnosticOptOut:Z
                """.trimIndent(),
            )
        }
        if (builders != 1) throw PatchException("LaunchDarkly config builder not found ($builders)")

        blockTrackers()
    }
}
