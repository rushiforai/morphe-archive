package app.pyflat.patches.kicker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.pyflat.util.injectEnumReturnByString

internal object GetPurAboStateFingerprint : Fingerprint(
    definingClass = "KUserImpl;",
    returnType = "KPurAboState;",
)

@Suppress("unused")
val unlockPurPatch = patch(
    name = "Unlock Pur",
    description = "Unlocks the Pur subscription.",
) {
    compatibleWith(COMPATIBILITY_KICKER)
    execute {
        injectEnumReturnByString(GetPurAboStateFingerprint.method, "PUR")
    }
}