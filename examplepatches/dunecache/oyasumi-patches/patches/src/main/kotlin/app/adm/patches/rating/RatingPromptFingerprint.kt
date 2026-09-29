package app.adm.patches.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall

object RatingPromptFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Main;",
    name = "W",
    returnType = "V",
    parameters = listOf("Lcom/dv/get/Main;"),
    filters = listOf(
        literal(7),
        methodCall(
            definingClass = "Lcom/dv/get/Main;",
            name = "Y1"
        )
    )
)
