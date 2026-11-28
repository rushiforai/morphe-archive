.class Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;
.super Ljava/io/InputStream;
.source "ExifInterface.java"

# interfaces
.implements Ljava/io/DataInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/exifinterface/media/ExifInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteOrderedDataInputStream"
.end annotation


# static fields
.field public static final LENGTH_UNSET:I = -0x1


# instance fields
.field private mByteOrder:Ljava/nio/ByteOrder;

.field protected final mDataInputStream:Ljava/io/DataInputStream;

.field private mLength:I

.field protected mPosition:I

.field private mSkipBuffer:[B


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8044
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, p1, v0}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V
    .registers 5

    .line 8047
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 8048
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    const/4 v1, 0x0

    .line 8049
    invoke-virtual {v0, v1}, Ljava/io/DataInputStream;->mark(I)V

    .line 8050
    iput v1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8051
    iput-object p2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 8052
    instance-of p2, p1, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;

    if-eqz p2, :cond_0

    .line 8053
    check-cast p1, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;

    invoke-virtual {p1}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->length()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    .line 8054
    :goto_0
    iput p1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    return-void
.end method

.method constructor <init>([B)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8039
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, v0, v1}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 8040
    array-length p1, p1

    iput p1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    return-void
.end method


# virtual methods
.method public available()I
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8086
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->available()I

    move-result p0

    return p0
.end method

.method public length()I
    .registers 1

    .line 8285
    iget p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    return p0
.end method

.method public mark(I)V
    .registers 2

    .line 8274
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Mark is currently unsupported"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public position()I
    .registers 1

    .line 8062
    iget p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    return p0
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8091
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8092
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->read()I

    move-result p0

    return p0
.end method

.method public read([BII)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8097
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->read([BII)I

    move-result p1

    .line 8098
    iget p2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr p2, p1

    iput p2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    return p1
.end method

.method public readBoolean()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8116
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8117
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result p0

    return p0
.end method

.method public readByte()B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8146
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8147
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->read()I

    move-result p0

    if-ltz p0, :cond_0

    int-to-byte p0, p0

    return p0

    .line 8149
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method

.method public readChar()C
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8122
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8123
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readChar()C

    move-result p0

    return p0
.end method

.method public readDouble()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8269
    invoke-virtual {p0}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readLong()J

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

    .line 8264
    invoke-virtual {p0}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method

.method public readFully([B)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8140
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8141
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0, p1}, Ljava/io/DataInputStream;->readFully([B)V

    return-void
.end method

.method public readFully([BII)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8134
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr v0, p3

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8135
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/DataInputStream;->readFully([BII)V

    return-void
.end method

.method public readInt()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8172
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8173
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 8174
    iget-object v1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 8175
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->read()I

    move-result v2

    .line 8176
    iget-object v3, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v3}, Ljava/io/DataInputStream;->read()I

    move-result v3

    or-int v4, v0, v1

    or-int/2addr v4, v2

    or-int/2addr v4, v3

    if-ltz v4, :cond_2

    .line 8180
    iget-object v4, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_0

    shl-int/lit8 v3, v3, 0x18

    shl-int/lit8 v2, v2, 0x10

    add-int/2addr v3, v2

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v3, v1

    add-int/2addr v3, v0

    return v3

    .line 8182
    :cond_0
    iget-object v4, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_1

    shl-int/lit8 v0, v0, 0x18

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    shl-int/lit8 v2, v2, 0x8

    add-int/2addr v0, v2

    add-int/2addr v0, v3

    return v0

    .line 8185
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid byte order: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8178
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method

.method public readLine()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8110
    const-string p0, "ExifInterface"

    const-string v0, "Currently unsupported"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public readLong()J
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 8238
    iget v1, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    const/16 v2, 0x8

    add-int/2addr v1, v2

    iput v1, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8239
    iget-object v1, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 8240
    iget-object v3, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v3}, Ljava/io/DataInputStream;->read()I

    move-result v3

    .line 8241
    iget-object v4, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->read()I

    move-result v4

    .line 8242
    iget-object v5, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v5}, Ljava/io/DataInputStream;->read()I

    move-result v5

    .line 8243
    iget-object v6, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v6}, Ljava/io/DataInputStream;->read()I

    move-result v6

    .line 8244
    iget-object v7, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/io/DataInputStream;->read()I

    move-result v7

    .line 8245
    iget-object v8, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v8}, Ljava/io/DataInputStream;->read()I

    move-result v8

    .line 8246
    iget-object v9, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v9}, Ljava/io/DataInputStream;->read()I

    move-result v9

    or-int v10, v1, v3

    or-int/2addr v10, v4

    or-int/2addr v10, v5

    or-int/2addr v10, v6

    or-int/2addr v10, v7

    or-int/2addr v10, v8

    or-int/2addr v10, v9

    if-ltz v10, :cond_2

    .line 8250
    iget-object v10, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v11, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v14, 0x20

    const/16 v15, 0x28

    const/16 v16, 0x30

    const/16 v17, 0x38

    if-ne v10, v11, :cond_0

    int-to-long v9, v9

    shl-long v9, v9, v17

    const/16 v11, 0x10

    const/16 v18, 0x18

    int-to-long v12, v8

    shl-long v12, v12, v16

    add-long/2addr v9, v12

    int-to-long v7, v7

    shl-long/2addr v7, v15

    add-long/2addr v9, v7

    int-to-long v6, v6

    shl-long/2addr v6, v14

    add-long/2addr v9, v6

    int-to-long v5, v5

    shl-long v5, v5, v18

    add-long/2addr v9, v5

    int-to-long v4, v4

    shl-long/2addr v4, v11

    add-long/2addr v9, v4

    int-to-long v3, v3

    shl-long/2addr v3, v2

    add-long/2addr v9, v3

    int-to-long v0, v1

    add-long/2addr v9, v0

    return-wide v9

    :cond_0
    const/16 v11, 0x10

    const/16 v18, 0x18

    .line 8254
    iget-object v10, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v12, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v10, v12, :cond_1

    int-to-long v0, v1

    shl-long v0, v0, v17

    int-to-long v12, v3

    shl-long v12, v12, v16

    add-long/2addr v0, v12

    int-to-long v3, v4

    shl-long/2addr v3, v15

    add-long/2addr v0, v3

    int-to-long v3, v5

    shl-long/2addr v3, v14

    add-long/2addr v0, v3

    int-to-long v3, v6

    shl-long v3, v3, v18

    add-long/2addr v0, v3

    int-to-long v3, v7

    shl-long/2addr v3, v11

    add-long/2addr v0, v3

    int-to-long v3, v8

    shl-long/2addr v3, v2

    add-long/2addr v0, v3

    int-to-long v2, v9

    add-long/2addr v0, v2

    return-wide v0

    .line 8259
    :cond_1
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid byte order: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 8248
    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readShort()S
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8156
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8157
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 8158
    iget-object v1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    or-int v2, v0, v1

    if-ltz v2, :cond_2

    .line 8162
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_0

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v1, v0

    int-to-short p0, v1

    return p0

    .line 8164
    :cond_0
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_1

    shl-int/lit8 v0, v0, 0x8

    add-int/2addr v0, v1

    int-to-short p0, v0

    return p0

    .line 8167
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid byte order: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8160
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method

