package app.paresh.patches.crex.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.paresh.patches.crex.shared.Constants.COMPATIBILITY_CREX

// MyApplication.C2() — returns true if subscription expired (free user)
object SubscriptionExpiredFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("yyyy-MM-dd"),
        string("expiry_date"),
        string("0000-00-00"),
    )
)

@Suppress("unused")
val crexPremiumPatch = bytecodePatch(
    name = "CREX Premium",
    description = "Unlocks premium features and removes ads."
) {
    compatibleWith(COMPATIBILITY_CREX)

    execute {
        SubscriptionExpiredFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
