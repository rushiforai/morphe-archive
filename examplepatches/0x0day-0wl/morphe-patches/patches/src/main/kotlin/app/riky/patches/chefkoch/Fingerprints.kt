package app.riky.patches.chefkoch

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val appState = "Lde/pixelhouse/chefkoch/app/redux/app/AppState;"
private const val entitlementSelectors =
    "Lde/pixelhouse/chefkoch/app/redux/shop/PurchasesEntitlementSelectorsKt;"

/**
 * Central ad gate. Every Admo/Offerista/Consent selector adapter delegates to this
 * method, so forcing it true hides banners, native cards and interstitials and
 * marks consent as `CompliantViaAdFree`.
 */
internal object SelectIsAdfreeFingerprint : Fingerprint(
    definingClass = entitlementSelectors,
    name = "selectIsAdfree",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(appState),
)

/** Single funnel for Firebase Analytics events. */
internal object LogAndTrackFingerprint : Fingerprint(
    definingClass = "Lde/chefkoch/foundation/analytics/firebase/FirebaseAnalyticsTracker;",
    name = "logAndTrack",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lde/chefkoch/cts/model/AnalyticsEvent;"),
)

/**
 * Redux middleware reducer that drives Firebase tracking, Snowplow initialization and
 * Admo Audix targeting.
 */
internal object AppTrackingAllFingerprint : Fingerprint(
    definingClass = "Lde/pixelhouse/chefkoch/app/redux/tracking/AppTrackingMiddleware;",
    name = "all\$lambda\$0",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lde/pixelhouse/chefkoch/app/redux/tracking/AppTrackingMiddleware;",
        "Lorg/reduxkotlin/TypedStore;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljava/lang/Object;",
    ),
)
