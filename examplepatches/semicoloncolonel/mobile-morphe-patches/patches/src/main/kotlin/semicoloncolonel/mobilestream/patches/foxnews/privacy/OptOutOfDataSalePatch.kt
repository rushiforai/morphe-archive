package semicoloncolonel.mobilestream.patches.foxnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants

private const val PRIVACY_STRING = "Lcom/foxnews/data/model/DnsPrivacyString;"

// Fox News 5.49.2 keeps a US Privacy string (IABUSPrivacy_String) that its ad
// and measurement SDKs read. Until the user makes a choice in the Ketch
// consent screen, the app stores DEFAULT ("1---", no choice made). These two
// places seed that default; this patch seeds DO_NOT_SELL_DATA ("1YYN",
// opted out of sale and sharing) instead. A later choice in the consent
// screen still replaces it, so the user stays in control.
internal object EnsureDnsValueFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/data/persistence/FoxDataPersistence;",
    name = "ensureDNSValueExists",
    returnType = "V",
)

internal object SyncStoredUsPrivacyStringFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/data/privacy/IabConsentPreferenceSync;",
    name = "syncStoredUsPrivacyString",
    returnType = "V",
)

// Nielsen measurement asks Ketch whether the user opted out.
internal object KetchIsUserOptedOutFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/privacy/data/KetchManager;",
    name = "isUserOptedOut",
    returnType = "Z",
)

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the Fox News phone app opted out of the sale and sharing of your " +
        "data (the US Privacy \"do not sell\" signal), and opted out of Nielsen measurement. " +
        "You can still change the choice in the app's privacy settings.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        listOf(EnsureDnsValueFingerprint, SyncStoredUsPrivacyStringFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                implementation!!.instructions.toList().forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
                    val field = (instruction as ReferenceInstruction).reference as FieldReference
                    if (field.definingClass != PRIVACY_STRING || field.name != "DEFAULT") return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    replaceInstruction(
                        index,
                        "sget-object v$register, $PRIVACY_STRING->DO_NOT_SELL_DATA:$PRIVACY_STRING",
                    )
                }
            }
        }

        KetchIsUserOptedOutFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
