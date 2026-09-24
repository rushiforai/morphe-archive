package app.morphe.patches.shadhin.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val freeContentPatch = bytecodePatch {
    execute {
        IsPaidGetterFingerprint.matchSingle().method.returnEarly(false)
    }
}