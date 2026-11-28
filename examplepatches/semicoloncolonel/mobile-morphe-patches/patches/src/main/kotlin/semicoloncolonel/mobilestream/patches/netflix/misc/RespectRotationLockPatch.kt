package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants

// Netflix asks for SCREEN_ORIENTATION_SENSOR_LANDSCAPE (6) when a video
// plays, and a few other sensor orientations elsewhere. Sensor orientations
// follow the phone's position even when auto-rotate is off, so the player
// flips between the two landscape sides while the phone is locked. Every
// Activity.setRequestedOrientation call in the app (33 on 9.93.0) now goes
// through RotationLock, which swaps each sensor orientation for the matching
// user orientation (6 becomes USER_LANDSCAPE). User orientations turn the
// screen only when auto-rotate is on, so Netflix still turns to landscape for
// a video but stays on one side while rotation is locked.
//
// Netflix also reads the orientation back and compares it with 6: the player
// keeps landscape only while getRequestedOrientation still returns
// SENSOR_LANDSCAPE, and switches to FULL_USER otherwise, which would follow a
// portrait rotation lock. Every Activity.getRequestedOrientation call (7 on
// 9.93.0) also goes through RotationLock, which returns the value Netflix
// asked for while the swapped one is in effect.

private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"
private const val ROTATION_LOCK = "Lsemicoloncolonel/mobilestream/extension/netflix/misc/RotationLock;"

// The Activity method each call goes to, and the helper that replaces it. The
// helper takes the activity as its first parameter, so the registers stay.
private enum class OrientationCall(val parameters: List<String>, val returnType: String, val helper: String) {
    SET(listOf("I"), "V", "$ROTATION_LOCK->setRequestedOrientation(Landroid/app/Activity;I)V"),
    GET(emptyList(), "I", "$ROTATION_LOCK->getRequestedOrientation(Landroid/app/Activity;)I"),
}

private fun Instruction.orientationCall(): OrientationCall? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    if (reference.definingClass != "Landroid/app/Activity;") return null
    val call = when (reference.name) {
        "setRequestedOrientation" -> OrientationCall.SET
        "getRequestedOrientation" -> OrientationCall.GET
        else -> return null
    }
    return call.takeIf {
        reference.returnType == it.returnType && reference.parameterTypes.map { type -> type.toString() } == it.parameters
    }
}

@Suppress("unused")
val respectRotationLockPatch = bytecodePatch(
    name = "Respect rotation lock",
    description = "Keeps the player on one side of landscape while auto-rotate is off. Without it, " +
        "Netflix turns the video upside down when you turn the phone, even with rotation locked.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Collect first, mutate after: mutableClassDefBy swaps the class map
        // entry, which must not happen mid-iteration.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.orientationCall() != null } == true
                }
            ) {
                targets += classDef.type
            }
        }

        val replaced = mutableMapOf<OrientationCall, Int>()
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                // Snapshot: replaceInstruction mutates the live list.
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val call = instruction.orientationCall() ?: return@forEachIndexed
                    val smali = when (instruction) {
                        is FiveRegisterInstruction -> {
                            val registers = listOf(
                                instruction.registerC, instruction.registerD,
                            ).take(instruction.registerCount)
                            "invoke-static {${registers.joinToString { "v$it" }}}, ${call.helper}"
                        }
                        is RegisterRangeInstruction ->
                            "invoke-static/range { v${instruction.startRegister} .. " +
                                "v${instruction.startRegister + instruction.registerCount - 1} }, ${call.helper}"
                        else -> throw PatchException("Unexpected ${call.name} orientation call in $type")
                    }
                    method.replaceInstruction(index, smali)
                    replaced.merge(call, 1, Int::plus)
                }
            }
        }
        // Without the reads, Netflix would see the swapped value and leave
        // landscape, so both kinds of call must be there.
        OrientationCall.entries.forEach { call ->
            if (replaced[call] == null) throw PatchException("No ${call.name} orientation calls found")
        }
    }
}
