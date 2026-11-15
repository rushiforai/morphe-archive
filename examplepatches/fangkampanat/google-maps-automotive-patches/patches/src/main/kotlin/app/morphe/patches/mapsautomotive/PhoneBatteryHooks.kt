package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
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
