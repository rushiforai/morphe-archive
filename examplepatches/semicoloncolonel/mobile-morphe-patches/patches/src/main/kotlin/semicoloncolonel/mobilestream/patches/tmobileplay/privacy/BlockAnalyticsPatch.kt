package semicoloncolonel.mobilestream.patches.tmobileplay.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.tmobileplay.shared.Constants

// T-Mobile Play 19.4.4 sends its own usage events to Sliide's event service over
// gRPC, which the shared URL layer does not see. The one data source that
// sends them now answers with an empty success, so queued events are dropped
// instead of retried. Firebase Analytics is switched off in the manifest, and
// Apptentive (in-app surveys and feedback) is never registered.
//
// Not touched: sign-in, the feeds, and crash reporting.

private const val EVENT_CLIENT = "Lsliide/services/event/api/EventServiceAPIClient;"
private const val EVENT_RESPONSE = "Lsliide/services/event/api/SendEventsResponse;"
private const val APPTENTIVE = "Lapptentive/com/android/feedback/Apptentive;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops T-Mobile Play's usage events, Firebase Analytics, and Apptentive surveys. " +
        "Sign-in and the feeds are left alone. Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The data source holding the event client: its (List events, Continuation) sender.
        val senders = forEachMatchingMethod(
            { classDef -> classDef.fields.any { it.type == EVENT_CLIENT } },
            { method ->
                method.returnType == "Ljava/lang/Object;" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes.first().toString() == "Ljava/util/List;" &&
                    (method.implementation?.registerCount ?: 0) > 3
            },
        ) {
            it.returnEarly(
                """
                    new-instance v0, $EVENT_RESPONSE
                    invoke-direct { v0 }, $EVENT_RESPONSE-><init>()V
                    return-object v0
                """.trimIndent(),
            )
        }
        if (senders != 1) throw PatchException("T-Mobile Play event sender not found ($senders)")

        val apptentive = forEachMatchingMethod(
            { it.type == APPTENTIVE },
            { method ->
                method.name == "register" && method.returnType == "V" &&
                    method.parameterTypes.size == 3 &&
                    method.parameterTypes.first().toString() == "Landroid/app/Application;"
            },
        ) { it.returnEarly("return-void") }
        if (apptentive == 0) throw PatchException("Apptentive register not found")

        blockTrackers()
    }
}
