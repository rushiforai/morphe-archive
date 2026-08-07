.class public Lcom/momo/rtcbase/VideoFrameDrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;
    }
.end annotation


# static fields
.field static final srcPoints:[F


# instance fields
.field private final dstPoints:[F

.field private lastI420Frame:Lcom/momo/rtcbase/VideoFrame;

.field private renderHeight:I

.field private final renderMatrix:Landroid/graphics/Matrix;

.field private final renderSize:Landroid/graphics/Point;

.field private renderWidth:I

.field private final yuvUploader:Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/momo/rtcbase/VideoFrameDrawer;->srcPoints:[F

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->dstPoints:[F

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderSize:Landroid/graphics/Point;

    .line 15
    .line 16
    new-instance v0, Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;-><init>(Lcom/momo/rtcbase/VideoFrameDrawer$1;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->yuvUploader:Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 30
    .line 31
    return-void
.end method

.method private calculateTransformedRenderSize(IILandroid/graphics/Matrix;)V
    .locals 6

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderWidth:I

    .line 4
    .line 5
    iput p2, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderHeight:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->dstPoints:[F

    .line 9
    .line 10
    sget-object v1, Lcom/momo/rtcbase/VideoFrameDrawer;->srcPoints:[F

    .line 11
    .line 12
    invoke-virtual {p3, v0, v1}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    .line 13
    .line 14
    .line 15
    const/4 p3, 0x0

    .line 16
    move v0, p3

    .line 17
    :goto_0
    iget-object v1, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->dstPoints:[F

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    const/4 v3, 0x1

    .line 21
    if-ge v0, v2, :cond_1

    .line 22
    .line 23
    mul-int/lit8 v2, v0, 0x2

    .line 24
    .line 25
    aget v4, v1, v2

    .line 26
    .line 27
    int-to-float v5, p1

    .line 28
    mul-float/2addr v4, v5

    .line 29
    aput v4, v1, v2

    .line 30
    .line 31
    add-int/2addr v2, v3

    .line 32
    aget v3, v1, v2

    .line 33
    .line 34
    int-to-float v4, p2

    .line 35
    mul-float/2addr v3, v4

    .line 36
    aput v3, v1, v2

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    aget p1, v1, p3

    .line 42
    .line 43
    aget p2, v1, v3

    .line 44
    .line 45
    const/4 v0, 0x2

    .line 46
    aget v0, v1, v0

    .line 47
    .line 48
    aget v1, v1, v2

    .line 49
    .line 50
    invoke-static {p1, p2, v0, v1}, Lcom/momo/rtcbase/VideoFrameDrawer;->distance(FFFF)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderWidth:I

    .line 55
    .line 56
    iget-object p1, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->dstPoints:[F

    .line 57
    .line 58
    aget p2, p1, p3

    .line 59
    .line 60
    aget p3, p1, v3

    .line 61
    .line 62
    const/4 v0, 0x4

    .line 63
    aget v0, p1, v0

    .line 64
    .line 65
    const/4 v1, 0x5

    .line 66
    aget p1, p1, v1

    .line 67
    .line 68
    invoke-static {p2, p3, v0, p1}, Lcom/momo/rtcbase/VideoFrameDrawer;->distance(FFFF)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderHeight:I

    .line 73
    .line 74
    return-void
.end method

.method private static distance(FFFF)I
    .locals 2

    .line 1
    sub-float/2addr p2, p0

    .line 2
    float-to-double v0, p2

    .line 3
    sub-float/2addr p3, p1

    .line 4
    float-to-double p0, p3

    .line 5
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->hypot(DD)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    long-to-int p0, p0

    .line 14
    return p0
.end method

.method public static drawTexture(Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIII)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lcom/momo/rtcbase/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget-object v0, Lcom/momo/rtcbase/VideoFrameDrawer$1;->$SwitchMap$com$momo$rtcbase$VideoFrame$TextureBuffer$Type:[I

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;->getType()Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    aget v0, v0, v1

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    if-ne v0, v1, :cond_0

    .line 34
    .line 35
    invoke-interface {p1}, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;->getTextureId()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-interface/range {p0 .. p8}, Lcom/momo/rtcbase/RendererCommon$GlDrawer;->drawRgb(I[FIIIIII)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const-string p0, "Unknown texture type."

    .line 44
    .line 45
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-interface {p1}, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;->getTextureId()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-interface/range {p0 .. p8}, Lcom/momo/rtcbase/RendererCommon$GlDrawer;->drawOes(I[FIIIIII)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;)V
    .locals 1

    const/4 v0, 0x0

    .line 157
    invoke-virtual {p0, p1, p2, v0}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V

    return-void
.end method

.method public drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V
    .locals 8

    .line 155
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotatedWidth()I

    move-result v6

    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotatedHeight()I

    move-result v7

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 156
    invoke-virtual/range {v0 .. v7}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    return-void
.end method

.method public drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->getRotatedWidth()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->getRotatedHeight()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    invoke-direct {v0, v3, v4, v2}, Lcom/momo/rtcbase/VideoFrameDrawer;->calculateTransformedRenderSize(IILandroid/graphics/Matrix;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v3, v3, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 23
    .line 24
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 27
    .line 28
    .line 29
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 30
    .line 31
    const/high16 v5, 0x3f000000    # 0.5f

    .line 32
    .line 33
    invoke-virtual {v4, v5, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 34
    .line 35
    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 39
    .line 40
    const/high16 v5, 0x3f800000    # 1.0f

    .line 41
    .line 42
    const/high16 v6, -0x40800000    # -1.0f

    .line 43
    .line 44
    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->getRotation()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    int-to-float v5, v5

    .line 54
    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 55
    .line 56
    .line 57
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 58
    .line 59
    const/high16 v5, -0x41000000    # -0.5f

    .line 60
    .line 61
    invoke-virtual {v4, v5, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 62
    .line 63
    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-virtual {v4, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    if-eqz v3, :cond_2

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    iput-object v2, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->lastI420Frame:Lcom/momo/rtcbase/VideoFrame;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    move-object v3, v1

    .line 81
    check-cast v3, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 82
    .line 83
    iget-object v4, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 84
    .line 85
    iget v5, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderWidth:I

    .line 86
    .line 87
    iget v6, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderHeight:I

    .line 88
    .line 89
    move-object/from16 v2, p2

    .line 90
    .line 91
    move/from16 v7, p4

    .line 92
    .line 93
    move/from16 v8, p5

    .line 94
    .line 95
    move/from16 v9, p6

    .line 96
    .line 97
    move/from16 v10, p7

    .line 98
    .line 99
    invoke-static/range {v2 .. v10}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawTexture(Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIII)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    iget-object v2, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->lastI420Frame:Lcom/momo/rtcbase/VideoFrame;

    .line 104
    .line 105
    if-eq v1, v2, :cond_3

    .line 106
    .line 107
    iput-object v1, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->lastI420Frame:Lcom/momo/rtcbase/VideoFrame;

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iget-object v2, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->yuvUploader:Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;

    .line 118
    .line 119
    invoke-virtual {v2, v1}, Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;->uploadFromBuffer(Lcom/momo/rtcbase/VideoFrame$I420Buffer;)[I

    .line 120
    .line 121
    .line 122
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->release()V

    .line 123
    .line 124
    .line 125
    :cond_3
    iget-object v1, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->yuvUploader:Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;->getYuvTextures()[I

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    iget-object v1, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 132
    .line 133
    invoke-static {v1}, Lcom/momo/rtcbase/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    iget v10, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderWidth:I

    .line 138
    .line 139
    iget v11, v0, Lcom/momo/rtcbase/VideoFrameDrawer;->renderHeight:I

    .line 140
    .line 141
    move-object/from16 v7, p2

    .line 142
    .line 143
    move/from16 v12, p4

    .line 144
    .line 145
    move/from16 v13, p5

    .line 146
    .line 147
    move/from16 v14, p6

    .line 148
    .line 149
    move/from16 v15, p7

    .line 150
    .line 151
    invoke-interface/range {v7 .. v15}, Lcom/momo/rtcbase/RendererCommon$GlDrawer;->drawYuv([I[FIIIIII)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->yuvUploader:Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/VideoFrameDrawer$YuvUploader;->release()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/momo/rtcbase/VideoFrameDrawer;->lastI420Frame:Lcom/momo/rtcbase/VideoFrame;

    .line 8
    .line 9
    return-void
.end method
