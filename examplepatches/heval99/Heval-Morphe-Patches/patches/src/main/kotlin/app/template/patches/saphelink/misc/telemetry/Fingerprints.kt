package app.template.patches.saphelink.misc.telemetry

import app.morphe.patcher.Fingerprint

// Braze custom event tracking (two overloads: with and without BrazeProperties)
object BrazeLogCustomEventFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/braze/Braze;" && method.name == "logCustomEvent"
    }
)