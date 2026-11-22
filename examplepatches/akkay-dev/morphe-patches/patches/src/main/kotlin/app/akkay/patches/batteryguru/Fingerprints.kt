package app.akkay.patches.batteryguru

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the primary subscription entitlement check in Battery Guru:
 * Method: public final c()Z in BillingProvider (obfuscated as class Ll26; in classes2.dex)
 *
 * Smali anchors:
 *   Contains product strings "one_year_subscription", "one_month_subscription", "one_week_subscription".
 *   This fingerprint matches uniquely across all DEX files without using obfuscated identifiers.
 */
object SubscriptionCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf(
        "one_year_subscription",
        "one_month_subscription",
        "one_week_subscription"
    )
)

/**
 * Matches the individual Play Billing purchase query in Battery Guru:
 * Method: public final l(Ljava/lang/String;)Z in PlayBillingWrapper (obfuscated as class Lnt0; in classes.dex)
 *
 * Scoped to Battery Guru 2.5.1.1.
 */
object PurchaseQueryFingerprint : Fingerprint(
    definingClass = "Lnt0;",
    name = "l",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)
