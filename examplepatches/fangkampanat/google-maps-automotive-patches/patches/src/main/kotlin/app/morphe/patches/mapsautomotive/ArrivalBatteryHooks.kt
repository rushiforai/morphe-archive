package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// Battery on arrival, part of the BYD battery patch. Maps plans EV charging stops so the car reaches
// each charger and the destination with at least a set battery level. It takes both levels from the
// car maker's settings for Maps, which BYD does not have, and otherwise uses Google's default. Each
// level has one getter: it reads Maps' preference (0 when unset) and returns it, or Google's default
// when it is 0. Every other use of the preference must be a write (the car maker's settings) or a debug
// dump, so every reader of the levels calls these getters, among them the vehicle info Maps uploads
// for its EV routes. The preference read passes through ArrivalBattery, which gives the level
// chosen in the BYD battery dialog, or Maps' value for Auto. On the fallback path Google's default
// also goes to ArrivalBattery, for the dialog and the report.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

private const val ARRIVAL_BATTERY_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/ArrivalBattery;"
private val arrivalLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.ArrivalBatteryHooks")

// A level: Maps' preference key, the ArrivalBattery method for the read and the one for Google's default.
private class ArrivalLevel(val key: String, val level: String, val googleDefault: String)

private val ARRIVAL_LEVELS = listOf(
    ArrivalLevel("ev_target_charging_station_minimum_arrival_battery_percentage", "chargingStop", "mapsChargingStop"),
    ArrivalLevel("ev_target_final_destination_arrival_battery_percentage", "destination", "mapsDestination"),
)

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun Instruction.overwrites(register: Int) =
    opcode.setsRegister() && (this as OneRegisterInstruction).registerA.let {
        it == register || opcode.setsWideRegister() && it + 1 == register
    }

private fun FieldReference.key() = "$definingClass->$name:$type"

internal fun BytecodePatchContext.useArrivalBattery() {
    ARRIVAL_LEVELS.forEach { level ->
        requireExtensionMethod(ARRIVAL_BATTERY_CLASS, level.level, listOf("I"), "I")
        requireExtensionMethod(ARRIVAL_BATTERY_CLASS, level.googleDefault, listOf("I"), "V")
        passArrivalLevel(level, arrivalPreference(level.key))
    }
}

// Maps' preference for [key]: in a <clinit>, the key passed to a constructor and the new preference
// stored in a static field.
private fun BytecodePatchContext.arrivalPreference(key: String): FieldReference {
    val fields = mutableListOf<FieldReference>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        val code = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
            ?: return@classDefForEach
        code.indices.filter { code[it].string() == key }.forEach { index ->
            val register = (code[index] as OneRegisterInstruction).registerA
            val init = (index + 1 until minOf(code.size, index + 4)).firstOrNull {
                code[it].opcode == Opcode.INVOKE_DIRECT && code[it].method()?.name == "<init>" &&
                    code[it].registers().getOrNull(1) == register
            } ?: throw PatchException("Unexpected $key preference in ${classDef.type}")
            val store = code.getOrNull(init + 1)
            val field = store?.field()
            if (store?.opcode != Opcode.SPUT_OBJECT || (store as OneRegisterInstruction).registerA != code[init].registers().first() ||
                field == null
            ) {
                throw PatchException("Unexpected $key preference store in ${classDef.type}")
            }
            fields += field
        }
    }
    return fields.singleOrNull() ?: throw PatchException("Expected one $key preference, found ${fields.joinToString()}")
}

// Every other load of [preference] passes it to a setter (preference, int) returning void, as the car
// maker's settings do, or is in a dump method (with a PrintWriter parameter). A new reader fails.
private fun BytecodePatchContext.requireOnlyGetterReads(level: ArrivalLevel, preference: FieldReference, getter: Method) {
    val others = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.name == getter.name && method.definingClass == getter.definingClass &&
                method.parameterTypes == getter.parameterTypes && method.returnType == getter.returnType
            ) {
                return@forEach
            }
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            val dump = method.parameterTypes.any { it.toString() == "Ljava/io/PrintWriter;" }
            code.indices.filter { code[it].opcode == Opcode.SGET_OBJECT && code[it].field()?.key() == preference.key() }.forEach { read ->
                val register = (code[read] as OneRegisterInstruction).registerA
                val call = (read + 1 until minOf(code.size, read + 6)).firstOrNull { code[it].registers().getOrNull(1) == register }
                val reference = call?.let { code[it].method() }
                val write = reference != null && reference.returnType == "V" &&
                    reference.parameterTypes.map { it.toString() } == listOf(preference.type, "I")
                if (!write && !dump) others += "$method at $read"
            }
        }
    }
    if (others.isNotEmpty()) throw PatchException("Unexpected reads of the ${level.key} preference outside $getter: $others")
}

