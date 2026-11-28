package semicoloncolonel.mobilestream.patches.cnn.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

// CNN 26.10.1 for Android TV marks its window secure in release builds
// (MainActivity.onCreate calls Window.setFlags with FLAG_SECURE), so
// screenshots and screen recordings of the app come out black. That call is
// removed. Protected video stays protected, because Widevine draws it on a
// secure surface regardless of the window flag.

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/ctv/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Lets you take screenshots and screen recordings of the app.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        MainActivityOnCreateFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == "Landroid/view/Window;" && it.name == "setFlags"
                    }
            }
            if (index < 0) throw PatchException("Allow screenshots: the secure window flag was not found")
            removeInstruction(index)
        }
    }
}
