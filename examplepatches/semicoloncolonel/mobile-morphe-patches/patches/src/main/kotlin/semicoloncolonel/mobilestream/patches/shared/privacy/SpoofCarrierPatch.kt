package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ─────────────────────────────────────────────────────────────────────────────
// Carrier (an option of Hide device identifiers, off by default).
//
// Apps and their bundled SDKs (ad bidding, analytics, crash reporting) read
// the mobile carrier from TelephonyManager and SubscriptionInfo. Every app
// call to those methods is pointed at CarrierSpoofer, which answers with the
// name chosen in the Carrier name option. A blank name hides the carrier. The
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

internal fun String.smaliEscaped() = buildString {
    this@smaliEscaped.forEach { c ->
        when (c) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            else -> if (c.code < 0x20 || c.code > 0x7e) append("\\u%04x".format(c.code)) else append(c)
        }
    }
}

internal fun BytecodePatchContext.spoofCarrier(carrierName: String) {
    val name = carrierName.smaliEscaped()
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
