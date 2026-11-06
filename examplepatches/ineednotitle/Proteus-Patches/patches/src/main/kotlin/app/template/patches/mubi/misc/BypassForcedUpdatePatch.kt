package app.template.patches.mubi.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Bypass MUBI's Play Core in-app update gate.
//
// A merged com.mubi build contains
// com.google.android.play.core.common.PlayCoreDialogWrapperActivity, and the app
// queries Play Core's AppUpdateInfo before showing the blocking update dialog.
//
// Rather than gutting Play Core (which would break Play Billing and other Play
// services in the same process), this patch rewrites the *answers* the app gets
// from AppUpdateInfo at each call site:
//
//   updateAvailability()                  → 1 (UPDATE_NOT_AVAILABLE)
//   isUpdateTypeAllowed(...)              → false
//
// Both methods return primitives, so the invoke is replaced with `nop` and the
// following move-result is replaced with a constant. Control flow, registers and
// try-tables stay valid; the rest of the SDK keeps working.
//
// Caveat: running an old MUBI build can break playback when the API changes, and
// in-app update prompts exist for a reason. Opt-in (default = false).
//
// Fail-safe: if the app checks updates through a different API, nothing matches
// and the stock flow remains.

private const val APP_UPDATE_INFO_PREFIX = "Lcom/google/android/play/core/appupdate/AppUpdateInfo;"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val mubiBypassForcedUpdatePatch = bytecodePatch(
    name = "Bypass forced update",
    description = "Neutralizes Play Core's update-availability checks so MUBI does not " +
        "block startup on a newer version. Running an outdated build may break playback.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    execute {
        classDefForEach { classDef ->
            classDef.methods.forEach methodLoop@ { method ->
                val implementation = method.implementation ?: return@methodLoop
                val instructions = implementation.instructions.toList()
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed

                    if (!reference.definingClass.startsWith(APP_UPDATE_INFO_PREFIX)) {
                        return@forEachIndexed
                    }

                    val replacement = when {
                        reference.name == "isUpdateTypeAllowed" && reference.returnType == "Z" ->
                            "const v%s, 0x0"
                        reference.name == "updateAvailability" && reference.returnType == "I" ->
                            "const v%s, 0x1"
                        else -> return@forEachIndexed
                    }

                    val moveResult = instructions.getOrNull(index + 1) ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT) return@forEachIndexed

                    val resultRegister = (moveResult as? OneRegisterInstruction)?.registerA
                        ?: return@forEachIndexed

                    replacements[index] = "nop"
                    replacements[index + 1] = replacement.format(resultRegister)
                }

                if (replacements.isEmpty()) return@methodLoop

                val mutableMethod = mutableClassDefByOrNull(classDef.type)?.findMutableMethodOf(method)
                    ?: return@methodLoop
                replacements.entries
                    .sortedByDescending { it.key }
                    .forEach { (index, smali) -> mutableMethod.replaceInstruction(index, smali) }
            }
        }
    }
}
