package app.pyflat.patches.kicker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.pyflat.util.injectEnumReturnByString

internal object GetPlusAboStateFingerprint : Fingerprint(
    definingClass = "KUserImpl;",
    returnType = "KPlusAboState;",
)

@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Unlocks the Plus subscription.",
) {
    compatibleWith("com.netbiscuits.kicker")
    execute {
        injectEnumReturnByString(GetPlusAboStateFingerprint.method, "PLUS")
    }
}