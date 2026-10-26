package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val GUIDANCE_UI = "Lapp/morphe/extension/maps/patches/BydNativeGuidanceUi;"
private const val GUIDANCE_TEXT = "Ljava/lang/CharSequence;"
private fun Instruction.guidanceCall() = getReference<MethodReference>()
private fun Instruction.guidanceField() = getReference<FieldReference>()
private fun Method.guidanceCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing native guidance UI implementation: $this")
private fun guidanceGuard(ok: Boolean, reason: String, subject: Any) {
    if (!ok) throw PatchException("Unrecognized native guidance UI layout: $reason in $subject")
}
private fun String.guidanceName() = removePrefix("L").removeSuffix(";").replace('/', '.')
private fun List<Instruction>.guidanceTarget(index: Int): Int {
    val address = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var cursor = 0
    return indices.singleOrNull { val found = cursor == address; cursor += get(it).codeUnits; found }
        ?: throw PatchException("Invalid native guidance UI branch target")
}
private fun Method.guidanceBranches() {
    val code = guidanceCode()
    code.indices.filter { code[it] is OffsetInstruction }.forEach { code.guidanceTarget(it) }
    var address = 0
    code.forEachIndexed { index, instruction ->
        if (instruction is SwitchPayload) {
            guidanceGuard(address % 2 == 0, "aligned original switch payload", this)
            val switch = code.indices.singleOrNull { code[it].opcode in setOf(Opcode.PACKED_SWITCH,
                Opcode.SPARSE_SWITCH) && code.guidanceTarget(it) == index }
                ?: throw PatchException("Missing unique native guidance UI switch owner")
            val switchAddress = code.take(switch).sumOf { it.codeUnits }
            instruction.switchElements.forEach { element ->
                val target = switchAddress + element.offset
                var current = 0
                guidanceGuard(code.any { ins -> val hit = current == target && ins !is PayloadInstruction;
                    current += ins.codeUnits; hit }, "valid original switch case target", this)
            }
        }
        address += instruction.codeUnits
    }
}

/** Every index a branch or switch case enters. */
private fun List<Instruction>.guidanceEntered(): Set<Int> = indices.filter { this[it] is OffsetInstruction }.flatMap { at ->
    val target = guidanceTarget(at)
    val payload = this[target] as? SwitchPayload ?: return@flatMap listOf(target)
    val base = take(at).sumOf { it.codeUnits }
    payload.switchElements.mapNotNull { element ->
        var address = 0
        indices.firstOrNull { val hit = address == base + element.offset; address += this[it].codeUnits; hit }
    }
}.toSet()

