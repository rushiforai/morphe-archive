package app.template.patches.fotmob.plus

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// The toolbar controller's own field. It is not R8-renamed (a readable data/state name), unlike
// the class and the method that read it.
private const val PLUS_FIELD = "shouldUseFotMobPlusLogo"

/**
 * The home toolbar swaps between two wordmark drawables: the normal FotMob logo and the FotMob+
 * one. `shouldUseFotMobPlusLogo` is fed by the account state, so with a server-side account that
 * has no Plus claim the header stays "FotMob" even when Enable FotMob+ unlocks the features.
 *
 * The patch finds the method that only reads that field (the toolbar refresher; the observer that
 * writes it is left alone) and replaces the read with `const/4 1`, so the refresher always picks
 * the Plus drawable. No resource is edited.
 */
@Suppress("unused")
val showFotMobPlusLogoPatch = bytecodePatch(
    name = "Show FotMob+ logo",
    description = "Shows the FotMob+ wordmark in the home header.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        val owners = mutableListOf<Pair<ClassDef, Method>>()
        // One collection pass, before any mutation (the patcher forbids mutating during or between
        // iterations over classes). Managers and toolbar observers are both recorded here.
        val hooks = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (method.hasPlusLogoBranch()) hooks += classDef to method
            }
            if (classDef.fields.none { it.name == PLUS_FIELD && it.type == "Z" }) return@classDefForEach
            val reader = classDef.methods.firstOrNull { it.readsOnlyPlusField() } ?: return@classDefForEach
            owners += classDef to reader
        }
        val (owner, reader) = owners.singleOrNull() ?: throw PatchException(
            "expected one $PLUS_FIELD logo refresher, found ${owners.size}: " +
                owners.joinToString { (classDef, method) -> "${classDef.type}->${method.name}" },
        )

        val mutable = mutableClassDefBy(owner).methods.single {
            it.name == reader.name && it.returnType == reader.returnType &&
                it.parameterTypes.map(CharSequence::toString) == reader.parameterTypes.map(CharSequence::toString)
        }
        val insns = mutable.instructions.toList()
        val read = insns.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN && it.fieldName() == PLUS_FIELD }
        if (read < 0) throw PatchException("${owner.type}->${mutable.name}: the $PLUS_FIELD read is gone")
        val register = (insns[read] as OneRegisterInstruction).registerA
        if (register >= 16) {
            throw PatchException("${owner.type}->${mutable.name}: the field register v$register does not fit const/4")
        }
        mutable.replaceInstruction(read, "const/4 v$register, 0x1")

        // 2. The home toolbar's own observer sets the logo from a Boolean flow through
        // Toolbar.setLogo(I) (the ternary const 0x7f0802c5 is ic_fotmob_plus_logo_app_bar, the
        // other 0x7f0802c2 is ic_fotmob_logo_app_bar). Skip the normal-logo branch so the Plus
        // drawable is always used.
        val (hookClass, hookMethod) = hooks.singleOrNull() ?: throw PatchException(
            "expected one toolbar logo observer, found ${hooks.size}: " +
                hooks.joinToString { (classDef, method) -> "${classDef.type}->${method.name}" },
        )
        try {
            val mutableHook = mutableClassDefBy(hookClass).methods.single {
                it.name == hookMethod.name && it.returnType == hookMethod.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == hookMethod.parameterTypes.map(CharSequence::toString)
            }
            val hookInsns = mutableHook.instructions.toList()
            val plus = hookInsns.indexOfFirst { it.literal() == PLUS_LOGO }
            if (plus < 1) throw PatchException("${hookClass.type}->${mutableHook.name}: the Plus logo const is gone")
            val normalBranch = hookInsns[plus - 1]
            if (normalBranch.opcode != Opcode.IF_EQZ) {
                throw PatchException(
                    "${hookClass.type}->${mutableHook.name}: the Plus logo const is not guarded by if-eqz " +
                        "(got ${normalBranch.opcode})",
                )
            }
            mutableHook.replaceInstruction(plus - 1, "nop")
        } catch (e: PatchException) {
            throw PatchException("${hookClass.type}->${hookMethod.name}: ${e.message ?: "no detail"}", e)
        }
    }
}

/** The two app-bar wordmarks (drawable ids, stable across the 241 build). */
private const val PLUS_LOGO = 0x7f0802c5L
private const val NORMAL_LOGO = 0x7f0802c2L

private fun Method.hasPlusLogoBranch(): Boolean {
    val insns = implementation?.instructions?.toList() ?: return false
    if (insns.none { it.literal() == PLUS_LOGO } || insns.none { it.literal() == NORMAL_LOGO }) return false
    return insns.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroidx/appcompat/widget/Toolbar;" && ref.name == "setLogo"
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.literal(): Long? =
    (this as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)?.narrowLiteral?.toLong()

/** True for the toolbar refresher: it reads the field but never writes it. */
private fun Method.readsOnlyPlusField(): Boolean {
    val insns = implementation?.instructions?.toList() ?: return false
    val reads = insns.any { it.opcode == Opcode.IGET_BOOLEAN && it.fieldName() == PLUS_FIELD }
    val writes = insns.any { it.opcode == Opcode.IPUT_BOOLEAN && it.fieldName() == PLUS_FIELD }
    return reads && !writes
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.fieldName(): String? =
    ((this as? ReferenceInstruction)?.reference as? FieldReference)?.name
