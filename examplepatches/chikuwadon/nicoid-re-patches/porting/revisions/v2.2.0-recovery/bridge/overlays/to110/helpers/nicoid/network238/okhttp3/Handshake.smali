.class public final Lnicoid/network238/okhttp3/Handshake;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Handshake$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0018\u0000 \'2\u00020\u0001:\u0001\'B;\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\u0012\u0010\t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00070\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u0013J\r\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u0014J\u0013\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u0007\u00a2\u0006\u0002\u0008\u0015J\u000f\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0007\u00a2\u0006\u0002\u0008\u0019J\u0013\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u0007\u00a2\u0006\u0002\u0008\u001aJ\u000f\u0010\u001b\u001a\u0004\u0018\u00010\u0017H\u0007\u00a2\u0006\u0002\u0008\u001cJ\u0013\u0010\u001d\u001a\u00020\u001e2\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010 \u001a\u00020!H\u0016J\u0008\u0010\"\u001a\u00020#H\u0016R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\rR\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u000eR\u0019\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00078\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u000fR!\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00078GX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0010\u0010\u000fR\u0013\u0010\u0016\u001a\u0004\u0018\u00010\u00178G\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0018R\u0013\u0010\u001b\u001a\u0004\u0018\u00010\u00178G\u00a2\u0006\u0006\u001a\u0004\u0008\u001b\u0010\u0018R\u0018\u0010$\u001a\u00020#*\u00020\u00088BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008%\u0010&\u00a8\u0006("
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Handshake;",
        "",
        "tlsVersion",
        "Lnicoid/network238/okhttp3/TlsVersion;",
        "cipherSuite",
        "Lnicoid/network238/okhttp3/CipherSuite;",
        "localCertificates",
        "",
        "Ljava/security/cert/Certificate;",
        "peerCertificatesFn",
        "Lnicoid/network238/kotlin/Function0;",
        "<init>",
        "(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Lnicoid/network238/kotlin/jvm/functions/Function0;)V",
        "()Lnicoid/network238/okhttp3/TlsVersion;",
        "()Lnicoid/network238/okhttp3/CipherSuite;",
        "()Ljava/util/List;",
        "peerCertificates",
        "peerCertificates$delegate",
        "Lnicoid/network238/kotlin/Lazy;",
        "-deprecated_tlsVersion",
        "-deprecated_cipherSuite",
        "-deprecated_peerCertificates",
        "peerPrincipal",
        "Ljava/security/Principal;",
        "()Ljava/security/Principal;",
        "-deprecated_peerPrincipal",
        "-deprecated_localCertificates",
        "localPrincipal",
        "-deprecated_localPrincipal",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "name",
        "getName",
        "(Ljava/security/cert/Certificate;)Ljava/lang/String;",
        "Companion",
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
.field public static final Companion:Lnicoid/network238/okhttp3/Handshake$Companion;


# instance fields
.field private final cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

.field private final localCertificates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final peerCertificates$delegate:Lnicoid/network238/kotlin/Lazy;

.field private final tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/Handshake$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/Handshake$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/Handshake;->Companion:Lnicoid/network238/okhttp3/Handshake$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Lnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/TlsVersion;",
            "Lnicoid/network238/okhttp3/CipherSuite;",
            "Ljava/util/List<",
            "+",
            "Ljava/security/cert/Certificate;",
            ">;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    .line 40
    iput-object p2, p0, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    .line 42
    iput-object p3, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    .line 48
    new-instance p1, Lnicoid/network238/okhttp3/Handshake$0;

    invoke-direct {p1, p4}, Lnicoid/network238/okhttp3/Handshake$0;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    invoke-static {p1}, Lnicoid/network238/kotlin/LazyKt;->lazy(Lnicoid/network238/kotlin/jvm/functions/Function0;)Lnicoid/network238/kotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Handshake;->peerCertificates$delegate:Lnicoid/network238/kotlin/Lazy;

    return-void
.end method

