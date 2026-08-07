.class public Lio/agora/base/JavaI010Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$I010Buffer;


# static fields
.field private static final BYTE_PER_CHANNEL:I = 0x2


# instance fields
.field private final dataU:Ljava/nio/ByteBuffer;

.field private final dataV:Ljava/nio/ByteBuffer;

.field private final dataY:Ljava/nio/ByteBuffer;

.field private final height:I

.field private final refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

.field private final strideU:I

.field private final strideV:I

.field private final strideY:I

.field private final width:I


# direct methods
.method public constructor <init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V
    .locals 0
    .param p9    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lio/agora/base/JavaI010Buffer;->width:I

    .line 5
    .line 6
    iput p2, p0, Lio/agora/base/JavaI010Buffer;->height:I

    .line 7
    .line 8
    iput p4, p0, Lio/agora/base/JavaI010Buffer;->strideY:I

    .line 9
    .line 10
    iput p6, p0, Lio/agora/base/JavaI010Buffer;->strideU:I

    .line 11
    .line 12
    iput p8, p0, Lio/agora/base/JavaI010Buffer;->strideV:I

    .line 13
    .line 14
    iput-object p3, p0, Lio/agora/base/JavaI010Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    iput-object p5, p0, Lio/agora/base/JavaI010Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    iput-object p7, p0, Lio/agora/base/JavaI010Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    new-instance p1, Lio/agora/base/internal/RefCountDelegate;

    .line 21
    .line 22
    invoke-direct {p1, p9}, Lio/agora/base/internal/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lio/agora/base/JavaI010Buffer;->refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

    .line 26
    .line 27
    return-void
.end method

.method public static allocate(II)Lio/agora/base/JavaI010Buffer;
    .locals 12

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    add-int/lit8 v1, p0, 0x1

    .line 6
    .line 7
    div-int/lit8 v8, v1, 0x2

    .line 8
    .line 9
    mul-int v1, p0, p1

    .line 10
    .line 11
    mul-int/lit8 v2, v1, 0x2

    .line 12
    .line 13
    mul-int v3, v8, v0

    .line 14
    .line 15
    mul-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    add-int v4, v2, v3

    .line 18
    .line 19
    mul-int/lit8 v5, v8, 0x2

    .line 20
    .line 21
    mul-int/2addr v5, v0

    .line 22
    add-int/2addr v1, v5

    .line 23
    mul-int/lit8 v1, v1, 0x2

    .line 24
    .line 25
    invoke-static {v1}, Lio/agora/base/internal/JniCommon;->nativeAllocateByteBuffer(I)Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 51
    .line 52
    .line 53
    add-int/2addr v4, v3

    .line 54
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    new-instance v2, Lio/agora/base/JavaI010Buffer;

    .line 62
    .line 63
    new-instance v11, Lio/agora/base/JavaI010Buffer$1;

    .line 64
    .line 65
    invoke-direct {v11, v0}, Lio/agora/base/JavaI010Buffer$1;-><init>(Ljava/nio/ByteBuffer;)V

    .line 66
    .line 67
    .line 68
    move v6, p0

    .line 69
    move v10, v8

    .line 70
    move v3, p0

    .line 71
    move v4, p1

    .line 72
    invoke-direct/range {v2 .. v11}, Lio/agora/base/JavaI010Buffer;-><init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-object v2
.end method

