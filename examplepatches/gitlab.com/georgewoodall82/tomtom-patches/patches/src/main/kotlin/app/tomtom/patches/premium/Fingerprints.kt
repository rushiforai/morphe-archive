package app.tomtom.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprints for TomTom GO / GO Expert 3.6.326 (versionCode 1678737).
 *
 * The app is fully obfuscated (R8) and ships no native code. The names below
 * were recovered from the 3.6.326 dex with jadx and verified against
 * /tmp/tomtom/smali. They are pinned to this version on purpose: every
 * fingerprint also carries a stable string literal so a future build fails
 * the match instead of patching the wrong method.
 *
 * Obfuscated package map for this build:
 *   qb/a$b  -> combined "has active subscriptions" transformer
 *   N9/c    -> subscription list -> subscription state enum
 *   tb/d    -> subscription helpers (isTrial / isStore / isLcms / isTruck)
 *   H9/G0   -> onboarding "SubscriptionHook" (trial / paywall step)
 *   x9/x0   -> observer that applies truck subscription settings
 *   x9/r0   -> observer that reverts a truck profile back to car
 *   e9/K2   -> vehicle profile screen model
 *   e9/v2   -> subscription shop model (trial card lookup)
 */

/**
 * qb/a$b.invoke(Object[]) -> Boolean, used by qb/a.e1() which ORs the
 * results of every subscription provider (LCMS, Google Play, Purchasely).
 * This is the single "does the user have any active subscription" answer.
 */
object HasActiveSubscriptionsFingerprint : Fingerprint(
    definingClass = "Lqb/a\$b;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    isStatic = false,
    filters = listOf(
        string("activeSubscriptionsExistenceList"),
    ),
)

/**
 * N9/c.invoke(List) -> N9/a (subscription state enum).
 * Returns FULL_TRIAL / NO_SUBSCRIPTION / EXPIRING_TRIAL /
 * STORE_SUBSCRIPTION / LCMS_SUBSCRIPTION. The state enums drive the
 * onboarding hooks and the SUBSCRIPTION_TYPE / USER_TYPE settings.
 */
object SubscriptionStateFingerprint : Fingerprint(
    definingClass = "LN9/c;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    isStatic = false,
    filters = listOf(
        string("subscriptions"),
    ),
)

/**
 * tb/d.f(tb/a) -> boolean = "this subscription is a trial".
 * Used by the state mapper, the shop UI and the trial-card lookup.
 */
object IsTrialFingerprint : Fingerprint(
    definingClass = "Ltb/d;",
    name = "f",
    returnType = "Z",
    parameters = listOf("Ltb/a;"),
    isStatic = true,
    filters = listOf(
        string("<this>"),
    ),
)

/**
 * H9/G0.e()V, the onboarding "SubscriptionHook". On a fresh install it
 * launches TimelineTrialScreen / Purchasely paywall and waits for the user.
 */
object SubscriptionOnboardingFingerprint : Fingerprint(
    definingClass = "LH9/G0;",
    name = "e",
    returnType = "V",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        string("com.tomtom.navui.setting.MOBILE_ONBOARDING_FLOW_COMPLETED"),
    ),
)

/**
 * x9/x0.a(List) applies the subscription list to system settings. When it
 * sees a truck subscription it sets show_full_vehicle_profile=true and
 * TRUCK_SUBSCRIPTION_PURCHASED=true; otherwise it clears them.
 */
object TruckFlagsFingerprint : Fingerprint(
    definingClass = "Lx9/x0;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    isStatic = false,
)

/**
 * x9/r0.a()V, the observer that silently switches a truck profile back to
 * CAR whenever show_full_vehicle_profile is false.
 */
object VehicleProfileRevertFingerprint : Fingerprint(
    definingClass = "Lx9/r0;",
    name = "a",
    returnType = "V",
    parameters = listOf(),
    isStatic = false,
)

/**
 * e9/K2 constructor. Stores show_full_vehicle_profile in the final field y2,
 * which decides whether the vehicle profile screen exposes the full truck
 * fields (weight, height, ADR, etc.).
 */
object VehicleProfileModelFingerprint : Fingerprint(
    definingClass = "Le9/K2;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Le9/s;"),
    isStatic = false,
)

/**
 * e9/v2.J1() -> tb/a, returns the current TRIAL subscription shown as
 * "Free Trial / Ends: <date>" in the subscription shop. Returning null
 * removes the trial card.
 */
object TrialCardFingerprint : Fingerprint(
    definingClass = "Le9/v2;",
    name = "J1",
    returnType = "Ltb/a;",
    parameters = listOf(),
    isStatic = false,
)
