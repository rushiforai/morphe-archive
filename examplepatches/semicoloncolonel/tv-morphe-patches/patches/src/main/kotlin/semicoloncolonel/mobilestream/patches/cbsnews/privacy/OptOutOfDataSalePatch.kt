package semicoloncolonel.mobilestream.patches.cbsnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News for Android TV 8.6.0 reads its privacy signals from Paramount's
// privacy module. The home and settings screens start the app's tracking only
// while the US Privacy string says the user has not opted out ("1YNN"), and
// the ad requests carry that string and a limit-ad-tracking flag. The US
// Privacy string now always says the user opted out of sale ("1YYN"), and the
// limit-ad-tracking flag is always on, so that tracking does not start and ad
// partners are told not to sell or personalize.

internal object UsPrivacyFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("failed to get US Privacy String"),
)

private fun Method.constStrings() = implementation?.instructions?.mapNotNull {
    if (it.opcode != Opcode.CONST_STRING && it.opcode != Opcode.CONST_STRING_JUMBO) return@mapNotNull null
    ((it as ReferenceInstruction).reference as StringReference).string
}?.toSet().orEmpty()

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the app opted out of the sale and sharing of your data.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    execute {
        UsPrivacyFingerprint.method.returnEarly("const-string v0, \"1YYN\"\nreturn-object v0")

        // The limit-ad-tracking flag: answers "0" or "1".
        val lat = UsPrivacyFingerprint.classDef.methods.filter { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                method.constStrings() == setOf("0", "1")
        }
        if (lat.size != 1) throw PatchException("Opt out: expected one limit-ad-tracking flag, found ${lat.size}")
        lat.single().returnEarly("const-string v0, \"1\"\nreturn-object v0")
    }
}
