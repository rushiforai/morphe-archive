.class public final Lnicoid/network238/okhttp3/CertificatePinner$Pin;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/CertificatePinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Pin"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0003J\u000e\u0010\u0012\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0014J\u0008\u0010\u0015\u001a\u00020\u0003H\u0016J\u0013\u0010\u0016\u001a\u00020\u00102\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u0008R\u0011\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
        "",
        "pattern",
        "",
        "pin",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "getPattern",
        "()Ljava/lang/String;",
        "hashAlgorithm",
        "getHashAlgorithm",
        "hash",
        "Lnicoid/network238/okio/ByteString;",
        "getHash",
        "()Lnicoid/network238/okio/ByteString;",
        "matchesHostname",
        "",
        "hostname",
        "matchesCertificate",
        "certificate",
        "Ljava/security/cert/X509Certificate;",
        "toString",
        "equals",
        "other",
        "hashCode",
        "",
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


# instance fields
.field private final hash:Lnicoid/network238/okio/ByteString;

.field private final hashAlgorithm:Ljava/lang/String;

.field private final pattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 266
    const-string v0, "*."

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    const/4 v4, -0x1

    if-eqz v0, :cond_0

    const/4 v9, 0x4

    const/4 v10, 0x0

    const-string v6, "*"

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v5, p1

    invoke-static/range {v5 .. v10}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result p1

    if-eq p1, v4, :cond_2

    goto :goto_0

    :cond_0
    move-object v5, p1

    .line 267
    :goto_0
    const-string p1, "**."

    invoke-static {v5, p1, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v9, 0x4

    const/4 v10, 0x0

    const-string v6, "*"

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result p1

    if-ne p1, v4, :cond_1

    goto :goto_1

    .line 268
    :cond_1
    const/4 v9, 0x6

    const/4 v10, 0x0

    const-string v6, "*"

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result p1

    if-ne p1, v4, :cond_8

    .line 274
    :cond_2
    :goto_1
    invoke-static {v5}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 273
    iput-object p1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    .line 277
    const-string p1, "sha1/"

    invoke-static {p2, p1, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    const-string v0, "Invalid pin hash: "

    if-eqz p1, :cond_4

    .line 278
    const-string p1, "sha1"

    iput-object p1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    .line 279
    sget-object p1, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const/4 v1, 0x5

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/ByteString$Companion;->decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    if-eqz p1, :cond_3

    iput-object p1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 282
    :cond_4
    const-string p1, "sha256/"

    invoke-static {p2, p1, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 283
    const-string p1, "sha256"

    iput-object p1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    .line 284
    sget-object p1, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const/4 v1, 0x7

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/ByteString$Companion;->decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    if-eqz p1, :cond_5

    iput-object p1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    return-void

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 288
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "pins must start with \'sha256/\' or \'sha1/\': "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 274
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Invalid pattern: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 270
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Unexpected pattern: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 265
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3

    .line 327
    instance-of v0, p1, Lnicoid/network238/okhttp3/CertificatePinner$Pin;

    if-nez v0, :cond_0

    goto :goto_0

    .line 329
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    check-cast p1, Lnicoid/network238/okhttp3/CertificatePinner$Pin;

    iget-object v1, p1, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 330
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    iget-object v1, p1, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 331
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    iget-object p1, p1, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    :goto_0
    const/4 p1, 0x0

    return p1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public final getHash()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 262
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final getHashAlgorithm()Ljava/lang/String;
    .registers 2

    .line 259
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    return-object v0
.end method

.method public final getPattern()Ljava/lang/String;
    .registers 2

    .line 256
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .line 337
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 338
    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 339
    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final matchesCertificate(Ljava/security/cert/X509Certificate;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    .line 318
    const-string v1, "sha256"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    sget-object v1, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha256Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 319
    :cond_0
    const-string v1, "sha1"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    sget-object v1, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->sha1Hash(Ljava/security/cert/X509Certificate;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public final matchesHostname(Ljava/lang/String;)Z
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 295
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    const-string v1, "**."

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    .line 303
    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    const/4 v5, 0x1

    if-eqz v0, :cond_0

    .line 297
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v10, v0, -0x3

    .line 298
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v10

    .line 299
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v7, v1, v10

    iget-object v8, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    const/16 v12, 0x10

    const/4 v13, 0x0

    const/4 v9, 0x3

    const/4 v11, 0x0

    move-object v6, p1

    invoke-static/range {v6 .. v13}, Lnicoid/network238/kotlin/text/StringsKt;->regionMatches$default(Ljava/lang/String;ILjava/lang/String;IIZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    if-eqz v0, :cond_1

    sub-int/2addr v0, v5

    .line 300
    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 v0, 0x2e

    if-ne p1, v0, :cond_2

    goto :goto_0

    .line 303
    :cond_0
    move-object v6, p1

    const-string p1, "*."

    invoke-static {v1, p1, v2, v3, v4}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    .line 312
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    if-eqz p1, :cond_3

    .line 305
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 v10, p1, -0x1

    .line 306
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v10

    .line 307
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v7, v0, v10

    iget-object v8, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    const/16 v12, 0x10

    const/4 v13, 0x0

    const/4 v9, 0x1

    const/4 v11, 0x0

    invoke-static/range {v6 .. v13}, Lnicoid/network238/kotlin/text/StringsKt;->regionMatches$default(Ljava/lang/String;ILjava/lang/String;IIZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    add-int/lit8 v8, p1, -0x1

    .line 308
    const/16 v7, 0x2e

    const/4 v9, 0x0

    const/4 v10, 0x4

    const/4 v11, 0x0

    invoke-static/range {v6 .. v11}, Lnicoid/network238/kotlin/text/StringsKt;->lastIndexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    :cond_1
    :goto_0
    return v5

    :cond_2
    return v2

    .line 312
    :cond_3
    invoke-static {v6, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .line 323
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hashAlgorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Pin;->hash:Lnicoid/network238/okio/ByteString;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v3}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
