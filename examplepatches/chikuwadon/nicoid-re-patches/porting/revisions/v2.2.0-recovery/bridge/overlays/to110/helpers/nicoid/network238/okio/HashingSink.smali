.class public final Lnicoid/network238/okio/HashingSink;
.super Lnicoid/network238/okio/ForwardingSink;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/HashingSink$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0005\u0018\u0000 \u001b2\u00020\u00012\u00020\u0002:\u0001\u001bB\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0006\u0010\nB\u0019\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0006\u0010\rB!\u0008\u0010\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0006\u0010\u0010J\u0018\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\r\u0010\u0018\u001a\u00020\u000fH\u0007\u00a2\u0006\u0002\u0008\u001aR\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0018\u001a\u00020\u000f8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okio/HashingSink;",
        "Lnicoid/network238/okio/ForwardingSink;",
        "Lnicoid/network238/okio/Sink;",
        "sink",
        "digest",
        "Ljava/security/MessageDigest;",
        "<init>",
        "(Lnicoid/network238/okio/Sink;Ljava/security/MessageDigest;)V",
        "algorithm",
        "",
        "(Lnicoid/network238/okio/Sink;Ljava/lang/String;)V",
        "mac",
        "Ljavax/crypto/Mac;",
        "(Lnicoid/network238/okio/Sink;Ljavax/crypto/Mac;)V",
        "key",
        "Lnicoid/network238/okio/ByteString;",
        "(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V",
        "messageDigest",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
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
.field public static final Companion:Lnicoid/network238/okio/HashingSink$Companion;


# instance fields
.field private final mac:Ljavax/crypto/Mac;

.field private final messageDigest:Ljava/security/MessageDigest;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/HashingSink$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/HashingSink$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Sink;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okio/HashingSink;-><init>(Lnicoid/network238/okio/Sink;Ljava/security/MessageDigest;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Sink;Ljava/security/MessageDigest;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    .line 46
    iput-object p2, p0, Lnicoid/network238/okio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    .line 47
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okio/HashingSink;->mac:Ljavax/crypto/Mac;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Sink;Ljavax/crypto/Mac;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    .line 53
    iput-object p2, p0, Lnicoid/network238/okio/HashingSink;->mac:Ljavax/crypto/Mac;

    .line 54
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    :try_start_0
    invoke-static {p3}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 61
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->toByteArray()[B

    move-result-object p2

    invoke-direct {v1, p2, p3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 62
    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    invoke-direct {p0, p1, v0}, Lnicoid/network238/okio/HashingSink;-><init>(Lnicoid/network238/okio/Sink;Ljavax/crypto/Mac;)V

    return-void

    :catch_0
    move-exception p1

    .line 64
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static final hmacSha1(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSink;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/HashingSink$Companion;->hmacSha1(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final hmacSha256(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSink;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/HashingSink$Companion;->hmacSha256(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final hmacSha512(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSink;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/HashingSink$Companion;->hmacSha512(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final md5(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSink$Companion;->md5(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final sha1(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSink$Companion;->sha1(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final sha256(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSink$Companion;->sha256(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final sha512(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/HashingSink;->Companion:Lnicoid/network238/okio/HashingSink$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/HashingSink$Companion;->sha512(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_hash()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 109
    invoke-virtual {p0}, Lnicoid/network238/okio/HashingSink;->hash()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final hash()Lnicoid/network238/okio/ByteString;
    .registers 3

    .line 99
    iget-object v0, p0, Lnicoid/network238/okio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/HashingSink;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v0

    .line 100
    :goto_0
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v0}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 74
    iget-object p2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    :goto_0
    cmp-long p3, v0, v4

    if-gez p3, :cond_1

    sub-long v2, v4, v0

    .line 76
    iget p3, p2, Lnicoid/network238/okio/Segment;->limit:I

    iget v6, p2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p3, v6

    int-to-long v6, p3

    .line 150
    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    .line 77
    iget-object v2, p0, Lnicoid/network238/okio/HashingSink;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v2, :cond_0

    .line 78
    iget-object v3, p2, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, p2, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v2, v3, v6, p3}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_1

    .line 80
    :cond_0
    iget-object v2, p0, Lnicoid/network238/okio/HashingSink;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p2, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, p2, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v2, v3, v6, p3}, Ljavax/crypto/Mac;->update([BII)V

    :goto_1
    int-to-long v2, p3

    add-long/2addr v0, v2

    .line 83
    iget-object p2, p2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 87
    :cond_1
    invoke-super {p0, p1, v4, v5}, Lnicoid/network238/okio/ForwardingSink;->write(Lnicoid/network238/okio/Buffer;J)V

    return-void
.end method
