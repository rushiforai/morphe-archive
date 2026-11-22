package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

// Battery on the phone, part of the BYD battery patch. Two of Maps' uploads to the Google account carry car
// values only when the app holds the car energy permission (CAR_ENERGY), which DiLink never grants; Google
// Maps on a phone with the same account reads them. Each check of the permission there is a no-argument
// boolean method holding the permission's name, and its result passes through PhoneBattery:
// - the live vehicle info task (element MAPS_LIVE_VEHICLE_INFO, about every 2 minutes) checks once before
//   it adds the battery percentage: PhoneBattery.share;
// - the energy-model task (element MAPS_VEHICLE_ENERGY_MODEL, 5 s after each start, then every 2 hours)
//   checks three times. The first check is reached only when Maps expects the car's model and has none yet;
//   on true the task returns success without writing: PhoneBattery.modelPending, which throws instead while
//   the switch is on, so the task's catch of everything returns Retry. The other two come before it adds the
//   model's two parts: PhoneBattery.shareModel.
//   Before the upload the task clears the outside temperature, field 7 of the vehicle info, in both parts: in the
//   copy of our model within the task, in Maps' own model in a static helper of the task's class. Each clear is
//   skipped while PhoneBattery.keepModelTemperature returns true, so Google's side gets the temperature that the
//   model's A/C draw by temperature needs. Field numbers come from the classes' protobuf message info.
// Maps' other checks of the permission are not touched. Maps runs the live vehicle info task from a 2-minute timer; the
// timer's runnable goes to PhoneBattery.liveTask, which runs it once more soon after the battery percent drops.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

private const val PHONE_BATTERY_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/PhoneBattery;"
private const val LIVE_VEHICLE_INFO = "MAPS_LIVE_VEHICLE_INFO"
private const val VEHICLE_ENERGY_MODEL = "MAPS_VEHICLE_ENERGY_MODEL"
private const val CAR_ENERGY = "android.car.permission.CAR_ENERGY"
private const val LIVE_TASK_NAME = "live-vehicle-info-task"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val DURATION = "Lj\$/time/Duration;"
private const val TIME_UNIT = "Ljava/util/concurrent/TimeUnit;"
private val phoneLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.PhoneBatteryHooks")

private fun Instruction.text() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.invoked() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldOf() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.argumentRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun MethodReference.signature() = definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType

private fun FieldReference.signature() = "$definingClass->$name:$type"

internal fun BytecodePatchContext.usePhoneBattery() {
    requireExtensionMethod(PHONE_BATTERY_CLASS, "share", listOf("Z"), "Z")
    requireExtensionMethod(PHONE_BATTERY_CLASS, "modelPending", listOf("Z"), "Z")
    requireExtensionMethod(PHONE_BATTERY_CLASS, "shareModel", listOf("Z"), "Z")
    requireExtensionMethod(PHONE_BATTERY_CLASS, "liveTask", listOf(RUNNABLE), "V")
    requireExtensionMethod(PHONE_BATTERY_CLASS, "keepModelTemperature", emptyList(), "Z")
    val check = carEnergyCheck()
    useLiveVehicleInfo(check)
    useEnergyModelUpload(check)
    keepLiveTask()
}

