package app.morphe.patches.klikk.shared.patches.models.userData

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val getIdPatch = bytecodePatch {
    execute {
        GetIdFingerprint.matchSingle().method.returnEarly("0")
    }
}