.class public final Lnicoid/network238/okhttp3/internal/connection/RetryTlsHandshakeKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\u0014\u0010\u0000\u001a\u00020\u00012\n\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004H\u0000\u001a\u0012\u0010\u0005\u001a\u00020\u00012\n\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004\u00a8\u0006\u0006"
    }
    d2 = {
        "attemptAnotherConnection",
        "",
        "e",
        "Ljava/io/IOException;",
        "Lnicoid/network238/okio/IOException;",
        "attemptAnotherConnectionSpec",
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


# direct methods
.method public static final attemptAnotherConnection(Ljava/io/IOException;)Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    instance-of p0, p0, Lnicoid/network238/okhttp3/internal/ech/EchUntrustedException;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final attemptAnotherConnectionSpec(Ljava/io/IOException;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    instance-of v0, p0, Ljava/net/ProtocolException;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 42
    :cond_0
    instance-of v0, p0, Ljava/io/InterruptedIOException;

    if-eqz v0, :cond_1

    goto :goto_0

    .line 45
    :cond_1
    instance-of v0, p0, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/security/cert/CertificateException;

    if-eqz v0, :cond_2

    goto :goto_0

    .line 48
    :cond_2
    instance-of v0, p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-eqz v0, :cond_3

    goto :goto_0

    .line 51
    :cond_3
    instance-of p0, p0, Ljavax/net/ssl/SSLException;

    if-eqz p0, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_0
    const/4 p0, 0x0

    return p0
.end method
