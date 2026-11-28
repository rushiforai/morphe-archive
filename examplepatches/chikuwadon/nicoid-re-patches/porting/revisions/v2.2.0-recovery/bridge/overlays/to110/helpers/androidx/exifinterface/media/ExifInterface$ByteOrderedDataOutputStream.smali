.class Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;
.super Ljava/io/FilterOutputStream;
.source "ExifInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/exifinterface/media/ExifInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteOrderedDataOutputStream"
.end annotation


# instance fields
.field private mByteOrder:Ljava/nio/ByteOrder;

.field final mOutputStream:Ljava/io/DataOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ljava/nio/ByteOrder;)V
    .registers 4

    .line 8296
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 8297
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    .line 8298
    iput-object p2, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mByteOrder:Ljava/nio/ByteOrder;

    return-void
.end method


# virtual methods
.method public setByteOrder(Ljava/nio/ByteOrder;)V
    .registers 2

    .line 8302
    iput-object p1, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mByteOrder:Ljava/nio/ByteOrder;

    return-void
.end method

.method public write([B)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8307
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {p0, p1}, Ljava/io/DataOutputStream;->write([B)V

    return-void
.end method

.method public write([BII)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8312
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/DataOutputStream;->write([BII)V

    return-void
.end method

.method public writeByte(I)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8316
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    invoke-virtual {p0, p1}, Ljava/io/DataOutputStream;->write(I)V

    return-void
.end method

.method public writeInt(I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8330
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 8331
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    and-int/lit16 v1, p1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8332
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8333
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8334
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 p1, p1, 0x18

    and-int/lit16 p1, p1, 0xff

    invoke-virtual {p0, p1}, Ljava/io/DataOutputStream;->write(I)V

    return-void

    .line 8335
    :cond_0
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_1

    .line 8336
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 v1, p1, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8337
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8338
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8339
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    and-int/lit16 p1, p1, 0xff

    invoke-virtual {p0, p1}, Ljava/io/DataOutputStream;->write(I)V

    :cond_1
    return-void
.end method

.method public writeShort(S)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8320
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 8321
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    and-int/lit16 v1, p1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8322
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 p1, p1, 0x8

    and-int/lit16 p1, p1, 0xff

    invoke-virtual {p0, p1}, Ljava/io/DataOutputStream;->write(I)V

    return-void

    .line 8323
    :cond_0
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_1

    .line 8324
    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    ushr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 8325
    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->mOutputStream:Ljava/io/DataOutputStream;

    and-int/lit16 p1, p1, 0xff

    invoke-virtual {p0, p1}, Ljava/io/DataOutputStream;->write(I)V

    :cond_1
    return-void
.end method

.method public writeUnsignedInt(J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide v0, 0xffffffffL

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    long-to-int p1, p1

    .line 8356
    invoke-virtual {p0, p1}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->writeInt(I)V

    return-void

    .line 8353
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "val is larger than the maximum value of a 32-bit unsigned integer"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public writeUnsignedShort(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const v0, 0xffff

    if-gt p1, v0, :cond_0

    int-to-short p1, p1

    .line 8348
    invoke-virtual {p0, p1}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataOutputStream;->writeShort(S)V

    return-void

    .line 8345
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "val is larger than the maximum value of a 16-bit unsigned integer"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
