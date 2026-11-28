package semicoloncolonel.mobilestream.patches.foxnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants

// Fox News for Android TV 5.6.0 keeps a US Privacy string
// (IABUSPrivacy_String) that its ad requests and measurement SDKs read.
// Until the user chooses, DnsPrivacyManager stores and reports "1---" (no
// choice made). That default becomes "1YYN", opted out of sale and sharing.
//
// At every launch the app also asks Ketch for the stored consent and writes
// its answer. Ketch reports consent for a user who never chose, which would
// set "1YNN" (opted in) right away. An opt-in from Ketch now leaves the
// current setting as it is; an opt-out from Ketch is still applied. A choice
// made in the app's Do Not Sell settings is saved and used as before.

private const val NO_CHOICE = "1---"
private const val OPTED_IN = "1YNN"
private const val OPTED_OUT = "1YYN"

private const val DNS = "Lcom/foxnews/tv/ads/DnsPrivacyManager;"

internal object DnsDefaultFingerprint : Fingerprint(
    definingClass = DNS,
    name = "ensureDefaultInitialized",
    returnType = "V",
    strings = listOf(NO_CHOICE),
)

internal object DnsCurrentFingerprint : Fingerprint(
    definingClass = DNS,
    name = "getCurrentPrivacyString",
    returnType = "Ljava/lang/String;",
    strings = listOf(NO_CHOICE),
)

internal object KetchUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/tv/ketch/KetchConsentManager;",
    name = "updatePrivacyString",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
    strings = listOf("targeted_advertising", NO_CHOICE, OPTED_IN, OPTED_OUT),
)

private fun MutableMethod.constStringIndices(value: String) =
    implementation!!.instructions.toList().withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_STRING &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == value
    }.map { it.index }

private fun MutableMethod.replaceString(from: String, to: String) {
    val indices = constStringIndices(from)
    if (indices.isEmpty()) throw PatchException("$definingClass->$name has no \"$from\"")
    indices.forEach { index ->
        val register = (implementation!!.instructions.toList()[index] as OneRegisterInstruction).registerA
        replaceInstruction(index, "const-string v$register, \"$to\"")
    }
}

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the app opted out of the sale and sharing of your data.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        DnsDefaultFingerprint.method.replaceString(NO_CHOICE, OPTED_OUT)
        DnsCurrentFingerprint.method.replaceString(NO_CHOICE, OPTED_OUT)

        KetchUpdateFingerprint.method.apply {
            replaceString(NO_CHOICE, OPTED_OUT)
            // "1YNN" is loaded once, right before the shared setPrivacyString
            // call; returning there skips only the opt-in write.
            val optIn = constStringIndices(OPTED_IN).singleOrNull()
                ?: throw PatchException("$definingClass->$name: expected one \"$OPTED_IN\"")
            replaceInstruction(optIn, "return-void")
        }
    }
}
