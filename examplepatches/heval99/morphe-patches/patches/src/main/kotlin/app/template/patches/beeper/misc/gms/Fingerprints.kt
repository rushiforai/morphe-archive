package app.template.patches.beeper.misc.gms

import app.morphe.patcher.Fingerprint

// The launcher activity is declared by name in the manifest, so R8 cannot rename it. Its
// onCreate(Bundle) is where the shared GmsCore builder installs the MicroG RE check.
internal object MainActivityOnCreateFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/beeper/chat/booper/MainActivity;" &&
            method.name == "onCreate" &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") &&
            method.implementation != null
    },
)

/** SHA-1 of the Play app-signing certificate (apksigner, 2026-11-13). */
internal const val BEEPER_SIGNATURE_SHA1 = "d6ef1da902f51ff60deb84e4bf80ef71cc00c090"

/** The manifest-declared launcher activity. */
internal const val BEEPER_MAIN_ACTIVITY = "Lcom/beeper/chat/booper/MainActivity;"
