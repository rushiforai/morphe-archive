package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BOTTOM_NAV_SCREEN_CLASS = "Lcom/reddit/launch/bottomnav/BottomNavScreen;"

private data class StripHit(
    val method: MutableMethod,
    val index: Int,
    val vC: Int,
    val stripRef: MethodReference,
    val coloursType: String,
)

private fun isBackgroundCall(inst: Instruction): Boolean {
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    val params = ref?.parameterTypes?.map { it.toString() }
    return (inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
        params != null && params.size == 3 && params[0].startsWith("L") &&
        params[1] == "J" && params[2].startsWith("L") && ref.returnType == params[0]
}

private fun colorsFieldAt(
    method: MutableMethod,
    i: Int,
    themeRefs: ThemeRefs,
): FieldReference? {
    val prevInst = method.instructions[i - 1]
    val fieldRef = (prevInst as? ReferenceInstruction)?.reference as? FieldReference
    return if (prevInst.opcode == Opcode.IGET_OBJECT && fieldRef?.toSmali() == themeRefs.colorsFieldRef) {
        fieldRef
    } else {
        null
    }
}

private fun stripGetterAt(
    method: MutableMethod,
    i: Int,
    coloursType: String,
    themeRefs: ThemeRefs,
): MethodReference? {
    val instructions = method.instructions
    val currInst = instructions[i]
    val nextInst = instructions[i + 1]
    val methodRef = (currInst as? ReferenceInstruction)?.reference as? MethodReference
    val matches = currInst.opcode == Opcode.INVOKE_VIRTUAL &&
        nextInst.opcode == Opcode.MOVE_RESULT_WIDE &&
        methodRef != null &&
        methodRef.definingClass == coloursType &&
        methodRef.parameterTypes.isEmpty() &&
        methodRef.returnType == "J" &&
        methodRef.toSmali() != themeRefs.bgColorRef
    return if (matches) methodRef else null
}

private fun stripHitAt(
    method: MutableMethod,
    i: Int,
    themeRefs: ThemeRefs,
): StripHit? {
    val fieldRef = colorsFieldAt(method, i, themeRefs) ?: return null
    val coloursType = fieldRef.type
    val methodRef = stripGetterAt(method, i, coloursType, themeRefs)
    val instructions = method.instructions
    val searchEnd = minOf(instructions.size - 1, i + 5)
    val hasBackgroundCall = methodRef != null && ((i + 2)..searchEnd).any { isBackgroundCall(instructions[it]) }

    return if (methodRef != null && hasBackgroundCall) {
        val currInst = instructions[i]
        val vC = (currInst as? FiveRegisterInstruction)?.registerC
            ?: (currInst as? RegisterRangeInstruction)?.startRegister
            ?: currInst.registersUsed.firstOrNull()
                .orThrow("Could not find register in invoke-virtual at $i")
        StripHit(method, i, vC, methodRef, coloursType)
    } else {
        null
    }
}

private fun findStripHit(themeRefs: ThemeRefs): StripHit {
    val screenClass = mutableClassDefBy(BOTTOM_NAV_SCREEN_CLASS)
    val hits = screenClass.methods.filter { it.implementation != null }.flatMap { method ->
        (1 until method.instructions.size - 1).mapNotNull { stripHitAt(method, it, themeRefs) }
    }
    if (hits.size != 1) throw PatchException("Rail strip background: expected 1 match, found ${hits.size}")
    return hits.first()
}

internal fun hookBottomNavStrip(themeRefs: ThemeRefs) {
    val hit = findStripHit(themeRefs)

    val invokeSmali = if (hit.vC > 15) {
        "invoke-static/range { v${hit.vC} .. v${hit.vC} }, $EXTENSION_CLASS->pageColor(Ljava/lang/Object;)J"
    } else {
        "invoke-static { v${hit.vC} }, $EXTENSION_CLASS->pageColor(Ljava/lang/Object;)J"
    }
    hit.method.replaceInstruction(hit.index, invokeSmali)

    fillBridge(
        "feedColor",
        """
            check-cast p0, ${hit.coloursType}
            invoke-virtual { p0 }, ${themeRefs.bgColorRef}
            move-result-wide v0
            return-wide v0
        """,
    )
    fillBridge(
        "stripColor",
        """
            check-cast p0, ${hit.coloursType}
            invoke-virtual { p0 }, ${hit.stripRef.toSmali()}
            move-result-wide v0
            return-wide v0
        """,
    )
}
