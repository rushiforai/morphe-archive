package hoodles.morphe.patches.superchinese.unlock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

fun getGetUnlockFingerprint(className: String): Fingerprint {
    return Fingerprint(
        definingClass = className,
        name = "getUnlock"
    )
}

object GetVipFingerprint : Fingerprint (
    definingClass = "Lcom/superchinese/model/User;",
    name = "getVip"
)

object LessonStartCallbackCtorFingerprint : Fingerprint (
    name = "<init>",
    parameters = listOf(
        "L",
        "Lcom/superchinese/model/LessonStart;",
        "Lcom/superchinese/db/bean/LessonBean;",
        "Z",
        "Z"
    )
)

object ErrorFingerprint : Fingerprint (
    name = "error",
    filters = listOf(
        methodCall(name = "checkNotNullParameter")
    )
)