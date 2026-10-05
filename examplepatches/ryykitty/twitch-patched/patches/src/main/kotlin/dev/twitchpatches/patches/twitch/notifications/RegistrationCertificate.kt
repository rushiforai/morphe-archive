package dev.twitchpatches.patches.twitch.notifications

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.insertBeforeWithLabels
import dev.twitchpatches.patches.twitch.shared.isInstance
import dev.twitchpatches.patches.twitch.shared.uniqueHook

// Firebase Installations checks this header against the original app's API-key restriction.
internal const val TWITCH_REGISTRATION_CERTIFICATE = "8C68C13822723A2B1FA844BED340031BEB1F9463"

internal data class CertificateHeader(val callIndex: Int, val valueRegister: Int)

internal fun resolveCertificateHeader(method: Method): CertificateHeader {
    if (!method.isInstance(listOf("Ljava/net/URL;", "Ljava/lang/String;"), "Ljava/net/HttpURLConnection;") ||
        !AccessFlags.FINAL.isSet(method.accessFlags)) {
        throw PatchException("Firebase Installations connection signature changed.")
    }
    val code = method.code()
    val header = code.withIndex().filter { (_, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "X-Android-Cert"
    }.uniqueHook("Firebase certificate header")
    val nameRegister = (header.value as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("Firebase certificate header register is unavailable.")
    val callIndex = header.index + 1
    val instruction = code.getOrNull(callIndex)
    val call = instruction as? FiveRegisterInstruction
    val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    if (instruction?.opcode != Opcode.INVOKE_VIRTUAL || call == null || call.registerCount != 3 ||
        target?.definingClass != "Ljava/net/URLConnection;" || target.name != "addRequestProperty" ||
        target.returnType != "V" || target.parameterTypes.map { it.toString() } !=
        listOf("Ljava/lang/String;", "Ljava/lang/String;") || call.registerD != nameRegister ||
        call.registerE == call.registerC || call.registerE == call.registerD) {
        throw PatchException("Firebase certificate header call changed.")
    }
    val next = code.getOrNull(callIndex + 1)
    if ((next as? OneRegisterInstruction)?.registerA != call.registerE ||
        ((next as? ReferenceInstruction)?.reference as? StringReference)?.string != "x-goog-api-key" ||
        next.opcode !in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)) {
        throw PatchException("Firebase certificate value register is still live after its header call.")
    }
    return CertificateHeader(callIndex, call.registerE)
}

internal fun restoreRegistrationCertificate(method: MutableMethod) {
    val header = resolveCertificateHeader(method)
    method.insertBeforeWithLabels(header.callIndex,
        "const-string v${header.valueRegister}, \"$TWITCH_REGISTRATION_CERTIFICATE\"")
}
