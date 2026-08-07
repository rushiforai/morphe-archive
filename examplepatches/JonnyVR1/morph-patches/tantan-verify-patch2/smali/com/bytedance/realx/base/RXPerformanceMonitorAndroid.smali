.class public Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# static fields
.field private static final CPU_IDLE_STATE_FILTER:Ljava/io/FileFilter;

.field private static final ERROR_RESULT:F

.field private static mCpuCoreCount:I

.field private static mCpuIdleStateCount:I

.field private static mMemoryState:I

.field private static mMemoryStateRegisterd:Z

.field private static mPerformanceMonitor:Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;

.field private static mThermalState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->CPU_IDLE_STATE_FILTER:Ljava/io/FileFilter;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    sput v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mCpuCoreCount:I

    .line 10
    .line 11
    sput v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mCpuIdleStateCount:I

    .line 12
    .line 13
    sput v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 17
    .line 18
    sput-boolean v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryStateRegisterd:Z

    .line 19
    .line 20
    new-instance v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mPerformanceMonitor:Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;

    .line 26
    .line 27
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
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(I)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->convertThermalState(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static convertThermalState(I)I
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x4

    return p0

    :pswitch_0
    const/4 p0, 0x3

    return p0

    :pswitch_1
    const/4 p0, 0x2

    return p0

    :pswitch_2
    const/4 p0, 0x1

    return p0

    :pswitch_3
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static getCpuIdleStateCount()I
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const-string v1, "/sys/devices/system/cpu/cpu0/cpuidle/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->CPU_IDLE_STATE_FILTER:Ljava/io/FileFilter;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    array-length v0, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return v0

    .line 18
    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 19
    return v0
.end method

.method public static getCurrentPidMemorySize()I
    .locals 3

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    const-string v2, "activity"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/app/ActivityManager;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    filled-new-array {v2}, [I

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getProcessMemoryInfo([I)[Landroid/os/Debug$MemoryInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    aget-object v0, v0, v1

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    .line 35
    .line 36
    .line 37
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return v0

    .line 39
    :catch_0
    return v1
.end method

.method public static getIfRoomsDevice()Z
    .locals 2

    const/4 v0, 0x0

    return v0

    .line 1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "a3382"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    return v0
.end method

.method public static getJavaAppMemoryUsage()I
    .locals 3

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    const-string v2, "activity"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/app/ActivityManager;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    filled-new-array {v2}, [I

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getProcessMemoryInfo([I)[Landroid/os/Debug$MemoryInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    aget-object v0, v0, v1

    .line 33
    .line 34
    iget v0, v0, Landroid/os/Debug$MemoryInfo;->dalvikPss:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    return v0

    .line 37
    :catch_0
    return v1
.end method

.method public static getMemoryState()I
    .locals 2

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    return v0

    .line 9
    :cond_0
    sget-boolean v1, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryStateRegisterd:Z

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    sget-object v1, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mPerformanceMonitor:Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    sput-boolean v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryStateRegisterd:Z

    .line 20
    .line 21
    :cond_1
    sget v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 22
    .line 23
    return v0
.end method

.method public static getThermalState()I
    .locals 4

    const/4 v0, 0x0

    return v0

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    const/4 v3, -0x1

    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 10
    .line 11
    if-ne v0, v3, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid$2;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid$2;-><init>()V

    .line 16
    .line 17
    .line 18
    sput v2, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 19
    .line 20
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "power"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/os/PowerManager;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    :try_start_0
    invoke-static {v1}, Ll/mjc0;->a(Landroid/os/PowerManager;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sput v2, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    invoke-static {v2}, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->convertThermalState(I)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    sput v2, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/njc0;->a(Landroid/os/PowerManager;Landroid/os/PowerManager$OnThermalStatusChangedListener;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    sget v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 51
    .line 52
    return v0

    .line 53
    :cond_0
    sget v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 54
    .line 55
    if-ne v0, v3, :cond_1

    .line 56
    .line 57
    sput v2, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 58
    .line 59
    :cond_1
    :goto_0
    sget v0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 60
    .line 61
    return v0
.end method

.method public static getThreadCount()I
    .locals 1

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-static {}, Ljava/lang/Thread;->activeCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static setThermalState(I)V
    .locals 0

    return-void

    .line 1
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mThermalState:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    return-void
.end method

.method public onLowMemory()V
    .locals 0

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    const/4 p0, 0x5

    .line 2
    if-eq p1, p0, :cond_6

    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    if-eq p1, v0, :cond_5

    .line 7
    .line 8
    const/16 v0, 0xf

    .line 9
    .line 10
    if-eq p1, v0, :cond_4

    .line 11
    .line 12
    const/16 v0, 0x14

    .line 13
    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/16 v0, 0x28

    .line 17
    .line 18
    if-eq p1, v0, :cond_2

    .line 19
    .line 20
    const/16 p0, 0x3c

    .line 21
    .line 22
    if-eq p1, p0, :cond_1

    .line 23
    .line 24
    const/16 p0, 0x50

    .line 25
    .line 26
    if-eq p1, p0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 p0, 0x7

    .line 30
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const/4 p0, 0x6

    .line 34
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    const/4 p0, 0x4

    .line 41
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_4
    const/4 p0, 0x3

    .line 45
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 46
    .line 47
    return-void

    .line 48
    :cond_5
    const/4 p0, 0x2

    .line 49
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_6
    const/4 p0, 0x1

    .line 53
    sput p0, Lcom/bytedance/realx/base/RXPerformanceMonitorAndroid;->mMemoryState:I

    .line 54
    .line 55
    return-void
.end method
