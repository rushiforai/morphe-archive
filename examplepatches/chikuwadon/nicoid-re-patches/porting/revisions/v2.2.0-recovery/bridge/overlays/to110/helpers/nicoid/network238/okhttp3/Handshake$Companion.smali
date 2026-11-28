.class public final Lnicoid/network238/okhttp3/Handshake$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Handshake;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0011\u0010\u0004\u001a\u00020\u0005*\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008\u0007J\u0015\u0010\u0007\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008\tJ4\u0010\u0007\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000fH\u0007\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Handshake$Companion;",
        "",
        "<init>",
        "()V",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
        "Ljavax/net/ssl/SSLSession;",
        "get",
        "sslSession",
        "-deprecated_get",
        "tlsVersion",
        "Lnicoid/network238/okhttp3/TlsVersion;",
        "cipherSuite",
        "Lnicoid/network238/okhttp3/CipherSuite;",
        "peerCertificates",
        "",
        "Ljava/security/cert/Certificate;",
        "localCertificates",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Handshake$Companion;-><init>()V

    return-void
.end method

.method static final get$lambda$0(Ljava/util/List;)Ljava/util/List;
    .registers 1

    return-object p0
.end method

.method static final handshake$lambda$2(Ljava/util/List;)Ljava/util/List;
    .registers 1

    return-object p0
.end method


# virtual methods
.method public final -deprecated_get(Ljavax/net/ssl/SSLSession;)Lnicoid/network238/okhttp3/Handshake;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 187
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Handshake$Companion;->get(Ljavax/net/ssl/SSLSession;)Lnicoid/network238/okhttp3/Handshake;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljavax/net/ssl/SSLSession;)Lnicoid/network238/okhttp3/Handshake;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    invoke-interface {p1}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 153
    const-string v1, "TLS_NULL_WITH_NULL_NULL"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "SSL_NULL_WITH_NULL_NULL"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 158
    sget-object v1, Lnicoid/network238/okhttp3/CipherSuite;->Companion:Lnicoid/network238/okhttp3/CipherSuite$Companion;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/CipherSuite$Companion;->forJavaName(Ljava/lang/String;)Lnicoid/network238/okhttp3/CipherSuite;

    move-result-object v0

    .line 162
    invoke-interface {p1}, Ljavax/net/ssl/SSLSession;->getProtocol()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 163
    const-string v2, "NONE"

    invoke-static {v2, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 164
    sget-object v2, Lnicoid/network238/okhttp3/TlsVersion;->Companion:Lnicoid/network238/okhttp3/TlsVersion$Companion;

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/TlsVersion$Companion;->forJavaName(Ljava/lang/String;)Lnicoid/network238/okhttp3/TlsVersion;

    move-result-object v1

    .line 168
    :try_start_0
    invoke-interface {p1}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 170
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 173
    :goto_0
    new-instance v3, Lnicoid/network238/okhttp3/Handshake;

    .line 176
    invoke-interface {p1}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 177
    new-instance v4, Lnicoid/network238/okhttp3/Handshake$Companion$1;

    invoke-direct {v4, v2}, Lnicoid/network238/okhttp3/Handshake$Companion$1;-><init>(Ljava/util/List;)V

    .line 173
    invoke-direct {v3, v1, v0, p1, v4}, Lnicoid/network238/okhttp3/Handshake;-><init>(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    return-object v3

    .line 163
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "tlsVersion == NONE"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "tlsVersion == null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 154
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string v1, "cipherSuite == "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 152
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "cipherSuite == null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final get(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/Handshake;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/TlsVersion;",
            "Lnicoid/network238/okhttp3/CipherSuite;",
            "Ljava/util/List<",
            "+",
            "Ljava/security/cert/Certificate;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Ljava/security/cert/Certificate;",
            ">;)",
            "Lnicoid/network238/okhttp3/Handshake;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 196
    invoke-static {p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    .line 197
    new-instance v0, Lnicoid/network238/okhttp3/Handshake;

    invoke-static {p4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p4

    new-instance v1, Lnicoid/network238/okhttp3/Handshake$Companion$0;

    invoke-direct {v1, p3}, Lnicoid/network238/okhttp3/Handshake$Companion$0;-><init>(Ljava/util/List;)V

    invoke-direct {v0, p1, p2, p4, v1}, Lnicoid/network238/okhttp3/Handshake;-><init>(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    return-object v0
.end method
