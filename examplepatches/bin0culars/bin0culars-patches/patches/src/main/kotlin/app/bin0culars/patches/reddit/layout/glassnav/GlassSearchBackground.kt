package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun rangeInvokeToSmali(inst: RegisterRangeInstruction, ref: MethodReference): String {
    val start = inst.startRegister
    val end = start + inst.registerCount - 1
    val op = when (inst.opcode) {
        Opcode.INVOKE_INTERFACE_RANGE -> "invoke-interface/range"
        Opcode.INVOKE_STATIC_RANGE -> "invoke-static/range"
        else -> null
    }.orThrow("Unsupported range opcode ${inst.opcode}")
    return "$op { v$start .. v$end }, ${ref.toSmali()}"
}

private fun fiveRegInvokeToSmali(inst: FiveRegisterInstruction, ref: MethodReference): String {
    val regs = inst.registersUsed.joinToString(", ") { "v$it" }
    val op = when (inst.opcode) {
        Opcode.INVOKE_INTERFACE -> "invoke-interface"
        Opcode.INVOKE_STATIC -> "invoke-static"
        else -> null
    }.orThrow("Unsupported invoke opcode ${inst.opcode}")
    return "$op { $regs }, ${ref.toSmali()}"
}

internal fun invokeToSmali(inst: Instruction, ref: MethodReference): String = when (inst) {
    is RegisterRangeInstruction -> rangeInvokeToSmali(inst, ref)
    is FiveRegisterInstruction -> fiveRegInvokeToSmali(inst, ref)
    else -> throw PatchException("Instruction ${inst.opcode} is neither FiveRegister nor RegisterRange")
}

private fun isTopBarCall(inst: Instruction, topBarClass: String, modifierType: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isStatic && it.definingClass.toString() == topBarClass }
        ?: return false
    val p = ref.parameterTypes.map { it.toString() }
    val headOk = p.size >= 4 && p[0] == modifierType && p[1] == "Lkotlin/jvm/functions/Function0;"
    return headOk && p[2] == "Landroidx/compose/runtime/internal/a;" && p[3] == "Landroidx/compose/runtime/internal/a;"
}

private fun isTopBarBackgroundCall(inst: Instruction, modifierType: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isStatic && it.returnType.toString() == modifierType }
        ?: return false
    val p = ref.parameterTypes.map { it.toString() }
    val sizeOk = p.size == 3 && p[0] == modifierType
    return sizeOk && p[1] == "J" && p[2].startsWith("L")
}

private fun isGraphicsLayerRef(ref: MethodReference, modifierType: String): Boolean {
    val p = ref.parameterTypes.map { it.toString() }
    val headerOk = ref.definingClass.toString().startsWith("Landroidx/compose/ui/graphics/") &&
        ref.returnType.toString() == modifierType &&
        p.size == 10
    val floatsOk = headerOk && p[0] == modifierType && p.subList(1, 6).all { it == "F" }
    val tailOk = floatsOk && p[6].startsWith("L") && p[7] == "Z"
    return tailOk && p[8] == "I" && p[9] == "I"
}

internal data class HomeScreenTopBarSites(
    val method: MutableMethod,
    val bgIndex: Int,
    val graphicsLayerRef: MethodReference,
)

internal fun findHomeScreenTopBarSites(topBarClass: String, modifierType: String): HomeScreenTopBarSites? {
    val method = HomeScreenTopBarFingerprint.methodOrNull ?: return null
    val instructions = method.instructions
    val topBarCallIndex = instructions.indices
        .firstOrNull { isTopBarCall(instructions[it], topBarClass, modifierType) }
    val bgIndex = topBarCallIndex?.let { end ->
        (0 until end).reversed().firstOrNull { isTopBarBackgroundCall(instructions[it], modifierType) }
    }
    val graphicsLayerRef = if (bgIndex != null && topBarCallIndex != null) {
        ((bgIndex + 1) until topBarCallIndex).firstNotNullOfOrNull { i ->
            val inst = instructions[i]
            val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
            ((inst as? ReferenceInstruction)?.reference as? MethodReference)
                ?.takeIf { isStatic && isGraphicsLayerRef(it, modifierType) }
        }
    } else {
        null
    }
    return if (bgIndex != null && graphicsLayerRef != null) {
        HomeScreenTopBarSites(method, bgIndex, graphicsLayerRef)
    } else {
        null
    }
}

private fun fillGraphicsLayerBridge(graphicsLayerRef: MethodReference) {
    fillBridge(
        "graphicsLayer",
        """
            check-cast p0, ${graphicsLayerRef.parameterTypes[0]}
            check-cast p6, ${graphicsLayerRef.parameterTypes[6]}
            invoke-static/range { p0 .. p9 }, ${graphicsLayerRef.toSmali()}
            move-result-object p0
            return-object p0
        """,
        extensionClass = SEARCH_EXTENSION_CLASS,
    )
}

private fun hookTopBarBackground(method: MutableMethod, bgIndex: Int) {
    val bgInst = method.instructions[bgIndex]
    val bgRef = (bgInst as ReferenceInstruction).reference as MethodReference
    val vC: Int
    val vC1: Int
    val origBgSmali: String
    when (bgInst) {
        is FiveRegisterInstruction -> {
            vC = bgInst.registerD
            vC1 = bgInst.registerE
            origBgSmali = "invoke-static { v${bgInst.registerC}, v$vC, v$vC1, v${bgInst.registerF} }, ${bgRef.toSmali()}"
        }

        is RegisterRangeInstruction -> {
            val vM = bgInst.startRegister
            vC = vM + 1
            vC1 = vM + 2
            origBgSmali = "invoke-static/range { v$vM .. v${vM + 3} }, ${bgRef.toSmali()}"
        }

        else -> throw PatchException("Top bar background call is neither FiveRegister nor RegisterRange")
    }

    val hookSmali = if (vC > 15 || vC1 > 15) {
        if (vC1 != vC + 1) {
            throw PatchException("Wide registers v$vC and v$vC1 are not consecutive for range invoke")
        }
        "invoke-static/range { v$vC .. v$vC1 }, $SEARCH_EXTENSION_CLASS->topBarColor(J)J"
    } else {
        "invoke-static { v$vC, v$vC1 }, $SEARCH_EXTENSION_CLASS->topBarColor(J)J"
    }

    method.replaceInstruction(bgIndex, hookSmali)
    method.addInstructions(
        bgIndex + 1,
        """
            move-result-wide v$vC
            $origBgSmali
        """.trimIndent(),
    )
}

internal fun hookHomeScreenTopBar(sites: HomeScreenTopBarSites) {
    fillGraphicsLayerBridge(sites.graphicsLayerRef)
    hookTopBarBackground(sites.method, sites.bgIndex)
}
