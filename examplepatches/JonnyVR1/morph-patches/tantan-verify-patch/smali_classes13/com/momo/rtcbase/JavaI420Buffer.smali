.class public Lcom/momo/rtcbase/JavaI420Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoFrame$I420Buffer;


# instance fields
.field private final dataU:Ljava/nio/ByteBuffer;

.field private final dataV:Ljava/nio/ByteBuffer;

.field private final dataY:Ljava/nio/ByteBuffer;

.field private final height:I

.field private final refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

.field private final strideU:I

.field private final strideV:I

.field private final strideY:I

.field private final width:I


# direct methods
.method private constructor <init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/rtcbase/JavaI420Buffer;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/JavaI420Buffer;->height:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/JavaI420Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/momo/rtcbase/JavaI420Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    iput-object p7, p0, Lcom/momo/rtcbase/JavaI420Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iput p4, p0, Lcom/momo/rtcbase/JavaI420Buffer;->strideY:I

    .line 15
    .line 16
    iput p6, p0, Lcom/momo/rtcbase/JavaI420Buffer;->strideU:I

    .line 17
    .line 18
    iput p8, p0, Lcom/momo/rtcbase/JavaI420Buffer;->strideV:I

    .line 19
    .line 20
    new-instance p1, Lcom/momo/rtcbase/RefCountDelegate;

    .line 21
    .line 22
    invoke-direct {p1, p9}, Lcom/momo/rtcbase/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/momo/rtcbase/JavaI420Buffer;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/JniCommon;->nativeFreeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static allocate(II)Lcom/momo/rtcbase/JavaI420Buffer;
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
    mul-int v2, v8, v0

    .line 12
    .line 13
    add-int v3, v1, v2

    .line 14
    .line 15
    mul-int/lit8 v4, v8, 0x2

    .line 16
    .line 17
    mul-int/2addr v4, v0

    .line 18
    add-int/2addr v4, v1

    .line 19
    invoke-static {v4}, Lcom/momo/rtcbase/JniCommon;->nativeAllocateByteBuffer(I)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    add-int/2addr v3, v2

    .line 48
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    new-instance v2, Lcom/momo/rtcbase/JavaI420Buffer;

    .line 56
    .line 57
    new-instance v11, Ll/fmq;

    .line 58
    .line 59
    invoke-direct {v11, v0}, Ll/fmq;-><init>(Ljava/nio/ByteBuffer;)V

    .line 60
    .line 61
    .line 62
    move v6, p0

    .line 63
    move v10, v8

    .line 64
    move v3, p0

    .line 65
    move v4, p1

    .line 66
    invoke-direct/range {v2 .. v11}, Lcom/momo/rtcbase/JavaI420Buffer;-><init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-object v2
.end method

