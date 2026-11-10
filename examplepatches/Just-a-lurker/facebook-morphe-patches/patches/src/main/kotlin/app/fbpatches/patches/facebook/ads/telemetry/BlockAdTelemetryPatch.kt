/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0), ads/telemetry,
 * itself forked from https://github.com/andrewliang25/morphe-patches (Copyright 2026 Andrew Liang, GPL-3.0).
 *
 * Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.ads.telemetry

import app.fbpatches.patches.facebook.shared.handleTargets
import app.fbpatches.patches.facebook.shared.holdsString
import app.fbpatches.patches.facebook.shared.localRegisterCount
import app.fbpatches.patches.facebook.shared.neuterOrReason
import app.fbpatches.patches.facebook.shared.patchLog
import app.fbpatches.patches.facebook.shared.returnEarlyVoid
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method

private const val TELEMETRY_PATCH = "Block ad telemetry"

/** Ad measurement that runs whether or not an ad is shown. All keep their real names. */
internal val AD_TELEMETRY = listOf(
    // Screenshot-of-an-ad detection.
    "Lcom/facebook/ads/screenshot/AdsScreenshotController;",
    "Lcom/facebook/ads/AdsScreenshotDetector;",
    // Install attribution after seeing an ad.
    "Lcom/facebook/feed/platformads/AppInstallTrackerScheduler;",
    "Lcom/facebook/feed/platformads/AppInstallService;",
)

/** Jobs that report the advertising ID or check Android's ad measurement; only void methods. */
internal val AD_ID_JOBS = listOf(
    "Lcom/facebook/attribution/LatStatusJob;",
    "Lcom/facebook/privacysandbox/PrivacySandboxCapabilitiesChecker;",
    "Lcom/facebook/privacysandbox/protectedaudience/TestPACustomAudienceAppJob;",
)

/** Strings that each mark the one void method sending an identifier. */
internal val AD_ID_SENDERS = listOf(
    "ReportAdvertiserIDMutation",
    "fb4a_launch_custom_data",
    "https://www.facebook.com/privacy_sandbox/mobile/register/source?tracking_data=",
    "app_new_install",
)

/** The content provider other apps ask for the advertising ID. */
internal const val ATTRIBUTION_PROVIDER = "Lcom/facebook/katana/provider/AttributionIdProvider\$Impl;"

private val QUERY_PARAMETERS =
    listOf("Landroid/net/Uri;", "[Ljava/lang/String;", "Ljava/lang/String;", "[Ljava/lang/String;", "Ljava/lang/String;")

/** What the provider answers when Google Play services has no ID: one row of nulls. */
private const val NO_AD_ID_ROW = """
    const-string v0, "aid"
    const-string v1, "androidid"
    const-string v2, "limit_tracking"
    filled-new-array { v0, v1, v2 }, [Ljava/lang/String;
    move-result-object v0
    new-instance v1, Landroid/database/MatrixCursor;
    invoke-direct { v1, v0 }, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V
    const/4 v0, 0x0
    filled-new-array { v0, v0, v0 }, [Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V
    return-object v1
"""

@Suppress("unused")
val blockAdTelemetryPatch = bytecodePatch(
    name = "Block ad telemetry",
    description = "Stops ad screenshot detection, ad install attribution and several ways Facebook sends " +
        "your advertising ID.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEBOOK)

    // Deliberately not covered (see Hushfacebook): the on-device OCR of ad creative (suspend
    // functions returning Object) and the sponsored impression logger (neutering it invites
    // repeat logging rather than none).
    execute {
        handleTargets(TELEMETRY_PATCH, "ad telemetry classes", AD_TELEMETRY) { neuterOrReason(it) }

        AD_ID_JOBS.forEach { type -> neuterOrReason(type)?.let { patchLog.info("$TELEMETRY_PATCH: $it.") } }
        AD_ID_SENDERS.forEach { marker -> stopSenderOrReason(marker)?.let { patchLog.info("$TELEMETRY_PATCH: $it.") } }
        answerNoAdIdOrReason()?.let { patchLog.info("$TELEMETRY_PATCH: $it.") }
    }
}

private fun isAdIdSender(method: Method, marker: String) = method.returnType == "V" && holdsString(method, marker)

/** Null once the one void method holding exactly [marker] returns at once, or why nothing changed. */
private fun BytecodePatchContext.stopSenderOrReason(marker: String): String? {
    val senders = classDefByStrings(marker, StringComparisonType.EQUALS).flatMap { classDef ->
        classDef.methods.filter { isAdIdSender(it, marker) }
    }
    val sender = senders.singleOrNull()
        ?: return "${senders.size} void methods hold \"$marker\", expected 1, so that send keeps running"
    val mutable = mutableClassDefBy(sender.definingClass).methods.filter {
        it.name == sender.name && it.returnType == sender.returnType &&
            it.parameterTypes.map(Any::toString) == sender.parameterTypes.map(Any::toString)
    }
    mutable.singleOrNull()?.returnEarlyVoid()
        ?: return "${sender.definingClass}->${sender.name} matched ${mutable.size} methods, so that send keeps running"
    return null
}

private fun isProviderQuery(method: Method) = method.returnType == "Landroid/database/Cursor;" &&
    method.parameterTypes.map(Any::toString) == QUERY_PARAMETERS && method.implementation != null

/** Null once the attribution provider's query answers the no-ID row at once, or why nothing changed. */
private fun BytecodePatchContext.answerNoAdIdOrReason(): String? {
    val provider = mutableClassDefByOrNull(ATTRIBUTION_PROVIDER)
        ?: return "this build has no $ATTRIBUTION_PROVIDER"
    val queries = provider.methods.filter(::isProviderQuery)
    val query = queries.singleOrNull()
        ?: return "$ATTRIBUTION_PROVIDER has ${queries.size} query methods, expected 1"
    if (query.localRegisterCount() < 3) return "$ATTRIBUTION_PROVIDER->${query.name} has under 3 locals"
    query.addInstructions(0, NO_AD_ID_ROW)
    return null
}
