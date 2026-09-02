package app.shadowfight.patches.cheats

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// CheatsPanel is stripped (RET) in libil2cpp.so, but the class still exists.
// We hook ShopScene which instantiates the prefab to make the panel visible.
object ShopSceneFingerprint : Fingerprint(
    definingClass = "LNekki/SF2/GUI/Shop/ShopScene;",
    name = "CLNAOMIIBLH",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    // This method is ShopScene's Start/OnEnable - we will find it via string or fallback to UnityPlayerActivity
)

// Fallback universal: UnityPlayerActivity.onCreate is always available, we will use it to inject a button
object UnityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/app/Activity;", name = "onCreate")
    )
)
