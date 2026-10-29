package app.smartlife.patches.smartlife.misc.fix.signature

import app.morphe.patcher.Fingerprint

/**
 * The app's Application subclass that extends android.app.Application directly
 * (com.smart.app.c). It is the only class in the app whose superclass is Application,
 * so matching on that superclass uniquely identifies it. Its superclass is swapped to the
 * SignatureSpoof extension, whose static initializer then spoofs the signature before the
 * com.thingclips.smart.security.watchdog check runs.
 */
internal object SmartApplicationFingerprint : Fingerprint(
    superclass = "Landroid/app/Application;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)
