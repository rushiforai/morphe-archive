.class public final Lnicoid/network238/okhttp3/CertificatePinner$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/CertificatePinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000c\u0010\u0006\u001a\u00020\u0007*\u00020\u0008H\u0007J\u000c\u0010\t\u001a\u00020\u0007*\u00020\u0008H\u0007J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0007R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CertificatePinner$Companion;",
        "",
        "<init>",
        "()V",
        "DEFAULT",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "sha1Hash",
        "Lnicoid/network238/okio/ByteString;",
        "Ljava/security/cert/X509Certificate;",
        "sha256Hash",
        "pin",
        "",
        "certificate",
        "Ljava/security/cert/Certificate;",
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

    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final pin(Ljava/security/cert/Certificate;)Ljava/lang/String;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 385
    instance-of v0, p1, Ljava/security/cert/X509Certificate;

    if-eqz v0, :cond_0

    .line 386
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sha256/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast p1, Ljava/security/cert/X509Certificate;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p1, v3, v1, v2}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 385
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Certificate pinning requires X509 certificates"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final sha1Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 372
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object p1

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/ByteString$Companion;->of$default(Lnicoid/network238/okio/ByteString$Companion;[BIIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->sha1()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 375
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object p1

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/ByteString$Companion;->of$default(Lnicoid/network238/okio/ByteString$Companion;[BIIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->sha256()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method
