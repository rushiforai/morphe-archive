package app.template.patches.mango.premium

import app.morphe.patcher.Fingerprint

/** The SharedPreferences key for the cached Pro state, in the billing client's <clinit>. */
internal const val CACHED_PRO = "billing_cached_is_pro"

/**
 * The app's billing client: its <clinit> builds the two preference keys
 * "billing_cached_is_pro" and "billing_had_pro", and its constructor seeds the Pro StateFlow from
 * the persisted billing state. The class name is R8-renamed; the keys are unique.
 */
internal object MangoBillingClientFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf(CACHED_PRO, "billing_had_pro"),
)
