package app.morphe.patches.iscreen.shared.patches.util.preferenceUtil

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val isSubscribedPatch = bytecodePatch {
    execute {
        IsSubscribedFingerprint.matchSingle().method.returnEarly(true)
    }
}

val isTVodSubscribedPatch = bytecodePatch {
    execute {
        IsTVodSubscribedFingerprint.matchSingle().method.returnEarly(true)
    }
}

val isLoginPatch = bytecodePatch {
    execute {
        IsLoginFingerprint.matchSingle().method.returnEarly(true)
    }
}