package app.stickwar.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.BuilderTryBlock
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import java.lang.reflect.Field
import java.lang.reflect.ParameterizedType

private val tryBlocksField: Field? = run {
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { f ->
            if (!MutableList::class.java.isAssignableFrom(f.type) &&
                !List::class.java.isAssignableFrom(f.type)
            ) {
                return@firstOrNull false
            }
            val generic = f.genericType as? ParameterizedType ?: return@firstOrNull false
            val arg = generic.actualTypeArguments.firstOrNull() ?: return@firstOrNull false
            arg.typeName == BuilderTryBlock::class.java.name ||
                arg.typeName.startsWith("${BuilderTryBlock::class.java.name}<")
        }
        ?.apply { isAccessible = true }
}

fun MutableMethod.wipeBodyAndReturnEarly() {
    val impl = implementation ?: return
    val field = tryBlocksField
        ?: throw PatchException(
            "MutableMethodImplementation has no List<BuilderTryBlock> field. dexlib2 layout changed?",
        )
    @Suppress("UNCHECKED_CAST")
    (field.get(impl) as MutableList<BuilderTryBlock>).clear()
    val count = impl.instructions.toList().size
    repeat(count) { impl.removeInstruction(0) }
    addInstructions(0, "return-void")
}
