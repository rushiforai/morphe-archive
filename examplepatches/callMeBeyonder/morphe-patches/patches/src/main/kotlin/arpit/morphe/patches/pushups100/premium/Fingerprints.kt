package arpit.morphe.patches.pushups100.premium

import app.morphe.patcher.Fingerprint

/**
 * The `com.zenlabs.challenge.*` apps keep a single subscription flag, unlike the
 * `com.c25k.reboot` running apps which use a multi-field unlock state.
 *
 * `SubscriptionState` is a one-field data class (`isActive`) exposed as
 * `LiveData<SubscriptionState>` on `AppSubscriptionStateProvider`. Everything premium
 * reads it:
 *
 * - `AppSubscriptionStateProvider.hasSubscription()` → `state.isActive()`, consumed by
 *   `SettingsFactory` (Unsubscribe entry), `HomeActivity` (banner ad, promo item, music
 *   icon), `FitnessPlansActivity.isProVersion()`, `ChallengeAchievementClient`,
 *   `SplashActivity` and `SubscriptionPageView`,
 * - `HomeActivity.observeSubscriptionState()` calls `isActive()` directly to decide on
 *   the holiday promo banner.
 *
 * Both readings are patched: the accessor covers callers that go through the provider,
 * the data-class getter covers the ones that read the state object directly.
 */
val subscriptionStateIsActiveFingerprint = Fingerprint(
    definingClass = "/SubscriptionState;",
    name = "isActive",
    returnType = "Z",
    parameters = emptyList(),
)

val subscriptionStateProviderFingerprint = Fingerprint(
    definingClass = "/AppSubscriptionStateProvider;",
    name = "hasSubscription",
    returnType = "Z",
    parameters = emptyList(),
)
