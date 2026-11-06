package app.navhi.patches.greatday.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Appends a method with an explicit local count and no annotations. */
internal fun MutableClass.addMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    locals: Int,
    body: String,
) {
    val implementation = ImmutableMethodImplementation(locals + parameters.size + 1, emptyList(), emptyList(), emptyList())
    val method = MutableMethod(
        ImmutableMethod(type, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returnType, AccessFlags.PUBLIC.value, emptySet(), emptySet(), implementation),
    )
    methods.add(method)
    method.addInstructions(0, body)
}

