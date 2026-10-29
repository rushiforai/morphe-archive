package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.util.logging.Logger

private const val NATIVE = "Lapp/morphe/extension/maps/patches/BydNativeBatteryPatch;"
private const val DEFAULT_NOMINAL_WH = 50250
private const val DEFAULT_ROLLING_N = 160f
private const val DEFAULT_LINEAR_N = 0f
private const val DEFAULT_DRAG_N = 0.35f
private val log = Logger.getLogger("app.morphe.patches.maps.BydNativeBatteryPatch")

@Suppress("unused")
val bydNativeBatteryPatch = bytecodePatch(
    name = "BYD native battery experiment",
    description = "Experimental: sends this BYD's battery and road-load model to Google through Maps' " +
        "native EV route requests. Starts from the car's own average consumption, learns slowly from " +
        "BMS energy/distance, and adds in-app vehicle settings. Native hooks inspected on Maps 26.41 and 26.42. " +
        "Targets BYD DiLink 3; DiLink 5 unverified.",
    default = false,
) {
    compatibleWith(compatibility)
    dependsOn(googleMapsMicroGPatch, mapsSettingsRowsPatch)
    val guidanceBattery = booleanOption("guidanceBattery", default = true,
        title = "Arrival battery during navigation",
        description = "Experimental: shows an inline battery icon and Google's arrival percentage after ETA.")

    execute {
        // All layouts, accessibility and operand flows must pass before any mutation.
        val plan = resolveNativeBattery()
        val progress = resolveNavigationProgress()
        val route = labelledField(progress.progressGetter.returnType, "route", null)
        requireAccessibleField(progress.listener.definingClass, route)
        val forecast = resolveNativeForecast(progress, route)
        val preview = resolveNativePreview(plan, forecast.method)
        val tracker = resolveNativeTracker(forecast.method, preview.startupGate, preview.trackingGate)
        val diagnostics = resolveNativeDiagnostics(plan, forecast.legs)
        val previewDiagnostics = resolveNativePreviewDiagnostics(plan)
        val phoneDiagnostics = resolveNativePhoneDiagnostics()
        val guidanceUi = resolveNativeGuidanceUi()
        val app = findSuperclassHook(MAPS_APPLICATION_CLASS, "native battery application") {
            it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty()
        }
        requireLayout(app.implementation!!.registerCount >= 2, "application scratch register", app)
        val schema = "${plan.factory.name},${plan.modelField.name},${preview.cloneSchema};${forecast.schema};" +
            "$DEFAULT_NOMINAL_WH,$DEFAULT_ROLLING_N,$DEFAULT_LINEAR_N,$DEFAULT_DRAG_N;${preview.schema};${tracker.schema}"

        plan.inject()
        forecast.injectGate()
        preview.inject()
        tracker.inject()
        diagnostics.inject()
        previewDiagnostics.inject()
        phoneDiagnostics.inject()
        guidanceUi.inject()
        // The shared Settings rows patch resolved and attached the main Settings entry point.
        enableSettingsRow("vehicleRow")
        val ctor = plan.constructor
        checkedInsert(ctor, ctor.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID },
            "invoke-static/range { p0 .. p0 }, $NATIVE->registerProvider(Ljava/lang/Object;)V",
            listOf(Opcode.INVOKE_STATIC_RANGE))
        progress.listener.addInstructionsWithLabels(0, """
            move-object/from16 v0, p1
            if-eqz v0, :native_inactive
            iget-object v1, v0, ${progress.state}
            sget-object v2, ${progress.guiding}
            if-ne v1, v2, :native_inactive
            invoke-static { v0 }, ${progress.guided}
            move-result-object v0
            if-eqz v0, :native_inactive
            invoke-virtual { v0 }, ${progress.progressGetter}
            move-result-object v0
            if-eqz v0, :native_inactive
            iget-object v0, v0, $route
            invoke-static { v0 }, $NATIVE->onRoute(Ljava/lang/Object;)V
            goto :native_done
            :native_inactive
            invoke-static { }, $NATIVE->onInactive()V
            :native_done
            nop
        """.trimIndent())
        requireLayout(progress.listener.implementation!!.instructions.take(16).map { it.opcode } == listOf(
            Opcode.MOVE_OBJECT_FROM16, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_NE,
            Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
            Opcode.GOTO, Opcode.INVOKE_STATIC, Opcode.NOP), "navigation insertion", progress.listener)
        checkedInsert(app, 0, """
            const-string v0, "${diagnostics.schema}|${guidanceUi.schema}|${guidanceBattery.value}"
            invoke-static { v0 }, Lapp/morphe/extension/maps/patches/BydNativeGuidanceUi;->configure(Ljava/lang/String;)V
            nop
            const-string v0, "${diagnostics.schema}"
            invoke-static { v0 }, Lapp/morphe/extension/maps/patches/BydNativeBatteryDiagnostics;->configure(Ljava/lang/String;)V
            const-string v0, "$schema"
            invoke-static { v0 }, $NATIVE->configure(Ljava/lang/String;)V
            invoke-static/range { p0 .. p0 }, $NATIVE->onApplicationCreate(Landroid/app/Application;)V
        """.trimIndent(), listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.NOP,
            Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.CONST_STRING,
            Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE))
        log.info("Native battery: factory=${plan.factory}; model=${plan.modelField}; " +
            "requests=${plan.requests.map { it.method }}; preview=${preview.getter}; " +
            "forecast=${forecast.method}; schema=$schema; tracker gates enabled only in native BYD runtime")
        log.info("Native dev.22 diagnostics: schema=${diagnostics.schema}; methods=${diagnostics.methods}; " +
            "preview=${previewDiagnostics.methods}; phone=${phoneDiagnostics.methods}; read-only original calculation/visibility results")
        log.info("Native dev.22 guidance UI: schema=${guidanceUi.schema}; methods=${guidanceUi.methods}; " +
            "enabled=${guidanceBattery.value}; original duration binding/Google DTO/inline battery icon/owned ETA fit")
        log.info("Native dev.22 vehicle settings: row enabled in the shared main Settings entry")
    }
}

