package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.lang.reflect.Field

internal fun MutableMethod.returnEarlyBoolean(value: Boolean) {
    addInstructions(
        0,
        """
        const/4 v0, ${if (value) "0x1" else "0x0"}
        return v0
        """.trimIndent()
    )
}

internal fun MutableMethod.returnEarlyVoid() {
    addInstructions(0, "return-void")
}

/**
 * Grow [MutableMethodImplementation.registerCount] via reflection so injected
 * smali can use scratch locals without clobbering parameter registers (p0..).
 *
 * pN is always the last parameterCount registers; raising registerCount remaps
 * p0 to a higher v-register and keeps existing param references valid.
 */
internal fun MutableMethod.ensureRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount >= needed) return
    val field = registerCountField
        ?: throw PatchException(
            "MutableMethodImplementation: no int field for registerCount"
        )
    field.setInt(impl, needed)
}

private val registerCountField: Field? =
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { it.type == Int::class.javaPrimitiveType }
        ?.apply { isAccessible = true }

internal fun MutableClass.replaceImplementation(
    method: MutableMethod,
    registerCount: Int,
    smali: String
): MutableMethod {
    val replacement = MutableMethod(
        ImmutableMethod(
            method.definingClass,
            method.name,
            method.parameters,
            method.returnType,
            method.accessFlags,
            method.annotations,
            method.hiddenApiRestrictions,
            MutableMethodImplementation(registerCount)
        )
    ).apply {
        addInstructions(0, smali.trimIndent())
    }

    methods.remove(method)
    methods.add(replacement)
    return replacement
}
