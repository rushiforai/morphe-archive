package anxyis.morphe.patches.pure.deprotect

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.clearBody
import anxyis.morphe.patches.pure.shared.removeInvokeAt
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Strip LicenseClientV3.onActivityCreate(Activity)V call sites.
 *
 * FACT: 70 call sites across 70 files — in onCreate the call is the FIRST
 * instruction (.locals N; invoke-static {p0}, ...onActivityCreate; then
 * super/real body). Tanryu deletes the line. We delete exactly the one
 * invoke instruction (removeInstructions, verified target before removal).
 *
 * The multi-hunk files (EffectBrowserActivity×2, MainActivity×28,
 * ExportPreviewActivity×3, AuthMethodPickerActivity×5) carry their OTHER
 * hunks in membership/auth patches — but each contains exactly ONE license
 * invoke, so this scan removes exactly 70 invokes total. Asserted.
 */
private const val V3 = "Lcom/pairip/licensecheck3/LicenseClientV3;"
private const val CALL = "onActivityCreate"

@Suppress("unused")
val licenseCallStripPatch = bytecodePatch(
    name = "No license popups",
    description = "Removes license checks from every screen so no paywall pops up.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        var removed = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/pairip/")) return@classDefForEach
            val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                val idx = impl.instructions.indexOfFirst { insn ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == V3 && it.name == CALL
                        } == true
                }
                if (idx < 0) continue
                val mutable = mutableClass.methods.singleOrNull {
                    it.name == method.name && it.parameterTypes == method.parameterTypes &&
                        it.returnType == method.returnType
                } ?: throw PatchException("Pure: cannot open ${classDef.type}->${method.name}")
                mutable.removeInvokeAt(idx, V3, CALL)
                removed++
            }
        }
        if (removed != 70) {
            throw PatchException("Pure: license-call removals = $removed, expected 70 (wrong base?)")
        }
    }
}
