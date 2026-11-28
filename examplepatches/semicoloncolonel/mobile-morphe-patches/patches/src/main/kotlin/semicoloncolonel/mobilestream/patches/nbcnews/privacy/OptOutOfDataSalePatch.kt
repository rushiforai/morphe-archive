package semicoloncolonel.mobilestream.patches.nbcnews.privacy

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// NBC News 15.0.1 starts OneTrust but never shows its banner or saves a
// choice, so every user keeps the default, which is opted in. The app has
// its own opt-out (OneTrustComponent.optOutOfSaleOfData, which opts out and
// saves Reject All) and uses it only for age-restricted users. When OneTrust
// finishes starting and no US Privacy string has been saved yet, the app now
// calls it. A choice made later under Your Privacy Choices is kept.

private const val ONE_TRUST = "Lcom/nbc/analytics/OneTrustComponent;"
private const val ON_SUCCESS = "Lcom/nbc/analytics/OneTrustComponent\$initialize\$1;"

internal object OneTrustReadyFingerprint : Fingerprint(
    definingClass = ON_SUCCESS,
    name = "onSuccess",
    returnType = "V",
)

// Part of blockAnalyticsPatch: runs only when its "dataSale" option is on.
internal val optOutOfDataSalePatch = bytecodePatch {
    execute {
        if (!isOptionOn(blockAnalyticsPatch, "dataSale")) return@execute
        OneTrustReadyFingerprint.method.returnEarly(
            """
                iget-boolean v0, p0, $ON_SUCCESS->${'$'}ccpaStringNotSet:Z
                if-eqz v0, :saved
                sget-object v0, $ONE_TRUST->INSTANCE:$ONE_TRUST
                invoke-virtual { v0 }, $ONE_TRUST->optOutOfSaleOfData()V
                :saved
                nop
            """,
        )
    }
}
