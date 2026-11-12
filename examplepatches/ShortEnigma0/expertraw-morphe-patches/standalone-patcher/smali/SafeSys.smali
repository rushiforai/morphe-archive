# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
.class public final Lcom/samsung/android/app/galaxyraw/mod/SafeSys;
.super Ljava/lang/Object;
.source "SafeSys.java"

# MOD: framework calls that need signature permissions; SecurityException -> no-op/default.

.method public static w0_registerSystemKeyEvent(Lcom/samsung/android/view/SemWindowManager;ILandroid/content/ComponentName;I)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p3}, Lcom/samsung/android/view/SemWindowManager;->registerSystemKeyEvent(ILandroid/content/ComponentName;I)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: registerSystemKeyEvent"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w1_unregisterSystemKeyEvent(Lcom/samsung/android/view/SemWindowManager;ILandroid/content/ComponentName;)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p2}, Lcom/samsung/android/view/SemWindowManager;->unregisterSystemKeyEvent(ILandroid/content/ComponentName;)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: unregisterSystemKeyEvent"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w2_setForcedDefaultDisplayDevice(Lcom/samsung/android/view/SemWindowManager;I)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Lcom/samsung/android/view/SemWindowManager;->setForcedDefaultDisplayDevice(I)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: setForcedDefaultDisplayDevice"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w3_setContentMode(Lcom/samsung/android/hardware/display/SemMdnieManager;I)Z
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Lcom/samsung/android/hardware/display/SemMdnieManager;->setContentMode(I)Z
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: setContentMode"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method

.method public static w4_setDeadZone(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    :try_start
    invoke-static/range {p0 .. p1}, Lcom/samsung/android/tsp/SemTspStateManager;->setDeadZone(Landroid/view/View;Landroid/os/Bundle;)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: setDeadZone"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w5_acquire(Lcom/samsung/android/os/SemDvfsManager;)V
    .locals 2
    :try_start
    invoke-virtual/range {p0}, Lcom/samsung/android/os/SemDvfsManager;->acquire()V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: acquire"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w6_acquire(Lcom/samsung/android/os/SemDvfsManager;I)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Lcom/samsung/android/os/SemDvfsManager;->acquire(I)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: acquire"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w7_setHint(Lcom/samsung/android/os/SemDvfsManager;I)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Lcom/samsung/android/os/SemDvfsManager;->setHint(I)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: setHint"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w8_release(Lcom/samsung/android/os/SemDvfsManager;)V
    .locals 2
    :try_start
    invoke-virtual/range {p0}, Lcom/samsung/android/os/SemDvfsManager;->release()V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: release"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w9_putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    .locals 2
    :try_start
    invoke-static/range {p0 .. p2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: putInt"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method

.method public static w10_semSetAutoBrightnessLimit(Landroid/os/PowerManager;FF)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p2}, Landroid/os/PowerManager;->semSetAutoBrightnessLimit(FF)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: semSetAutoBrightnessLimit"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w11_semGoToSleep(Landroid/os/PowerManager;J)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p2}, Landroid/os/PowerManager;->semGoToSleep(J)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: semGoToSleep"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w12_setParameters(Landroid/media/AudioManager;Ljava/lang/String;)V
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: setParameters"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static w13_setMode(Lcom/samsung/android/camera/mic/SemMultiMicManager;I)Z
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Lcom/samsung/android/camera/mic/SemMultiMicManager;->setMode(I)Z
    move-result v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: setMode"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return v0
.end method

.method public static w14_semGetWifiDisplayStatus(Landroid/hardware/display/DisplayManager;)Landroid/hardware/display/SemWifiDisplayStatus;
    .locals 2
    :try_start
    invoke-virtual/range {p0}, Landroid/hardware/display/DisplayManager;->semGetWifiDisplayStatus()Landroid/hardware/display/SemWifiDisplayStatus;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: semGetWifiDisplayStatus"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return-object v0
.end method

.method public static w15_getRunningTasks(Landroid/app/ActivityManager;I)Ljava/util/List;
    .locals 2
    :try_start
    invoke-virtual/range {p0 .. p1}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;
    move-result-object v0
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-object v0
    :catch_sec
    move-exception v0
    const-string v1, "GrawMod"
    const-string v0, "SafeSys denied: getRunningTasks"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x0
    return-object v0
.end method

.method public static safeRegisterTelephonyCallback(Landroid/telephony/TelephonyManager;Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyCallback;)V
    .locals 2
    :try_start
    invoke-virtual {p0, p1, p2}, Landroid/telephony/TelephonyManager;->registerTelephonyCallback(Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyCallback;)V
    :try_end
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :catch_sec
    return-void
    :catch_sec
    const-string v0, "GrawMod"
    const-string v1, "SafeSys denied: registerTelephonyCallback"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

# Voice control needs privileged audio capture; its async AudioRecord failure crashes the app.
.method public static noSpeechStart(Lcom/samsung/android/speech/SemSpeechRecognizer;I)V
    .locals 2
    const-string v0, "GrawMod"
    const-string v1, "voice control disabled (needs privileged audio capture)"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method
