package app.morphe.patches.iscreentv.shared.patches.util.preferenceUtil

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val isTVodSubscribedPatch = bytecodePatch {
    execute {
        IsTVodSubscribedFingerprint.matchSingle().method.returnEarly(true)
    }
}

val isSubscribedPatch = bytecodePatch {
    execute {
        IsSubscribedFingerprint.matchSingle().method.returnEarly(true)
    }
}

val isLoginPatch = bytecodePatch {
    execute {
        IsLoginFingerprint.matchSingle().method.returnEarly(true)
    }
}