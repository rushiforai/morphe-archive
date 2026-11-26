package app.pyflat.patches.kicker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.pyflat.util.injectEnumReturnByString

internal object GetPlusAboStateFingerprint : Fingerprint(
    definingClass = "KUserImpl;",
    returnType = "KPlusAboState;",
)

@Suppress("unused")
val unlockPlusPatch = patch(
    name = "Unlock Plus",
    description = "Unlocks the Plus subscription.",
) {
    compatibleWith(COMPATIBILITY_KICKER)
    execute {
        injectEnumReturnByString(GetPlusAboStateFingerprint.method, "PLUS")
    }
}