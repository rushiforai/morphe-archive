package app.template.patches.sofascore.misc.developer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The dialog class keeps its name (it is referenced from the About screen by name); the handler
// that opens it is R8-renamed, so the class is the anchor and the handler is found by shape.
private const val DIALOG = "Lcom/sofascore/results/settings/developer/DeveloperOptionsFullScreenDialog;"
private const val SET = "Ljava/util/Set;"

/**
 * Sofascore's About screen hides a developer menu behind a password: the typed value is MD5'd and
 * looked up in a two-entry `Set<String>` of hard-coded hashes; only a match opens
 * [DIALOG]. The handler is one branch of a large obfuscated click switch.
 *
 * The patch finds the handler by shape (the method that instantiates the developer dialog and calls
 * `Set.contains` right before it) and pins the `contains` result to true, so the menu opens whatever
 * is typed. The hashes and the dialog are untouched.
 *
 * Opt-in and off by default: the switches inside write the app's own `DEV_MODE_*` preferences and
 * several of them work against this bundle (ADS_TEST_MODE and FORCE_MAIN_INTERSTITIAL re-enable ad
 * paths, FORCE_TELEMETRY undoes Disable telemetry). Nothing here changes the account or the server
 * state; the menu only becomes reachable.
 */
@Suppress("unused")
val unlockDeveloperOptionsPatch = bytecodePatch(
    name = "Unlock developer options",
    description = "Opens the hidden developer menu without the password.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        val candidates = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val insns = method.implementation?.instructions?.toList() ?: return@forEach
                if (insns.none { it.isNewInstanceOfDialog() }) return@forEach
                if (insns.none { it.isSetContains() }) return@forEach
                // Since 26.11.03 a Compose lambda also opens the dialog behind an unrelated
                // Set.contains; the password gate hashes the typed value (String.getBytes) right
                // before its contains call.
                val dialog = insns.indexOfFirst { it.isNewInstanceOfDialog() }
                val contains = (0 until dialog).lastOrNull { insns[it].isSetContains() } ?: return@forEach
                if ((maxOf(0, contains - 8) until contains).none { insns[it].isStringGetBytes() }) return@forEach
                candidates += classDef to method
            }
        }
        val (classDef, method) = candidates.singleOrNull() ?: throw PatchException(
            "expected one method that opens $DIALOG and calls Set.contains, found ${candidates.size}: " +
                candidates.joinToString { (cls, m) -> "${cls.type}->${m.name}" },
        )

        val mutable = mutableClassDefBy(classDef).methods.single {
            it.name == method.name && it.returnType == method.returnType &&
                it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
        }
        val insns = mutable.instructions.toList()
        val dialog = insns.indexOfFirst { it.isNewInstanceOfDialog() }
        val contains = (0 until dialog).lastOrNull { insns[it].isSetContains() }
            ?: throw PatchException("${classDef.type}->${method.name}: no Set.contains before the dialog")
        val move = insns.getOrNull(contains + 1)
        if (move?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("${classDef.type}->${method.name}: Set.contains is not followed by move-result")
        }
        val result = (move as OneRegisterInstruction).registerA
        val branch = (contains + 2..minOf(contains + 4, insns.lastIndex)).firstOrNull { index ->
            (insns[index].opcode == Opcode.IF_EQZ || insns[index].opcode == Opcode.IF_NEZ) &&
                (insns[index] as OneRegisterInstruction).registerA == result
        } ?: throw PatchException(
            "${classDef.type}->${method.name}: no branch on the Set.contains result (v$result)",
        )
        if (insns[branch].opcode != Opcode.IF_EQZ) {
            throw PatchException(
                "${classDef.type}->${method.name}: the password branch is ${insns[branch].opcode}, expected if-eqz",
            )
        }

        // The branch skips the dialog when the hash is not in the set; pinning the result to true
        // always takes the dialog path.
        mutable.requireNoBranchTargetAt(branch, "developer options password gate")
        mutable.addInstructionsChecked(branch, "const/16 v$result, 0x1")
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isNewInstanceOfDialog(): Boolean =
    opcode == Opcode.NEW_INSTANCE && (this as? ReferenceInstruction)?.reference.let {
        (it as? TypeReference)?.type == DIALOG
    }

/** `invoke-virtual String.getBytes()[B`, the first step of hashing the typed password. */
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isStringGetBytes(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.definingClass == "Ljava/lang/String;" && call.name == "getBytes" && call.parameterTypes.isEmpty()
}

/** `invoke-interface Set.contains(Object)Z`. */
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isSetContains(): Boolean {
    if (opcode != Opcode.INVOKE_INTERFACE && opcode != Opcode.INVOKE_INTERFACE_RANGE) return false
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.definingClass == SET && call.name == "contains" && call.returnType == "Z"
}
