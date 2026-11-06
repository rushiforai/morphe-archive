// New patch (not ported) — written for this repo, 2026-10-07.
// Design input: research/notes/01_mintsifry_metodichka.md's client-side checklist lists
// `http.proxyHost`/proxy system-property checks separately from the TRANSPORT_VPN API
// check; research/vpn_detection_analysis.md section 2.1's table shows 9/30 apps in the
// RKS Global study checking proxy host/port specifically. Not covered by any ported
// patch (xob0t's SpoofVpnStatusPatch only covers LinkProperties.getHttpProxy, the
// ConnectivityManager-level proxy API — not the older System.getProperty JVM-level one,
// which some apps check in addition, e.g. for Java-level HTTP client libraries that
// don't go through Android's network stack).
package app.privacy.patches.vpn

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.shared.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SYSTEM = "Ljava/lang/System;"

private val PROXY_PROPERTY_KEYS = setOf(
    "http.proxyHost",
    "http.proxyPort",
    "https.proxyHost",
    "https.proxyPort",
    "socksProxyHost",
    "socksProxyPort",
)

/**
 * `System.getProperty(String)` is a generic JVM API used for dozens of unrelated
 * properties (`os.name`, `java.version`, ...), so this is only safe to patch when gated
 * strictly on one of the proxy-specific property-name literals immediately preceding
 * the call — unlike SpoofVpnStatusPatch's TRANSPORT_VPN literal (a narrow int constant),
 * a bare `getProperty` match without this string gate would be far too broad.
 */
private fun MethodReference.isSystemGetProperty() = definingClass == SYSTEM &&
    name == "getProperty" &&
    parameterTypes.size == 1 &&
    parameterTypes[0].toString() == "Ljava/lang/String;" &&
    returnType == "Ljava/lang/String;"

private fun List<Instruction>.hasProxyPropertyKeyBefore(index: Int): Boolean {
    for (candidateIndex in index - 1 downTo maxOf(0, index - 6)) {
        val string = this[candidateIndex].stringReferenceOrNull() ?: continue
        if (string in PROXY_PROPERTY_KEYS) return true
    }
    return false
}

private fun Method.hasProxyPropertyTarget(): Boolean {
    val instructions = instructionsOrNull?.toList() ?: return false
    return instructions.withIndex().any { (index, instruction) ->
        val reference = instruction.methodReferenceOrNull() ?: return@any false
        reference.isSystemGetProperty() && instructions.hasProxyPropertyKeyBefore(index)
    }
}

@Suppress("unused")
val spoofProxyDetectionPatch = bytecodePatch(
    name = "Spoof system proxy properties",
    description = "Makes System.getProperty(\"http.proxyHost\") and the other JVM-level " +
        "proxy property keys return null, as if no proxy/VPN-provided proxy were configured.",
    default = false,
) {
    execute {
        var patchedCalls = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { it.hasProxyPropertyTarget() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasProxyPropertyTarget()) return@forEach

                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = instruction.methodReferenceOrNull() ?: return@forEachIndexed
                    if (!reference.isSystemGetProperty() || !instructions.hasProxyPropertyKeyBefore(index)) {
                        return@forEachIndexed
                    }

                    val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed

                    method.replaceInstruction(index + 1, "const/4 v${moveResult.registerA}, 0x0")
                    patchedCalls++
                }
            }
        }

        if (patchedCalls == 0) {
            println("Spoof system proxy properties: no local proxy-property reads were found.")
            return@execute
        }

        println("Spoof system proxy properties: patched $patchedCalls System.getProperty() calls.")
    }
}
