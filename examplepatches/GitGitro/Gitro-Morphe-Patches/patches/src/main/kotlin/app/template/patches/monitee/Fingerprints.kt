package app.template.patches.monitee

import app.morphe.patcher.Fingerprint

object IsProFromBillingFingerprint : Fingerprint(
    definingClass = $$"Lcom/krillsson/monitee/billing/ProContentManager$isProFromBilling$1;",
    name = "q",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

object ProStatusFromBillingFingerprint : Fingerprint(
    definingClass = $$"Lcom/krillsson/monitee/billing/ProContentManager$proStatusFromBilling$1;",
    name = "q",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)