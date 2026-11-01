package semicoloncolonel.mobilestream.patches.disney.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.disney.shared.Constants

private const val SPLASH_MODE = "Lcom/bamtechmedia/dominguez/splash/SplashMode;"

// Disney+ 26.20.0 plays a branded intro at launch. A selector decides the
// splash mode (SplashMode: LITE / VIDEO / LOTTIE / NONE) and, on a normal
// device, returns VIDEO or LOTTIE. NONE is a shipped mode the app already
// handles (it is the low-RAM path), so forcing the selector to return NONE
// skips the intro and the app proceeds to its normal startup. The bundled
// res/raw/splash_video.mp4 is an unused 0-byte placeholder; the real intro
// comes from remote config, which is why the mode selector is the lever.
//
// The selector class is R8-renamed; it is the method returning a SplashMode
// enum from a (boolean, continuation) call.
internal object SplashModeSelectorFingerprint : Fingerprint(
    returnType = "Ljava/lang/Enum;",
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes.first().toString() == "Z" &&
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                    field.definingClass == SPLASH_MODE && field.name == "NONE"
                } == true
            } == true
    },
)

@Suppress("unused")
val skipLaunchVideoPatch = bytecodePatch(
    name = "Skip launch video",
    description = "Opens the Disney+ phone app without the branded intro animation that plays " +
        "on launch.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        SplashModeSelectorFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $SPLASH_MODE->NONE:$SPLASH_MODE
                return-object v0
            """,
        )
    }
}