.method private static checkCapacity(Ljava/nio/ByteBuffer;II)V
    .locals 2

    .line 1
    mul-int/2addr p2, p1

    .line 2
    mul-int/lit8 p2, p2, 0x2

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-lt p1, p2, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const-string p1, "in i010"

    .line 16
    .line 17
    const-string v0, "I010 Buffer must be at least "

    .line 18
    .line 19
    const-string v1, " bytes, but was "

    .line 20
    .line 21
    invoke-static {v0, p2, v1, p0, p1}, Ll/cmq;->a(Ljava/lang/String;ILjava/lang/Object;ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static i010BufferToI420(Lio/agora/base/JavaI010Buffer;)Lio/agora/base/VideoFrame$I420Buffer;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lio/agora/base/JavaI010Buffer;->width:I

    .line 4
    .line 5
    iget v2, v0, Lio/agora/base/JavaI010Buffer;->height:I

    .line 6
    .line 7
    invoke-static {v1, v2}, Lio/agora/base/JavaI420Buffer;->allocate(II)Lio/agora/base/JavaI420Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0}, Lio/agora/base/JavaI010Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0}, Lio/agora/base/JavaI010Buffer;->getStrideY()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v0}, Lio/agora/base/JavaI010Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v0}, Lio/agora/base/JavaI010Buffer;->getStrideU()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    invoke-virtual {v0}, Lio/agora/base/JavaI010Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-virtual {v0}, Lio/agora/base/JavaI010Buffer;->getStrideV()I

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    iget v8, v0, Lio/agora/base/JavaI010Buffer;->width:I

    .line 36
    .line 37
    iget v9, v0, Lio/agora/base/JavaI010Buffer;->height:I

    .line 38
    .line 39
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideY()I

    .line 44
    .line 45
    .line 46
    move-result v11

    .line 47
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v12

    .line 51
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideU()I

    .line 52
    .line 53
    .line 54
    move-result v13

    .line 55
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v14

    .line 59
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideV()I

    .line 60
    .line 61
    .line 62
    move-result v15

    .line 63
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v16

    .line 67
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v17

    .line 71
    invoke-static/range {v2 .. v17}, Lio/agora/base/JavaI010Buffer;->nativeI010toI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 72
    .line 73
    .line 74
    return-object v1
.end method

.method private static native nativeI010toI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method

.method public static wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lio/agora/base/JavaI010Buffer;
    .locals 10
    .param p8    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    if-eqz p4, :cond_1

    .line 5
    .line 6
    if-eqz p6, :cond_1

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->isDirect()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->isDirect()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual/range {p6 .. p6}, Ljava/nio/ByteBuffer;->isDirect()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    add-int/lit8 v0, p1, 0x1

    .line 27
    .line 28
    div-int/lit8 v0, v0, 0x2

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual/range {p6 .. p6}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-static {v3, p1, p3}, Lio/agora/base/JavaI010Buffer;->checkCapacity(Ljava/nio/ByteBuffer;II)V

    .line 43
    .line 44
    .line 45
    invoke-static {v5, v0, p5}, Lio/agora/base/JavaI010Buffer;->checkCapacity(Ljava/nio/ByteBuffer;II)V

    .line 46
    .line 47
    .line 48
    move/from16 v8, p7

    .line 49
    .line 50
    invoke-static {v7, v0, v8}, Lio/agora/base/JavaI010Buffer;->checkCapacity(Ljava/nio/ByteBuffer;II)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Lio/agora/base/JavaI010Buffer;

    .line 54
    .line 55
    move v1, p0

    .line 56
    move v2, p1

    .line 57
    move v4, p3

    .line 58
    move v6, p5

    .line 59
    move-object/from16 v9, p8

    .line 60
    .line 61
    invoke-direct/range {v0 .. v9}, Lio/agora/base/JavaI010Buffer;-><init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_0
    const-string v1, "Data i010 buffers must be direct byte buffers."

    .line 66
    .line 67
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_1
    const-string v1, "Data i010 buffers cannot be null."

    .line 72
    .line 73
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method


# virtual methods
.method public cropAndScale(IIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDataU()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/JavaI010Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDataV()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/JavaI010Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDataY()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/JavaI010Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/JavaI010Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideU()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/JavaI010Buffer;->strideU:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideV()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/JavaI010Buffer;->strideV:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/JavaI010Buffer;->strideY:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/JavaI010Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public mirror(I)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/JavaI010Buffer;->refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lio/agora/base/internal/RefCountDelegate;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/JavaI010Buffer;->refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lio/agora/base/internal/RefCountDelegate;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public rotate(I)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public toI420()Lio/agora/base/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    invoke-static {p0}, Lio/agora/base/JavaI010Buffer;->i010BufferToI420(Lio/agora/base/JavaI010Buffer;)Lio/agora/base/VideoFrame$I420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public transform(IIIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method
