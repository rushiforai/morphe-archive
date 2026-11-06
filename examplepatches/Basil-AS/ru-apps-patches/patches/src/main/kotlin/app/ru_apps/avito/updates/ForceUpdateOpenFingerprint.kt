// Ported from xob0t/morphe-patches (GPLv3), app/avito/patches/updates/ForceUpdateOpenFingerprint.kt.
package app.ru_apps.avito.updates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

object ForceUpdateOpenFingerprint : Fingerprint(
    definingClass = "Lcom/avito/android/version_conflict/",
    returnType = "V",
    filters = listOf(
        string("open_params"),
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "startActivity",
        ),
    ),
    custom = { method, _ ->
        method.parameterTypes.singleOrNull()
            ?.toString()
            ?.startsWith("Lcom/avito/android/forceupdate/screens/forceupdateroot/") == true
    },
)
