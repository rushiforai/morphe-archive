package app.gogamid.morphed.patches.rossmann

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The static factory of CouponDisruptorState, verified against Rossmann 5.11.1
 * (versionCode 421000110).
 *
 * The factory turns a coupon list into the app's "coupons present" disruptor
 * state. It is reached from the coupon nag helper, product search, the cart,
 * order history and product details, so every context that presents coupons
 * passes through here.
 *
 * The app obfuscates method and field names but keeps class names, so this
 * fingerprint anchors on the class, the full parameter list and the two
 * null-check string constants at the top of the method. The method is only
 * static (not final), so isStatic is declared instead of exact access flags.
 */
object CouponDisruptorCreateFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/models/coupon/CouponDisruptorState\$Companion;",
    isStatic = true,
    parameters = listOf("Ljava/util/List;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
    returnType = "Lde/rossmann/app/android/models/coupon/CouponDisruptorState;",
    filters = listOf(
        string("productEan"),
        string("findActivatedCoupon"),
    ),
)

/**
 * Common display-model conversion reached from the Coupons tab and search.
 */
object CouponDisplayModelFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/ui/coupon/CouponDisplayModelFactory;",
    isStatic = true,
    parameters = listOf(
        "Lde/rossmann/app/android/models/coupon/Coupon;",
        "Lde/rossmann/app/android/ui/coupon/CouponDisplayModel\$ValidityTextMode;",
        "Lde/rossmann/app/android/ui/shared/Visibility;",
        "Lde/rossmann/app/android/ui/shared/Visibility;",
    ),
    returnType = "Lde/rossmann/app/android/ui/coupon/CouponDisplayModel;",
)

object RossmannApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/ui/RossmannApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)
