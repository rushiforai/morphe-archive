package app.ronp.patches.walmart.storemode

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.ronp.patches.shared.Constants.COMPATIBILITY_WALMART

@Suppress("unused")
val disableAutoStoreModePatch = bytecodePatch(
    name = "Disable automatic store mode",
    description = "Stops the store mode sheet from popping up on its own when you open the app in a store. " +
        "Location, store-specific pricing, the in-store search filter and the store mode banner/button still work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WALMART)

    execute {
        // Make the "in-store status changed" handler a no-op so nothing is queued automatically.
        StoreStatusChangedFingerprint.method.returnEarly()
    }
}
