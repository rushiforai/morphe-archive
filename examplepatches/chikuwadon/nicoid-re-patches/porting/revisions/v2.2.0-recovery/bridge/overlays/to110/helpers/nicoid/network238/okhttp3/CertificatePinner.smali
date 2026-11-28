.class public final Lnicoid/network238/okhttp3/CertificatePinner;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/CertificatePinner$Builder;,
        Lnicoid/network238/okhttp3/CertificatePinner$Companion;,
        Lnicoid/network238/okhttp3/CertificatePinner$Pin;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0018\u0000 $2\u00020\u0001:\u0003\"#$B#\u0008\u0000\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001c\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0012J)\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0012\u0010\u0014\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00160\u00120\u0015H\u0000\u00a2\u0006\u0002\u0008\u0017J)\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0012\u0010\u0011\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00130\u0018\"\u00020\u0013H\u0007\u00a2\u0006\u0002\u0010\u0019J\u0014\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00122\u0006\u0010\u000f\u001a\u00020\u0010J\u0015\u0010\u001b\u001a\u00020\u00002\u0006\u0010\u0005\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u001cJ\u0013\u0010\u001d\u001a\u00020\u001e2\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010 \u001a\u00020!H\u0016R\u0017\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006%"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "",
        "pins",
        "",
        "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
        "certificateChainCleaner",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "<init>",
        "(Ljava/util/Set;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V",
        "getPins",
        "()Ljava/util/Set;",
        "getCertificateChainCleaner$okhttp",
        "()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "check",
        "",
        "hostname",
        "",
        "peerCertificates",
        "",
        "Ljava/security/cert/Certificate;",
        "cleanedPeerCertificatesFn",
        "Lnicoid/network238/kotlin/Function0;",
        "Ljava/security/cert/X509Certificate;",
        "check$okhttp",
        "",
        "(Ljava/lang/String;[Ljava/security/cert/Certificate;)V",
        "findMatchingPins",
        "withCertificateChainCleaner",
        "withCertificateChainCleaner$okhttp",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "Pin",
        "Builder",
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
.field public static final Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

.field public static final DEFAULT:Lnicoid/network238/okhttp3/CertificatePinner;


# instance fields
.field private final certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

.field private final pins:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    .line 369
    new-instance v0, Lnicoid/network238/okhttp3/CertificatePinner$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/CertificatePinner$Builder;-><init>()V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CertificatePinner$Builder;->build()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/CertificatePinner;->DEFAULT:Lnicoid/network238/okhttp3/CertificatePinner;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
            ">;",
            "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iput-object p1, p0, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    .line 138
    iput-object p2, p0, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/Set;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 136
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/CertificatePinner;-><init>(Ljava/util/Set;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V

    return-void
.end method

.method static final check$lambda$0(Lnicoid/network238/okhttp3/CertificatePinner;Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .registers 3

    .line 153
    iget-object p0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;->clean(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_0

    move-object p1, p0

    .line 399
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    const/16 p2, 0xa

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result p2

    invoke-direct {p0, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 400
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    .line 401
    check-cast p2, Ljava/security/cert/Certificate;

    .line 154
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p2, Ljava/security/cert/X509Certificate;

    .line 401
    invoke-interface {p0, p2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static final pin(Ljava/security/cert/Certificate;)Ljava/lang/String;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final sha1Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha1Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final check(Ljava/lang/String;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    new-instance v0, Lnicoid/network238/okhttp3/CertificatePinner$0;

    invoke-direct {v0, p0, p2, p1}, Lnicoid/network238/okhttp3/CertificatePinner$0;-><init>(Lnicoid/network238/okhttp3/CertificatePinner;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okhttp3/CertificatePinner;->check$okhttp(Ljava/lang/String;Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public final varargs check(Ljava/lang/String;[Ljava/security/cert/Certificate;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    invoke-static {p2}, Lnicoid/network238/kotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/CertificatePinner;->check(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public final check$okhttp(Ljava/lang/String;Lnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/CertificatePinner;->findMatchingPins(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 162
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    invoke-interface {p2}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 166
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 171
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    move-object v5, v4

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnicoid/network238/okhttp3/CertificatePinner$Pin;

    .line 172
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->getHashAlgorithm()Ljava/lang/String;

    move-result-object v7

    .line 173
    const-string v8, "sha256"

    invoke-static {v7, v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    if-nez v4, :cond_3

    .line 174
    sget-object v4, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v4, v2}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    .line 175
    :cond_3
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->getHash()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-static {v6, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_0

    .line 178
    :cond_4
    const-string v8, "sha1"

    invoke-static {v7, v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    if-nez v5, :cond_5

    .line 179
    sget-object v5, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v5, v2}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha1Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object v5

    .line 180
    :cond_5
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->getHash()Lnicoid/network238/okio/ByteString;

    move-result-object v6

    invoke-static {v6, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    :goto_0
    return-void

    .line 184
    :cond_6
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "unsupported hashAlgorithm: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->getHashAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 192
    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Certificate pinning failure!\n  Peer certificate chain:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "\n    "

    if-eqz v2, :cond_8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 196
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    sget-object v3, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    const-string v3, ": "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v2

    invoke-interface {v2}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 201
    :cond_8
    const-string p2, "\n  Pinned certificates for "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    const-string p1, ":"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/okhttp3/CertificatePinner$Pin;

    .line 205
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 192
    :cond_9
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 209
    new-instance p2, Ljavax/net/ssl/SSLPeerUnverifiedException;

    invoke-direct {p2, p1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 239
    instance-of v0, p1, Lnicoid/network238/okhttp3/CertificatePinner;

    if-eqz v0, :cond_0

    .line 240
    check-cast p1, Lnicoid/network238/okhttp3/CertificatePinner;

    iget-object v0, p1, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    iget-object p1, p1, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final findMatchingPins(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 228
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    .line 391
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 392
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 393
    move-object v3, v2

    check-cast v3, Lnicoid/network238/okhttp3/CertificatePinner$Pin;

    .line 228
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->matchesHostname(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 394
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 395
    :cond_1
    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->asMutableList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public final getCertificateChainCleaner$okhttp()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 2

    .line 138
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-object v0
.end method

.method public final getPins()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
            ">;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .line 245
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x5ed

    mul-int/lit8 v0, v0, 0x29

    .line 246
    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public final withCertificateChainCleaner$okhttp(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/CertificatePinner;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 232
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 235
    :cond_0
    new-instance v0, Lnicoid/network238/okhttp3/CertificatePinner;

    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner;->pins:Ljava/util/Set;

    invoke-direct {v0, v1, p1}, Lnicoid/network238/okhttp3/CertificatePinner;-><init>(Ljava/util/Set;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V

    return-object v0
.end method
