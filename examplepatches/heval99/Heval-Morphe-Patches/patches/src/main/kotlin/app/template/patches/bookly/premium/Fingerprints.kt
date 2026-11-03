package app.template.patches.bookly.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val CUSTOMER_INFO = "Lcom/revenuecat/purchases/CustomerInfo;"

/** Bookly's lifetime entitlement, encoded as this product id in the RevenueCat active map. */
internal const val PREMIUM_PRODUCT = "chest_of_diamonds_3000"

/**
 * The app's premium check: a static (CustomerInfo)Z that walks the active entitlements and asks
 * whether any product id equals the lifetime one ("chest_of_diamonds_3000"). The billing client
 * uses it to put SubscriptionManager into the Active state and every Pro gate reads that state.
 * The class and method names are readable in this build; the product id is the stable anchor.
 */
internal object BooklyPremiumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(CUSTOMER_INFO),
    strings = listOf(PREMIUM_PRODUCT),
)
