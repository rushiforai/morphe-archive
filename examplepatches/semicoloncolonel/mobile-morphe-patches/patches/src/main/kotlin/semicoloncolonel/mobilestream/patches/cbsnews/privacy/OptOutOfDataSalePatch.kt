package semicoloncolonel.mobilestream.patches.cbsnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import semicoloncolonel.mobilestream.patches.cbsnews.misc.disableSignatureCheckPatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News 5.20 keeps one consent value per partner in ConsentManager. They
// start at -1, and every partner is turned off only when its value is 0, so
// until you opt out in the app, everything is on. The two group setters
// (analytics: Adobe, Nielsen, comScore, Mux; marketing: Taboola, Airship,
// ads, Flurry, Qualtrics, Moat) now always store 0, and the constructor calls
// both, so the app starts opted out. The US Privacy string sent to ad
// partners says the user opted out of sale, and the restricted-processing
// and non-personalized-ads flags are set.

private const val CONSENT_MANAGER = "Lcom/treemolabs/apps/cbsnews/data/managers/ConsentManager;"

internal object ConsentAnalyticsFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER,
    name = "setAllConsentAnalytics",
    parameters = listOf("I"),
)

internal object ConsentMarketingFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER,
    name = "setAllConsentMarketing",
    parameters = listOf("I"),
)

internal object ConsentManagerInitFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER,
    name = "<init>",
    parameters = listOf(),
)

internal object UsPrivacyFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER,
    name = "getUSPrivacy",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

internal object NonPersonalizedAdsFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER,
    name = "getNpa",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

internal object RestrictedProcessingFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER,
    name = "getRdp",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the app opted out of the sale and sharing of your data.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableSignatureCheckPatch)

    execute {
        ConsentAnalyticsFingerprint.method.returnEarly("const/4 p1, 0x0")
        ConsentMarketingFingerprint.method.returnEarly("const/4 p1, 0x0")

        ConsentManagerInitFingerprint.method.apply {
            val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstructions(
                end,
                """
                    const/4 v0, 0x0
                    invoke-virtual { p0, v0 }, $CONSENT_MANAGER->setAllConsentAnalytics(I)V
                    invoke-virtual { p0, v0 }, $CONSENT_MANAGER->setAllConsentMarketing(I)V
                """,
            )
        }

        UsPrivacyFingerprint.method.returnEarly("const-string v0, \"1YYY\"\nreturn-object v0")
        NonPersonalizedAdsFingerprint.method.returnEarly("const-string v0, \"1\"\nreturn-object v0")
        RestrictedProcessingFingerprint.method.returnEarly("const-string v0, \"1\"\nreturn-object v0")
    }
}