// Maps' timer for the live vehicle info task. The task's runnable (class R) holds the work name live-vehicle-info-task in
// its run method and enqueues it through a static method of class G; G holds one static Duration, the period. The timer
// is the one static call (Runnable, long, long, TimeUnit, ...) whose runnable was created as an R in the same method and
// whose period is G's Duration in milliseconds. Before that call the runnable passes to PhoneBattery.liveTask, which keeps
// it to run once more soon after the battery percent drops.
private fun BytecodePatchContext.keepLiveTask() {
    val enqueues = mutableListOf<Pair<Method, MethodReference>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.filter { code[it].text() == LIVE_TASK_NAME }.forEach { index ->
                val name = (code[index] as OneRegisterInstruction).registerA
                val call = (index + 1 until minOf(code.size, index + 4)).firstOrNull {
                    code[it].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) && name in code[it].argumentRegisters()
                } ?: throw PatchException("Unexpected $LIVE_TASK_NAME use in $method")
                enqueues += method to code[call].invoked()!!
            }
        }
    }
    val (run, enqueue) = enqueues.singleOrNull()
        ?: throw PatchException("Expected one use of $LIVE_TASK_NAME, found ${enqueues.map { it.first }}")
    if (run.name != "run" || run.parameterTypes.isNotEmpty() || run.returnType != "V") {
        throw PatchException("$LIVE_TASK_NAME is not enqueued from a runnable's run(): $run")
    }
    val runnableClass = run.definingClass
    val scheduler = classDefByOrNull(enqueue.definingClass)
        ?: throw PatchException("Missing class ${enqueue.definingClass} of $enqueue")
    val periods = scheduler.fields.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == DURATION }
    val period = periods.singleOrNull() ?: throw PatchException("Expected one static Duration in ${scheduler.type}, found ${periods.size}")
    val periodField = "${scheduler.type}->${period.name}:$DURATION"

    val sites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            if (code.none { it.opcode == Opcode.NEW_INSTANCE && it.typeOf() == runnableClass }) return@forEach
            code.indices.filter { index ->
                code[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                    code[index].invoked()?.parameterTypes?.map { it.toString() }?.take(4) == listOf(RUNNABLE, "J", "J", TIME_UNIT)
            }.forEach { index ->
                val arguments = code[index].argumentRegisters()
                val created = code.lastWriteBefore(index, arguments[0])
                if (created == null || code[created].opcode != Opcode.NEW_INSTANCE || code[created].typeOf() != runnableClass) {
                    return@forEach
                }
                // The period: the second long, after the runnable and the delay.
                val millis = code.lastWriteBefore(index, arguments[3])
                val toMillis = millis?.let { code.getOrNull(it - 1) }
                if (millis == null || code[millis].opcode != Opcode.MOVE_RESULT_WIDE || toMillis?.opcode != Opcode.INVOKE_VIRTUAL ||
                    toMillis.invoked()?.signature() != "$DURATION->toMillis()J"
                ) {
                    return@forEach
                }
                val read = code.lastWriteBefore(millis - 1, toMillis.argumentRegisters().first())
                if (read == null || code[read].opcode != Opcode.SGET_OBJECT || code[read].fieldOf()?.signature() != periodField) return@forEach
                sites += method to index
            }
        }
    }
    val (timerMethod, call) = sites.singleOrNull()
        ?: throw PatchException("Expected one timer of $runnableClass with the period $periodField, found ${sites.map { it.first }}")

    val method = mutableMethodOf(timerMethod)
    val instructions = method.implementation!!.instructions
    if (instructions[call].location.labels.isNotEmpty()) {
        throw PatchException("Unexpected live vehicle info timer $timerMethod: the call at $call is a branch target")
    }
    val runnable = instructions[call].argumentRegisters().first()
    method.addInstructions(
        call,
        "invoke-static/range { v$runnable .. v$runnable }, $PHONE_BATTERY_CLASS->liveTask($RUNNABLE)V",
    )
    phoneLogger.info(
        "Battery on the phone: the live vehicle info timer in $timerMethod at $call (runnable $runnableClass in v$runnable, " +
            "period $periodField) passes its runnable to PhoneBattery.liveTask",
    )
}

// The index of the last instruction before [before] that writes [register] (a wide write covers two registers).
private fun List<Instruction>.lastWriteBefore(before: Int, register: Int): Int? =
    (before - 1 downTo 0).firstOrNull { index ->
        val instruction = this[index]
        instruction.opcode.setsRegister() && (instruction as OneRegisterInstruction).registerA.let {
            it == register || instruction.opcode.setsWideRegister() && it + 1 == register
        }
    }

private fun Instruction.typeOf() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

