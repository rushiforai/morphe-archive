.class public Lcom/alibaba/sdk/android/oss/common/OSSLog;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "OSS-Android-SDK"

.field private static enableLog:Z

.field private static logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

.field private static nopLogPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/sdk/android/oss/common/DefaultLogPrinter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/sdk/android/oss/common/DefaultLogPrinter;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 7
    .line 8
    new-instance v0, Lcom/alibaba/sdk/android/oss/common/OSSLog$1;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/alibaba/sdk/android/oss/common/OSSLog$1;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->nopLogPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 14
    .line 15
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

.method public static disableLog()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 3
    .line 4
    return-void
.end method

.method public static enableLog()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 3
    .line 4
    return-void
.end method

.method public static getLogPrinter()Lcom/alibaba/sdk/android/oss/common/LogPrinter;
    .locals 1

    .line 1
    sget-object v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 2
    .line 3
    return-object v0
.end method

.method public static isEnableLog()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    return v0
.end method

.method private static log2Local(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/alibaba/sdk/android/oss/common/OSSLogToFileUtils;->getInstance()Lcom/alibaba/sdk/android/oss/common/OSSLogToFileUtils;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Lcom/alibaba/sdk/android/oss/common/OSSLogToFileUtils;->write(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static logDebug(Ljava/lang/String;)V
    .locals 1

    .line 18
    const-string v0, "OSS-Android-SDK"

    invoke-static {v0, p0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static logDebug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-static {p0, p1, v0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logDebug(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static logDebug(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    sget-boolean p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 6
    .line 7
    sget-object v0, Lcom/alibaba/sdk/android/oss/common/LogLevel;->DEBUG:Lcom/alibaba/sdk/android/oss/common/LogLevel;

    .line 8
    .line 9
    invoke-interface {p0, v0, p1}, Lcom/alibaba/sdk/android/oss/common/LogPrinter;->log(Lcom/alibaba/sdk/android/oss/common/LogLevel;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p2}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->log2Local(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static logDebug(Ljava/lang/String;Z)V
    .locals 1

    .line 17
    const-string v0, "OSS-Android-SDK"

    invoke-static {v0, p0, p1}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logDebug(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static logError(Ljava/lang/String;)V
    .locals 1

    .line 18
    const-string v0, "OSS-Android-SDK"

    invoke-static {v0, p0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logError(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static logError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-static {p0, p1, v0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logError(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static logError(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    sget-boolean p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 6
    .line 7
    sget-object v0, Lcom/alibaba/sdk/android/oss/common/LogLevel;->ERROR:Lcom/alibaba/sdk/android/oss/common/LogLevel;

    .line 8
    .line 9
    invoke-interface {p0, v0, p1}, Lcom/alibaba/sdk/android/oss/common/LogPrinter;->log(Lcom/alibaba/sdk/android/oss/common/LogLevel;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p2}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->log2Local(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static logError(Ljava/lang/String;Z)V
    .locals 1

    .line 17
    const-string v0, "OSS-Android-SDK"

    invoke-static {v0, p0, p1}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logError(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static logInfo(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-static {p0, v0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logInfo(Ljava/lang/String;Z)V

    return-void
.end method

.method public static logInfo(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 6
    .line 7
    sget-object v1, Lcom/alibaba/sdk/android/oss/common/LogLevel;->INFO:Lcom/alibaba/sdk/android/oss/common/LogLevel;

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lcom/alibaba/sdk/android/oss/common/LogPrinter;->log(Lcom/alibaba/sdk/android/oss/common/LogLevel;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->log2Local(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static logThrowable2Local(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/alibaba/sdk/android/oss/common/OSSLogToFileUtils;->getInstance()Lcom/alibaba/sdk/android/oss/common/OSSLogToFileUtils;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Lcom/alibaba/sdk/android/oss/common/OSSLogToFileUtils;->write(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static logVerbose(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-static {p0, v0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logVerbose(Ljava/lang/String;Z)V

    return-void
.end method

.method public static logVerbose(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 6
    .line 7
    sget-object v1, Lcom/alibaba/sdk/android/oss/common/LogLevel;->VERBOSE:Lcom/alibaba/sdk/android/oss/common/LogLevel;

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lcom/alibaba/sdk/android/oss/common/LogPrinter;->log(Lcom/alibaba/sdk/android/oss/common/LogLevel;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->log2Local(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static logWarn(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-static {p0, v0}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logWarn(Ljava/lang/String;Z)V

    return-void
.end method

.method public static logWarn(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->enableLog:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 6
    .line 7
    sget-object v1, Lcom/alibaba/sdk/android/oss/common/LogLevel;->WARN:Lcom/alibaba/sdk/android/oss/common/LogLevel;

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lcom/alibaba/sdk/android/oss/common/LogPrinter;->log(Lcom/alibaba/sdk/android/oss/common/LogLevel;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/alibaba/sdk/android/oss/common/OSSLog;->log2Local(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static setLogPrinter(Lcom/alibaba/sdk/android/oss/common/LogPrinter;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->nopLogPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 4
    .line 5
    sput-object p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput-object p0, Lcom/alibaba/sdk/android/oss/common/OSSLog;->logPrinter:Lcom/alibaba/sdk/android/oss/common/LogPrinter;

    .line 9
    .line 10
    return-void
.end method
