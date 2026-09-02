package com.autocat.morphe.smartlauncher.patches.hidearchived

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * Matches exclusively the App Drawer loader (`DrawerRepository.invokeSuspend`).
 * Scoping strictly to the App Drawer guarantees 100% stability:
 * Desktop bootstrap (`Lk6` in `classes2.dex`), shortcuts, widgets, and dock
 * operate completely untouched.
 */
object GetActivityListFingerprint : Fingerprint(
    strings = listOf("DrawerRepository.setAsInactive() invoked"),
    filters = listOf(
        methodCall(
            smali = "Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;",
        ),
    ),
)
