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

private const val PHONE_DIAG = "Lapp/morphe/extension/maps/patches/BydNativeBatteryDiagnostics;"
private const val PHONE_TEXT = "Ljava/lang/CharSequence;"
private const val PHONE_CONTEXT = "Landroid/content/Context;"
private fun Instruction.phoneCall() = getReference<MethodReference>()
private fun Instruction.phoneField() = getReference<FieldReference>()
private fun Method.phoneCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing phone diagnostic implementation: $this")
private fun phoneGuard(ok: Boolean, reason: String, method: Any) {
    if (!ok) throw PatchException("Unrecognized phone diagnostic layout: $reason in $method")
}
private fun Method.phoneParameters(): Int {
    phoneGuard(parameterTypes.none { it == "J" || it == "D" }, "narrow/reference parameters", this)
    return implementation!!.registerCount - parameterTypes.size
}
private fun Method.phoneReceiver(): Int {
    phoneGuard(!AccessFlags.STATIC.isSet(accessFlags), "instance receiver", this)
    return phoneParameters() - 1
}
private fun List<Instruction>.phoneTarget(index: Int): Int {
    val address = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var cursor = 0
    return indices.singleOrNull { val hit = cursor == address; cursor += get(it).codeUnits; hit }
        ?: throw PatchException("Invalid phone diagnostic branch target")
}
private fun Method.phoneShape(returns: Int) {
    val code = phoneCode()
    phoneGuard(implementation!!.tryBlocks.isEmpty() && code.count { it.opcode == Opcode.RETURN_OBJECT } == returns &&
        code.none { it.opcode in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA,
            Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } &&
        code.filter { it.opcode == Opcode.RETURN_OBJECT }.all { (it as OneRegisterInstruction).registerA <= 255 },
        "guarded exits, no try/switch/array payload", this)
    code.indices.filter { code[it] is OffsetInstruction }.forEach { code.phoneTarget(it) }
}

internal data class PhoneDiagnosticInsert(val index: Int, val text: String, val expected: List<Opcode>)
internal data class PhoneDiagnosticMethod(val method: MutableMethod, val result: String,
    val entry: PhoneDiagnosticInsert, val observedGates: List<PhoneDiagnosticInsert> = emptyList())
internal data class PhoneDiagnosticEntryOnly(val method: MutableMethod, val entry: PhoneDiagnosticInsert)
internal data class PhoneDiagnosticConstruction(val method: MutableMethod, val observations: List<PhoneDiagnosticInsert>)

