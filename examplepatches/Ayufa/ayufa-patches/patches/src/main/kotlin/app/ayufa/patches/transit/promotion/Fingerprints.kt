package app.ayufa.patches.transit.promotion

import app.morphe.patcher.Fingerprint

/**
 * The LY linkage promotion modal is a full-screen activity in the
 * bundled promotion SDK. Verified against Yahoo! Transit 8.5.8.
 */
internal object LyLinkagePromotionModalOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/co/yahoo/android/lylinkage/promotion/modal/sdk/ui/LyLinkagePromotionModalActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)
