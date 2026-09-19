package app.template.patches.bluecoins.premium

import app.morphe.patcher.Fingerprint

// Bluecoins is not obfuscated. Every premium check in the UI reads the same
// BillingDomain flow, whose only implementation is BillingDomainManager; the domain
// manager delegates to EncryptedAppPreferenceManager's encrypted "premiumKey" pref.
object PremiumVersionFlowFingerprint : Fingerprint(
    definingClass = "Lcom/rammigsoftware/bluecoins/sourcecommon/billing/BillingDomainManager;",
    name = "isPremiumVersionFlow",
)