/** Observe the ordinary Maps directions UI; formatting execution is not pixel visibility. */
internal class NativePhoneDiagnosticPlan internal constructor(private val hooks: List<PhoneDiagnosticMethod>,
    private val guidance: PhoneDiagnosticEntryOnly, private val preview: PhoneDiagnosticConstruction) {
    val methods = hooks.map { it.method } + guidance.method + preview.method

    fun inject() {
        hooks.forEach { hook ->
            val method = hook.method
            val original = method.phoneCode()
            val registers = method.implementation!!.registerCount
            val exits = original.indices.filter { original[it].opcode == Opcode.RETURN_OBJECT }
            val changes = hook.observedGates.map { it.index to it } + exits.map { it to null }
            phoneGuard(changes.map { it.first }.distinct().size == changes.size,
                "distinct exit/observed gate positions", method)
            changes.sortedByDescending { it.first }.forEach { (index, insert) ->
                if (insert != null) {
                    // Insert immediately AFTER the existing move-result. Branches to
                    // the next original instruction must skip this observation; they
                    // did not execute the getter and cannot supply its result.
                    checkedNativeInsert(method, index, insert.text, insert.expected)
                } else {
                    val register = (original[index] as OneRegisterInstruction).registerA
                    // Preserve labels on the return, including shared exits. Each
                    // addition is four code units, preserving payload parity.
                    method.replaceInstruction(index, "invoke-static/range { v$register .. v$register }, " +
                        "$PHONE_DIAG->${hook.result}(Ljava/lang/Object;)V")
                    phoneGuard(method.phoneCode()[index].phoneCall()?.toString() ==
                        "$PHONE_DIAG->${hook.result}(Ljava/lang/Object;)V", "assembled return observation", method)
                    checkedNativeInsert(method, index + 1, "nop\nreturn-object v$register",
                        listOf(Opcode.NOP, Opcode.RETURN_OBJECT))
                }
            }
            checkedNativeInsert(method, 0, hook.entry.text, hook.entry.expected)
            val after = method.phoneCode()
            val calls = after.count { it.phoneCall()?.definingClass == PHONE_DIAG }
            phoneGuard(calls == 1 + exits.size + hook.observedGates.size &&
                after.size == original.size + 2 * calls &&
                after.sumOf { it.codeUnits } == original.sumOf { it.codeUnits } + 4 * calls &&
                method.implementation!!.registerCount == registers,
                "only void diagnostic calls/padding; original registers and exits retained", method)
        }
        val construction = preview.method
        val originalConstruction = construction.phoneCode()
        val constructionRegisters = construction.implementation!!.registerCount
        preview.observations.sortedByDescending { it.index }.forEach { insert ->
            checkedNativeInsert(construction, insert.index, insert.text, insert.expected)
        }
        val constructed = construction.phoneCode()
        phoneGuard(constructed.size == originalConstruction.size + 2 * preview.observations.size &&
            constructed.sumOf { it.codeUnits } == originalConstruction.sumOf { it.codeUnits } + 4 * preview.observations.size &&
            construction.implementation!!.registerCount == constructionRegisters &&
            constructed.count { it.phoneCall()?.definingClass == PHONE_DIAG } == preview.observations.size,
            "constructor observes original initialized receiver/flags/stored text only", construction)
        // This marker only identifies the executing ordinary-Maps guidance
        // family. It receives original arguments, not inferred screen state.
        val method = guidance.method
        val original = method.phoneCode()
        val registers = method.implementation!!.registerCount
        checkedNativeInsert(method, 0, guidance.entry.text, guidance.entry.expected)
        val after = method.phoneCode()
        phoneGuard(after.size == original.size + 2 &&
            after.sumOf { it.codeUnits } == original.sumOf { it.codeUnits } + 4 &&
            method.implementation!!.registerCount == registers &&
            after[0].phoneCall()?.toString() ==
                "$PHONE_DIAG->onPhoneGuidanceState(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)V" &&
            after[0].invokeRegisters() == (method.phoneReceiver()..method.phoneReceiver() + 3).toList() &&
            after[1].opcode == Opcode.NOP,
            "entry-only original guidance arguments, registers and even prefix", method)
    }
}