private fun requireLayout(value: Boolean, reason: String, method: Any) {
    if (!value) throw PatchException("Unrecognized native battery layout: $reason in $method")
}
private fun Instruction.field() = getReference<FieldReference>()
private fun Instruction.call() = getReference<MethodReference>()
private fun List<Instruction>.literal(value: Int): Int = indices.singleOrNull {
    (this[it] as? NarrowLiteralInstruction)?.narrowLiteral == value
} ?: throw PatchException("Expected one native model literal $value")
internal fun checkedNativeInsert(method: MutableMethod, index: Int, smali: String, expected: List<Opcode>) {
    val size = method.implementation!!.instructions.size
    method.addInstructions(index, smali)
    requireLayout(method.implementation!!.instructions.size == size + expected.size &&
        method.implementation!!.instructions.drop(index).take(expected.size).map { it.opcode } == expected,
        "assembled insertion at $index", method)
}

private fun checkedInsert(method: MutableMethod, index: Int, smali: String, expected: List<Opcode>) =
    checkedNativeInsert(method, index, smali, expected)

internal class NativeRequestHook(val method: MutableMethod, val result: Int, val write: Int, val register: Int)
internal class NativeBatteryPlan(
    val factory: MutableMethod, val constructor: MutableMethod, val publisher: MutableMethod, val modelField: FieldReference,
    val slots: List<Triple<Int, String, String>>, val skip: Int, val join: Int, val scratch: Int,
    val requests: List<NativeRequestHook>,
) {
    fun inject() {
        val code = factory.implementation!!.instructions.toList()
        val external = ExternalLabel("native_state", code[join])
        // Descending positions preserve all original indices and branch-label targets.
        val mutations = slots.map { it.first + 1 to it }.toMap()
        (mutations.keys + skip).sortedDescending().forEach { index ->
            if (index == skip) {
                val before = factory.implementation!!.instructions.size
                factory.addInstructionsWithLabels(index, """
                    invoke-static { }, $NATIVE->isBuilding()Z
                    move-result v$scratch
                    if-nez v$scratch, :native_state
                """.trimIndent(), external)
                requireLayout(factory.implementation!!.instructions.size == before + 3 &&
                    factory.implementation!!.instructions.drop(index).take(3).map { it.opcode } ==
                    listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), "optional-field branch", factory)
            } else {
                val (original, helper, type) = mutations[index]!!
                val register = (code[original] as OneRegisterInstruction).registerA
                val last = register + if (type == "D") 1 else 0
                checkedInsert(factory, index, """
                    invoke-static/range { v$register .. v$last }, $NATIVE->$helper($type)$type
                    ${if (type == "D") "move-result-wide" else "move-result"} v$register
                """.trimIndent(), listOf(Opcode.INVOKE_STATIC_RANGE,
                    if (type == "D") Opcode.MOVE_RESULT_WIDE else Opcode.MOVE_RESULT))
            }
        }
        requireLayout(factory.implementation!!.instructions.size == code.size + slots.size * 2 + 3,
            "factory size", factory)
        // Record ownership before e() publishes/rebuilds the message, avoiding a collector race.
        val built = factory.implementation!!.instructions.toList()
        val writes = built.indices.filter { built[it].opcode == Opcode.IPUT_OBJECT &&
            built[it].field()?.toString() == modelField.toString() }
        val write = writes.last()
        val modelRegister = (built[write] as TwoRegisterInstruction).registerA
        checkedInsert(factory, write + 1,
            "invoke-static/range { v$modelRegister .. v$modelRegister }, $NATIVE->onBuiltModel(Ljava/lang/Object;)V",
            listOf(Opcode.INVOKE_STATIC_RANGE))
        requests.forEach { hook ->
            checkedInsert(hook.method, hook.write + 1,
                "invoke-static/range { v${hook.register} .. v${hook.register} }, $NATIVE->onRequestModel(Ljava/lang/Object;)V",
                listOf(Opcode.INVOKE_STATIC_RANGE))
            checkedInsert(hook.method, hook.result + 1, """
                invoke-static/range { v${hook.register} .. v${hook.register} }, $NATIVE->filterRequestModel(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v${hook.register}
                check-cast v${hook.register}, ${modelField.type}
            """.trimIndent(), listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST))
        }
    }
}

