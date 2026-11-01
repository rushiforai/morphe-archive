package semicoloncolonel.mobilestream.patches.nytimes.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants

// NYT phone 11.98.0. The app's on-site messaging (OMA) asks the server for a
// list of marketing units. OMAFormalMessageProvider's companion builds that
// list: the units already migrated (home and article), plus the full-screen
// takeover (MOBILE_NEWS_FSTO) and the top-of-app banner (MOBILE_NEWS_TOP_APP),
// each behind a flag. This patch forces those two flags off.
//
// The paywall, regiwall and truncator are a separate system (FrictionKind)
// and are not touched. Article and home units are also left as they are,
// because the article unit can carry the paywall gate.
internal object OmaUnitListFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/onsitemessaging/core/OMAFormalMessageProvider\$a;",
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/nytimes/onsitemessaging/core/MigrationPhase;", "Z", "Z"),
)

@Suppress("unused")
val hideUpsellPopupsPatch = bytecodePatch(
    name = "Hide upsell pop-ups",
    description = "Stops the New York Times phone app from showing its full-screen " +
        "subscription takeover and top-of-app promo banner. The paywall itself is not " +
        "changed. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // .locals 0, so p2/p3 are v2/v3.
        OmaUnitListFingerprint.method.addInstructions(
            0,
            """
                const/4 p2, 0x0
                const/4 p3, 0x0
            """.trimIndent(),
        )
    }
}
