package semicoloncolonel.mobilestream.patches.tlife.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants

// T-Life 12.3.1. Each SDK is stopped where it starts:
//   Adobe Experience Platform: extensions are never registered or configured.
//   MoEngage (marketing events, in-app messages and marketing pushes): never initialized.
//   Amplitude: track and identify calls return at once.
//   Splunk RUM (OpenTelemetry): install returns Splunk's own no-op instance.
//   Luciq (bug reports, crash and performance monitoring): never built.
// Firebase Analytics is switched off in the manifest, and Branch is caught by
// the shared host blocklist. OkHttp is renamed in this build, so only the
// shared URL.openConnection layer applies.
//
// Not touched: ThreatMetrix fraud checks (sign-in and payments rely on them),
// Apkudo device diagnostics, sign-in, billing, and Tuesdays.

private const val SPLUNK_COMPANION = "Lcom/splunk/rum/integration/agent/api/SplunkRum\$Companion;"
private const val SPLUNK_RUM = "Lcom/splunk/rum/integration/agent/api/SplunkRum;"
private const val AMPLITUDE = "Lcom/amplitude/core/Amplitude;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Adobe, MoEngage, Amplitude, Splunk, Luciq, Branch, and Firebase Analytics. " +
        "Marketing notifications and in-app promotions from MoEngage stop too. Sign-in, " +
        "billing, and Tuesdays are left alone.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        fun stop(sdk: String, minimum: Int, classFilter: (String) -> Boolean, methodFilter: (com.android.tools.smali.dexlib2.iface.Method) -> Boolean, smali: String) {
            val count = forEachMatchingMethod({ classFilter(it.type) }, methodFilter) { it.returnEarly(smali) }
            if (count < minimum) throw PatchException("$sdk entry points not found ($count)")
        }

        stop(
            "Adobe", 2,
            { it == "Lcom/adobe/marketing/mobile/MobileCore;" },
            { it.returnType == "V" && it.name in setOf("registerExtensions", "configureWithAppID", "initialize") },
            "return-void",
        )
        stop(
            "MoEngage", 1,
            { it.startsWith("Lcom/moengage/core/MoEngage") },
            { it.returnType == "V" && it.name.startsWith("initialise") },
            "return-void",
        )
        stop(
            "Amplitude", 2,
            { it == AMPLITUDE },
            { method ->
                method.returnType == AMPLITUDE && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.name in setOf("track", "identify", "groupIdentify", "revenue")
            },
            "return-object p0",
        )
        stop(
            "Splunk RUM", 1,
            { it == SPLUNK_COMPANION },
            { it.name == "install" && it.returnType == SPLUNK_RUM && (it.implementation?.registerCount ?: 0) > 4 },
            """
                invoke-virtual { p0 }, $SPLUNK_COMPANION->getInstance()$SPLUNK_RUM
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
        stop(
            "Luciq", 1,
            { it == "Lai/luciq/library/Luciq\$Builder;" },
            { it.name == "build" && it.returnType == "V" },
            "return-void",
        )

        blockTrackers()
    }
}
