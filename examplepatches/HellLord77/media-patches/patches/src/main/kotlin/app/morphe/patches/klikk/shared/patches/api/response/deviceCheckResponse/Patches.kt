package app.morphe.patches.klikk.shared.patches.api.response.deviceCheckResponse

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly

val getResultPatch = bytecodePatch {
    execute {
        GetResultFingerprint.matchSingle().method.returnBoxedBooleanEarly(true)
    }
}