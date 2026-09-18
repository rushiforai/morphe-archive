package app.template.patches.sofascore.misc.facebook

import app.morphe.patcher.Fingerprint

// Both classes are AndroidX/Android ContentProviders and are not obfuscated, so both the
// class names and the framework onCreate override survive R8. They are the auto-init
// entry points that run before Application.onCreate().
object FacebookInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/internal/FacebookInitProvider;",
    name = "onCreate",
)

object AudienceNetworkContentProviderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AudienceNetworkContentProvider;",
    name = "onCreate",
)
