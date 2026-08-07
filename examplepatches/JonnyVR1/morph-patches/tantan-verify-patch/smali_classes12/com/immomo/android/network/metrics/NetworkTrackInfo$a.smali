.class public final Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/android/network/metrics/NetworkTrackInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\r\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;",
        "",
        "<init>",
        "()V",
        "Lokhttp3/Protocol;",
        "protocol",
        "",
        "d",
        "(Lokhttp3/Protocol;)Ljava/lang/String;",
        "",
        "throwable",
        "c",
        "(Ljava/lang/Throwable;)Ljava/lang/String;",
        "b",
        "",
        "e",
        "()Z",
        "sdk_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;-><init>()V

    return-void
.end method

.method public static final synthetic a(Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;Lokhttp3/Protocol;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;->d(Lokhttp3/Protocol;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final d(Lokhttp3/Protocol;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    sget-object p0, Ll/il20;->a:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    aget p0, p0, v0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    if-eq p0, v0, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    if-eq p0, p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x5

    .line 24
    if-eq p0, p1, :cond_0

    .line 25
    .line 26
    const-string p0, "unknown"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const-string p0, "http/2.0"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    invoke-virtual {p1}, Lokhttp3/Protocol;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const-string p0, "-"

    .line 38
    .line 39
    return-object p0
.end method


# virtual methods
.method public final b(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_7

    .line 2
    .line 3
    instance-of p0, p1, Ljava/net/UnknownHostException;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "100000"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    instance-of p0, p1, Ljava/io/InterruptedIOException;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string p0, "102000"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    instance-of p0, p1, Ljava/net/ConnectException;

    .line 18
    .line 19
    const-string v0, "101000"

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_2
    instance-of p0, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 25
    .line 26
    const-string v1, "105000"

    .line 27
    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_3
    instance-of p0, p1, Ljavax/net/ssl/SSLException;

    .line 32
    .line 33
    if-eqz p0, :cond_4

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_4
    instance-of p0, p1, Lcom/immomo/android/network/metrics/ActiveCancelException;

    .line 37
    .line 38
    if-eqz p0, :cond_5

    .line 39
    .line 40
    const-string p0, "109000"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_5
    instance-of p0, p1, Ljava/io/IOException;

    .line 44
    .line 45
    if-eqz p0, :cond_6

    .line 46
    .line 47
    const-string p0, "104000"

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_6
    return-object v0

    .line 51
    :cond_7
    const-string p0, "0"

    .line 52
    .line 53
    return-object p0
.end method

.method public final c(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    instance-of p0, p1, Lokhttp3/internal/http2/StreamResetException;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "StreamResetException"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    instance-of p0, p1, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string p0, "ConnectionShutdownException"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method

.method public final e()Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    const-string v0, "http.proxyHost"

    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "http.proxyPort"

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v1, "-1"

    .line 18
    .line 19
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const/4 v0, -0x1

    .line 30
    if-eq v1, v0, :cond_1

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    :catch_0
    :cond_1
    return p0
.end method
