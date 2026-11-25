package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private fun registerWidth(type: CharSequence): Int = when (type.toString()) {
    "J", "D" -> 2
    else -> 1
}

private fun mutableMethod(method: MutableMethod) = method

/**
 * Prepends a static runtime call to [this] method without going through the inline smali
 * compiler, so the injection works even on obfuscated call sites the compiler rejects.
 *
 * [firstParam] is a parameter index (0 = p0), and the call is emitted as a range invoke so
 * high register numbers stay valid. Set [includeReceiver] to start the window at `this`
 * (instance methods only), which is what hooks wanting the view plus its argument need.
 */
internal fun MutableMethod.injectStaticCall(
    hookOwner: String,
    hookName: String,
    hookParameterTypes: List<String>,
    hookReturnType: String = "V",
    firstParam: Int = 0,
    paramCount: Int = 1,
    atIndex: Int = 0,
    includeReceiver: Boolean = false
) {
    val target = mutableMethod(this)
    val implementation = target.implementation
        ?: error("Cannot hook ${target.name}: method has no implementation.")

    val isStatic = (target.accessFlags and AccessFlags.STATIC.value) != 0
    require(!includeReceiver || !isStatic) {
        "${target.name} is static and has no receiver register."
    }
    val declaredWidth = target.parameterTypes.sumOf { registerWidth(it) }
    // Dex layout is [locals][this][p0..pN], so p0 sits at registerCount - declaredWidth for
    // both static and instance methods, and `this` one register below it.
    val firstParameterRegister = implementation.registerCount - declaredWidth -
        if (includeReceiver) 1 else 0
    val start = firstParameterRegister + firstParam

    require(firstParam >= 0) { "Parameter index must not be negative." }
    require(start >= 0 && start + paramCount <= implementation.registerCount) {
        "Cannot pass p$firstParam..${firstParam + paramCount - 1} of ${target.name}: only " +
            "${implementation.registerCount} registers available."
    }

    implementation.addInstruction(
        atIndex,
        BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE,
            start,
            paramCount,
            ImmutableMethodReference(
                hookOwner,
                hookName,
                hookParameterTypes,
                hookReturnType
            )
        )
    )
}

/** Injects a single-argument static call with the argument taken from [targetType]. */
internal fun MutableMethod.injectStaticCallOnParamType(
    hookOwner: String,
    hookName: String,
    hookParameterTypes: List<String>,
    targetType: String,
    atIndex: Int = 0
) {
    val parameterIndex = parameterTypes.indexOfFirst { it == targetType }
    require(parameterIndex >= 0) { "${name} has no $targetType parameter." }
    injectStaticCall(
        hookOwner = hookOwner,
        hookName = hookName,
        hookParameterTypes = hookParameterTypes,
        firstParam = parameterIndex,
        paramCount = 1,
        atIndex = atIndex
    )
}
