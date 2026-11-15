package app.morphe.patches.all.spoof.sim

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private class SimPreset(
    val label: String,
    val iso: String,
    val mcc: String,
    val mnc: String,
    val carrier: String,
) {
    val operator get() = mcc + mnc
}

private val PRESETS = listOf(
    SimPreset("Keep current (no spoof)", "", "", "", ""),
    SimPreset("US - T-Mobile", "us", "310", "260", "T-Mobile"),
    SimPreset("US - AT&T", "us", "310", "410", "AT&T"),
    SimPreset("US - Verizon", "us", "310", "012", "Verizon"),
    SimPreset("UK - EE", "gb", "234", "30", "EE"),
    SimPreset("UK - Vodafone", "gb", "234", "15", "Vodafone"),
    SimPreset("UK - O2", "gb", "234", "10", "O2"),
    SimPreset("DE - Telekom", "de", "262", "01", "Telekom"),
    SimPreset("DE - Vodafone", "de", "262", "02", "Vodafone"),
    SimPreset("FR - Orange", "fr", "208", "01", "Orange"),
    SimPreset("FR - SFR", "fr", "208", "10", "SFR"),
    SimPreset("ES - Movistar", "es", "214", "07", "Movistar"),
    SimPreset("IT - TIM", "it", "222", "01", "TIM"),
    SimPreset("NL - KPN", "nl", "204", "08", "KPN"),
    SimPreset("PL - Orange", "pl", "260", "03", "Orange"),
    SimPreset("BR - Vivo", "br", "724", "06", "Vivo"),
    SimPreset("IN - Jio", "in", "405", "854", "Jio"),
    SimPreset("IN - Airtel", "in", "404", "10", "Airtel"),
    SimPreset("JP - docomo", "jp", "440", "10", "docomo"),
    SimPreset("KR - SK Telecom", "kr", "450", "05", "SK Telecom"),
    SimPreset("AU - Telstra", "au", "505", "01", "Telstra"),
    SimPreset("CA - Rogers", "ca", "302", "720", "Rogers"),
    SimPreset("SG - StarHub", "sg", "525", "05", "StarHub"),
    SimPreset("AE - etisalat", "ae", "424", "02", "etisalat"),
    SimPreset("TR - Turkcell", "tr", "286", "01", "Turkcell"),
)

@Suppress("unused")
val simSpoofPatch = bytecodePatch(
    name = "Spoof SIM country / operator",
    description = "Fakes TelephonyManager / SubscriptionInfo country + operator values.",
    default = false,
) {
    val presetOption = stringOption(
        key = "preset",
        default = PRESETS[1].label,
        values = PRESETS.associate { it.label to it.label },
        title = "SIM preset",
        description = "The simulated SIM/network identity.",
        required = true,
    )

    execute {
        val p = PRESETS.first { it.label == presetOption.value }
        if (p.iso.isEmpty()) return@execute // "Keep current"

        // TelephonyManager getters (no args) -> replace result.
        mapOf(
            "Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;" to p.iso,
            "Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;" to p.iso,
            "Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;" to p.operator,
            "Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;" to p.operator,
            "Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;" to p.carrier,
            "Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;" to p.carrier,
            "Landroid/telephony/SubscriptionInfo;->getCountryIso()Ljava/lang/String;" to p.iso,
            "Landroid/telephony/SubscriptionInfo;->getCarrierName()Ljava/lang/CharSequence;" to p.carrier,
            "Landroid/telephony/SubscriptionInfo;->getDisplayName()Ljava/lang/CharSequence;" to p.carrier,
            "Landroid/telephony/SubscriptionInfo;->getMccString()Ljava/lang/String;" to p.mcc,
            "Landroid/telephony/SubscriptionInfo;->getMncString()Ljava/lang/String;" to p.mnc,
        ).forEach { (smali, value) ->
            methodCall(smali).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val ri = index + 1
                if (ri >= instructions.size) return@matchAllMethodIndicesForEach
                val res = getInstruction(ri)
                if (res.opcode != Opcode.MOVE_RESULT_OBJECT) return@matchAllMethodIndicesForEach
                val reg = (res as OneRegisterInstruction).registerA
                replaceInstruction(ri, "const-string v$reg, \"$value\"")
            }
        }
    }
}
