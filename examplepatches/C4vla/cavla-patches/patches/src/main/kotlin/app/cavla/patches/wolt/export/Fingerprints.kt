package app.cavla.patches.wolt.export

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * CartController's toolbar-setup method (jadx `A0`): private final void, no params, that
 * configures the RegularToolbar. Identified by its call to RegularToolbar.setStartIcon.
 * Runs once after the cart view (incl. RecyclerView) is bound, so our injected call can
 * safely reach getRecyclerView$new_order_release().
 */
object CartToolbarSetupFingerprint : Fingerprint(
    definingClass = "Lcom/wolt/android/new_order/controllers/cart/CartController;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/wolt/android/core_ui/widget/RegularToolbar;",
            name = "setStartIcon",
        ),
    ),
)
