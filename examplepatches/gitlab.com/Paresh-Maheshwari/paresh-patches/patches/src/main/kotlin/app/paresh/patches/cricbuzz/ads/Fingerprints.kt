package app.paresh.patches.cricbuzz.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Returns true if ads should be shown (user NOT subscribed) — master gate for all ad loading
object ShouldShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/cricbuzz/android/data/utils/datastore/SubscriptionManager;",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("production"),
        string("willow"),
        methodCall(definingClass = "Lkotlin/text/StringsKt;", name = "l"),
    )
)
