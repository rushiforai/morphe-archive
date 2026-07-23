package app.morphe.patches.idos

import app.morphe.patcher.Fingerprint

@Suppress("unused")
object CommonDbPremiumFingerprint : Fingerprint(
    definingClass = "Lcz/mafra/jizdnirady/db/CommonDb;",
    name = "D2",
    returnType = "Z",
    parameters = emptyList()
)

@Suppress("unused")
object PremiumTextFingerprint : Fingerprint(
    definingClass = "Lcz/mafra/jizdnirady/billing/BillingFragment\$BillingFragmentState;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z")
)