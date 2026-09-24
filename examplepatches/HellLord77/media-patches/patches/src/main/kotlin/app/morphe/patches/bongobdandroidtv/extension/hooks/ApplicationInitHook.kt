package app.morphe.patches.bongobdandroidtv.extension.hooks

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import com.android.tools.smali.dexlib2.AccessFlags


internal object BongobdandroidtvActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lsaas/ott/smarttv/ui/splash/view/SplashActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal val bongobdandroidtvActivityOnCreateHook =
    ExtensionHook(BongobdandroidtvActivityOnCreateFingerprint)

internal val bongobdandroidtvApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lsaas/ott/smarttv/MainApplication;"
)
