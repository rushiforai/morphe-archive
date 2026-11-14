package semicoloncolonel.mobilestream.patches.tlife.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
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
//
// From 12.4.0 Adobe MobileCore, Amplitude, and the Luciq builder are renamed,
// and most move to one flat package. Their method names are kept, so each is
// found by its 12.3.1 name or by the methods it declares.

private const val SPLUNK_COMPANION = "Lcom/splunk/rum/integration/agent/api/SplunkRum\$Companion;"
private const val SPLUNK_RUM = "Lcom/splunk/rum/integration/agent/api/SplunkRum;"
private const val AMPLITUDE = "Lcom/amplitude/core/Amplitude;"

private val ADOBE_CORE_METHODS = setOf("registerExtensions", "configureWithAppID", "trackAction", "trackState", "lifecycleStart")
private val LUCIQ_BUILDER_METHODS = setOf("build", "buildInBG", "setAppVariant")

private fun ClassDef.declares(names: Set<String>, static: Boolean? = null) =
    methods.filter { static == null || AccessFlags.STATIC.isSet(it.accessFlags) == static }
        .map { it.name }.toSet().containsAll(names)

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
        fun stop(sdk: String, minimum: Int, classFilter: (ClassDef) -> Boolean, methodFilter: (Method) -> Boolean, smali: String) {
            val count = forEachMatchingMethod(classFilter, methodFilter) { it.returnEarly(smali) }
            if (count < minimum) throw PatchException("$sdk entry points not found ($count)")
        }

        stop(
            "Adobe", 2,
            { it.type == "Lcom/adobe/marketing/mobile/MobileCore;" || it.declares(ADOBE_CORE_METHODS, static = true) },
            { it.returnType == "V" && it.name in setOf("registerExtensions", "configureWithAppID", "initialize") },
            "return-void",
        )
        stop(
            "MoEngage", 1,
            { it.type.startsWith("Lcom/moengage/core/MoEngage") },
            { it.returnType == "V" && it.name.startsWith("initialise") },
            "return-void",
        )
        stop(
            "Amplitude", 2,
            { it.type == AMPLITUDE || it.methods.any { m -> m.name == "groupIdentify" && m.returnType == it.type } },
            { method ->
                method.returnType == method.definingClass && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.name in setOf("track", "identify", "groupIdentify", "revenue")
            },
            "return-object p0",
        )
        stop(
            "Splunk RUM", 1,
            { it.type == SPLUNK_COMPANION },
            { it.name == "install" && it.returnType == SPLUNK_RUM && (it.implementation?.registerCount ?: 0) > 4 },
            """
                invoke-virtual { p0 }, $SPLUNK_COMPANION->getInstance()$SPLUNK_RUM
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
        stop(
            "Luciq", 1,
            { it.type == "Lai/luciq/library/Luciq\$Builder;" || it.declares(LUCIQ_BUILDER_METHODS) },
            { it.name == "build" && it.returnType == "V" },
            "return-void",
        )

        blockTrackers()
    }
}
