.class public final Lorg/chromium/device/screen_orientation/ScreenOrientationListener;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static isAutoRotateEnabledByUser()Z
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accelerometer_rotation"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    return v1

    :cond_11
    return v2
.end method
