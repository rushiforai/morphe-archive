.class public final Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nR\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;",
        "",
        "<init>",
        "()V",
        "blockedCertificateSha256s",
        "",
        "Lnicoid/network238/okio/ByteString;",
        "isBlocklisted",
        "",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
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
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;

.field private static final blockedCertificateSha256s:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lnicoid/network238/okio/ByteString;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;->INSTANCE:Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;

    .line 27
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v1, "43bffa19d6ef651451f6841e019931e96f6f2eaeff28ab4b6f1ce4576de2717b"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    .line 28
    const-string v2, "49dd353dc2b919a3770645117d0e60c16115e7d1bc259eefe734b00ea434fe5f"

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    .line 29
    const-string v3, "5c0660a2b164910d8ff589c18e14552e9e0ec237dcefe2cb736d41a4811f81a0"

    invoke-virtual {v0, v3}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v3

    .line 30
    const-string v4, "63ecefee431d49523bc1136c4e72d0206a477086caf606cd5cf025686c109cf8"

    invoke-virtual {v0, v4}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    .line 31
    const-string v5, "92c063d67e8f14db71d288e11266ffdaf69cbf115f7bab14f3bc2f68d25e0e30"

    invoke-virtual {v0, v5}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v5

    .line 32
    const-string v6, "e0254c7fcdc265e2f0f8a428dabb75ab4ae039b4872d62f5ee57f0877d5a8a41"

    invoke-virtual {v0, v6}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v6

    .line 33
    const-string v7, "ebed6475c2c2d80fcb199f3fe8dd6e6b3ce60b77eb15d4e42c3dec0c6f5b5105"

    invoke-virtual {v0, v7}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v7

    .line 34
    const-string v8, "ec4ffa1ad0ac88081314b7aaffef6a91f97cd57291bb5ba686c5415f5eb4f6b6"

    invoke-virtual {v0, v8}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    const/16 v8, 0x8

    new-array v8, v8, [Lnicoid/network238/okio/ByteString;

    const/4 v9, 0x0

    aput-object v1, v8, v9

    const/4 v1, 0x1

    aput-object v2, v8, v1

    const/4 v1, 0x2

    aput-object v3, v8, v1

    const/4 v1, 0x3

    aput-object v4, v8, v1

    const/4 v1, 0x4

    aput-object v5, v8, v1

    const/4 v1, 0x5

    aput-object v6, v8, v1

    const/4 v1, 0x6

    aput-object v7, v8, v1

    const/4 v1, 0x7

    aput-object v0, v8, v1

    .line 26
    invoke-static {v8}, Lnicoid/network238/kotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;->blockedCertificateSha256s:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final isBlocklisted(Lnicoid/network238/okhttp3/Handshake;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object p1

    .line 44
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 45
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/Certificate;

    .line 39
    sget-object v1, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 40
    sget-object v1, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;->blockedCertificateSha256s:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