.method private static checkCapacity(Ljava/nio/ByteBuffer;III)V
    .locals 0

    .line 1
    add-int/lit8 p2, p2, -0x1

    .line 2
    .line 3
    mul-int/2addr p3, p2

    .line 4
    add-int/2addr p3, p1

    .line 5
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-lt p1, p3, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p1, " bytes, but was "

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const-string p2, "Buffer must be at least "

    .line 19
    .line 20
    invoke-static {p2, p3, p1, p0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static cropAndScaleI420(Lcom/momo/rtcbase/VideoFrame$I420Buffer;IIIIII)Lcom/momo/rtcbase/VideoFrame$Buffer;
    .locals 19

    .line 1
    move/from16 v8, p3

    .line 2
    .line 3
    move/from16 v0, p5

    .line 4
    .line 5
    move/from16 v9, p4

    .line 6
    .line 7
    if-ne v8, v0, :cond_0

    .line 8
    .line 9
    move/from16 v1, p6

    .line 10
    .line 11
    if-ne v9, v1, :cond_0

    .line 12
    .line 13
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideY()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    mul-int v5, v5, p2

    .line 30
    .line 31
    add-int v5, p1, v5

    .line 32
    .line 33
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 34
    .line 35
    .line 36
    div-int/lit8 v5, p1, 0x2

    .line 37
    .line 38
    div-int/lit8 v6, p2, 0x2

    .line 39
    .line 40
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideU()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    mul-int/2addr v7, v6

    .line 45
    add-int/2addr v7, v5

    .line 46
    invoke-virtual {v3, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 47
    .line 48
    .line 49
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideV()I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    mul-int/2addr v6, v7

    .line 54
    add-int/2addr v5, v6

    .line 55
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->retain()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    move-object v5, v3

    .line 66
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideY()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    move-object v6, v4

    .line 75
    move-object v4, v5

    .line 76
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideU()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    invoke-interface/range {p0 .. p0}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideV()I

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    new-instance v8, Ll/dmq;

    .line 89
    .line 90
    move-object/from16 v10, p0

    .line 91
    .line 92
    invoke-direct {v8, v10}, Ll/dmq;-><init>(Lcom/momo/rtcbase/VideoFrame$I420Buffer;)V

    .line 93
    .line 94
    .line 95
    invoke-static/range {v0 .. v8}, Lcom/momo/rtcbase/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/momo/rtcbase/JavaI420Buffer;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    return-object v0

    .line 100
    :cond_0
    move-object/from16 v10, p0

    .line 101
    .line 102
    invoke-static/range {p5 .. p6}, Lcom/momo/rtcbase/JavaI420Buffer;->allocate(II)Lcom/momo/rtcbase/JavaI420Buffer;

    .line 103
    .line 104
    .line 105
    move-result-object v18

    .line 106
    invoke-interface {v10}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v10}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideY()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-interface {v10}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-interface {v10}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideU()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    invoke-interface {v10}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-interface {v10}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideV()I

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    invoke-virtual/range {v18 .. v18}, Lcom/momo/rtcbase/JavaI420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    .line 133
    move-result-object v10

    .line 134
    invoke-virtual/range {v18 .. v18}, Lcom/momo/rtcbase/JavaI420Buffer;->getStrideY()I

    .line 135
    .line 136
    .line 137
    move-result v11

    .line 138
    invoke-virtual/range {v18 .. v18}, Lcom/momo/rtcbase/JavaI420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    .line 141
    move-result-object v12

    .line 142
    invoke-virtual/range {v18 .. v18}, Lcom/momo/rtcbase/JavaI420Buffer;->getStrideU()I

    .line 143
    .line 144
    .line 145
    move-result v13

    .line 146
    invoke-virtual/range {v18 .. v18}, Lcom/momo/rtcbase/JavaI420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    move-result-object v14

    .line 150
    invoke-virtual/range {v18 .. v18}, Lcom/momo/rtcbase/JavaI420Buffer;->getStrideV()I

    .line 151
    .line 152
    .line 153
    move-result v15

    .line 154
    move/from16 v6, p1

    .line 155
    .line 156
    move/from16 v7, p2

    .line 157
    .line 158
    move/from16 v16, p5

    .line 159
    .line 160
    move/from16 v17, p6

    .line 161
    .line 162
    invoke-static/range {v0 .. v17}, Lcom/momo/rtcbase/JavaI420Buffer;->nativeCropAndScaleI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIIIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 163
    .line 164
    .line 165
    return-object v18
.end method

.method private static native nativeCropAndScaleI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIIIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method

.method public static wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/momo/rtcbase/JavaI420Buffer;
    .locals 10

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
    move-result v3

    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->isDirect()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    invoke-virtual/range {p6 .. p6}, Ljava/nio/ByteBuffer;->isDirect()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual/range {p6 .. p6}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    add-int/lit8 v0, p0, 0x1

    .line 39
    .line 40
    div-int/lit8 v0, v0, 0x2

    .line 41
    .line 42
    add-int/lit8 v4, p1, 0x1

    .line 43
    .line 44
    div-int/lit8 v4, v4, 0x2

    .line 45
    .line 46
    invoke-static {v3, p0, p1, p3}, Lcom/momo/rtcbase/JavaI420Buffer;->checkCapacity(Ljava/nio/ByteBuffer;III)V

    .line 47
    .line 48
    .line 49
    invoke-static {v5, v0, v4, p5}, Lcom/momo/rtcbase/JavaI420Buffer;->checkCapacity(Ljava/nio/ByteBuffer;III)V

    .line 50
    .line 51
    .line 52
    move/from16 v9, p7

    .line 53
    .line 54
    invoke-static {v7, v0, v4, v9}, Lcom/momo/rtcbase/JavaI420Buffer;->checkCapacity(Ljava/nio/ByteBuffer;III)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lcom/momo/rtcbase/JavaI420Buffer;

    .line 58
    .line 59
    move v1, p0

    .line 60
    move v2, p1

    .line 61
    move v4, p3

    .line 62
    move v6, p5

    .line 63
    move v8, v9

    .line 64
    move-object/from16 v9, p8

    .line 65
    .line 66
    invoke-direct/range {v0 .. v9}, Lcom/momo/rtcbase/JavaI420Buffer;-><init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-object v0

    .line 70
    :cond_0
    const-string v1, "Data buffers must be direct byte buffers."

    .line 71
    .line 72
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-object v0

    .line 76
    :cond_1
    const-string v1, "Data buffers cannot be null."

    .line 77
    .line 78
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-object v0
.end method


# virtual methods
.method public cropAndScale(IIIIII)Lcom/momo/rtcbase/VideoFrame$Buffer;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, Lcom/momo/rtcbase/JavaI420Buffer;->cropAndScaleI420(Lcom/momo/rtcbase/VideoFrame$I420Buffer;IIIIII)Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDataU()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->dataU:Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->dataV:Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->dataY:Ljava/nio/ByteBuffer;

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
    iget p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideU()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->strideU:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideV()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->strideV:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->strideY:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/RefCountDelegate;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/JavaI420Buffer;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/RefCountDelegate;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/JavaI420Buffer;->retain()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method
