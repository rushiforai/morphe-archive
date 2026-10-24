package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val PREVIEW_DIAG = "Lapp/morphe/extension/maps/patches/BydNativeBatteryDiagnostics;"
private fun Instruction.pdCall() = getReference<MethodReference>()
private fun Instruction.pdField() = getReference<FieldReference>()
private fun Method.pdCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing preview diagnostic implementation: $this")
private fun pdGuard(ok: Boolean, reason: String, method: Any) {
    if (!ok) throw PatchException("Unrecognized preview diagnostic layout: $reason in $method")
}
private fun Method.pdReceiver(): Int {
    pdGuard(!AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.none { it == "J" || it == "D" },
        "instance narrow/reference parameters", this)
    return implementation!!.registerCount - parameterTypes.size - 1
}
private fun List<Instruction>.pdTarget(index: Int): Int {
    val address = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var at = 0
    return indices.singleOrNull { val matches = at == address; at += get(it).codeUnits; matches }
        ?: throw PatchException("Invalid preview diagnostic branch target")
}

/**
 * Same duplicate/prefix/remove semantics as the inspected patch-library 1.4.1
 * BytecodeUtils.addInstructionsAtControlFlowLabel (also unchanged in ref 1.8.0).
 * That non-inline helper cannot be linked here: the library is compileOnly and
 * Desktop does not provide BytecodeUtilsKt. Use only the available Patcher APIs.
 */
private fun MutableMethod.addPreviewContentAtLabel(index: Int, text: String) {
    addInstruction(index + 1, getInstruction(index))
    addInstructionsWithLabels(index + 1, text)
    removeInstruction(index)
}

internal data class PreviewDiagnosticInsert(val index: Int, val text: String)
internal data class PreviewVisibilityProbe(val method: MutableMethod, val inserts: List<PreviewDiagnosticInsert>)
internal data class PreviewBindingProbe(val method: MutableMethod, val index: Int, val helper: String,
    val register: Int, val originalText: String, val originalOpcode: Opcode)
