package app.smartlife.patches.smartlife.misc.fix.signature

import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SignatureSpoof;"

@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature",
    description = "Keeps the original APK signature visible to the app after re-signing, so the " +
        "app's integrity self-check passes instead of showing \"integrity check failed\" and " +
        "quitting, and so email/phone + password login keeps working. Enabled by default " +
        "because the app does not start without it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    extendWith("extensions/smartlife.mpe")

    execute {
        // Insert SignatureSpoof (which extends Application) as the superclass of the app's
        // Application subclass, so its static initializer spoofs the signature very early.
        SmartApplicationFingerprint.classDef.setSuperClass(EXTENSION_CLASS)
    }
}