/** Generic anchors and exact value-flow guards; older inlined builders fail explicitly. */
internal fun BytecodePatchContext.resolveNativeBattery(): NativeBatteryPlan {
    val publisher = uniqueMapsHook(Fingerprint(returnType = "V", parameters = emptyList(),
        strings = listOf("demo-vemlite", "demo-vemzero")), "vemlite provider publisher")!!
    val owner = classDefBy(publisher.definingClass)
    val factoryDef = owner.methods.singleOrNull { it.returnType == "V" && it.parameterTypes == listOf("F") &&
        it.implementation?.instructions?.any { ins -> (ins as? NarrowLiteralInstruction)?.narrowLiteral == 78000 } == true }
        ?: throw PatchException("Native battery needs a standalone public vemlite(float) builder in ${owner.type}; " +
            "this inspected APK layout is unsupported")
    requireLayout(AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.PUBLIC.isSet(factoryDef.accessFlags) &&
        !AccessFlags.STATIC.isSet(factoryDef.accessFlags), "public instance factory", factoryDef)
    val factory = mutableClassDefBy(owner.type).methods.single { it.toString() == factoryDef.toString() }
    val code = factory.implementation!!.instructions.toList()
    val modelField = code.mapNotNull { if (it.opcode == Opcode.IPUT_OBJECT && it.field()?.definingClass == owner.type)
        it.field() else null }.distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Expected one vemlite model slot")
    val declared = owner.fields.single { it.name == modelField.name && it.type == modelField.type }
    requireLayout(AccessFlags.PUBLIC.isSet(declared.accessFlags), "public model slot", factory)
    val cap = code.literal(78000)
    val value = code[cap + 1].field()
    requireLayout(code[cap + 1].opcode == Opcode.IPUT && value?.type == "I" &&
        (code[cap] as OneRegisterInstruction).registerA == (code[cap + 1] as TwoRegisterInstruction).registerA,
        "capacity literal store", factory)
    val stateStore = (cap + 2 until code.size).first { code[it].opcode == Opcode.IPUT_OBJECT && code[it].field()?.type == value!!.definingClass }
    val state = code[stateStore].field()!!
    requireLayout(code[stateStore + 1].opcode == Opcode.IGET && code[stateStore + 2].opcode == Opcode.OR_INT_LIT8 &&
        (code[stateStore + 2] as NarrowLiteralInstruction).narrowLiteral == 4 &&
        code[stateStore + 3].opcode == Opcode.IPUT, "capacity presence bit", factory)
    val skip = stateStore + 4
    val drive = code.literal(170000)
    val regen = code.literal(155000)
    val reserve = code.literal(2154)
    requireLayout(skip < reserve && reserve < drive && drive < regen &&
        code[drive + 1].opcode == Opcode.IPUT && code[drive + 1].field()?.definingClass == state.definingClass &&
        code[regen + 1].opcode == Opcode.IPUT && code[regen + 1].field()?.definingClass == state.definingClass,
        "optional reserve/power block", factory)
    val join = regen + 2
    requireLayout(code[join].call()?.name == "copyOnWrite" && code[join + 1].opcode == Opcode.IGET_OBJECT &&
        code[join + 2].opcode == Opcode.CHECK_CAST && code[join + 2].getReference<TypeReference>()?.type == modelField.type,
        "model builder after optional block", factory)
    val scratch = (code[stateStore + 1] as OneRegisterInstruction).registerA
    // The presence-bit temporary must be overwritten before any read on BOTH branches.
    fun deadUntilWrite(start: Int): Boolean {
        for (instruction in code.drop(start)) {
            val regs = instruction.invokeRegisters() ?: when (instruction) {
                is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
                is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
                is OneRegisterInstruction -> listOf(instruction.registerA)
                else -> emptyList()
            }
            if (scratch !in regs) continue
            return instruction.opcode in setOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IGET_OBJECT) &&
                (instruction as OneRegisterInstruction).registerA == scratch &&
                (instruction !is TwoRegisterInstruction || instruction.registerB != scratch)
        }
        return false
    }
    requireLayout(scratch <= 255 && deadUntilWrite(skip) && deadUntilWrite(join), "dead branch scratch", factory)
    val current = code.indices.singleOrNull { code[it].opcode == Opcode.FLOAT_TO_INT }
        ?: throw PatchException("Expected one current-energy conversion")
    requireLayout(code[current - 1].opcode == Opcode.MUL_FLOAT_2ADDR && code[current + 1].opcode == Opcode.INT_TO_DOUBLE &&
        (code[current] as TwoRegisterInstruction).registerA == (code[current + 1] as TwoRegisterInstruction).registerB,
        "current-energy conversion", factory)
    val doubleCap = code.indices.singleOrNull { (code[it] as? WideLiteralInstruction)?.wideLiteral == 78000.0.toBits() }
        ?: throw PatchException("Expected one capacity clamp")
    requireLayout(code[doubleCap + 1].call()?.toString() == "Ljava/lang/Math;->min(DD)D" &&
        code[doubleCap + 1].invokeRegisters()?.takeLast(2) == listOf(
            (code[doubleCap] as OneRegisterInstruction).registerA,
            (code[doubleCap] as OneRegisterInstruction).registerA + 1), "capacity clamp flow", factory)
    val slots = listOf(Triple(current, "energyWh", "I"), Triple(cap, "capacityWh", "I"),
        Triple(code.literal(78000f.toBits()), "capacityFloat", "F"), Triple(doubleCap, "capacityDouble", "D")) +
        listOf(138.38f.toBits() to "rolling", 2.18f.toBits() to "linear", 0.3617f.toBits() to "drag").map { (bits, helper) ->
            val index = code.literal(bits)
            requireLayout(code[index + 1].opcode == Opcode.IPUT && code[index + 1].field()?.type == "F" &&
                (code[index] as OneRegisterInstruction).registerA == (code[index + 1] as TwoRegisterInstruction).registerA,
                "road-load $helper store", factory)
            Triple(index, helper, "F")
        }
    val constructor = mutableClassDefBy(owner.type).methods.singleOrNull { it.name == "<init>" }
        ?: throw PatchException("Expected one provider constructor")
    requireLayout(constructor.implementation!!.instructions.count { it.opcode == Opcode.RETURN_VOID } == 1 &&
        constructor.implementation!!.instructions.last().opcode == Opcode.RETURN_VOID, "constructor exit", constructor)
    val providerInterface = owner.interfaces.singleOrNull() ?: throw PatchException("Expected provider interface")
    val requests = mutableListOf<NativeRequestHook>()
    classDefForEach { cls ->
        if (!cls.type.startsWith("Lapp/morphe/extension/")) cls.methods.forEach { method ->
            val body = method.implementation?.instructions?.toList() ?: return@forEach
            val writes = body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].field()?.type == modelField.type &&
                body[it].field()?.definingClass != owner.type && body.any { instruction ->
                    instruction.call()?.let { it.definingClass == providerInterface && it.returnType == modelField.type } == true } &&
                body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 32768 } }
            if (writes.isEmpty()) return@forEach
            requireLayout(writes.size == 1, "unique request model store", method)
            val write = writes.single(); val register = (body[write] as TwoRegisterInstruction).registerA
            val result = (0 until write).lastOrNull { body[it].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (body[it] as OneRegisterInstruction).registerA == register &&
                body.getOrNull(it - 1)?.call()?.let { call -> call.definingClass == providerInterface && call.returnType == modelField.type } == true }
                ?: throw PatchException("Missing request model producer: $method")
            val guard = (result + 1 until write).firstOrNull { body[it].opcode == Opcode.IF_EQZ &&
                (body[it] as OneRegisterInstruction).registerA == register }
            var cursor = result + 1
            val visited = mutableSetOf<Int>()
            var guarded = false
            while (cursor < write && visited.add(cursor)) {
                val instruction = body[cursor]
                if (instruction.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) {
                    val target = body.take(cursor).sumOf { it.codeUnits } + (instruction as OffsetInstruction).codeOffset
                    var offset = 0
                    cursor = body.indices.firstOrNull { index ->
                        val matches = offset == target; offset += body[index].codeUnits; matches
                    } ?: throw PatchException("Invalid request branch: $method")
                    continue
                }
                if (instruction.opcode == Opcode.IF_EQZ && (instruction as OneRegisterInstruction).registerA == register) {
                    val target = body.take(cursor).sumOf { it.codeUnits } + (instruction as OffsetInstruction).codeOffset
                    requireLayout(target > body.take(write).sumOf { it.codeUnits }, "null guard skips model store", method)
                    guarded = true
                }
                requireLayout(!(instruction.opcode.setsRegister() &&
                    ((instruction as? OneRegisterInstruction)?.registerA == register ||
                        (instruction.opcode.setsWideRegister() && (instruction as? OneRegisterInstruction)?.registerA == register - 1))),
                    "model overwritten on request path", method)
                cursor++
            }
            requireLayout(guard != null && guarded && cursor == write && body[result - 1].invokeRegisters()?.size == 1,
                "request model operand flow", method)
            val mutable = mutableClassDefBy(cls.type).methods.single { it.toString() == method.toString() }
            requests.add(NativeRequestHook(mutable, result, write, register))
        }
    }
    requireLayout(requests.size == 2, "expected two inspected request writers, got ${requests.size}", factory)
    return NativeBatteryPlan(factory, constructor, publisher, modelField, slots, skip, join, scratch, requests)
}