internal class NativePreviewDiagnosticPlan internal constructor(
    val methods: List<MutableMethod>,
    private val arrivalGetters: List<MutableMethod>, private val infoGetter: MutableMethod,
    private val visibilities: List<PreviewVisibilityProbe>,
    private val bindings: List<PreviewBindingProbe>,
) {
    fun inject() {
        fun logReturns(method: MutableMethod, helper: String, type: String, opcode: Opcode) {
            val code = method.pdCode()
            code.indices.filter { code[it].opcode == opcode }.sortedDescending().forEach { index ->
                val reg = (code[index] as OneRegisterInstruction).registerA
                // Replace the exit itself so branches to a shared return execute the probe.
                method.replaceInstruction(index,
                    "invoke-static/range { v$reg .. v$reg }, $PREVIEW_DIAG->$helper($type)V")
                pdGuard(method.pdCode()[index].pdCall()?.toString() == "$PREVIEW_DIAG->$helper($type)V",
                    "label-preserving return probe", method)
                checkedNativeInsert(method, index + 1,
                    "${if (opcode == Opcode.RETURN_OBJECT) "return-object" else "return"} v$reg", listOf(opcode))
            }
        }
        arrivalGetters.forEach { logReturns(it, "onPreviewArrival", "Ljava/lang/Object;", Opcode.RETURN_OBJECT) }
        logReturns(infoGetter, "onPreviewInfo", "Ljava/lang/Object;", Opcode.RETURN_OBJECT)
        // Descending edits retain the indices proven before all native mutations.
        visibilities.forEach { probe ->
            val visibility = probe.method
            val exits = visibility.pdCode().indices.filter { visibility.pdCode()[it].opcode == Opcode.RETURN }
            val actions = probe.inserts.map { it.index to it } + exits.map { it to null }
            pdGuard(actions.map { it.first }.distinct().size == actions.size, "distinct visibility probes", visibility)
            actions.sortedByDescending { it.first }.forEach { (index, insert) ->
                if (insert != null) checkedNativeInsert(visibility, index, insert.text, listOf(Opcode.INVOKE_STATIC_RANGE))
                else {
                    val reg = (visibility.pdCode()[index] as OneRegisterInstruction).registerA
                    visibility.replaceInstruction(index,
                        "invoke-static/range { v$reg .. v$reg }, $PREVIEW_DIAG->onPreviewVisibilityResult(Z)V")
                    pdGuard(visibility.pdCode()[index].pdCall()?.name == "onPreviewVisibilityResult",
                        "visibility exit probe", visibility)
                    checkedNativeInsert(visibility, index + 1, "return v$reg", listOf(Opcode.RETURN))
                }
            }
        }
        bindings.groupBy { it.method }.forEach { (method, changes) ->
            changes.sortedByDescending { it.index }.forEach { probe ->
                val before = method.pdCode()
                val original = before[probe.index]
                pdGuard(original.opcode == probe.originalOpcode, "original content instruction", method)
                // The local adapter preserves the incoming label and duplicates the
                // original instruction. An even prefix avoids intermediate odd-size
                // replacement of an iget before a switch payload.
                method.addPreviewContentAtLabel(probe.index,
                    "invoke-static/range { v${probe.register} .. v${probe.register} }, $PREVIEW_DIAG->${probe.helper}(Ljava/lang/Object;)V\nnop")
                val after = method.pdCode()
                val kept = after[probe.index + 2]
                pdGuard(after.size == before.size + 2 && after.sumOf { it.codeUnits } == before.sumOf { it.codeUnits } + 4 &&
                    after.subList(probe.index, probe.index + 3).map { it.opcode } ==
                    listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP, original.opcode) &&
                    after[probe.index].pdCall()?.toString() == "$PREVIEW_DIAG->${probe.helper}(Ljava/lang/Object;)V" &&
                    after[probe.index].invokeRegisters() == listOf(probe.register) &&
                    (kept as OneRegisterInstruction).registerA == (original as OneRegisterInstruction).registerA &&
                    (original !is TwoRegisterInstruction || kept is TwoRegisterInstruction && kept.registerB == original.registerB) &&
                    kept.pdField()?.toString() == original.pdField()?.toString(),
                    "label-preserving content prefix/original operands", method)
                var address = 0
                after.forEach { ins ->
                    if (ins.opcode in setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD))
                        pdGuard(address % 2 == 0, "content switch/array payload alignment", method)
                    address += ins.codeUnits
                }
            }
        }
    }
}

