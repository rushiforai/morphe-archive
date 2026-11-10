package app.morphe.patches.timetree.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object PremiumManagerIsEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("is_premium_enabled")
    )
)

internal object PremiumManagerSetEnabledFingerprint : Fingerprint(
    classFingerprint = PremiumManagerIsEnabledFingerprint,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("is_premium_enabled")
    )
)

internal object SplashAdsActivityFingerprint : Fingerprint(
    definingClass = "Lworks/jubilee/timetree/app/ui/SplashAdsActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)
