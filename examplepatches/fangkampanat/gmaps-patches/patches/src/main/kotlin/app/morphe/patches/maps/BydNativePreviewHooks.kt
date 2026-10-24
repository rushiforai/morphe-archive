package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val EXT = "Lapp/morphe/extension/maps/patches/BydNativeBatteryPatch;"
private fun Instruction.field() = getReference<FieldReference>()
private fun Instruction.call() = getReference<MethodReference>()
private fun guard(ok: Boolean, reason: String, method: Any) {
    if (!ok) throw PatchException("Unrecognized native preview layout: $reason in $method")
}
private fun Method.code() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing native preview implementation: $this")
private fun Method.receiver(): Int {
    guard(!AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.none { it == "J" || it == "D" }, "instance reference parameters", this)
    return implementation!!.registerCount - parameterTypes.size - 1
}
private fun List<Instruction>.target(index: Int): Int {
    val offset = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var address = 0
    return indices.singleOrNull { val hit = address == offset; address += get(it).codeUnits; hit }
        ?: throw PatchException("Invalid native preview branch target")
}
/** Every instruction index a branch, switch case or exception handler can enter. */
private fun Method.incomingTargets(): Set<Int> {
    val body = code()
    val address = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
    val index = address.withIndex().associate { it.value to it.index }
    fun at(value: Int) = index[value] ?: throw PatchException("Invalid native preview target in $this")
    val targets = mutableSetOf<Int>()
    body.indices.forEach { i ->
        val instruction = body[i] as? OffsetInstruction ?: return@forEach
        val destination = at(address[i] + instruction.codeOffset)
        targets.add(destination)
        (body[destination] as? SwitchPayload)?.switchElements?.forEach { targets.add(at(address[i] + it.offset)) }
    }
    implementation!!.tryBlocks.forEach { block -> block.exceptionHandlers.forEach { targets.add(at(it.handlerCodeAddress)) } }
    return targets
}
internal data class NativePreviewInsert(val method: MutableMethod, val index: Int, val text: String, val opcodes: List<Opcode>)

internal class NativePreviewPlan internal constructor(
    val getter: MutableMethod, val schema: String, val cloneSchema: String,
    val startupGate: MethodReference, val trackingGate: MethodReference,
    private val inserts: List<NativePreviewInsert>, private val entryRegister: Int,
    private val startupAggregate: MutableMethod,
) {
    fun inject() {
        inserts.groupBy { it.method }.forEach { (method, changes) ->
            guard(changes.map { it.index }.distinct().size == changes.size, "overlapping insertion", method)
            changes.sortedByDescending { it.index }.forEach {
                // Keep switch/array payload alignment stable. Dexlib otherwise adds a
                // hidden NOP during fixup, defeating exact instruction-count guards.
                val alignedPayload = method.code().any { ins -> ins.opcode in setOf(
                    Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) }
                val pad = alignedPayload && it.opcodes.sumOf { opcode -> opcode.format.size / 2 } % 2 != 0
                checkedNativeInsert(method, it.index, it.text + if (pad) "\nnop" else "",
                    it.opcodes + if (pad) listOf(Opcode.NOP) else emptyList())
            }
        }
        // addInstructions preserves the old return's label. Retarget only the proven
        // no-provider branch so it enters the new bridge, not the original null return.
        val aggregateBody = startupAggregate.code()
        val bridge = aggregateBody.indices.single { aggregateBody[it].call()?.toString() ==
            "$EXT->queryUnselectedInitialProvider()Ljava/lang/Object;" }
        val branch = bridge - 4
        guard(branch >= 0 && aggregateBody[branch].opcode == Opcode.IF_EQZ &&
            aggregateBody.target(branch) == bridge + 3 &&
            aggregateBody[bridge - 1].opcode == Opcode.RETURN_OBJECT &&
            aggregateBody[bridge + 3].opcode == Opcode.RETURN_OBJECT,
            "only original no-provider branch targets startup null return", startupAggregate)
        startupAggregate.replaceInstruction(branch, BuilderInstruction21t(Opcode.IF_EQZ,
            (aggregateBody[branch] as OneRegisterInstruction).registerA,
            startupAggregate.implementation!!.newLabelForIndex(bridge)))
        guard(startupAggregate.code().target(branch) == bridge, "no-provider branch enters startup query", startupAggregate)
        val body = getter.code()
        val before = body.size
        getter.addInstructionsWithLabels(0, """
            invoke-static/range { p0 .. p0 }, $EXT->previewBatteryPercent(Ljava/lang/Object;)I
            move-result v$entryRegister
            if-ltz v$entryRegister, :native_preview_original
            return v$entryRegister
        """.trimIndent(), ExternalLabel("native_preview_original", body.first()))
        guard(getter.code().size == before + 4 && getter.code().take(4).map { it.opcode } ==
            listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_LTZ, Opcode.RETURN), "preview entry assembly", getter)
    }
}