// The live vehicle info task: it reads the element type and calls the check, exactly once.
private fun BytecodePatchContext.useLiveVehicleInfo(check: String) {
    val elementType = elementType(LIVE_VEHICLE_INFO)
    val (task, calls) = uploadTask(elementType, LIVE_VEHICLE_INFO, check)
    if (calls.size != 1) throw PatchException("Expected one $CAR_ENERGY check in $task, found ${calls.size}")
    val call = calls.single()

    val method = mutableMethodOf(task)
    val register = checkedResult(method, call, "live vehicle info task")
    passResult(method, call, register, "share")
    phoneLogger.info(
        "Battery on the phone: $task reads ${elementType.signature()} ($LIVE_VEHICLE_INFO); the result of $check " +
            "in v$register at ${call + 1} passes through PhoneBattery.share",
    )
}

// The energy-model task: it reads the element type and calls the check three times, each result deciding an if-eqz
// whose fall-through is the true case, all inside a try block that catches everything. The first one's true case
// creates an object and returns it (success without a write); the other two continue.
private fun BytecodePatchContext.useEnergyModelUpload(check: String) {
    val elementType = elementType(VEHICLE_ENERGY_MODEL)
    val (task, calls) = uploadTask(elementType, VEHICLE_ENERGY_MODEL, check)
    if (calls.size != 3) throw PatchException("Expected three $CAR_ENERGY checks in $task, found ${calls.size}")

    val method = mutableMethodOf(task)
    val code = method.implementation!!.instructions
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected energy-model task $task: $reason")
    val registers = calls.map { checkedResult(method, it, "energy-model task") }
    calls.forEach { call ->
        if (code[call + 2].opcode != Opcode.IF_EQZ) unexpected("the check at $call is not followed by if-eqz")
        if (!inCatchAll(method, call + 1) || !inCatchAll(method, call + 2)) {
            unexpected("the check at $call is not inside a try block that catches everything")
        }
    }
    val returnsAtOnce = calls.map { call ->
        val create = code.getOrNull(call + 3)
        val init = code.getOrNull(call + 4)
        val result = code.getOrNull(call + 5)
        create?.opcode == Opcode.NEW_INSTANCE && init?.opcode == Opcode.INVOKE_DIRECT && result?.opcode == Opcode.RETURN_OBJECT &&
            init.invoked()?.let {
                it.name == "<init>" && it.parameterTypes.isEmpty() &&
                    it.definingClass == ((create as ReferenceInstruction).reference as TypeReference).type
            } == true &&
            init.argumentRegisters() == listOf((create as OneRegisterInstruction).registerA) &&
            (result as OneRegisterInstruction).registerA == create.registerA
    }
    if (returnsAtOnce != listOf(true, false, false)) {
        unexpected("expected the first check alone to return at once when true, found $returnsAtOnce")
    }

    // From the last call back, so the earlier indices stay valid.
    calls.indices.reversed().forEach { index ->
        passResult(method, calls[index], registers[index], if (index == 0) "modelPending" else "shareModel")
    }
    phoneLogger.info(
        "Energy model on the phone: $task reads ${elementType.signature()} ($VEHICLE_ENERGY_MODEL); the result of $check " +
            "in v${registers[0]} at ${calls[0] + 1} (no model yet) passes through PhoneBattery.modelPending, in " +
            "v${registers[1]} at ${calls[1] + 1} and v${registers[2]} at ${calls[2] + 1} through PhoneBattery.shareModel",
    )
    keepOutsideTemperature(task, method)
}

private const val OUTSIDE_TEMPERATURE_FIELD = 7
private const val PROTO_FLOAT = 1
private const val KEEP_LABEL = "morphe_keep_temperature"

