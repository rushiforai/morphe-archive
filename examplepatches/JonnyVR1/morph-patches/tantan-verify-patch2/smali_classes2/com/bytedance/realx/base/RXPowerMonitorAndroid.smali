.class public Lcom/bytedance/realx/base/RXPowerMonitorAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static TAG:Ljava/lang/String; = "RXPowerMonitorAndroid"

.field private static batteryManager:Landroid/os/BatteryManager;

.field private static batterySaverReceiver:Landroid/content/BroadcastReceiver;

.field private static batteryStatus:Landroid/content/Intent;

.field private static batteryVolt:F

.field private static context:Landroid/content/Context;

.field private static ifilter:Landroid/content/IntentFilter;

.field private static mBatteryLevel:I

.field private static mBatterySaveMode:I

.field private static mBatteryTemperature:I

.field private static mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private static mChargeStatus:I

.field private static mCpuCoreCount:I

.field private static powerManager:Landroid/os/PowerManager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 6
    .line 7
    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    .line 9
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batteryVolt:F

    .line 10
    .line 11
    new-instance v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid$1;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/bytedance/realx/base/RXPowerMonitorAndroid$1;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 17
    .line 18
    new-instance v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid$2;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/bytedance/realx/base/RXPowerMonitorAndroid$2;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batterySaverReceiver:Landroid/content/BroadcastReceiver;

    .line 24
    .line 25
    const/4 v0, -0x1

    .line 26
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mCpuCoreCount:I

    .line 27
    .line 28
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mChargeStatus:I

    .line 29
    .line 30
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryLevel:I

    .line 31
    .line 32
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryTemperature:I

    .line 33
    .line 34
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 35
    .line 36
    sget-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 37
    .line 38
    const-string v1, "batterymanager"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/os/BatteryManager;

    .line 45
    .line 46
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batteryManager:Landroid/os/BatteryManager;

    .line 47
    .line 48
    new-instance v0, Landroid/content/IntentFilter;

    .line 49
    .line 50
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    .line 51
    .line 52
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->ifilter:Landroid/content/IntentFilter;

    .line 56
    .line 57
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 58
    .line 59
    sget-object v2, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 60
    .line 61
    invoke-static {v1, v2, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batteryStatus:Landroid/content/Intent;

    .line 66
    .line 67
    sget-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 68
    .line 69
    const-string v1, "power"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Landroid/os/PowerManager;

    .line 76
    .line 77
    sput-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->powerManager:Landroid/os/PowerManager;

    .line 78
    .line 79
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$002(I)I
    .locals 0

    .line 1
    sput p0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mChargeStatus:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(I)I
    .locals 0

    .line 1
    sput p0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryTemperature:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(I)I
    .locals 0

    .line 1
    sput p0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(I)I
    .locals 0

    .line 1
    sput p0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400()Landroid/os/PowerManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->powerManager:Landroid/os/PowerManager;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getBatteryCurrentCapacity()I
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batteryManager:Landroid/os/BatteryManager;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {v1, v2}, Landroid/os/BatteryManager;->getLongProperty(I)J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    long-to-int v1, v1

    .line 12
    div-int/lit16 v1, v1, 0x3e8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    move v1, v0

    .line 20
    :goto_0
    if-gez v1, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v0, v1

    .line 24
    :goto_1
    return v0
.end method

.method public static getBatteryDesignCapacity()I
    .locals 4

    .line 1
    const-string v0, "com.android.internal.os.PowerProfile"

    .line 2
    .line 3
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Landroid/content/Context;

    .line 8
    .line 9
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 18
    .line 19
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "getBatteryCapacity"

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Double;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 49
    .line 50
    .line 51
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    long-to-int v0, v0

    .line 53
    return v0

    .line 54
    :catch_0
    move-exception v0

    .line 55
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    return v0
.end method

.method public static getBatteryLevel()I
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batteryManager:Landroid/os/BatteryManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryLevel:I

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    invoke-virtual {v0, v1}, Landroid/os/BatteryManager;->getIntProperty(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryLevel:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    :cond_0
    :goto_0
    sget v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryLevel:I

    .line 23
    .line 24
    return v0
.end method

.method public static getBatteryMaxCapacity()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static getBatterySaveStatus()I
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 3
    .line 4
    const-string v2, "Xiaomi"

    .line 5
    .line 6
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    sget-object v2, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->powerManager:Landroid/os/PowerManager;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    sget v2, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 17
    .line 18
    if-ne v2, v0, :cond_0

    .line 19
    .line 20
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "POWER_SAVE_MODE_OPEN"

    .line 27
    .line 28
    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    sput v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 33
    .line 34
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 35
    .line 36
    sget-object v2, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batterySaverReceiver:Landroid/content/BroadcastReceiver;

    .line 37
    .line 38
    new-instance v3, Landroid/content/IntentFilter;

    .line 39
    .line 40
    const-string v4, "miui.intent.action.POWER_SAVE_MODE_CHANGED"

    .line 41
    .line 42
    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2, v3}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :catch_0
    move-exception v1

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const-string v2, "Huawei"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "SmartModeStatus"

    .line 66
    .line 67
    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v2, 0x4

    .line 72
    if-ne v1, v2, :cond_1

    .line 73
    .line 74
    const/4 v1, 0x1

    .line 75
    sput v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    const/4 v1, 0x0

    .line 79
    sput v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->powerManager:Landroid/os/PowerManager;

    .line 83
    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    sget v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 87
    .line 88
    if-ne v1, v0, :cond_3

    .line 89
    .line 90
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 91
    .line 92
    sget-object v2, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batterySaverReceiver:Landroid/content/BroadcastReceiver;

    .line 93
    .line 94
    new-instance v3, Landroid/content/IntentFilter;

    .line 95
    .line 96
    const-string v4, "android.os.action.POWER_SAVE_MODE_CHANGED"

    .line 97
    .line 98
    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1, v2, v3}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 102
    .line 103
    .line 104
    sget-object v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->powerManager:Landroid/os/PowerManager;

    .line 105
    .line 106
    invoke-virtual {v1}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    sput v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :goto_0
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 116
    .line 117
    .line 118
    :cond_3
    :goto_1
    sget v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatterySaveMode:I

    .line 119
    .line 120
    return v0
.end method

.method public static getBatteryTemperature()I
    .locals 1

    .line 1
    sget v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mBatteryTemperature:I

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0xa

    .line 4
    .line 5
    return v0
.end method

.method public static getChargeStatus()I
    .locals 3

    .line 1
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->batteryManager:Landroid/os/BatteryManager;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v1, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mChargeStatus:I

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    invoke-virtual {v0, v1}, Landroid/os/BatteryManager;->getIntProperty(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sput v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mChargeStatus:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    move-exception v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    :cond_0
    :goto_0
    sget v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->mChargeStatus:I

    .line 29
    .line 30
    const/4 v1, 0x5

    .line 31
    if-eq v0, v1, :cond_2

    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    return v0

    .line 39
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 40
    return v0
.end method

.method public static getScreenBrightness()I
    .locals 4

    .line 1
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "Xiaomi"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    sget-object v0, Lcom/bytedance/realx/base/RXPowerMonitorAndroid;->context:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v2, "screen_brightness"

    .line 20
    .line 21
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-double v0, v0

    .line 26
    const-wide v2, 0x406fe00000000000L    # 255.0

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    div-double/2addr v0, v2

    .line 32
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 33
    .line 34
    mul-double/2addr v0, v2

    .line 35
    double-to-int v0, v0

    .line 36
    return v0
.end method

.method public static getVoltage()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method