.method public static final get(Ljavax/net/ssl/SSLSession;)Lnicoid/network238/okhttp3/Handshake;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lnicoid/network238/okhttp3/Handshake;->Companion:Lnicoid/network238/okhttp3/Handshake$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Handshake$Companion;->get(Ljavax/net/ssl/SSLSession;)Lnicoid/network238/okhttp3/Handshake;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/Handshake;
    .registers 5
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

    sget-object v0, Lnicoid/network238/okhttp3/Handshake;->Companion:Lnicoid/network238/okhttp3/Handshake$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/Handshake$Companion;->get(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/Handshake;

    move-result-object p0

    return-object p0
.end method

.method private final getName(Ljava/security/cert/Certificate;)Ljava/lang/String;
    .registers 3

    .line 142
    instance-of v0, p1, Ljava/security/cert/X509Certificate;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/security/cert/X509Certificate;

    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 143
    :cond_0
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getType()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1
.end method

.method static final peerCertificates_delegate$lambda$0(Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/util/List;
    .registers 1

    .line 50
    :try_start_0
    invoke-interface {p0}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 52
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_cipherSuite()Lnicoid/network238/okhttp3/CipherSuite;
    .registers 2

    .line 70
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    return-object v0
.end method

.method public final -deprecated_localCertificates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    return-object v0
.end method

.method public final -deprecated_localPrincipal()Ljava/security/Principal;
    .registers 2

    .line 112
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->localPrincipal()Ljava/security/Principal;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_peerCertificates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_peerPrincipal()Ljava/security/Principal;
    .registers 2

    .line 91
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerPrincipal()Ljava/security/Principal;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_tlsVersion()Lnicoid/network238/okhttp3/TlsVersion;
    .registers 2

    .line 62
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    return-object v0
.end method

.method public final cipherSuite()Lnicoid/network238/okhttp3/CipherSuite;
    .registers 2

    .line 40
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 115
    instance-of v0, p1, Lnicoid/network238/okhttp3/Handshake;

    if-eqz v0, :cond_0

    .line 116
    check-cast p1, Lnicoid/network238/okhttp3/Handshake;

    iget-object v0, p1, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    if-ne v0, v1, :cond_0

    .line 117
    iget-object v0, p1, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    iget-object p1, p1, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .registers 3

    .line 123
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    .line 124
    iget-object v1, p0, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 125
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 126
    iget-object v1, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final localCertificates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    return-object v0
.end method

.method public final localPrincipal()Ljava/security/Principal;
    .registers 4

    .line 104
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/security/cert/X509Certificate;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Ljava/security/cert/X509Certificate;

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v2
.end method

.method public final peerCertificates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->peerCertificates$delegate:Lnicoid/network238/kotlin/Lazy;

    invoke-interface {v0}, Lnicoid/network238/kotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public final peerPrincipal()Ljava/security/Principal;
    .registers 4

    .line 83
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/security/cert/X509Certificate;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Ljava/security/cert/X509Certificate;

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v2
.end method

.method public final tlsVersion()Lnicoid/network238/okhttp3/TlsVersion;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 131
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v0

    .line 204
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 205
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 206
    check-cast v3, Ljava/security/cert/Certificate;

    .line 131
    invoke-direct {p0, v3}, Lnicoid/network238/okhttp3/Handshake;->getName(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v3

    .line 206
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 131
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Handshake{tlsVersion="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    iget-object v3, p0, Lnicoid/network238/okhttp3/Handshake;->tlsVersion:Lnicoid/network238/okhttp3/TlsVersion;

    .line 132
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " cipherSuite="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 134
    iget-object v3, p0, Lnicoid/network238/okhttp3/Handshake;->cipherSuite:Lnicoid/network238/okhttp3/CipherSuite;

    .line 132
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " peerCertificates="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " localCertificates="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 136
    iget-object v1, p0, Lnicoid/network238/okhttp3/Handshake;->localCertificates:Ljava/util/List;

    .line 208
    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 209
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 210
    check-cast v2, Ljava/security/cert/Certificate;

    .line 136
    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/Handshake;->getName(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v2

    .line 210
    invoke-interface {v3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 132
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
