package app.morphe.patches.pokecardex.disableCounter

import app.morphe.patcher.Fingerprint

object DisableCounterFingerprint : Fingerprint(
    custom = { methodDef, _ ->
        // This matches the ScanPreferences.c() method that increments the counter
        methodDef.definingClass == "Lcom/application/pokecardex/managers/ScanPreferences;" &&
        methodDef.name == "c"
    }
)