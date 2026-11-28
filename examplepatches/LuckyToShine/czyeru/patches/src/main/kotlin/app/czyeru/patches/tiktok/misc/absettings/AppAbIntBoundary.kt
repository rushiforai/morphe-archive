/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.czyeru.patches.tiktok.misc.absettings

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.czyeru.patches.tiktok.shared.callThroughLocals
import app.czyeru.patches.tiktok.shared.objectIn
import app.czyeru.patches.tiktok.shared.valueIn
import app.czyeru.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.WeakHashMap

private const val STRING = "Ljava/lang/String;"

internal data class MethodShape(
    val returnType: String,
    val parameters: List<String>,
    val isStatic: Boolean = false,
)

internal fun Method.shape() = MethodShape(
    returnType,
    parameterTypes.map(CharSequence::toString),
    AccessFlags.STATIC.isSet(accessFlags),
)

internal const val APP_AB_INT_METHOD = "LJFF"
internal const val APP_AB_INT_KEY_REGISTER = "p3"
internal val APP_AB_INT_PARAMETERS = listOf("I", "I", STRING, "Z")

internal val APP_AB_BOOLEAN = MethodShape("Z", listOf("I", STRING, "Z", "Z"))
internal val APP_AB_DOUBLE = MethodShape("D", listOf("D", "I", STRING, "Z"))
internal val APP_AB_FLOAT = MethodShape("F", listOf("I", STRING, "Z", "F"))
internal val APP_AB_INT = MethodShape("I", APP_AB_INT_PARAMETERS)
internal val APP_AB_LONG = MethodShape("J", listOf("I", "J", STRING, "Z"))
internal val APP_AB_STRING = MethodShape(STRING, listOf("I", STRING, STRING, "Z"))
internal val APP_AB_RAW = MethodShape("Ljava/lang/Object;", listOf(STRING, "Z"))
private val APP_AB_SHAPES = setOf(
    APP_AB_BOOLEAN, APP_AB_DOUBLE, APP_AB_FLOAT, APP_AB_INT, APP_AB_LONG, APP_AB_STRING, APP_AB_RAW,
)
private val APP_AB_TYPED_SHAPES = APP_AB_SHAPES - APP_AB_RAW

private enum class AppAbRole { MAIN, TWIN }

private fun appAbRole(classDef: ClassDef): AppAbRole? {
    if (classDef.methods.none { it.returnType == "D" && it.shape() == APP_AB_DOUBLE }) return null
    val shapes = classDef.methods.mapTo(HashSet()) { it.shape() }
    if (!APP_AB_TYPED_SHAPES.all { it in shapes }) return null
    return if (APP_AB_RAW in shapes) AppAbRole.MAIN else AppAbRole.TWIN
}

private class AppAbClasses(val main: String, val twins: List<String>)

private val resolved = WeakHashMap<BytecodePatchContext, AppAbClasses>()

private fun BytecodePatchContext.appAbClasses(): AppAbClasses = synchronized(resolved) {
    resolved.getOrPut(this) {
        val main = mutableListOf<String>()
        val twins = mutableListOf<String>()
        classDefForEach { classDef ->
            when (appAbRole(classDef)) {
                AppAbRole.MAIN -> main += classDef.type
                AppAbRole.TWIN -> twins += classDef.type
                null -> Unit
            }
        }
        if (main.size != 1) {
            throw PatchException(
                "App AB boundary: expected one class carrying all seven AB getter shapes, found ${main.size}.",
            )
        }
        AppAbClasses(main.single(), twins)
    }
}

/** The type of the main app AB class (all seven getter shapes) in the build being patched. */
internal fun BytecodePatchContext.appAbClassType(): String = appAbClasses().main

internal fun BytecodePatchContext.appAbClass(): MutableClass = mutableClassDefBy(appAbClassType())

/**
 * Every class carrying the six typed getters: the main class first, then its twins (where 47.x+
 * / 48.0.2 land nearly every gate read).
 */
internal fun BytecodePatchContext.appAbTypedClasses(): List<MutableClass> =
    appAbClasses().let { listOf(it.main) + it.twins }.map { mutableClassDefBy(it) }

internal fun MutableClass.methodsOfShape(shape: MethodShape, what: String): List<MutableMethod> {
    val matches = methods.filter { it.shape() == shape }
    if (matches.isEmpty()) {
        throw PatchException("$what: expected a ${shape.returnType}${shape.parameters} on $type, found none.")
    }
    return matches
}

private fun MutableClass.methodOfShape(shape: MethodShape, what: String): MutableMethod {
    val matches = methods.filter { it.shape() == shape }
    if (matches.size != 1) {
        throw PatchException("$what: expected one ${shape.returnType}${shape.parameters} on $type, found ${matches.size}.")
    }
    return matches.single()
}

internal fun BytecodePatchContext.hookAppAbIntBoundary(
    extensionDescriptor: String,
    extensionMethod: String,
) = hookAppAbBoundary(APP_AB_INT, APP_AB_INT_KEY_REGISTER, "I", "App AB int boundary", extensionDescriptor, extensionMethod)

private const val APP_AB_BOOLEAN_KEY_REGISTER = "p2"

/**
 * As [hookAppAbIntBoundary], for the app AB boolean getter: every value it returns first goes
 * through `extensionMethod(String key, boolean value)` (from Hushfeed).
 */
internal fun BytecodePatchContext.hookAppAbBooleanBoundary(
    extensionDescriptor: String,
    extensionMethod: String,
) = hookAppAbBoundary(APP_AB_BOOLEAN, APP_AB_BOOLEAN_KEY_REGISTER, "Z", "App AB boolean boundary", extensionDescriptor, extensionMethod)

private fun BytecodePatchContext.hookAppAbBoundary(
    shape: MethodShape,
    keyRegister: String,
    valueType: String,
    what: String,
    extensionDescriptor: String,
    extensionMethod: String,
) = appAbTypedClasses().forEach { holder ->
    holder.methodOfShape(shape, what).apply {
        val returns = implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN }
            .map { it.index }
        check(returns.isNotEmpty()) {
            "$what: $definingClass->$name has no $valueType return to hook for $extensionMethod."
        }
        returns.asReversed().forEach { returnIndex ->
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            val call = callThroughLocals(
                what,
                "invoke-static",
                "$extensionDescriptor->$extensionMethod(Ljava/lang/String;$valueType)$valueType",
                objectIn(keyRegister),
                valueIn("v$register"),
            )
            addInstructionsAtControlFlowLabel(returnIndex, "$call\nmove-result v$register")
        }
    }
}
