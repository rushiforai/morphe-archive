package app.template.patches.spotify.shared

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.addInstructionsAtControlFlowLabel
import app.template.patches.shared.p0Register
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// Shared bytecode plumbing for the Spotify suite.
//
// Every hook below works on return values or parameter registers only, so a
// patch never needs a free register inside the app's methods: inserted code
// reuses the register that already holds the value being replaced. This keeps
// the hooks safe on methods with small register budgets.

/**
 * @return The v-register holding the parameter at [index], not counting `this`.
 * Wide (`J`/`D`) parameters occupy two registers.
 */
internal fun Method.parameterRegister(index: Int): Int {
    var register = p0Register + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    for (i in 0 until index) {
        register += when (parameterTypes[i].toString()) {
            "J", "D" -> 2
            else -> 1
        }
    }
    return register
}

/**
 * Passes every returned object through a static extension method and returns
 * its result instead.
 *
 * @param extensionMethod Full method descriptor, for example
 * `Lapp/template/extension/extension/SpotifyAdSectionFilter;->filter(Ljava/util/List;)Ljava/util/List;`.
 * When the descriptor return type differs from the method return type, the
 * result is cast back to the method return type.
 */
internal fun MutableMethod.replaceReturnedObjects(extensionMethod: String) {
    val castType = returnType.takeIf { !extensionMethod.endsWith(")$it") }
    forEachReturn(Opcode.RETURN_OBJECT) { register ->
        """
            invoke-static/range { v$register .. v$register }, $extensionMethod
            move-result-object v$register
        """ + (castType?.let { "\ncheck-cast v$register, $it" } ?: "")
    }
}

/**
 * Passes every returned object to a static extension method returning `V`.
 * The extension method may modify the object, but not replace it.
 */
internal fun MutableMethod.inspectReturnedObjects(extensionMethod: String) {
    forEachReturn(Opcode.RETURN_OBJECT) { register ->
        "invoke-static/range { v$register .. v$register }, $extensionMethod"
    }
}

/**
 * Runs [smali] just before every return of the given [opcode], with the
 * register that the return reads. Insertions run back-to-front so earlier
 * instruction indexes stay valid.
 */
private fun MutableMethod.forEachReturn(opcode: Opcode, smali: (register: Int) -> String) {
    val returnIndices = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == opcode }
        .map { (index, _) -> index }
        .reversed()
    if (returnIndices.isEmpty()) throw PatchException("No $opcode instruction found in $this")

    returnIndices.forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(index, smali(register))
    }
}
