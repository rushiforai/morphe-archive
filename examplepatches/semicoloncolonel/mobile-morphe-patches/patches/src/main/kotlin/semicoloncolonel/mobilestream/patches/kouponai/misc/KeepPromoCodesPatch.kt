package semicoloncolonel.mobilestream.patches.kouponai.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Keep new-user promo codes.
//
// The home screen's "Best Promo Codes, New users only" card counts down seven
// days from the time stored under kp_device_fv in AsyncStorage (the first time
// the app was opened, or the account's creation time after sign-in), then
// disappears. PromoWindow sets that value to the current time right before the
// app reads it, so the card always shows seven days left.
//
// This is a native hook on AsyncStorageModule.multiGet, so it keeps working
// whichever JavaScript bundle the app runs.
// ─────────────────────────────────────────────────────────────────────────────

private const val PROMO_WINDOW = "Lsemicoloncolonel/mobilestream/extension/kouponai/misc/PromoWindow;"

internal object AsyncStorageMultiGetFingerprint : Fingerprint(
    definingClass = "Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;",
    name = "multiGet",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableArray;", "Lcom/facebook/react/bridge/Callback;"),
    returnType = "V",
)

@Suppress("unused")
val keepPromoCodesPatch = bytecodePatch(
    name = "Keep new-user promo codes",
    description = "Keeps the \"Best Promo Codes, New users only\" card on the home screen instead of " +
        "removing it seven days after you first open the app or create an account.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        AsyncStorageMultiGetFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $PROMO_WINDOW->beforeMultiGet(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
