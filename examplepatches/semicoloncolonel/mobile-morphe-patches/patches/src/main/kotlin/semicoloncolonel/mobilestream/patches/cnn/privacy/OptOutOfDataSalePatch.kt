package semicoloncolonel.mobilestream.patches.cnn.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

private const val PURPOSE_TYPE = "Lcom/cnn/mobile/privacy/models/PrivacyPurposeType;"
private const val PURPOSE_CONSENT = "Lcom/cnn/mobile/privacy/models/PrivacyPurposeConsent;"

// CNN 26.21.0 runs Warner Bros. Discovery's own consent manager on OneTrust's
// servers. OSSTA_BG is the US "sale, sharing and targeted advertising"
// purpose: when it is not ACTIVE, the app's US Privacy string becomes "1YYN"
// and its ad requests carry the opt-out. isDNSoSOptOut() is the "Do Not Sell
// or Share" flag the app checks before sharing.
internal object PurposeConsentFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/mobile/privacy/onetrust/b;",
    parameters = listOf(PURPOSE_TYPE),
    returnType = PURPOSE_CONSENT,
)

internal object IsDoNotSellOptOutFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/mobile/privacy/PrivacyFacade;",
    name = "isDNSoSOptOut",
    returnType = "Z",
)

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Keeps the CNN app opted out of the sale and sharing of your data and of " +
        "targeted ads (the US Privacy \"do not sell or share\" signal). Other privacy choices " +
        "are unchanged.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        PurposeConsentFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $PURPOSE_TYPE->OSSTA_BG:$PURPOSE_TYPE
                if-ne p1, v0, :other_purpose
                sget-object v0, $PURPOSE_CONSENT->WITHDRAWN:$PURPOSE_CONSENT
                return-object v0
                :other_purpose
                nop
            """,
        )

        IsDoNotSellOptOutFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
