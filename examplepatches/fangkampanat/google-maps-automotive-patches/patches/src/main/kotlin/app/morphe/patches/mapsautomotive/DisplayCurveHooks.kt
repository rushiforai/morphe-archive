package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// Battery percentages, part of the BYD battery patch. Maps builds every battery level it shows, the car's own and each
// destination's arrival, in one static method (energy Wh, capacity Wh, config holder): the real percentage is
// energy × 100 / capacity; a display percentage follows a list of (real %, display %) points from a server config (linear
// between them, (0, 0) and (100, 100) at the ends; the list is empty on BYD cars), and Maps shows its whole part, at most
// 100. The method ends with the level's constructor, invoke-direct/range (level, energy, capacity, real, raw display,
// display). Right before it, the display and then the raw display pass through BydDisplayCurve, which gives this car's
// dashboard percentage (more energy per percent above 90 %) while BYD battery is on and returns Maps' values otherwise.
// The level class is the one whose toString starts with "BatteryLevel(batteryLevelWh=". Its own <clinit> builds a
// default level; any other constructor call fails the patch, as do a missing anchor and an unknown layout.

private const val DISPLAY_CURVE_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/BydDisplayCurve;"
private const val BATTERY_LEVEL_TEXT = "BatteryLevel(batteryLevelWh="
private val displayCurveLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.DisplayCurveHooks")

internal fun BytecodePatchContext.useDisplayCurve() {
    requireExtensionMethod(DISPLAY_CURVE_CLASS, "display", listOf("I", "I", "D", "D", "I"), "I")
    requireExtensionMethod(DISPLAY_CURVE_CLASS, "rawDisplay", listOf("I", "I", "D", "D"), "D")

    val levels = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        val toString = classDef.methods.firstOrNull {
            it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        } ?: return@classDefForEach
        val text = toString.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == BATTERY_LEVEL_TEXT
        } ?: false
        if (text) levels += classDef.type
    }
    val level = levels.singleOrNull() ?: throw PatchException("Expected one battery level class, found $levels")

    // Every call of the level's (int, int, double, double, int) constructor.
    val calls = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.forEachIndexed { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
                if (reference.definingClass == level && reference.name == "<init>" &&
                    reference.parameterTypes.map { it.toString() } == listOf("I", "I", "D", "D", "I")
                ) {
                    calls += method to index
                }
            }
        }
    }
    val (builder, index) = calls.filterNot { (method, _) -> method.definingClass == level && method.name == "<clinit>" }
        .singleOrNull()
        ?: throw PatchException("Expected one battery level builder besides $level's <clinit>, found ${calls.map { it.first }}")
    if (!AccessFlags.STATIC.isSet(builder.accessFlags) || builder.returnType != level ||
        builder.parameterTypes.map { it.toString() }.take(2) != listOf("I", "I") || builder.parameterTypes.size != 3
    ) {
        throw PatchException("Unexpected battery level builder $builder")
    }
    val code = builder.implementation!!.instructions.toList()
    val call = code[index]
    if (call.opcode != Opcode.INVOKE_DIRECT_RANGE || (call as RegisterRangeInstruction).registerCount != 8) {
        throw PatchException("Unexpected battery level constructor call in $builder at $index")
    }
    // Code inserted before the call runs on every path only if nothing jumps to the call itself.
    if (index in jumpTargets(builder, code)) throw PatchException("A jump reaches the battery level constructor in $builder")
    // (level, energy, capacity, real, raw display, display): the doubles take two registers each.
    val first = call.startRegister
    val energy = first + 1
    val raw = first + 5
    val display = first + 7

    mutableMethodOf(builder).addInstructions(
        index,
        """
            invoke-static/range { v$energy .. v$display }, $DISPLAY_CURVE_CLASS->display(IIDDI)I
            move-result v$display
            invoke-static/range { v$energy .. v${raw + 1} }, $DISPLAY_CURVE_CLASS->rawDisplay(IIDD)D
            move-result-wide v$raw
        """.trimIndent(),
    )
    displayCurveLogger.info("Battery percentages: $builder at $index (level $level)")
}
