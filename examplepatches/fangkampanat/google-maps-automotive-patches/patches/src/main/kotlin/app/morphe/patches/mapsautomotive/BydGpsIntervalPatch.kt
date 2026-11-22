package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// Maps' location wrapper passes a provider, an interval, a listener and a looper to LocationManager.requestLocationUpdates.
// In driving guidance without an uncalibrated gyroscope Maps calls it once with "gps" and 100 ms. GpsInterval
// turns that interval into 500 ms on a BYD at Android 10, where the car delivers a fix every 500 ms anyway.
// Required: one such wrapper, exactly one call of it with the literals "gps" and 100 written in a straight line right
// before the call, and that call alone in its method.

private const val GPS_INTERVAL_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/GpsInterval;"
private const val REQUEST_UPDATES =
    "Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V"
private val wrapperParameters =
    listOf("Ljava/lang/String;", "J", "Landroid/location/LocationListener;", "Landroid/os/Looper;")
private const val GPS_PROVIDER = "gps"
private const val MAPS_FAST_MS = 100L
private val wideLiterals = setOf(Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE, Opcode.CONST_WIDE_HIGH16)
private val gpsLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.BydGpsIntervalPatch")

@Suppress("unused")
val bydGpsIntervalPatch = bytecodePatch(
    name = "BYD GPS interval",
    description = "On BYD DiLink 3 (Android 10), asks for GPS every 500 ms instead of every 100 ms during guidance. " +
        "The car delivers a fix every 500 ms either way.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch)

    execute {
        requireExtensionMethod(GPS_INTERVAL_CLASS, "interval", listOf("J"), "J")
        hookFastGpsRequest()
        IncludedFeatures.features += "gps_interval"
    }
}

private fun gpsRegisters(i: Instruction): List<Int> = when (i) {
    is FiveRegisterInstruction -> listOf(i.registerC, i.registerD, i.registerE, i.registerF, i.registerG).take(i.registerCount)
    is RegisterRangeInstruction -> (i.startRegister until i.startRegister + i.registerCount).toList()
    else -> emptyList()
}

// Whether [i] writes [register], including as the high half of a wide value.
private fun gpsWrites(i: Instruction, register: Int): Boolean {
    if (!i.opcode.setsRegister()) return false
    val a = (i as? OneRegisterInstruction)?.registerA ?: return false
    return a == register || i.opcode.setsWideRegister() && a + 1 == register
}

// Indices of the instructions control can jump to in [method]: branch targets, switch cases and exception handlers.
internal fun jumpTargets(method: Method, code: List<Instruction>): Set<Int> {
    val addresses = IntArray(code.size)
    var position = 0
    code.forEachIndexed { i, instruction -> addresses[i] = position; position += instruction.codeUnits }
    val indexAt = addresses.withIndex().associate { (i, address) -> address to i }
    fun at(address: Int, what: String): Int = indexAt[address] ?: throw PatchException("Invalid $what target in $method")
    val targets = mutableSetOf<Int>()
    code.forEachIndexed { i, instruction ->
        if (instruction !is OffsetInstruction) return@forEachIndexed
        val target = at(addresses[i] + instruction.codeOffset, "branch")
        when (instruction.opcode) {
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                val payload = code[target] as? SwitchPayload ?: throw PatchException("No switch payload for $i in $method")
                payload.switchElements.forEach { targets += at(addresses[i] + it.offset, "switch") }
            }
            Opcode.FILL_ARRAY_DATA -> Unit
            else -> targets += target
        }
    }
    method.implementation?.tryBlocks?.forEach { block ->
        block.exceptionHandlers.forEach { targets += at(it.handlerCodeAddress, "handler") }
    }
    return targets
}

private fun BytecodePatchContext.hookFastGpsRequest() {
    // The wrapper: an instance (String, long, LocationListener, Looper)V method that requests location updates once.
    val wrappers = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.filterTo(wrappers) { method ->
            method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes.map { it.toString() } == wrapperParameters &&
                method.implementation?.instructions?.count { memberKey(it) == REQUEST_UPDATES } == 1
        }
    }
    val wrapper = wrappers.singleOrNull()
        ?: throw PatchException("Expected one Maps wrapper of $REQUEST_UPDATES, found ${wrappers.joinToString()}")
    val wrapperKey = "${wrapper.definingClass}->${wrapper.name}(${wrapperParameters.joinToString("")})V"

    class Site(val method: Method, val call: Int, val literal: Int, val register: Int, val callsInMethod: Int)
    val sites = mutableListOf<Site>()
    var calls = 0
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            val callIndices = code.indices.filter { memberKey(code[it]) == wrapperKey }
            if (callIndices.isEmpty()) return@forEach
            calls += callIndices.size
            val targets = jumpTargets(method, code)
            callIndices.forEach { call ->
                // this, provider, interval (two registers), listener, looper.
                val registers = gpsRegisters(code[call])
                if (registers.size != 6 || registers[3] != registers[2] + 1) return@forEach
                val provider = registers[1]
                val interval = registers[2]
                // The last write of each argument before the call, in a straight line: no branch, switch case or
                // exception handler lands after it.
                fun lastWrite(register: Int): Int? {
                    for (i in call - 1 downTo 0) {
                        if (gpsWrites(code[i], register)) return i.takeIf { w -> (w + 1..call).none { it in targets } }
                        if (i in targets) return null
                    }
                    return null
                }
                val providerWrite = lastWrite(provider) ?: return@forEach
                val intervalWrite = lastWrite(interval) ?: return@forEach
                val highWrite = lastWrite(interval + 1)
                val literal = code[intervalWrite]
                val isGps = ((code[providerWrite] as? ReferenceInstruction)?.reference as? StringReference)?.string == GPS_PROVIDER
                val isFast = literal.opcode in wideLiterals && (literal as OneRegisterInstruction).registerA == interval &&
                    (literal as WideLiteralInstruction).wideLiteral == MAPS_FAST_MS && highWrite == intervalWrite
                if (isGps && isFast) sites += Site(method, call, intervalWrite, interval, callIndices.size)
            }
        }
    }
    val site = sites.singleOrNull()
        ?: throw PatchException("Expected one \"$GPS_PROVIDER\" request of $MAPS_FAST_MS ms through $wrapperKey, found ${sites.size}")
    if (site.callsInMethod != 1) {
        throw PatchException("${site.method} calls $wrapperKey ${site.callsInMethod} times, expected once")
    }

    val register = site.register
    mutableMethodOf(site.method).addInstructions(
        site.literal + 1,
        """
            invoke-static/range { v$register .. v${register + 1} }, $GPS_INTERVAL_CLASS->interval(J)J
            move-result-wide v$register
        """.trimIndent(),
    )
    gpsLogger.info(
        "BYD GPS interval: ${site.method}: literal $MAPS_FAST_MS into v$register at ${site.literal}, call at ${site.call} " +
            "of $wrapperKey ($calls calls in Maps)",
    )
}