.method public readToEnd()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    .line 8067
    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 8070
    :goto_0
    array-length v2, v0

    if-ne v1, v2, :cond_0

    .line 8071
    array-length v2, v0

    shl-int/lit8 v2, v2, 0x1

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    .line 8073
    :cond_0
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    array-length v3, v0

    sub-int/2addr v3, v1

    invoke-virtual {v2, v0, v1, v3}, Ljava/io/DataInputStream;->read([BII)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    add-int/2addr v1, v2

    .line 8076
    iget v3, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr v3, v2

    iput v3, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    goto :goto_0

    .line 8081
    :cond_1
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0
.end method

.method public readUTF()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8128
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8129
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public readUnsignedByte()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8104
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8105
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result p0

    return p0
.end method

.method public readUnsignedInt()J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8233
    invoke-virtual {p0}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result p0

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public readUnsignedShort()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8218
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    .line 8219
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 8220
    iget-object v1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    or-int v2, v0, v1

    if-ltz v2, :cond_2

    .line 8224
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_0

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v1, v0

    return v1

    .line 8226
    :cond_0
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_1

    shl-int/lit8 v0, v0, 0x8

    add-int/2addr v0, v1

    return v0

    .line 8229
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid byte order: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8222
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0
.end method

.method public reset()V
    .registers 2

    .line 8279
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Reset is currently unsupported"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setByteOrder(Ljava/nio/ByteOrder;)V
    .registers 2

    .line 8058
    iput-object p1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    return-void
.end method

.method public skipBytes(I)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8190
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "skipBytes is currently unsupported"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public skipFully(I)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p1, :cond_2

    .line 8201
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    sub-int v3, p1, v1

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Ljava/io/DataInputStream;->skip(J)J

    move-result-wide v4

    long-to-int v2, v4

    if-gtz v2, :cond_1

    .line 8203
    iget-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mSkipBuffer:[B

    const/16 v4, 0x2000

    if-nez v2, :cond_0

    .line 8204
    new-array v2, v4, [B

    iput-object v2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mSkipBuffer:[B

    .line 8206
    :cond_0
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 8207
    iget-object v3, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    iget-object v4, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mSkipBuffer:[B

    invoke-virtual {v3, v4, v0, v2}, Ljava/io/DataInputStream;->read([BII)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 8208
    new-instance p0, Ljava/io/EOFException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Reached EOF while skipping "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " bytes."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    add-int/2addr v1, v2

    goto :goto_0

    .line 8213
    :cond_2
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr p1, v1

    iput p1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    return-void
.end method
