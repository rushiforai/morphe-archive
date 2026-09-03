package veewalabsUnitconverter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

object Z2ClassAnchorFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/ArrayList;"),
    filters = listOf(
        string("‚‗‚")
    )
)

object Fingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    classFingerprint = Z2ClassAnchorFingerprint,
    filters = listOf(
        string("premium_removeads_purchased")
    )
)