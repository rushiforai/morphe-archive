package app.roundsalmon4.patches.seriesguide

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object HasAccessToPaidFeaturesFingerprint : Fingerprint(
    definingClass = "Lcom/battlelancer/seriesguide/billing/BillingTools;",
    name = "hasAccessToPaidFeatures",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)
