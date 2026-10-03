package app.morphe.patches.klikktv.shared.patches.utils.ioUtils

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val getSharedPreferenceStringPatch = bytecodePatch {
    execute {
        GetSharedPreferenceStringFingerprint.matchSingle().method.returnEarly("{}")
    }
}