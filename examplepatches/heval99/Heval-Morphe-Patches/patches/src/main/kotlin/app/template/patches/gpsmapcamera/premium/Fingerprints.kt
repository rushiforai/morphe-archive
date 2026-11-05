package app.template.patches.gpsmapcamera.premium

import app.morphe.patcher.Fingerprint

// SubscriptionManager keeps its source name (the app's classes are kept, only R8's synthetic
// lambdas get letters). isSubscribed() returns the cached "isAdsRemoved" flag from the "app_prefs"
// SharedPreferences, which BillingManager rewrites after every Play purchase query; every premium
// gate in the app reads this getter.
internal object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/gkfriend/gpsmapcameraeditor/billing/SubscriptionManager;",
    name = "isSubscribed",
    returnType = "Z",
    parameters = listOf(),
)