/** Decorate the existing mobile duration value before Maps binds its original TextView. */
internal class NativeGuidanceUiPlan internal constructor(
    val schema: String,
    private val binding: MutableMethod,
    private val insert: Int,
    private val ownerRegister: Int,
    private val textRegister: Int,
    private val calculatorWrapper: MutableMethod,
    private val providerSite: MutableMethod,
    private val providerField: String,
    private val stateCallback: MutableMethod,
    private val eta: NativeGuidanceEtaPlan,
) {
    val methods = listOf(binding, calculatorWrapper, providerSite, stateCallback) + eta.methods

    fun inject() {
        val before = binding.guidanceCode()
        val registers = binding.implementation!!.registerCount
        guidanceGuard(before[insert - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (before[insert - 1] as OneRegisterInstruction).registerA == textRegister &&
            before.exitAt(insert)?.opcode == Opcode.RETURN_OBJECT &&
            (before.exitAt(insert) as OneRegisterInstruction).registerA == textRegister,
            "duration binding still has its original result and exit", binding)
        checkedNativeInsert(binding, insert, """
            invoke-static { v$ownerRegister, v$textRegister }, $GUIDANCE_UI->decorate(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
            move-result-object v$textRegister
        """.trimIndent(), listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT))
        val after = binding.guidanceCode()
        guidanceGuard(after.size == before.size + 2 && after.sumOf { it.codeUnits } ==
            before.sumOf { it.codeUnits } + 4 && binding.implementation!!.registerCount == registers &&
            after[insert].guidanceCall()?.toString() ==
                "$GUIDANCE_UI->decorate(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;" &&
            after[insert].invokeRegisters() == listOf(ownerRegister, textRegister) &&
            (after[insert + 1] as OneRegisterInstruction).registerA == textRegister &&
            after.count { it.guidanceCall()?.definingClass == GUIDANCE_UI } == 1,
            "one original duration result augmentation with unchanged registers", binding)
        binding.guidanceBranches()
        eta.inject()

        // Observe the actual converter/mapper used by the existing preview, so
        // navigation uses Maps' calibration and integer display semantics too.
        val original = calculatorWrapper.guidanceCode()
        val count = calculatorWrapper.implementation!!.registerCount
        val receiver = count - calculatorWrapper.parameterTypes.size - 1
        checkedNativeInsert(calculatorWrapper, 0, """
            invoke-static/range { v$receiver .. v$receiver }, $GUIDANCE_UI->registerCalculator(Ljava/lang/Object;)V
            nop
        """.trimIndent(), listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP))
        val registered = calculatorWrapper.guidanceCode()
        guidanceGuard(registered.size == original.size + 2 && registered.sumOf { it.codeUnits } ==
            original.sumOf { it.codeUnits } + 4 && calculatorWrapper.implementation!!.registerCount == count &&
            registered[0].invokeRegisters() == listOf(receiver) &&
            registered[0].guidanceCall()?.toString() == "$GUIDANCE_UI->registerCalculator(Ljava/lang/Object;)V" &&
            registered.count { it.guidanceCall()?.definingClass == GUIDANCE_UI } == 1,
            "observe original converter receiver without changing its result", calculatorWrapper)
        calculatorWrapper.guidanceBranches()

        // The converter is a lazily created DI singleton that only the route preview requests.
        // Pass its scoped provider on, right after Maps stores it, so search -> Start can ask
        // the same provider for the same instance.
        val providerOriginal = providerSite.guidanceCode()
        val providerRegisters = providerSite.implementation!!.registerCount
        val put = providerOriginal.indices.singleOrNull { providerOriginal[it].opcode == Opcode.IPUT_OBJECT &&
            providerOriginal[it].guidanceField()?.toString() == providerField }
            ?: throw PatchException("Missing unique native converter provider store in $providerSite")
        val provided = (providerOriginal[put] as TwoRegisterInstruction).registerA
        val entered = mutableSetOf<Int>()
        providerOriginal.indices.filter { providerOriginal[it] is OffsetInstruction }.forEach { at ->
            val target = providerOriginal.guidanceTarget(at)
            val payload = providerOriginal[target] as? SwitchPayload
            if (payload == null) entered.add(target) else {
                val base = providerOriginal.take(at).sumOf { it.codeUnits }
                payload.switchElements.forEach { element ->
                    var address = 0
                    providerOriginal.indices.firstOrNull { val hit = address == base + element.offset
                        address += providerOriginal[it].codeUnits; hit }?.let(entered::add)
                }
            }
        }
        guidanceGuard(put + 1 !in entered && providerSite.implementation!!.tryBlocks.none { block ->
            block.exceptionHandlers.any { handler -> providerOriginal.take(put + 1).sumOf { it.codeUnits } == handler.handlerCodeAddress } },
            "no branch or handler enters between the provider store and the next original instruction", providerSite)
        checkedNativeInsert(providerSite, put + 1, """
            invoke-static/range { v$provided .. v$provided }, $GUIDANCE_UI->registerCalculatorProvider(Ljava/lang/Object;)V
            nop
        """.trimIndent(), listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP))
        val stored = providerSite.guidanceCode()
        guidanceGuard(stored.size == providerOriginal.size + 2 && stored.sumOf { it.codeUnits } ==
            providerOriginal.sumOf { it.codeUnits } + 4 && providerSite.implementation!!.registerCount == providerRegisters &&
            stored[put].guidanceField()?.toString() == providerField && stored[put + 1].invokeRegisters() == listOf(provided) &&
            stored[put + 1].guidanceCall()?.toString() == "$GUIDANCE_UI->registerCalculatorProvider(Ljava/lang/Object;)V" &&
            stored.count { it.guidanceCall()?.definingClass == GUIDANCE_UI } == 1,
            "pass the stored converter provider on without changing the original store", providerSite)
        providerSite.guidanceBranches()

        // Capture the callback's current frame before the original summary
        // binding. This does not depend on diagnostics or a later tracker tick.
        val stateOriginal = stateCallback.guidanceCode()
        val stateRegisters = stateCallback.implementation!!.registerCount
        val stateReceiver = stateRegisters - 4
        checkedNativeInsert(stateCallback, 0, """
            invoke-static/range { v$stateReceiver .. v${stateReceiver + 1} }, $GUIDANCE_UI->captureState(Ljava/lang/Object;Ljava/lang/Object;)V
            nop
        """.trimIndent(), listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.NOP))
        val stateAfter = stateCallback.guidanceCode()
        guidanceGuard(stateAfter.size == stateOriginal.size + 2 && stateAfter.sumOf { it.codeUnits } ==
            stateOriginal.sumOf { it.codeUnits } + 4 && stateCallback.implementation!!.registerCount == stateRegisters &&
            stateAfter[0].invokeRegisters() == listOf(stateReceiver, stateReceiver + 1) &&
            stateAfter[0].guidanceCall()?.toString() == "$GUIDANCE_UI->captureState(Ljava/lang/Object;Ljava/lang/Object;)V" &&
            stateAfter.count { it.guidanceCall()?.definingClass == GUIDANCE_UI } == 1,
            "capture original owner/current state before summary without changing values", stateCallback)
        stateCallback.guidanceBranches()
    }
}