// The getter: no arguments, returns int; sget-object preference, call(settings, preference, 0) returning
// int, move-result vR, if-nez vR to its only return vR, else Google's default read into vR (an int
// field) right before that return.
private fun BytecodePatchContext.passArrivalLevel(level: ArrivalLevel, preference: FieldReference) {
    val getters = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.parameterTypes.isNotEmpty() || method.returnType != "I") return@forEach
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.filter { code[it].opcode == Opcode.SGET_OBJECT && code[it].field()?.key() == preference.key() }.forEach { read ->
                val register = (code[read] as OneRegisterInstruction).registerA
                val call = (read + 1 until minOf(code.size, read + 4)).firstOrNull {
                    code[it].opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL) &&
                        code[it].registers().let { registers -> registers.size == 3 && registers[1] == register }
                } ?: return@forEach
                val reference = code[call].method()!!
                if ((read + 1 until call).none { code[it].overwrites(register) } && reference.returnType == "I" &&
                    reference.parameterTypes.map { it.toString() } == listOf(preference.type, "I") &&
                    code.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT
                ) {
                    getters += method to call + 1
                }
            }
        }
    }
    val (getter, result) = getters.singleOrNull()
        ?: throw PatchException("Expected one int getter of the ${level.key} preference, found ${getters.map { it.first }}")
    requireOnlyGetterReads(level, preference, getter)

    val method = mutableMethodOf(getter)
    val code = method.implementation!!.instructions
    fun unexpected(reason: String): Nothing = throw PatchException("Unexpected ${level.key} getter $getter: $reason")
    val register = (code[result] as OneRegisterInstruction).registerA
    val branch = code.getOrNull(result + 1)
    if (branch?.opcode != Opcode.IF_NEZ || (branch as OneRegisterInstruction).registerA != register) {
        unexpected("no if-nez on the preference value")
    }
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN }
    val exit = returns.singleOrNull() ?: unexpected("${returns.size} int returns")
    if ((code[exit] as OneRegisterInstruction).registerA != register) unexpected("the return is not the preference register")
    val target = (branch as OffsetInstruction).codeOffset + branch.location.codeAddress
    if (code[exit].location.codeAddress != target) unexpected("the if-nez does not go to the return")
    val fallback = code[exit - 1]
    if (fallback.opcode != Opcode.IGET || (fallback as TwoRegisterInstruction).registerA != register || fallback.field()?.type != "I") {
        unexpected("Google's default is not read right before the return")
    }
    if (exit <= result + 2) unexpected("no fallback path")
    // Inserted code before a branch target would be skipped by that branch.
    if (branch.location.labels.isNotEmpty()) unexpected("the if-nez is a branch target")

    // At the return, before its label's instruction: only the fallback path reaches it, the if-nez
    // jumps past it to the return. Added first, so the index of the preference read stays valid.
    method.addInstructions(
        exit,
        "invoke-static/range { v$register .. v$register }, $ARRIVAL_BATTERY_CLASS->${level.googleDefault}(I)V",
    )
    method.addInstructions(
        result + 1,
        """
            invoke-static/range { v$register .. v$register }, $ARRIVAL_BATTERY_CLASS->${level.level}(I)I
            move-result v$register
        """.trimIndent(),
    )
    arrivalLogger.info(
        "Battery on arrival: $getter reads ${preference.key()} (${level.key}) into v$register at $result through " +
            "ArrivalBattery.${level.level}; Google's default ${fallback.field()!!.key()} through ArrivalBattery.${level.googleDefault}",
    )
}
