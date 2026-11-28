.class abstract Lcom/google/common/hash/AbstractByteHasher;
.super Lcom/google/common/hash/AbstractHasher;
.source "AbstractByteHasher.java"


# instance fields
.field private scratch:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 35
    invoke-direct {p0}, Lcom/google/common/hash/AbstractHasher;-><init>()V

    return-void
.end method

.method private scratch()Ljava/nio/ByteBuffer;
    .registers 3

    .line 140
    iget-object v0, p0, Lcom/google/common/hash/AbstractByteHasher;->scratch:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    const/16 v0, 0x8

    .line 141
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/hash/AbstractByteHasher;->scratch:Ljava/nio/ByteBuffer;

    :cond_0
    return-object v0
.end method

.method private update(Ljava/nio/ByteBuffer;I)Lcom/google/common/hash/Hasher;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "scratch",
            "bytes"
        }
    .end annotation

    .line 70
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p2}, Lcom/google/common/hash/AbstractByteHasher;->update([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    invoke-static {p1}, Lcom/google/common/hash/Java8Compatibility;->clear(Ljava/nio/Buffer;)V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p1}, Lcom/google/common/hash/Java8Compatibility;->clear(Ljava/nio/Buffer;)V

    .line 73
    throw p0
.end method


# virtual methods
.method public putByte(B)Lcom/google/common/hash/Hasher;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .line 80
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update(B)V

    return-object p0
.end method

.method public bridge synthetic putByte(B)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "b"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->putByte(B)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 103
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update(Ljava/nio/ByteBuffer;)V

    return-object p0
.end method

.method public putBytes([B)Lcom/google/common/hash/Hasher;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 87
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update([B)V

    return-object p0
.end method

.method public putBytes([BII)Lcom/google/common/hash/Hasher;
    .registers 6
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

    add-int v0, p2, p3

    .line 95
    array-length v1, p1

    invoke-static {p2, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 96
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/hash/AbstractByteHasher;->update([BII)V

    return-object p0
.end method

.method public bridge synthetic putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putBytes([B)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->putBytes([B)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putBytes([BII)Lcom/google/common/hash/PrimitiveSink;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "bytes",
            "off",
            "len"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/hash/AbstractByteHasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putChar(C)Lcom/google/common/hash/Hasher;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .line 134
    invoke-direct {p0}, Lcom/google/common/hash/AbstractByteHasher;->scratch()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 135
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    const/4 p1, 0x2

    .line 136
    invoke-direct {p0, v0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update(Ljava/nio/ByteBuffer;I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putChar(C)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "c"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->putChar(C)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putInt(I)Lcom/google/common/hash/Hasher;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "i"
        }
    .end annotation

    .line 118
    invoke-direct {p0}, Lcom/google/common/hash/AbstractByteHasher;->scratch()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 119
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const/4 p1, 0x4

    .line 120
    invoke-direct {p0, v0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update(Ljava/nio/ByteBuffer;I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putInt(I)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "i"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->putInt(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putLong(J)Lcom/google/common/hash/Hasher;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "l"
        }
    .end annotation

    .line 126
    invoke-direct {p0}, Lcom/google/common/hash/AbstractByteHasher;->scratch()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 127
    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    const/16 p1, 0x8

    .line 128
    invoke-direct {p0, v0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update(Ljava/nio/ByteBuffer;I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putLong(J)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "l"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/google/common/hash/AbstractByteHasher;->putLong(J)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putShort(S)Lcom/google/common/hash/Hasher;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .line 110
    invoke-direct {p0}, Lcom/google/common/hash/AbstractByteHasher;->scratch()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 111
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 p1, 0x2

    .line 112
    invoke-direct {p0, v0, p1}, Lcom/google/common/hash/AbstractByteHasher;->update(Ljava/nio/ByteBuffer;I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putShort(S)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "s"
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractByteHasher;->putShort(S)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method protected abstract update(B)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation
.end method

.method protected update(Ljava/nio/ByteBuffer;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .line 55
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/hash/AbstractByteHasher;->update([BII)V

    .line 57
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result p0

    invoke-static {p1, p0}, Lcom/google/common/hash/Java8Compatibility;->position(Ljava/nio/Buffer;I)V

    return-void

    .line 59
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    :goto_0
    if-lez v0, :cond_1

    .line 60
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/hash/AbstractByteHasher;->update(B)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected update([B)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    const/4 v0, 0x0

    .line 43
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/hash/AbstractByteHasher;->update([BII)V

    return-void
.end method

.method protected update([BII)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    move v0, p2

    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_0

    .line 49
    aget-byte v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/google/common/hash/AbstractByteHasher;->update(B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