// The outside temperature in both parts of the upload. In the task (already hooked above, so the indices are the
// mutable method's) one store of a constant 0 into field 7 of a message; in the task's class one static helper
// taking and returning the same message type, called by the task, with one such store. Both are skipped while
// PhoneBattery.keepModelTemperature returns true.
private fun BytecodePatchContext.keepOutsideTemperature(task: Method, taskMethod: MutableMethod) {
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected outside temperature in the energy-model task $task: $reason")
    val taskClears = temperatureClears(taskMethod.implementation!!.instructions)
    val taskClear = taskClears.singleOrNull() ?: unexpected("expected one clear of field $OUTSIDE_TEMPERATURE_FIELD, found ${taskClears.size}")

    val helpers = (classDefByOrNull(task.definingClass) ?: unexpected("no class")).methods.mapNotNull { helper ->
        val parameter = helper.parameterTypes.singleOrNull()?.toString()
        if (!AccessFlags.STATIC.isSet(helper.accessFlags) || parameter == null || !parameter.startsWith("L") ||
            helper.returnType != parameter
        ) {
            return@mapNotNull null
        }
        val clears = temperatureClears(helper.implementation?.instructions?.toList() ?: return@mapNotNull null)
        if (clears.isEmpty()) null else helper to clears
    }
    val (helper, helperClears) = helpers.singleOrNull() ?: unexpected("expected one static helper with such a clear, found ${helpers.map { it.first }}")
    val helperClear = helperClears.singleOrNull() ?: unexpected("expected one clear in $helper, found ${helperClears.size}")
    val helperSignature = helper.definingClass + "->" + helper.name + helper.parameterTypes.joinToString("", "(", ")") + helper.returnType
    if (taskMethod.implementation!!.instructions.none { it.invoked()?.signature() == helperSignature }) {
        unexpected("the task does not call $helper")
    }

    val taskField = keepTemperature(taskMethod, taskClear)
    val helperField = keepTemperature(mutableMethodOf(helper), helperClear)
    phoneLogger.info(
        "Energy model on the phone: the outside temperature stays in Maps' upload while PhoneBattery.keepModelTemperature " +
            "is true: $taskField in $task at $taskClear (our model's copy), $helperField in $helper at $helperClear (Maps' model)",
    )
}

// Indices of the stores of a constant 0 (set just before) into field 7, a float, of a protobuf-lite message.
private fun BytecodePatchContext.temperatureClears(code: List<Instruction>): List<Int> = code.indices.filter { index ->
    val store = code[index]
    val field = store.fieldOf()
    if (store.opcode != Opcode.IPUT || field == null || field.type != "F") return@filter false
    val zero = code.getOrNull(index - 1)
    if (zero == null || zero.opcode !in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) ||
        (zero as NarrowLiteralInstruction).narrowLiteral != 0 ||
        (zero as OneRegisterInstruction).registerA != (store as TwoRegisterInstruction).registerA
    ) {
        return@filter false
    }
    val proto = protoLayout(field.definingClass)?.fields?.singleOrNull { it.name == field.name }
    proto != null && proto.number == OUTSIDE_TEMPERATURE_FIELD && proto.type == PROTO_FLOAT
}

