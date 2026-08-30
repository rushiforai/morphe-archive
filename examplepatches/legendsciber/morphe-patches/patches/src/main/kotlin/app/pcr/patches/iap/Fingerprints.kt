package app.pcr.patches.iap

import app.morphe.patcher.Fingerprint

object PurchaseStateFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_Purchase_GetState",
    returnType = "D",
    parameters = listOf("Ljava/lang/String;")
)

object VerifySignatureFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_Purchase_VerifySignature",
    returnType = "D",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

object PurchaseProductFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_PurchaseProduct",
    returnType = "D",
    parameters = listOf("Ljava/lang/String;")
)

object PurchaseSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_PurchaseSubscription",
    returnType = "D",
    parameters = listOf("Ljava/lang/String;")
)

object IsStoreConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_IsStoreConnected",
    returnType = "D",
    parameters = listOf()
)

object GetStatusFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_GetStatus",
    returnType = "D",
    parameters = listOf()
)

object PurchaseGetOriginalJsonFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_Purchase_GetOriginalJson",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;")
)

object PurchaseGetSignatureFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBilling;",
    name = "GPBilling_Purchase_GetSignature",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;")
)

object QueryPurchasesAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/StudioFurukawa/PixelCarRacer/GooglePlayBillingService;",
    name = "queryPurchasesAsync",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)
