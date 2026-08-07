.class public Lcom/alibaba/android/patronus/_Patrons;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/android/patronus/_Patrons$AutoCheckerTask;
    }
.end annotation


# static fields
.field private static final ANDROID_VERSION_NOT_SUPPORT:I = 0x7d1

.field private static final ERROR_READ_VSS_FAILED:I = 0x3e9

.field private static final GB:J = 0x40000000L

.field private static final HEAP_SIZE_IS_NOT_BIG_ENOUGH:I = 0x7d2

.field private static final KB:J = 0x400L

.field private static final LOWER_LIMIT_IS_TOO_SMALL:I = 0x7d3

.field private static final MAX_CHECK_OF_STRICT_MODE:I = 0x5

.field private static final MB:J = 0x100000L

.field private static NATIVE_LIB_LOADED:Z = false

.field private static final S:J = 0x3e8L

.field public static final TAG:Ljava/lang/String; = "Patrons"

.field private static final VSS_MAX_IN_V7A:F = 4.2949673E9f

.field private static autoCheckVssTimer:Ljava/util/Timer; = null

.field private static config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig; = null

.field private static currentRegionSpaces:J = 0x0L

.field private static final numPattern:Ljava/util/regex/Pattern;

.field private static final numRegEx:Ljava/lang/String; = "[^0-9]"

.field private static final strictCount:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "[^0-9]"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/alibaba/android/patronus/_Patrons;->numPattern:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    new-instance v0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    sput-object v0, Lcom/alibaba/android/patronus/_Patrons;->autoCheckVssTimer:Ljava/util/Timer;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    sput-boolean v0, Lcom/alibaba/android/patronus/_Patrons;->NATIVE_LIB_LOADED:Z

    .line 21
    .line 22
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 25
    .line 26
    .line 27
    sput-object v1, Lcom/alibaba/android/patronus/_Patrons;->strictCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    .line 29
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->isSupport()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string v0, "patrons"

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    sput-boolean v0, Lcom/alibaba/android/patronus/_Patrons;->NATIVE_LIB_LOADED:Z

    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized __init()I
    .locals 8

    .line 1
    const-class v0, Lcom/alibaba/android/patronus/_Patrons;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->isSupport()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string v1, "Patrons"

    .line 11
    .line 12
    const-string v2, "patrons init failed, android version or abi not match !"

    .line 13
    .line 14
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    const/16 v0, 0x7d1

    .line 19
    .line 20
    return v0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :try_start_1
    sget-object v1, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 24
    .line 25
    iget-boolean v2, v1, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->debuggable:Z

    .line 26
    .line 27
    iget-boolean v1, v1, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->fixHuaweiBinderAbort:Z

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-static {v3, v2, v1}, Lcom/alibaba/android/patronus/_Patrons;->__init(ZZZ)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const-string v2, "Patrons"

    .line 37
    .line 38
    const-string v3, "patrons native init failed !"

    .line 39
    .line 40
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    .line 43
    monitor-exit v0

    .line 44
    return v1

    .line 45
    :cond_1
    :try_start_2
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->getCurrentRegionSpaceSize()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    const-wide/32 v3, 0x100000

    .line 50
    .line 51
    .line 52
    div-long/2addr v1, v3

    .line 53
    sput-wide v1, Lcom/alibaba/android/patronus/_Patrons;->currentRegionSpaces:J

    .line 54
    .line 55
    const-wide/16 v3, 0x0

    .line 56
    .line 57
    cmp-long v5, v1, v3

    .line 58
    .line 59
    if-lez v5, :cond_6

    .line 60
    .line 61
    const-wide/16 v5, 0x400

    .line 62
    .line 63
    cmp-long v5, v1, v5

    .line 64
    .line 65
    if-lez v5, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    sget-object v5, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 69
    .line 70
    iget v6, v5, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->lowerLimit:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    .line 72
    int-to-long v6, v6

    .line 73
    cmp-long v1, v1, v6

    .line 74
    .line 75
    if-gez v1, :cond_3

    .line 76
    .line 77
    monitor-exit v0

    .line 78
    const/16 v0, 0x7d3

    .line 79
    .line 80
    return v0

    .line 81
    :cond_3
    :try_start_3
    iget-boolean v1, v5, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->auto:Z

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->readVssSize()J

    .line 86
    .line 87
    .line 88
    move-result-wide v1

    .line 89
    cmp-long v1, v1, v3

    .line 90
    .line 91
    if-gez v1, :cond_4

    .line 92
    .line 93
    const-string v1, "Patrons"

    .line 94
    .line 95
    const-string v2, "patrons read vss failed !"

    .line 96
    .line 97
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 98
    .line 99
    .line 100
    monitor-exit v0

    .line 101
    const/16 v0, 0x3e9

    .line 102
    .line 103
    return v0

    .line 104
    :cond_4
    :try_start_4
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->toForeground()V

    .line 105
    .line 106
    .line 107
    :cond_5
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->readVssSize()J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 108
    .line 109
    .line 110
    monitor-exit v0

    .line 111
    const/4 v0, 0x0

    .line 112
    return v0

    .line 113
    :cond_6
    :goto_0
    monitor-exit v0

    .line 114
    const/16 v0, 0x7d2

    .line 115
    .line 116
    return v0

    .line 117
    :goto_1
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 118
    throw v1