// Skips the clear at [store] (and the clear of its has-bit just before, if the field has one) while
// PhoneBattery.keepModelTemperature returns true. The stored register holds 0 again after the skipped part on both
// paths, as Maps uses it later. Returns the field.
private fun BytecodePatchContext.keepTemperature(method: MutableMethod, store: Int): String {
    val code = method.implementation!!.instructions
    val field = code[store].fieldOf()!!
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected clear of ${field.signature()} in $method: $reason")
    val put = code[store] as TwoRegisterInstruction
    val value = put.registerA
    val layout = protoLayout(field.definingClass) ?: unexpected("no message info")
    val hasBit = layout.fields.single { it.name == field.name }.hasBit
    val start = if (hasBit == null) {
        store
    } else {
        val bitsName = layout.hasBitsFields.getOrNull(hasBit / 32) ?: unexpected("no has-bits field for bit $hasBit")
        val bits = "${field.definingClass}->$bitsName:I"
        val read = code.getOrNull(store - 4) as? TwoRegisterInstruction
        val clear = code.getOrNull(store - 3)
        val write = code.getOrNull(store - 2) as? TwoRegisterInstruction
        val cleared = read != null && read.opcode == Opcode.IGET && read.fieldOf()?.signature() == bits &&
            read.registerB == put.registerB &&
            clear != null && clear.opcode in setOf(Opcode.AND_INT_LIT8, Opcode.AND_INT_LIT16) &&
            (clear as NarrowLiteralInstruction).narrowLiteral == (1 shl (hasBit % 32)).inv() &&
            (clear as TwoRegisterInstruction).registerA == read.registerA && clear.registerB == read.registerA &&
            write != null && write.opcode == Opcode.IPUT && write.fieldOf()?.signature() == bits &&
            write.registerA == read.registerA && write.registerB == put.registerB
        if (!cleared) unexpected("its has-bit $hasBit is not cleared just before")
        store - 4
    }
    if (store + 1 >= code.size) unexpected("nothing follows the store")
    (start..store + 1).forEach { if (code[it].location.labels.isNotEmpty()) unexpected("the instruction at $it is a branch target") }

    method.addInstructions(store + 1, "const/16 v$value, 0x0")
    val after = method.implementation!!.instructions[store + 1]
    method.addInstructionsWithLabels(
        start,
        """
            invoke-static {}, $PHONE_BATTERY_CLASS->keepModelTemperature()Z
            move-result v$value
            if-nez v$value, :$KEEP_LABEL
            const/16 v$value, 0x0
        """.trimIndent(),
        ExternalLabel(KEEP_LABEL, after),
    )
    return field.signature()
}

private class ProtoField(val number: Int, val type: Int, val name: String, val hasBit: Int?)

private class ProtoLayout(val hasBitsFields: List<String>, val fields: List<ProtoField>)

// The field layout of a protobuf-lite message class, from the message info its dynamic method builds and passes to a
// constructor (default instance, String, Object[]): the info string and the objects (the has-bits fields' names, then
// each field's name, plus the class of a message list and the verifier of a closed enum). Null when the class builds
// none. Oneofs and maps are not expected in the classes read here and fail.
private fun BytecodePatchContext.protoLayout(classType: String): ProtoLayout? {
    val classDef = classDefByOrNull(classType) ?: return null
    val (info, objects) = classDef.methods.firstNotNullOfOrNull { messageInfo(it) } ?: return null
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected message info of $classType: $reason")
    var at = 0
    fun next(): Int {
        if (at >= info.length) unexpected("ends early")
        var char = info[at++].code
        if (char < 0xD800) return char
        var result = char and 0x1FFF
        var shift = 13
        while (true) {
            if (at >= info.length) unexpected("ends early")
            char = info[at++].code
            if (char < 0xD800) return result or (char shl shift)
            result = result or ((char and 0x1FFF) shl shift)
            shift += 13
        }
    }
    next()
    val fieldCount = next()
    if (fieldCount == 0) return ProtoLayout(emptyList(), emptyList())
    val oneofs = next()
    val hasBitsCount = next()
    repeat(6) { next() }
    if (oneofs != 0) unexpected("oneofs")
    val hasBitsFields = objects.take(hasBitsCount).map { it as? String ?: unexpected("has-bits field $it") }
    var position = hasBitsCount
    val fields = List(fieldCount) {
        val number = next()
        val typeWithBits = next()
        val type = typeWithBits and 0xFF
        if (type >= 50) unexpected("map or oneof field $number")
        val name = objects.getOrNull(position++) as? String ?: unexpected("no name for field $number")
        if (type == 27 || type == 49 || (type == 12 || type == 30 || type == 44) && (typeWithBits and 0x800) != 0) position++
        val hasBit = if ((typeWithBits and 0x1000) != 0 && type <= 17) next() else null
        ProtoField(number, type, name, hasBit)
    }
    if (at != info.length || position != objects.size) unexpected("${info.length - at} chars and ${objects.size - position} objects left")
    return ProtoLayout(hasBitsFields, fields)
}

