package dev.hyzor.patches.sleep.premium

import app.morphe.patcher.Fingerprint

private const val TRIAL_FILTER = "Lcom/urbandroid/sleep/TrialFilter;"
private const val PREFERENCES_UTILS = "Lcom/urbandroid/common/util/PreferencesUtils;"

/**
 * `TrialFilter.hasUnlock()Z`
 *
 * Set from `hasGoodSignature("com.urbandroid.sleep.full.key")` in `refresh()` —
 * i.e. "the paid unlock-key APK is installed" — and from the persisted billing flag.
 */
internal object HasUnlockFingerprint : Fingerprint(
    definingClass = TRIAL_FILTER,
    name = "hasUnlock",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `TrialFilter.isTrial()Z`
 *
 * The paywall itself. 58 call sites read it, `isTrialExpired()` derives from it, and
 * `refresh()` is its only writer — so a patched getter decides every feature.
 */
internal object IsTrialFingerprint : Fingerprint(
    definingClass = TRIAL_FILTER,
    name = "isTrial",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `TrialFilter.isOurSignature()Z`
 *
 * Result of `checkOurSignature()`: false once the APK is re-signed, which makes
 * `AlarmClock#refreshTrialStatusForTabs` paint the "unknown signature" warning strip.
 * Not present on every old target, hence `methodOrNull` at the call site.
 */
internal object IsOurSignatureFingerprint : Fingerprint(
    definingClass = TRIAL_FILTER,
    name = "isOurSignature",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `TrialFilter.isUnknownSource()Z`
 *
 * True for any sideloaded install (no installer package). Drives the pirate icon in
 * the navigation drawer and hard-blocks the AI assistant in `AiActivity#onCreate`.
 */
internal object IsUnknownSourceFingerprint : Fingerprint(
    definingClass = TRIAL_FILTER,
    name = "isUnknownSource",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `PreferencesUtils.isUnlockAcked(Context)Z`
 *
 * Together with `hasUnlock()` this guards the periodic Play Billing re-query in
 * `AlarmClock`: `if (!(hasUnlock && isUnlockAcked)) { refreshPurchaseState() }`.
 */
internal object IsUnlockAckedFingerprint : Fingerprint(
    definingClass = PREFERENCES_UTILS,
    name = "isUnlockAcked",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `PreferencesUtils.isCloudPremiumStatus(Context)Z`
 *
 * Sleep Cloud is a second, separately billed subscription. Client-side flag only;
 * uploads still authenticate against the backend with an account token.
 */
internal object IsCloudPremiumStatusFingerprint : Fingerprint(
    definingClass = PREFERENCES_UTILS,
    name = "isCloudPremiumStatus",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `PreferencesUtils.isCloudPremiumStatusUnknown(Context)Z`
 *
 * "Subscription state not resolved yet" sentinel. Forcing cloud premium to true must
 * clear this too, or `TrialFilter.getCloudTimestamp` keeps picking the unknown branch.
 */
internal object IsCloudPremiumStatusUnknownFingerprint : Fingerprint(
    definingClass = PREFERENCES_UTILS,
    name = "isCloudPremiumStatusUnknown",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)
