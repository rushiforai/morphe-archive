.class final Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;
.super Lcom/google/common/hash/AbstractHasher;
.source "AbstractNonStreamingHashFunction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/AbstractNonStreamingHashFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ByteBufferHasher"
.end annotation


# instance fields
.field buffer:Ljava/nio/ByteBuffer;

.field final synthetic this$0:Lcom/google/common/hash/AbstractNonStreamingHashFunction;


# direct methods
.method constructor <init>(Lcom/google/common/hash/AbstractNonStreamingHashFunction;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "expectedInputSize"
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->this$0:Lcom/google/common/hash/AbstractNonStreamingHashFunction;

    invoke-direct {p0}, Lcom/google/common/hash/AbstractHasher;-><init>()V

    .line 81
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    sget-object p2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    return-void
.end method

.method private ensureCapacity(I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "needed"
        }
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lt v0, p1, :cond_0

    return-void

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    .line 94
    iget-object v1, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v1, p1

    shl-int/lit8 v0, v0, 0x1

    .line 95
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 97
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 100
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/google/common/hash/Java8Compatibility;->flip(Ljava/nio/Buffer;)V

    .line 102
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 105
    iput-object p1, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    return-void
.end method


# virtual methods
.method public hash()Lcom/google/common/hash/HashCode;
    .registers 4

    .line 168
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->this$0:Lcom/google/common/hash/AbstractNonStreamingHashFunction;

    iget-object v1, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object p0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result p0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction;->hashBytes([BII)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public putByte(B)Lcom/google/common/hash/Hasher;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    const/4 v0, 0x1

    .line 110
    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 111
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

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

    .line 77
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putByte(B)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 124
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 125
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method public putBytes([BII)Lcom/google/common/hash/Hasher;
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

    .line 117
    invoke-direct {p0, p3}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 118
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

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

    .line 77
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;

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

    .line 77
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

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

    const/4 v0, 0x2

    .line 161
    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 162
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

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

    .line 77
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putChar(C)Lcom/google/common/hash/Hasher;

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

    const/4 v0, 0x4

    .line 147
    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 148
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

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

    .line 77
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putInt(I)Lcom/google/common/hash/Hasher;

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

    const/16 v0, 0x8

    .line 154
    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 155
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

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

    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putLong(J)Lcom/google/common/hash/Hasher;

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

    const/4 v0, 0x2

    .line 140
    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 141
    iget-object v0, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

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

    .line 77
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putShort(S)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "charSequence"
        }
    .end annotation

    .line 131
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->ensureCapacity(I)V

    .line 132
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 133
    iget-object v2, p0, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public bridge synthetic putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "charSequence"
        }
    .end annotation

    .line 77
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractNonStreamingHashFunction$ByteBufferHasher;->putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method
