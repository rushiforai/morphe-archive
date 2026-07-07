package app.morphe.patches.crunchyroll.pip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal object WatchScreenOnUserLeaveHintFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/watchscreen/screen/WatchScreenActivity;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(smali = "Le/k;->onUserLeaveHint()V"),
        methodCall(smali = "Lcom/crunchyroll/watchscreen/screen/WatchScreenActivity;->Zf()Lsn0/a;"),
        methodCall(smali = "Landroid/view/View;->post(Ljava/lang/Runnable;)Z"),
    ),
)
