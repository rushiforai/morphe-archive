package app.template.patches.smartwod.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTWOD
import app.template.patches.shared.addInstructionsChecked

internal const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/smartwod/EnablePremiumPatch;"

// SmartWOD decides premium in its Hermes JS bundle: getPremiumInfoAndroid concatenates
// getAvailableItemsByType("inapp") and ("subs") and only checks each entry's productId (no
// purchase state, signature, token or server validation). The lifetime product counts as
// Premium+, and premium is revoked whenever the product is missing, so the hook answers on every
// call. Entries are reported as acknowledged so the JS never calls acknowledgePurchase.
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Premium+ features.",
) {
    compatibleWith(COMPATIBILITY_SMARTWOD)

    extendWith("extensions/smartwod.mpe")

    execute {
        // Skip ensureConnection + queryPurchasesAsync entirely and resolve the fake purchases.
        GetAvailableItemsByTypeFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static {p1, p2}, $EXTENSION_CLASS_DESCRIPTOR->resolve(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
                return-void
            """,
        )
    }
}
