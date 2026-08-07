.class public Lcom/ss/bytertc/base/media/VideoFrameDrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;
    }
.end annotation


# static fields
.field static final srcPoints:[F


# instance fields
.field private final dstPoints:[F

.field private lastI420Frame:Lcom/bytedance/realx/video/VideoFrame;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private renderHeight:I

.field private final renderMatrix:Landroid/graphics/Matrix;

.field private final renderSize:Landroid/graphics/Point;

.field private renderWidth:I

.field private final yuvUploader:Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;


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
    sput-object v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->srcPoints:[F

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
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->dstPoints:[F

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderSize:Landroid/graphics/Point;

    .line 15
    .line 16
    new-instance v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, v1}, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;-><init>(Lcom/ss/bytertc/base/media/VideoFrameDrawer$1;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->yuvUploader:Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 30
    .line 31
    return-void
.end method

.method private calculateTransformedRenderSize(IILandroid/graphics/Matrix;)V
    .locals 6
    .param p3    # Landroid/graphics/Matrix;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderWidth:I

    .line 4
    .line 5
    iput p2, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderHeight:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->dstPoints:[F

    .line 9
    .line 10
    sget-object v1, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->srcPoints:[F

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
    iget-object v1, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->dstPoints:[F

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
    invoke-static {p1, p2, v0, v1}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->distance(FFFF)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderWidth:I

    .line 55
    .line 56
    iget-object p1, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->dstPoints:[F

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
    invoke-static {p2, p3, v0, p1}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->distance(FFFF)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderHeight:I

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

.method public static drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getTransformMatrix()Landroid/graphics/Matrix;

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
    invoke-static {v0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget-object v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$1;->$SwitchMap$com$bytedance$realx$video$VideoFrame$TextureBuffer$Type:[I

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

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
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getTextureId()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-interface/range {p0 .. p11}, Lcom/bytedance/realx/video/RendererCommon$GlDrawer;->drawRgb(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V

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
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getTextureId()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-interface/range {p0 .. p11}, Lcom/bytedance/realx/video/RendererCommon$GlDrawer;->drawOes(I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public drawFrame(Lcom/bytedance/realx/video/VideoFrame;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 1

    const/4 v0, 0x0

    .line 257
    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/VideoFrame;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V

    return-void
.end method

.method public drawFrame(Lcom/bytedance/realx/video/VideoFrame;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V
    .locals 8

    .line 255
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getRotatedWidth()I

    move-result v6

    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getRotatedHeight()I

    move-result v7

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 256
    invoke-virtual/range {v0 .. v7}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/VideoFrame;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    return-void
.end method

.method public drawFrame(Lcom/bytedance/realx/video/VideoFrame;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V
    .locals 27
    .param p3    # Landroid/graphics/Matrix;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

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
    :try_start_0
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getRotatedWidth()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getRotatedHeight()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    invoke-direct {v0, v3, v4, v2}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->calculateTransformedRenderSize(IILandroid/graphics/Matrix;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v3, v3, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 23
    .line 24
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 27
    .line 28
    .line 29
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

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
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

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
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getRotation()I

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
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

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
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-virtual {v4, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    if-eqz v3, :cond_3

    .line 72
    .line 73
    iget v2, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderWidth:I

    .line 74
    .line 75
    if-lez v2, :cond_3

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 82
    .line 83
    invoke-interface {v2}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getScaleFilter()Lcom/bytedance/realx/video/FilterType;

    .line 84
    .line 85
    .line 86
    move-result-object v12

    .line 87
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 92
    .line 93
    invoke-interface {v2}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getUnscaledWidth()I

    .line 94
    .line 95
    .line 96
    move-result v13

    .line 97
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 102
    .line 103
    invoke-interface {v2}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getUnscaledHeight()I

    .line 104
    .line 105
    .line 106
    move-result v14

    .line 107
    const/4 v2, 0x0

    .line 108
    iput-object v2, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/VideoFrame;

    .line 109
    .line 110
    if-eqz v12, :cond_2

    .line 111
    .line 112
    sget-object v2, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 113
    .line 114
    if-eq v12, v2, :cond_2

    .line 115
    .line 116
    if-eqz v13, :cond_2

    .line 117
    .line 118
    if-eqz v14, :cond_2

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    move-object v4, v1

    .line 125
    check-cast v4, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 126
    .line 127
    iget-object v5, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 128
    .line 129
    iget v6, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderWidth:I

    .line 130
    .line 131
    iget v7, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderHeight:I

    .line 132
    .line 133
    move-object/from16 v3, p2

    .line 134
    .line 135
    move/from16 v8, p4

    .line 136
    .line 137
    move/from16 v9, p5

    .line 138
    .line 139
    move/from16 v10, p6

    .line 140
    .line 141
    move/from16 v11, p7

    .line 142
    .line 143
    invoke-static/range {v3 .. v14}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_2
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    move-object/from16 v16, v1

    .line 152
    .line 153
    check-cast v16, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 154
    .line 155
    iget-object v1, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 156
    .line 157
    iget v2, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderWidth:I

    .line 158
    .line 159
    iget v0, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderHeight:I

    .line 160
    .line 161
    sget-object v24, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 162
    .line 163
    const/16 v25, 0x0

    .line 164
    .line 165
    const/16 v26, 0x0

    .line 166
    .line 167
    move-object/from16 v15, p2

    .line 168
    .line 169
    move/from16 v20, p4

    .line 170
    .line 171
    move/from16 v21, p5

    .line 172
    .line 173
    move/from16 v22, p6

    .line 174
    .line 175
    move/from16 v23, p7

    .line 176
    .line 177
    move/from16 v19, v0

    .line 178
    .line 179
    move-object/from16 v17, v1

    .line 180
    .line 181
    move/from16 v18, v2

    .line 182
    .line 183
    invoke-static/range {v15 .. v26}, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_3
    iget-object v2, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/VideoFrame;

    .line 188
    .line 189
    if-eq v1, v2, :cond_4

    .line 190
    .line 191
    iput-object v1, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/VideoFrame;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    if-eqz v2, :cond_4

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-interface {v1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    iget-object v2, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->yuvUploader:Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;

    .line 208
    .line 209
    invoke-virtual {v2, v1}, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->uploadFromBuffer(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;)[I

    .line 210
    .line 211
    .line 212
    invoke-interface {v1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->release()V

    .line 213
    .line 214
    .line 215
    :cond_4
    iget-object v1, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->yuvUploader:Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;

    .line 216
    .line 217
    invoke-virtual {v1}, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->getYuvTextures()[I

    .line 218
    .line 219
    .line 220
    move-result-object v16

    .line 221
    iget-object v1, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 222
    .line 223
    invoke-static {v1}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 224
    .line 225
    .line 226
    move-result-object v17

    .line 227
    iget v1, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderWidth:I

    .line 228
    .line 229
    iget v0, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->renderHeight:I

    .line 230
    .line 231
    sget-object v24, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 232
    .line 233
    const/16 v25, 0x0

    .line 234
    .line 235
    const/16 v26, 0x0

    .line 236
    .line 237
    move-object/from16 v15, p2

    .line 238
    .line 239
    move/from16 v20, p4

    .line 240
    .line 241
    move/from16 v21, p5

    .line 242
    .line 243
    move/from16 v22, p6

    .line 244
    .line 245
    move/from16 v23, p7

    .line 246
    .line 247
    move/from16 v19, v0

    .line 248
    .line 249
    move/from16 v18, v1

    .line 250
    .line 251
    invoke-interface/range {v15 .. v26}, Lcom/bytedance/realx/video/RendererCommon$GlDrawer;->drawYuv([I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    .line 253
    .line 254
    :catch_0
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->yuvUploader:Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->release()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/VideoFrame;

    .line 8
    .line 9
    return-void
.end method
