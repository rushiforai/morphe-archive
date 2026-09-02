package app.pyflat.patches.kicker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.pyflat.util.injectEnumReturnByString

internal object GetPurAboStateFingerprint : Fingerprint(
    definingClass = "KUserImpl;",
    returnType = "KPurAboState;",
)

@Suppress("unused")
val unlockPurPatch = bytecodePatch(
    name = "Unlock Pur",
    description = "Unlocks the Pur subscription.",
) {
    compatibleWith("com.netbiscuits.kicker")
    execute {
        injectEnumReturnByString(GetPurAboStateFingerprint.method, "PUR")
    }
}