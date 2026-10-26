package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
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

private const val DIAGNOSTIC = "Lapp/morphe/extension/maps/patches/BydNativeBatteryDiagnostics;"
private fun Instruction.diagField() = getReference<FieldReference>()
private fun Instruction.diagCall() = getReference<MethodReference>()
private fun Method.diagCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing native diagnostic implementation: $this")
private fun diagGuard(ok: Boolean, reason: String, subject: Any) {
    if (!ok) throw PatchException("Unrecognized native diagnostic layout: $reason in $subject")
}
private fun Method.diagReceiver(): Int {
    diagGuard(!AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.none { it == "J" || it == "D" },
        "instance/single-width parameters", this)
    return implementation!!.registerCount - parameterTypes.size - 1
}
private fun List<Instruction>.diagTarget(index: Int): Int {
    val address = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var cursor = 0
    return indices.singleOrNull { val hit = cursor == address; cursor += get(it).codeUnits; hit }
        ?: throw PatchException("Invalid native diagnostic branch target")
}

internal data class DiagnosticEntry(val method: MutableMethod, val index: Int, val text: String)
internal data class DiagnosticReturn(val method: MutableMethod, val helper: String, val type: String)

/** Logging calls preserve every original branch, register value and returned object. */
internal class NativeDiagnosticPlan internal constructor(
    val schema: String,
    private val entries: List<DiagnosticEntry>,
    private val returns: List<DiagnosticReturn>,
    private val display: MutableMethod,
    private val displayArrivalRegister: Int,
    private val displayReceiver: Int,
) {
    val methods: List<MutableMethod> = (entries.map { it.method } + returns.map { it.method } + display).distinct()

    fun inject() {
        returns.forEach { hook ->
            val body = hook.method.diagCode()
            val opcode = if (hook.type == "Z") Opcode.RETURN else Opcode.RETURN_OBJECT
            body.indices.filter { body[it].opcode == opcode }.sortedDescending().forEach { index ->
                val register = (body[index] as OneRegisterInstruction).registerA
                // Replace the labelled return so direct branches also execute the log.
                hook.method.replaceInstruction(index,
                    "invoke-static/range { v$register .. v$register }, $DIAGNOSTIC->${hook.helper}(${hook.type})V")
                diagGuard(hook.method.diagCode()[index].diagCall()?.toString() ==
                    "$DIAGNOSTIC->${hook.helper}(${hook.type})V", "diagnostic return assembly", hook.method)
                checkedNativeInsert(hook.method, index + 1,
                    if (opcode == Opcode.RETURN) "return v$register" else "return-object v$register", listOf(opcode))
            }
        }
        val exit = display.diagCode().lastIndex
        display.replaceInstruction(exit, "invoke-static { v$displayArrivalRegister, v$displayReceiver }, " +
            "$DIAGNOSTIC->onDisplayInfo(Ljava/lang/Object;Ljava/lang/Object;)V")
        diagGuard(display.diagCode()[exit].diagCall()?.toString() ==
            "$DIAGNOSTIC->onDisplayInfo(Ljava/lang/Object;Ljava/lang/Object;)V", "display exit assembly", display)
        checkedNativeInsert(display, exit + 1, "return-void", listOf(Opcode.RETURN_VOID))
        entries.groupBy { it.method }.forEach { (method, hooks) ->
            hooks.sortedByDescending { it.index }.forEach {
                checkedNativeInsert(method, it.index, it.text, listOf(Opcode.INVOKE_STATIC_RANGE))
            }
        }
    }
}

