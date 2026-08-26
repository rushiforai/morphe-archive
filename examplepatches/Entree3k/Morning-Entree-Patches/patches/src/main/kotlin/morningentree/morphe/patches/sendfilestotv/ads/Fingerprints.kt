package morningentree.morphe.patches.sendfilestotv.ads

import app.morphe.patcher.Fingerprint

internal object CheckPurchaseFingerprint : Fingerprint(
    definingClass = "Lcom/yablio/sendfilestotv/ui/BilladsActivity;",
    name = "checkPurchase",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/yablio/sendfilestotv/ui/BilladsActivity\$onPurchaseListener;",
    ),
)
