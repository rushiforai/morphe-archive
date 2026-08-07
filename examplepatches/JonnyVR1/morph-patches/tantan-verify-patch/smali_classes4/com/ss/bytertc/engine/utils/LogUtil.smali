.class public Lcom/ss/bytertc/engine/utils/LogUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;,
        Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;
    }
.end annotation


# static fields
.field private static final DEBUG_LEVEL:Ljava/lang/String; = "DEBUG"

.field public static final DIR_TAIL:Ljava/lang/String; = "logs"

.field private static final ERROR_LEVEL:Ljava/lang/String; = "ERROR"

.field private static final INFO_LEVEL:Ljava/lang/String; = "INFO"

.field private static final LOG_TAG:Ljava/lang/String; = "ByteRTC"

.field private static final WARN_LEVEL:Ljava/lang/String; = "WARNING"

.field private static sDeviceID:Ljava/lang/String;

.field private static sLogDir:Ljava/lang/String;

.field private static sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

.field private static sLoggerSink:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLoggerSink:Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sDeviceID:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_INFO:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 12
    .line 13
    sput-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 14
    .line 15
    sput-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogDir:Ljava/lang/String;

    .line 16
    .line 17
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
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_DEBUG:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 2
    .line 3
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ltz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "[msg:%s]"

    .line 12
    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v1, "ByteRTC"

    .line 22
    .line 23
    filled-new-array {v1, p0, p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "[%s:%s]:%s"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-static {v0, p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_ERROR:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 2
    .line 3
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ltz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "[msg:%s]"

    .line 12
    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v1, "ByteRTC"

    .line 22
    .line 23
    filled-new-array {v1, p0, p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "[%s:%s]:%s"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-static {v0, p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 38
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_ERROR:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 39
    const-string v1, "[msg:%s]"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 40
    const-string v1, "ByteRTC"

    filled-new-array {v1, p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "[%s:%s]:%s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public static getDeviceID()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sDeviceID:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getLogDir(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogDir:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, "RTCEngine"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, "Log"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p0, "logs"

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sput-object p0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogDir:Ljava/lang/String;

    .line 50
    .line 51
    return-object p0
.end method

.method public static getLogLevel()Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 2
    .line 3
    return-object v0
.end method

.method private static getLoggerSink()Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLoggerSink:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;

    .line 8
    .line 9
    return-object v0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_INFO:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 2
    .line 3
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ltz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "[msg:%s]"

    .line 12
    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v1, "ByteRTC"

    .line 22
    .line 23
    filled-new-array {v1, p0, p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "[%s:%s]:%s"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-static {v0, p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method private static notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLoggerSink:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/ss/bytertc/engine/utils/LogUtil;->getLoggerSink()Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;->onLoggerMessage(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setDebug(Z)V
    .locals 0

    return-void
.end method

.method public static setDeviceID(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/ss/bytertc/engine/utils/LogUtil;->sDeviceID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setLogDir(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p0, "logs"

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sput-object p0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogDir:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public static setLogLevel(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 2
    .line 3
    return-void
.end method

.method public static setLoggerSink(Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLoggerSink:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/utils/LogUtil;->sLoggerSink:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    invoke-static {}, Lcom/ss/bytertc/engine/utils/LogUtil;->getLoggerSink()Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {p0, v0, v1}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_WARNING:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 2
    .line 3
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ltz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "[msg:%s]"

    .line 12
    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v1, "ByteRTC"

    .line 22
    .line 23
    filled-new-array {v1, p0, p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "[%s:%s]:%s"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-static {v0, p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 38
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;->LOG_LEVEL_WARNING:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    sget-object v1, Lcom/ss/bytertc/engine/utils/LogUtil;->sLogLevel:Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 39
    const-string v1, "[msg:%s]"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 40
    const-string v1, "ByteRTC"

    filled-new-array {v1, p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "[%s:%s]:%s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->notifyLoggerSinks(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
