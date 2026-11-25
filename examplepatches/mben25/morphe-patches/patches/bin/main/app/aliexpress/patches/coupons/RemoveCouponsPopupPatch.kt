package app.aliexpress.patches.coupons

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `CouponFloorFatigueManager.a(IILString)Z` — "isFatigued": whether the search-results coupon
 * floor/popup has already been shown often enough today. Answering "yes" always keeps it hidden.
 * The class name is not obfuscated; the log string is unique to this method.
 */
internal object CouponFloorIsFatiguedFingerprint : Fingerprint(
    definingClass = "Lcom/alibaba/aliexpress/android/search/core/pop/couponfloor/CouponFloorFatigueManager;",
    returnType = "Z",
    parameters = listOf("I", "I", "Ljava/lang/String;"),
    strings = listOf("[fatigue/isFatigued] spKey="),
)

@Suppress("unused")
val removeCouponsPopupPatch = bytecodePatch(
    name = "Remove coupons popup",
    description = "Hides the coupon floor/popup shown over search results.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        // `.locals 8`.
        CouponFloorIsFatiguedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
