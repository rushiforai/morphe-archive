.class public Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/core/glcore/util/BitmapPrivateProtocolUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitmapInfo"
.end annotation


# instance fields
.field public colorSpace:I

.field public dataSize:I

.field public exifSize:I

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private convert([BI)I
    .locals 1

    .line 1
    mul-int/lit8 p2, p2, 0x4

    .line 2
    .line 3
    add-int/lit8 p0, p2, 0x3

    .line 4
    .line 5
    aget-byte p0, p1, p0

    .line 6
    .line 7
    and-int/lit16 p0, p0, 0xff

    .line 8
    .line 9
    add-int/lit8 v0, p2, 0x2

    .line 10
    .line 11
    aget-byte v0, p1, v0

    .line 12
    .line 13
    and-int/lit16 v0, v0, 0xff

    .line 14
    .line 15
    shl-int/lit8 v0, v0, 0x8

    .line 16
    .line 17
    or-int/2addr p0, v0

    .line 18
    add-int/lit8 v0, p2, 0x1

    .line 19
    .line 20
    aget-byte v0, p1, v0

    .line 21
    .line 22
    and-int/lit16 v0, v0, 0xff

    .line 23
    .line 24
    shl-int/lit8 v0, v0, 0x10

    .line 25
    .line 26
    or-int/2addr p0, v0

    .line 27
    aget-byte p1, p1, p2

    .line 28
    .line 29
    and-int/lit16 p1, p1, 0xff

    .line 30
    .line 31
    shl-int/lit8 p1, p1, 0x18

    .line 32
    .line 33
    or-int/2addr p0, p1

    .line 34
    return p0
.end method


# virtual methods
.method public getBytes()[B
    .locals 2

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v1, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->colorSpace:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v1, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->dataSize:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget p0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->exifSize:I

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public setData([B)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->convert([BI)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iput v0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->convert([BI)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->convert([BI)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->colorSpace:I

    .line 21
    .line 22
    const/4 v0, 0x3

    .line 23
    invoke-direct {p0, p1, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->convert([BI)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->dataSize:I

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->convert([BI)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->exifSize:I

    .line 35
    .line 36
    return-void
.end method
