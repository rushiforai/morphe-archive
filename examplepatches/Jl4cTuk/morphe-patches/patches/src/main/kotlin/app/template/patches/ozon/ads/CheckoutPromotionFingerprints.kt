package app.template.patches.ozon.ads

import app.morphe.patcher.Fingerprint

/** Matches the mapper for the white sticky checkout notification. */
object CheckoutStickyNotificationMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutcomposer/stickyNotification/presentation/mapper/StickyNotificationMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/checkoutcomposer/stickyNotification/data/StickyNotificationDTO;",
        "L",
    ),
)

/** Matches generic atoms rendered inside the payment-method widget. */
object PaymentInfoAtomBindFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutcomposer/paymentInfoV2/presentation/dynamicElements/AtomVH;",
    name = "bind",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/uni/atoms/data/AtomDTO;",
    ),
)

/** Matches the Compose overlay used for the green Ozon Bank savings badge. */
object CheckoutSavingsBadgeComposeFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutcomposer/stickyBadgeInfoV2/presentation/StickyBadgeInfoV2WidgetKt;",
    name = "StickyBadgeInfoV2Widget",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/app/android/checkoutcomposer/stickyBadgeInfoV2/presentation/StickyBadgeInfoV2VO;",
        "Lru/ozon/app/android/cart/common/presentation/TotalVisibilityViewModel;",
        "Landroidx/compose/runtime/c;",
        "I",
    ),
)
