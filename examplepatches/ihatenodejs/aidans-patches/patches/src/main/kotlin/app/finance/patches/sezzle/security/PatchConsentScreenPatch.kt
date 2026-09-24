package app.finance.patches.sezzle.security

import app.finance.patches.sezzle.auth.cleanAuthenticationPatch
import app.finance.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val MAIN_ACTIVITY = "Lcom/sezzle/sezzlemobile/MainActivity;"
private const val CONSENT_GATE = "Lapp/finance/extension/sezzle/ConsentGate;"

@Suppress("unused")
val patchConsentScreenPatch = bytecodePatch(
    name = "Patch Consent Screen",
    description = "Requires consent to a patched-app warning before opening Sezzle authentication.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)
    dependsOn(cleanAuthenticationPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val activity = mutableClassDefByOrNull(MAIN_ACTIVITY)
            ?: throw PatchException("Sezzle MainActivity not found")
        val onCreate = activity.methods.singleOrNull { method ->
            method.name == "onCreate" &&
                method.parameterTypes == listOf("Landroid/os/Bundle;") &&
                method.returnType == "V"
        } ?: throw PatchException("Sezzle MainActivity.onCreate(Bundle) not found")
        val implementation = onCreate.implementation
            ?: throw PatchException("Sezzle MainActivity.onCreate(Bundle) has no implementation")
        require(implementation.instructions.lastOrNull()?.opcode == Opcode.RETURN_VOID) {
            "Unexpected MainActivity.onCreate(Bundle) terminator"
        }

        onCreate.addInstructions(
            implementation.instructions.size - 1,
            "invoke-static {p0}, $CONSENT_GATE->maybeShow(Landroid/app/Activity;)V"
        )
    }
}
