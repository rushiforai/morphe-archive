package app.template.patches.forzafootball.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** RevenueCat keeps its class names; the app's helper around it is R8-renamed. */
internal const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"

/** The entitlement identifier, as RevenueCat stores it. */
internal const val FORZA_LEGEND = "Forza Legend"

/**
 * The app's Forza Legend entitlement check:
 * `customerInfo.entitlements.active.values.any { it.identifier == "Forza Legend" }`, a static
 * (CustomerInfo)Z. The helper class and method are R8-renamed (6.15.10: com.forzafootball.user.b),
 * but the RevenueCat parameter type and the entitlement id are stable, and only one method carries
 * both.
 */
internal object ForzaLegendFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(CUSTOMER_INFO),
    strings = listOf(FORZA_LEGEND),
)
