.class public final Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0003\n\u0002\u0008\u0007\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J1\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0010\u001a\u00020\u000b2\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0000\u00a2\u0006\u0002\u0008\u0013J\u0010\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000bH\u0002J\u0006\u0010\u0015\u001a\u00020\rJ\u0018\u0010\u0016\u001a\u00020\r2\u0006\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000bH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;",
        "",
        "<init>",
        "()V",
        "MAX_LOG_LENGTH",
        "",
        "configuredLoggers",
        "Ljava/util/concurrent/CopyOnWriteArraySet;",
        "Ljava/util/logging/Logger;",
        "knownLoggers",
        "",
        "",
        "androidLog",
        "",
        "loggerName",
        "logLevel",
        "message",
        "t",
        "",
        "androidLog$okhttp",
        "loggerTag",
        "enable",
        "enableLogging",
        "logger",
        "tag",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;

.field private static final MAX_LOG_LENGTH:I = 0xfa0

.field private static final configuredLoggers:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Ljava/util/logging/Logger;",
            ">;"
        }
    .end annotation
.end field

.field private static final knownLoggers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;

    .line 55
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->configuredLoggers:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 58
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 60
    const-class v1, Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    .line 63
    const-string v3, "OkHttp"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "okhttp.OkHttpClient"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-class v1, Lnicoid/network238/okhttp3/internal/http2/Http2;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "okhttp.Http2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-class v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "okhttp.TaskRunner"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    const-string v1, "nicoid.network238.okhttp3.mockwebserver.MockWebServer"

    const-string v2, "okhttp.MockWebServer"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/MapsKt;->toMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->knownLoggers:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic androidLog$okhttp$default(Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    .registers 7

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    const/4 p4, 0x0

    .line 72
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->androidLog$okhttp(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private final enableLogging(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 126
    invoke-static {p1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object p1

    .line 127
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->configuredLoggers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 128
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->setUseParentHandlers(Z)V

    .line 132
    const/4 v0, 0x3

    invoke-static {p2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    goto :goto_0

    .line 133
    :cond_0
    const/4 v0, 0x4

    invoke-static {p2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_1

    sget-object p2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    goto :goto_0

    .line 134
    :cond_1
    sget-object p2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 130
    :goto_0
    invoke-virtual {p1, p2}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 136
    sget-object p2, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLogHandler;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/android/AndroidLogHandler;

    invoke-virtual {p1, p2}, Ljava/util/logging/Logger;->addHandler(Ljava/util/logging/Handler;)V

    :cond_2
    return-void
.end method

.method private final loggerTag(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 103
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->knownLoggers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    const/16 v0, 0x17

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/text/StringsKt;->take(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method


# virtual methods
.method public final androidLog$okhttp(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->loggerTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 80
    invoke-static {p1, p2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p4, :cond_0

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const/16 v0, 0xa

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-static {p4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    move-object v0, p3

    goto :goto_0

    .line 80
    :cond_0
    move-object v0, p3

    .line 82
    :goto_0
    nop

    .line 86
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p3

    const/4 p4, 0x0

    move v2, p4

    :goto_1
    if-ge v2, p3, :cond_3

    .line 88
    const/16 v1, 0xa

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result p4

    const/4 v1, -0x1

    if-ne p4, v1, :cond_1

    move p4, p3

    :cond_1
    :goto_2
    add-int/lit16 v1, v2, 0xfa0

    .line 91
    invoke-static {p4, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 92
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, p1, v2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    if-lt v1, p4, :cond_2

    add-int/lit8 v2, v1, 0x1

    goto :goto_1

    :cond_2
    move v2, v1

    goto :goto_2

    :cond_3
    return-void
.end method

.method public final enable()V
    .registers 5

    .line 108
    const-string v0, "Possibly running android unit test without robolectric"

    :try_start_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->knownLoggers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 109
    invoke-direct {p0, v3, v2}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->enableLogging(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 117
    :catch_0
    move-exception v1

    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 118
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 113
    :catch_1
    move-exception v1

    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 114
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    :goto_1
    return-void
.end method