/** Resolve from provider/API relationships and proven operand flow, never an obfuscated name. */
internal fun BytecodePatchContext.resolveNativePreview(plan: NativeBatteryPlan, tracker: MutableMethod): NativePreviewPlan {
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() }
    fun publicField(ref: FieldReference) {
        val cls = classDefBy(ref.definingClass)
        guard(AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any { it.name == ref.name && it.type == ref.type &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) }, "public runtime field $ref", ref)
    }
    val owner = classDefBy(plan.factory.definingClass)
    val provider = owner.interfaces.single()
    val query = classDefBy(provider).methods.single { it.parameterTypes.isEmpty() && it.returnType == plan.modelField.type }
    guard(AccessFlags.PUBLIC.isSet(classDefBy(provider).accessFlags) && AccessFlags.PUBLIC.isSet(query.accessFlags), "provider getter accessibility", query)
    val factory = plan.factory.code()
    val capacityIndex = factory.indices.single { (factory[it] as? NarrowLiteralInstruction)?.narrowLiteral == 78000 }
    val number = factory[capacityIndex + 1].field()!!
    val capacityStore = (capacityIndex + 2 until factory.size).first { factory[it].opcode == Opcode.IPUT_OBJECT &&
        factory[it].field()?.type == number.definingClass }
    val capacity = factory[capacityStore].field()!!
    val battery = factory.mapNotNull { if (it.opcode == Opcode.IPUT_OBJECT) it.field() else null }.distinctBy { it.toString() }
        .single { it.definingClass == plan.modelField.type && it.type == capacity.definingClass }
    val current = factory.take(capacityIndex).mapNotNull { if (it.opcode == Opcode.IPUT_OBJECT) it.field() else null }
        .distinctBy { it.toString() }.single { it.definingClass == capacity.definingClass && it.type == number.definingClass }
    listOf(battery, capacity, current, number).forEach(::publicField)

    val getter = uniqueMapsHook(Fingerprint(returnType = "I", parameters = emptyList(), custom = { method, cls ->
        method.implementation?.instructions?.count { (it as? NarrowLiteralInstruction)?.narrowLiteral == 90 } == 1 &&
            cls.methods.any { it.name == "<init>" && provider in it.parameterTypes }
    }), "initial preview battery input")!!
    val getCode = getter.code()
    val p0 = getter.receiver()
    guard(getCode.size == 14 && getCode.last().opcode == Opcode.RETURN &&
        (getCode[getCode.lastIndex - 1] as? NarrowLiteralInstruction)?.narrowLiteral == 90 &&
        getCode.count { it.opcode == Opcode.RETURN } == 3 && getCode.first().opcode == Opcode.IGET_OBJECT,
        "optional/cached/default-90 getter", getter)
    val scratch = (getCode.first() as TwoRegisterInstruction).registerA
    guard((getCode.first() as TwoRegisterInstruction).registerB == p0 && scratch != p0 && scratch <= 255,
        "dead preview entry register", getter)
    val previewOwner = classDefBy(getter.definingClass)
    val previewCtor = previewOwner.methods.single { it.name == "<init>" && provider in it.parameterTypes }
    val providerParam = previewCtor.receiver() + 1 + previewCtor.parameterTypes.indexOf(provider)
    guard(previewCtor.code().last().opcode == Opcode.RETURN_VOID && previewCtor.code().count { it.opcode == Opcode.RETURN_VOID } == 1 &&
        previewCtor.receiver() <= 15 && providerParam <= 15, "preview provider constructor exit/registers", previewCtor)

    val writeback = uniqueMapsHook(Fingerprint(returnType = "Ljava/lang/Object;", parameters = emptyList(), custom = { method, _ ->
        method.implementation?.instructions?.any { it.call()?.toString() == getter.toString() } == true &&
            method.implementation!!.instructions.any { it.opcode == Opcode.IPUT_OBJECT && it.field()?.type == plan.modelField.type }
    }), "preview battery request writeback")!!
    val wb = writeback.code()
    val modelStore = wb.indices.single { wb[it].opcode == Opcode.IPUT_OBJECT && wb[it].field()?.type == plan.modelField.type }
    val store = wb[modelStore] as TwoRegisterInstruction
    val container = wb[modelStore].field()!!
    val modelRegister = store.registerA
    val copy = (0 until modelStore).last { wb[it].call()?.name == "toBuilder" &&
        wb[it].invokeRegisters() == listOf(modelRegister) }
    guard(wb[copy + 1].opcode == Opcode.MOVE_RESULT_OBJECT && (wb[copy + 1] as OneRegisterInstruction).registerA == modelRegister,
        "preview model builder flow", writeback)
    val cast = (copy + 2 until modelStore).singleOrNull { wb[it].opcode == Opcode.CHECK_CAST &&
        wb[it].getReference<TypeReference>()?.type == plan.modelField.type &&
        (wb[it] as OneRegisterInstruction).registerA == modelRegister &&
        wb[it - 1].opcode == Opcode.MOVE_RESULT_OBJECT && wb[it - 2].call()?.name == "build" }
        ?: throw PatchException("Missing unique built preview model result: $writeback")
    guard((wb[cast] as OneRegisterInstruction).registerA == modelRegister && wb[cast - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        (wb[cast - 1] as OneRegisterInstruction).registerA == modelRegister && wb[cast - 2].call()?.name == "build",
        "preview rebuilt model", writeback)
    val conversion = (0 until copy).single { wb[it].opcode == Opcode.FLOAT_TO_INT && wb.getOrNull(it + 1)?.opcode == Opcode.IPUT &&
        wb[it + 1].field()?.toString() == number.toString() }
    val energyRegister = (wb[conversion] as TwoRegisterInstruction).registerA
    val energyField = (conversion + 1 until copy).first { wb[it].opcode == Opcode.IPUT_OBJECT &&
        wb[it].field()?.toString() == current.toString() }
    val capRead = (0 until conversion).last { wb[it].field()?.toString() == capacity.toString() }
    val percentCall = (capRead until conversion).single { wb[it].call()?.toString() == getter.toString() }
    val divide = (percentCall until conversion).single { wb[it].opcode == Opcode.DIV_FLOAT_2ADDR }
    guard(wb[capRead + 3].opcode == Opcode.IGET && wb[capRead + 3].field()?.toString() == number.toString() &&
        wb[divide - 1].opcode == Opcode.CONST_HIGH16 && (wb[divide - 1] as NarrowLiteralInstruction).narrowLiteral == 100f.toBits() &&
        wb[divide + 1].opcode == Opcode.MUL_FLOAT_2ADDR && energyField > conversion &&
        modelRegister <= 15 && energyRegister <= 15, "capacity * initial-percent / 100 writeback", writeback)
    val rootRead = (0 until capRead).last { wb[it].opcode == Opcode.IGET_OBJECT && wb[it].field()?.toString() == container.toString() }
    guard((wb[rootRead] as TwoRegisterInstruction).registerA == modelRegister &&
        wb[rootRead + 1].opcode == Opcode.IF_NEZ && (wb[rootRead + 1] as OneRegisterInstruction).registerA == modelRegister &&
        wb.target(rootRead + 1) == rootRead + 3 && wb[rootRead + 2].opcode == Opcode.SGET_OBJECT &&
        wb[rootRead + 2].field()?.type == plan.modelField.type &&
        (rootRead + 1 until copy).none { index ->
            val ins = wb[index]
            ins.opcode.setsRegister() && (ins as? OneRegisterInstruction)?.registerA == modelRegister &&
                !(ins.opcode == Opcode.SGET_OBJECT && ins.field()?.type == plan.modelField.type)
        }, "model identity retained until preview builder", writeback)

    val initialCandidates = mutableListOf<Pair<Method, Int>>()
    classDefForEach { cls -> cls.methods.forEach { method ->
        val code = method.implementation?.instructions?.toList() ?: return@forEach
        if (method.returnType == "V" && method.parameterTypes.size == 1) code.indices.filter {
            code[it].opcode == Opcode.IPUT_OBJECT && code[it].field()?.toString() == container.toString() &&
                code.any { ins -> ins.call()?.toString() == query.toString() }
        }.forEach { index ->
            val valueReg = (code[index] as TwoRegisterInstruction).registerA
            if ((0 until index).any { j -> code[j].call()?.toString() == query.toString() &&
                    code.getOrNull(j + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                    (code[j + 1] as OneRegisterInstruction).registerA == valueReg }) initialCandidates.add(method to index)
        }
    } }
    guard(initialCandidates.size == 1, "unique initial provider/model writer", container)
    val (initialDef, initialStore) = initialCandidates.single()
    val initial = mutable(initialDef); val ic = initial.code()
    val initialReg = (ic[initialStore] as TwoRegisterInstruction).registerA
    val producer = (0 until initialStore).single { ic[it].call()?.toString() == query.toString() &&
        ic[it + 1].opcode == Opcode.MOVE_RESULT_OBJECT && (ic[it + 1] as OneRegisterInstruction).registerA == initialReg }
    val nullGuard = (producer + 2 until initialStore).singleOrNull {
        ic[it].opcode == Opcode.IF_NEZ && (ic[it] as OneRegisterInstruction).registerA == initialReg
    } ?: throw PatchException("Missing unique initial model null branch: $initial")
    val present = ic.target(nullGuard)
    fun writes(index: Int, register: Int): Boolean {
        val instruction = ic[index]
        val output = (instruction as? OneRegisterInstruction)?.registerA ?: return false
        return instruction.opcode.setsRegister() && (output == register ||
            instruction.opcode.setsWideRegister() && output + 1 == register)
    }
    fun closedForwardPath(start: Int, end: Int) = (start until end).all { index ->
        val instruction = ic[index]
        instruction.opcode !in listOf(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID,
            Opcode.THROW, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH) &&
            (instruction !is OffsetInstruction || ic.target(index) in (index + 1)..end)
    }
    // This writer attaches any non-null provider result directly. Its later flags
    // change request metadata, not whether this model field is written. Preserve
    // them and the original null/non-null branches; do not borrow a nearby flag.
    guard(present in (nullGuard + 2)..initialStore && initialReg <= 15 &&
        closedForwardPath(producer + 2, nullGuard) && closedForwardPath(present, initialStore) &&
        (producer + 2 until nullGuard).none { writes(it, initialReg) } &&
        (present until initialStore).none { writes(it, initialReg) } &&
        ic.indices.none { ic[it] is OffsetInstruction && ic.target(it) in (producer + 2)..nullGuard &&
            it !in (producer + 2) until nullGuard }, "initial direct-provider selection flow", initial)
    val zero = ic.getOrNull(nullGuard - 1)
    val zeroReg = (zero as? OneRegisterInstruction)?.registerA
    val nullStore = (nullGuard + 1 until present).singleOrNull {
        ic[it].opcode == Opcode.IPUT_OBJECT && ic[it].field()?.toString() == container.toString()
    }
    guard(zero?.opcode == Opcode.CONST_4 && (zero as? WideLiteralInstruction)?.wideLiteral == 0L &&
        nullStore != null && (ic[nullStore] as TwoRegisterInstruction).registerA == zeroReg &&
        (nullGuard + 1 until nullStore).none { writes(it, zeroReg!!) } &&
        ic[present - 1].opcode in listOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) &&
        ic.target(present - 1) > initialStore && closedForwardPath(nullGuard + 1, present - 1),
        "initial null path clears field and bypasses live store", initial)
    // Borrow the proven null constant only across our helper calls, then restore
    // it before either original branch. Selection comes from this provider call,
    // not from a nearby unrelated flag or an unconditional true constant.
    val attachReg = zeroReg ?: throw PatchException("Missing initial null scratch: $initial")
    guard(attachReg <= 15 && attachReg != initialReg && ic[producer].invokeRegisters()?.size == 1 &&
        ic.indices.none { ic[it] is OffsetInstruction &&
            (ic.target(it) in producer..producer + 1 || ic.target(it) == nullGuard) },
        "initial query capture entry/null scratch flow", initial)

    val clone = uniqueMapsHook(Fingerprint(returnType = plan.modelField.type,
        parameters = listOf("L", "Z", "Lj\$/time/Duration;"), custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation?.instructions?.any {
            it.call()?.name == "toBuilder" } == true && method.implementation!!.instructions.any {
            it.opcode == Opcode.IGET_OBJECT && it.field()?.type == plan.modelField.type }
    }), "published provider model clone")!!
    val cc = clone.code()
    val source = cc.indices.single { cc[it].opcode == Opcode.IGET_OBJECT && cc[it].field()?.type == plan.modelField.type }
    val sourceReg = (cc[source] as TwoRegisterInstruction).registerA
    guard(cc[source + 1].call()?.name == "toBuilder" && cc[source + 1].invokeRegisters() == listOf(sourceReg) &&
        cc.count { it.opcode == Opcode.RETURN_OBJECT } == 2, "published clone source/returns", clone)
    val cloneInput = clone.implementation!!.registerCount - 3
    guard(source == 2 && cc[0].opcode == Opcode.IF_EQZ && cc[1].opcode == Opcode.IF_EQZ &&
        (cc[0] as OneRegisterInstruction).registerA == cloneInput &&
        (cc[1] as OneRegisterInstruction).registerA == cloneInput + 1 && cc.target(0) == cc.target(1) &&
        cc.target(1) == cc.lastIndex - 1 && cc[cc.lastIndex - 1].opcode == Opcode.CONST_4 &&
        (cc[cc.lastIndex - 1] as WideLiteralInstruction).wideLiteral == 0L &&
        cc.last().opcode == Opcode.RETURN_OBJECT && (cc.last() as OneRegisterInstruction).registerA ==
            (cc[cc.lastIndex - 1] as OneRegisterInstruction).registerA,
        "clone false selection/null envelope returns null before any copy", clone)

    // Capture Maps' real publication envelope before stream delivery. Reuse its
    // public clone API so provider ID and measurement age keep their original semantics.
    val envelope = clone.parameterTypes.first().toString()
    val envelopeField = cc[source].field()!!
    guard(AccessFlags.PUBLIC.isSet(classDefBy(clone.definingClass).accessFlags) &&
        AccessFlags.STATIC.isSet(clone.accessFlags) && AccessFlags.PUBLIC.isSet(classDefBy(envelope).accessFlags) &&
        envelopeField.definingClass == envelope && (cc[source] as TwoRegisterInstruction).registerB ==
        clone.implementation!!.registerCount - 3, "public clone/envelope source flow", clone)
    // R8 split the public two-argument API from its Duration-aware implementation.
    // Keep calling Maps' wrapper, which obtains the envelope's real age itself.
    val cloneApi = uniqueMapsHook(Fingerprint(returnType = plan.modelField.type,
        parameters = listOf(envelope, "Z"), custom = { method, _ ->
            AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any { it.call()?.toString() == clone.toString() } == true
        }), "public age-aware publication clone API")!!
    val api = cloneApi.code()
    val input = cloneApi.implementation!!.registerCount - 2
    guard(cloneApi.definingClass == clone.definingClass && api.size == 8 &&
        api.map { it.opcode } == listOf(Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.GOTO, Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        (api[0] as OneRegisterInstruction).registerA == input && api.target(0) == 4 &&
        api[1].invokeRegisters() == listOf(input) && api[1].call()?.let {
            it.definingClass == envelope && it.parameterTypes.isEmpty() && it.returnType == clone.parameterTypes[2]
        } == true && api.target(3) == 5 && (api[4] as WideLiteralInstruction).wideLiteral == 0L &&
        (api[2] as OneRegisterInstruction).registerA == (api[4] as OneRegisterInstruction).registerA &&
        api[5].invokeRegisters() == listOf(input, input + 1, (api[2] as OneRegisterInstruction).registerA) &&
        api[5].call()?.toString() == clone.toString() &&
        (api[6] as OneRegisterInstruction).registerA == (api[7] as OneRegisterInstruction).registerA,
        "clone API preserves envelope/boolean and computes original measurement age", cloneApi)
    val age = classDefBy(envelope).methods.singleOrNull { it.toString() == api[1].call().toString() }
    guard(age != null && AccessFlags.PUBLIC.isSet(age.accessFlags), "public envelope age accessor", cloneApi)

    // The captured Boolean may authorize a null-cache fallback only when every
    // original provider query returns the synchronous clone result, or a
    // provably non-null derivative. A later intentional null must not inherit
    // an earlier true selection from an unrelated call.
    val queryImplementation = owner.methods.single { it.name == query.name &&
        it.parameterTypes == query.parameterTypes && it.returnType == query.returnType }
    val qc = queryImplementation.code()
    guard(qc.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        qc[1].call()?.definingClass == clone.definingClass &&
        qc[1].call()?.parameterTypes?.isEmpty() == true && qc[1].call()?.returnType == plan.modelField.type,
        "native provider synchronously delegates to original selection getter", queryImplementation)
    val selectedQuery = classDefBy(clone.definingClass).methods.single { it.toString() == qc[1].call().toString() }
    val sq = selectedQuery.code()
    guard(AccessFlags.FINAL.isSet(classDefBy(selectedQuery.definingClass).accessFlags) &&
        sq.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
        Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
        Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        sq[3].getReference<TypeReference>()?.type == envelope &&
        sq[7].getReference<TypeReference>()?.type == "Ljava/lang/Boolean;" &&
        sq[8].call()?.toString() == "Ljava/lang/Boolean;->booleanValue()Z" &&
        sq[12].call()?.toString() == clone.toString() &&
        sq[12].invokeRegisters() == listOf((sq[2] as OneRegisterInstruction).registerA,
            (sq[9] as OneRegisterInstruction).registerA, (sq[11] as OneRegisterInstruction).registerA) &&
        (sq[13] as OneRegisterInstruction).registerA == (sq[14] as OneRegisterInstruction).registerA &&
        sq[1].invokeRegisters() == listOf((sq[0] as TwoRegisterInstruction).registerA) &&
        sq[5].invokeRegisters() == listOf((sq[4] as TwoRegisterInstruction).registerA) &&
        sq[8].invokeRegisters() == listOf((sq[6] as OneRegisterInstruction).registerA) &&
        (sq[0] as TwoRegisterInstruction).registerB == selectedQuery.receiver() &&
        (sq[4] as TwoRegisterInstruction).registerB == selectedQuery.receiver() &&
        sq[10].invokeRegisters() == listOf(selectedQuery.receiver()),
        "selection getter passes its actual envelope/Boolean/age unchanged to original clone", selectedQuery)

    fun nonNullHelper(ref: MethodReference): Boolean {
        val method = classDefByOrNull(ref.definingClass)?.methods?.singleOrNull { it.toString() == ref.toString() }
            ?: return false
        val body = method.implementation?.instructions?.toList() ?: return false
        val returned = body.lastOrNull() as? OneRegisterInstruction ?: return false
        val r = returned.registerA
        return method.implementation!!.tryBlocks.isEmpty() && body.none { it is PayloadInstruction } &&
            body.count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
            body.last().opcode == Opcode.RETURN_OBJECT && body.getOrNull(body.lastIndex - 1)?.opcode == Opcode.CHECK_CAST &&
            (body[body.lastIndex - 1] as OneRegisterInstruction).registerA == r &&
            body.getOrNull(body.lastIndex - 2)?.call()?.toString() == "Ljava/lang/Object;->getClass()Ljava/lang/Class;" &&
            body[body.lastIndex - 2].invokeRegisters() == listOf(r) &&
            body.indices.none { body[it] is OffsetInstruction && body.target(it) > body.lastIndex - 2 } &&
            body.none { it.call()?.definingClass == clone.definingClass || it.call()?.toString() == query.toString() }
    }
    fun proveNonNullDerivatives(method: Method, start: Int, root: Int) {
        val body = method.code()
        guard(method.implementation!!.tryBlocks.isEmpty() && body.none { it is PayloadInstruction },
            "synchronous provider derivatives have no hidden exception/switch flow", method)
        val queue = ArrayDeque<Pair<Int, Set<Int>>>()
        val visited = mutableSetOf<Pair<Int, Set<Int>>>()
        queue.add(start to setOf(root))
        while (queue.isNotEmpty()) {
            val frame = queue.removeFirst()
            if (!visited.add(frame)) continue
            val (at, known) = frame
            guard(at in body.indices, "provider derivative remains inside original body", method)
            val instruction = body[at]
            val next = known.toMutableSet()
            if (instruction.opcode == Opcode.RETURN_OBJECT) {
                guard((instruction as OneRegisterInstruction).registerA in known,
                    "selected provider has no intentional null after a non-null clone", method)
                continue
            }
            if (instruction.opcode == Opcode.THROW) continue
            val output = (instruction as? OneRegisterInstruction)?.registerA
            if (instruction.opcode.setsRegister() && output != null && instruction.opcode != Opcode.CHECK_CAST) {
                next.remove(output)
                if (instruction.opcode.setsWideRegister()) next.remove(output + 1)
                if (instruction.opcode == Opcode.NEW_INSTANCE || instruction.opcode in setOf(Opcode.MOVE_OBJECT,
                        Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
                    (instruction as TwoRegisterInstruction).registerB in known ||
                    instruction.opcode == Opcode.MOVE_RESULT_OBJECT && at > 0 &&
                    body[at - 1].call()?.let(::nonNullHelper) == true) next.add(output)
            }
            if (instruction.call()?.toString() == "Ljava/lang/Object;->getClass()Ljava/lang/Class;")
                instruction.invokeRegisters()?.singleOrNull()?.let { next.add(it) }
            guard(at == start || instruction.call()?.definingClass != clone.definingClass,
                "derivative cannot overwrite captured selection with another clone call", method)
            if (instruction is OffsetInstruction) {
                val target = body.target(at)
                guard(target > at, "provider derivative has only forward original branches", method)
                queue.add(target to next.toSet())
                if (instruction.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) continue
            }
            queue.add(at + 1 to next.toSet())
        }
    }
    val queryImplementations = mutableListOf<Method>()
    classDefForEach { cls -> if (provider in cls.interfaces) {
        guard(AccessFlags.FINAL.isSet(cls.accessFlags), "provider implementation cannot hide an overridden query", cls.type)
        queryImplementations.add(cls.methods.single {
            it.name == query.name && it.parameterTypes == query.parameterTypes && it.returnType == query.returnType
        })
    } }
    guard(queryImplementations.isNotEmpty(), "original provider query implementations exist", query)
    val aggregates = mutableListOf<Method>()
    queryImplementations.forEach { method ->
        val body = method.code()
        val direct = body.take(3).map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT_OBJECT) && body[1].call()?.toString() == selectedQuery.toString()
        if (direct) {
            val result = (body[2] as OneRegisterInstruction).registerA
            guard(body[1].invokeRegisters() == listOf((body[0] as TwoRegisterInstruction).registerA) &&
                (body[0] as TwoRegisterInstruction).registerB == method.receiver(), "provider query receiver flow", method)
            if (body.size == 4) guard(body[3].opcode == Opcode.RETURN_OBJECT &&
                (body[3] as OneRegisterInstruction).registerA == result, "pure provider query returns exact clone", method)
            else {
                guard(body[3].opcode == Opcode.CONST_4 && (body[3] as WideLiteralInstruction).wideLiteral == 0L &&
                    body[4].opcode == Opcode.IF_EQZ && (body[4] as OneRegisterInstruction).registerA == result &&
                    body.target(4) == body.lastIndex && body.last().opcode == Opcode.RETURN_OBJECT &&
                    (body.last() as OneRegisterInstruction).registerA == (body[3] as OneRegisterInstruction).registerA,
                    "provider null result exits without post-processing", method)
                proveNonNullDerivatives(method, 5, result)
            }
        } else {
            guard(body.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE,
                Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.CONST_4,
                Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_OBJECT,
                Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_INTERFACE,
                Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.GOTO, Opcode.MOVE_OBJECT, Opcode.CHECK_CAST,
                Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT,
                Opcode.RETURN_OBJECT) && body[20].call()?.toString() == query.toString() &&
                body[20].invokeRegisters() == listOf((body[18] as OneRegisterInstruction).registerA) &&
                (body[21] as OneRegisterInstruction).registerA == (body[22] as OneRegisterInstruction).registerA &&
                body[5].opcode == Opcode.CONST_4 && (body[5] as WideLiteralInstruction).wideLiteral == 0L &&
                (body[23] as OneRegisterInstruction).registerA == (body[5] as OneRegisterInstruction).registerA &&
                body.target(6) == 17 && body.target(15) == 3 && body.target(16) == 18 && body.target(19) == 23,
                "aggregator synchronously returns its chosen provider result or null without a query", method)
            val list = body[0] as TwoRegisterInstruction
            val iterator = (body[2] as OneRegisterInstruction).registerA
            val item = (body[8] as OneRegisterInstruction).registerA
            val stream = (body[9] as TwoRegisterInstruction).registerA
            val empty = (body[5] as OneRegisterInstruction).registerA
            guard(method.implementation!!.tryBlocks.isEmpty() &&
                body[0].field()?.definingClass == method.definingClass &&
                body[0].field()?.type == "Lcom/google/common/collect/ImmutableList;" &&
                list.registerB == method.receiver() && list.registerA <= 65535 && empty <= 255 &&
                setOf(iterator, item, stream, empty).size == 4 &&
                body[1].call()?.toString() == "Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;" &&
                body[1].invokeRegisters() == listOf(list.registerA) &&
                body[3].call()?.toString() == "Ljava/util/Iterator;->hasNext()Z" &&
                body[3].invokeRegisters() == listOf(iterator) &&
                (body[4] as OneRegisterInstruction).registerA == (body[6] as OneRegisterInstruction).registerA &&
                body[7].call()?.toString() == "Ljava/util/Iterator;->next()Ljava/lang/Object;" &&
                body[7].invokeRegisters() == listOf(iterator) &&
                (body[9] as TwoRegisterInstruction).registerB == item &&
                body[10].getReference<TypeReference>()?.type == provider &&
                (body[10] as OneRegisterInstruction).registerA == stream &&
                body[11].call()?.definingClass == provider && body[11].call()?.parameterTypes?.isEmpty() == true &&
                body[11].invokeRegisters() == listOf(stream) &&
                body[13].call()?.definingClass == body[11].call()?.returnType &&
                body[13].call()?.parameterTypes?.isEmpty() == true && body[13].call()?.returnType == "Ljava/lang/Object;" &&
                body[13].invokeRegisters() == listOf((body[12] as OneRegisterInstruction).registerA) &&
                (body[14] as OneRegisterInstruction).registerA == (body[15] as OneRegisterInstruction).registerA &&
                (body[17] as TwoRegisterInstruction).registerA == item &&
                (body[17] as TwoRegisterInstruction).registerB == empty &&
                (body[18] as OneRegisterInstruction).registerA == item &&
                body[18].getReference<TypeReference>()?.type == provider &&
                (body[19] as OneRegisterInstruction).registerA == item,
                "aggregate ordered-list/iterator/stream/null-exit operands", method)
            aggregates.add(method)
        }
    }
    guard(aggregates.size == 1, "unique synchronous provider aggregate", query)
    val pc = plan.publisher.code()
    val publishAt = pc.indices.singleOrNull { pc[it].call()?.let { call ->
        call.definingClass == clone.definingClass && call.returnType == "V" && call.parameterTypes == listOf(envelope)
    } == true } ?: throw PatchException("Missing unique provider envelope delivery: ${plan.publisher}")
    val publishCall = pc[publishAt].call()!!
    val envelopeReg = pc[publishAt].invokeRegisters()?.getOrNull(1)
        ?: throw PatchException("Missing provider envelope argument: ${plan.publisher}")
    val envelopeCtor = (0 until publishAt).singleOrNull { pc[it].call()?.let { call ->
        call.definingClass == envelope && call.name == "<init>" && call.parameterTypes.size == 3 &&
        call.parameterTypes[0] == "Ljava/lang/String;" && call.parameterTypes[1] == plan.modelField.type
    } == true } ?: throw PatchException("Missing unique provider envelope constructor: ${plan.publisher}")
    val ctorRegs = pc[envelopeCtor].invokeRegisters()!!
    val transfer = pc.getOrNull(envelopeCtor + 1) as? TwoRegisterInstruction
    val read = (0 until envelopeCtor).lastOrNull { pc[it].opcode == Opcode.IGET_OBJECT &&
        pc[it].field()?.toString() == plan.modelField.toString() }
        ?: throw PatchException("Missing native factory model publication: ${plan.publisher}")
    guard(ctorRegs.size == 4 && ctorRegs[2] == (pc[read] as TwoRegisterInstruction).registerA &&
        envelopeCtor + 2 == publishAt && pc[envelopeCtor + 1].opcode == Opcode.MOVE_OBJECT &&
        transfer?.registerA == envelopeReg && transfer.registerB == ctorRegs[0] &&
        (read + 1 until envelopeCtor).count { pc[it].opcode == Opcode.IF_EQZ &&
            (pc[it] as OneRegisterInstruction).registerA == ctorRegs[2] && pc.target(it) == publishAt } == 1 &&
        pc[publishAt].opcode == Opcode.INVOKE_VIRTUAL && envelopeReg <= 65535,
        "factory envelope constructor/delivery flow", plan.publisher)
    val publishMethod = classDefBy(publishCall.definingClass).methods.single { it.toString() == publishCall.toString() }
    val delivery = publishMethod.code()
    val streamCalls = delivery.indices.filter { delivery[it].opcode == Opcode.INVOKE_INTERFACE &&
        delivery[it].call()?.let { call -> call.returnType == "V" &&
            call.parameterTypes == listOf("Ljava/lang/Object;") } == true }
    guard(streamCalls.size == 1 && delivery[streamCalls.single()].invokeRegisters()?.last() == publishMethod.receiver() + 1 &&
        delivery[streamCalls.single() - 1].opcode == Opcode.IGET_OBJECT &&
        (delivery[streamCalls.single() - 1] as TwoRegisterInstruction).registerB == publishMethod.receiver() &&
        (delivery[streamCalls.single() - 1] as TwoRegisterInstruction).registerA ==
        delivery[streamCalls.single()].invokeRegisters()?.first(), "provider envelope stream operand flow", publishMethod)

    val tc = tracker.code()
    val trackCall = tc.mapNotNull { it.call() }.first { it.returnType == "Z" && it.parameterTypes.isEmpty() }
    val gateInterface = trackCall.definingClass
    val trackerCtor = classDefBy(tracker.definingClass).methods.single { it.name == "<init>" }
    val progressBus = trackerCtor.parameterTypes.last().toString()
    val startup = uniqueMapsHook(Fingerprint(name = "run", returnType = "V", parameters = emptyList(), custom = { method, _ ->
        method.implementation?.instructions?.any { it.opcode == Opcode.CHECK_CAST &&
            it.getReference<TypeReference>()?.type == tracker.definingClass } == true &&
            method.implementation!!.instructions.any { it.call()?.let { call -> call.definingClass == progressBus &&
                call.returnType == "V" && call.parameterTypes.size == 2 &&
                call.parameterTypes.last() == "Ljava/util/concurrent/Executor;" } == true }
    }), "live battery tracker startup")!!
    val sc = startup.code()
    val startCall = sc.indices.single { index -> index > 0 && sc[index].call()?.definingClass == gateInterface &&
        sc[index].call()?.returnType == "Z" && sc[index - 1].opcode == Opcode.IGET_OBJECT &&
        sc[index - 1].field()?.definingClass == tracker.definingClass }
    val startGate = sc[startCall].call()!!
    guard(sc[startCall + 1].opcode == Opcode.MOVE_RESULT && sc[startCall + 2].opcode == Opcode.IF_NEZ &&
        (sc[startCall + 1] as OneRegisterInstruction).registerA == (sc[startCall + 2] as OneRegisterInstruction).registerA,
        "startup gate operand", startup)
    val gateImpls = mutableListOf<String>()
    classDefForEach { if (gateInterface in it.interfaces) gateImpls.add(it.type) }
    guard(gateImpls.size == 1, "unique UI gate implementation", gateInterface)
    val gates = classDefBy(gateImpls.single())
    guard(AccessFlags.PUBLIC.isSet(gates.accessFlags), "public gate implementation", gates.type)
    val gateCtor = gates.methods.single { it.name == "<init>" }
    guard(gateCtor.code().last().opcode == Opcode.RETURN_VOID && gateCtor.code().count { it.opcode == Opcode.RETURN_VOID } == 1,
        "gate constructor exit", gateCtor)
    listOf(startGate, trackCall).forEach { call -> guard(classDefBy(gateInterface).methods.any {
        it.toString() == call.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) }, "public UI gate method", call) }
    guard(trackerCtor.code().last().opcode == Opcode.RETURN_VOID, "tracker constructor exit", trackerCtor)

    val inserts = mutableListOf<NativePreviewInsert>()
    fun insert(method: MutableMethod, index: Int, text: String, vararg opcodes: Opcode) {
        inserts.add(NativePreviewInsert(method, index, text.trimIndent(), opcodes.toList()))
    }
    fun call(method: MutableMethod, index: Int, reg: Int, helper: String) = insert(method, index,
        "invoke-static/range { v$reg .. v$reg }, $EXT->$helper(Ljava/lang/Object;)V", Opcode.INVOKE_STATIC_RANGE)
    val aggregate = mutable(aggregates.single())
    val aggregateBody = aggregate.code()
    call(aggregate, 1, (aggregateBody[0] as TwoRegisterInstruction).registerA, "captureInitialProviders")
    val emptyResult = (aggregateBody.last() as OneRegisterInstruction).registerA
    insert(aggregate, aggregateBody.lastIndex, """
        invoke-static { }, $EXT->queryUnselectedInitialProvider()Ljava/lang/Object;
        move-result-object v$emptyResult
        check-cast v$emptyResult, ${plan.modelField.type}
    """, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST)
    insert(mutable(previewCtor), previewCtor.code().lastIndex,
        "invoke-static { p0, p${previewCtor.parameterTypes.indexOf(provider) + 1} }, $EXT->registerPreview(Ljava/lang/Object;Ljava/lang/Object;)V", Opcode.INVOKE_STATIC)
    insert(writeback, conversion + 1, """
        invoke-static { v$modelRegister, v$energyRegister }, $EXT->previewEnergyWh(Ljava/lang/Object;I)I
        move-result v$energyRegister
    """, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT)
    // Refresh before either capacity or current energy is read. A later Wh-only
    // substitution would leave the old capacity and wrongly stamp copy ownership.
    insert(writeback, rootRead + 1, """
        invoke-static/range { v$modelRegister .. v$modelRegister }, $EXT->refreshPreviewModel(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$modelRegister
        check-cast v$modelRegister, ${plan.modelField.type}
    """, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST)
    call(writeback, copy, modelRegister, "onCopyInput")
    call(writeback, cast + 1, modelRegister, "onCopyResult")
    call(writeback, modelStore + 1, modelRegister, "onPreviewRequestModel")
    insert(initial, producer, "invoke-static { }, $EXT->beginInitialModelSelection()V", Opcode.INVOKE_STATIC)
    insert(clone, 0, "invoke-static/range { p1 .. p1 }, $EXT->recordInitialModelSelection(Z)V", Opcode.INVOKE_STATIC_RANGE)
    // Preserve an explicit false provider selection. Only this synchronous query's
    // observed true selection can use the fresh, owned cache while delivery lags.
    insert(initial, nullGuard, """
        invoke-static { }, $EXT->finishInitialModelSelection()Z
        move-result v$attachReg
        invoke-static { v$initialReg, v$attachReg }, $EXT->filterInitialRequestModel(Ljava/lang/Object;Z)Ljava/lang/Object;
        move-result-object v$initialReg
        check-cast v$initialReg, ${plan.modelField.type}
        invoke-static { v$initialReg, v$attachReg }, $EXT->onInitialRequestContext(Ljava/lang/Object;Z)V
        const/4 v$attachReg, 0x0
    """, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.CONST_4)
    call(initial, initialStore + 1, initialReg, "onInitialRequestModel")
    call(clone, source + 1, sourceReg, "onCopyInput")
    call(plan.publisher, publishAt, envelopeReg, "onProviderEnvelope")
    cc.indices.filter { cc[it].opcode == Opcode.RETURN_OBJECT }.forEach {
        call(clone, it, (cc[it] as OneRegisterInstruction).registerA, "onPublishedModel")
    }
    // Maps' demo-setting collector is the only native-model writer outside its owner. It clears
    // the slot our registration seeded and republishes; re-seed only after that same-object call.
    val clearSites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { cls -> if (cls.type != owner.type) cls.methods.forEach { method ->
        val code = method.implementation?.instructions?.toList() ?: return@forEach
        code.indices.filter { code[it].opcode == Opcode.IPUT_OBJECT && code[it].field()?.toString() == plan.modelField.toString() }
            .forEach { clearSites.add(method to it) }
    } }
    guard(clearSites.size == 1, "unique external native model writer", plan.modelField)
    val (clearDef, clearStore) = clearSites.single()
    val cw = clearDef.code()
    guard(clearStore in 2..cw.size - 4, "external native model writer bounds", clearDef)
    val clearTarget = (cw[clearStore] as TwoRegisterInstruction).registerB
    val clearCopy = cw[clearStore - 2] as? TwoRegisterInstruction
    val clearPublish = cw[clearStore + 2]
    val clearReceiver = clearPublish.invokeRegisters()?.singleOrNull()
    guard(cw[clearStore - 2].opcode == Opcode.MOVE_OBJECT && clearCopy?.registerA == clearTarget &&
        clearReceiver != null && clearCopy.registerB == clearReceiver && clearReceiver <= 65535 &&
        listOf(clearStore - 1 to clearTarget, clearStore + 1 to clearReceiver).all { (index, register) ->
            cw[index].opcode == Opcode.CHECK_CAST && cw[index].getReference<TypeReference>()?.type == owner.type &&
                (cw[index] as OneRegisterInstruction).registerA == register } &&
        clearPublish.opcode == Opcode.INVOKE_VIRTUAL && clearPublish.call()?.toString() == plan.publisher.toString() &&
        cw[clearStore + 3].opcode in listOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) &&
        clearDef.incomingTargets().none { it in (clearStore - 1)..(clearStore + 3) },
        "external writer stores then republishes the same native owner", clearDef)
    call(mutable(clearDef), clearStore + 3, clearReceiver!!, "onNativeModelCleared")
    insert(mutable(gateCtor), gateCtor.code().lastIndex,
        "invoke-static/range { p0 .. p0 }, $EXT->registerGates(Ljava/lang/Object;)V", Opcode.INVOKE_STATIC_RANGE)
    insert(mutable(trackerCtor), trackerCtor.code().lastIndex,
        "invoke-static/range { p0 .. p0 }, $EXT->registerTracker(Ljava/lang/Object;)V", Opcode.INVOKE_STATIC_RANGE)
    val startReg = (sc[startCall + 1] as OneRegisterInstruction).registerA
    insert(startup, startCall + 2,
        "invoke-static/range { v$startReg .. v$startReg }, $EXT->onTrackerStart(Z)V", Opcode.INVOKE_STATIC_RANGE)
    val schema = listOf(battery.name, current.name, capacity.name, number.name).joinToString(",") + ";" +
        listOf(provider.removePrefix("L").removeSuffix(";").replace('/', '.'), query.name,
            gateInterface.removePrefix("L").removeSuffix(";").replace('/', '.'), startGate.name, trackCall.name).joinToString(",")
    val cloneSchema = listOf(clone.definingClass.removePrefix("L").removeSuffix(";").replace('/', '.'),
        cloneApi.name, envelope.removePrefix("L").removeSuffix(";").replace('/', '.')).joinToString(",")
    return NativePreviewPlan(getter, schema, cloneSchema, startGate, trackCall, inserts, scratch, aggregate)
}
