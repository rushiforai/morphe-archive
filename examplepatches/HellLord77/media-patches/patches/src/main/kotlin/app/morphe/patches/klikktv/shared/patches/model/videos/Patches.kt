package app.morphe.patches.klikktv.shared.patches.model.videos

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly

val isPaidPatch = bytecodePatch {
    execute {
        IsPaidFingerprint.matchSingle().method.returnBoxedBooleanEarly(false)
    }
}

val isSubscribedPatch = bytecodePatch {
    execute {
        IsSubscribedFingerprint.matchSingle().method.returnBoxedBooleanEarly(true)
    }
}