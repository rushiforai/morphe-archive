package app.shadowfight.patches.iap

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// R8 FCMNekkiUnityPlayerActivity'i inlined, o yuzden NekkiUnityPlayerActivity'yi hedef al
// NekkiUnityPlayerActivity.onCreate icindeki UnityPlayerActivity.onCreate cagrisini hedef al
object OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/nekki/utils/activity/NekkiUnityPlayerActivity;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
            name = "onCreate"
        )
    )
)
