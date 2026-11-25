package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal data class ScopeRefs(
    val drawRoundRectRef: String,
    val sizeRef: String,
    val drawScopeType: String,
    val styleType: String,
    val drawContentRef: String,
    val contentDrawScopeType: String,
)

private val DRAW_ROUND_RECT_PARAMS = listOf("J", "J", "J", "J")

internal fun findDrawBehind(
    method: MutableMethod,
    bottomNavIndex: Int,
): Pair<Int, MethodReference> {
    val idx = (0 until bottomNavIndex).reversed().firstOrNull { i ->
        val inst = method.instructions[i]
        inst.opcode == Opcode.INVOKE_STATIC &&
            ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                isObjectReturningCall(it, "Lkotlin/jvm/functions/Function1;")
            } == true
    }.orThrow("Could not find drawBehind instruction before bottom_nav")
    val ref = ((method.instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("Instruction at $idx is not a method reference")
    return idx to ref
}

internal fun findSurfaceCall(
    method: MutableMethod,
    bottomNavIndex: Int,
): Pair<Int, RegisterRangeInstruction> {
    val idx = ((bottomNavIndex + 1) until method.instructions.size).firstOrNull { i ->
        val inst = method.instructions[i]
        if (inst.opcode != Opcode.INVOKE_STATIC_RANGE) return@firstOrNull false
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@firstOrNull false
        ref.parameterTypes.size == 9 && ref.parameterTypes[3] == "J"
    }.orThrow("Could not find surface color instruction after bottom_nav")
    val rangeInst = (method.instructions[idx] as? RegisterRangeInstruction)
        .orThrow("Surface call at $idx is not RegisterRangeInstruction")
    return idx to rangeInst
}

internal fun findLambdaClassType(
    method: MutableMethod,
    drawBehindIndex: Int,
    targetRegister: Int,
): String {
    val idx = (0 until drawBehindIndex).reversed().firstOrNull { i ->
        val inst = method.instructions[i]
        inst.opcode == Opcode.NEW_INSTANCE && inst.registersUsed.firstOrNull() == targetRegister
    }.orThrow("Could not find NEW_INSTANCE for register v$targetRegister before $drawBehindIndex")
    val typeRef = ((method.instructions[idx] as? ReferenceInstruction)?.reference as? TypeReference)
        .orThrow("NEW_INSTANCE at $idx lacks TypeReference")
    return typeRef.type
}

private fun findInvokeMethod(lambdaType: String): Method {
    val lambdaClass = classDefBy(lambdaType)
    return lambdaClass.methods.firstOrNull { m ->
        m.name == "invoke" &&
            m.parameterTypes.singleOrNull() == "Ljava/lang/Object;" &&
            m.returnType == "Ljava/lang/Object;"
    } ?: lambdaClass.methods.firstOrNull { it.name == "invoke" }
        .orThrow("Could not find invoke method in $lambdaType")
}

private fun isDrawRoundRectMethod(method: Method, drawScopeType: String): Boolean {
    val isStatic = (method.accessFlags and AccessFlags.STATIC.value) != 0
    val isVoid = method.returnType == "V"
    val p = method.parameterTypes.map { it.toString() }
    if (!isStatic || !isVoid || p.size != 8) return false

    val matchesPrefix = p[0] == drawScopeType && p.subList(1, 5) == DRAW_ROUND_RECT_PARAMS
    val matchesSuffix = p[5].startsWith("L") && p[6] == "F" && p[7] == "I"
    return matchesPrefix && matchesSuffix
}

private fun findDrawRoundRectMethod(drawScopeType: String): Method {
    val scopeClass = classDefBy(drawScopeType)
    val matches = scopeClass.methods.filter { isDrawRoundRectMethod(it, drawScopeType) }
    if (matches.size != 1) {
        throw PatchException("Expected exactly one drawRoundRect method in $drawScopeType, found ${matches.size}")
    }
    return matches.first()
}

private fun findSizeRef(
    invokeMethod: Method,
    lambdaType: String,
): MethodReference =
    invokeMethod.instructions.firstNotNullOfOrNull { inst ->
        if (inst.opcode != Opcode.INVOKE_INTERFACE) return@firstNotNullOfOrNull null
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@firstNotNullOfOrNull null
        val isNoArg = ref.parameterTypes.isEmpty()
        val isLongReturn = ref.returnType == "J"
        if (isNoArg && isLongReturn) ref else null
    }.orThrow("Could not find sizeRef in $lambdaType")

private fun findDrawContent(
    invokeMethod: Method,
    lambdaType: String,
): Pair<MethodReference, String> =
    invokeMethod.instructions.zipWithNext().firstNotNullOfOrNull { (prevInst, inst) ->
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        val castType = ((prevInst as? ReferenceInstruction)?.reference as? TypeReference)?.type
        val castReg = prevInst.registersUsed.firstOrNull()
        val invokeReg = inst.registersUsed.firstOrNull()

        val isOpcodesMatch = inst.opcode == Opcode.INVOKE_VIRTUAL && prevInst.opcode == Opcode.CHECK_CAST
        val isMethodMatch = ref != null && ref.parameterTypes.isEmpty() && ref.returnType == "V"
        val isRegisterMatch = castReg != null && castReg == invokeReg && castType != null

        if (isOpcodesMatch && isMethodMatch && isRegisterMatch) {
            ref!! to castType!!
        } else {
            null
        }
    }.orThrow("Could not find drawContent in $lambdaType")

internal fun findScopeRefs(lambdaType: String): ScopeRefs {
    val invokeMethod = findInvokeMethod(lambdaType)
    val sizeRef = findSizeRef(invokeMethod, lambdaType)
    val drawScopeType = sizeRef.definingClass
    val drawRoundRectMethod = findDrawRoundRectMethod(drawScopeType)
    val styleType = drawRoundRectMethod.parameterTypes[5].toString()
    val (drawContentRef, contentDrawScopeType) = findDrawContent(invokeMethod, lambdaType)

    return ScopeRefs(
        drawRoundRectRef = drawRoundRectMethod.toSmali(),
        sizeRef = sizeRef.toSmali(),
        drawScopeType = drawScopeType,
        styleType = styleType,
        drawContentRef = drawContentRef.toSmali(),
        contentDrawScopeType = contentDrawScopeType,
    )
}

internal fun findBottomNavBackdrop(): Pair<MutableMethod, Int> {
    val hits = mutableListOf<Pair<MutableMethod, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lcom/reddit/launch/bottomnav/")) {
            collectBackdropHits(mutableClassDefBy(classDef), hits)
        }
    }
    if (hits.size != 1) {
        throw PatchException("Bottom nav backdrop: expected 1 match, found ${hits.size}")
    }
    return hits.single()
}
