package app.morphe.patches.pokecardex.increaseLimit

import app.morphe.patcher.Fingerprint

object IncreaseScanLimitFingerprint : Fingerprint(
    custom = { methodDef, _ ->
        // This matches the Companion.c() method that returns 0x1e (30)
        methodDef.definingClass == "Lcom/application/pokecardex/ui/camera/viewmodel/CameraScanViewModel\$Companion;" &&
        methodDef.name == "c"
    }
)