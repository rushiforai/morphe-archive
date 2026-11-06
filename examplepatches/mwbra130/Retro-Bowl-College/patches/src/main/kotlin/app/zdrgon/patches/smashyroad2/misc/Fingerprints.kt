package app.zdrgon.patches.smashyroad2.misc

import app.morphe.patcher.Fingerprint

/**
 * Matches the launcher Activity's onCreate(Bundle).
 *
 * Verified against Smashy Road 2 v1.54 (com.rkgames.basisgame): the manifest
 * declares com.unity3d.player.UnityPlayerActivity as the MAIN/LAUNCHER
 * activity, and its onCreate(Bundle) exists in classes.dex.
 */
object LauncherOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
