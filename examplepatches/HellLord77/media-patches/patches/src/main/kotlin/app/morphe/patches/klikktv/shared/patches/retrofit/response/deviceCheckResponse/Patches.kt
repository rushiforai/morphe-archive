package app.morphe.patches.klikktv.shared.patches.retrofit.response.deviceCheckResponse

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly

val getResultPatch = bytecodePatch {
    execute {
        GetResultFingerprint.matchSingle().method.returnBoxedBooleanEarly(true)
    }
}