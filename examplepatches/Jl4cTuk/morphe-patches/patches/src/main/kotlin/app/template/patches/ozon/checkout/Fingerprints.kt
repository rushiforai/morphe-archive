package app.template.patches.ozon.checkout

import app.morphe.patcher.Fingerprint

/** Matches the mapper for the courier/PVZ tips widget used by checkout and delivery screens. */
object FreshCourierTipsMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/fresh/unsorted/widgets/courierTips/presentation/CourierTipsMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/fresh/unsorted/widgets/courierTips/data/CourierTipsDTO;",
        "L",
    ),
)

/** Matches the equivalent courier tips mapper used on the completed-order screen. */
object OrderDoneCourierTipsMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutorderdone/orderdone/courierTips/presentation/CourierTipsMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/checkoutorderdone/orderdone/courierTips/data/CourierTipsDTO;",
        "L",
    ),
)

/** Matches the API entry point that sends courier tips from delivery screens. */
object FreshSendCourierTipsFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/fresh/unsorted/widgets/courierTips/presentation/CourierTipsViewModel;",
    name = "sendCourierTips",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "Ljava/lang/String;",
    ),
)

/** Matches the completed-order variant of the courier tips API entry point. */
object OrderDoneSendCourierTipsFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutorderdone/orderdone/courierTips/presentation/CourierTipsViewModel;",
    name = "sendCourierTips",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "Ljava/lang/String;",
    ),
)

/** Matches the checkout helper that copies `pvz_tip_id` into request state. */
object AddPvzTipIdFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutcomposer/common/configurator/CheckoutRequestInterceptor;",
    name = "addPvzTipId",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/composer/state/ComposerRequestState;",
        "Ljava/lang/String;",
    ),
)

/** Matches request preparation before checkout state is serialized. */
object AddCheckoutLocationParamsFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutcomposer/common/configurator/CheckoutRequestInterceptor;",
    name = "addLocationParams",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/composer/state/ComposerRequestState;",
    ),
)

/** Matches state interception for server-driven checkout actions. */
object CheckoutInterceptStateFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/checkoutcomposer/common/configurator/CheckoutRequestInterceptor;",
    name = "interceptState",
    returnType = "Lru/ozon/composer/state/ComposerRequestState;",
    parameters = listOf(
        "Lru/ozon/composer/state/ComposerRequestState;",
        "Lru/ozon/composer/event/ComposerEvent;",
    ),
)
