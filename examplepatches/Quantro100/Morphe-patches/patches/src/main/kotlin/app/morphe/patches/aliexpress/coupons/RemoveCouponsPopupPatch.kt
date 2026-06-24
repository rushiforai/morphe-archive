package app.morphe.patches.aliexpress.coupons

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object CouponFatigueFingerprint : Fingerprint(
    strings = listOf("search_coupon_floor_fatigue_", "618Coupon: "),
    returnType = "Z",
)

val removeCouponsPopupPatch = bytecodePatch(
    name = "Remove coupons popup",
    description = "Removes the coupon and promotion popup dialogs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        CouponFatigueFingerprint.method.apply {
            addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }
    }
}
