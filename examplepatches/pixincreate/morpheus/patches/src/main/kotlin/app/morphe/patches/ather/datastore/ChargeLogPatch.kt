/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.datastore

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val RIDE_LOG = "Lapp/morphe/ather/RideLog;"
private const val TELEMETRY_BIKE = "Lcom/ather/common/datastore/models/ScooterShadow\$Telemetry\$Bike;"
private const val MARKER_FIELD = "$TELEMETRY_BIKE->bmsRcDisable:I"

/** The two opcodes that write a field, used to find the end of a deserialised object. */
internal val MARKER_WRITES = setOf(Opcode.IPUT, Opcode.IPUT_OBJECT)

/**
 * Inserts [smali] before every `return-void` that directly follows a write to
 * [markerField], and returns how many places were patched.
 *
 * The last field of a deserialised class is written right before the constructor
 * returns, so that is the only point where every field is readable. Later sites are
 * patched first, so the earlier indices stay valid while the list is being patched.
 */
internal fun MutableMethod.injectBeforeMarkerReturns(
    markerField: String,
    smali: String,
): Int {
    val body = implementation ?: return 0

    val returnIndices = body.instructions.withIndex()
        .filter { (index, instruction) ->
            instruction.opcode == Opcode.RETURN_VOID &&
                writesMarker(body.instructions.elementAtOrNull(index - 1), markerField)
        }
        .map { it.index }

    returnIndices.sortedDescending().forEach { addInstructions(it, smali) }

    return returnIndices.size
}

/** Returns whether [instruction] writes [markerField]. */
internal fun writesMarker(instruction: Instruction?, markerField: String): Boolean =
    instruction != null &&
        instruction.opcode in MARKER_WRITES &&
        (instruction as? ReferenceInstruction)?.reference?.toString() == markerField

/**
 * Records the charge sessions the scooter reports.
 *
 * The app writes the telemetry object field by field and stores `bmsRcDisable` last,
 * right before each constructor returns. The vehicle log receives the finished object
 * there, de-duplicates it and turns the state of charge changes into charge sessions.
 *
 * The class is obfuscated, so the marker field identifies the classes and the write
 * sites instead of a method signature. Three constructors end on that field: the
 * synthetic one the serialiser uses and the two the app calls directly.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * iput p1, p0, Lcom/ather/common/datastore/models/ScooterShadow$Telemetry$Bike;->bmsRcDisable:I
 *
 * invoke-static {p0}, Lapp/morphe/ather/RideLog;->onBikeFull(Ljava/lang/Object;)V
 *
 * return-void
 * ```
 */
@Suppress("unused")
val chargeLogPatch = bytecodePatch(
    name = "Charge log",
    description = "Records the charge sessions the scooter reports, so the Morphe history screen can show them.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        val smali = "invoke-static {p0}, $RIDE_LOG->onBikeFull(Ljava/lang/Object;)V"

        val patched = mutableClassDefBy(TELEMETRY_BIKE).methods.sumOf { method ->
            method.injectBeforeMarkerReturns(MARKER_FIELD, smali)
        }

        if (patched == 0) {
            throw IllegalStateException("Scooter telemetry constructors do not write $MARKER_FIELD.")
        }
    }
}
