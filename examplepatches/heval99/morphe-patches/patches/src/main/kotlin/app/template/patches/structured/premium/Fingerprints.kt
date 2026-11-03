package app.template.patches.structured.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** RevenueCat keeps its class names; the app's mapper around it is R8-renamed. */
internal const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"

/** The two RevenueCat entitlement identifiers Structured sells. */
internal const val PRO = "pro"
internal const val RECURRING_TASKS = "recurring_tasks"

/**
 * The app's only RevenueCat consumer: a static (CustomerInfo) state mapper that reads
 * `customerInfo.entitlements.active.keySet()`, checks the two entitlement ids and returns the
 * state object every Pro gate reads. The class, method and state type are R8-renamed; the
 * RevenueCat parameter type and the two ids are stable, and only this method carries both.
 */
internal object StructuredEntitlementFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(CUSTOMER_INFO),
    strings = listOf(PRO, RECURRING_TASKS),
)
