package app.template.patches.callblacklist

import app.morphe.patcher.Fingerprint

object Fingerprints {
    // x3.z -> d(Context) : boolean — primary premium gatekeeper
    val PremiumGatekeeperFingerprint = Fingerprint(
        definingClass = "Lx3/z;",
        name = "d"
    )

    // x3.z -> e(Context) : boolean — playpass/subscription check
    val PlaypassCheckFingerprint = Fingerprint(
        definingClass = "Lx3/z;",
        name = "e"
    )
    // u2.b — static purchase verification methods (f, g, h)
    val PurchaseVerifierFingerprint = Fingerprint(
        definingClass = "Lu2/b;"
    ) 
}