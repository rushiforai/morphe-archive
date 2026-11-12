.class public final Lorg/chromium/base/RadioUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/Boolean;

.field public static b:Ljava/lang/Boolean;


# direct methods
.method public static getCellDataActivity()I
    .registers 3

    const-string v0, "RadioUtils::getCellDataActivity"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    :try_start_7
    sget-object v1, Lt8;->a:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_22

    :try_start_11
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDataActivity()I

    move-result v1
    :try_end_15
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_15} :catch_1b
    .catchall {:try_start_11 .. :try_end_15} :catchall_22

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_1a
    return v1

    :catch_1b
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_20
    const/4 v0, -0x1

    return v0

    :catchall_22
    move-exception v1

    if-eqz v0, :cond_2d

    :try_start_25
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_29

    goto :goto_2d

    :catchall_29
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2d
    :goto_2d
    throw v1
.end method

.method public static getCellSignalLevel()I
    .registers 3

    const-string v0, "RadioUtils::getCellSignalLevel"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    :try_start_7
    sget-object v1, Lt8;->a:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_22

    const/4 v2, -0x1

    :try_start_12
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSignalStrength()Landroid/telephony/SignalStrength;

    move-result-object v1

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v2
    :try_end_1c
    .catch Ljava/lang/SecurityException; {:try_start_12 .. :try_end_1c} :catch_1c
    .catchall {:try_start_12 .. :try_end_1c} :catchall_22

    :catch_1c
    :cond_1c
    if-eqz v0, :cond_21

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_21
    return v2

    :catchall_22
    move-exception v1

    if-eqz v0, :cond_2d

    :try_start_25
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_29

    goto :goto_2d

    :catchall_29
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2d
    :goto_2d
    throw v1
.end method

.method public static isSupported()Z
    .registers 7

    sget-object v0, Lorg/chromium/base/RadioUtils;->a:Ljava/lang/Boolean;

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_24

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-string v4, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v6

    :try_start_13
    invoke-virtual {v0, v4, v5, v6}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v0
    :try_end_17
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_17} :catch_18

    goto :goto_19

    :catch_18
    move v0, v1

    :goto_19
    if-nez v0, :cond_1d

    move v0, v3

    goto :goto_1e

    :cond_1d
    move v0, v2

    :goto_1e
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/RadioUtils;->a:Ljava/lang/Boolean;

    :cond_24
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_50

    sget-object v0, Lorg/chromium/base/RadioUtils;->b:Ljava/lang/Boolean;

    if-nez v0, :cond_49

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-string v4, "android.permission.ACCESS_WIFI_STATE"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v6

    :try_start_3a
    invoke-virtual {v0, v4, v5, v6}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v1
    :try_end_3e
    .catch Ljava/lang/RuntimeException; {:try_start_3a .. :try_end_3e} :catch_3e

    :catch_3e
    if-nez v1, :cond_42

    move v0, v3

    goto :goto_43

    :cond_42
    move v0, v2

    :goto_43
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/RadioUtils;->b:Ljava/lang/Boolean;

    :cond_49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_50

    move v2, v3

    :cond_50
    return v2
.end method

.method public static isWifiConnected()Z
    .registers 4

    const-string v0, "RadioUtils::isWifiConnected"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    :try_start_7
    sget-object v1, Lt8;->a:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_1b

    if-nez v0, :cond_23

    return v3

    :cond_1b
    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v1
    :try_end_1f
    .catchall {:try_start_7 .. :try_end_1f} :catchall_32

    if-nez v1, :cond_27

    if-eqz v0, :cond_26

    :cond_23
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_26
    return v3

    :cond_27
    const/4 v2, 0x1

    :try_start_28
    invoke-virtual {v1, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v1
    :try_end_2c
    .catchall {:try_start_28 .. :try_end_2c} :catchall_32

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_31
    return v1

    :catchall_32
    move-exception v1

    if-eqz v0, :cond_3d

    :try_start_35
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_39

    goto :goto_3d

    :catchall_39
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3d
    :goto_3d
    throw v1
.end method
