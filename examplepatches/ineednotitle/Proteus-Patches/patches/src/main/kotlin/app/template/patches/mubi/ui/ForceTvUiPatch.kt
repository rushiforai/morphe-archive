package app.template.patches.mubi.ui

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Force MUBI's leanback UI on devices that misreport their form factor.
//
// MUBI ships both UIs in one package:
//   com.mubi.ui.MainActivity     — touch UI
//   com.mubi.ui.TvMainActivity   — leanback UI
//
// Cheap Android TV boxes, some Fire TV configurations and TV launchers that
// forward an app's intent can leave UiModeManager reporting UI_MODE_TYPE_NORMAL,
// so MUBI opens the phone layout on a television.
//
// This patch rewrites the result of
// android.app.UiModeManager.getCurrentModeType() at every call site to
// UI_MODE_TYPE_TELEVISION (2). The invoke becomes `nop`, and the move-result
// becomes `const vN, 0x2`.
//
// WARNING: this is global within the app. On a phone it forces the leanback UI,
// which is why the patch is opt-in (default = false) and named as a TV patch.
//
// Fail-safe: if MUBI detects TV via PackageManager.hasSystemFeature or a
// Build/ro.* check instead, this patch has no effect.

private const val UI_MODE_MANAGER_CLASS = "Landroid/app/UiModeManager;"
private const val UI_MODE_TYPE_TELEVISION = 2

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val mubiForceTvUiPatch = bytecodePatch(
    name = "Force TV (leanback) UI",
    description = "Makes MUBI believe the device is a television, so Android TV boxes " +
        "that misreport their form factor open the leanback UI. Do not enable on phones.",
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

                    if (reference.definingClass != UI_MODE_MANAGER_CLASS ||
                        reference.name != "getCurrentModeType" ||
                        reference.returnType != "I"
                    ) {
                        return@forEachIndexed
                    }

                    val moveResult = instructions.getOrNull(index + 1) ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT) return@forEachIndexed

                    val resultRegister = (moveResult as? OneRegisterInstruction)?.registerA
                        ?: return@forEachIndexed

                    replacements[index] = "nop"
                    replacements[index + 1] = "const v$resultRegister, 0x$UI_MODE_TYPE_TELEVISION"
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
