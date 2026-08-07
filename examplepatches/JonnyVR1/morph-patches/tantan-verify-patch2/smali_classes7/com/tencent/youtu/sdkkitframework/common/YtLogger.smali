.class public final Lcom/tencent/youtu/sdkkitframework/common/YtLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;
    }
.end annotation


# static fields
.field public static final DEBUG_LEVEL:I = 0x4

.field public static final ERROR_LEVEL:I = 0x0

.field public static final INFO_LEVEL:I = 0x2

.field public static final ONLINE_LEVEL:I = -0x3e8

.field public static final VERB_LEVEL:I = 0x5

.field public static final WARN_LEVEL:I = 0x1

.field public static currentLogLevel:I

.field public static dateFormat:Ljava/text/DateFormat;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation
.end field

.field public static keywords:Ljava/lang/String;

.field public static lastLogMessage:Ljava/lang/String;

.field public static localFile:Ljava/io/File;

.field public static localLogPath:Ljava/lang/String;

.field public static loggerListener:Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;

.field public static mExecutorService:Ljava/util/concurrent/ExecutorService;

.field public static needLogFile:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy-MM-dd_HH-mm-ss.SSS"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->dateFormat:Ljava/text/DateFormat;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->loggerListener:Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    sput-boolean v1, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->needLogFile:Z

    .line 15
    .line 16
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->keywords:Ljava/lang/String;

    .line 17
    .line 18
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localFile:Ljava/io/File;

    .line 19
    .line 20
    sput v1, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 21
    .line 22
    const-string v0, ""

    .line 23
    .line 24
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->lastLogMessage:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 31
    .line 32
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

.method public static buildMessageForLocalLogFile(ILjava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/16 v2, -0x3e8

    .line 4
    .line 5
    const/4 v3, 0x4

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    if-eq p0, v1, :cond_2

    .line 9
    .line 10
    sget v4, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 11
    .line 12
    if-eq v4, v3, :cond_2

    .line 13
    .line 14
    if-ne v4, v0, :cond_0

    .line 15
    .line 16
    if-eq p0, v3, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-ne v4, v2, :cond_1

    .line 20
    .line 21
    if-ne p0, v2, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-void

    .line 25
    :cond_2
    :goto_0
    new-instance v4, Ljava/lang/StringBuffer;

    .line 26
    .line 27
    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 28
    .line 29
    .line 30
    if-eq p0, v2, :cond_8

    .line 31
    .line 32
    if-eqz p0, :cond_7

    .line 33
    .line 34
    if-eq p0, v1, :cond_6

    .line 35
    .line 36
    if-eq p0, v0, :cond_5

    .line 37
    .line 38
    if-eq p0, v3, :cond_4

    .line 39
    .line 40
    const/4 v0, 0x5

    .line 41
    if-eq p0, v0, :cond_3

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    const-string p0, "[VERB]"

    .line 45
    .line 46
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_4
    const-string p0, "[DEBUG]"

    .line 51
    .line 52
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_5
    const-string p0, "[INFO]"

    .line 57
    .line 58
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_6
    const-string p0, "[WARN]"

    .line 63
    .line 64
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_7
    const-string p0, "[ERROR]"

    .line 69
    .line 70
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_8
    const-string p0, "[ONLINE]"

    .line 75
    .line 76
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    .line 78
    .line 79
    :goto_1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->dateFormat:Ljava/text/DateFormat;

    .line 80
    .line 81
    new-instance v0, Ljava/util/Date;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    .line 92
    .line 93
    const-string p0, "        "

    .line 94
    .line 95
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    .line 100
    .line 101
    const-string p0, "    "

    .line 102
    .line 103
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->save2File(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-lt v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "[YTLog]-[DEBUG]-"

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {v1, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->showLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 2
    .line 3
    if-gez v0, :cond_1

    .line 4
    .line 5
    const/16 v1, -0x3e8

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "[YTLog]-[ERROR]-"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {v0, p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->showLog(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static getLogFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->dateFormat:Ljava/text/DateFormat;

    .line 26
    .line 27
    new-instance v2, Ljava/util/Date;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, ".log"

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance v0, Ljava/io/File;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_1

    .line 82
    .line 83
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    return-object v0

    .line 87
    :catch_0
    move-exception p0

    .line 88
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-object v0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-lt v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "[YTLog]-[INFO]-"

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {v1, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->showLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static o(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 2
    .line 3
    const/16 v1, -0x3e8

    .line 4
    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    const/4 v2, 0x4

    .line 8
    if-ne v0, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void

    .line 12
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "[YTLog]-[ONLINE]-"

    .line 15
    .line 16
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "-"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {v1, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->showLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static save2File(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localFile:Ljava/io/File;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->writeFile(Ljava/io/File;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setLogLevel(I)V
    .locals 1

    .line 1
    const/16 v0, -0x3e8

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :goto_0
    sput v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 16
    .line 17
    return-void
.end method

.method public static setLoggerListener(Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->loggerListener:Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;

    .line 2
    .line 3
    return-void
.end method

.method public static setNeedLogFile(ZLjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-static {p0, p1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->setNeedLogFile(ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setNeedLogFile(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localLogPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    sput-boolean p0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->needLogFile:Z

    .line 11
    .line 12
    const-string p0, "file saved must put path"

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    const-string p2, "YTLog"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sput-boolean p0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->needLogFile:Z

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    sput-object p2, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->keywords:Ljava/lang/String;

    .line 26
    .line 27
    sput-object p1, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localLogPath:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->getLogFile(Ljava/lang/String;)Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sput-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localFile:Ljava/io/File;

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public static showLog(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 52
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->loggerListener:Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;

    if-eqz v0, :cond_0

    .line 53
    invoke-interface {v0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    :cond_0
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localLogPath:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->needLogFile:Z

    if-eqz v0, :cond_1

    .line 55
    invoke-static {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->buildMessageForLocalLogFile(ILjava/lang/String;Ljava/lang/String;)V

    .line 56
    :cond_1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->lastLogMessage:Ljava/lang/String;

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 57
    sput-object p2, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->lastLogMessage:Ljava/lang/String;

    :cond_2
    return-void
.end method

.method public static showLog(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 7
    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    sget-object p3, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->loggerListener:Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;

    .line 23
    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    invoke-interface {p3, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger$IYtLoggerListener;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    sget-object p3, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->localLogPath:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p3, :cond_2

    .line 32
    .line 33
    const-string v0, ""

    .line 34
    .line 35
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-nez p3, :cond_2

    .line 40
    .line 41
    sget-boolean p3, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->needLogFile:Z

    .line 42
    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    invoke-static {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->buildMessageForLocalLogFile(ILjava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-lt v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "[YTLog]-[VERB]-"

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {v1, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->showLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->currentLogLevel:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    const/16 v2, -0x3e8

    .line 7
    .line 8
    if-ne v0, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void

    .line 12
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "[YTLog]-[WARN]-"

    .line 15
    .line 16
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {v1, p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->showLog(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static writeFile(Ljava/io/File;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->keywords:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->keywords:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 19
    .line 20
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/common/YtLogger$1;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger$1;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method
