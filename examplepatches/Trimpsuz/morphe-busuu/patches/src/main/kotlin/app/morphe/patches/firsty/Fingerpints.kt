package app.morphe.patches.firsty

import app.morphe.patcher.Fingerprint

object OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/firsty/bamboo1/FirstyApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList()
)
