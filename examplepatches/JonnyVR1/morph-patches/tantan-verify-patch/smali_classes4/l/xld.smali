.class public Ll/xld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k5f;


# static fields
.field public static final c:Ljava/lang/String;

.field public static final d:J


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/p8c;->e(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/xld;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sput-wide v0, Ll/xld;->d:J

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xld;->a:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Ll/xld;->b:Landroid/content/Context;

    .line 12
    .line 13
    new-instance p1, Ljava/lang/Thread;

    .line 14
    .line 15
    new-instance v0, Ll/xld$a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/xld$a;-><init>(Ll/xld;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic b(Ll/xld;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xld;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getApp()Lcom/tantanapp/beatles/v2/data/App;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/tantanapp/beatles/v2/data/App;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/tantanapp/beatles/v2/data/App;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, v0}, Ll/xld;->f(Lcom/tantanapp/beatles/v2/data/App;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setApp(Lcom/tantanapp/beatles/v2/data/App;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getDevice()Lcom/tantanapp/beatles/v2/data/Device;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    new-instance v0, Lcom/tantanapp/beatles/v2/data/Device;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/tantanapp/beatles/v2/data/Device;-><init>()V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0, v0}, Ll/xld;->c(Lcom/tantanapp/beatles/v2/data/Device;)Lcom/tantanapp/beatles/v2/data/Device;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setDevice(Lcom/tantanapp/beatles/v2/data/Device;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xld;->d()Lcom/tantanapp/beatles/v2/data/OperatingSystem;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setOs(Lcom/tantanapp/beatles/v2/data/OperatingSystem;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    new-array p0, p0, [Ljava/lang/Object;

    .line 44
    .line 45
    const-string p1, "DefaultAndroidEventProcessor process done!"

    .line 46
    .line 47
    invoke-static {p1, p0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final c(Lcom/tantanapp/beatles/v2/data/Device;)Lcom/tantanapp/beatles/v2/data/Device;
    .locals 4

    .line 1
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setManufacturer(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setBrand(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setFamily(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setModel(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Landroid/os/Build;->ID:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setModelId(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    sub-long/2addr v0, v2

    .line 37
    invoke-static {v0, v1}, Ll/p8c;->e(J)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setBootTime(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/tantanapp/beatles/NetConnectivityReceiver;->getNetType()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setConnectionType(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/xld;->g(Lcom/tantanapp/beatles/v2/data/Device;)V

    .line 52
    .line 53
    .line 54
    :try_start_0
    iget-object v0, p0, Ll/xld;->b:Landroid/content/Context;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->f(Landroid/content/Context;)Landroid/app/ActivityManager$MemoryInfo;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    iget-object v1, p0, Ll/xld;->b:Landroid/content/Context;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/tantanapp/beatles/utils/DeviceUtil;->l(Landroid/content/Context;)J

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p1, v1}, Lcom/tantanapp/beatles/v2/data/Device;->setMemorySize(Ljava/lang/Long;)V

    .line 73
    .line 74
    .line 75
    iget-wide v1, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    .line 76
    .line 77
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p1, v1}, Lcom/tantanapp/beatles/v2/data/Device;->setFreeMemory(Ljava/lang/Long;)V

    .line 82
    .line 83
    .line 84
    iget-boolean v0, v0, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    .line 85
    .line 86
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setLowMemory(Ljava/lang/Boolean;)V

    .line 91
    .line 92
    .line 93
    :cond_0
    iget-object v0, p0, Ll/xld;->b:Landroid/content/Context;

    .line 94
    .line 95
    const/4 v1, 0x0

    .line 96
    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    new-instance v1, Landroid/os/StatFs;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-direct {v1, v2}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v1}, Ll/d6g0;->h(Landroid/os/StatFs;)Ljava/lang/Long;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {p1, v2}, Lcom/tantanapp/beatles/v2/data/Device;->setStorageSize(Ljava/lang/Long;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/d6g0;->j(Landroid/os/StatFs;)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {p1, v1}, Lcom/tantanapp/beatles/v2/data/Device;->setFreeStorage(Ljava/lang/Long;)V

    .line 123
    .line 124
    .line 125
    :cond_1
    iget-object v1, p0, Ll/xld;->b:Landroid/content/Context;

    .line 126
    .line 127
    invoke-static {v1, v0}, Ll/d6g0;->f(Landroid/content/Context;Ljava/io/File;)Landroid/os/StatFs;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    if-eqz v0, :cond_2

    .line 132
    .line 133
    invoke-static {v0}, Ll/d6g0;->g(Landroid/os/StatFs;)Ljava/lang/Long;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {p1, v1}, Lcom/tantanapp/beatles/v2/data/Device;->setExternalStorageSize(Ljava/lang/Long;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0}, Ll/d6g0;->i(Landroid/os/StatFs;)Ljava/lang/Long;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setExternalFreeStorage(Ljava/lang/Long;)V

    .line 145
    .line 146
    .line 147
    :cond_2
    iget-object v0, p0, Ll/xld;->b:Landroid/content/Context;

    .line 148
    .line 149
    invoke-static {v0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->j(Landroid/content/Context;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setScreenWidthPixels(Ljava/lang/Integer;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/xld;->b:Landroid/content/Context;

    .line 161
    .line 162
    invoke-static {v0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->i(Landroid/content/Context;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setScreenHeightPixels(Ljava/lang/Integer;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/xld;->b:Landroid/content/Context;

    .line 174
    .line 175
    invoke-static {v0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->b(Landroid/content/Context;)F

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-virtual {p1, v0}, Lcom/tantanapp/beatles/v2/data/Device;->setScreenDensity(F)V

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Ll/xld;->b:Landroid/content/Context;

    .line 183
    .line 184
    invoke-static {p0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->c(Landroid/content/Context;)I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/Device;->setScreenDpi(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    .line 190
    .line 191
    :catchall_0
    return-object p1
.end method

.method public final d()Lcom/tantanapp/beatles/v2/data/OperatingSystem;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/v2/data/OperatingSystem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Android"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setVersion(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setBuild(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/xld;->a:Ljava/util/Map;

    .line 24
    .line 25
    const-string v2, "rooted"

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    check-cast v1, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setRooted(Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setRooted(Ljava/lang/Boolean;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Ll/xld;->a:Ljava/util/Map;

    .line 45
    .line 46
    const-string v1, "emulator"

    .line 47
    .line 48
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    check-cast p0, Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setEmulator(Ljava/lang/Boolean;)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Lcom/tantanapp/beatles/v2/data/OperatingSystem;->setEmulator(Ljava/lang/Boolean;)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public final e()V
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/jmd0;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "rooted"

    .line 15
    .line 16
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    const-string v1, "emulator"

    .line 20
    .line 21
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->o()Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/xld;->a:Ljava/util/Map;

    .line 29
    .line 30
    return-void
.end method

.method public final f(Lcom/tantanapp/beatles/v2/data/App;)V
    .locals 4

    .line 1
    sget-object p0, Ll/xld;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/App;->setAppStartTime(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/vc60;->c()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/App;->setAppIdentifier(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/vc60;->f()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/App;->setAppVersion(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/vc60;->e()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ""

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/App;->setAppBuild(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/zy0;->g()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/App;->setForeground(Ljava/lang/Boolean;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    sget-wide v2, Ll/xld;->d:J

    .line 64
    .line 65
    sub-long/2addr v0, v2

    .line 66
    const-wide/16 v2, 0x3e8

    .line 67
    .line 68
    div-long/2addr v0, v2

    .line 69
    invoke-virtual {p1, v0, v1}, Lcom/tantanapp/beatles/v2/data/App;->setUpDuration(J)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final g(Lcom/tantanapp/beatles/v2/data/Device;)V
    .locals 0
    .param p1    # Lcom/tantanapp/beatles/v2/data/Device;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object p0, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/Device;->setArch([Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tantanapp/beatles/utils/DeviceUtil;->a()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/Device;->setCurrentArch(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
