package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21s
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22s
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Car map zoom (opt-in, default off, Experimental).
 *
 * `CONFIG_VALUE_AAOS_MAP_SCALE_FACTOR_TIMES_TEN` is a Long config with **no Java reader** in 5.26 -
 * the car map scale is applied inside the engine, which reads the native store by id. There is no
 * getter to override, so the only way in is the same native write the new-alert-icons row uses.
 *
 * The id is not hardcoded: it is parsed out of the target APK's `ConfigValues.<clinit>` at patch time
 * (the `const` feeding the `com/waze/config/f;-><init>` that constructs the field), so a build that
 * renumbers configs gets the right id instead of silently rewriting somebody else's setting. If the
 * construction shape ever changes, the row fails loudly rather than guessing.
 *
 * Write window: the entry of `ConfigManager.setConfigValueBool(b, Z)`. It fires every time Waze
 * persists any boolean config - during startup and after a config sync - and it is a method no other
 * row touches. The write is idempotent, so repeated calls cost nothing.
 *
 * Honest caveat: whether the engine honours a value written after it first read the scale cannot be
 * checked off-device (the native library carries no config names, only ids), so this row may do
 * nothing on some units. That is why it is Experimental and off by default.
 */
private val ConfigValuesInitFingerprint = Fingerprint(
    definingClass = "Lcom/waze/config/ConfigValues;",
    name = "<clinit>",
    parameters = emptyList(),
    returnType = "V",
)

private val ConfigBooleanSetterFingerprint = Fingerprint(
    definingClass = "Lcom/waze/ConfigManager;",
    name = "setConfigValueBool",
    parameters = listOf("Lcom/waze/config/b;", "Z"),
    returnType = "V",
)

private const val SCALE_FIELD = "CONFIG_VALUE_AAOS_MAP_SCALE_FACTOR_TIMES_TEN"

@Suppress("unused")
val carMapZoomPatch = bytecodePatch(
    name = "Car map zoom",
    description = "Zooms the map on the car screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    val zoom by stringOption(
        "zoom", "1.5x",
        mapOf(
            "1.0x (stock)" to "1.0x",
            "1.25x" to "1.25x",
            "1.5x" to "1.5x",
            "2.0x" to "2.0x",
        ),
        title = "Car map zoom",
        description = "Map scale on the car screen.",
    )

    execute {
        val scale = (zoom ?: "1.5x").removeSuffix("x").toDouble()
        val tenths = Math.round(scale * 10).toLong()

        val clinit = ConfigValuesInitFingerprint.method.implementation
            ?: throw PatchException("carMapZoomPatch: ConfigValues.<clinit> has no implementation")
        val body = clinit.instructions.toList()

        val sput = body.indexOfFirst { instruction ->
            instruction.opcode == Opcode.SPUT_OBJECT &&
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.endsWith("->$SCALE_FIELD:Lcom/waze/config/c;") == true
        }
        if (sput < 0) throw PatchException("carMapZoomPatch: $SCALE_FIELD is not constructed in <clinit>")

        val init = (sput downTo 0).firstOrNull { index ->
            val instruction = body[index]
            instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.startsWith("Lcom/waze/config/f;-><init>(") == true
        } ?: throw PatchException("carMapZoomPatch: could not find the config constructor for $SCALE_FIELD")

        // The id is the first constructor argument: the nearest integer const before the invoke.
        val id = (init - 1 downTo maxOf(0, init - 24)).firstNotNullOfOrNull { index ->
            when (val instruction = body[index]) {
                is Instruction21s -> if (instruction.opcode == Opcode.CONST_16) instruction.narrowLiteral else null
                is Instruction31i -> if (instruction.opcode == Opcode.CONST) instruction.narrowLiteral else null
                is Instruction22s -> if (instruction.opcode == Opcode.CONST_16) instruction.narrowLiteral else null
                else -> null
            }
        } ?: throw PatchException("carMapZoomPatch: could not read the config id for $SCALE_FIELD")

        if (id <= 0 || id > 0xffff) {
            throw PatchException("carMapZoomPatch: implausible config id $id for $SCALE_FIELD")
        }

        val setter = ConfigBooleanSetterFingerprint.method
        setter.addInstructions(
            0,
            """
                const/16 v0, 0x${id.toString(16)}
                const-wide/16 v1, 0x${tenths.toString(16)}
                invoke-virtual {p0, v0, v1, v2}, Lcom/waze/ConfigManager;->setConfigValueLongNTV(IJ)V
            """.trimIndent(),
        )

        println(
            "carMapZoomPatch: $SCALE_FIELD (id 0x${id.toString(16)}) set to ${scale}x " +
                "= ${tenths}L on every boolean config write",
        )
    }
}
