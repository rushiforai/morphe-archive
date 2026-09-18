package app.template.patches.fairemail.premium

import app.morphe.patcher.Fingerprint

// FairEmail is FOSS and not obfuscated. The pro entitlement is a single SharedPreferences
// boolean ("pro") read through this static getter. The billing client rewrites the pref from
// Play on every launch, so the getter is the stable place to force the value.
object BillingIsProFingerprint : Fingerprint(
    definingClass = "Leu/faircode/email/ActivityBilling;",
    name = "isPro",
    parameters = listOf("Landroid/content/Context;"),
)
