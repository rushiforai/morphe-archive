package app.travianpatch.patches

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches TravianLegendsActivity.onCreate(Bundle). This class is the app's
 * main launcher Activity (a thin Java/Kotlin bootstrap around the Unity
 * player, not part of the obfuscated IL2CPP game logic), so a fairly loose
 * fingerprint on class name + method shape is reliable across app updates.
 */
object TravianLegendsActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/traviangames/travianlegendsmobile/plugin/TravianLegendsActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