private val BRANCHES = setOf(
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT,
    Opcode.IF_LE, Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
    Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.RETURN, Opcode.RETURN_VOID, Opcode.RETURN_WIDE,
    Opcode.RETURN_OBJECT, Opcode.THROW,
)
private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

private object ArrayValue

// The info string and objects in [method], if it builds a message info: straight-line code from a new Object[] to the
// constructor call, its indices constants set there or before the method's first branch.
private fun messageInfo(method: Method): Pair<String, List<Any?>>? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val build = code.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT && instruction.invoked()?.let {
            it.name == "<init>" && it.parameterTypes.map { type -> type.toString() }.let { types ->
                types.size == 3 && types[1] == "Ljava/lang/String;" && types[2] == "[Ljava/lang/Object;"
            }
        } == true
    }
    if (build < 0) return null
    val newArray = (build - 1 downTo 0).firstOrNull {
        code[it].opcode == Opcode.NEW_ARRAY && code[it].typeOf() == "[Ljava/lang/Object;"
    } ?: return null
    val blockStart = (newArray - 1 downTo 0).firstOrNull { code[it].opcode in BRANCHES }?.plus(1) ?: 0
    val registers = HashMap<Int, Any?>()
    for (instruction in code) {
        if (instruction.opcode in BRANCHES) break
        if (instruction.opcode in CONSTANTS) {
            registers[(instruction as OneRegisterInstruction).registerA] = (instruction as NarrowLiteralInstruction).narrowLiteral
        }
    }
    val array = HashMap<Int, Any?>()
    var size = -1
    for (index in blockStart until build) {
        val instruction = code[index]
        when (instruction.opcode) {
            in CONSTANTS -> registers[(instruction as OneRegisterInstruction).registerA] = (instruction as NarrowLiteralInstruction).narrowLiteral
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> registers[(instruction as OneRegisterInstruction).registerA] = instruction.text()
            Opcode.NEW_ARRAY -> {
                if (index != newArray) return null
                size = registers[(instruction as TwoRegisterInstruction).registerB] as? Int ?: return null
                registers[instruction.registerA] = ArrayValue
            }
            Opcode.APUT_OBJECT -> {
                val aput = instruction as ThreeRegisterInstruction
                if (registers[aput.registerB] !== ArrayValue) return null
                val position = registers[aput.registerC] as? Int ?: return null
                array[position] = registers[aput.registerA] ?: return null
            }
            else -> if (instruction.opcode.setsRegister()) {
                val register = (instruction as OneRegisterInstruction).registerA
                registers[register] = when (instruction.opcode) {
                    Opcode.CONST_CLASS -> "class " + instruction.typeOf()
                    Opcode.SGET_OBJECT -> "field " + instruction.fieldOf()?.signature()
                    else -> null
                }
                if (instruction.opcode.setsWideRegister()) registers[register + 1] = null
            }
        }
    }
    val arguments = code[build].argumentRegisters()
    if (arguments.size != 4) return null
    val info = registers[arguments[2]] as? String ?: return null
    if (size < 0 || registers[arguments[3]] !== ArrayValue || array.keys != (0 until size).toSet()) return null
    return info to (0 until size).map { array[it] }
}

// The one method that reads [elementType] and calls [check]; returns it with the indices of those calls.
private fun BytecodePatchContext.uploadTask(elementType: FieldReference, name: String, check: String): Pair<Method, List<Int>> {
    val tasks = mutableListOf<Pair<Method, List<Int>>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            if (code.none { it.opcode == Opcode.SGET_OBJECT && it.fieldOf()?.signature() == elementType.signature() }) {
                return@forEach
            }
            val calls = code.indices.filter { code[it].invoked()?.signature() == check }
            if (calls.isNotEmpty()) tasks += method to calls
        }
    }
    return tasks.singleOrNull()
        ?: throw PatchException("Expected one method reading $elementType ($name) and calling $check, found ${tasks.map { it.first }}")
}

