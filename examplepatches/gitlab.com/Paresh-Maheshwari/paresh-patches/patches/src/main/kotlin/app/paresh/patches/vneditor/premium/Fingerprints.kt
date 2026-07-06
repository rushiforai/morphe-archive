package app.paresh.patches.vneditor.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

object IsPremiumFingerprint : Fingerprint(
    name = "isPremium",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lcom/frontrow/credit/ui/premium/PremiumManage;")
    )
)

object SetShowProItemFingerprint : Fingerprint(
    definingClass = "Lcom/frontrow/vlog/ui/widget/MainFragmentBottomNavigatorLayout;",
    name = "setShowProItem",
    returnType = "V",
    parameters = listOf("Z"),
)