/** Resolve the normal Maps summary and read-only current-state route chain before mutation. */
internal fun BytecodePatchContext.resolveNativeGuidanceUi(): NativeGuidanceUiPlan {
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
        it.toString() == method.toString()
    }
    fun matches(predicate: (Method) -> Boolean): List<Method> {
        val found = mutableListOf<Method>()
        classDefForEach { cls -> cls.methods.filterTo(found) { it.implementation != null && predicate(it) } }
        return found
    }
    fun unique(found: List<Method>, purpose: String): Method = found.singleOrNull()
        ?: throw PatchException("Expected unique native guidance UI $purpose, found ${found.size}: $found")
    fun member(ref: MethodReference): Method = classDefBy(ref.definingClass).methods.singleOrNull {
        it.name == ref.name && it.parameterTypes == ref.parameterTypes && it.returnType == ref.returnType
    } ?: throw PatchException("Missing native guidance UI member: $ref")
    fun inherited(ref: MethodReference): Method {
        var type: String? = ref.definingClass
        val seen = mutableSetOf<String>()
        while (type != null && type != "Ljava/lang/Object;" && seen.add(type)) {
            val cls = classDefBy(type)
            cls.methods.singleOrNull { it.name == ref.name && it.parameterTypes == ref.parameterTypes &&
                it.returnType == ref.returnType }?.let { return it }
            type = cls.superclass
        }
        throw PatchException("Missing inherited native guidance calculator member: $ref")
    }
    fun publicField(ref: FieldReference) {
        val field = classDefBy(ref.definingClass).fields.singleOrNull { it.name == ref.name && it.type == ref.type }
            ?: throw PatchException("Missing native guidance UI field: $ref")
        guidanceGuard(AccessFlags.PUBLIC.isSet(field.accessFlags) && AccessFlags.FINAL.isSet(field.accessFlags) &&
            !AccessFlags.STATIC.isSet(field.accessFlags), "public final read-only state field", ref)
    }
    fun reaches(type: String, target: String, seen: MutableSet<String> = mutableSetOf()): Boolean =
        type == target || (seen.add(type) && classDefBy(type).interfaces.any { reaches(it, target, seen) })

    val shared = uniqueMapsHook(Fingerprint(returnType = "V", parameters = listOf("L", "L", "Z"),
        strings = listOf("SharedGuidedNavViewModelImpl.onNavigationUiStateChanged")),
        "native guidance shared callback")!!
    val sharedClass = classDefBy(shared.definingClass)
    val sharedApi = sharedClass.interfaces.singleOrNull()
        ?: throw PatchException("Missing unique shared native guidance API")
    val sc = shared.guidanceCode()
    val sr = shared.implementation!!.registerCount - 4
    guidanceGuard(!AccessFlags.STATIC.isSet(shared.accessFlags) && shared.parameterTypes[0] == shared.parameterTypes[1] &&
        sc.take(6).map { it.opcode } == listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16,
            Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IGET_OBJECT) &&
        (sc[0] as TwoRegisterInstruction).registerB == sr &&
        (sc[1] as TwoRegisterInstruction).registerB == sr + 1 &&
        (sc[5] as TwoRegisterInstruction).registerB == (sc[1] as TwoRegisterInstruction).registerA,
        "original receiver/current-state route branch", shared)
    val currentState = sc[5].guidanceField()!!
    guidanceGuard(currentState.definingClass == shared.parameterTypes[0], "current state owns navigation snapshot", currentState)
    publicField(currentState)

    val textReads = sc.indices.filter { sc[it].opcode == Opcode.IGET_OBJECT &&
        sc[it].guidanceField()?.let { it.definingClass == sharedClass.type && it.type == GUIDANCE_TEXT } == true }
    guidanceGuard(textReads.size == 3 && textReads.map { sc[it].guidanceField().toString() }.distinct().size == 3,
        "duration/distance/header shared text reads", shared)
    val durationField = sc[textReads.first()].guidanceField()!!
    val durationRegister = (sc[textReads.first()] as TwoRegisterInstruction).registerA
    val concat = sc.indices.singleOrNull { sc[it].guidanceCall()?.toString() ==
        "Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;" }
        ?: throw PatchException("Missing original duration/header concatenation")
    val elements = (textReads.last() + 1 until concat).filter { sc[it].opcode == Opcode.APUT_OBJECT }
    guidanceGuard(elements.size == 3 && (sc[elements.first()] as ThreeRegisterInstruction).registerA == durationRegister &&
        sc.any { it.opcode == Opcode.IPUT_OBJECT && it.guidanceField()?.toString() == durationField.toString() &&
            (it as TwoRegisterInstruction).registerA == durationRegister },
        "same duration value reaches summary concatenation and original duration field", shared)
    val duration = unique(sharedClass.methods.filter { method -> method.implementation != null &&
        method.parameterTypes.isEmpty() && method.returnType == GUIDANCE_TEXT && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
        method.guidanceCode().map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT) &&
        method.guidanceCode()[0].guidanceField()?.toString() == durationField.toString() }, "remaining duration getter")
    val durationCode = duration.guidanceCode()
    guidanceGuard(duration.implementation!!.registerCount == 1 &&
        (durationCode[0] as TwoRegisterInstruction).registerA == (durationCode[1] as OneRegisterInstruction).registerA &&
        (durationCode[0] as TwoRegisterInstruction).registerB == 0, "pure original remaining-duration field getter", duration)
    guidanceGuard(classDefBy(sharedApi).methods.any { it.name == duration.name && it.parameterTypes.isEmpty() &&
        it.returnType == GUIDANCE_TEXT }, "duration declared in original shared binding API", duration)

    val mobile = uniqueMapsHook(Fingerprint(name = "<clinit>", returnType = "V", parameters = emptyList(),
        strings = listOf("MobileGuidedNavViewModelImpl")), "native mobile guidance owner")!!.definingClass
    val mobileClass = classDefBy(mobile)
    val parent = mobileClass.superclass ?: throw PatchException("Missing mobile guidance parent")
    guidanceGuard(classDefBy(parent).superclass == sharedClass.type && AccessFlags.FINAL.isSet(mobileClass.accessFlags),
        "mobile guidance inherits captured shared family", mobile)
    val mobileApi = mobileClass.interfaces.singleOrNull { reaches(it, sharedApi) }
        ?: throw PatchException("Missing unique mobile summary owner API")
    val mobileImplementations = mutableListOf<String>()
    classDefForEach { if (mobileApi in it.interfaces) mobileImplementations.add(it.type) }
    guidanceGuard(mobileImplementations == listOf(mobile), "unique normal mobile summary owner", mobileApi)
    // Different Maps renderer families share this logging label. Select only
    // the labelled layout constructed by the already-proven mobile owner;
    // a label alone must not choose the newer/unrelated renderer by accident.
    val summaries = matches { method -> method.name == "<clinit>" && method.returnType == "V" &&
        method.parameterTypes.isEmpty() && method.guidanceCode().any {
            it.getReference<StringReference>()?.string == "GuidedNavSummaryLayout" }
    }.map { it.definingClass }.toSet()
    guidanceGuard(summaries.isNotEmpty(), "labelled guidance summary candidates exist", mobile)
    val bridge = unique(mobileClass.methods.filter { method -> method.implementation != null &&
        method.parameterTypes.isEmpty() && method.guidanceCode().any { it.opcode == Opcode.NEW_INSTANCE &&
            it.getReference<TypeReference>()?.type in summaries } }, "mobile owner labelled summary bridge")
    val bc = bridge.guidanceCode()
    guidanceGuard(bc.size == 8, "complete labelled mobile summary bridge shape", bridge)
    val summary = bc.filter { it.opcode == Opcode.NEW_INSTANCE &&
        it.getReference<TypeReference>()?.type in summaries }.singleOrNull()?.getReference<TypeReference>()?.type
        ?: throw PatchException("Missing unique normal summary constructed by mobile owner: $bridge")
    val summaryRegister = (bc[2] as? OneRegisterInstruction)?.registerA ?: -1
    val flagRegister = (bc[3] as? OneRegisterInstruction)?.registerA ?: -1
    val outputRegister = (bc[5] as? OneRegisterInstruction)?.registerA ?: -1
    val summaryWrapper = bc[6].guidanceCall()
    guidanceGuard(bc.map { it.opcode } == listOf(Opcode.SGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.NEW_INSTANCE,
        Opcode.CONST_4, Opcode.INVOKE_DIRECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT) &&
        bc[4].guidanceCall()?.let { it.definingClass == summary && it.name == "<init>" && it.parameterTypes == listOf("Z") } == true &&
        bc[4].invokeRegisters() == listOf(summaryRegister, flagRegister) &&
        (bc[3] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        summaryWrapper?.let { it.name == "<init>" && it.definingClass == bridge.returnType &&
            it.parameterTypes.size == 3 && it.parameterTypes.first() == classDefBy(summary).superclass &&
            it.parameterTypes.last() == "Z" } == true &&
        bc[5].getReference<TypeReference>()?.type == bridge.returnType &&
        bc[6].invokeRegisters() == listOf(outputRegister, summaryRegister,
            bridge.implementation!!.registerCount - 1, flagRegister) &&
        (bc[7] as OneRegisterInstruction).registerA == outputRegister,
        "summary is constructed with the original mobile viewmodel", bridge)
    val bindingType = bc[6].guidanceCall()!!.parameterTypes[1].toString()
    val binding = unique(matches { method -> method.parameterTypes == listOf(bindingType) &&
        method.returnType == "Ljava/lang/Object;" && method.guidanceCode().any {
            it.opcode == Opcode.INVOKE_INTERFACE && it.guidanceCall()?.let { ref -> ref.definingClass == sharedApi &&
                ref.name == duration.name && ref.parameterTypes.isEmpty() && ref.returnType == GUIDANCE_TEXT } == true } &&
        method.guidanceCode().any { it.guidanceField()?.definingClass == summary } }, "normal duration binding")
    val code = binding.guidanceCode()
    val call = code.indices.single { code[it].guidanceCall()?.let { ref -> ref.definingClass == sharedApi &&
        ref.name == duration.name && ref.parameterTypes.isEmpty() && ref.returnType == GUIDANCE_TEXT } == true }
    val cast = code[call - 1]
    val result = code[call + 1]
    // R8 may end the duration case with a goto to the shared return (26.42). Only the duration
    // call may reach that goto, so the decoration inserted before it runs for this case alone.
    val returned = code.exitAt(call + 2) ?: code[call + 2]
    val mergedExit = code[call + 2].opcode != Opcode.RETURN_OBJECT
    val owner = binding.implementation!!.registerCount - 1
    val text = (result as? OneRegisterInstruction)?.registerA ?: -1
    guidanceGuard(!AccessFlags.STATIC.isSet(binding.accessFlags) && binding.implementation!!.tryBlocks.isEmpty() &&
        owner in 0..15 && text in 0..15 && owner != text && cast.opcode == Opcode.CHECK_CAST &&
        cast.getReference<TypeReference>()?.type == mobileApi && (cast as OneRegisterInstruction).registerA == owner &&
        code[call].invokeRegisters() == listOf(owner) && result.opcode == Opcode.MOVE_RESULT_OBJECT &&
        returned.opcode == Opcode.RETURN_OBJECT && (returned as OneRegisterInstruction).registerA == text &&
        (!mergedExit || call + 2 !in code.guidanceEntered()) &&
        code.count { it.opcode == Opcode.PACKED_SWITCH } == 1 &&
        code.count { it.opcode == Opcode.PACKED_SWITCH_PAYLOAD } == 1 &&
        code.none { it.opcode in setOf(Opcode.SPARSE_SWITCH, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.FILL_ARRAY_DATA, Opcode.ARRAY_PAYLOAD) },
        "original mobile duration receiver/result/switch exit flow", binding)
    binding.guidanceBranches()

    // The state selector's existing getters reduce to these public final fields.
    // Java snapshots this chain at the already-hooked shared callback entry,
    // before Maps dispatches its normal binding; decoration reads the captured frame.
    val routeRead = sc.indices.firstOrNull { sc[it].opcode == Opcode.IGET_OBJECT &&
        sc[it].guidanceField()?.let { it.definingClass != sharedClass.type && it.type.startsWith("L") } == true &&
        sc.getOrNull(it - 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        sc.getOrNull(it - 2)?.guidanceCall()?.definingClass == currentState.type }
        ?: throw PatchException("Missing computed current guidance route holder")
    val routeHolderCall = sc[routeRead - 2].guidanceCall()!!
    val routeWrapper = sc[routeRead].guidanceField()!!
    val holderCode = member(routeHolderCall).guidanceCode()
    guidanceGuard(holderCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) && holderCode[0].guidanceField()?.definingClass == currentState.type &&
        holderCode[1].guidanceCall()?.returnType == routeWrapper.definingClass,
        "navigation holder getter only reads and selects existing route state", routeHolderCall)
    val selector = holderCode[0].guidanceField()!!
    val selected = member(holderCode[1].guidanceCall()!!)
    val selectedCode = selected.guidanceCode()
    guidanceGuard(selectedCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST,
        Opcode.IGET, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
        Opcode.CHECK_CAST, Opcode.RETURN_OBJECT) &&
        selectedCode[4].guidanceCall()?.toString() == "Ljava/util/List;->get(I)Ljava/lang/Object;" &&
        selectedCode[6].getReference<TypeReference>()?.type == routeWrapper.definingClass,
        "selected route is existing indexed route list element", selected)
    val position = selectedCode[0].guidanceField()!!
    val positionType = selectedCode[1].getReference<TypeReference>()!!.type
    val selectedIndex = selectedCode[2].guidanceField()!!
    val routeList = selectedCode[3].guidanceField()!!
    guidanceGuard(position.definingClass == selector.type && routeList.definingClass == selector.type &&
        routeList.type == "Ljava/util/List;" && selectedIndex.definingClass == positionType && selectedIndex.type == "I" &&
        routeHolderCall.returnType == routeWrapper.definingClass &&
        (selectedCode[2] as TwoRegisterInstruction).registerB == (selectedCode[1] as OneRegisterInstruction).registerA &&
        selectedCode[4].invokeRegisters() == listOf((selectedCode[3] as TwoRegisterInstruction).registerA,
            (selectedCode[2] as TwoRegisterInstruction).registerA), "typed current route list/index/wrapper flow", selected)
    listOf(selector, position, selectedIndex, routeList, routeWrapper).forEach(::publicField)

    val arrival = uniqueMapsHook(Fingerprint(name = "toString", returnType = "Ljava/lang/String;",
        parameters = emptyList(), strings = listOf("BatteryOnArrival(batteryLevel=")), "guidance arrival DTO")!!.definingClass
    val converter = uniqueMapsHook(Fingerprint(returnType = arrival,
        parameters = listOf("L", "I", "Z", "Ljava/lang/Integer;"),
        strings = listOf("Invalid number for destinationIndex: %d, needs to be [0, %d).")), "guidance leg converter")!!
    val calculatorWrapper = unique(classDefBy(converter.definingClass).methods.filter { method -> method.implementation != null &&
        method.parameterTypes == listOf(converter.parameterTypes[0].toString(), "I") && method.returnType == arrival &&
        method.guidanceCode().count { it.guidanceCall()?.toString() == converter.toString() } == 1 }, "original phone leg wrapper")
    val protoConverter = unique(classDefBy(converter.definingClass).methods.filter { method -> method.implementation != null &&
        method.returnType == arrival && method.parameterTypes.size == 3 && method.parameterTypes.drop(1) == listOf("Z", "Ljava/lang/Integer;") },
        "native per-leg arrival energy conversion")
    val pc = protoConverter.guidanceCode()
    guidanceGuard(pc.size == 25 && pc[16].opcode == Opcode.IGET_OBJECT && pc[17].opcode == Opcode.INVOKE_STATIC &&
        pc[18].opcode == Opcode.MOVE_RESULT_OBJECT && pc[21].opcode == Opcode.INVOKE_DIRECT,
        "existing arrival converter reads mapper for original Maps calculator", protoConverter)
    val mapper = pc[16].guidanceField()!!
    val percentageCall = pc[17].guidanceCall()!!
    val percentage = member(percentageCall)
    val percentageCode = percentage.guidanceCode()
    guidanceGuard(mapper.definingClass == converter.definingClass &&
        percentageCall.parameterTypes == listOf("I", "I", mapper.type) &&
        pc[17].invokeRegisters()?.last() == (pc[16] as TwoRegisterInstruction).registerA &&
        AccessFlags.PUBLIC.isSet(percentage.accessFlags) && AccessFlags.STATIC.isSet(percentage.accessFlags) &&
        percentageCode.none { it.opcode.name.startsWith("IPUT") || it.opcode.name.startsWith("SPUT") } &&
        percentageCode.zipWithNext().any { (enter, read) -> enter.opcode == Opcode.MONITOR_ENTER &&
            read.opcode == Opcode.IGET_OBJECT && read.guidanceField()?.definingClass == mapper.type &&
            (read as TwoRegisterInstruction).registerB == (enter as OneRegisterInstruction).registerA } &&
        percentageCode[percentageCode.lastIndex - 1].guidanceCall()?.let {
            it.name == "<init>" && it.parameterTypes == listOf("I", "I", "D", "D", "I") &&
                it.definingClass == percentageCall.returnType } == true &&
        percentageCode.last().opcode == Opcode.RETURN_OBJECT,
        "original static Maps display calculator reads synchronized mapper and produces local battery DTO", percentage)
    val mapperDeclaration = classDefBy(mapper.definingClass).fields.singleOrNull { it.name == mapper.name && it.type == mapper.type }
        ?: throw PatchException("Missing original native display mapper field")
    guidanceGuard(AccessFlags.FINAL.isSet(mapperDeclaration.accessFlags) && !AccessFlags.STATIC.isSet(mapperDeclaration.accessFlags) &&
        AccessFlags.PUBLIC.isSet(classDefBy(mapper.type).accessFlags), "actual converter retains original mapper holder", mapper)

    // The calibration branch is a binary search with a fixed R8 Function1
    // discriminator. Other branches of that shared synthetic are unrelated;
    // prove that the constructor argument selects only its pure knot comparison.
    val searchAt = percentageCode.indices.singleOrNull { percentageCode[it].guidanceCall()?.let { call ->
        call.parameterTypes == listOf("Ljava/util/List;", "I", "Lkotlin/jvm/functions/Function1;") && call.returnType == "I"
    } == true } ?: throw PatchException("Missing unique original calibration search")
    val searchCall = percentageCode[searchAt].guidanceCall()!!
    val search = inherited(searchCall)
    val searchCode = search.guidanceCode()
    // R8 may write the miss result into the hit register and share one return (26.42).
    val sharedSearchReturn = searchCode.size == 25 && searchCode.count { it.opcode == Opcode.RETURN } == 1 &&
        searchCode[24].opcode == Opcode.RETURN && searchCode[19].opcode == Opcode.IF_LEZ &&
        searchCode.guidanceTarget(19) == 24 && searchCode[8].opcode == Opcode.USHR_INT_LIT8 &&
        searchCode[23].opcode == Opcode.NEG_INT && (searchCode[24] as OneRegisterInstruction).registerA ==
            (searchCode[8] as TwoRegisterInstruction).registerA &&
        (searchCode[23] as TwoRegisterInstruction).registerA == (searchCode[24] as OneRegisterInstruction).registerA
    val comparisonCtorAt = searchAt - 1
    val discriminatorAt = comparisonCtorAt - 1
    val discriminator = (percentageCode.getOrNull(discriminatorAt) as? NarrowLiteralInstruction)?.narrowLiteral
        ?: throw PatchException("Missing original calibration discriminator")
    guidanceGuard(percentageCode[discriminatorAt].opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) &&
        percentageCode[comparisonCtorAt].guidanceCall()?.parameterTypes == listOf("Ljava/lang/Object;", "I") &&
        percentageCode[comparisonCtorAt].invokeRegisters()?.last() == (percentageCode[discriminatorAt] as OneRegisterInstruction).registerA &&
        percentageCode[searchAt].invokeRegisters()?.last() == percentageCode[comparisonCtorAt].invokeRegisters()?.first() &&
        searchCall.parameterTypes == listOf("Ljava/util/List;", "I", "Lkotlin/jvm/functions/Function1;") && searchCall.returnType == "I" &&
        (searchCode.size == 26 || sharedSearchReturn) &&
        searchCode.none { it.opcode.name.startsWith("IPUT") || it.opcode.name.startsWith("SPUT") } &&
        searchCode[9].guidanceCall()?.toString() == "Ljava/util/List;->get(I)Ljava/lang/Object;" &&
        searchCode[11].guidanceCall()?.toString() == "Lkotlin/jvm/functions/Function1;->a(Ljava/lang/Object;)Ljava/lang/Object;" &&
        (sharedSearchReturn || searchCode[22].opcode == Opcode.RETURN && searchCode[25].opcode == Opcode.RETURN),
        "calibration uses read-only list binary search and fixed comparison callback", percentage)
    val compareType = percentageCode[comparisonCtorAt].guidanceCall()!!.definingClass
    val comparison = unique(classDefBy(compareType).methods.filter { it.parameterTypes == listOf("Ljava/lang/Object;") &&
        it.returnType == "Ljava/lang/Object;" && it.implementation != null }, "calibration knot comparison")
    val comparisonCode = comparison.guidanceCode()
    guidanceGuard(classDefBy(compareType).interfaces == listOf("Lkotlin/jvm/functions/Function1;") &&
        comparisonCode.first().opcode == Opcode.IGET,
        "calibration callback reads its own synthetic discriminator", comparison)
    val discriminatorRegister = (comparisonCode.first() as TwoRegisterInstruction).registerA
    val dispatch = comparisonCode.indices.singleOrNull { comparisonCode[it].opcode in setOf(Opcode.PACKED_SWITCH,
        Opcode.SPARSE_SWITCH) && (comparisonCode[it] as OneRegisterInstruction).registerA == discriminatorRegister }
        ?: throw PatchException("Missing unique native calibration discriminator dispatch")
    guidanceGuard(comparisonCode.subList(1, dispatch).none { instruction ->
        instruction is OffsetInstruction || (instruction.opcode.setsRegister() &&
            (instruction as? OneRegisterInstruction)?.registerA?.let {
                it == discriminatorRegister || (instruction.opcode.setsWideRegister() && it + 1 == discriminatorRegister)
            } == true)
    }, "the stored discriminator reaches its dispatch without a branch or overwrite", comparison)
    val payload = comparisonCode[comparisonCode.guidanceTarget(dispatch)] as? SwitchPayload
        ?: throw PatchException("Missing native calibration switch payload")
    val selectedCase = payload.switchElements.singleOrNull { it.key == discriminator }
        ?: throw PatchException("Calibration discriminator is not an explicit original case: $discriminator")
    val selectedAddress = comparisonCode.take(dispatch).sumOf { it.codeUnits } + selectedCase.offset
    var comparisonAddress = 0
    val comparisonStart = comparisonCode.indices.singleOrNull {
        val hit = comparisonAddress == selectedAddress; comparisonAddress += comparisonCode[it].codeUnits; hit
    } ?: throw PatchException("Invalid calibration comparison target")
    val knotCode = comparisonCode.drop(comparisonStart).take(11)
    guidanceGuard(knotCode.map { it.opcode } == listOf(Opcode.CHECK_CAST, Opcode.IGET,
            Opcode.FLOAT_TO_DOUBLE, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
            Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        knotCode[4].guidanceCall()?.toString() == "Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;" &&
        knotCode[8].guidanceCall()?.toString() == "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;" &&
        knotCode[6].guidanceCall()?.let { it.parameterTypes == listOf("Ljava/lang/Comparable;", "Ljava/lang/Comparable;") &&
            it.returnType == "I" } == true &&
        knotCode[1].guidanceField()?.let { it.definingClass == knotCode[0].getReference<TypeReference>()?.type &&
            it.type == "F" } == true &&
        (knotCode[1] as TwoRegisterInstruction).registerB == (knotCode[0] as OneRegisterInstruction).registerA &&
        (knotCode[2] as TwoRegisterInstruction).registerB == (knotCode[1] as TwoRegisterInstruction).registerA &&
        knotCode[4].invokeRegisters() == listOf((knotCode[2] as TwoRegisterInstruction).registerA,
            (knotCode[2] as TwoRegisterInstruction).registerA + 1) &&
        knotCode[6].invokeRegisters() == listOf((knotCode[5] as OneRegisterInstruction).registerA,
            (knotCode[3] as TwoRegisterInstruction).registerA) &&
        knotCode[8].invokeRegisters() == listOf((knotCode[7] as OneRegisterInstruction).registerA) &&
        (knotCode[9] as OneRegisterInstruction).registerA == (knotCode[10] as OneRegisterInstruction).registerA &&
        knotCode[3].guidanceField()?.definingClass == compareType,
        "actual constructor discriminator enters only the original pure calibration knot comparison", comparison)
    val comparisonCtor = member(percentageCode[comparisonCtorAt].guidanceCall()!!)
    val ctorCode = comparisonCtor.guidanceCode()
    guidanceGuard(ctorCode.count { it.opcode == Opcode.IPUT } == 1 && ctorCode.count { it.opcode == Opcode.IPUT_OBJECT } == 1 &&
        ctorCode.single { it.opcode == Opcode.IPUT }.guidanceField()?.toString() == comparisonCode[0].guidanceField()?.toString() &&
        (ctorCode.single { it.opcode == Opcode.IPUT } as TwoRegisterInstruction).registerA == comparisonCtor.implementation!!.registerCount - 1,
        "comparison constructor stores original fixed discriminator", comparisonCtor)
    guidanceGuard(ctorCode.single { it.opcode == Opcode.IPUT_OBJECT }.guidanceField()?.toString() ==
        knotCode[3].guidanceField()?.toString() &&
        (ctorCode.single { it.opcode == Opcode.IPUT_OBJECT } as TwoRegisterInstruction).registerA ==
            comparisonCtor.implementation!!.registerCount - 2,
        "pure comparison reads exactly the original captured calibration percentage", comparisonCtor)
    val minimumAt = percentageCode.indices.singleOrNull { percentageCode[it].opcode == Opcode.INVOKE_STATIC &&
        percentageCode[it].guidanceCall()?.let { it.parameterTypes == listOf("I", "I") && it.returnType == "I" } == true }
        ?: throw PatchException("Missing original native display percentage clamp")
    guidanceGuard(percentageCode[minimumAt - 2].opcode == Opcode.DOUBLE_TO_INT &&
        (percentageCode[minimumAt - 1] as? NarrowLiteralInstruction)?.narrowLiteral == 100 &&
        percentageCode[minimumAt].invokeRegisters() == listOf(
            (percentageCode[minimumAt - 2] as TwoRegisterInstruction).registerA,
            (percentageCode[minimumAt - 1] as OneRegisterInstruction).registerA),
        "original calibrated double truncates before an upper-only 100-percent clamp", percentage)
    val minimum = member(percentageCode[minimumAt].guidanceCall()!!)
    val minimumCode = minimum.guidanceCode()
    // R8 may move b into a and share one return (26.42): if-le a, b -> return a; a = b; return a.
    val sharedMinimumReturn = minimumCode.map { it.opcode } == listOf(Opcode.IF_LE, Opcode.MOVE, Opcode.RETURN) &&
        (minimumCode[0] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 1 } &&
        (minimumCode[1] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 1 }
    guidanceGuard(minimum.parameterTypes == listOf("I", "I") && minimum.returnType == "I" &&
        (sharedMinimumReturn || minimumCode.map { it.opcode } == listOf(Opcode.IF_LE, Opcode.RETURN, Opcode.RETURN)) &&
        minimumCode.guidanceTarget(0) == 2 && (sharedMinimumReturn || (minimumCode[1] as OneRegisterInstruction).registerA == 1) &&
        (minimumCode[2] as OneRegisterInstruction).registerA == 0 &&
        (!sharedMinimumReturn || AccessFlags.STATIC.isSet(minimum.accessFlags) && minimum.implementation!!.registerCount == 2),
        "native display percentage truncation and upper-only min 100", minimum)
    val level = percentageCall.returnType
    val levelText = uniqueMapsHook(Fingerprint(name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
        strings = listOf("BatteryLevel(batteryLevelWh=", ", displayBatteryPercentage=")), "display battery DTO")!!
    guidanceGuard(levelText.definingClass == level, "calculator returns labelled display battery DTO", percentage)
    val levelCode = levelText.guidanceCode()
    val displayLabel = levelCode.indices.single { levelCode[it].getReference<StringReference>()?.string == ", displayBatteryPercentage=" }
    val display = levelCode[displayLabel + 2].guidanceField()!!
    guidanceGuard(levelCode[displayLabel + 2].opcode == Opcode.IGET && display.definingClass == level && display.type == "I" &&
        levelCode[displayLabel + 3].guidanceCall()?.toString() == "Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;" &&
        levelCode[displayLabel + 3].invokeRegisters()?.last() == (levelCode[displayLabel + 2] as TwoRegisterInstruction).registerA,
        "native display percentage integer label/value flow", levelText)
    publicField(display)
    guidanceGuard(calculatorWrapper.implementation!!.tryBlocks.isEmpty() &&
        calculatorWrapper.guidanceCode().size == 16 && !AccessFlags.STATIC.isSet(calculatorWrapper.accessFlags) &&
        AccessFlags.PUBLIC.isSet(calculatorWrapper.accessFlags),
        "observed original calculator wrapper entry", calculatorWrapper)
    val wc = calculatorWrapper.guidanceCode()
    guidanceGuard(calculatorWrapper.implementation!!.registerCount == 5 && wc.map { it.opcode } == listOf(
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IGET_OBJECT, Opcode.IF_NE,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.GOTO, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.ADD_INT_LIT8, Opcode.CONST_4, Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        wc[0].guidanceCall()?.let { it.definingClass == converter.parameterTypes[0] &&
            it.parameterTypes.isEmpty() && it.returnType == "I" } == true && wc[0].invokeRegisters() == listOf(3) &&
        (wc[1] as OneRegisterInstruction).registerA == 0 &&
        (wc[2] as TwoRegisterInstruction).let { it.registerA == 1 && it.registerB == 2 } &&
        wc[2].guidanceField()?.definingClass == converter.definingClass &&
        (wc[3] as TwoRegisterInstruction).let { it.registerA == 4 && it.registerB == 0 } && wc.guidanceTarget(3) == 7 &&
        listOf(4, 7).all { wc[it].invokeRegisters() == listOf(1) && wc[it].guidanceCall()?.let { call ->
            call.definingClass == wc[2].guidanceField()?.type && call.parameterTypes.isEmpty() && call.returnType == "I"
        } == true } && listOf(5, 8).all { (wc[it] as OneRegisterInstruction).registerA == 0 } &&
        wc.guidanceTarget(6) == 9 && (wc[9] as TwoRegisterInstruction).let { it.registerA == 4 && it.registerB == 4 } &&
        (wc[9] as NarrowLiteralInstruction).narrowLiteral == -1 &&
        (wc[10] as OneRegisterInstruction).registerA == 1 && (wc[10] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        wc[11].guidanceCall()?.toString() == "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;" &&
        wc[11].invokeRegisters() == listOf(0) && (wc[12] as OneRegisterInstruction).registerA == 0 &&
        wc[13].guidanceCall()?.toString() == converter.toString() && wc[13].invokeRegisters() == listOf(2, 3, 4, 1, 0) &&
        (wc[14] as OneRegisterInstruction).registerA == 2 && (wc[15] as OneRegisterInstruction).registerA == 2,
        "one-based destination subtracts exactly one and preserves route/threshold/warning converter operands", calculatorWrapper)
    // Maps builds the converter lazily through one DI provider field; only the route preview asks
    // it first. Find that field by its reads (getter result cast to this converter), then its store.
    val converterType = converter.definingClass
    val moves = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
    val providerReads = mutableSetOf<String>()
    val providerGetters = mutableSetOf<String>()
    classDefForEach { cls -> cls.methods.forEach { method ->
        val body = method.implementation?.instructions?.toList() ?: return@forEach
        for (i in 1 until body.size - 2) {
            val get = body[i].guidanceCall() ?: continue
            val read = body[i - 1]
            val field = read.guidanceField() ?: continue
            if (body[i].opcode != Opcode.INVOKE_INTERFACE || get.parameterTypes.isNotEmpty() ||
                get.returnType != "Ljava/lang/Object;" || read.opcode != Opcode.IGET_OBJECT || field.type != get.definingClass ||
                body[i].invokeRegisters() != listOf((read as TwoRegisterInstruction).registerA) ||
                body[i + 1].opcode != Opcode.MOVE_RESULT_OBJECT) continue
            var castAt = i + 2
            var castRegister = (body[i + 1] as OneRegisterInstruction).registerA
            if (body[castAt].opcode in moves && (body[castAt] as TwoRegisterInstruction).registerB == castRegister) {
                castRegister = (body[castAt] as TwoRegisterInstruction).registerA; castAt++
            }
            val cast = body.getOrNull(castAt) ?: continue
            if (cast.opcode == Opcode.CHECK_CAST && cast.getReference<TypeReference>()?.type == converterType &&
                (cast as OneRegisterInstruction).registerA == castRegister) {
                providerReads.add(field.toString()); providerGetters.add("${field}|${get}")
            }
        }
    } }
    // Injected consumers keep copies of the provider (constructor parameter stores); the component
    // field is the one Maps fills through its scoped wrapper: Scoped.wrap(new provider) -> iput.
    fun scopedStore(field: String, api: String): Pair<Method, Int>? {
        val sites = matches { method -> method.guidanceCode().any {
            it.opcode == Opcode.IPUT_OBJECT && it.guidanceField()?.toString() == field } }
        val site = sites.singleOrNull() ?: return null
        val code = site.guidanceCode()
        val at = code.indices.filter { code[it].opcode == Opcode.IPUT_OBJECT && code[it].guidanceField()?.toString() == field }
            .singleOrNull() ?: return null
        val wrap = code.getOrNull(at - 2)?.guidanceCall() ?: return null
        val scoped = at >= 2 && !AccessFlags.STATIC.isSet(site.accessFlags) && code[at - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (code[at - 1] as OneRegisterInstruction).registerA == (code[at] as TwoRegisterInstruction).registerA &&
            code[at - 2].opcode == Opcode.INVOKE_STATIC && wrap.returnType == api &&
            wrap.parameterTypes.map { it.toString() } == listOf(api) &&
            api in (runCatching { classDefBy(wrap.definingClass).interfaces }.getOrNull() ?: emptyList())
        return if (scoped) site to at else null
    }
    val scopedProviders = providerGetters.mapNotNull { entry ->
        val field = entry.substringBefore("|")
        val api = entry.substringAfter("|").substringBefore("->")
        scopedStore(field, api)?.let { entry to it }
    }
    val (providerEntry, providerStore) = scopedProviders.singleOrNull()
        ?: throw PatchException("Expected one scoped native converter provider among $providerReads, found ${scopedProviders.map { it.first }}")
    val providerField = providerEntry.substringBefore("|")
    val providerGetter = providerEntry.substringAfter("|")
    val providerApi = providerGetter.substringBefore("->")
    val providerName = providerGetter.substringAfter("->").substringBefore("(")
    // The getter may be declared by a super-interface (Dagger Provider); Java resolves it the same way.
    fun declaresGetter(type: String, seen: MutableSet<String> = mutableSetOf()): Boolean {
        if (!seen.add(type)) return false
        val cls = runCatching { classDefBy(type) }.getOrNull() ?: return false
        return AccessFlags.INTERFACE.isSet(cls.accessFlags) && AccessFlags.PUBLIC.isSet(cls.accessFlags) &&
            (cls.methods.any { it.name == providerName && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" &&
                AccessFlags.ABSTRACT.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) } ||
                cls.interfaces.any { declaresGetter(it, seen) })
    }
    guidanceGuard(declaresGetter(providerApi), "converter provider is a public interface with a no-argument getter", providerGetter)
    val providerSite = providerStore.first
    val render = resolveNativeGuidanceRender(arrival, display)
    guidanceGuard(verifyNativeGuidanceDestination(shared, converter.parameterTypes[0].toString()) == 0,
        "native ETA and arrival battery target the same next-stop leg", shared)
    val eta = resolveNativeGuidanceEta(summary)
    val schema = listOf(
        listOf(mobileApi.guidanceName(), mobile.guidanceName(), currentState.definingClass.guidanceName(), currentState.name,
            currentState.type.guidanceName(), selector.name, selector.type.guidanceName(), routeList.name,
            position.name, positionType.guidanceName(), selectedIndex.name, routeWrapper.definingClass.guidanceName(), routeWrapper.name),
        listOf(converter.definingClass.guidanceName(), calculatorWrapper.name, arrival.guidanceName()),
        listOf(providerApi.guidanceName(), providerName),
    ).joinToString(";") { it.joinToString(",") } + "|${render.schema}|${eta.schema}"
    return NativeGuidanceUiPlan(schema, mutable(binding), call + 2, owner, text,
        mutable(calculatorWrapper), mutable(providerSite), providerField, mutable(shared), eta)
}