/** Required phone hooks use the shared arrival DTO and inspected register flows. */
internal fun BytecodePatchContext.resolveNativePhoneDiagnostics(): NativePhoneDiagnosticPlan {
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
        it.toString() == method.toString()
    }
    fun matches(predicate: (Method) -> Boolean): List<Method> {
        val found = mutableListOf<Method>()
        classDefForEach { cls -> cls.methods.filterTo(found) { it.implementation != null && predicate(it) } }
        return found
    }
    fun unique(found: List<Method>, purpose: String): Method = found.singleOrNull()
        ?: throw PatchException("Expected unique phone $purpose, found ${found.size}: $found")
    val arrival = uniqueMapsHook(Fingerprint(name = "toString", returnType = "Ljava/lang/String;",
        parameters = emptyList(), strings = listOf("BatteryOnArrival(batteryLevel=")),
        "phone shared arrival DTO")!!.definingClass
    val converter = unique(matches { method -> method.returnType == arrival &&
        method.parameterTypes.size == 4 && method.parameterTypes.first().startsWith("L") &&
        method.parameterTypes.drop(1) == listOf("I", "Z", "Ljava/lang/Integer;") &&
        !AccessFlags.STATIC.isSet(method.accessFlags) }, "leg converter")
    val route = converter.parameterTypes.first().toString()
    val leg = unique(classDefBy(converter.definingClass).methods.filter { it.returnType == arrival &&
        it.parameterTypes == listOf(route, "I") && it.implementation != null &&
        it.phoneCode().count { ins -> ins.phoneCall()?.toString() == converter.toString() } == 1 },
        "one-based destination wrapper")
    val lc = leg.phoneCode()
    val lr = leg.phoneReceiver()
    leg.phoneShape(1)
    phoneGuard(AccessFlags.PUBLIC.isSet(leg.accessFlags) && lc.map { it.opcode } == listOf(
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IGET_OBJECT, Opcode.IF_NE,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.GOTO, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.ADD_INT_LIT8, Opcode.CONST_4, Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
        "complete destination wrapper instruction shape", leg)
    val count = lc[0].phoneCall()!!
    val countRegister = (lc[1] as OneRegisterInstruction).registerA
    val thresholds = lc[2].phoneField()!!
    val thresholdRegister = (lc[2] as TwoRegisterInstruction).registerA
    val flagRegister = (lc[10] as OneRegisterInstruction).registerA
    val boxedRegister = (lc[12] as OneRegisterInstruction).registerA
    phoneGuard(count.definingClass == route && count.parameterTypes.isEmpty() && count.returnType == "I" &&
        lc[0].invokeRegisters() == listOf(lr + 1) &&
        (lc[2] as TwoRegisterInstruction).registerB == lr && thresholds.definingClass == leg.definingClass &&
        (lc[3] as TwoRegisterInstruction).registerA == lr + 2 &&
        (lc[3] as TwoRegisterInstruction).registerB == countRegister && lc.phoneTarget(3) == 7 &&
        lc.phoneTarget(6) == 9 &&
        listOf(4, 7).all { lc[it].phoneCall()?.let { ref -> ref.definingClass == thresholds.type &&
            ref.parameterTypes.isEmpty() && ref.returnType == "I" } == true &&
            lc[it].invokeRegisters() == listOf(thresholdRegister) } &&
        lc[4].phoneCall()?.name != lc[7].phoneCall()?.name &&
        listOf(5, 8).all { (lc[it] as OneRegisterInstruction).registerA == countRegister } &&
        (lc[9] as TwoRegisterInstruction).registerA == lr + 2 &&
        (lc[9] as TwoRegisterInstruction).registerB == lr + 2 &&
        (lc[9] as NarrowLiteralInstruction).narrowLiteral == -1 &&
        (lc[10] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        lc[11].phoneCall()?.toString() == "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;" &&
        lc[11].invokeRegisters() == listOf(countRegister) &&
        lc[13].invokeRegisters() == listOf(lr, lr + 1, lr + 2, flagRegister, boxedRegister) &&
        (lc[14] as OneRegisterInstruction).registerA == lr &&
        (lc[15] as OneRegisterInstruction).registerA == lr,
        "count/threshold/one-based index/boxed minimum reach original leg converter", leg)

    val text = unique(matches { method -> AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType == PHONE_TEXT && method.parameterTypes.size == 3 &&
        method.parameterTypes.first() == arrival && method.parameterTypes.last() == PHONE_CONTEXT &&
        method.parameterTypes[1].startsWith("L") && method.phoneCode().any {
            it.getReference<StringReference>()?.string == "%s"
        } && method.phoneCode().any { it.phoneField()?.let { field ->
            field.definingClass == arrival && field.type.startsWith("L") } == true } },
        "arrival label formatter")
    val tc = text.phoneCode()
    val tp = text.phoneParameters()
    text.phoneShape(2)
    phoneGuard(AccessFlags.PUBLIC.isSet(text.accessFlags) && tc.size == 45 &&
        tc.first().phoneCall()?.toString() == "Ljava/lang/Object;->getClass()Ljava/lang/Class;" &&
        tc.first().invokeRegisters() == listOf(tp) &&
        tc.count { it.phoneCall()?.let { ref -> ref.definingClass == arrival &&
            ref.parameterTypes.isEmpty() && ref.returnType == "Ljava/lang/String;" } == true } == 2 &&
        tc.filter { it.opcode == Opcode.RETURN_OBJECT }.all { (it as OneRegisterInstruction).registerA == tp } &&
        tc.count { it.phoneCall()?.let { ref -> ref.definingClass == PHONE_CONTEXT && ref.name == "getString" &&
            ref.parameterTypes == listOf("I", "[Ljava/lang/Object;") } == true } == 2,
        "phone label formatter arrival and returned-text flow", text)
    val compact = unique(classDefBy(text.definingClass).methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == PHONE_TEXT &&
            method.parameterTypes == text.parameterTypes + "Z" && method.implementation != null },
        "arrival compact formatter")
    val cc = compact.phoneCode()
    val cp = compact.phoneParameters()
    compact.phoneShape(4)
    phoneGuard(AccessFlags.PUBLIC.isSet(compact.accessFlags) && cc.size == 69 && cp + 3 <= 15 &&
        cc.first().phoneCall()?.toString() == "Ljava/lang/Object;->getClass()Ljava/lang/Class;" &&
        cc.first().invokeRegisters() == listOf(cp) &&
        cc[10].opcode == Opcode.IF_EQZ && (cc[10] as OneRegisterInstruction).registerA == cp + 3 &&
        cc[11].phoneCall()?.toString() == text.toString() &&
        cc[11].invokeRegisters() == listOf(cp, cp + 1, cp + 2) &&
        cc.filter { it.opcode == Opcode.RETURN_OBJECT }.all { (it as OneRegisterInstruction).registerA == cp },
        "compact formatter original include-label and text branches", compact)

    val preview = unique(matches { method -> method.name == "<init>" &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
        method.parameterTypes.firstOrNull() == PHONE_CONTEXT && method.parameterTypes.lastOrNull() == "I" &&
        route in method.parameterTypes && converter.definingClass in method.parameterTypes &&
        method.phoneCode().count { it.phoneCall()?.toString() == text.toString() } == 1 &&
        method.phoneCode().count { it.phoneCall()?.toString() == leg.toString() } == 1 },
        "directions battery text construction")
    val pc = preview.phoneCode()
    val pr = preview.phoneReceiver()
    val superAt = pc.indices.singleOrNull { pc[it].opcode == Opcode.INVOKE_DIRECT &&
        pc[it].phoneCall()?.toString() == "Ljava/lang/Object;-><init>()V" &&
        pc[it].invokeRegisters() == listOf(pr) }
        ?: throw PatchException("Missing unique initialized directions receiver seam")
    val boolStores = pc.indices.filter { pc[it].opcode == Opcode.IPUT_BOOLEAN &&
        pc[it].phoneField()?.definingClass == preview.definingClass &&
        (pc[it] as TwoRegisterInstruction).registerB == pr }
    val formatAt = pc.indices.single { pc[it].phoneCall()?.toString() == text.toString() }
    val textStoreAt = formatAt + 4
    phoneGuard(AccessFlags.PUBLIC.isSet(preview.accessFlags) && preview.implementation!!.tryBlocks.isEmpty() &&
        pc.count { it.opcode == Opcode.RETURN_VOID } == 1 && pc.last().opcode == Opcode.RETURN_VOID &&
        pc.none { it.opcode in setOf(Opcode.RETURN_OBJECT, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
            Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } &&
        boolStores.size == 2 && boolStores.all { it > superAt && it < formatAt } &&
        pc[formatAt].opcode == Opcode.INVOKE_STATIC && pc[formatAt + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        pc[formatAt + 2].phoneCall()?.toString() == "Ljava/lang/Object;->toString()Ljava/lang/String;" &&
        pc[formatAt + 2].invokeRegisters() == listOf((pc[formatAt + 1] as OneRegisterInstruction).registerA) &&
        pc[formatAt + 3].opcode == Opcode.MOVE_RESULT_OBJECT && pc[textStoreAt].opcode == Opcode.IPUT_OBJECT &&
        pc[textStoreAt].phoneField()?.let { it.definingClass == preview.definingClass && it.type == "Ljava/lang/String;" } == true &&
        (pc[textStoreAt] as TwoRegisterInstruction).registerA == (pc[formatAt + 3] as OneRegisterInstruction).registerA &&
        (pc[textStoreAt] as TwoRegisterInstruction).registerB == pr,
        "initialized constructor, original formatter/toString and stored battery text", preview)
    val initialStore = boolStores.first()
    val consumptionStore = boolStores.last()
    val destinationRegister = preview.implementation!!.registerCount - 1
    val initialRegister = (pc[initialStore] as TwoRegisterInstruction).registerA
    val consumptionRegister = (pc[consumptionStore] as TwoRegisterInstruction).registerA
    val textRegister = (pc[textStoreAt] as TwoRegisterInstruction).registerA
    phoneGuard(pc[initialStore - 4].opcode == Opcode.IF_NEZ &&
        (pc[initialStore - 4] as OneRegisterInstruction).registerA == destinationRegister &&
        pc.phoneTarget(initialStore - 4) == initialStore - 1 &&
        pc[initialStore - 3].opcode == Opcode.MOVE && pc[initialStore - 1].opcode == Opcode.MOVE &&
        (pc[initialStore - 3] as TwoRegisterInstruction).registerA == initialRegister &&
        (pc[initialStore - 1] as TwoRegisterInstruction).registerA == initialRegister &&
        pc[initialStore - 2].opcode == Opcode.GOTO && pc.phoneTarget(initialStore - 2) == initialStore &&
        pc[consumptionStore - 2].opcode == Opcode.INVOKE_STATIC &&
        pc[consumptionStore - 2].phoneCall()?.returnType == "Z" &&
        pc[consumptionStore - 1].opcode == Opcode.MOVE_RESULT &&
        (pc[consumptionStore - 1] as OneRegisterInstruction).registerA == consumptionRegister &&
        listOf(pr, initialRegister, consumptionRegister, textRegister).all { it <= 255 },
        "constructor zero-index and original consumption-mode values", preview)
    val trueRegister = (pc[initialStore - 3] as TwoRegisterInstruction).registerB
    val falseRegister = (pc[initialStore - 1] as TwoRegisterInstruction).registerB
    fun lastConstant(register: Int, value: Int): Boolean {
        val write = pc.take(initialStore - 4).lastOrNull { it.opcode.setsRegister() &&
            (it as? OneRegisterInstruction)?.registerA == register }
        return write?.opcode == Opcode.CONST_4 && (write as NarrowLiteralInstruction).narrowLiteral == value
    }
    phoneGuard(lastConstant(trueRegister, 1) && lastConstant(falseRegister, 0) &&
        pc[initialStore + 1].phoneCall()?.returnType == "I" &&
        pc[consumptionStore + 1].opcode == Opcode.IF_EQZ &&
        (pc[consumptionStore + 1] as OneRegisterInstruction).registerA == initialRegister,
        "initial-stop true/false constants", preview)
    val previewObservations = listOf(
        PhoneDiagnosticInsert(superAt + 1,
            "invoke-static/range { v$pr .. v$pr }, $PHONE_DIAG->onPhonePreviewTextInput(Ljava/lang/Object;)V\nnop",
            listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP)),
        PhoneDiagnosticInsert(initialStore + 1,
            "invoke-static/range { v$initialRegister .. v$initialRegister }, $PHONE_DIAG->onPhonePreviewInitial(Z)V\nnop",
            listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP)),
        PhoneDiagnosticInsert(consumptionStore + 1,
            "invoke-static/range { v$consumptionRegister .. v$consumptionRegister }, $PHONE_DIAG->onPhonePreviewConsumption(Z)V\nnop",
            listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP)),
        PhoneDiagnosticInsert(textStoreAt + 1,
            "invoke-static/range { v$textRegister .. v$textRegister }, $PHONE_DIAG->onPhonePreviewTextResult(Ljava/lang/Object;)V\nnop",
            listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP)),
    )
    // The constructor has no old enabled getter. Observe real decisions only;
    // absence of that event must not be misreported as a true/false gate.
    val observedPositions = previewObservations.map { it.index }.toSet()
    phoneGuard(observedPositions.size == previewObservations.size &&
        pc.indices.filter { pc[it] is OffsetInstruction }.none { pc.phoneTarget(it) in observedPositions },
        "constructor probes cannot be entered with an unevaluated original value", preview)

    val guidance = uniqueMapsHook(Fingerprint(returnType = "V", parameters = listOf("L", "L", "Z"),
        strings = listOf("SharedGuidedNavViewModelImpl.onNavigationUiStateChanged")),
        "ordinary Maps shared guidance UI state")!!
    val gc = guidance.phoneCode()
    val gr = guidance.phoneReceiver()
    val state = guidance.parameterTypes.first().toString()
    phoneGuard(AccessFlags.PUBLIC.isSet(guidance.accessFlags) &&
        guidance.parameterTypes == listOf(state, state, "Z") && guidance.returnType == "V" &&
        gr >= 0 && gr + 3 == guidance.implementation!!.registerCount - 1 &&
        gc.take(11).map { it.opcode } == listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16,
            Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IGET_OBJECT,
            Opcode.IF_NEZ, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.GOTO_16, Opcode.IPUT_OBJECT) &&
        (gc[0] as TwoRegisterInstruction).registerB == gr &&
        (gc[1] as TwoRegisterInstruction).registerB == gr + 1 &&
        gc[2].getReference<StringReference>()?.string == "SharedGuidedNavViewModelImpl.onNavigationUiStateChanged",
        "public instance guidance signature and original receiver/current-state prefix", guidance)
    val ownerRegister = (gc[0] as TwoRegisterInstruction).registerA
    val currentRegister = (gc[1] as TwoRegisterInstruction).registerA
    val routeRegister = (gc[5] as TwoRegisterInstruction).registerA
    val routeField = gc[5].phoneField()!!
    phoneGuard((gc[5] as TwoRegisterInstruction).registerB == currentRegister &&
        routeField.definingClass == state && routeField.type.startsWith("L") &&
        (gc[6] as OneRegisterInstruction).registerA == routeRegister && gc.phoneTarget(6) == 10 &&
        (gc[7] as TwoRegisterInstruction).registerB == ownerRegister &&
        gc[7].phoneField()?.definingClass == guidance.definingClass &&
        gc[8].invokeRegisters() == listOf((gc[7] as TwoRegisterInstruction).registerA) &&
        gc[8].phoneCall()?.let { it.parameterTypes.isEmpty() && it.returnType == "V" &&
            it.definingClass == gc[7].phoneField()?.type } == true &&
        (gc[10] as TwoRegisterInstruction).registerA == currentRegister &&
        (gc[10] as TwoRegisterInstruction).registerB == ownerRegister &&
        gc[10].phoneField()?.let { it.definingClass == guidance.definingClass && it.type == state } == true &&
        gc.any { it.opcode == Opcode.RETURN_VOID } && gc.none { it.opcode == Opcode.RETURN_OBJECT },
        "route-present branch stores first state as current; empty route notifies original binding", guidance)
    var address = 0
    gc.forEach { instruction ->
        if (instruction.opcode in setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD))
            phoneGuard(address % 2 == 0, "original guidance payload alignment", guidance)
        address += instruction.codeUnits
    }
    gc.indices.filter { gc[it] is OffsetInstruction }.forEach { gc.phoneTarget(it) }

    fun entry(text: String, opcode: Opcode = Opcode.INVOKE_STATIC_RANGE) =
        PhoneDiagnosticInsert(0, "$text\nnop", listOf(opcode, Opcode.NOP))
    return NativePhoneDiagnosticPlan(listOf(
        PhoneDiagnosticMethod(mutable(leg), "onPhoneLegResult", entry(
            "invoke-static/range { v${lr + 1} .. v${lr + 2} }, $PHONE_DIAG->onPhoneLegInput(Ljava/lang/Object;I)V")),
        PhoneDiagnosticMethod(mutable(text), "onPhoneTextResult", entry(
            "invoke-static/range { v$tp .. v$tp }, $PHONE_DIAG->onPhoneTextInput(Ljava/lang/Object;)V")),
        PhoneDiagnosticMethod(mutable(compact), "onPhoneCompactTextResult", entry(
            "invoke-static { v$cp, v${cp + 3} }, $PHONE_DIAG->onPhoneCompactTextInput(Ljava/lang/Object;Z)V",
            Opcode.INVOKE_STATIC)),
    ), PhoneDiagnosticEntryOnly(guidance, entry(
        "invoke-static/range { v$gr .. v${gr + 3} }, " +
            "$PHONE_DIAG->onPhoneGuidanceState(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)V")),
        PhoneDiagnosticConstruction(mutable(preview), previewObservations))
}
