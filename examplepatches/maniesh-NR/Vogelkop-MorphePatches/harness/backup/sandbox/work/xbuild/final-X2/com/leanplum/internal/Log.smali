.class public Lcom/leanplum/internal/Log;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/Log$Level;,
        Lcom/leanplum/internal/Log$LogType;
    }
.end annotation


# static fields
.field private static final LOGGER_MAX_LEN:I = 0xfa0

.field private static level:I = 0x2


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Lcom/leanplum/internal/Log$LogType;->DEBUG:Lcom/leanplum/internal/Log$LogType;

    invoke-static {v0, p0, p1}, Lcom/leanplum/internal/Log;->log(Lcom/leanplum/internal/Log$LogType;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    if-eqz p0, :cond_18

    const-string v0, "%s"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_18

    sget-object v0, Lcom/leanplum/internal/Log$LogType;->ERROR:Lcom/leanplum/internal/Log$LogType;

    invoke-static {p1}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p0, p1}, Lcom/leanplum/internal/Log;->log(Lcom/leanplum/internal/Log$LogType;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_18
    sget-object v0, Lcom/leanplum/internal/Log$LogType;->ERROR:Lcom/leanplum/internal/Log$LogType;

    const-string v1, "\n"

    invoke-static {p0, v1}, Lu35;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p1}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {v0, p0, p1}, Lcom/leanplum/internal/Log;->log(Lcom/leanplum/internal/Log$LogType;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3

    .line 50
    sget-object v0, Lcom/leanplum/internal/Log$LogType;->ERROR:Lcom/leanplum/internal/Log$LogType;

    invoke-static {v0, p0, p1}, Lcom/leanplum/internal/Log;->log(Lcom/leanplum/internal/Log$LogType;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static exception(Ljava/lang/Throwable;)V
    .registers 5

    invoke-static {}, Lcom/leanplum/monitoring/ExceptionHandler;->getInstance()Lcom/leanplum/monitoring/ExceptionHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/monitoring/ExceptionHandler;->reportException(Ljava/lang/Throwable;)V

    instance-of v0, p0, Ljava/lang/OutOfMemoryError;

    if-eqz v0, :cond_12

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-eqz v0, :cond_a5

    check-cast p0, Ljava/lang/OutOfMemoryError;

    throw p0

    :cond_12
    instance-of v0, p0, Lcom/leanplum/LeanplumException;

    if-eqz v0, :cond_1d

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-eqz v0, :cond_a5

    check-cast p0, Lcom/leanplum/LeanplumException;

    throw p0

    :cond_1d
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Internal error: %s"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_2a
    invoke-static {}, Lcom/leanplum/internal/Util;->getVersionName()Ljava/lang/String;

    move-result-object v0
    :try_end_2e
    .catchall {:try_start_2a .. :try_end_2e} :catchall_2f

    goto :goto_31

    :catchall_2f
    const-string v0, "(Unknown)"

    :goto_31
    :try_start_31
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_55

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_59

    :cond_55
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_59
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withLogAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    const-string v1, "type"

    const-string v3, "sdkLog"

    invoke-virtual {p0, v1, v3}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    const-string v1, "versionName"

    invoke-virtual {p0, v1, v0}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    const-string v0, "message"

    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V
    :try_end_96
    .catchall {:try_start_31 .. :try_end_96} :catchall_97

    goto :goto_a5

    :catchall_97
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "Unable to send error report: %s"

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_a5
    :goto_a5
    return-void
.end method

.method private static formatTag(Lcom/leanplum/internal/Log$LogType;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[Leanplum]["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static handleLogMessage(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    sget-boolean v0, Lcom/leanplum/internal/Constants;->loggingEnabled:Z

    if-eqz v0, :cond_30

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withLogAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    const-string v1, "type"

    const-string v2, "sdkLog"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "message"

    invoke-virtual {v0, p1, p0}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    :cond_30
    return-void
.end method

.method public static varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Lcom/leanplum/internal/Log$LogType;->INFO:Lcom/leanplum/internal/Log$LogType;

    invoke-static {v0, p0, p1}, Lcom/leanplum/internal/Log;->log(Lcom/leanplum/internal/Log$LogType;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private static largeLogD(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xfa0

    if-le v0, v1, :cond_13

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->largeLogD(Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    return-void
.end method

.method public static varargs log(Lcom/leanplum/internal/Log$LogType;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4

    :try_start_0
    invoke-static {p0}, Lcom/leanplum/internal/Log;->formatTag(Lcom/leanplum/internal/Log$LogType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/leanplum/internal/Log$1;->$SwitchMap$com$leanplum$internal$Log$LogType:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, p2, p0

    const/4 p2, 0x1

    if-eq p0, p2, :cond_20

    const/4 p2, 0x2

    if-eq p0, p2, :cond_20

    const/4 p2, 0x3

    if-ne p0, p2, :cond_20

    sget p0, Lcom/leanplum/internal/Log;->level:I

    if-lt p0, p2, :cond_20

    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->largeLogD(Ljava/lang/String;Ljava/lang/String;)V

    :cond_20
    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->handleLogMessage(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_23
    .catchall {:try_start_0 .. :try_end_23} :catchall_23

    :catchall_23
    return-void
.end method

.method public static setLogLevel(I)V
    .registers 1

    sput p0, Lcom/leanplum/internal/Log;->level:I

    return-void
.end method
