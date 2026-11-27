package dev.brave.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object WindowSecurityCoordinatorFingerprint : Fingerprint(
    definingClass = "Lv65;",
    name = "g",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(literal(0x2000))
)

internal object TabbedIncognitoSecurityFingerprint : Fingerprint(
    definingClass = "Ljrg;",
    name = "h",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(literal(0x2000))
)

internal object IncognitoActivitySecurityFingerprint : Fingerprint(
    definingClass = "Lkl9;",
    name = "b",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(literal(0x2000))
)

internal object RecentsScreenshotHelperFingerprint : Fingerprint(
    definingClass = "Lik;",
    name = "l",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Z")
)

@Suppress("unused")
val allowIncognitoScreenshotsPatch = patch(
    name = "Allow Incognito Screenshots",
    description = "Enables taking screenshots and viewing recents thumbnails inside Incognito mode."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        // 1. Force Lik;->l(Activity, Z)V (Activity.setRecentsScreenshotEnabled) to ALWAYS pass true (0x1)
        RecentsScreenshotHelperFingerprint.method.apply {
            addInstructions(0, "const/4 p1, 0x1")
        }

        // 2. Replace Window.addFlags(0x2000) with Window.clearFlags(0x2000) in all 3 Incognito FLAG_SECURE controllers
        listOf(
            WindowSecurityCoordinatorFingerprint,
            TabbedIncognitoSecurityFingerprint,
            IncognitoActivitySecurityFingerprint
        ).forEach { fp ->
            fp.method.apply {
                val addFlagsIdx = instructions.indices.indexOfFirst { idx ->
                    val inst = instructions[idx]
                    if (inst.opcode != Opcode.INVOKE_VIRTUAL) return@indexOfFirst false
                    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@indexOfFirst false
                    ref.name == "addFlags" && ref.definingClass == "Landroid/view/Window;"
                }
                if (addFlagsIdx < 0) {
                    throw PatchException("Could not locate Window.addFlags invocation in $definingClass->$name")
                }
                val addFlagsInst = instructions[addFlagsIdx] as FiveRegisterInstruction
                replaceInstruction(
                    addFlagsIdx,
                    "invoke-virtual {v${addFlagsInst.registerC}, v${addFlagsInst.registerD}}, Landroid/view/Window;->clearFlags(I)V"
                )
            }
        }
    }
}