/** StringBuilder label -> direct field read -> matching append operand. */
private fun BytecodePatchContext.diagLabel(type: String, label: String, expectedType: String? = null): FieldReference {
    val method = classDefBy(type).methods.singleOrNull {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("Missing diagnostic label owner: $type")
    val code = method.diagCode()
    val labelIndex = code.indices.singleOrNull { code[it].getReference<StringReference>()?.string == label }
        ?: throw PatchException("Missing unique diagnostic label '$label' in $method")
    val nextLabel = (labelIndex + 1 until code.size).firstOrNull {
        code[it].getReference<StringReference>() != null
    } ?: code.size
    val read = (labelIndex + 1 until nextLabel).singleOrNull { code[it].diagField()?.definingClass == type &&
        code[it].opcode in setOf(Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.IGET_WIDE) }
        ?: throw PatchException("Missing unique diagnostic '$label' field flow in $method")
    val field = code[read].diagField()!!
    val reg = (code[read] as TwoRegisterInstruction).registerA
    val append = code.getOrNull(read + 1)
    diagGuard(append?.diagCall()?.let { it.definingClass == "Ljava/lang/StringBuilder;" && it.name == "append" } == true &&
        append?.invokeRegisters()?.getOrNull(1) == reg && (expectedType == null || field.type == expectedType),
        "label append operand '$label'", method)
    return field
}

private fun BytecodePatchContext.diagType(label: String): String {
    val matches = mutableListOf<String>()
    classDefForEach { if (label in toStringLabels(it.type)) matches.add(it.type) }
    return matches.singleOrNull() ?: throw PatchException("Expected unique native diagnostic type '$label': $matches")
}

/** Resolve all data/display boundaries before the caller mutates any Maps code. */
internal fun BytecodePatchContext.resolveNativeDiagnostics(
    plan: NativeBatteryPlan, guidanceLegs: FieldReference,
): NativeDiagnosticPlan {
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() }
    fun declaration(field: FieldReference) {
        diagGuard(classDefBy(field.definingClass).fields.count { it.name == field.name && it.type == field.type } == 1,
            "declared snapshot field", field)
    }
    fun member(ref: MethodReference): Method = classDefBy(ref.definingClass).methods.singleOrNull {
        it.name == ref.name && it.parameterTypes == ref.parameterTypes && it.returnType == ref.returnType
    } ?: throw PatchException("Missing native diagnostic method declaration: $ref")
    fun exits(method: Method, expected: Int, opcode: Opcode) {
        val code = method.diagCode()
        // R8 may merge the returns into one shared return reached by gotos (26.42).
        diagGuard((code.count { it.opcode == opcode } == expected || code.mergedExitCount(opcode) == expected) &&
            method.implementation!!.tryBlocks.isEmpty() &&
            code.none { it.opcode in setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } &&
            code.filter { it.opcode == opcode }.all { (it as OneRegisterInstruction).registerA <= 255 },
            "return count/registers and payload-free layout", method)
    }
    val arrivalType = diagType("BatteryOnArrival(batteryLevel=")
    val level = diagLabel(arrivalType, "BatteryOnArrival(batteryLevel=")
    val inaccurate = diagLabel(arrivalType, ", isBatteryInaccurate=", "Z")
    val levelWh = diagLabel(level.type, "BatteryLevel(batteryLevelWh=", "I")
    val levelCapacity = diagLabel(level.type, ", batteryCapacityWh=", "I")
    val levelDisplay = diagLabel(level.type, ", displayBatteryPercentage=", "I")
    val infoType = diagType("BatteryOnArrivalInfo(icon=")
    val infoState = diagLabel(infoType, ", state=")
    val infoText = diagLabel(infoType, ", percentText=", "Ljava/lang/CharSequence;")
    val infoInaccurate = diagLabel(infoType, ", isInaccurate=", "Z")
    val state = classDefBy(arrivalType).fields.singleOrNull { it.type == infoState.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("Missing unique arrival state field")
    val stateCode = classDefBy(infoState.type).methods.single { it.name == "<clinit>" }.diagCode()
    diagGuard(classDefBy(infoState.type).superclass == "Ljava/lang/Enum;" && stateCode.count {
        it.getReference<StringReference>()?.string == "NO_BATTERY_INFORMATION" } == 1,
        "arrival no-information enum", infoState)
    val noInfoName = stateCode.indices.single { stateCode[it].getReference<StringReference>()?.string == "NO_BATTERY_INFORMATION" }
    val enumNameRegister = (stateCode[noInfoName] as OneRegisterInstruction).registerA
    val noInfoConstructor = (noInfoName + 1 until stateCode.size).firstOrNull {
        stateCode[it].opcode == Opcode.INVOKE_DIRECT && stateCode[it].invokeRegisters()?.getOrNull(1) == enumNameRegister
    } ?: throw PatchException("Missing no-information enum constructor flow")
    val enumInstance = stateCode[noInfoConstructor].invokeRegisters()!!.first()
    val noInfo = (noInfoConstructor + 1 until stateCode.size).firstOrNull {
        stateCode[it].opcode == Opcode.SPUT_OBJECT && (stateCode[it] as OneRegisterInstruction).registerA == enumInstance
    }?.let { stateCode[it].diagField() } ?: throw PatchException("Missing no-information enum store")

    val legConverter = uniqueMapsHook(Fingerprint(returnType = arrivalType, parameters = listOf("L", "I", "Z", "Ljava/lang/Integer;"),
        strings = listOf("Invalid number for destinationIndex: %d, needs to be [0, %d).")), "arrival leg conversion")!!
    val lc = legConverter.diagCode()
    val routeType = legConverter.parameterTypes[0].toString()
    val guidanceOwner = classDefBy(guidanceLegs.definingClass)
    val guidanceField = guidanceOwner.fields.singleOrNull {
        it.name == guidanceLegs.name && it.type == guidanceLegs.type
    } ?: throw PatchException("Missing unique guidance route snapshot field: $guidanceLegs")
    // The GUIDING listener supplies an outer route, while arrival getters operate on its snapshot.
    // Never resolve same-named getters against the wrapper: those may mutate lazy route state.
    diagGuard(guidanceLegs.type == routeType && AccessFlags.PUBLIC.isSet(guidanceOwner.accessFlags) &&
        AccessFlags.PUBLIC.isSet(guidanceField.accessFlags) && !AccessFlags.STATIC.isSet(guidanceField.accessFlags),
        "public guidance wrapper and typed snapshot field", guidanceLegs)
    val snapshotOwner = classDefBy(routeType)
    diagGuard(AccessFlags.PUBLIC.isSet(snapshotOwner.accessFlags) && AccessFlags.FINAL.isSet(snapshotOwner.accessFlags),
        "public final route snapshot type", snapshotOwner.type)
    exits(legConverter, 3, Opcode.RETURN_OBJECT)
    val legAt = lc.indices.singleOrNull { lc[it].diagCall()?.let { call ->
        call.definingClass == routeType && call.parameterTypes == listOf("I") && call.returnType.startsWith("L")
    } == true } ?: throw PatchException("Missing unique typed route leg accessor in $legConverter")
    val lcp = legConverter.diagReceiver()
    diagGuard(lc[0].opcode == Opcode.IF_EQZ && (lc[0] as OneRegisterInstruction).registerA == lcp + 1 &&
        lc[1].diagCall()?.let { it.definingClass == routeType && it.parameterTypes.isEmpty() &&
            it.returnType == "I" } == true && lc[1].invokeRegisters() == listOf(lcp + 1) &&
        lc[2].opcode == Opcode.MOVE_RESULT && lc[3].opcode == Opcode.IF_EQZ &&
        (lc[2] as OneRegisterInstruction).registerA == (lc[3] as OneRegisterInstruction).registerA &&
        lc.diagTarget(0) == lc.diagTarget(3) && lc[lc.diagTarget(0)].opcode == Opcode.SGET_OBJECT &&
        lc[legAt - 2].opcode == Opcode.IF_GE && lc[legAt - 1].opcode == Opcode.IF_LTZ &&
        (lc[legAt - 2] as TwoRegisterInstruction).registerA == lcp + 2 &&
        lc[legAt - 4].diagCall()?.toString() == lc[1].diagCall()?.toString() &&
        lc[legAt - 4].invokeRegisters() == listOf(lcp + 1) &&
        lc[legAt - 3].opcode == Opcode.MOVE_RESULT &&
        (lc[legAt - 2] as TwoRegisterInstruction).registerB == (lc[legAt - 3] as OneRegisterInstruction).registerA &&
        (lc[legAt - 1] as OneRegisterInstruction).registerA == lcp + 2 &&
        lc.diagTarget(legAt - 2) == lc.diagTarget(legAt - 1) &&
        lc[legAt].invokeRegisters() == listOf(lcp + 1, lcp + 2) &&
        lc[legAt + 1].opcode == Opcode.MOVE_RESULT_OBJECT && lc[legAt + 2].opcode == Opcode.IGET_OBJECT &&
        (lc[legAt + 1] as OneRegisterInstruction).registerA == (lc[legAt + 2] as TwoRegisterInstruction).registerB &&
        lc[legAt + 3].diagCall()?.let { it.definingClass == legConverter.definingClass &&
            it.returnType == arrivalType && it.parameterTypes == listOf(lc[legAt + 2].diagField()!!.type,
                "Z", "Ljava/lang/Integer;") } == true &&
        lc[legAt + 3].invokeRegisters() == listOf(lcp, (lc[legAt + 2] as TwoRegisterInstruction).registerA,
            lcp + 3, lcp + 4) && lc[legAt + 4].opcode == Opcode.MOVE_RESULT_OBJECT &&
        lc.exitAt(legAt + 5)?.opcode == Opcode.RETURN_OBJECT &&
        (lc[legAt + 4] as OneRegisterInstruction).registerA == (lc.exitAt(legAt + 5) as OneRegisterInstruction).registerA,
        "null/count/index guards and original typed route leg conversion", legConverter)
    val count = lc[1].diagCall()!!
    val at = lc[legAt].diagCall()!!
    val legArrival = lc[legAt + 2].diagField()!!
    diagGuard(legArrival.definingClass == at.returnType, "leg arrival owner", legArrival)
    val protoConverter = member(lc[legAt + 3].diagCall()!!)
    val pc = protoConverter.diagCode()
    diagGuard(pc.size == 25 && pc[1].opcode == Opcode.IGET && pc[2].opcode == Opcode.AND_INT_LIT8 &&
        (pc[2] as NarrowLiteralInstruction).narrowLiteral == 4 && pc[4].opcode == Opcode.AND_INT_LIT8 &&
        (pc[4] as NarrowLiteralInstruction).narrowLiteral == 16 && pc[6].opcode == Opcode.IGET &&
        pc[7].opcode == Opcode.IF_LEZ && pc[8].opcode == Opcode.AND_INT_LIT16 &&
        (pc[8] as NarrowLiteralInstruction).narrowLiteral == 512 && pc[10].opcode == Opcode.IGET &&
        pc[11].opcode == Opcode.NEG_INT && pc[13].opcode == Opcode.IGET &&
        pc[1].diagField()?.definingClass == legArrival.type && pc[6].diagField()?.definingClass == legArrival.type &&
        pc[10].diagField()?.definingClass == legArrival.type && pc[13].diagField()?.definingClass == legArrival.type,
        "per-leg masks/current/capacity/negative energy", protoConverter)
    val legMask = pc[1].diagField()!!
    val legCapacity = pc[6].diagField()!!
    val legNegative = pc[10].diagField()!!
    val legCurrent = pc[13].diagField()!!
    val protoSource = protoConverter.diagReceiver() + 1
    val protoMaskRegister = (pc[1] as TwoRegisterInstruction).registerA
    diagGuard((pc[1] as TwoRegisterInstruction).registerB == protoSource &&
        (pc[2] as TwoRegisterInstruction).registerB == protoMaskRegister &&
        (pc[4] as TwoRegisterInstruction).registerB == protoMaskRegister &&
        (pc[8] as TwoRegisterInstruction).registerB == protoMaskRegister &&
        listOf(6, 10, 13).all { (pc[it] as TwoRegisterInstruction).registerB == protoSource } &&
        (pc[7] as OneRegisterInstruction).registerA == (pc[6] as TwoRegisterInstruction).registerA &&
        (pc[11] as TwoRegisterInstruction).registerB == (pc[10] as TwoRegisterInstruction).registerA &&
        (pc[11] as TwoRegisterInstruction).registerA == (pc[13] as TwoRegisterInstruction).registerA &&
        pc[15].diagField()?.toString() == legCapacity.toString() && pc[17].diagCall()?.parameterTypes?.take(2) == listOf("I", "I") &&
        pc[17].invokeRegisters()?.take(2) == listOf((pc[13] as TwoRegisterInstruction).registerA,
            (pc[15] as TwoRegisterInstruction).registerA), "per-leg integer value/register flow", protoConverter)

    val calculationDef = classDefBy(legConverter.definingClass).methods.singleOrNull {
        it.returnType == arrivalType && it.parameterTypes == listOf(routeType, "I", "I", "Z", "Ljava/lang/Integer;")
    } ?: throw PatchException("Missing unique aggregate-energy arrival conversion")
    val calc = calculationDef.diagCode()
    val cp = calculationDef.diagReceiver()
    exits(calculationDef, 2, Opcode.RETURN_OBJECT)
    // 26.42 R8 passes the parameter registers directly (three moves) and jumps to the shared return.
    val compactCalc = calc.size == 32
    val calcAt = if (compactCalc) 27 else 29
    diagGuard((calc.size == 34 || compactCalc) && calc[0].opcode == Opcode.IF_EQZ && (calc[0] as OneRegisterInstruction).registerA == cp + 1 &&
        calc[1].diagCall()?.let { it.definingClass == routeType && it.parameterTypes.isEmpty() } == true &&
        calc[6].opcode == Opcode.IGET && calc[7].opcode == Opcode.CONST &&
        (calc[7] as NarrowLiteralInstruction).narrowLiteral == 32768 && calc[8].opcode == Opcode.AND_INT_2ADDR &&
        calc[12].opcode == Opcode.IGET_OBJECT && calc[15].opcode == Opcode.IGET &&
        calc[16].opcode == Opcode.AND_INT_LIT8 && (calc[16] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        calc[23].opcode == Opcode.IGET && calc[calcAt].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
        calc[calcAt].diagCall()?.parameterTypes == listOf("I", "I", "I", "Z", "Ljava/lang/Integer;") &&
        calc[calcAt].diagCall()?.returnType == arrivalType && calc.diagTarget(9) == calc.size - 2,
        "summary-energy conversion layout", calculationDef)
    val summary = calc[1].diagCall()!!
    val summaryMask = calc[6].diagField()!!
    val summaryEnergy = calc[12].diagField()!!
    val energyMask = calc[15].diagField()!!
    val energyWh = calc[23].diagField()!!
    diagGuard(summaryMask.definingClass == summary.returnType && summaryMask.type == "I" &&
        summaryEnergy.definingClass == summary.returnType && energyMask.definingClass == summaryEnergy.type &&
        energyWh.definingClass == summaryEnergy.type && energyWh.type == "I" &&
        calc.filter { it.diagCall()?.definingClass == routeType }.all { it.diagCall()?.toString() == summary.toString() },
        "summary energy field ownership", calculationDef)
    diagGuard(listOf(1, 4, 10, 18).all { calc[it].invokeRegisters() == listOf(cp + 1) } &&
        (calc[6] as TwoRegisterInstruction).registerB == (calc[5] as OneRegisterInstruction).registerA &&
        (calc[8] as TwoRegisterInstruction).registerA == (calc[6] as TwoRegisterInstruction).registerA &&
        (calc[8] as TwoRegisterInstruction).registerB == (calc[7] as OneRegisterInstruction).registerA &&
        (calc[12] as TwoRegisterInstruction).registerB == (calc[11] as OneRegisterInstruction).registerA &&
        (calc[15] as TwoRegisterInstruction).registerB == (calc[12] as TwoRegisterInstruction).registerA &&
        (calc[16] as TwoRegisterInstruction).registerB == (calc[15] as TwoRegisterInstruction).registerA &&
        (calc[23] as TwoRegisterInstruction).registerB == (calc[20] as TwoRegisterInstruction).registerA && if (compactCalc) {
            // Swap the index (p2) and energy into place through one scratch; receiver and p3..p5 stay unwritten.
            val saved = calc[24] as TwoRegisterInstruction
            val energy = (calc[23] as TwoRegisterInstruction).registerA
            fun written(range: IntRange, registers: IntRange) = range.any { index ->
                val output = (calc[index] as? OneRegisterInstruction)?.registerA
                calc[index].opcode.setsRegister() && output != null &&
                    (output in registers || calc[index].opcode.setsWideRegister() && output + 1 in registers)
            }
            calc[24].opcode == Opcode.MOVE && saved.registerB == cp + 2 && saved.registerA !in cp..cp + 5 &&
                saved.registerA != energy && calc[25].opcode == Opcode.MOVE &&
                (calc[25] as TwoRegisterInstruction).registerA == cp + 2 &&
                (calc[25] as TwoRegisterInstruction).registerB == energy &&
                calc[26].opcode == Opcode.MOVE && (calc[26] as TwoRegisterInstruction).registerA == cp + 1 &&
                (calc[26] as TwoRegisterInstruction).registerB == saved.registerA &&
                calc[27].invokeRegisters() == (cp..cp + 5).toList() &&
                !written(0 until 24, cp + 2..cp + 2) && !written(0 until 27, cp..cp) && !written(0 until 27, cp + 3..cp + 5) &&
                calc[28].opcode == Opcode.MOVE_RESULT_OBJECT && calc.exitAt(29)?.opcode == Opcode.RETURN_OBJECT &&
                (calc.exitAt(29) as OneRegisterInstruction).registerA == (calc[28] as OneRegisterInstruction).registerA
        } else calc[24].opcode == Opcode.MOVE_OBJECT && (calc[24] as TwoRegisterInstruction).registerB == cp &&
            calc[25].opcode == Opcode.MOVE && (calc[25] as TwoRegisterInstruction).registerB == cp + 2 &&
            calc[26].opcode == Opcode.MOVE && (calc[26] as TwoRegisterInstruction).registerB == cp + 3 &&
            calc[27].opcode == Opcode.MOVE && (calc[27] as TwoRegisterInstruction).registerB == cp + 4 &&
            calc[28].opcode == Opcode.MOVE_OBJECT && (calc[28] as TwoRegisterInstruction).registerB == cp + 5 &&
            calc[29].invokeRegisters() == listOf((calc[24] as TwoRegisterInstruction).registerA,
                (calc[25] as TwoRegisterInstruction).registerA, (calc[23] as TwoRegisterInstruction).registerA,
                (calc[26] as TwoRegisterInstruction).registerA, (calc[27] as TwoRegisterInstruction).registerA,
                (calc[28] as TwoRegisterInstruction).registerA), "summary calculation operand flow", calculationDef)

    val producer = uniqueMapsHook(Fingerprint(returnType = arrivalType, parameters = listOf(routeType, "I", plan.modelField.type),
        custom = { method, _ -> method.implementation?.instructions?.count {
            it.diagCall()?.toString() == legConverter.toString() } == 2 }), "guidance arrival producer")!!
    val produce = producer.diagCode()
    exits(producer, 4, Opcode.RETURN_OBJECT)
    val fallbackAt = produce.indices.singleOrNull { produce[it].opcode == Opcode.INVOKE_DIRECT &&
        produce[it].diagCall()?.let { it.definingClass == producer.definingClass && it.returnType == arrivalType &&
            it.parameterTypes == listOf(routeType, plan.modelField.type, arrivalType) } == true }
        ?: throw PatchException("Missing unique guidance model fallback call in $producer")
    diagGuard(producer.diagReceiver() + 3 == producer.implementation!!.registerCount - 1 &&
        produce[0].opcode == Opcode.IF_NEZ && produce[3].diagCall()?.toString() == count.toString() &&
        produce[5].opcode == Opcode.ADD_INT_LIT8 && (produce[5] as NarrowLiteralInstruction).narrowLiteral == -1 &&
        produce.diagTarget(0) == 3 &&
        produce[fallbackAt].invokeRegisters()?.take(3) == (producer.diagReceiver()..producer.diagReceiver() + 1).toList() +
            (producer.diagReceiver() + 3) &&
        produce[fallbackAt + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        produce[fallbackAt + 2].opcode == Opcode.RETURN_OBJECT &&
        (produce[fallbackAt + 1] as OneRegisterInstruction).registerA ==
            (produce[fallbackAt + 2] as OneRegisterInstruction).registerA,
        "guidance arrival/fallback typed arguments and original return", producer)
    val fallback = member(produce[fallbackAt].diagCall()!!)
    val fb = fallback.diagCode()
    val fr = fallback.diagReceiver()
    diagGuard(fb[0].opcode == Opcode.IF_EQZ && (fb[0] as OneRegisterInstruction).registerA == fr + 2 &&
        fb[1].opcode == Opcode.IGET_OBJECT && fb[1].diagField()?.definingClass == plan.modelField.type &&
        (fb[1] as TwoRegisterInstruction).registerB == fr + 2,
        "model presence and battery field input", fallback)
    val battery = fb[1].diagField()!!
    val batteryMaskAt = fb.indices.singleOrNull { fb[it].opcode == Opcode.IGET && fb[it].diagField()?.definingClass == battery.type }
        ?: throw PatchException("Missing unique model battery presence read in $fallback")
    val batteryMask = fb[batteryMaskAt].diagField()!!
    val currentAt = batteryMaskAt + 3
    diagGuard(fb[batteryMaskAt + 1].opcode == Opcode.AND_INT_LIT8 &&
        (fb[batteryMaskAt + 1] as NarrowLiteralInstruction).narrowLiteral == 2 &&
        fb[batteryMaskAt + 2].opcode == Opcode.IF_EQZ && fb[currentAt].opcode == Opcode.IGET_OBJECT &&
        fb[currentAt].diagField()?.definingClass == battery.type &&
        (fb[batteryMaskAt + 1] as TwoRegisterInstruction).registerB == (fb[batteryMaskAt] as TwoRegisterInstruction).registerA &&
        (fb[batteryMaskAt + 2] as OneRegisterInstruction).registerA == (fb[batteryMaskAt + 1] as TwoRegisterInstruction).registerA &&
        (fb[currentAt] as TwoRegisterInstruction).registerB == (fb[batteryMaskAt] as TwoRegisterInstruction).registerB,
        "current-Wh battery presence mask and field operand", fallback)
    val batteryCurrent = fb[currentAt].diagField()!!
    val capacityReads = fb.indices.filter { fb[it].opcode == Opcode.IGET_OBJECT &&
        fb[it].diagField()?.let { f -> f.definingClass == battery.type && f.type == batteryCurrent.type &&
            f.toString() != batteryCurrent.toString() } == true }
    diagGuard(capacityReads.size == 1, "unique model capacity field", fallback)
    val capacityAt = capacityReads.single()
    val batteryCapacity = fb[capacityAt].diagField()!!
    val valueMaskAt = fb.indices.singleOrNull { fb[it].opcode == Opcode.IGET &&
        fb[it].diagField()?.definingClass == batteryCurrent.type && fb.getOrNull(it + 1)?.opcode == Opcode.AND_INT_LIT8 &&
        (fb[it + 1] as NarrowLiteralInstruction).narrowLiteral == 1 }
        ?: throw PatchException("Missing unique model value presence mask in $fallback")
    val valueMask = fb[valueMaskAt].diagField()!!
    val whReads = fb.indices.filter { fb[it].opcode == Opcode.IGET &&
        fb[it].diagField()?.let { f -> f.definingClass == batteryCurrent.type && f.toString() != valueMask.toString() } == true }
    val valueWh = whReads.map { fb[it].diagField()!! }.distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Missing unique model Wh field in $fallback")
    val fallbackCalculation = fb.indices.singleOrNull { fb[it].diagCall()?.toString() == calculationDef.toString() }
        ?: throw PatchException("Missing unique original summary conversion in $fallback")
    diagGuard(fb[valueMaskAt + 2].opcode == Opcode.IF_EQZ &&
        (fb[valueMaskAt + 1] as TwoRegisterInstruction).registerB == (fb[valueMaskAt] as TwoRegisterInstruction).registerA &&
        (fb[valueMaskAt + 2] as OneRegisterInstruction).registerA == (fb[valueMaskAt + 1] as TwoRegisterInstruction).registerA &&
        fb.diagTarget(batteryMaskAt + 2) == fb.diagTarget(valueMaskAt + 2) &&
        fb[fb.diagTarget(valueMaskAt + 2)].opcode == Opcode.SGET_OBJECT &&
        fb[fb.diagTarget(valueMaskAt + 2)].diagField()?.type == arrivalType &&
        whReads.size == 2 && fb[fallbackCalculation].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
        fb[fallbackCalculation].invokeRegisters()?.size == 6 &&
        fb[fallbackCalculation + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        fb.exitAt(fallbackCalculation + 2)?.opcode == Opcode.RETURN_OBJECT &&
        (fb[fallbackCalculation + 1] as OneRegisterInstruction).registerA ==
            (fb.exitAt(fallbackCalculation + 2) as OneRegisterInstruction).registerA,
        "present model values reach the original summary converter and result", fallback)
    diagGuard(batteryMask.definingClass == battery.type && batteryCurrent.definingClass == battery.type &&
        batteryCapacity.definingClass == battery.type && batteryCapacity.type == batteryCurrent.type &&
        valueMask.definingClass == batteryCurrent.type && valueWh.definingClass == batteryCurrent.type && valueWh.type == "I",
        "model battery field ownership", fallback)

    val uiType = diagType(", shouldShowBatteryOnArrivalInfo=")
    val visible = diagLabel(uiType, ", shouldShowBatteryOnArrivalInfo=", "Z")
    val builder = uniqueMapsHook(Fingerprint(returnType = uiType, parameters = emptyList(), custom = { method, _ ->
        method.implementation?.instructions?.any { it.opcode == Opcode.NEW_INSTANCE &&
            it.getReference<TypeReference>()?.type == uiType } == true }), "legacy arrival UI state builder")!!
    val bc = builder.diagCode()
    exits(builder, 1, Opcode.RETURN_OBJECT)
    val wrapperRead = bc.indices.singleOrNull { bc[it].opcode == Opcode.IGET_OBJECT && bc[it].diagField()?.type == infoType &&
        bc.getOrNull(it - 1)?.opcode == Opcode.CHECK_CAST }
        ?: throw PatchException("Missing unique selected arrival display flow")
    val wrapper = bc[wrapperRead].diagField()!!
    val selectedRef = bc[wrapperRead - 3].diagCall()
    diagGuard(selectedRef != null && selectedRef.definingClass == builder.definingClass && selectedRef.parameterTypes.isEmpty() &&
        bc[wrapperRead - 2].opcode == Opcode.MOVE_RESULT_OBJECT &&
        bc[wrapperRead - 1].getReference<TypeReference>()?.type == wrapper.definingClass &&
        bc[wrapperRead + 1].diagCall()?.definingClass == infoType && bc[wrapperRead + 1].diagCall()?.returnType == "Z" &&
        bc[wrapperRead + 2].opcode == Opcode.MOVE_RESULT && bc[wrapperRead + 3].opcode == Opcode.XOR_INT_LIT8 &&
        (bc[wrapperRead + 3] as NarrowLiteralInstruction).narrowLiteral == 1,
        "selected arrival -> no-information -> visibility", builder)
    val selection = mutable(member(selectedRef!!))
    val sc = selection.diagCode()
    exits(selection, 3, Opcode.RETURN_OBJECT)
    diagGuard(sc.size == 26 && sc[0].opcode == Opcode.IGET_OBJECT && sc[1].opcode == Opcode.IGET_OBJECT &&
        sc[1].diagField()?.type == arrivalType && sc[2].opcode == Opcode.IGET_BOOLEAN &&
        sc[4].diagField()?.toString() == state.toString() && sc[8].opcode == Opcode.IGET_OBJECT &&
        sc[8].diagField()?.type == arrivalType && sc[10].diagField()?.toString() == levelWh.toString() &&
        sc[11].diagField()?.toString() == levelWh.toString() && sc[12].opcode == Opcode.IF_LE,
        "dynamic/cached arrival selection", selection)
    val dynamic = sc[0].diagField()!!
    val stopArrival = sc[1].diagField()!!
    val cached = sc[8].diagField()!!
    val useDynamic = sc[2].diagField()!!
    diagGuard(dynamic.definingClass == selection.definingClass && stopArrival.definingClass == dynamic.type &&
        cached.definingClass == selection.definingClass && useDynamic.definingClass == selection.definingClass &&
        (sc[0] as TwoRegisterInstruction).registerB == selection.diagReceiver() &&
        (sc[1] as TwoRegisterInstruction).registerB == (sc[0] as TwoRegisterInstruction).registerA &&
        (sc[2] as TwoRegisterInstruction).registerB == selection.diagReceiver() &&
        (sc[8] as TwoRegisterInstruction).registerB == selection.diagReceiver() &&
        sc[7].diagField()?.toString() == level.toString() && sc[9].diagField()?.toString() == level.toString() &&
        sc[5].diagField()?.toString() == noInfo.toString(), "selection owner/arrival fields", selection)
    val noInfoTest = member(bc[wrapperRead + 1].diagCall()!!)
    val nt = noInfoTest.diagCode()
    diagGuard(nt.size == 7 && nt[0].diagField()?.toString() == infoState.toString() &&
        nt[1].diagField()?.toString() == noInfo.toString() && nt[2].opcode == Opcode.IF_NE &&
        nt.diagTarget(2) == 5 && (nt[3] as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
        (nt[5] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
        bc[wrapperRead + 1].invokeRegisters() == listOf((bc[wrapperRead] as TwoRegisterInstruction).registerA) &&
        (bc[wrapperRead + 3] as TwoRegisterInstruction).registerB == (bc[wrapperRead + 2] as OneRegisterInstruction).registerA,
        "no-information equality and inverted visibility operand", noInfoTest)
    val visibleCtor = classDefBy(uiType).methods.single { it.name == "<init>" && it.parameterTypes.size == 26 }
    val vc = visibleCtor.diagCode()
    val visibleStore = vc.indices.single { vc[it].opcode == Opcode.IPUT_BOOLEAN && vc[it].diagField()?.toString() == visible.toString() }
    diagGuard(vc[visibleStore - 1].opcode == Opcode.MOVE_FROM16 &&
        (vc[visibleStore - 1] as TwoRegisterInstruction).registerA == (vc[visibleStore] as TwoRegisterInstruction).registerA,
        "visibility constructor parameter move", visibleCtor)
    val visibleArgument = (vc[visibleStore - 1] as TwoRegisterInstruction).registerB - visibleCtor.diagReceiver()
    val create = bc[bc.lastIndex - 1]
    val visibleRegister = (bc[wrapperRead + 3] as TwoRegisterInstruction).registerA
    diagGuard(create.opcode == Opcode.INVOKE_DIRECT_RANGE && create.diagCall()?.toString() == visibleCtor.toString() &&
        create.invokeRegisters()?.getOrNull(visibleArgument) == visibleRegister,
        "visibility reaches UI constructor field", builder)

    val alternatives = mutableListOf<Method>()
    classDefForEach { cls -> cls.methods.forEach { method ->
        if (method.returnType == "Z" && method.parameterTypes.isEmpty() && method.implementation != null) {
            val code = method.diagCode()
            if (code.size == 13 && code[0].opcode == Opcode.INVOKE_DIRECT && code[1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                code[2].opcode == Opcode.IGET_OBJECT && code[2].diagField()?.type == dynamic.type &&
                code[3].diagField()?.toString() == stopArrival.toString() && code[4].diagField()?.toString() == state.toString()) alternatives.add(method)
        }
    } }
    val alternative = mutable(alternatives.singleOrNull()
        ?: throw PatchException("Missing unique alternative navigation battery row gate"))
    val ac = alternative.diagCode()
    exits(alternative, 2, Opcode.RETURN)
    val capability = ac[7].diagField()!!
    val stateGetter = ac[0].diagCall()!!
    val alternativeStop = ac[2].diagField()!!
    diagGuard(ac[7].opcode == Opcode.IGET_BOOLEAN && capability.definingClass == alternative.definingClass &&
        ac[5].diagField()?.toString() == noInfo.toString() &&
        ac[6].opcode == Opcode.IF_EQ && ac.diagTarget(6) == 11 && ac[8].opcode == Opcode.IF_EQZ && ac.diagTarget(8) == 11 &&
        stateGetter.definingClass == alternative.definingClass && stateGetter.returnType == alternativeStop.definingClass &&
        ac[9].opcode == Opcode.CONST_4 && (ac[9] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        ac[11].opcode == Opcode.CONST_4 && (ac[11] as NarrowLiteralInstruction).narrowLiteral == 0,
        "alternative arrival state and capability gate", alternative)

    val display = mutable(classDefBy(wrapper.definingClass).methods.singleOrNull { it.name == "<init>" &&
        it.parameterTypes.size == 2 && it.parameterTypes[1] == arrivalType }
        ?: throw PatchException("Missing unique arrival display constructor"))
    val dc = display.diagCode()
    val displayReceiver = display.diagReceiver()
    val displaySource = displayReceiver + 2
    diagGuard(dc.last().opcode == Opcode.RETURN_VOID && dc.count { it.opcode == Opcode.RETURN_VOID } == 1 &&
        dc[dc.lastIndex - 1].opcode == Opcode.IPUT_OBJECT && dc[dc.lastIndex - 1].diagField()?.toString() == wrapper.toString() &&
        (dc[dc.lastIndex - 1] as TwoRegisterInstruction).registerB == displayReceiver &&
        dc[dc.lastIndex - 2].diagCall()?.let { it.name == "<init>" && it.definingClass == infoType &&
            it.parameterTypes.size == 7 && it.parameterTypes[1] == "Ljava/lang/CharSequence;" &&
            it.parameterTypes[2] == "Z" && it.parameterTypes[3] == infoState.type && it.returnType == "V" } == true &&
        displayReceiver <= 15 && displaySource <= 15 && dc.none { it.opcode.setsRegister() &&
            (it as? OneRegisterInstruction)?.registerA in setOf(displayReceiver, displaySource) },
        "constructor source/receiver preserved through complete info store", display)

    listOf(level, inaccurate, levelWh, levelCapacity, levelDisplay, infoState, infoText, infoInaccurate, state,
        legArrival, legMask, legCurrent, legCapacity, legNegative, summaryMask, summaryEnergy, energyMask, energyWh,
        battery, batteryMask, batteryCurrent, batteryCapacity, valueMask, valueWh, dynamic, stopArrival, cached,
        useDynamic, visible, capability, alternativeStop, wrapper).forEach(::declaration)
    val countMethod = member(count)
    val atMethod = member(at)
    val summaryMethod = member(summary)
    listOf(countMethod, atMethod, summaryMethod).forEach {
        diagGuard(AccessFlags.PUBLIC.isSet(classDefBy(it.definingClass).accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation!!.tryBlocks.isEmpty(),
            "public instance route snapshot getter", it)
    }
    // Java diagnostics may invoke only these already-proven field/array getters.
    // Never reflect a delegated, calculating or side-effecting Maps method.
    val countCode = countMethod.diagCode()
    diagGuard(countCode.size == 4 && countCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST,
        Opcode.ARRAY_LENGTH, Opcode.RETURN), "pure route count getter", countMethod)
    val routeArray = countCode[0].diagField()!!
    val countRegister = (countCode[0] as TwoRegisterInstruction).registerA
    diagGuard(routeArray.definingClass == routeType && routeArray.type == "Ljava/lang/Object;" &&
        (countCode[0] as TwoRegisterInstruction).registerB == countMethod.diagReceiver() &&
        (countCode[1] as OneRegisterInstruction).registerA == countRegister &&
        countCode[1].getReference<TypeReference>()?.type == "[${at.returnType}" &&
        (countCode[2] as TwoRegisterInstruction).registerA == countRegister &&
        (countCode[2] as TwoRegisterInstruction).registerB == countRegister &&
        (countCode[3] as OneRegisterInstruction).registerA == countRegister,
        "route count array/register flow", countMethod)
    val atCode = atMethod.diagCode()
    diagGuard(atCode.size == 4 && atCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST,
        Opcode.AGET_OBJECT, Opcode.RETURN_OBJECT), "pure route index getter", atMethod)
    val atRegister = (atCode[0] as TwoRegisterInstruction).registerA
    diagGuard(atCode[0].diagField()?.toString() == routeArray.toString() &&
        (atCode[0] as TwoRegisterInstruction).registerB == atMethod.diagReceiver() &&
        (atCode[1] as OneRegisterInstruction).registerA == atRegister &&
        atCode[1].getReference<TypeReference>()?.type == "[${at.returnType}" &&
        (atCode[2] as ThreeRegisterInstruction).registerB == atRegister &&
        (atCode[2] as ThreeRegisterInstruction).registerC == atMethod.diagReceiver() + 1 &&
        (atCode[3] as OneRegisterInstruction).registerA == (atCode[2] as ThreeRegisterInstruction).registerA,
        "route leg array/index/result flow", atMethod)
    val summaryCode = summaryMethod.diagCode()
    diagGuard(summaryCode.size == 6 && summaryCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST,
        Opcode.IGET_OBJECT, Opcode.IF_NEZ, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT),
        "pure route summary/default getter", summaryMethod)
    val summaryContainer = summaryCode[0].diagField()!!
    val containerType = summaryCode[1].getReference<TypeReference>()!!.type
    val summaryValue = summaryCode[2].diagField()!!
    val summaryDefault = summaryCode[4].diagField()!!
    val summaryRegister = (summaryCode[0] as TwoRegisterInstruction).registerA
    diagGuard(summaryContainer.definingClass == routeType && summaryContainer.type == "Ljava/lang/Object;" &&
        (summaryCode[0] as TwoRegisterInstruction).registerB == summaryMethod.diagReceiver() &&
        (summaryCode[1] as OneRegisterInstruction).registerA == summaryRegister &&
        summaryValue.definingClass == containerType && summaryValue.type == summary.returnType &&
        (summaryCode[2] as TwoRegisterInstruction).registerB == summaryRegister &&
        (summaryCode[2] as TwoRegisterInstruction).registerA == summaryRegister &&
        (summaryCode[3] as OneRegisterInstruction).registerA == summaryRegister && summaryCode.diagTarget(3) == 5 &&
        summaryDefault.definingClass == summary.returnType && summaryDefault.type == summary.returnType &&
        (summaryCode[4] as OneRegisterInstruction).registerA == summaryRegister &&
        (summaryCode[5] as OneRegisterInstruction).registerA == summaryRegister,
        "route summary field/default/register flow", summaryMethod)
    listOf(routeArray, summaryContainer, summaryValue, summaryDefault).forEach(::declaration)
    diagGuard(classDefBy(summaryDefault.definingClass).fields.single {
        it.name == summaryDefault.name && it.type == summaryDefault.type
    }.let { AccessFlags.STATIC.isSet(it.accessFlags) }, "static route summary default", summaryDefault)
    val schema = listOf(
        listOf(count.name, at.name, legArrival.name, legMask.name, legCurrent.name, legCapacity.name, legNegative.name,
            summary.name, summaryMask.name, summaryEnergy.name, energyMask.name, energyWh.name),
        listOf(battery.name, batteryMask.name, batteryCurrent.name, batteryCapacity.name, valueMask.name, valueWh.name),
        listOf(state.name, level.name, inaccurate.name, levelWh.name, levelCapacity.name, levelDisplay.name),
        listOf(dynamic.name, stopArrival.name, cached.name, useDynamic.name, visible.name),
        listOf(capability.name, stateGetter.name, alternativeStop.name),
        listOf(wrapper.name, infoState.name, infoText.name, infoInaccurate.name),
        listOf(guidanceLegs.definingClass.removePrefix("L").removeSuffix(";").replace('/', '.'), guidanceLegs.name,
            routeType.removePrefix("L").removeSuffix(";").replace('/', '.')),
    ).joinToString(";") { it.joinToString(",") }
    val calculation = mutable(calculationDef)
    val pp = producer.diagReceiver()
    val lp = legConverter.diagReceiver()
    val entries = listOf(
        DiagnosticEntry(producer, 0, "invoke-static/range { v${pp + 1} .. v${pp + 3} }, " +
            "$DIAGNOSTIC->onArrivalInput(Ljava/lang/Object;ILjava/lang/Object;)V"),
        DiagnosticEntry(calculation, 0, "invoke-static/range { v${cp + 1} .. v${cp + 5} }, " +
            "$DIAGNOSTIC->onCalculationInput(Ljava/lang/Object;IIZLjava/lang/Object;)V"),
        DiagnosticEntry(legConverter, 0, "invoke-static/range { v${lp + 1} .. v${lp + 4} }, " +
            "$DIAGNOSTIC->onLegInput(Ljava/lang/Object;IZLjava/lang/Object;)V"),
        DiagnosticEntry(selection, 0, "invoke-static/range { p0 .. p0 }, $DIAGNOSTIC->onLegacySelectionInput(Ljava/lang/Object;)V"),
        DiagnosticEntry(alternative, 0, "invoke-static/range { p0 .. p0 }, $DIAGNOSTIC->onAlternativeUiInput(Ljava/lang/Object;)V"),
        DiagnosticEntry(alternative, 2, "invoke-static/range { v${(ac[1] as OneRegisterInstruction).registerA} .. " +
            "v${(ac[1] as OneRegisterInstruction).registerA} }, $DIAGNOSTIC->onAlternativeUiState(Ljava/lang/Object;)V"),
    )
    val returns = listOf(
        DiagnosticReturn(producer, "onArrivalResult", "Ljava/lang/Object;"),
        DiagnosticReturn(calculation, "onCalculationResult", "Ljava/lang/Object;"),
        DiagnosticReturn(legConverter, "onLegResult", "Ljava/lang/Object;"),
        DiagnosticReturn(selection, "onLegacySelectionResult", "Ljava/lang/Object;"),
        DiagnosticReturn(builder, "onLegacyUi", "Ljava/lang/Object;"),
        DiagnosticReturn(alternative, "onAlternativeUiResult", "Z"),
    )
    return NativeDiagnosticPlan(schema, entries, returns, display, displaySource, displayReceiver)
}

