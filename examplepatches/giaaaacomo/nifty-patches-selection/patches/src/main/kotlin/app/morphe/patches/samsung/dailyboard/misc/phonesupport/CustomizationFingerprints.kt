/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.Fingerprint

internal object DreamServiceStartedFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/ui/dream/HomeModeDreamService;",
    name = "onDreamingStarted",
    returnType = "V",
    parameters = listOf()
)

internal object DreamServiceStoppedFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/ui/dream/HomeModeDreamService;",
    name = "onDreamingStopped",
    returnType = "V",
    parameters = listOf()
)

internal object SettingsPreferencesFingerprint : Fingerprint(
    definingClass = "La2/z;",
    name = "onCreatePreferences",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;")
)

internal object SettingsPreferencesOnResumeFingerprint : Fingerprint(
    definingClass = "La2/z;",
    name = "onResume",
    returnType = "V",
    parameters = listOf()
)

internal object SettingsBaseActivityOnCreateFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/ui/activity/setting/e;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal object HomeModeActivityOnCreateFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/ui/activity/main/HomeModeActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal object HomeModeActivityOnResumeFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/ui/activity/main/HomeModeActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf()
)


internal object DreamServiceAttachedFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/homemode/ui/dream/HomeModeDreamService;",
    name = "onAttachedToWindow",
    returnType = "V",
    parameters = listOf()
)
