package app.template.patches.timetune.premium

import app.morphe.patcher.Fingerprint

/**
 * The subscription half of TimeTune's premium answer: a static `(Context)Z` helper that reads
 * `PREF_PREMIUM_SUBS` from the app's billing preferences. In 5.6.3 it is `Lug$a;->c(Context)`,
 * called by the public premium check `Lug$a;->a(Context)`, which ORs it with the legacy one-time
 * purchase (`PREF_DIALOG`, SKU `dialog_title`).
 *
 * The class and method are R8-renamed, so the anchor is the preference key plus the
 * `(Context)Z` shape.
 */
internal object PremiumStateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("PREF_PREMIUM_SUBS"),
)
