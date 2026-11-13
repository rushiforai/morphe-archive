/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Asked for in #25. Hushfeed's SIM spoof (GPL-3.0) was the behavior reference: the same
 * TelephonyManager and CellIdentity reads, each answered right after its move-result. Found on 455
 * by reading which telephony methods its dex calls (2026-11-12).
 */
package app.morphe.patches.threads.misc.sim

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Spoof SIM region"
internal const val SIM_REGION = "$EXTENSION_PACKAGE/misc/SimRegion;"
private const val STRING = "Ljava/lang/String;"
private const val CHARS = "Ljava/lang/CharSequence;"
internal const val TELEPHONY = "Landroid/telephony/TelephonyManager;"
internal const val SUBSCRIPTION = "Landroid/telephony/SubscriptionInfo;"
/** CellIdentity and each of its kinds (Gsm, Lte, Wcdma, Nr and the rest) start with this. */
internal const val CELL = "Landroid/telephony/CellIdentity"

/** One read of the SIM or network: its name, the type it answers, and the extension method answering in its place. */
internal data class SimRead(val name: String, val type: String, val hook: String) {
    /** What the patch puts after the read's move-result, which leaves the answer in [register]. */
    fun answer(register: Int): String {
        val move = if (type == "I") "move-result" else "move-result-object"
        return """
            invoke-static/range { v$register .. v$register }, $SIM_REGION->$hook($type)$type
            $move v$register
        """
    }
}

internal val TELEPHONY_READS = listOf(
    SimRead("getSimCountryIso", STRING, "countryIso"),
    SimRead("getNetworkCountryIso", STRING, "countryIso"),
    SimRead("getSimOperator", STRING, "operator"),
    SimRead("getNetworkOperator", STRING, "operator"),
    SimRead("getSimOperatorName", STRING, "operatorName"),
    SimRead("getNetworkOperatorName", STRING, "operatorName"),
    SimRead("getSimCarrierIdName", CHARS, "carrierLabel"),
    SimRead("getSimCarrierId", "I", "carrierId"),
)

internal val SUBSCRIPTION_READS = listOf(
    SimRead("getCountryIso", STRING, "countryIso"),
    SimRead("getMccString", STRING, "mcc"),
    SimRead("getMncString", STRING, "mnc"),
    SimRead("getMcc", "I", "mccNumber"),
    SimRead("getMnc", "I", "mncNumber"),
    SimRead("getCarrierName", CHARS, "carrierLabel"),
    SimRead("getDisplayName", CHARS, "carrierLabel"),
)

internal val CELL_READS = listOf(
    SimRead("getMccString", STRING, "mcc"),
    SimRead("getMncString", STRING, "mnc"),
    SimRead("getMcc", "I", "mccNumber"),
    SimRead("getMnc", "I", "mncNumber"),
    SimRead("getOperatorAlphaLong", CHARS, "carrierLabel"),
    SimRead("getOperatorAlphaShort", CHARS, "carrierLabel"),
)

/** The read [call] makes, or null when it isn't one this patch answers. */
internal fun simRead(call: MethodReference): SimRead? {
    val reads = when {
        call.definingClass == TELEPHONY -> TELEPHONY_READS
        call.definingClass == SUBSCRIPTION -> SUBSCRIPTION_READS
        call.definingClass.startsWith(CELL) -> CELL_READS
        else -> return null
    }
    return reads.firstOrNull { it.name == call.name && it.type == call.returnType }
}

/** Each read in [method] whose answer Threads keeps, by the index of its call. */
internal fun simReads(method: Method): List<Pair<Int, SimRead>> {
    val instructions = method.implementation?.instructions?.toList() ?: return emptyList()
    return instructions.withIndex().mapNotNull { (index, instruction) ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@mapNotNull null
        val read = instruction.getReference<MethodReference>()?.let(::simRead) ?: return@mapNotNull null
        // A read whose answer is dropped tells Threads nothing.
        val kept = if (read.type == "I") Opcode.MOVE_RESULT else Opcode.MOVE_RESULT_OBJECT
        if (instructions.getOrNull(index + 1)?.opcode != kept) return@mapNotNull null
        index to read
    }
}

/** Every method outside the extension that reads the SIM or the network. */
internal fun BytecodePatchContext.simReaders(): List<Method> {
    val found = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.filterTo(found) { simReads(it).isNotEmpty() }
    }
    return found
}

/**
 * Makes Threads see a SIM from the region you pick.
 *
 * Threads, like Meta's other apps, reads the SIM's and the network's country, network code and
 * carrier from TelephonyManager, the same from each SubscriptionInfo, and a cell's MCC, MNC and
 * operator name, and sends what it reads along with its requests. Right after each of those reads
 * the extension gets the answer and hands back the chosen region's, or Threads' own when the switch
 * is off. The answer lands back in the register Threads read it into, so nothing after the read
 * changes.
 *
 * Every anchor is a framework signature, so a renamed build still finds them, and the patch refuses
 * when no read is left to change.
 */
@Suppress("unused")
val spoofSimRegionPatch = bytecodePatch(
    name = PATCH,
    description = "Threads sees a SIM and network from a country you pick, with one of that country's real " +
        "carriers, instead of your own. Meta can still go by your connection and your account. Starts off. " +
        "Turn it on in HushThreads settings > Privacy.",
) {
    category("Privacy")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("spoofSimRegion")
        // Everything is found before anything changes, so a refusal leaves the app as it was.
        val readers = simReaders()
        if (readers.isEmpty()) throw PatchException("$PATCH: Threads reads no SIM or network country or carrier")

        for (reader in readers) {
            val method = mutableClassDefBy(reader.definingClass).findMutableMethodOf(reader)
            // From the last read up, so the indices still to come stay where they were found.
            for ((index, read) in simReads(reader).asReversed()) {
                val register = method.getInstruction<OneRegisterInstruction>(index + 1).registerA
                method.addInstructions(index + 2, read.answer(register))
            }
        }
        enableStatus("spoofSimRegion")
    }
}
