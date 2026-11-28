.class public final Lcom/google/common/hash/HashingInputStream;
.super Ljava/io/FilterInputStream;
.source "HashingInputStream.java"


# instance fields
.field private final hasher:Lcom/google/common/hash/Hasher;


# direct methods
.method public constructor <init>(Lcom/google/common/hash/HashFunction;Ljava/io/InputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "hashFunction",
            "in"
        }
    .end annotation

    .line 45
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/io/InputStream;

    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 46
    invoke-interface {p1}, Lcom/google/common/hash/HashFunction;->newHasher()Lcom/google/common/hash/Hasher;

    move-result-object p1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/hash/Hasher;

    iput-object p1, p0, Lcom/google/common/hash/HashingInputStream;->hasher:Lcom/google/common/hash/Hasher;

    return-void
.end method

.method private in()Ljava/io/InputStream;
    .registers 1

    .line 50
    iget-object p0, p0, Lcom/google/common/hash/HashingInputStream;->in:Ljava/io/InputStream;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/InputStream;

    return-object p0
.end method


# virtual methods
.method public hash()Lcom/google/common/hash/HashCode;
    .registers 1

    .line 110
    iget-object p0, p0, Lcom/google/common/hash/HashingInputStream;->hasher:Lcom/google/common/hash/Hasher;

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public mark(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "readlimit"
        }
    .end annotation

    return-void
.end method

.method public markSupported()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Lcom/google/common/hash/HashingInputStream;->in()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 62
    iget-object p0, p0, Lcom/google/common/hash/HashingInputStream;->hasher:Lcom/google/common/hash/Hasher;

    int-to-byte v1, v0

    invoke-interface {p0, v1}, Lcom/google/common/hash/Hasher;->putByte(B)Lcom/google/common/hash/Hasher;

    :cond_0
    return v0
.end method

.method public read([BII)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    invoke-direct {p0}, Lcom/google/common/hash/HashingInputStream;->in()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p3

    const/4 v0, -0x1

    if-eq p3, v0, :cond_0

    .line 76
    iget-object p0, p0, Lcom/google/common/hash/HashingInputStream;->hasher:Lcom/google/common/hash/Hasher;

    invoke-interface {p0, p1, p2, p3}, Lcom/google/common/hash/Hasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

    :cond_0
    return p3
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    new-instance p0, Ljava/io/IOException;

    const-string v0, "reset not supported"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
