package app.template.patches.multitimer.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// Fingerprints fa.a(Context): the static PRO status check.
// Uses firebase.test.lab check as a unique stable anchor, plus the Settings.System.getString call.
// Returns true if the user has purchased PRO, false otherwise.
object IsProFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("firebase.test.lab", "true"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/provider/Settings\$System;",
            name = "getString",
        )
    )
)
