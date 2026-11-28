.class public final Lnicoid/network238/okhttp3/internal/_UtilJvmKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00c4\u0001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0010$\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0000\u001a\u0016\u0010\u0008\u001a\u00020\u0005*\u00020\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u0007H\u0000\u001a)\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u00052\u0012\u0010\u000c\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000e0\r\"\u00020\u000eH\u0000\u00a2\u0006\u0002\u0010\u000f\u001a\u0014\u0010\u0010\u001a\u00020\u0011*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0011H\u0000\u001a \u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0000\u001a\u001f\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u001aH\u0000\u00a2\u0006\u0004\u0008\u001b\u0010\u001c\u001a\u0012\u0010\u001d\u001a\u00020\u001e*\u0008\u0012\u0004\u0012\u00020 0\u001fH\u0000\u001a\u0012\u0010!\u001a\u0008\u0012\u0004\u0012\u00020 0\u001f*\u00020\u001eH\u0000\u001a\u0014\u0010\"\u001a\u00020\u0007*\u00020\t2\u0006\u0010#\u001a\u00020\tH\u0000\u001a\u000c\u0010$\u001a\u00020%*\u00020&H\u0000\u001a\u001c\u0010\'\u001a\u00020\u0007*\u00020(2\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0019H\u0000\u001a\u000c\u0010\'\u001a\u00020**\u00020\u0012H\u0000\u001a\u001c\u0010+\u001a\u00020\u0007*\u00020(2\u0006\u0010,\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0019H\u0000\u001a\u0014\u0010-\u001a\u00020\u0007*\u00020.2\u0006\u0010/\u001a\u00020\u0012H\u0000\u001a\"\u00100\u001a\u00020*2\u0006\u0010\u0004\u001a\u00020\u00052\u000c\u00101\u001a\u0008\u0012\u0004\u0012\u00020*02H\u0080\u0008\u00f8\u0001\u0000\u001a\u000c\u00103\u001a\u00020\u0017*\u000204H\u0000\u001a\u001f\u00105\u001a\u0008\u0012\u0004\u0012\u0002H60\u001f\"\u0004\u0008\u0000\u00106*\u0008\u0012\u0004\u0012\u0002H60\u001fH\u0080\u0008\u001a\u001f\u00105\u001a\u0008\u0012\u0004\u0012\u0002H607\"\u0004\u0008\u0000\u00106*\u0008\u0012\u0004\u0012\u0002H607H\u0080\u0008\u001a1\u00105\u001a\u000e\u0012\u0004\u0012\u0002H9\u0012\u0004\u0012\u0002H:08\"\u0004\u0008\u0000\u00109\"\u0004\u0008\u0001\u0010:*\u000e\u0012\u0004\u0012\u0002H9\u0012\u0004\u0012\u0002H:08H\u0080\u0008\u001a\u001e\u0010;\u001a\u0008\u0012\u0004\u0012\u0002H60\u001f\"\u0004\u0008\u0000\u00106*\u0008\u0012\u0004\u0012\u0002H60\u001fH\u0000\u001a-\u0010<\u001a\u0008\u0012\u0004\u0012\u0002H60\u001f\"\u0004\u0008\u0000\u001062\u0012\u0010=\u001a\n\u0012\u0006\u0008\u0001\u0012\u0002H60\r\"\u0002H6H\u0001\u00a2\u0006\u0002\u0010>\u001a\'\u0010;\u001a\u0008\u0012\u0004\u0012\u0002H60\u001f\"\u0004\u0008\u0000\u00106*\u000c\u0012\u0006\u0008\u0001\u0012\u0002H6\u0018\u00010\rH\u0000\u00a2\u0006\u0002\u0010>\u001a\u000c\u0010?\u001a\u00020**\u00020.H\u0000\u001a\u000c\u0010?\u001a\u00020**\u00020@H\u0000\u001a\u000c\u0010A\u001a\u00020\u0005*\u00020\u0017H\u0000\u001a\u000c\u0010A\u001a\u00020\u0005*\u00020\u0015H\u0000\u001a3\u0010B\u001a\u0004\u0018\u0001H6\"\u0004\u0008\u0000\u001062\u0006\u0010C\u001a\u00020\u000e2\u000c\u0010D\u001a\u0008\u0012\u0004\u0012\u0002H60E2\u0006\u0010F\u001a\u00020\u0005H\u0000\u00a2\u0006\u0002\u0010G\u001a\u000c\u0010I\u001a\u00020**\u00020JH\u0000\u001a:\u0010L\u001a\u0002H6\"\u0004\u0008\u0000\u00106*\u0008\u0012\u0004\u0012\u0002H60M2\u0006\u0010N\u001a\u0002H62\u0012\u0010O\u001a\u000e\u0012\u0004\u0012\u0002H6\u0012\u0004\u0012\u00020\u00070PH\u0087\u0010\u00a2\u0006\u0002\u0010Q\"\u0010\u0010\u0000\u001a\u00020\u00018\u0000X\u0081\u0004\u00a2\u0006\u0002\n\u0000\"\u0010\u0010H\u001a\u00020\u00078\u0000X\u0081\u0004\u00a2\u0006\u0002\n\u0000\"\u0010\u0010K\u001a\u00020\u00058\u0000X\u0081\u0004\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006R"
    }
    d2 = {
        "UTC",
        "Ljava/util/TimeZone;",
        "threadFactory",
        "Ljava/util/concurrent/ThreadFactory;",
        "name",
        "",
        "daemon",
        "",
        "toHostHeader",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "includeDefaultPort",
        "format",
        "args",
        "",
        "",
        "(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;",
        "readBomAsCharset",
        "Ljava/nio/charset/Charset;",
        "Lnicoid/network238/okio/BufferedSource;",
        "default",
        "checkDuration",
        "",
        "duration",
        "",
        "unit",
        "Ljava/util/concurrent/TimeUnit;",
        "Lnicoid/network238/kotlin/time/Duration;",
        "checkDuration-HG0u8IE",
        "(Ljava/lang/String;J)I",
        "toHeaders",
        "Lnicoid/network238/okhttp3/Headers;",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "toHeaderList",
        "canReuseConnectionFor",
        "other",
        "asFactory",
        "Lnicoid/network238/okhttp3/EventListener$Factory;",
        "Lnicoid/network238/okhttp3/EventListener;",
        "skipAll",
        "Lnicoid/network238/okio/Source;",
        "timeUnit",
        "",
        "discard",
        "timeout",
        "isHealthy",
        "Ljava/net/Socket;",
        "source",
        "threadName",
        "block",
        "Lnicoid/network238/kotlin/Function0;",
        "headersContentLength",
        "Lnicoid/network238/okhttp3/Response;",
        "unmodifiable",
        "T",
        "",
        "",
        "K",
        "V",
        "toImmutableList",
        "immutableListOf",
        "elements",
        "([Ljava/lang/Object;)Ljava/util/List;",
        "closeQuietly",
        "Ljava/net/ServerSocket;",
        "toHexString",
        "readFieldOrNull",
        "instance",
        "fieldType",
        "Ljava/lang/Class;",
        "fieldName",
        "(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;",
        "assertionsEnabled",
        "assertLockNotHeld",
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "okHttpName",
        "testAndSet",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "newValue",
        "condition",
        "Lnicoid/network238/kotlin/Function1;",
        "(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final UTC:Ljava/util/TimeZone;

.field public static final assertionsEnabled:Z

.field public static final okHttpName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 52
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->UTC:Ljava/util/TimeZone;

    .line 344
    const-class v0, Lnicoid/network238/okhttp3/OkHttpClient;

    const/4 v0, 0x0

    sput-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    .line 361
    const-class v0, Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 362
    const-string v1, "nicoid.network238.okhttp3."

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 363
    const-string v1, "Client"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->removeSuffix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    return-void
.end method

.method public static final asFactory(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/EventListener$Factory;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    new-instance v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$0;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$0;-><init>(Lnicoid/network238/okhttp3/EventListener;)V

    return-object v0
.end method

.method static final asFactory$lambda$0(Lnicoid/network238/okhttp3/EventListener;Lnicoid/network238/okhttp3/Call;)Lnicoid/network238/okhttp3/EventListener;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final assertLockNotHeld(Lnicoid/network238/okhttp3/Dispatcher;)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 348
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST NOT hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    return-void
.end method

.method public static final canReuseConnectionFor(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 146
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    .line 112
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    const-wide/32 v3, 0x7fffffff

    cmp-long p3, p1, v3

    if-gtz p3, :cond_1

    cmp-long p3, p1, v0

    if-nez p3, :cond_0

    if-lez v2, :cond_0

    .line 114
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " too small"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    long-to-int p0, p1

    return p0

    .line 113
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " too large"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 111
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " < 0"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final checkDuration-HG0u8IE(Ljava/lang/String;J)I
    .registers 7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/Duration;->isNegative-impl(J)Z

    move-result v0

    if-nez v0, :cond_2

    .line 123
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/Duration;->getInWholeMilliseconds-impl(J)J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 125
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/Duration;->isPositive-impl(J)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " too small"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    long-to-int p0, v0

    return p0

    .line 124
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " too large"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 122
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " < 0"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final closeQuietly(Ljava/net/ServerSocket;)V
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 304
    :try_start_0
    invoke-virtual {p0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void

    .line 306
    :catch_1
    move-exception p0

    throw p0
.end method

.method public static final closeQuietly(Ljava/net/Socket;)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 287
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void

    :catch_1
    move-exception p0

    .line 291
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "bio == null"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 296
    :cond_0
    throw p0

    .line 289
    :catch_2
    move-exception p0

    throw p0
.end method

.method public static final discard(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 201
    :try_start_0
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->skipAll(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method public static final varargs format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    array-length v1, p1

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    array-length v1, p1

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final headersContentLength(Lnicoid/network238/okhttp3/Response;)J
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 245
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p0

    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-wide/16 v0, -0x1

    if-eqz p0, :cond_0

    invoke-static {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toLongOrDefault(Ljava/lang/String;J)J

    move-result-wide v0

    :cond_0
    return-wide v0
.end method

.method public static final varargs immutableListOf([Ljava/lang/Object;)Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final isHealthy(Ljava/net/Socket;Lnicoid/network238/okio/BufferedSource;)Z
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 217
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->getSoTimeout()I

    move-result v1
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    :try_start_1
    invoke-virtual {p0, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 220
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    xor-int/2addr p1, v0

    .line 222
    :try_start_2
    invoke-virtual {p0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    return p1

    :catchall_0
    move-exception p1

    invoke-virtual {p0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    throw p1
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p0

    const/4 v0, 0x0

    goto :goto_0

    :catch_1
    move-exception p0

    :goto_0
    return v0
.end method

.method public static final readBomAsCharset(Lnicoid/network238/okio/BufferedSource;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    invoke-static {}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->getUNICODE_BOMS()Lnicoid/network238/okio/Options;

    move-result-object v0

    invoke-interface {p0, v0}, Lnicoid/network238/okio/BufferedSource;->select(Lnicoid/network238/okio/Options;)I

    move-result p0

    packed-switch p0, :pswitch_data_0

    .line 103
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 99
    :pswitch_0
    sget-object p0, Lnicoid/network238/kotlin/text/Charsets;->INSTANCE:Lnicoid/network238/kotlin/text/Charsets;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/text/Charsets;->UTF32_BE()Ljava/nio/charset/Charset;

    move-result-object p0

    return-object p0

    .line 97
    :pswitch_1
    sget-object p0, Lnicoid/network238/kotlin/text/Charsets;->UTF_16LE:Ljava/nio/charset/Charset;

    return-object p0

    .line 95
    :pswitch_2
    sget-object p0, Lnicoid/network238/kotlin/text/Charsets;->INSTANCE:Lnicoid/network238/kotlin/text/Charsets;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/text/Charsets;->UTF32_LE()Ljava/nio/charset/Charset;

    move-result-object p0

    return-object p0

    .line 93
    :pswitch_3
    sget-object p0, Lnicoid/network238/kotlin/text/Charsets;->UTF_16BE:Ljava/nio/charset/Charset;

    return-object p0

    .line 91
    :pswitch_4
    sget-object p0, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    return-object p0

    :pswitch_5
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 320
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 321
    :goto_0
    const-class v1, Ljava/lang/Object;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 323
    :try_start_0
    invoke-virtual {v0, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 324
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 325
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 326
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v3

    :catch_0
    move-exception v1

    .line 330
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 335
    :cond_1
    const-string v0, "delegate"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 336
    invoke-static {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 337
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v3
.end method

.method public static final skipAll(Lnicoid/network238/okio/BufferedSource;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    :goto_0
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 187
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-interface {p0, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static final skipAll(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 161
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v2

    const-wide v3, 0x7fffffffffffffffL

    if-eqz v2, :cond_0

    .line 162
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    sub-long/2addr v5, v0

    goto :goto_0

    :cond_0
    move-wide v5, v3

    .line 166
    :goto_0
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v2

    int-to-long v7, p1

    invoke-virtual {p2, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    invoke-static {v5, v6, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    add-long/2addr p1, v0

    invoke-virtual {v2, p1, p2}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 168
    :try_start_0
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    :goto_1
    nop

    .line 169
    const-wide/16 v7, 0x2000

    invoke-interface {p0, p1, v7, v8}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v7

    const-wide/16 v9, -0x1

    cmp-long p2, v7, v9

    if-eqz p2, :cond_1

    .line 170
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->clear()V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_1
    cmp-long p1, v5, v3

    const/4 p2, 0x1

    if-nez p1, :cond_2

    .line 177
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    return p2

    .line 179
    :cond_2
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p0

    add-long/2addr v0, v5

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    return p2

    :catchall_0
    move-exception p1

    cmp-long p2, v5, v3

    if-nez p2, :cond_3

    .line 177
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    goto :goto_2

    .line 179
    :cond_3
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p0

    add-long/2addr v0, v5

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :goto_2
    throw p1

    :catch_0
    move-exception p1

    cmp-long p1, v5, v3

    if-nez p1, :cond_4

    .line 177
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    goto :goto_3

    .line 179
    :cond_4
    invoke-interface {p0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p0

    add-long/2addr v0, v5

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :goto_3
    const/4 p0, 0x0

    return p0
.end method

.method public static final testAndSet(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "TT;>;TT;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 378
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 379
    invoke-interface {p2, v0}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 380
    :cond_1
    invoke-static {p0, v0, p1}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return-object v0
.end method

.method public static final threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    new-instance v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method static final threadFactory$lambda$0(Ljava/lang/String;ZLjava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4

    .line 59
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method public static final threadName(Ljava/lang/String;Lnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 234
    .local v0, "$i$f$threadName":I
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 235
    .local v1, "currentThread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    .line 236
    .local v2, "oldName":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 237
    nop

    .line 238
    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 241
    nop

    .line 242
    return-void

    .line 240
    :catchall_0
    move-exception v3

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    throw v3
.end method

.method public static final toHeaderList(Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Headers;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    .line 385
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 386
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v2, v0

    check-cast v2, Lnicoid/network238/kotlin/collections/IntIterator;

    invoke-virtual {v2}, Lnicoid/network238/kotlin/collections/IntIterator;->nextInt()I

    move-result v2

    .line 139
    new-instance v3, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v2}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static final toHeaders(Ljava/util/List;)Lnicoid/network238/okhttp3/Headers;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)",
            "Lnicoid/network238/okhttp3/Headers;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 131
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Header;->component1()Lnicoid/network238/okio/ByteString;

    move-result-object v2

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Header;->component2()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    .line 132
    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    goto :goto_0

    .line 134
    :cond_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object p0

    return-object p0
.end method

.method public static final toHexString(I)Ljava/lang/String;
    .registers 1

    .line 313
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final toHexString(J)Ljava/lang/String;
    .registers 2

    .line 311
    invoke-static {p0, p1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final toHostHeader(Lnicoid/network238/okhttp3/HttpUrl;Z)Ljava/lang/String;
    .registers 7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const-string v3, ":"

    const/4 v4, 0x0

    invoke-static {v0, v3, v4, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-nez p1, :cond_1

    .line 71
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result p1

    sget-object v1, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->defaultPort(Ljava/lang/String;)I

    move-result v1

    if-ne p1, v1, :cond_1

    return-object v0

    .line 72
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic toHostHeader$default(Lnicoid/network238/okhttp3/HttpUrl;ZILjava/lang/Object;)Ljava/lang/String;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 64
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHostHeader(Lnicoid/network238/okhttp3/HttpUrl;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final toImmutableList(Ljava/util/List;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 263
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 265
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    .line 269
    :cond_1
    invoke-interface {p0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/ArraysKt;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    .line 389
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 269
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final toImmutableList([Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 279
    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 280
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    .line 281
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Object;

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/ArraysKt;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    .line 390
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    .line 279
    :cond_2
    :goto_0
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final unmodifiable(Ljava/util/List;)Ljava/util/List;
    .registers 4
    .param p0, "$this$unmodifiable"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 249
    .local v0, "$i$f$unmodifiable":I
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    const-string v2, "unmodifiableList(...)"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method

.method public static final unmodifiable(Ljava/util/Map;)Ljava/util/Map;
    .registers 4
    .param p0, "$this$unmodifiable"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;+TV;>;)",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 257
    .local v0, "$i$f$unmodifiable":I
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "unmodifiableMap(...)"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method

.method public static final unmodifiable(Ljava/util/Set;)Ljava/util/Set;
    .registers 4
    .param p0, "$this$unmodifiable"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "+TT;>;)",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 253
    .local v0, "$i$f$unmodifiable":I
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    const-string v2, "unmodifiableSet(...)"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method
