package app.paresh.patches.jiohotstar.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// MyPageData.getIsSubscribed() — stable protobuf-generated class
object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/MyPageData;",
    name = "getIsSubscribed",
    returnType = "Z"
)

// DownloadInfo.getIsPremium() — stable protobuf-generated class
object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/feature/download/DownloadInfo;",
    name = "getIsPremium",
    returnType = "Z"
)

// Zq/N4.a — subscription nudge handler, checks for "SubscriptionNudgeWidget" string
// Tightened with "interventionWidget" param check + BffWidgetVisibilityIntervention cast
object SubscriptionNudgeFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("interventionWidget"),
        string("null cannot be cast to non-null type com.hotstar.bff.models.widget.BffWidgetVisibilityIntervention"),
        string("SubscriptionNudgeWidget")
    )
)
