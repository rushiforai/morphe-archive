package semicoloncolonel.mobilestream.patches.shared.ads

import app.morphe.patcher.Fingerprint

// Google IMA's pause-ad display handler: the method that receives the
// "displayPauseAd" message from IMA's ad engine and puts the creative in the
// pause-ad slot (com.google.ads.interactivemedia.v3.impl.zzda.zza in the
// Paramount+ and Pluto TV 17.2.0 builds). Every string in it is about the
// pause-ad slot. IMA renames its internals per SDK version, so the anchor is
// the handler's own error message, not the class or method name. Returning at
// the start means the pause ad is never displayed, and the display-time
// impression is never sent.
internal object ImaPauseAdDisplayFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/google/ads/interactivemedia/v3/impl/data/JavaScriptMsgData;"),
    strings = listOf("No pause ad slot in display container."),
)
