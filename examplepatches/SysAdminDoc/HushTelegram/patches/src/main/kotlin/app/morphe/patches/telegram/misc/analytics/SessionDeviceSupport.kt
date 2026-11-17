/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SESSION_DEVICE = "$EXTENSION_PACKAGE/misc/SessionDevice;"
internal const val SESSION_DEVICE_MODEL = "$SESSION_DEVICE->model(Ljava/lang/String;)Ljava/lang/String;"
internal const val SESSION_DEVICE_SYSTEM = "$SESSION_DEVICE->system(Ljava/lang/String;)Ljava/lang/String;"
internal const val SESSION_DEVICE_VERSION = "$SESSION_DEVICE->version(I)I"
private const val STRING = "Ljava/lang/String;"

/** ConnectionsManager.init's declared parameters on 13.2: version, layer, api id, nine strings, then the rest. */
internal val CONNECTIONS_INIT_PARAMETERS = listOf("I", "I", "I") + List(9) { STRING } + listOf("I", "J", "Z", "Z")

/** init's declared build number, then its device name and system version, the two strings after the api id. */
internal const val INIT_VERSION_PARAMETER = 0
internal const val INIT_MODEL_PARAMETER = 3
internal const val INIT_SYSTEM_PARAMETER = 4

/** native_init takes the account first, then init's version, layer and api id, then the same two strings. */
private const val NATIVE_VERSION_SLOT = 1
private const val NATIVE_MODEL_SLOT = 4
private const val NATIVE_SYSTEM_SLOT = 5
private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val INT_MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

/** ConnectionsManager.init, which hands each account's device name and system version to the native connection. */
internal class SessionDeviceSite(val method: MutableMethod) {
    /**
     * Passes both through the extension at the top of init, before anything reads them, and the
     * build number too, which the connection compares with the one it saved to decide whether to
     * send the device again. The answers go back in the parameters' own registers, so the rest of
     * init stays as it was.
     */
    fun apply() {
        val model = method.parameterRegister(INIT_MODEL_PARAMETER)
        val system = method.parameterRegister(INIT_SYSTEM_PARAMETER)
        val version = method.parameterRegister(INIT_VERSION_PARAMETER)
        method.addInstructions(0,
            "invoke-static/range {$model .. $model}, $SESSION_DEVICE_MODEL\n" +
                "move-result-object $model\n" +
                "invoke-static/range {$system .. $system}, $SESSION_DEVICE_SYSTEM\n" +
                "move-result-object $system\n" +
                "invoke-static/range {$version .. $version}, $SESSION_DEVICE_VERSION\n" +
                "move-result $version")
    }
}

/**
 * The device in Active sessions' target (#79): ConnectionsManager.init, which its constructor
 * calls with the device name (maker and model) and system version ("SDK" and the API level) it
 * built, and which moves both straight into native_init's device slots, with the build number the
 * connection checks before it sends them again. ConnectionsManager and its native methods keep
 * their names, so they're found by name, and each slot is checked to be filled from init's own
 * parameter, still holding what it came in with.
 */
internal fun BytecodePatchContext.resolveSessionDevice(): SessionDeviceSite {
    val owner = tgMutableClassDefByOrNull(CONNECTIONS_MANAGER) ?: throw PatchException("ConnectionsManager is missing")
    val method = owner.methods.singleOrNull { it.origName == "init" && it.origReturnType == "V" &&
        it.origParameterTypes == CONNECTIONS_INIT_PARAMETERS && it.implementation != null &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("ConnectionsManager no longer starts its connection the way 13.2 does")
    val instructions = method.implementation!!.instructions.toList()
    val calls = instructions.withIndex().filter { (_, instruction) ->
        val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_STATIC_RANGE && called != null &&
            called.origDefiningClass == CONNECTIONS_MANAGER && called.origName == "native_init"
    }
    if (calls.size != 1) throw PatchException("ConnectionsManager.init starts the native connection ${calls.size} times, not once")
    val (callAt, call) = calls.single()
    val types = ((call as ReferenceInstruction).reference as MethodReference).origParameterTypes
    if (types.take(NATIVE_MODEL_SLOT) != listOf("I", "I", "I", "I") || types.getOrNull(NATIVE_MODEL_SLOT) != STRING ||
        types.getOrNull(NATIVE_SYSTEM_SLOT) != STRING) {
        throw PatchException("the native connection no longer takes the device after the account, version, layer and api id")
    }
    val start = (call as RegisterRangeInstruction).startRegister
    val slots = listOf(Slot(NATIVE_VERSION_SLOT, INIT_VERSION_PARAMETER, "build number", INT_MOVES),
        Slot(NATIVE_MODEL_SLOT, INIT_MODEL_PARAMETER, "device name", OBJECT_MOVES),
        Slot(NATIVE_SYSTEM_SLOT, INIT_SYSTEM_PARAMETER, "system version", OBJECT_MOVES))
    for ((slot, parameter, what, moves) in slots) {
        // The slots before the device are one-register ints, so each is that far into the range.
        val register = start + slot
        val moveAt = (callAt - 1 downTo 0).firstOrNull { at ->
            instructions[at].opcode.setsRegister() && (instructions[at] as? OneRegisterInstruction)?.registerA == register
        } ?: throw PatchException("nothing fills the native connection's $what")
        val move = instructions[moveAt]
        if (move.opcode !in moves || (move as TwoRegisterInstruction).registerB != method.parameterRegisterNumber(parameter)) {
            throw PatchException("the native connection's $what no longer comes straight from init's")
        }
        method.requireParameterIntact("the session $what", parameter, listOf(moveAt))
    }
    return SessionDeviceSite(method)
}

/** One native_init slot the patch changes, the init parameter it must come from, and the moves that may copy it. */
private data class Slot(val slot: Int, val parameter: Int, val what: String, val moves: Set<Opcode>)
