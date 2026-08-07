.class public Lcom/bytedance/realx/base/RXLogging;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/base/RXLogging$TraceLevel;,
        Lcom/bytedance/realx/base/RXLogging$Severity;
    }
.end annotation


# static fields
.field private static loggableSeverity:Lcom/bytedance/realx/base/RXLogging$Severity; = null

.field private static volatile loggingEnabled:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_DEBUG:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 21
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_ERROR:Lcom/bytedance/realx/base/RXLogging$Severity;

    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_ERROR:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p2}, Lcom/bytedance/realx/base/RXLogging;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static enableLogThreads()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/RXLogging;->nativeEnableLogThreads()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static enableLogTimeStamps()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/RXLogging;->nativeEnableLogTimeStamps()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized enableLogToDebugOutput(Lcom/bytedance/realx/base/RXLogging$Severity;)V
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/base/RXLogging;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    invoke-static {p0}, Lcom/bytedance/realx/base/RXLogging;->nativeEnableLogToDebugOutput(I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    sput-boolean p0, Lcom/bytedance/realx/base/RXLogging;->loggingEnabled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p0
.end method

.method private static getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Ljava/io/StringWriter;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/io/PrintWriter;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_INFO:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Lcom/bytedance/realx/base/RXLogging;->loggingEnabled:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0, p1, p2}, Lcom/bytedance/realx/base/RXLogging;->nativeLog(ILjava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    const-string p0, "Logging tag or message may not be null."

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private static native nativeEnableLogThreads()V
.end method

.method private static native nativeEnableLogTimeStamps()V
.end method

.method private static native nativeEnableLogToDebugOutput(I)V
.end method

.method private static native nativeLog(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public static t(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_TRACE:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 21
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_WARNING:Lcom/bytedance/realx/base/RXLogging$Severity;

    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_WARNING:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p2}, Lcom/bytedance/realx/base/RXLogging;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p0, p1}, Lcom/bytedance/realx/base/RXLogging;->log(Lcom/bytedance/realx/base/RXLogging$Severity;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
