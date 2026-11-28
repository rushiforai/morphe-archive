.class public final Lcom/google/common/io/LittleEndianDataInputStream;
.super Ljava/io/FilterInputStream;
.source "LittleEndianDataInputStream.java"

# interfaces
.implements Ljava/io/DataInput;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .line 54
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    return-void
.end method

.method private in()Ljava/io/InputStream;
    .registers 1

    .line 58
    iget-object p0, p0, Lcom/google/common/io/LittleEndianDataInputStream;->in:Ljava/io/InputStream;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/InputStream;

    return-object p0
.end method

.method private readAndCheckByte()B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->in()Ljava/io/InputStream;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    int-to-byte p0, p0

    return p0

    .line 247
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method


# virtual methods
.method public readBoolean()Z
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 232
    invoke-virtual {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readUnsignedByte()I

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public readByte()B
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 226
    invoke-virtual {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readUnsignedByte()I

    move-result p0

    int-to-byte p0, p0

    return p0
.end method

.method public readChar()C
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    invoke-virtual {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result p0

    int-to-char p0, p0

    return p0
.end method

.method public readDouble()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 186
    invoke-virtual {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readInt()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method

.method public readFully([B)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    invoke-static {p0, p1}, Lcom/google/common/io/ByteStreams;->readFully(Ljava/io/InputStream;[B)V

    return-void
.end method

.method public readFully([BII)V
    .registers 4
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/io/ByteStreams;->readFully(Ljava/io/InputStream;[BII)V

    return-void
.end method

.method public readInt()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v0

    .line 131
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v1

    .line 132
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v2

    .line 133
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result p0

    .line 135
    invoke-static {p0, v2, v1, v0}, Lcom/google/common/primitives/Ints;->fromBytes(BBBB)I

    move-result p0

    return p0
.end method

.method public readLine()Ljava/lang/String;
    .registers 2

    .line 66
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "readLine is not supported"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public readLong()J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v7

    .line 150
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v6

    .line 151
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v5

    .line 152
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v4

    .line 153
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v3

    .line 154
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v2

    .line 155
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v1

    .line 156
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v0

    .line 158
    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->fromBytes(BBBBBBBB)J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    invoke-virtual {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readUnsignedShort()I

    move-result p0

    int-to-short p0, p0

    return p0
.end method

.method public readUTF()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->in()Ljava/io/InputStream;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public readUnsignedByte()I
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->in()Ljava/io/InputStream;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result p0

    if-ltz p0, :cond_0

    return p0

    .line 96
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method

.method public readUnsignedShort()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result v0

    .line 114
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->readAndCheckByte()B

    move-result p0

    const/4 v1, 0x0

    .line 116
    invoke-static {v1, v1, p0, v0}, Lcom/google/common/primitives/Ints;->fromBytes(BBBB)I

    move-result p0

    return p0
.end method

.method public skipBytes(I)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    invoke-direct {p0}, Lcom/google/common/io/LittleEndianDataInputStream;->in()Ljava/io/InputStream;

    move-result-object p0

    int-to-long v0, p1

    invoke-static {p0, v0, v1}, Lcom/google/common/io/ByteStreams;->skipUpTo(Ljava/io/InputStream;J)J

    move-result-wide p0

    long-to-int p0, p0

    return p0
.end method
