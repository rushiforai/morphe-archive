package app.morphe.patches.all.misc.connectivity.telephony.sim.spoof

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.util.formatCount
import app.morphe.patches.util.patchLogger
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.util.*

@Suppress("unused")
val spoofSIMProviderPatch = bytecodePatch(
    name = "Spoof SIM provider",
    description = "Spoofs information about the SIM card provider.",
    default = false,
) {
    category("Connectivity")

    val countries = Locale.getISOCountries().associateBy { Locale("", it).displayCountry }

    fun isoCountryPatchOption(
        key: String,
        title: String,
    ) = stringOption(
        key = key,
        default = null,
        values = countries,
        title = title,
        description = "ISO-3166-1 alpha-2 country code equivalent for the SIM provider's country code.",
        required = false,
    ) { it: String? -> it == null || it.uppercase() in countries.values }

    fun isMccMncValid(it: String?) = it.isNullOrBlank() || it.toIntOrNull()?.let { v -> v in 10000..999999 } == true

    val networkCountryIso by isoCountryPatchOption(
        key = "networkCountryIso",
        title = "Network ISO country code",
    )

    val networkOperator by stringOption(
        key = "networkOperator",
        title = "MCC+MNC network operator code",
        description = "The 5 or 6 digits MCC+MNC (Mobile Country Code + Mobile Network Code) of the network operator.",
        required = false,
    ) { isMccMncValid(it) }

    val networkOperatorName by stringOption(
        key = "networkOperatorName",
        title = "Network operator name",
        description = "The full name of the network operator.",
        required = false,
    )

    val simCountryIso by isoCountryPatchOption(
        key = "simCountryIso",
        title = "SIM ISO country code",
    )

    val simOperator by stringOption(
        key = "simOperator",
        title = "MCC+MNC SIM operator code",
        description = "The 5 or 6 digits MCC+MNC (Mobile Country Code + Mobile Network Code) of the SIM operator.",
        required = false,
    ) { isMccMncValid(it) }

    val simOperatorName by stringOption(
        key = "simOperatorName",
        title = "SIM operator name",
        description = "The full name of the SIM operator.",
        required = false,
    )

    execute {
        var spoofedCount = 0

        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach { method ->
                if (method.implementation == null) return@forEach

                val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                // Collect matching instruction indices in forward order, then process
                // in reverse to avoid index shifting during mutation.
                val instructions = method.implementation!!.instructions.toList()
                val matchedIndices = mutableListOf<Pair<Int, String>>()

                instructions.forEachIndexed { instructionIndex, instruction ->
                    if (instruction !is ReferenceInstruction) return@forEachIndexed

                    val reference = instruction.reference as? MethodReference
                        ?: return@forEachIndexed

                    val match = MethodCall.entries.firstOrNull { search ->
                        MethodUtil.methodSignaturesMatch(reference, search.reference)
                    } ?: return@forEachIndexed

                    val replacement = when (match) {
                        MethodCall.NetworkCountryIso -> networkCountryIso?.lowercase()
                        MethodCall.NetworkOperator -> networkOperator
                        MethodCall.NetworkOperatorName -> networkOperatorName
                        MethodCall.SimCountryIso -> simCountryIso?.lowercase()
                        MethodCall.SimOperator -> simOperator
                        MethodCall.SimOperatorName -> simOperatorName
                    } ?: return@forEachIndexed

                    matchedIndices += instructionIndex to replacement
                }

                matchedIndices.asReversed().forEach { (index, value) ->
                    val nextInstr = mutableMethod.getInstruction<Instruction>(index + 1)

                    if (nextInstr.opcode.name != "move-result-object") {
                        mutableMethod.replaceInstruction(index, "nop")
                        return@forEach
                    }

                    val register = (nextInstr as OneRegisterInstruction).registerA
                    mutableMethod.replaceInstruction(index, "const-string v$register, \"$value\"")
                    mutableMethod.replaceInstruction(index + 1, "nop")
                    spoofedCount++
                }
            }
        }

        if (spoofedCount == 0) {
            patchLogger.warning("No SIM provider calls found to spoof")
        } else {
            patchLogger.info("Spoofed ${formatCount(spoofedCount, "call/value", "calls/values")}")
        }
    }
}

private enum class MethodCall(
    val reference: MethodReference,
) {
    NetworkCountryIso(
        ImmutableMethodReference(
            "Landroid/telephony/TelephonyManager;",
            "getNetworkCountryIso",
            emptyList(),
            "Ljava/lang/String;",
        ),
    ),
    NetworkOperator(
        ImmutableMethodReference(
            "Landroid/telephony/TelephonyManager;",
            "getNetworkOperator",
            emptyList(),
            "Ljava/lang/String;",
        ),
    ),
    NetworkOperatorName(
        ImmutableMethodReference(
            "Landroid/telephony/TelephonyManager;",
            "getNetworkOperatorName",
            emptyList(),
            "Ljava/lang/String;",
        ),
    ),
    SimCountryIso(
        ImmutableMethodReference(
            "Landroid/telephony/TelephonyManager;",
            "getSimCountryIso",
            emptyList(),
            "Ljava/lang/String;",
        ),
    ),
    SimOperator(
        ImmutableMethodReference(
            "Landroid/telephony/TelephonyManager;",
            "getSimOperator",
            emptyList(),
            "Ljava/lang/String;",
        ),
    ),
    SimOperatorName(
        ImmutableMethodReference(
            "Landroid/telephony/TelephonyManager;",
            "getSimOperatorName",
            emptyList(),
            "Ljava/lang/String;",
        ),
    ),
}