private class NativeForecastHook(
    val method: MutableMethod, val gateResult: Int, val register: Int, val schema: String,
    val legs: FieldReference,
) {
    fun injectGate() = checkedInsert(method, gateResult + 1,
        "invoke-static/range { v$register .. v$register }, $NATIVE->onTrackerGate(Z)V", listOf(Opcode.INVOKE_STATIC_RANGE))
}

private fun BytecodePatchContext.resolveNativeForecast(progress: NavigationProgressHook, route: FieldReference): NativeForecastHook {
    val tracker = uniqueMapsHook(Fingerprint(returnType = "V", parameters = listOf(progress.listener.parameterTypes.single().toString()),
        custom = { method, _ -> method.implementation?.instructions?.any { instruction ->
            instruction.call()?.let { call -> call.name == "<init>" &&
                toStringLabels(call.definingClass).any { it.contains("energyUsageEstimator=") } } == true } == true }),
        "native battery tracker")!!
    val code = tracker.implementation!!.instructions.toList()
    val gate = code.indices.firstOrNull { code[it].opcode == Opcode.INVOKE_INTERFACE &&
        code[it].call()?.returnType == "Z" && code[it].call()?.parameterTypes?.isEmpty() == true }
        ?: throw PatchException("Missing native tracker gate")
    requireLayout(gate < 5 && code[gate + 1].opcode == Opcode.MOVE_RESULT && code[gate + 2].opcode == Opcode.IF_EQZ &&
        (code[gate + 1] as OneRegisterInstruction).registerA == (code[gate + 2] as OneRegisterInstruction).registerA,
        "tracker gate operand", tracker)
    val routeRead = code.indices.firstOrNull { code[it].field()?.toString() == route.toString() }
        ?: throw PatchException("Tracker does not use the resolved route")
    // The current flow exits on false and enters the original tracker on true.
    // Prove the destination as well as the inverted opcode before observing it.
    val gateAddress = code.take(gate + 2).sumOf { it.codeUnits }
    val exitAddress = gateAddress + (code[gate + 2] as OffsetInstruction).codeOffset
    var address = 0
    val exit = code.indices.singleOrNull { index ->
        val matches = address == exitAddress
        address += code[index].codeUnits
        matches
    } ?: throw PatchException("Invalid native tracker gate destination: $tracker")
    requireLayout(routeRead in (gate + 3) until exit && code[exit].opcode == Opcode.RETURN_VOID,
        "tracker false exits/true reaches route", tracker)
    val legs = code[routeRead + 1].field()
    requireLayout(code[routeRead + 1].opcode == Opcode.IGET_OBJECT && legs?.definingClass == route.type &&
        (code[routeRead] as TwoRegisterInstruction).registerA == (code[routeRead + 1] as TwoRegisterInstruction).registerB,
        "route-to-legs flow", tracker)
    val count = code[routeRead + 2].call()!!
    requireLayout(count.definingClass == legs!!.type && count.parameterTypes.isEmpty() && count.returnType == "I", "leg count", tracker)
    val at = code.mapNotNull { it.call() }.distinctBy { it.toString() }.singleOrNull {
        it.definingClass == legs.type && it.parameterTypes == listOf("I") && it.returnType.startsWith("L") }
        ?: throw PatchException("Missing unique leg accessor")
    val payload = code.mapNotNull { it.field() }.distinctBy { it.toString() }.singleOrNull { it.definingClass == at.returnType }
        ?: throw PatchException("Missing unique forecast payload")
    val segments = code.mapNotNull { it.field() }.distinctBy { it.toString() }.singleOrNull { it.definingClass == payload.type }
        ?: throw PatchException("Missing unique forecast segment list")
    val directReads = code.indices.mapNotNull { index ->
        val cast = code[index]
        val read = code.getOrNull(index + 1)
        if (cast.opcode == Opcode.CHECK_CAST && read?.opcode == Opcode.IGET &&
            code.getOrNull(index - 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            code.getOrNull(index - 2)?.call()?.toString() == "Ljava/util/Iterator;->next()Ljava/lang/Object;" &&
            cast.getReference<TypeReference>()?.type == read.field()?.definingClass &&
            (cast as OneRegisterInstruction).registerA == (read as TwoRegisterInstruction).registerB) read.field() else null
    }.groupBy { it.definingClass }
    val length = directReads.values.singleOrNull { refs -> refs.size >= 3 && refs.distinctBy { it.toString() }.size == 1 }?.first()
        ?: throw PatchException("Missing unique segment length from repeated iterator-element reads")
    // Copy the proven energy * partialLength / fullLength interpolation operands.
    val interpolate = code.indices.singleOrNull { index -> index >= 5 &&
        code[index].opcode == Opcode.DIV_FLOAT_2ADDR && code.getOrNull(index + 1)?.opcode == Opcode.MUL_FLOAT_2ADDR &&
        code[index - 4].opcode == Opcode.IGET && code[index - 4].field()?.toString() == length.toString() &&
        code[index - 3].opcode == Opcode.INT_TO_FLOAT && code[index - 2].opcode == Opcode.IGET &&
        code[index - 2].field()?.definingClass == length.definingClass && code[index - 1].opcode == Opcode.INT_TO_FLOAT }
        ?: throw PatchException("Missing unique segment-energy interpolation")
    val energy = code[interpolate - 2].field()!!
    val lengthRead = code[interpolate - 4] as TwoRegisterInstruction
    val lengthFloat = code[interpolate - 3] as TwoRegisterInstruction
    val energyRead = code[interpolate - 2] as TwoRegisterInstruction
    val energyFloat = code[interpolate - 1] as TwoRegisterInstruction
    val division = code[interpolate] as TwoRegisterInstruction
    val product = code[interpolate + 1] as TwoRegisterInstruction
    requireLayout(lengthRead.registerA == lengthFloat.registerB && energyRead.registerA == energyFloat.registerB &&
        lengthRead.registerB == energyRead.registerB && division.registerB == lengthFloat.registerA &&
        product.registerA == energyFloat.registerA && product.registerB == division.registerA &&
        energy.toString() != length.toString(), "forecast interpolation register flow", tracker)
    listOf(legs, payload, segments, length, energy).forEach { field ->
        val cls = classDefBy(field.definingClass)
        requireLayout(AccessFlags.PUBLIC.isSet(cls.accessFlags) && cls.fields.any {
            it.name == field.name && it.type == field.type && AccessFlags.PUBLIC.isSet(it.accessFlags) }, "public forecast field $field", tracker)
    }
    requireLayout(classDefBy(legs.type).methods.any { it.toString() == count.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) } &&
        classDefBy(legs.type).methods.any { it.toString() == at.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) }, "public leg accessors", tracker)
    return NativeForecastHook(tracker, gate + 1, (code[gate + 1] as OneRegisterInstruction).registerA,
        listOf(legs.name, count.name, at.name, payload.name, segments.name, length.name, energy.name).joinToString(","), legs)
}
