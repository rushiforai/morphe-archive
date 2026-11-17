package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants

// Netflix takes over the screen brightness while you watch: one helper
// (obfuscated, nfS.e on 9.93.0) builds a brightness value and writes it to the
// window's WindowManager.LayoutParams.screenBrightness, then calls
// Window.setAttributes, overriding the system brightness. Making that method
// return immediately means it never writes screenBrightness, so the phone keeps
// whatever brightness you set. It is matched by the framework field write, not
// the obfuscated name, so it survives version bumps. It is the only writer of
// that field in the app.
internal object ScreenBrightnessFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "F"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.IPUT &&
                ((instruction as ReferenceInstruction).reference as? FieldReference)?.let { field ->
                    field.definingClass == "Landroid/view/WindowManager\$LayoutParams;" &&
                        field.name == "screenBrightness"
                } == true
        } == true
    },
)

@Suppress("unused")
val keepBrightnessPatch = bytecodePatch(
    name = "Keep screen brightness",
    description = "Stops Netflix from taking over your screen brightness during playback, so the " +
        "phone keeps the brightness you set.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ScreenBrightnessFingerprint.method.addInstructions(0, "return-void")
    }
}
