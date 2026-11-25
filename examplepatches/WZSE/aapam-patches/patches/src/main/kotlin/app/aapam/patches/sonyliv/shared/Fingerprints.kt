package app.aapam.patches.sonyliv.shared

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Ad entitlement gate method: Lp10/i;->F(AssetMetadata)Z
 * Checks "gdpr_country" and content "Free" status before requesting ads.
 */
internal object AdEligibilityFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lcom/sonyliv/network/model/core/AssetMetadata;"),
    strings = listOf("gdpr_country", "Free"),
)

/**
 * Ad tag URL builder method: Lp10/i;->f(...)Ljava/lang/String;
 * Formats the IMA ad tag query string.
 */
internal object AdTagUrlBuilderFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("Exception while fetching ad Tag URL"),
)

/**
 * CleverTap queue flush method: Lzf/i;->b(Context, eventGroup, String, boolean)V
 * Iterates through SQLite/memory queues and dispatches network requests to CleverTap servers.
 */
internal object CleverTapQueueFlushFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Starting queue flush to CleverTap servers"),
)

/**
 * CleverTap send queue method: Lzf/i;->k(Context, eventGroup, JSONArray, String, boolean)Z
 * Performs the actual HTTP transmission of batched event queues to CleverTap servers.
 */
internal object CleverTapSendQueueFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("CleverTap Id not finalized, unable to send queue"),
)

/**
 * AppsFlyer parameter builder / tracking dispatch in Los/x0;
 * Method: Los/x0;->a(HashMap)V
 */
internal object AppsFlyerTrackParamsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/HashMap;"),
    strings = listOf("LoggedInMedium", "SubscribedPackSKU"),
)