/** Observe existing preview values and slot visibility; no getter calls or gate changes. */
internal fun BytecodePatchContext.resolveNativePreviewDiagnostics(plan: NativeBatteryPlan): NativePreviewDiagnosticPlan {
    fun dto(prefix: String) = uniqueMapsHook(Fingerprint(name = "toString", returnType = "Ljava/lang/String;",
        parameters = emptyList(), strings = listOf(prefix)), "preview diagnostic $prefix")!!.definingClass
    val arrival = dto("BatteryOnArrival(batteryLevel=")
    val info = dto("BatteryOnArrivalInfo(icon=")
    val noInfo = classDefBy(info).methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Z" && method.pdCode().size == 7 &&
            method.pdCode().count { it.opcode == Opcode.SGET_OBJECT } == 1 &&
            method.pdCode().first().opcode == Opcode.IGET_OBJECT
    } ?: throw PatchException("Missing unique preview empty-arrival predicate")
    val provider = classDefBy(plan.factory.definingClass).interfaces.single()
    // The factory already proves its model type; select the calculator through both
    // preview converter signatures, independently of all obfuscated class names.
    val calculatorMethods = mutableListOf<Method>()
    classDefForEach { cls -> cls.methods.filterTo(calculatorMethods) { method ->
        method.returnType == arrival && method.parameterTypes.size == 5 &&
            method.parameterTypes.drop(1) == listOf("I", "I", "Z", "Ljava/lang/Integer;") &&
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
            method.pdCode().any { it.pdCall()?.let { call -> call.definingClass == cls.type &&
                call.returnType == arrival && call.parameterTypes == listOf("I", "I", "I", "Z", "Ljava/lang/Integer;") } == true }
    } }
    pdGuard(calculatorMethods.size == 1, "unique summary/Wh calculator", arrival)
    val summary = calculatorMethods.single()
    val route = summary.parameterTypes.first().toString()
    val calculator = summary.definingClass
    val perLeg = classDefBy(calculator).methods.singleOrNull { method ->
        method.returnType == arrival && method.parameterTypes == listOf(route, "I", "Z", "Ljava/lang/Integer;") &&
            method.pdCode().any { it.pdCall()?.let { call -> call.definingClass == calculator &&
                call.returnType == arrival && call.parameterTypes.size == 3 && call.parameterTypes.drop(1) ==
                listOf("Z", "Ljava/lang/Integer;") } == true }
    } ?: throw PatchException("Missing unique preview per-leg calculator")
    fun producer(call: Method): MutableMethod = uniqueMapsHook(Fingerprint(returnType = arrival,
        parameters = emptyList(), custom = { method, cls ->
            method.implementation?.instructions?.any { it.pdCall()?.toString() == call.toString() } == true &&
                cls.methods.any { it.name == "<init>" && calculator in it.parameterTypes }
        }), "preview arrival producer ${call.parameterTypes}")!!
    val initialArrival = producer(summary)
    val routeArrival = producer(perLeg)
    val initialCode = initialArrival.pdCode()
    val ip = initialArrival.pdReceiver()
    val calculateAt = initialCode.indices.single { initialCode[it].pdCall()?.toString() == summary.toString() }
    val battery = initialCode.firstOrNull()?.pdField()
        ?: throw PatchException("Missing initial preview battery field")
    pdGuard(initialCode.count { it.opcode == Opcode.RETURN_OBJECT } == 2 &&
        routeArrival.pdCode().size == 13 && routeArrival.pdCode().count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
        initialCode[0].opcode == Opcode.IGET_OBJECT && battery.definingClass == initialArrival.definingClass &&
        (initialCode[0] as TwoRegisterInstruction).registerB == ip &&
        classDefBy(plan.modelField.type).fields.count { it.type == battery.type && !AccessFlags.STATIC.isSet(it.accessFlags) } == 1 &&
        initialCode[1].opcode == Opcode.IF_EQZ &&
        (initialCode[1] as OneRegisterInstruction).registerA == (initialCode[0] as TwoRegisterInstruction).registerA &&
        initialCode[2].opcode == Opcode.IGET && initialCode[2].pdField()?.definingClass == battery.type &&
        initialCode[3].opcode == Opcode.AND_INT_LIT8 && (initialCode[3] as NarrowLiteralInstruction).narrowLiteral == 2 &&
        initialCode[4].opcode == Opcode.IF_EQZ &&
        initialCode.pdTarget(1) == initialCode.pdTarget(4) &&
        initialCode[initialCode.pdTarget(1)].opcode == Opcode.SGET_OBJECT &&
        initialCode[initialCode.pdTarget(1)].pdField()?.type == arrival &&
        initialCode[calculateAt].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
        initialCode[calculateAt + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        initialCode[calculateAt + 2].opcode == Opcode.RETURN_OBJECT &&
        (initialCode[calculateAt + 1] as OneRegisterInstruction).registerA ==
            (initialCode[calculateAt + 2] as OneRegisterInstruction).registerA,
        "typed model battery/presence and original preview calculation exits", initialArrival)
    val inputs = initialCode[calculateAt].invokeRegisters()!!
    val calcOwnerAt = initialCode.indices.singleOrNull { initialCode[it].opcode == Opcode.IGET_OBJECT &&
        initialCode[it].pdField()?.let { f -> f.definingClass == initialArrival.definingClass && f.type == calculator } == true }
        ?: throw PatchException("Missing unique preview calculator field")
    val routeCast = (calcOwnerAt until calculateAt).singleOrNull { initialCode[it].opcode == Opcode.CHECK_CAST &&
        initialCode[it].getReference<TypeReference>()?.type == route }
        ?: throw PatchException("Missing unique initial preview route snapshot cast")
    val currentField = initialCode[5].pdField()
        ?: throw PatchException("Missing initial preview current field")
    val currentReads = initialCode.indices.filter { initialCode[it].opcode == Opcode.IGET_OBJECT &&
        initialCode[it].pdField()?.toString() == currentField.toString() }
    val capacityAt = initialCode.indices.singleOrNull { initialCode[it].opcode == Opcode.IGET_OBJECT &&
        initialCode[it].pdField()?.let { f -> f.definingClass == battery.type && f.type == currentField.type &&
            f.toString() != currentField.toString() } == true }
        ?: throw PatchException("Missing unique initial preview capacity field")
    val whReads = initialCode.indices.filter { initialCode[it].opcode == Opcode.IGET &&
        initialCode[it].pdField()?.definingClass == currentField.type && initialCode[it].pdField()?.type == "I" &&
        (initialCode[it] as TwoRegisterInstruction).registerA in inputs.drop(2).take(2) }
    val currentWh = whReads.singleOrNull { (initialCode[it] as TwoRegisterInstruction).registerA == inputs[2] }
        ?: throw PatchException("Missing current-Wh input to original preview calculation")
    val capacityWh = whReads.singleOrNull { (initialCode[it] as TwoRegisterInstruction).registerA == inputs[3] }
        ?: throw PatchException("Missing capacity-Wh input to original preview calculation")
    // R8 exposes this immutable supplier's stored value directly in 26.41. The
    // probe observes only existing return values; it never calls the supplier.
    val supplierRead = routeCast - 3
    pdGuard(inputs.size == 6 && (initialCode[calcOwnerAt] as TwoRegisterInstruction).registerA == inputs[0] &&
        (initialCode[routeCast] as OneRegisterInstruction).registerA == inputs[1] &&
        initialCode[routeCast - 1].opcode == Opcode.MOVE_OBJECT &&
        (initialCode[routeCast - 1] as TwoRegisterInstruction).registerA == inputs[1] &&
        initialCode[supplierRead].opcode == Opcode.IGET_OBJECT &&
        initialCode[supplierRead].pdField()?.type == "Ljava/lang/Object;" &&
        (initialCode[routeCast - 1] as TwoRegisterInstruction).registerB ==
            (initialCode[supplierRead] as TwoRegisterInstruction).registerA &&
        initialCode[supplierRead - 1].opcode == Opcode.CHECK_CAST &&
        initialCode[supplierRead - 1].getReference<TypeReference>()?.type == initialCode[supplierRead].pdField()?.definingClass &&
        currentReads.size == 2 && currentField.definingClass == battery.type &&
        initialCode[8].pdField()?.definingClass == currentField.type &&
        initialCode[9].opcode == Opcode.AND_INT_LIT8 && (initialCode[9] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        initialCode[10].opcode == Opcode.IF_EQZ && initialCode.pdTarget(10) == initialCode.pdTarget(1) &&
        initialCode[currentWh].pdField()?.toString() == initialCode[capacityWh].pdField()?.toString() &&
        currentWh > currentReads.last() && capacityWh > capacityAt &&
        initialCode[calculateAt - 2].opcode == Opcode.CONST_4 &&
        (initialCode[calculateAt - 2] as OneRegisterInstruction).registerA == inputs[4] &&
        (initialCode[calculateAt - 2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        initialCode[calculateAt - 1].opcode == Opcode.CONST_4 &&
        (initialCode[calculateAt - 1] as OneRegisterInstruction).registerA == inputs[5] &&
        (initialCode[calculateAt - 1] as NarrowLiteralInstruction).narrowLiteral == 0,
        "stored supplier snapshot/current/capacity/false/null reach original summary converter", initialArrival)
    listOf(initialArrival, routeArrival).forEach { method ->
        pdGuard(method.pdCode().filter { it.opcode == Opcode.RETURN_OBJECT }.all {
            (it as OneRegisterInstruction).registerA <= 255 } && method.implementation!!.tryBlocks.isEmpty() &&
            method.pdCode().none { it.opcode in setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD,
                Opcode.ARRAY_PAYLOAD) }, "preview arrival return registers and payload/try-free layout", method)
    }
    val arrivalApi = classDefBy(initialArrival.definingClass).interfaces.single()
    pdGuard(classDefBy(routeArrival.definingClass).interfaces == listOf(arrivalApi) &&
        classDefBy(arrivalApi).methods.any { it.parameterTypes.isEmpty() && it.returnType == arrival },
        "shared preview arrival API", arrivalApi)
    val infoGetter = uniqueMapsHook(Fingerprint(returnType = info, parameters = emptyList(), custom = { method, cls ->
        cls.methods.any { it.name == "<init>" && arrivalApi in it.parameterTypes && "Z" in it.parameterTypes } &&
            method.implementation?.instructions?.any { it.pdCall()?.let { call -> call.definingClass == arrivalApi &&
                call.parameterTypes.isEmpty() && call.returnType == arrival } == true } == true
    }), "mutable preview arrival-info getter")!!
    val ic = infoGetter.pdCode()
    pdGuard(ic.size == 16 && ic.count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
        infoGetter.implementation!!.tryBlocks.isEmpty() &&
        ic[1].opcode == Opcode.INVOKE_INTERFACE && ic[2].opcode == Opcode.MOVE_RESULT_OBJECT &&
        ic[4].pdCall()?.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
        ic[6].opcode == Opcode.IF_NEZ && ic.pdTarget(6) == 14 &&
        ic[7].opcode == Opcode.IPUT_OBJECT && ic[7].pdField()?.type == arrival &&
        ic[11].pdCall()?.returnType == info && ic[12].opcode == Opcode.MOVE_RESULT_OBJECT &&
        ic[13].opcode == Opcode.IPUT_OBJECT && ic[13].pdField()?.type == info &&
        ic[14].opcode == Opcode.IGET_OBJECT && ic[14].pdField()?.toString() == ic[13].pdField()?.toString() &&
        ic[15].opcode == Opcode.RETURN_OBJECT && (ic[15] as OneRegisterInstruction).registerA <= 255,
        "mutable info equality/cache/return flow", infoGetter)
    val viewApi = classDefBy(infoGetter.definingClass).interfaces.single()
    val sharedVisibilityOpcodes = listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
        Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN)
    fun sharedVisibilityFlow(method: Method): Boolean {
        if (method.implementation == null || AccessFlags.STATIC.isSet(method.accessFlags)) return false
        val code = method.pdCode()
        if (code.map { it.opcode } != sharedVisibilityOpcodes || method.implementation!!.tryBlocks.isNotEmpty()) return false
        val owner = method.pdReceiver()
        val infoReg = (code[6] as OneRegisterInstruction).registerA
        return listOf(2, 9, 17).all { code.pdTarget(it) == 20 } &&
            (code[18] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            (code[20] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            code[0].invokeRegisters() == listOf(owner) && code[0].pdCall()?.definingClass == method.definingClass &&
            code[0].pdCall()?.returnType == "Z" && code[0].pdCall()?.parameterTypes?.isEmpty() == true &&
            (code[2] as OneRegisterInstruction).registerA == (code[1] as OneRegisterInstruction).registerA &&
            code[3].invokeRegisters() == listOf(owner) && code[3].pdCall()?.returnType == viewApi &&
            code[3].pdCall()?.parameterTypes?.isEmpty() == true &&
            code[5].pdCall()?.definingClass == viewApi && code[5].pdCall()?.returnType == info &&
            code[5].pdCall()?.parameterTypes?.isEmpty() == true &&
            code[5].invokeRegisters() == listOf((code[4] as OneRegisterInstruction).registerA) &&
            code[7].pdCall()?.toString() == noInfo.toString() && code[7].invokeRegisters() == listOf(infoReg) &&
            (code[9] as OneRegisterInstruction).registerA == (code[8] as OneRegisterInstruction).registerA &&
            (code[10] as TwoRegisterInstruction).registerB == owner && code[10].pdField()?.definingClass == method.definingClass &&
            (code[11] as TwoRegisterInstruction).registerB == (code[10] as TwoRegisterInstruction).registerA &&
            code[11].pdField()?.definingClass == code[10].pdField()?.type &&
            code[12].pdCall()?.returnType == "Ljava/lang/Object;" && code[12].pdCall()?.parameterTypes?.isEmpty() == true &&
            code[12].invokeRegisters() == listOf((code[11] as TwoRegisterInstruction).registerA) &&
            code[14].getReference<TypeReference>()?.type == "Ljava/lang/Boolean;" &&
            (code[14] as OneRegisterInstruction).registerA == (code[13] as OneRegisterInstruction).registerA &&
            code[15].pdCall()?.toString() == "Ljava/lang/Boolean;->booleanValue()Z" &&
            code[15].invokeRegisters() == listOf((code[14] as OneRegisterInstruction).registerA) &&
            (code[17] as OneRegisterInstruction).registerA == (code[16] as OneRegisterInstruction).registerA &&
            (code[19] as OneRegisterInstruction).registerA == (code[18] as OneRegisterInstruction).registerA &&
            (code[21] as OneRegisterInstruction).registerA == (code[20] as OneRegisterInstruction).registerA
    }
    val visibility = uniqueMapsHook(Fingerprint(returnType = "Z", parameters = emptyList(), custom = { method, cls ->
        cls.methods.any { it.name == "<init>" && provider in it.parameterTypes && calculator in it.parameterTypes &&
            "Landroid/content/Context;" in it.parameterTypes } &&
            method.implementation?.instructions?.any { it.pdCall()?.toString() == noInfo.toString() } == true &&
            method.implementation!!.instructions.any { it.pdCall()?.returnType == viewApi } && sharedVisibilityFlow(method)
    }), "preview arrival slot visibility")!!
    val vc = visibility.pdCode()
    pdGuard(sharedVisibilityFlow(visibility) && visibility.implementation!!.tryBlocks.isEmpty() && vc.map { it.opcode } == sharedVisibilityOpcodes &&
        listOf(2, 9, 17).all { vc.pdTarget(it) == 20 } &&
        (vc[18] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        (vc[20] as NarrowLiteralInstruction).narrowLiteral == 0,
        "three gates and original true/false exits", visibility)
    val owner = visibility.pdReceiver()
    val infoReg = (vc[6] as OneRegisterInstruction).registerA
    val layoutReg = (vc[1] as OneRegisterInstruction).registerA
    val suppressionReg = (vc[16] as OneRegisterInstruction).registerA
    pdGuard(vc[0].invokeRegisters() == listOf(owner) && vc[0].pdCall()?.definingClass == visibility.definingClass &&
        vc[0].pdCall()?.returnType == "Z" && vc[0].pdCall()?.parameterTypes?.isEmpty() == true &&
        (vc[2] as OneRegisterInstruction).registerA == layoutReg &&
        vc[3].invokeRegisters() == listOf(owner) && vc[3].pdCall()?.returnType == viewApi &&
        vc[5].pdCall()?.returnType == info && vc[5].invokeRegisters() ==
        listOf((vc[4] as OneRegisterInstruction).registerA) &&
        vc[7].pdCall()?.toString() == noInfo.toString() && vc[7].invokeRegisters() == listOf(infoReg) &&
        (vc[9] as OneRegisterInstruction).registerA == (vc[8] as OneRegisterInstruction).registerA &&
        (vc[10] as TwoRegisterInstruction).registerB == owner &&
        vc[14].getReference<TypeReference>()?.type == "Ljava/lang/Boolean;" &&
        vc[15].pdCall()?.toString() == "Ljava/lang/Boolean;->booleanValue()Z" &&
        (vc[17] as OneRegisterInstruction).registerA == suppressionReg &&
        listOf(owner, infoReg, layoutReg, suppressionReg).all { it <= 255 } &&
        (vc[19] as OneRegisterInstruction).registerA == (vc[18] as OneRegisterInstruction).registerA &&
        (vc[21] as OneRegisterInstruction).registerA == (vc[20] as OneRegisterInstruction).registerA,
        "executed layout/arrival/suppression operands", visibility)
    val inserts = listOf(
        PreviewDiagnosticInsert(0, "invoke-static/range { p0 .. p0 }, $PREVIEW_DIAG->onPreviewVisibilityInput(Ljava/lang/Object;)V"),
        PreviewDiagnosticInsert(2, "invoke-static/range { v$layoutReg .. v$layoutReg }, $PREVIEW_DIAG->onPreviewLayoutRestricted(Z)V"),
        PreviewDiagnosticInsert(7, "invoke-static/range { v$infoReg .. v$infoReg }, $PREVIEW_DIAG->onPreviewInfo(Ljava/lang/Object;)V"),
        PreviewDiagnosticInsert(17, "invoke-static/range { v$suppressionReg .. v$suppressionReg }, $PREVIEW_DIAG->onPreviewSuppression(Z)V"),
    )
    val simpleVisibilityOpcodes = listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_INTERFACE,
        Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ,
        Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN)
    fun simpleVisibilityFlow(method: Method): Boolean {
        if (method.implementation == null || AccessFlags.STATIC.isSet(method.accessFlags)) return false
        val code = method.pdCode()
        if (code.map { it.opcode } != simpleVisibilityOpcodes || method.implementation!!.tryBlocks.isNotEmpty()) return false
        val owner = method.pdReceiver()
        val viewReg = (code[1] as OneRegisterInstruction).registerA
        val infoReg = (code[3] as OneRegisterInstruction).registerA
        return code[0].invokeRegisters() == listOf(owner) && code[0].pdCall()?.definingClass == method.definingClass &&
            code[0].pdCall()?.returnType == viewApi && code[0].pdCall()?.parameterTypes?.isEmpty() == true &&
            code[2].pdCall()?.definingClass == viewApi && code[2].pdCall()?.returnType == info &&
            code[2].pdCall()?.parameterTypes?.isEmpty() == true && code[2].invokeRegisters() == listOf(viewReg) &&
            code[4].pdCall()?.toString() == noInfo.toString() && code[4].invokeRegisters() == listOf(infoReg) &&
            (code[6] as OneRegisterInstruction).registerA == (code[5] as OneRegisterInstruction).registerA &&
            code.pdTarget(6) == 9 && (code[7] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            (code[9] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            (code[8] as OneRegisterInstruction).registerA == (code[7] as OneRegisterInstruction).registerA &&
            (code[10] as OneRegisterInstruction).registerA == (code[9] as OneRegisterInstruction).registerA &&
            listOf(owner, viewReg, infoReg, (code[8] as OneRegisterInstruction).registerA,
                (code[10] as OneRegisterInstruction).registerA).all { it <= 255 }
    }
    val simpleVisibility = uniqueMapsHook(Fingerprint(returnType = "Z", parameters = emptyList(), custom = { method, cls ->
        cls.methods.any { it.name == "<init>" && provider in it.parameterTypes && calculator in it.parameterTypes &&
            "Landroid/content/Context;" in it.parameterTypes } && simpleVisibilityFlow(method)
    }), "alternate arrival-only slot visibility")!!
    pdGuard(simpleVisibilityFlow(simpleVisibility), "arrival-only predicate and both original exits", simpleVisibility)
    val simpleInfo = (simpleVisibility.pdCode()[3] as OneRegisterInstruction).registerA
    val simpleInserts = listOf(
        PreviewDiagnosticInsert(0, "invoke-static/range { p0 .. p0 }, $PREVIEW_DIAG->onPreviewVisibilityInput(Ljava/lang/Object;)V"),
        PreviewDiagnosticInsert(4, "invoke-static/range { v$simpleInfo .. v$simpleInfo }, $PREVIEW_DIAG->onPreviewInfo(Ljava/lang/Object;)V"),
    )
    val fuelType = dto("FuelEfficiencyLayoutBlock(position=")
    val fuelText = classDefBy(fuelType).fields.singleOrNull { it.type == "Ljava/lang/String;" }
        ?: throw PatchException("Missing unique fuel-efficiency text field")
    val fuelBinding = uniqueMapsHook(Fingerprint(returnType = "Ljava/lang/Object;", parameters = listOf("L"),
        custom = { method, _ -> method.implementation?.instructions?.any {
            it.opcode == Opcode.IGET_OBJECT && it.pdField()?.toString() == fuelText.toString()
        } == true }), "fuel-efficiency text UI binding")!!
    val fc = fuelBinding.pdCode()
    val fuelAt = fc.indices.single { fc[it].opcode == Opcode.IGET_OBJECT && fc[it].pdField()?.toString() == fuelText.toString() }
    val fuelReg = (fc[fuelAt] as TwoRegisterInstruction).registerA
    pdGuard(fc[fuelAt - 2].opcode == Opcode.CHECK_CAST &&
        fc[fuelAt - 2].getReference<TypeReference>()?.type == fuelType &&
        fc[fuelAt - 1].opcode == Opcode.IF_EQZ && fc.pdTarget(fuelAt - 1) == fuelAt + 2 &&
        (fc[fuelAt - 1] as OneRegisterInstruction).registerA == (fc[fuelAt] as TwoRegisterInstruction).registerB &&
        fc[fuelAt + 1].opcode == Opcode.RETURN_OBJECT &&
        (fc[fuelAt + 1] as OneRegisterInstruction).registerA == fuelReg &&
        fc[fuelAt + 2].opcode == Opcode.RETURN_OBJECT &&
        fc.any { it.opcode == Opcode.CONST_STRING && it.getReference<StringReference>()?.string == "" &&
            (it as OneRegisterInstruction).registerA == (fc[fuelAt + 2] as OneRegisterInstruction).registerA },
        "fuel binding nullable branch and actual text exits", fuelBinding)
    val percentText = classDefBy(info).fields.singleOrNull { it.type == "Ljava/lang/CharSequence;" }
        ?: throw PatchException("Missing unique arrival percent text field")
    val batteryBinding = uniqueMapsHook(Fingerprint(returnType = "Ljava/lang/Object;", parameters = listOf("L"),
        custom = { method, _ -> method.implementation?.instructions?.any {
            it.opcode == Opcode.IGET_OBJECT && it.pdField()?.toString() == percentText.toString()
        } == true && method.implementation!!.instructions.any { it.pdCall()?.let { call ->
            call.definingClass == viewApi && call.returnType == info && call.parameterTypes.isEmpty()
        } == true } }), "arrival percent UI text binding")!!
    val bc = batteryBinding.pdCode()
    val batteryAt = bc.indices.single { bc[it].opcode == Opcode.IGET_OBJECT && bc[it].pdField()?.toString() == percentText.toString() }
    val batteryRead = bc[batteryAt] as TwoRegisterInstruction
    pdGuard(bc[batteryAt - 2].opcode == Opcode.INVOKE_INTERFACE &&
        bc[batteryAt - 2].pdCall()?.definingClass == viewApi && bc[batteryAt - 2].pdCall()?.returnType == info &&
        bc[batteryAt - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        (bc[batteryAt - 1] as OneRegisterInstruction).registerA == batteryRead.registerB &&
        bc[batteryAt + 1].opcode == Opcode.IF_NEZ && bc.pdTarget(batteryAt + 1) == batteryAt + 3 &&
        (bc[batteryAt + 1] as OneRegisterInstruction).registerA == batteryRead.registerA &&
        bc[batteryAt + 2].opcode == Opcode.CONST_STRING &&
        bc[batteryAt + 2].getReference<StringReference>()?.string == "" &&
        bc[batteryAt + 3].opcode == Opcode.RETURN_OBJECT &&
        (bc[batteryAt + 3] as OneRegisterInstruction).registerA == batteryRead.registerA,
        "existing info getter, percent read and empty fallback", batteryBinding)
    val bindings = listOf(
        PreviewBindingProbe(fuelBinding, fuelAt + 1, "onFuelText", fuelReg, "return-object v$fuelReg", Opcode.RETURN_OBJECT),
        PreviewBindingProbe(fuelBinding, fuelAt + 2, "onFuelText", (fc[fuelAt + 2] as OneRegisterInstruction).registerA,
            "return-object v${(fc[fuelAt + 2] as OneRegisterInstruction).registerA}", Opcode.RETURN_OBJECT),
        PreviewBindingProbe(batteryBinding, batteryAt, "onBatteryTextInfo", batteryRead.registerB,
            "iget-object v${batteryRead.registerA}, v${batteryRead.registerB}, $percentText", Opcode.IGET_OBJECT),
    )
    pdGuard(bindings.all { it.register <= 255 } && batteryRead.registerA <= 15 && batteryRead.registerB <= 15,
        "content probe invoke/read register bounds", batteryBinding)
    return NativePreviewDiagnosticPlan(listOf(initialArrival, routeArrival, infoGetter, visibility, simpleVisibility, fuelBinding, batteryBinding),
        listOf(initialArrival, routeArrival), infoGetter,
        listOf(PreviewVisibilityProbe(visibility, inserts), PreviewVisibilityProbe(simpleVisibility, simpleInserts)), bindings)
}
