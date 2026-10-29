package app.masajid.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.BuilderTryBlock
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.lang.reflect.Field
import java.lang.reflect.ParameterizedType

/*
 * Minimal, self-contained helpers for forcing a method body.
 *
 * clearBody() must also drop the try/catch table: leaving it pointing at removed
 * offsets makes ART throw VerifyError ("bad exception entry").
 * growRegisters() is needed when injecting a fresh scratch register into a method
 * whose original register count is 0 — the count is a private final int, so it is
 * raised via reflection (technique from morphe-patches-library / ReVanced).
 */

private val tryBlocksField: Field? = run {
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { f ->
            if (!List::class.java.isAssignableFrom(f.type)) return@firstOrNull false
            val generic = f.genericType as? ParameterizedType ?: return@firstOrNull false
            val arg = generic.actualTypeArguments.firstOrNull() ?: return@firstOrNull false
            arg.typeName == BuilderTryBlock::class.java.name ||
                arg.typeName.startsWith("${BuilderTryBlock::class.java.name}<")
        }
        ?.apply { isAccessible = true }
}

fun MutableMethod.clearBody() {
    val impl = implementation ?: return
    val field = tryBlocksField
        ?: throw PatchException("MutableMethodImplementation try-block field not found (dexlib2 changed?)")
    @Suppress("UNCHECKED_CAST")
    (field.get(impl) as MutableList<BuilderTryBlock>).clear()
    repeat(impl.instructions.toList().size) { impl.removeInstruction(0) }
}

fun MutableMethod.growRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount >= needed) return
    val field = MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { it.type == Int::class.javaPrimitiveType }
        ?.apply { isAccessible = true }
        ?: throw PatchException("MutableMethodImplementation registerCount field not found (dexlib2 changed?)")
    field.setInt(impl, needed)
}

fun MutableMethod.returnVoid() {
    clearBody()
    addInstructions(0, "return-void")
}

fun MutableMethod.returnFalse() {
    growRegisters(1)
    clearBody()
    addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

fun MutableMethod.returnTrue() {
    growRegisters(1)
    clearBody()
    addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}

/**
 * For every string literal equal to [from], rewrite it to [to].
 *
 * Used to neuter feature-detection keys without touching control flow: the Dart
 * side looks up an exact map key ("is_mocked", "isMock") or an Android op name
 * ("android:mock_location"), so renaming the literal makes the lookup miss (the
 * op name additionally throws, which the caller already catches).
 */
fun BytecodePatchContext.renameStringLiteral(from: String, to: String) {
    Fingerprint(filters = listOf(string(from))).matchAllOrNull()?.forEach { match ->
        match.instructionMatches.forEach { im ->
            val index = im.index
            val register = (match.method.getInstruction(index) as OneRegisterInstruction).registerA
            match.method.replaceInstruction(index, "const-string v$register, \"$to\"")
        }
    }
}
