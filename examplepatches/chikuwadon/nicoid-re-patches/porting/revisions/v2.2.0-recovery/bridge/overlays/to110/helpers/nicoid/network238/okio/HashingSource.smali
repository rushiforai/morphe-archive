.class public final Lnicoid/network238/okio/HashingSource;
.super Lnicoid/network238/okio/ForwardingSource;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/HashingSource$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 \u001a2\u00020\u00012\u00020\u0002:\u0001\u001aB\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0006\u0010\nB\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0006\u0010\rB!\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0006\u0010\u0010J\u0018\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0013H\u0016J\r\u0010\u0017\u001a\u00020\u000fH\u0007\u00a2\u0006\u0002\u0008\u0019R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0017\u001a\u00020\u000f8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okio/HashingSource;",
        "Lnicoid/network238/okio/ForwardingSource;",
        "Lnicoid/network238/okio/Source;",
        "source",
        "digest",
        "Ljava/security/MessageDigest;",
        "<init>",
        "(Lnicoid/network238/okio/Source;Ljava/security/MessageDigest;)V",
        "algorithm",
        "",
        "(Lnicoid/network238/okio/Source;Ljava/lang/String;)V",
        "mac",
        "Ljavax/crypto/Mac;",
        "(Lnicoid/network238/okio/Source;Ljavax/crypto/Mac;)V",
        "key",
        "Lnicoid/network238/okio/ByteString;",
        "(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V",
        "messageDigest",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "hash",
        "()Lnicoid/network238/okio/ByteString;",
        "-deprecated_hash",
        "Companion",
        "okio"
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
.field public static final Companion:Lnicoid/network238/okio/HashingSource$Companion;


# instance fields
.field private final mac:Ljavax/crypto/Mac;

.field private final messageDigest:Ljava/security/MessageDigest;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/HashingSource$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/HashingSource$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Ljava/security/MessageDigest;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;Ljava/security/MessageDigest;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    .line 47
    iput-object p2, p0, Lnicoid/network238/okio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    .line 48
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okio/HashingSource;->mac:Ljavax/crypto/Mac;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;Ljavax/crypto/Mac;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    .line 54
    iput-object p2, p0, Lnicoid/network238/okio/HashingSource;->mac:Ljavax/crypto/Mac;

    .line 55
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    :try_start_0
    invoke-static {p3}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 62
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->toByteArray()[B

    move-result-object p2

    invoke-direct {v1, p2, p3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 63
    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    invoke-direct {p0, p1, v0}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Ljavax/crypto/Mac;)V

    return-void

    :catch_0
    move-exception p1

    .line 65
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static final hmacSha1(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/HashingSource$Companion;->hmacSha1(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final hmacSha256(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/HashingSource$Companion;->hmacSha256(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final hmacSha512(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/HashingSource$Companion;->hmacSha512(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final md5(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSource$Companion;->md5(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final sha1(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSource$Companion;->sha1(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final sha256(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSource$Companion;->sha256(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final sha512(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSource;->Companion:Lnicoid/network238/okio/HashingSource$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSource$Companion;->sha512(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_hash()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 120
    invoke-virtual {p0}, Lnicoid/network238/okio/HashingSource;->hash()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final hash()Lnicoid/network238/okio/ByteString;
    .registers 3

    .line 110
    iget-object v0, p0, Lnicoid/network238/okio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/HashingSource;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v0

    .line 111
    :goto_0
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v0}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okio/ForwardingSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p2

    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-eqz v0, :cond_2

    .line 74
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    sub-long/2addr v0, p2

    .line 77
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    .line 78
    iget-object v4, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    cmp-long v5, v2, v0

    if-lez v5, :cond_0

    .line 80
    iget-object v4, v4, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    iget v5, v4, Lnicoid/network238/okio/Segment;->limit:I

    iget v6, v4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    sub-long/2addr v2, v5

    goto :goto_0

    .line 85
    :cond_0
    :goto_1
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    cmp-long v5, v2, v5

    if-gez v5, :cond_2

    .line 86
    iget v5, v4, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v5, v5

    add-long/2addr v5, v0

    sub-long/2addr v5, v2

    long-to-int v0, v5

    .line 87
    iget-object v1, p0, Lnicoid/network238/okio/HashingSource;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v1, :cond_1

    .line 88
    iget-object v5, v4, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v4, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v6, v0

    invoke-virtual {v1, v5, v0, v6}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_2

    .line 90
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okio/HashingSource;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v5, v4, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v4, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v6, v0

    invoke-virtual {v1, v5, v0, v6}, Ljavax/crypto/Mac;->update([BII)V

    .line 92
    :goto_2
    iget v0, v4, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, v4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v2, v0

    .line 94
    iget-object v4, v4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v0, v2

    goto :goto_1

    :cond_2
    return-wide p2
.end method
