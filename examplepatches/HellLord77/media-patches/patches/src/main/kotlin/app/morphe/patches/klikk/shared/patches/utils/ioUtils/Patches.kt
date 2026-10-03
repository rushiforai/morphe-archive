package app.morphe.patches.klikk.shared.patches.utils.ioUtils

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val isUserLoggedInPatch = bytecodePatch {
    execute {
        IsUserLoggedInFingerprint.matchSingle().method.returnEarly(true)
    }
}

val hasValidSubscriptionPatch = bytecodePatch {
    execute {
        HasValidSubscriptionFingerprints.forEach { it.matchSingle().method.returnEarly(true) }
    }
}

val isVideoWithinValidityPeriodPatch = bytecodePatch {
    execute {
        IsVideoWithinValidityPeriodFingerprint.matchSingle().method.returnEarly(true)
    }
}

val validateVideoPatch = bytecodePatch {
    execute {
        ValidateVideoFingerprint.matchSingle().method.returnEarly(true)
    }
}