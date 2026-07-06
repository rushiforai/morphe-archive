package app.morphe.patches.piko.misc.shim.methods.broadcast.locale

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.newInstance
import app.morphe.patcher.string

internal const val LOCALE_CLASS_PREFIX = "Lcom/twitter/locale/"

internal object LocaleFingerprint : Fingerprint(
    definingClass = LOCALE_CLASS_PREFIX,
    name = "<init>",
    returnType = "V",
    filters = listOf(
        newInstance(LOCALE_CLASS_PREFIX),
        string("android.intent.action.LOCALE_CHANGED")
    )
)
