package app.gboardios.patches.globeswitch

import app.gboardios.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.gboardios.patches.signature.signatureCheckBypassPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val GLOBE_INTERVAL = "globe_key_ignore_time_interval"

/**
 * Gboard ignores the globe key for `globe_key_ignore_time_interval` ms (500 by default) after a
 * key is typed on Latin keyboards; the CJK keyboards use a separate interval of 0. `LatinIme`
 * hands the value to the native decoder (class `ifb`, flag `u` in Gboard 18.5.4):
 *
 *     float interval = ((Long) ifb.u.g()).longValue();
 *     config.b |= 8;
 *     config.h = interval;
 *
 * The patch replaces the conversion with 0, so neither the default nor a server flag delays the
 * globe key.
 */
internal object GlobeIntervalFlagFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf(GLOBE_INTERVAL),
)

@Suppress("unused")
val immediateGlobeSwitchPatch = patch(
    name = "Immediate globe key",
    description = "Lets the globe key switch languages right after typing on the letter keyboards, " +
        "as it does on iOS. Gboard otherwise ignores it for half a second after a key is typed.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(signatureCheckBypassPatch)

    execute {
        val initializer = GlobeIntervalFlagFingerprint.originalMethod.implementation!!.instructions.toList()
        val keyIndex = initializer.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == GLOBE_INTERVAL
        }
        val flag = initializer.drop(keyIndex).first { it.opcode == Opcode.SPUT_OBJECT }
            .let { (it as ReferenceInstruction).reference as FieldReference }

        val method = Fingerprint(
            definingClass = "Lcom/google/android/apps/inputmethod/libs/latin5/LatinIme;",
            custom = { method, _ ->
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference == flag
                } == true
            },
        ).method
        val instructions = method.implementation!!.instructions.toList()
        val readIndex = instructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference == flag
        }
        val conversionIndex = instructions.withIndex().drop(readIndex + 1)
            .first { it.value.opcode == Opcode.LONG_TO_FLOAT || it.value.opcode == Opcode.SGET_OBJECT }
            .also { check(it.value.opcode == Opcode.LONG_TO_FLOAT) { "No conversion of the globe interval" } }
            .index
        val interval = (instructions[conversionIndex] as TwoRegisterInstruction).registerA
        val store = instructions.drop(conversionIndex + 1).first {
            it.opcode == Opcode.IPUT && ((it as ReferenceInstruction).reference as FieldReference).type == "F"
        }
        check((store as OneRegisterInstruction).registerA == interval) { "The globe interval is not stored" }

        method.replaceInstruction(conversionIndex, "const/4 v$interval, 0x0")
    }
}
