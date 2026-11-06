package lab.analiti.patches.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import lab.analiti.patches.shared.COMPATIBILITY_ANALITI

/**
 * Stops the AppUpdater path from uploading the client key and Android Keystore
 * attestation chain to analiti.com.
 *
 * The app updater is the only caller of ClientKeyManager.getClientKeyInfo in the
 * startup flow. It builds a JSON object containing:
 *
 *  - keyAlias / keyExists / isHardwareBacked
 *  - jwks (the app's public client key)
 *  - attestationChain (Android Key Attestation certificate chain, including device
 *    model, OS/patch level, verified boot state and key properties)
 *  - attributes (keystore key attributes)
 *
 * and posts it to https://analiti.com/getVersionInfo/?t=<uuid>.
 *
 * Rather than rewriting the obfuscated dispatcher's switch table, this patch
 * replaces the single backend i(...) call inside li.run() with return-void. The
 * rest of the app's backend calls (iperf server list, account, result sharing)
 * are left untouched.
 *
 * The fingerprint is anchored on:
 *  - the UsageAnalytics literal that appears in the same dispatcher method, and
 *  - a direct call to i(String, JSONObject, Long, int, <interface>).
 *
 * Both conditions together are unique to li.run() in the supported versions.
 */
@Suppress("unused")
val skipUpdateAttestationPatch = bytecodePatch(
    name = "Skip update attestation",
    description = "Stops the app updater from sending the client key and Android Keystore " +
            "attestation chain to analiti.com during its version check. Other backend calls are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANALITI)

    execute {
        val method = AnalitiUpdateCheckFingerprint.method
        val callIndex = method.indexOfUpdateBackendCall()
        if (callIndex < 0) {
            throw PatchException(
                "Could not locate the backend i(...) call in the analiti update-check dispatcher.",
            )
        }
        method.replaceInstruction(callIndex, "return-void")
    }
}

private val KEY_INFO_PARAMETERS = listOf("Ljava/lang/String;")

/**
 * The update-check dispatcher.
 *
 * UsageAnalytics alone is not unique (several runnable classes use it), so the
 * custom predicate additionally requires a direct backend i(...) call. That
 * combination is unique to this method.
 */
internal object AnalitiUpdateCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .orEmpty()
        val hasKeyInfo = references.any { reference ->
            reference.definingClass == "Lcom/analiti/libcommon/ClientKeyManager;" &&
                    reference.name == "getClientKeyInfo" &&
                    reference.returnType == "Lorg/json/JSONObject;" &&
                    reference.parameterTypes.map { it.toString() } == KEY_INFO_PARAMETERS
        }
        hasKeyInfo && references.any { isUpdateBackendCall(it) }
    },
)

/**
 * Matches the version-specific backend helper:
 *  - 2026.10.99133 / 98884: Lr5;->i(String, JSONObject, Long, int, Lp5;)V
 *  - 2026.10.98554:          Lt5;->i(String, JSONObject, Long, int, Lr5;)V
 *
 * The defining class and the final interface type are obfuscated differently per
 * version, so only the stable four-parameter prefix and the return type are
 * constrained.
 */
private fun isUpdateBackendCall(reference: MethodReference): Boolean {
    val parameters = reference.parameterTypes.map { it.toString() }
    return reference.name == "i" &&
            reference.returnType == "V" &&
            parameters.size == 5 &&
            parameters[0] == "Ljava/lang/String;" &&
            parameters[1] == "Lorg/json/JSONObject;" &&
            parameters[2] == "Ljava/lang/Long;" &&
            parameters[3] == "I" &&
            parameters[4].startsWith("L") &&
            parameters[4].endsWith(";")
}

/** Index of the backend i(String, JSONObject, Long, int, <interface>) call, or -1. */
private fun MutableMethod.indexOfUpdateBackendCall(): Int {
    val instructions = implementation?.instructions ?: return -1
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC &&
            instruction.opcode != Opcode.INVOKE_STATIC_RANGE
        ) {
            return@forEachIndexed
        }
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@forEachIndexed
        if (isUpdateBackendCall(reference)) {
            return index
        }
    }
    return -1
}
