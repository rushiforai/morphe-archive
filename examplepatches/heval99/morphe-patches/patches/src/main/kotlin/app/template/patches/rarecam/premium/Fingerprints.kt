package app.template.patches.rarecam.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** RevenueCat keeps its class names; the app's callback around it is R8-renamed. */
internal const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"

/** The entitlement identifier RareCam sells. */
internal const val RARECAM_PRO = "rarecam_pro"

/**
 * The app's only RevenueCat consumer: a static (CustomerInfo)V that reads
 * `customerInfo.entitlements.get("rarecam_pro")?.isActive()` and stores the boolean into the
 * Compose MutableState every Pro gate reads. The class is renamed (1.0.90: c8.d) and so is the
 * method, but the RevenueCat parameter type and the entitlement id are stable, and only one method
 * carries both.
 */
internal object RareCamEntitlementFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(CUSTOMER_INFO),
    strings = listOf(RARECAM_PRO),
)