// The check at [call] is a virtual call without arguments, its move-result decides the next branch at once, and that
// branch is not a branch target (code inserted before a target would be skipped by the jumps to it). Returns the
// result's register.
private fun checkedResult(method: MutableMethod, call: Int, task: String): Int {
    val code = method.implementation!!.instructions
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected $task $method: $reason")
    val invoke = code[call]
    if (invoke.opcode != Opcode.INVOKE_VIRTUAL || invoke.argumentRegisters().size != 1) {
        unexpected("the check at $call is not a virtual call without arguments")
    }
    val result = code.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) unexpected("no move-result after the check at $call")
    val register = (result as OneRegisterInstruction).registerA
    val branch = code.getOrNull(call + 2)
    if (branch?.opcode !in setOf(Opcode.IF_EQZ, Opcode.IF_NEZ) || (branch as OneRegisterInstruction).registerA != register) {
        unexpected("the result of the check at $call does not decide the next branch")
    }
    if (branch.location.labels.isNotEmpty()) unexpected("the branch on the check at $call is a branch target")
    return register
}

// Whether the instruction at [index] lies in a try block with a handler for every exception.
private fun inCatchAll(method: MutableMethod, index: Int): Boolean {
    val address = (method.implementation!!.instructions[index] as BuilderInstruction).location.codeAddress
    return method.implementation!!.tryBlocks.any { block ->
        address >= block.startCodeAddress && address < block.startCodeAddress + block.codeUnitCount &&
            block.exceptionHandlers.any { it.exceptionType == null || it.exceptionType == "Ljava/lang/Throwable;" }
    }
}

// Passes the check's result, in [register] after the call at [call], through PhoneBattery.[extensionMethod](Z)Z.
private fun passResult(method: MutableMethod, call: Int, register: Int, extensionMethod: String) =
    method.addInstructions(
        call + 2,
        """
            invoke-static/range { v$register .. v$register }, $PHONE_BATTERY_CLASS->$extensionMethod(Z)Z
            move-result v$register
        """.trimIndent(),
    )

// An enum constant of Maps' account element types: in a <clinit>, the name passed to a constructor of the enum and
// the new constant stored in a static field of the enum's own type.
private fun BytecodePatchContext.elementType(name: String): FieldReference {
    val fields = mutableListOf<FieldReference>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        val code = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
            ?: return@classDefForEach
        code.indices.filter { code[it].text() == name }.forEach { index ->
            val nameRegister = (code[index] as OneRegisterInstruction).registerA
            val init = (index + 1 until minOf(code.size, index + 6)).firstOrNull {
                code[it].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) && code[it].invoked()?.name == "<init>" &&
                    code[it].argumentRegisters().getOrNull(1) == nameRegister
            } ?: throw PatchException("Unexpected $name constant in ${classDef.type}")
            val store = code.getOrNull(init + 1)
            val field = store?.fieldOf()
            if (store?.opcode != Opcode.SPUT_OBJECT || (store as OneRegisterInstruction).registerA != code[init].argumentRegisters().first() ||
                field == null || field.type != classDef.type || field.definingClass != classDef.type ||
                code[init].invoked()?.definingClass != classDef.type
            ) {
                throw PatchException("Unexpected $name constant store in ${classDef.type}")
            }
            fields += field
        }
    }
    return fields.singleOrNull() ?: throw PatchException("Expected one $name constant, found ${fields.joinToString()}")
}

// Maps' check of the car energy permission: the one method without arguments that returns a boolean
// and holds the permission's name.
private fun BytecodePatchContext.carEnergyCheck(): String {
    val checks = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.parameterTypes.isNotEmpty() || method.returnType != "Z" || AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
            if (method.implementation?.instructions?.any { it.text() == CAR_ENERGY } == true) checks += method
        }
    }
    val check = checks.singleOrNull() ?: throw PatchException("Expected one $CAR_ENERGY check, found ${checks.joinToString()}")
    return check.definingClass + "->" + check.name + "()Z"
}
