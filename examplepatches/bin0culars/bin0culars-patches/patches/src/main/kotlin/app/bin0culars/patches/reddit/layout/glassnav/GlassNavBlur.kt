package app.bin0culars.patches.reddit.layout.glassnav

import app.bin0culars.patches.reddit.layout.autoscroll.MainActivityResumeFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BLUR_EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/GlassBlur;"

private data class CanvasCall(
    val ref: MethodReference,
    val isInterface: Boolean,
)

private fun isDrawContextCall(inst: Instruction, scopeType: String): MethodReference? =
    ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref ->
        (inst.opcode == Opcode.INVOKE_INTERFACE || inst.opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
            ref.definingClass == scopeType &&
            ref.parameterTypes.isEmpty() &&
            ref.returnType.startsWith("L")
    }

private fun findDrawContext(method: MutableMethod, scopeType: String): Pair<Int, MethodReference> {
    for (i in method.instructions.indices) {
        val ref = isDrawContextCall(method.instructions[i], scopeType)
        if (ref != null) return i to ref
    }
    throw PatchException("Could not find drawContextRef in LottieDrawFingerprint")
}

private fun isCanvasCall(inst: Instruction, contextType: String): CanvasCall? =
    ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
        val isInterface = inst.opcode == Opcode.INVOKE_INTERFACE || inst.opcode == Opcode.INVOKE_INTERFACE_RANGE
        val isVirtual = inst.opcode == Opcode.INVOKE_VIRTUAL || inst.opcode == Opcode.INVOKE_VIRTUAL_RANGE
        CanvasCall(ref, isInterface).takeIf {
            (isInterface || isVirtual) &&
                ref.definingClass == contextType &&
                ref.parameterTypes.isEmpty() &&
                ref.returnType.startsWith("L")
        }
    }

private fun findCanvasCall(method: MutableMethod, startIndex: Int, contextType: String): CanvasCall {
    for (i in (startIndex + 1) until method.instructions.size) {
        val call = isCanvasCall(method.instructions[i], contextType)
        if (call != null) return call
    }
    throw PatchException("Could not find canvasRef in LottieDrawFingerprint")
}

private fun findNativeField(method: MutableMethod): FieldReference {
    for (inst in method.instructions) {
        if (inst.opcode == Opcode.IGET_OBJECT) {
            val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
            if (ref != null && ref.type == "Landroid/graphics/Canvas;") {
                return ref
            }
        }
    }
    throw PatchException("Could not find nativeField in LottieDrawFingerprint")
}

private fun fillCanvasBridges(
    scopeType: String,
    drawContextRef: MethodReference,
    canvasCall: CanvasCall,
    nativeField: FieldReference,
    drawWithContentRef: MethodReference,
) {
    val canvasInvokeOp = if (canvasCall.isInterface) "invoke-interface" else "invoke-virtual"
    fillBridge(
        "composeCanvas",
        """
            check-cast p0, $scopeType
            invoke-interface { p0 }, ${drawContextRef.toSmali()}
            move-result-object p0
            $canvasInvokeOp { p0 }, ${canvasCall.ref.toSmali()}
            move-result-object p0
            return-object p0
        """,
        extensionClass = BLUR_EXTENSION_CLASS,
    )
    fillBridge(
        "nativeCanvas",
        """
            check-cast p0, ${nativeField.definingClass}
            iget-object p0, p0, ${nativeField.toSmali()}
            return-object p0
        """,
        extensionClass = BLUR_EXTENSION_CLASS,
    )
    fillBridge(
        "setNativeCanvas",
        """
            check-cast p0, ${nativeField.definingClass}
            iput-object p1, p0, ${nativeField.toSmali()}
            return-void
        """,
        extensionClass = BLUR_EXTENSION_CLASS,
    )
    fillBridge(
        "drawWithContent",
        """
            check-cast p0, ${drawWithContentRef.parameterTypes[0]}
            invoke-static { p0, p1 }, ${drawWithContentRef.toSmali()}
            move-result-object p0
            return-object p0
        """,
        extensionClass = BLUR_EXTENSION_CLASS,
    )
}

private fun isMaterializeCall(inst: Instruction): MethodReference? =
    ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
        inst.opcode == Opcode.INVOKE_STATIC && it.definingClass == "Landroidx/compose/ui/b;" && it.name == "c"
    }

private fun hookNavContentBox() {
    val method = NavContentBoxFingerprint.method
    var callIndex = -1
    var cRef: MethodReference? = null
    for (i in method.instructions.indices) {
        val ref = isMaterializeCall(method.instructions[i]) ?: continue
        if (cRef != null) {
            throw PatchException("Multiple calls to Landroidx/compose/ui/b;->c found")
        }
        callIndex = i
        cRef = ref
    }
    val materializeRef = cRef.orThrow("Could not find call to Landroidx/compose/ui/b;->c")
    val moveResultInst = method.instructions.getOrNull(callIndex + 1)
        .orThrow("Missing instruction after materialize call")
    if (moveResultInst.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Expected MOVE_RESULT_OBJECT after materialize call, found ${moveResultInst.opcode}")
    }
    val vM = (moveResultInst as? OneRegisterInstruction)?.registerA
        .orThrow("Could not get register from MOVE_RESULT_OBJECT")

    val invokeSmali = if (vM > 15) {
        "invoke-static/range { v$vM .. v$vM }, $BLUR_EXTENSION_CLASS->contentModifier(Ljava/lang/Object;)Ljava/lang/Object;"
    } else {
        "invoke-static { v$vM }, $BLUR_EXTENSION_CLASS->contentModifier(Ljava/lang/Object;)Ljava/lang/Object;"
    }
    val hookSmali = """
        $invokeSmali
        move-result-object v$vM
        check-cast v$vM, ${materializeRef.returnType}
    """.trimIndent()
    method.addInstructions(callIndex + 2, hookSmali)
}

private fun hookMainActivity() {
    MainActivityResumeFingerprint.method.addInstructions(
        0,
        "invoke-static { p0 }, $BLUR_EXTENSION_CLASS->onActivityResumed(Landroid/app/Activity;)V",
    )
}

internal fun hookGlassBlur(drawWithContentRef: MethodReference) {
    val method = LottieDrawFingerprint.method
    val scopeType = method.parameterTypes.firstOrNull()?.toString()
        .orThrow("Missing scopeType in LottieDrawFingerprint")
    val (drawContextIdx, drawContextRef) = findDrawContext(method, scopeType)
    val canvasCall = findCanvasCall(method, drawContextIdx, drawContextRef.returnType)
    val nativeField = findNativeField(method)

    fillCanvasBridges(scopeType, drawContextRef, canvasCall, nativeField, drawWithContentRef)
    hookNavContentBox()
    hookMainActivity()
}
