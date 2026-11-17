package app.fluffy.patches.waypoint

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.BuilderTryBlock
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import java.lang.reflect.Field
import java.lang.reflect.ParameterizedType

// Morphe's MutableMethodImplementation exposes registerCount as a read-only val,
// and removeInstructions alone leaves stale try-block ranges behind (ART VerifyError).
// Growing registerCount also remaps p0..pN, since parameter registers are relative.

fun MutableMethod.ensureRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount >= needed) return
    val field = registerCountField
        ?: throw PatchException("MutableMethodImplementation: no int field for registerCount")
    field.setInt(impl, needed)
}

fun MutableMethod.clearBody() {
    val impl = implementation ?: return
    val field = tryBlocksField
        ?: throw PatchException("MutableMethodImplementation: no List<BuilderTryBlock> field")
    @Suppress("UNCHECKED_CAST")
    (field.get(impl) as MutableList<BuilderTryBlock>).clear()
    val n = impl.instructions.toList().size
    repeat(n) { impl.removeInstruction(0) }
}

private val registerCountField: Field? =
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { it.type == Int::class.javaPrimitiveType }
        ?.apply { isAccessible = true }

private val tryBlocksField: Field? =
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { f ->
            if (!List::class.java.isAssignableFrom(f.type)) return@firstOrNull false
            val generic = f.genericType as? ParameterizedType ?: return@firstOrNull false
            val arg = generic.actualTypeArguments.firstOrNull() ?: return@firstOrNull false
            arg.typeName == BuilderTryBlock::class.java.name ||
                arg.typeName.startsWith("${BuilderTryBlock::class.java.name}<")
        }
        ?.apply { isAccessible = true }
