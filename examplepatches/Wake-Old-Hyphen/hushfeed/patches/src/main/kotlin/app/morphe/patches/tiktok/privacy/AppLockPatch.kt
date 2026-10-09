/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.interaction.blockauthor.sessionPlaybackBridgePatch
import app.morphe.patches.tiktok.misc.extension.HostApplicationAttachBaseContextFingerprint
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.util.addInstruction
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val APP_LOCK = "Lapp/morphe/extension/tiktok/privacy/AppLock;"

/**
 * Where the lock starts following TikTok's screens: just past the host application's call to
 * the framework's attachBaseContext, before any activity exists. The shared extension hook
 * anchors on the same call, so a build that moved it fails there too. The method has to be the
 * application's own, so p0 is the application the callbacks are registered on.
 */
internal fun appLockInstallIndex(method: Method): Int {
    if (AccessFlags.STATIC.isSet(method.accessFlags)) {
        throw PatchException("App lock: the host application's attachBaseContext is static, so it has no application to follow.")
    }
    val superCall = method.indexOfFirstInstruction {
        getReference<MethodReference>()?.let { reference ->
            reference.definingClass == "Landroid/app/Application;" &&
                reference.name == "attachBaseContext" &&
                reference.parameterTypes == listOf("Landroid/content/Context;")
        } == true
    }
    if (superCall < 0) {
        throw PatchException("App lock: the host application no longer calls Application.attachBaseContext, so there is nowhere to start from.")
    }
    return superCall + 1
}

@Suppress("unused")
val appLockPatch = bytecodePatch(
    name = "App lock",
    description = "Puts TikTok behind your phone's own unlock, so a fingerprint or the screen lock " +
        "PIN opens it. It asks when TikTok starts and when you come back after a time you pick, " +
        "before anything shows. A link you open from another app still goes to its video once you " +
        "unlock, and TikTok's preview in recent apps stays blank while the lock is on. On a phone " +
        "with no screen lock, TikTok opens as before and says why. Switch: Hushfeed settings > Privacy.",
    default = false,
) {
    category("Privacy")
    // The bridge lets the lock stop the video on screen, which plays on under the prompt.
    dependsOn(settingsPatch, sharedExtensionPatch, sessionPlaybackBridgePatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableAppLock()V",
        )
        // A range invoke, so the parameter register's number never has to fit a 4-bit operand.
        HostApplicationAttachBaseContextFingerprint.method.apply {
            addInstruction(
                appLockInstallIndex(this),
                "invoke-static/range { p0 .. p0 }, $APP_LOCK->install(Landroid/content/Context;)V",
            )
        }
    }
}
