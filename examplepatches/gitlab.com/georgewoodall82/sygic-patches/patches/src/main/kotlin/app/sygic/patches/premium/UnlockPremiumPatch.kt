package app.sygic.patches.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.sygic.patches.shared.Constants.COMPATIBILITY_SYGIC

/**
 * Unlocks Sygic Truck premium (EXPERIMENTAL, needs device testing).
 *
 * What it does (26.1.9, com.sygic.truck):
 * - GoogleInAppPurchaseHelper.isBillingSupported -> true
 * - GoogleInAppPurchaseHelper.areSubscriptionsSupported -> true
 * - GoogleInAppPurchaseHelper.buyDone -> true (skip Play purchase-ack check)
 * - LowStoreFeatureBase.isSupported -> true
 * - LowStoreFeatureBase.buyDone -> true
 * - SygicMain.StoreIsEnabled / StoreIsSupported / StoreBuyDone -> true
 * - SidebarServiceImpl.checkLicense -> true
 *
 * What it does NOT do (important):
 * - Native libAura.so (nProcessStoreResponse, nGetProductRecordSet,
 *   HasAALicense) is untouched. If premium state is decided natively
 *   (very likely), Java true alone may only remove store UI gates, not
 *   unlock offline maps / traffic. Test on device: patch, install,
 *   check Menu -> Sygic Store -> All your licenses.
 * - handlePurchases is intentionally left alone: it is the method that
 *   calls native ProcessStoreResponse. Forcing its return would silence
 *   the native signal instead of faking success.
 *
 * If menus still show locked after patch, the remaining work is native:
 * jadx + Ghidra on lib/arm64-v8a/libAura.so, or a billing-emulation
 * (MicroG / Play Integrity) approach, verified with logcat.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Experimental: forces Sygic Truck store/billing checks to true (isBillingSupported, buyDone, StoreIsEnabled/Supported, sidebar license). Native libAura checks untouched - test on device.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SYGIC)

    execute {
        BillingSupportedFingerprint.method.returnEarly(true)
        SubscriptionsSupportedFingerprint.method.returnEarly(true)
        BuyDoneFingerprint.method.returnEarly(true)

        StoreBaseSupportedFingerprint.method.returnEarly(true)
        StoreBaseBuyDoneFingerprint.method.returnEarly(true)

        SygicStoreEnabledFingerprint.method.returnEarly(true)
        SygicStoreSupportedFingerprint.method.returnEarly(true)
        SygicStoreBuyDoneFingerprint.method.returnEarly(true)

        SidebarLicenseFingerprint.method.returnEarly(true)
    }
}
