package app.drbushytop.patches.relay.display

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HIGH_REFRESH_RATE_CLASS = "Lapp/drbushytop/extension/relay/HighRefreshRate;"

/** `RelayApplication#onCreate()`. */
internal object RelayApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lreddit/news/RelayApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val preferHighRefreshRatePatch = bytecodePatch(
    name = "Prefer high refresh rate",
    description = "Asks for the display's highest refresh rate while Relay is scrolling or animating, " +
        "so scrolling is not held at 60 Hz on adaptive refresh rate phones. The request is dropped " +
        "once the screen is still, so static content can run at a lower rate.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)

    execute {
        RelayApplicationOnCreateFingerprint.method.apply {
            val superCall = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_SUPER &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "onCreate"
            }
            if (superCall < 0) throw PatchException("RelayApplication#onCreate does not call super.onCreate")
            addInstruction(
                superCall + 1,
                "invoke-static { p0 }, $HIGH_REFRESH_RATE_CLASS->install(Landroid/app/Application;)V",
            )
        }
    }
}
