.class public final Lcom/google/common/io/ByteStreams;
.super Ljava/lang/Object;
.source "ByteStreams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;,
        Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;,
        Lcom/google/common/io/ByteStreams$LimitedInputStream;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final MAX_ARRAY_LEN:I = 0x7ffffff7

.field private static final NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

.field private static final TO_BYTE_ARRAY_DEQUE_SIZE:I = 0x14

.field private static final ZERO_COPY_CHUNK_SIZE:I = 0x80000


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 663
    new-instance v0, Lcom/google/common/io/ByteStreams$1;

    invoke-direct {v0}, Lcom/google/common/io/ByteStreams$1;-><init>()V

    sput-object v0, Lcom/google/common/io/ByteStreams;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static arraysEqual([B[BI)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "array1",
            "array2",
            "count"
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p2, :cond_1

    .line 991
    aget-byte v2, p0, v1

    aget-byte v3, p1, v1

    if-eq v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private static combineBuffers(Ljava/util/Queue;I)[B
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bufs",
            "totalLen"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "[B>;I)[B"
        }
    .end annotation

    .line 215
    invoke-interface {p0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 216
    new-array p0, v1, [B

    return-object p0

    .line 218
    :cond_0
    invoke-interface {p0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 219
    array-length v2, v0

    if-ne v2, p1, :cond_1

    return-object v0

    .line 222
    :cond_1
    array-length v2, v0

    sub-int v2, p1, v2

    .line 223
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    :goto_0
    if-lez v2, :cond_2

    .line 225
    invoke-interface {p0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 226
    array-length v4, v3

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    sub-int v5, p1, v2

    .line 228
    invoke-static {v3, v1, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sub-int/2addr v2, v4

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method static contentsEqual(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in1",
            "in2"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 972
    invoke-static {}, Lcom/google/common/io/ByteStreams;->createBuffer()[B

    move-result-object v0

    .line 973
    invoke-static {}, Lcom/google/common/io/ByteStreams;->createBuffer()[B

    move-result-object v1

    :cond_0
    const/4 v2, 0x0

    const/16 v3, 0x2000

    .line 975
    invoke-static {p0, v0, v2, v3}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result v4

    .line 976
    invoke-static {p1, v1, v2, v3}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 977
    invoke-static {v0, v1, v4}, Lcom/google/common/io/ByteStreams;->arraysEqual([B[BI)Z

    move-result v5

    if-eqz v5, :cond_1

    if-eq v4, v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    return v2
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "from",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    invoke-static {}, Lcom/google/common/io/ByteStreams;->createBuffer()[B

    move-result-object v0

    const-wide/16 v1, 0x0

    .line 118
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    return-wide v1

    :cond_0
    const/4 v4, 0x0

    .line 122
    invoke-virtual {p1, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v3, v3

    add-long/2addr v1, v3

    goto :goto_0
.end method

.method public static copy(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/channels/WritableByteChannel;)J
    .registers 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "from",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    instance-of v0, p0, Ljava/nio/channels/FileChannel;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1

    .line 143
    move-object v3, p0

    check-cast v3, Ljava/nio/channels/FileChannel;

    .line 144
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v9

    move-wide v4, v9

    :goto_0
    const-wide/32 v6, 0x80000

    move-object v8, p1

    .line 148
    invoke-virtual/range {v3 .. v8}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide p0

    add-long/2addr v4, p0

    .line 150
    invoke-virtual {v3, v4, v5}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    cmp-long p0, p0, v1

    if-gtz p0, :cond_0

    .line 151
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide p0

    cmp-long p0, v4, p0

    if-ltz p0, :cond_0

    sub-long/2addr v4, v9

    return-wide v4

    :cond_0
    move-object p1, v8

    goto :goto_0

    :cond_1
    move-object v8, p1

    .line 155
    invoke-static {}, Lcom/google/common/io/ByteStreams;->createBuffer()[B

    move-result-object p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 157
    :goto_1
    invoke-interface {p0, p1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_3

    .line 158
    invoke-static {p1}, Lcom/google/common/io/Java8Compatibility;->flip(Ljava/nio/Buffer;)V

    .line 159
    :goto_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 160
    invoke-interface {v8, p1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    int-to-long v3, v0

    add-long/2addr v1, v3

    goto :goto_2

    .line 162
    :cond_2
    invoke-static {p1}, Lcom/google/common/io/Java8Compatibility;->clear(Ljava/nio/Buffer;)V

    goto :goto_1

    :cond_3
    return-wide v1
.end method

.method static createBuffer()[B
    .registers 1

    const/16 v0, 0x2000

    .line 65
    new-array v0, v0, [B

    return-object v0
.end method

.method public static exhaust(Ljava/io/InputStream;)J
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 296
    invoke-static {}, Lcom/google/common/io/ByteStreams;->createBuffer()[B

    move-result-object v0

    const-wide/16 v1, 0x0

    .line 297
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    int-to-long v3, v3

    const-wide/16 v5, -0x1

    cmp-long v5, v3, v5

    if-eqz v5, :cond_0

    add-long/2addr v1, v3

    goto :goto_0

    :cond_0
    return-wide v1
.end method

.method public static limit(Ljava/io/InputStream;J)Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "limit"
        }
    .end annotation

    .line 712
    new-instance v0, Lcom/google/common/io/ByteStreams$LimitedInputStream;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/common/io/ByteStreams$LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    return-object v0
.end method

.method public static newDataInput(Ljava/io/ByteArrayInputStream;)Lcom/google/common/io/ByteArrayDataInput;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "byteArrayInputStream"
        }
    .end annotation

    .line 334
    new-instance v0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;-><init>(Ljava/io/ByteArrayInputStream;)V

    return-object v0
.end method

.method public static newDataInput([B)Lcom/google/common/io/ByteArrayDataInput;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 309
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->newDataInput(Ljava/io/ByteArrayInputStream;)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object p0

    return-object p0
.end method

.method public static newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bytes",
            "start"
        }
    .end annotation

    .line 321
    array-length v0, p0

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 322
    new-instance v0, Ljava/io/ByteArrayInputStream;

    array-length v1, p0

    sub-int/2addr v1, p1

    invoke-direct {v0, p0, p1, v1}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->newDataInput(Ljava/io/ByteArrayInputStream;)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object p0

    return-object p0
.end method

.method public static newDataOutput()Lcom/google/common/io/ByteArrayDataOutput;
    .registers 1

    .line 486
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->newDataOutput(Ljava/io/ByteArrayOutputStream;)Lcom/google/common/io/ByteArrayDataOutput;

    move-result-object v0

    return-object v0
.end method

.method public static newDataOutput(I)Lcom/google/common/io/ByteArrayDataOutput;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "size"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 499
    :goto_0
    const-string v1, "Invalid size: %s"

    invoke-static {v0, v1, p0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 500
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->newDataOutput(Ljava/io/ByteArrayOutputStream;)Lcom/google/common/io/ByteArrayDataOutput;

    move-result-object p0

    return-object p0
.end method

.method public static newDataOutput(Ljava/io/ByteArrayOutputStream;)Lcom/google/common/io/ByteArrayDataOutput;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "byteArrayOutputStream"
        }
    .end annotation

    .line 517
    new-instance v0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>(Ljava/io/ByteArrayOutputStream;)V

    return-object v0
.end method

.method public static nullOutputStream()Ljava/io/OutputStream;
    .registers 1

    .line 699
    sget-object v0, Lcom/google/common/io/ByteStreams;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method public static read(Ljava/io/InputStream;[BII)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "in",
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 953
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 954
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-ltz p3, :cond_1

    add-int v0, p2, p3

    .line 958
    array-length v1, p1

    invoke-static {p2, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_0

    add-int v1, p2, v0

    sub-int v2, p3, v0

    .line 961
    invoke-virtual {p0, p1, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    return v0

    .line 956
    :cond_1
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "len (%s) cannot be negative"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static readBytes(Ljava/io/InputStream;Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "processor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lcom/google/common/io/ByteProcessor<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 914
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    invoke-static {}, Lcom/google/common/io/ByteStreams;->createBuffer()[B

    move-result-object v0

    .line 920
    :cond_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const/4 v2, 0x0

    .line 921
    invoke-interface {p1, v0, v2, v1}, Lcom/google/common/io/ByteProcessor;->processBytes([BII)Z

    move-result v1

    if-nez v1, :cond_0

    .line 922
    :cond_1
    invoke-interface {p1}, Lcom/google/common/io/ByteProcessor;->getResult()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static readFully(Ljava/io/InputStream;[B)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 809
    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lcom/google/common/io/ByteStreams;->readFully(Ljava/io/InputStream;[BII)V

    return-void
.end method

.method public static readFully(Ljava/io/InputStream;[BII)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "in",
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 825
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result p0

    if-ne p0, p3, :cond_0

    return-void

    .line 827
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "reached end of stream after reading "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " bytes; "

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " bytes expected"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static skipFully(Ljava/io/InputStream;J)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 845
    invoke-static {p0, p1, p2}, Lcom/google/common/io/ByteStreams;->skipUpTo(Ljava/io/InputStream;J)J

    move-result-wide v0

    cmp-long p0, v0, p1

    if-ltz p0, :cond_0

    return-void

    .line 847
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "reached end of stream after skipping "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " bytes; "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " bytes expected"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static skipSafely(Ljava/io/InputStream;J)J
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 896
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 p0, 0x0

    return-wide p0

    :cond_0
    int-to-long v0, v0

    .line 897
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide p0

    return-wide p0
.end method

.method static skipUpTo(Ljava/io/InputStream;J)J
    .registers 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move-wide v3, v0

    :goto_0
    cmp-long v5, v3, p1

    if-gez v5, :cond_2

    sub-long v5, p1, v3

    .line 864
    invoke-static {p0, v5, v6}, Lcom/google/common/io/ByteStreams;->skipSafely(Ljava/io/InputStream;J)J

    move-result-wide v7

    cmp-long v9, v7, v0

    if-nez v9, :cond_1

    const-wide/16 v7, 0x2000

    .line 869
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    if-nez v2, :cond_0

    .line 874
    new-array v2, v5, [B

    :cond_0
    const/4 v6, 0x0

    .line 876
    invoke-virtual {p0, v2, v6, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    int-to-long v7, v5

    const-wide/16 v5, -0x1

    cmp-long v5, v7, v5

    if-eqz v5, :cond_2

    :cond_1
    add-long/2addr v3, v7

    goto :goto_0

    :cond_2
    return-wide v3
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    new-instance v0, Ljava/util/ArrayDeque;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/google/common/io/ByteStreams;->toByteArrayInternal(Ljava/io/InputStream;Ljava/util/Queue;I)[B

    move-result-object p0

    return-object p0
.end method

.method static toByteArray(Ljava/io/InputStream;J)[B
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "expectedSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ltz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 254
    :goto_0
    const-string v3, "expectedSize (%s) must be non-negative"

    invoke-static {v0, v3, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    const-wide/32 v3, 0x7ffffff7

    cmp-long v0, p1, v3

    if-gtz v0, :cond_4

    long-to-int p1, p1

    .line 259
    new-array p2, p1, [B

    move v0, p1

    :goto_1
    const/4 v3, -0x1

    if-lez v0, :cond_2

    sub-int v4, p1, v0

    .line 264
    invoke-virtual {p0, p2, v4, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-ne v5, v3, :cond_1

    .line 268
    invoke-static {p2, v4}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0

    :cond_1
    sub-int/2addr v0, v5

    goto :goto_1

    .line 274
    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-ne v0, v3, :cond_3

    return-object p2

    .line 280
    :cond_3
    new-instance v3, Ljava/util/ArrayDeque;

    const/16 v4, 0x16

    invoke-direct {v3, v4}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 281
    invoke-interface {v3, p2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    int-to-byte p2, v0

    .line 282
    new-array v0, v2, [B

    aput-byte p2, v0, v1

    invoke-interface {v3, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    add-int/2addr p1, v2

    .line 283
    invoke-static {p0, v3, p1}, Lcom/google/common/io/ByteStreams;->toByteArrayInternal(Ljava/io/InputStream;Ljava/util/Queue;I)[B

    move-result-object p0

    return-object p0

    .line 256
    :cond_4
    new-instance p0, Ljava/lang/OutOfMemoryError;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " bytes is too large to fit in a byte array"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static toByteArrayInternal(Ljava/io/InputStream;Ljava/util/Queue;I)[B
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "in",
            "bufs",
            "totalLen"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/util/Queue<",
            "[B>;I)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    invoke-static {p2}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    const/16 v1, 0x80

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x2000

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_0
    const/4 v1, -0x1

    const v2, 0x7ffffff7

    if-ge p2, v2, :cond_3

    sub-int/2addr v2, p2

    .line 191
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-array v3, v2, [B

    .line 192
    invoke-interface {p1, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v2, :cond_1

    sub-int v5, v2, v4

    .line 196
    invoke-virtual {p0, v3, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-ne v5, v1, :cond_0

    .line 198
    invoke-static {p1, p2}, Lcom/google/common/io/ByteStreams;->combineBuffers(Ljava/util/Queue;I)[B

    move-result-object p0

    return-object p0

    :cond_0
    add-int/2addr v4, v5

    add-int/2addr p2, v5

    goto :goto_1

    :cond_1
    const/16 v1, 0x1000

    if-ge v0, v1, :cond_2

    const/4 v1, 0x4

    goto :goto_2

    :cond_2
    const/4 v1, 0x2

    .line 190
    :goto_2
    invoke-static {v0, v1}, Lcom/google/common/math/IntMath;->saturatedMultiply(II)I

    move-result v0

    goto :goto_0

    .line 206
    :cond_3
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result p0

    if-ne p0, v1, :cond_4

    .line 208
    invoke-static {p1, v2}, Lcom/google/common/io/ByteStreams;->combineBuffers(Ljava/util/Queue;I)[B

    move-result-object p0

    return-object p0

    .line 210
    :cond_4
    new-instance p0, Ljava/lang/OutOfMemoryError;

    const-string p1, "input is too large to fit in a byte array"

    invoke-direct {p0, p1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw p0
.end method
