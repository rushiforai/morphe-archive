.class public Lcom/idv/identity/base/algorithm/doc/Frame;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MODE_BGR:I = 0x2

.field public static final MODE_BGRA:I = 0x1

.field public static final MODE_DEPTH:I = 0x7

.field public static final MODE_GRAY_16:I = 0x6

.field public static final MODE_GRAY_8:I = 0x5

.field public static final MODE_IRIS:I = 0x6

.field public static final MODE_NV21:I = 0x0

.field public static final MODE_RGB:I = 0x4

.field public static final MODE_RGBA:I = 0x3

.field public static final TYPE_DARK:I = 0x1

.field public static final TYPE_DEPTH:I = 0x2

.field public static final TYPE_GRAY_NANO:I = 0x5

.field public static final TYPE_IR:I = 0x3

.field public static final TYPE_LIGHT:I = 0x0

.field public static final TYPE_NANO:I = 0x4


# instance fields
.field public byteBuffer:Ljava/nio/ByteBuffer;

.field public data:[B

.field public frameMode:I

.field public frameType:I

.field public height:I

.field public rotation:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/idv/identity/base/algorithm/doc/Frame;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object v0, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, [B

    .line 15
    .line 16
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 17
    .line 18
    :cond_0
    iget v0, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 19
    .line 20
    iput v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 21
    .line 22
    iget v0, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 23
    .line 24
    iput v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 25
    .line 26
    iget v0, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 27
    .line 28
    iput v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 29
    .line 30
    iget v0, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 31
    .line 32
    iput v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 33
    .line 34
    iget v0, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    .line 35
    .line 36
    iput v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    .line 37
    .line 38
    iget-object p1, p1, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;IIIII)V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 52
    iput p2, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 53
    iput p3, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 54
    iput p4, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 55
    iput p5, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 56
    iput p6, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    return-void
.end method

.method public constructor <init>([BIIIII)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 45
    iput p2, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 46
    iput p3, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 47
    iput p4, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 48
    iput p5, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 49
    iput p6, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    return-void
.end method


# virtual methods
.method public deepCopy()Lcom/idv/identity/base/algorithm/doc/Frame;
    .locals 7

    .line 1
    new-instance v0, Lcom/idv/identity/base/algorithm/doc/Frame;

    .line 2
    .line 3
    iget v2, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 4
    .line 5
    iget v3, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 6
    .line 7
    iget v4, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 8
    .line 9
    iget v5, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 10
    .line 11
    iget v6, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/idv/identity/base/algorithm/doc/Frame;-><init>([BIIIII)V

    .line 15
    .line 16
    .line 17
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 18
    .line 19
    iput v1, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 20
    .line 21
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 22
    .line 23
    iput v1, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 24
    .line 25
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 26
    .line 27
    iput v1, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 28
    .line 29
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 30
    .line 31
    iput v1, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 32
    .line 33
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    .line 34
    .line 35
    iput v1, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    .line 36
    .line 37
    iget-object v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    array-length v2, v1

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    array-length p0, v1

    .line 45
    invoke-static {v1, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iput-object p0, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_0
    iget-object v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iput-object p0, v0, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 87
    .line 88
    :cond_1
    return-object v0
.end method

.method public recycle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->data:[B

    .line 3
    .line 4
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TGFrame{data=***, width="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->width:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", height="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->height:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", rotation="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->rotation:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", frameMode="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameMode:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", frameType="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p0, p0, Lcom/idv/identity/base/algorithm/doc/Frame;->frameType:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
