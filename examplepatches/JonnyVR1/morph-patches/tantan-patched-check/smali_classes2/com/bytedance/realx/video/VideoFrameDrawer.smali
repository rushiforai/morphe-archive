.class public Lcom/bytedance/realx/video/VideoFrameDrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;
    }
.end annotation


# static fields
.field static final srcPoints:[F


# instance fields
.field private final dstPoints:[F

.field private lastI420Frame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private renderHeight:I

.field private final renderMatrix:Landroid/graphics/Matrix;

.field private final renderSize:Landroid/graphics/Point;

.field private renderWidth:I

.field private final yuvUploader:Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;


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
    sput-object v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->srcPoints:[F

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
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->dstPoints:[F

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderSize:Landroid/graphics/Point;

    .line 15
    .line 16
    new-instance v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;-><init>(Lcom/bytedance/realx/video/VideoFrameDrawer$1;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->yuvUploader:Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

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
    iput p1, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderWidth:I

    .line 4
    .line 5
    iput p2, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderHeight:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->dstPoints:[F

    .line 9
    .line 10
    sget-object v1, Lcom/bytedance/realx/video/VideoFrameDrawer;->srcPoints:[F

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
    iget-object v1, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->dstPoints:[F

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
    invoke-static {p1, p2, v0, v1}, Lcom/bytedance/realx/video/VideoFrameDrawer;->distance(FFFF)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderWidth:I

    .line 55
    .line 56
    iget-object p1, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->dstPoints:[F

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
    invoke-static {p2, p3, v0, p1}, Lcom/bytedance/realx/video/VideoFrameDrawer;->distance(FFFF)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderHeight:I

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

.method public static drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getAndroidTextureMatrix()Landroid/graphics/Matrix;

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
    sget-object v0, Lcom/bytedance/realx/video/VideoFrameDrawer$1;->$SwitchMap$com$bytedance$realx$video$RXPixelFormat:[I

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;

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
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getTextureId()I

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
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getTextureId()I

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
.method public drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 1

    const/4 v0, 0x0

    .line 272
    invoke-virtual {p0, p1, p2, v0}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V

    return-void
.end method

.method public drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V
    .locals 8

    .line 270
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedWidth()I

    move-result v6

    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedHeight()I

    move-result v7

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 271
    invoke-virtual/range {v0 .. v7}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    return-void
.end method

.method public drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V
    .locals 16
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
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-nez v3, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    :try_start_0
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedWidth()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedHeight()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-direct {v0, v4, v5, v2}, Lcom/bytedance/realx/video/VideoFrameDrawer;->calculateTransformedRenderSize(IILandroid/graphics/Matrix;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    sget-object v5, Lcom/bytedance/realx/video/RXVideoMemoryType;->kOPENGL_TEXTURE:Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 33
    .line 34
    if-ne v4, v5, :cond_2

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    const/4 v4, 0x0

    .line 39
    :goto_1
    iget-object v5, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 40
    .line 41
    invoke-virtual {v5}, Landroid/graphics/Matrix;->reset()V

    .line 42
    .line 43
    .line 44
    iget-object v5, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 45
    .line 46
    const/high16 v6, 0x3f000000    # 0.5f

    .line 47
    .line 48
    invoke-virtual {v5, v6, v6}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 49
    .line 50
    .line 51
    if-nez v4, :cond_3

    .line 52
    .line 53
    iget-object v5, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 54
    .line 55
    const/high16 v6, 0x3f800000    # 1.0f

    .line 56
    .line 57
    const/high16 v7, -0x40800000    # -1.0f

    .line 58
    .line 59
    invoke-virtual {v5, v6, v7}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :catchall_0
    move-exception v0

    .line 64
    goto/16 :goto_4

    .line 65
    .line 66
    :cond_3
    :goto_2
    iget-object v5, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotation()Lcom/bytedance/realx/video/RXVideoRotation;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {v6}, Lcom/bytedance/realx/video/RXVideoRotation;->value()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    int-to-float v6, v6

    .line 77
    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 78
    .line 79
    .line 80
    iget-object v5, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 81
    .line 82
    const/high16 v6, -0x41000000    # -0.5f

    .line 83
    .line 84
    invoke-virtual {v5, v6, v6}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 85
    .line 86
    .line 87
    if-eqz v2, :cond_4

    .line 88
    .line 89
    iget-object v5, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 90
    .line 91
    invoke-virtual {v5, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 92
    .line 93
    .line 94
    :cond_4
    if-eqz v4, :cond_6

    .line 95
    .line 96
    iget v2, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderWidth:I

    .line 97
    .line 98
    if-lez v2, :cond_6

    .line 99
    .line 100
    move-object v5, v3

    .line 101
    check-cast v5, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;

    .line 102
    .line 103
    invoke-interface {v5}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getScaleFilter()Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1}, Lcom/bytedance/realx/video/RXVideoScaleFilter;->value()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-static {v1}, Lcom/bytedance/realx/video/FilterType;->fromValue(I)Lcom/bytedance/realx/video/FilterType;

    .line 112
    .line 113
    .line 114
    move-result-object v13

    .line 115
    invoke-interface {v5}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getUnScaledWidth()I

    .line 116
    .line 117
    .line 118
    move-result v14

    .line 119
    invoke-interface {v5}, Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;->getUnScaledHeight()I

    .line 120
    .line 121
    .line 122
    move-result v15

    .line 123
    const/4 v1, 0x0

    .line 124
    iput-object v1, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 125
    .line 126
    if-eqz v13, :cond_5

    .line 127
    .line 128
    sget-object v1, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 129
    .line 130
    if-eq v13, v1, :cond_5

    .line 131
    .line 132
    if-eqz v14, :cond_5

    .line 133
    .line 134
    if-eqz v15, :cond_5

    .line 135
    .line 136
    iget-object v6, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 137
    .line 138
    iget v7, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderWidth:I

    .line 139
    .line 140
    iget v8, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderHeight:I

    .line 141
    .line 142
    move-object/from16 v4, p2

    .line 143
    .line 144
    move/from16 v9, p4

    .line 145
    .line 146
    move/from16 v10, p5

    .line 147
    .line 148
    move/from16 v11, p6

    .line 149
    .line 150
    move/from16 v12, p7

    .line 151
    .line 152
    invoke-static/range {v4 .. v15}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 153
    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_5
    iget-object v6, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 157
    .line 158
    iget v7, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderWidth:I

    .line 159
    .line 160
    iget v8, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderHeight:I

    .line 161
    .line 162
    sget-object v13, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 163
    .line 164
    const/4 v14, 0x0

    .line 165
    const/4 v15, 0x0

    .line 166
    move-object/from16 v4, p2

    .line 167
    .line 168
    move/from16 v9, p4

    .line 169
    .line 170
    move/from16 v10, p5

    .line 171
    .line 172
    move/from16 v11, p6

    .line 173
    .line 174
    move/from16 v12, p7

    .line 175
    .line 176
    invoke-static/range {v4 .. v15}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 177
    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_6
    iget-object v2, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 181
    .line 182
    if-eq v1, v2, :cond_9

    .line 183
    .line 184
    iput-object v1, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 185
    .line 186
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->toI420()Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 187
    .line 188
    .line 189
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    if-nez v1, :cond_7

    .line 191
    .line 192
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_7
    :try_start_1
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    instance-of v4, v2, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 201
    .line 202
    if-nez v4, :cond_8

    .line 203
    .line 204
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    .line 206
    .line 207
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_8
    :try_start_2
    iget-object v4, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->yuvUploader:Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;

    .line 212
    .line 213
    move-object v5, v2

    .line 214
    check-cast v5, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;

    .line 215
    .line 216
    invoke-virtual {v4, v5}, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->uploadFromBuffer(Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;)[I

    .line 217
    .line 218
    .line 219
    invoke-interface {v2}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 220
    .line 221
    .line 222
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 223
    .line 224
    .line 225
    :cond_9
    iget-object v1, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->yuvUploader:Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;

    .line 226
    .line 227
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->getYuvTextures()[I

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    iget-object v1, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderMatrix:Landroid/graphics/Matrix;

    .line 232
    .line 233
    invoke-static {v1}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    iget v7, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderWidth:I

    .line 238
    .line 239
    iget v8, v0, Lcom/bytedance/realx/video/VideoFrameDrawer;->renderHeight:I

    .line 240
    .line 241
    sget-object v13, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 242
    .line 243
    const/4 v14, 0x0

    .line 244
    const/4 v15, 0x0

    .line 245
    move-object/from16 v4, p2

    .line 246
    .line 247
    move/from16 v9, p4

    .line 248
    .line 249
    move/from16 v10, p5

    .line 250
    .line 251
    move/from16 v11, p6

    .line 252
    .line 253
    move/from16 v12, p7

    .line 254
    .line 255
    invoke-interface/range {v4 .. v15}, Lcom/bytedance/realx/video/RendererCommon$GlDrawer;->drawYuv([I[FIIIIIILcom/bytedance/realx/video/FilterType;II)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 256
    .line 257
    .line 258
    :goto_3
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :goto_4
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 263
    .line 264
    .line 265
    throw v0

    .line 266
    :catch_0
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->yuvUploader:Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->release()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer;->lastI420Frame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 8
    .line 9
    return-void
.end method
