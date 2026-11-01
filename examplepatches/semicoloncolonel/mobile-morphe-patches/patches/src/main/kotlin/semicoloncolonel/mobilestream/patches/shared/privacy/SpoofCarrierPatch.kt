package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.amc.shared.Constants as Amc
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants as Cnn
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.hulu.shared.Constants as Hulu
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants as FoxNews
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants as MsNow
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants as NyTimes
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants as Paramount
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants as PrimeVideo
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants as Wsj
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants as WashingtonPost

// ─────────────────────────────────────────────────────────────────────────────
// Spoof carrier (OPT-IN, default OFF).
//
// Apps and their bundled SDKs (ad bidding, analytics, crash reporting) read
// the mobile carrier from TelephonyManager and SubscriptionInfo. Every app
// call to those methods is pointed at CarrierSpoofer, which answers with the
// name chosen in the patch option. A blank name hides the carrier. The
// numeric operator code is always blank and the carrier ID is unknown, so
// they cannot contradict the name. These are framework classes, so the names
// are the same in every app.
//
// A carrier deal that an app detects from the carrier (NBA's partner check,
// for example) cannot see the real carrier while this is on.
// ─────────────────────────────────────────────────────────────────────────────

private const val CARRIER_SPOOFER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/CarrierSpoofer;"
private const val CARRIER_EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"
private const val TELEPHONY = "Landroid/telephony/TelephonyManager;"

private class CarrierRewrite(val definingClass: String, val name: String, val returnType: String)

private val CARRIER_REWRITES = listOf(
    CarrierRewrite(TELEPHONY, "getNetworkOperatorName", "Ljava/lang/String;"),
    CarrierRewrite(TELEPHONY, "getSimOperatorName", "Ljava/lang/String;"),
    CarrierRewrite(TELEPHONY, "getSimCarrierIdName", "Ljava/lang/CharSequence;"),
    CarrierRewrite(TELEPHONY, "getNetworkOperator", "Ljava/lang/String;"),
    CarrierRewrite(TELEPHONY, "getSimOperator", "Ljava/lang/String;"),
    CarrierRewrite(TELEPHONY, "getSimCarrierId", "I"),
    CarrierRewrite("Landroid/telephony/SubscriptionInfo;", "getCarrierName", "Ljava/lang/CharSequence;"),
)

private fun Instruction.carrierRewrite(): CarrierRewrite? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    if (reference.parameterTypes.isNotEmpty()) return null
    return CARRIER_REWRITES.firstOrNull {
        it.definingClass == reference.definingClass &&
            it.name == reference.name &&
            it.returnType == reference.returnType
    }
}

internal object CarrierNameFingerprint : Fingerprint(
    definingClass = CARRIER_SPOOFER,
    name = "carrierName",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

private fun String.smaliEscaped() = buildString {
    this@smaliEscaped.forEach { c ->
        when (c) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            else -> if (c.code < 0x20 || c.code > 0x7e) append("\\u%04x".format(c.code)) else append(c)
        }
    }
}

@Suppress("unused")
val spoofCarrierPatch = bytecodePatch(
    name = "Spoof carrier",
    description = "Hides your mobile carrier from the app and the ad and analytics SDKs inside " +
        "it, or reports a carrier name you choose. Carrier deals the app detects from your " +
        "carrier will not work while this is on. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Tubi.COMPATIBILITY, Disney.COMPATIBILITY, Hulu.COMPATIBILITY, Pluto.COMPATIBILITY, Paramount.COMPATIBILITY, HboMax.COMPATIBILITY, Peacock.COMPATIBILITY, PrimeVideo.COMPATIBILITY, Mgm.COMPATIBILITY, FoxOne.COMPATIBILITY, NyTimes.COMPATIBILITY, WashingtonPost.COMPATIBILITY, Wsj.COMPATIBILITY, Amc.COMPATIBILITY, Starz.COMPATIBILITY, Pbs.COMPATIBILITY, FoxNews.COMPATIBILITY, MsNow.COMPATIBILITY, Cnn.COMPATIBILITY, Espn.COMPATIBILITY, Nfl.COMPATIBILITY, Nba.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val carrierName by stringOption(
        key = "carrierName",
        default = "",
        values = mapOf(
            "Hidden (blank)" to "",
            "AT&T" to "AT&T",
            "Google Fi" to "Google Fi",
            "Mint Mobile" to "Mint Mobile",
            "T-Mobile" to "T-Mobile",
            "US Mobile" to "US Mobile",
            "Verizon" to "Verizon",
            "Visible" to "Visible",
        ),
        title = "Carrier name",
        description = "The carrier name the app sees. Pick one from the list or type any name. " +
            "Blank hides the carrier.",
        required = false,
    )

    execute {
        val name = (carrierName ?: "").smaliEscaped()
        CarrierNameFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$name"
                return-object v0
            """,
        )

        // Collect first, mutate after: mutableClassDefBy swaps the class map
        // entry, which must not happen mid-iteration.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(CARRIER_EXTENSION_PACKAGE)) return@classDefForEach
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.carrierRewrite() != null } == true
                }
            ) {
                targets += classDef.type
            }
        }

        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                // Snapshot: replaceInstruction mutates the live list.
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val rewrite = instruction.carrierRewrite() ?: return@forEachIndexed
                    val target = "$CARRIER_SPOOFER->${rewrite.name}(${rewrite.definingClass})${rewrite.returnType}"
                    val smali = when (instruction) {
                        is FiveRegisterInstruction -> "invoke-static {v${instruction.registerC}}, $target"
                        is RegisterRangeInstruction ->
                            "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister} }, $target"
                        else -> return@forEachIndexed
                    }
                    method.replaceInstruction(index, smali)
                }
            }
        }
    }
}