.end method

.method private static native __init(ZZZ)I
.end method

.method private static _start(I)V
    .locals 7

    .line 1
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->auto:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->autoCheckVssTimer:Ljava/util/Timer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Lcom/alibaba/android/patronus/_Patrons;->autoCheckVssTimer:Ljava/util/Timer;

    .line 16
    .line 17
    :cond_0
    new-instance v1, Ljava/util/Timer;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v1, Lcom/alibaba/android/patronus/_Patrons;->autoCheckVssTimer:Ljava/util/Timer;

    .line 23
    .line 24
    new-instance v2, Lcom/alibaba/android/patronus/_Patrons$AutoCheckerTask;

    .line 25
    .line 26
    invoke-direct {v2}, Lcom/alibaba/android/patronus/_Patrons$AutoCheckerTask;-><init>()V

    .line 27
    .line 28
    .line 29
    int-to-long v3, p0

    .line 30
    const-wide/16 v5, 0x3e8

    .line 31
    .line 32
    mul-long/2addr v3, v5

    .line 33
    move-wide v5, v3

    .line 34
    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static synthetic access$000()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1

    .line 1
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->strictCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200(I)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/alibaba/android/patronus/_Patrons;->_start(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/alibaba/android/patronus/_Patrons;->currentRegionSpaces:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$302(J)J
    .locals 0

    .line 1
    sput-wide p0, Lcom/alibaba/android/patronus/_Patrons;->currentRegionSpaces:J

    .line 2
    .line 3
    return-wide p0
.end method

.method public static synthetic access$400()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->stop()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/alibaba/android/patronus/_Patrons;->stringToFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static asyncWriteInitResultToFile(Landroid/content/Context;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Lcom/alibaba/android/patronus/_Patrons$1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/alibaba/android/patronus/_Patrons$1;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static native dumpLogs(Z)Ljava/lang/String;
.end method

.method public static dumpNativeLogs(Z)Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/alibaba/android/patronus/_Patrons;->NATIVE_LIB_LOADED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/alibaba/android/patronus/_Patrons;->dumpLogs(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "can not dump logs without native libs"

    .line 11
    .line 12
    return-object p0
.end method

.method public static native getCurrentRegionSpaceSize()J
.end method

.method public static inBackground()V
    .locals 1

    .line 1
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->auto:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->autoCheckVssTimer:Ljava/util/Timer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Lcom/alibaba/android/patronus/_Patrons;->autoCheckVssTimer:Ljava/util/Timer;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static declared-synchronized init(Landroid/content/Context;Lcom/alibaba/android/patronus/Patrons$PatronsConfig;)I
    .locals 2

    .line 1
    const-class v0, Lcom/alibaba/android/patronus/_Patrons;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    sput-object p1, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    sget-object p1, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->__init()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    sget-object v1, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 21
    .line 22
    iget-boolean v1, v1, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->recordInitResult:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/alibaba/android/patronus/_Patrons;->asyncWriteInitResultToFile(Landroid/content/Context;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    :cond_1
    monitor-exit v0

    .line 32
    return p1

    .line 33
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method private static isSupport()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/16 v1, 0x1f

    .line 8
    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Landroid/os/Process;->is64Bit()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static readVssSize()J
    .locals 6

    .line 1
    const-string v0, "/proc/"

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    .line 6
    .line 7
    new-instance v4, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, "/status"

    .line 20
    .line 21
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ljava/io/BufferedReader;

    .line 32
    .line 33
    new-instance v4, Ljava/io/InputStreamReader;

    .line 34
    .line 35
    invoke-direct {v4, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const-string v5, "vmsize"

    .line 52
    .line 53
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-eqz v5, :cond_0

    .line 58
    .line 59
    sget-object v5, Lcom/alibaba/android/patronus/_Patrons;->numPattern:Ljava/util/regex/Pattern;

    .line 60
    .line 61
    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    const-string v5, ""

    .line 66
    .line 67
    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    int-to-long v1, v1

    .line 80
    const-wide/16 v4, 0x400

    .line 81
    .line 82
    mul-long/2addr v1, v4

    .line 83
    :cond_1
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    return-wide v1

    .line 90
    :catch_0
    const-string v0, "Patrons"

    .line 91
    .line 92
    const-string v3, "read current status failed."

    .line 93
    .line 94
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-wide v1
.end method

.method public static native shrinkRegionSpace(I)Z
.end method

.method private static stop()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->inBackground()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->auto:Z

    .line 8
    .line 9
    return-void
.end method

.method private static stringToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    .line 2
    .line 3
    new-instance v1, Ljava/io/File;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "\n\n"

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    .line 35
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 43
    :catchall_1
    move-exception v1

    .line 44
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_2
    move-exception v0

    .line 49
    :try_start_5
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    throw v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 53
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v1, "write content to file: "

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, " failed."

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string v0, "Patrons"

    .line 73
    .line 74
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static toForeground()V
    .locals 2

    .line 1
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->strictCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/alibaba/android/patronus/_Patrons;->config:Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 8
    .line 9
    iget v0, v0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->periodOfCheck:I

    .line 10
    .line 11
    invoke-static {v0}, Lcom/alibaba/android/patronus/_Patrons;->_start(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
