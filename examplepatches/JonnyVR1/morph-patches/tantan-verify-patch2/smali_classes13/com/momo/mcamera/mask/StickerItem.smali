.class public Lcom/momo/mcamera/mask/StickerItem;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final STICKER_MMTIME_PER_FRAME:I

.field protected context:Landroid/content/Context;

.field public finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

.field public fvertexBuffer:Ljava/nio/FloatBuffer;

.field private hasShowed:Z

.field private hasShowedThisTrigger:Z

.field private hiddenFrameCount:I

.field public imageHeight:F

.field public imageWidth:F

.field public isDraw:Z

.field private isHiddenFrame:Z

.field private isPlaying:Z

.field public isTriggered:Z

.field private lastRenderTime:J

.field private lastShouldShow:Z

.field private mEffectTimeBean:Ll/ore;

.field protected mProjectionMatrix:[F

.field mRenderTime:J

.field public mStickerDuration:J

.field public final mViewMatrix:[F

.field public maskListLock:Ljava/lang/Object;

.field public maskLock:Ljava/lang/Object;

.field public mmcvImage:Ll/umw;

.field protected mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

.field public mvpLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field private needPlayLoop:Z

.field protected needUpdateSticker:Z

.field startTime:J

.field public sticker:Lcom/momo/mcamera/mask/Sticker;

.field public stickerScale:F

.field stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

.field public texData0:[F

.field public texture_sticker:I

.field public vertexBuffer:Ljava/nio/FloatBuffer;

.field public vertexBuffer2:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x32

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/StickerItem;->STICKER_MMTIME_PER_FRAME:I

    .line 7
    .line 8
    const/16 v0, 0x10

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mViewMatrix:[F

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->needUpdateSticker:Z

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    iput v2, p0, Lcom/momo/mcamera/mask/StickerItem;->imageWidth:F

    .line 19
    .line 20
    iput v2, p0, Lcom/momo/mcamera/mask/StickerItem;->imageHeight:F

    .line 21
    .line 22
    const-wide/16 v2, -0x1

    .line 23
    .line 24
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 25
    .line 26
    new-instance v4, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->maskLock:Ljava/lang/Object;

    .line 32
    .line 33
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->mRenderTime:J

    .line 34
    .line 35
    new-instance v4, Ljava/lang/Object;

    .line 36
    .line 37
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->maskListLock:Ljava/lang/Object;

    .line 41
    .line 42
    new-instance v4, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v4}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iput-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 54
    .line 55
    const/4 v4, 0x1

    .line 56
    iput-boolean v4, p0, Lcom/momo/mcamera/mask/StickerItem;->lastShouldShow:Z

    .line 57
    .line 58
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->hasShowed:Z

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isTriggered:Z

    .line 61
    .line 62
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 63
    .line 64
    iput v1, p0, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 65
    .line 66
    iput-boolean v4, p0, Lcom/momo/mcamera/mask/StickerItem;->needPlayLoop:Z

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    iput-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->mEffectTimeBean:Ll/ore;

    .line 70
    .line 71
    const-wide/16 v2, 0x0

    .line 72
    .line 73
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->lastRenderTime:J

    .line 74
    .line 75
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 76
    .line 77
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerItem;->context:Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->initCoordinate()V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 83
    .line 84
    .line 85
    const/high16 p0, -0x40800000    # -1.0f

    .line 86
    .line 87
    aput p0, v0, v1

    .line 88
    .line 89
    return-void
.end method

.method private checkUpdateHidenFrameCnt()Z
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mRenderTime:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->lastRenderTime:J

    .line 4
    .line 5
    sub-long v2, v0, v2

    .line 6
    .line 7
    const-wide/16 v4, 0x32

    .line 8
    .line 9
    cmp-long v2, v2, v4

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->lastRenderTime:J

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private resumeDisplay()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->startPlay()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->maskLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getDelegateBitmap()Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getEffectTimeBean()Ll/ore;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mEffectTimeBean:Ll/ore;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEscapedTime()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    return-wide v2

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    return-wide v0
.end method

.method public getLockObject()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->maskLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMMcvImageLoader()Lcom/momo/mcamera/mask/MmcvImageLoader;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isUseImageCache()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->context:Landroid/content/Context;

    .line 14
    .line 15
    invoke-direct {v0, v1, p0}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    new-instance p0, Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 20
    .line 21
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/MmcvImageLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public getMmcvImage(Landroid/content/Context;)Ll/umw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getStickerAspectRatio()F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr v0, v1

    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr v0, p0

    .line 21
    return v0

    .line 22
    :cond_0
    return v1
.end method

.method public initCoordinate()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    div-float/2addr v1, v2

    .line 18
    iput v1, v0, Lcom/momo/mcamera/mask/StickerItem;->stickerScale:F

    .line 19
    .line 20
    const/high16 v2, 0x3f000000    # 0.5f

    .line 21
    .line 22
    mul-float v3, v1, v2

    .line 23
    .line 24
    const/high16 v4, -0x41000000    # -0.5f

    .line 25
    .line 26
    mul-float v5, v4, v1

    .line 27
    .line 28
    mul-float v6, v4, v1

    .line 29
    .line 30
    mul-float/2addr v1, v2

    .line 31
    const/16 v7, 0x8

    .line 32
    .line 33
    new-array v8, v7, [F

    .line 34
    .line 35
    const/4 v9, 0x0

    .line 36
    aput v4, v8, v9

    .line 37
    .line 38
    const/4 v10, 0x1

    .line 39
    aput v3, v8, v10

    .line 40
    .line 41
    const/4 v3, 0x2

    .line 42
    aput v4, v8, v3

    .line 43
    .line 44
    const/4 v11, 0x3

    .line 45
    aput v5, v8, v11

    .line 46
    .line 47
    const/4 v5, 0x4

    .line 48
    aput v2, v8, v5

    .line 49
    .line 50
    const/4 v12, 0x5

    .line 51
    aput v6, v8, v12

    .line 52
    .line 53
    const/4 v6, 0x6

    .line 54
    aput v2, v8, v6

    .line 55
    .line 56
    const/4 v13, 0x7

    .line 57
    aput v1, v8, v13

    .line 58
    .line 59
    const/16 v1, 0x20

    .line 60
    .line 61
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    move-result-object v14

    .line 65
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 66
    .line 67
    .line 68
    move-result-object v15

    .line 69
    invoke-virtual {v14, v15}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    .line 75
    move-result-object v14

    .line 76
    iput-object v14, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    invoke-virtual {v14, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 79
    .line 80
    .line 81
    iget-object v14, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    invoke-virtual {v14, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 91
    .line 92
    .line 93
    move-result-object v14

    .line 94
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer2:Ljava/nio/FloatBuffer;

    .line 102
    .line 103
    invoke-virtual {v1, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    .line 106
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer2:Ljava/nio/FloatBuffer;

    .line 107
    .line 108
    invoke-virtual {v1, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 109
    .line 110
    .line 111
    iget v1, v0, Lcom/momo/mcamera/mask/StickerItem;->stickerScale:F

    .line 112
    .line 113
    mul-float v8, v1, v2

    .line 114
    .line 115
    mul-float v14, v4, v1

    .line 116
    .line 117
    mul-float v15, v4, v1

    .line 118
    .line 119
    mul-float/2addr v1, v2

    .line 120
    move/from16 v16, v2

    .line 121
    .line 122
    const/16 v2, 0x10

    .line 123
    .line 124
    new-array v2, v2, [F

    .line 125
    .line 126
    aput v4, v2, v9

    .line 127
    .line 128
    aput v8, v2, v10

    .line 129
    .line 130
    const/4 v8, 0x0

    .line 131
    aput v8, v2, v3

    .line 132
    .line 133
    const/high16 v3, 0x3f800000    # 1.0f

    .line 134
    .line 135
    aput v3, v2, v11

    .line 136
    .line 137
    aput v4, v2, v5

    .line 138
    .line 139
    aput v14, v2, v12

    .line 140
    .line 141
    aput v8, v2, v6

    .line 142
    .line 143
    aput v3, v2, v13

    .line 144
    .line 145
    aput v16, v2, v7

    .line 146
    .line 147
    const/16 v4, 0x9

    .line 148
    .line 149
    aput v15, v2, v4

    .line 150
    .line 151
    const/16 v4, 0xa

    .line 152
    .line 153
    aput v8, v2, v4

    .line 154
    .line 155
    const/16 v4, 0xb

    .line 156
    .line 157
    aput v3, v2, v4

    .line 158
    .line 159
    const/16 v4, 0xc

    .line 160
    .line 161
    aput v16, v2, v4

    .line 162
    .line 163
    const/16 v4, 0xd

    .line 164
    .line 165
    aput v1, v2, v4

    .line 166
    .line 167
    const/16 v1, 0xe

    .line 168
    .line 169
    aput v8, v2, v1

    .line 170
    .line 171
    const/16 v1, 0xf

    .line 172
    .line 173
    aput v3, v2, v1

    .line 174
    .line 175
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerItem;->texData0:[F

    .line 176
    .line 177
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->mViewMatrix:[F

    .line 178
    .line 179
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 180
    .line 181
    .line 182
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->mViewMatrix:[F

    .line 183
    .line 184
    const/high16 v2, -0x40800000    # -1.0f

    .line 185
    .line 186
    aput v2, v1, v9

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerItem;->getMMcvImageLoader()Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 193
    .line 194
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setCurrentTime(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MmcvImageLoader;->setCurrentTime(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 9
    .line 10
    invoke-virtual {v0, v2, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->triggerTypeProcess(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getHiddenObjectTriggerType()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_2

    .line 41
    .line 42
    :cond_1
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 45
    .line 46
    iget-boolean v3, p0, Lcom/momo/mcamera/mask/StickerItem;->isTriggered:Z

    .line 47
    .line 48
    invoke-virtual {v0, v2, p1, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->objectTriggerTypeProcess(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Z)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    :cond_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 53
    .line 54
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getMinHiddenFrameCount()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    const/4 v3, 0x0

    .line 59
    if-lez v2, :cond_8

    .line 60
    .line 61
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getHiddenTriggerType()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-gtz v2, :cond_3

    .line 68
    .line 69
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getHiddenObjectTriggerType()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-nez v2, :cond_8

    .line 80
    .line 81
    :cond_3
    if-nez v0, :cond_4

    .line 82
    .line 83
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/StickerItem;->lastShouldShow:Z

    .line 84
    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isHiddenFrame:Z

    .line 88
    .line 89
    :cond_4
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->isNotResetOnHide()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_5

    .line 96
    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    iget v2, p0, Lcom/momo/mcamera/mask/StickerItem;->hiddenFrameCount:I

    .line 100
    .line 101
    if-lez v2, :cond_5

    .line 102
    .line 103
    iput v3, p0, Lcom/momo/mcamera/mask/StickerItem;->hiddenFrameCount:I

    .line 104
    .line 105
    :cond_5
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/StickerItem;->isHiddenFrame:Z

    .line 106
    .line 107
    if-eqz v2, :cond_8

    .line 108
    .line 109
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getMinHiddenFrameCount()I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-lez v2, :cond_6

    .line 116
    .line 117
    iget v2, p0, Lcom/momo/mcamera/mask/StickerItem;->hiddenFrameCount:I

    .line 118
    .line 119
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 120
    .line 121
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getMinHiddenFrameCount()I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    add-int/lit8 v4, v4, 0x2

    .line 126
    .line 127
    if-lt v2, v4, :cond_6

    .line 128
    .line 129
    iput v3, p0, Lcom/momo/mcamera/mask/StickerItem;->hiddenFrameCount:I

    .line 130
    .line 131
    iput-boolean v3, p0, Lcom/momo/mcamera/mask/StickerItem;->isHiddenFrame:Z

    .line 132
    .line 133
    :cond_6
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/StickerItem;->isHiddenFrame:Z

    .line 134
    .line 135
    if-eqz v2, :cond_8

    .line 136
    .line 137
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerItem;->checkUpdateHidenFrameCnt()Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_7

    .line 142
    .line 143
    iget v2, p0, Lcom/momo/mcamera/mask/StickerItem;->hiddenFrameCount:I

    .line 144
    .line 145
    add-int/2addr v2, v1

    .line 146
    iput v2, p0, Lcom/momo/mcamera/mask/StickerItem;->hiddenFrameCount:I

    .line 147
    .line 148
    :cond_7
    move v2, v3

    .line 149
    goto :goto_1

    .line 150
    :cond_8
    move v2, v0

    .line 151
    :goto_1
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/StickerItem;->hasShowedThisTrigger:Z

    .line 152
    .line 153
    if-eqz v4, :cond_a

    .line 154
    .line 155
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 156
    .line 157
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-nez v4, :cond_9

    .line 162
    .line 163
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 164
    .line 165
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    if-lez v4, :cond_a

    .line 170
    .line 171
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 172
    .line 173
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    if-eqz v4, :cond_a

    .line 178
    .line 179
    :cond_9
    move v2, v1

    .line 180
    :cond_a
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 181
    .line 182
    iget v5, v4, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 183
    .line 184
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    sub-int/2addr v4, v1

    .line 189
    if-ne v5, v4, :cond_b

    .line 190
    .line 191
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 192
    .line 193
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    const/4 v5, -0x1

    .line 198
    if-ne v4, v5, :cond_b

    .line 199
    .line 200
    iput-boolean v3, p0, Lcom/momo/mcamera/mask/StickerItem;->needPlayLoop:Z

    .line 201
    .line 202
    :cond_b
    if-eqz v2, :cond_e

    .line 203
    .line 204
    if-eqz v0, :cond_c

    .line 205
    .line 206
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 207
    .line 208
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-eqz v0, :cond_c

    .line 213
    .line 214
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 215
    .line 216
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 217
    .line 218
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    sub-int/2addr v0, v1

    .line 223
    if-ne v4, v0, :cond_c

    .line 224
    .line 225
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 226
    .line 227
    iput v3, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 228
    .line 229
    :cond_c
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerItem;->needPlayLoop:Z

    .line 230
    .line 231
    if-nez v0, :cond_d

    .line 232
    .line 233
    goto/16 :goto_4

    .line 234
    .line 235
    :cond_d
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->startPlay()V

    .line 236
    .line 237
    .line 238
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->hasShowed:Z

    .line 239
    .line 240
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->lastShouldShow:Z

    .line 241
    .line 242
    iput-boolean v3, p0, Lcom/momo/mcamera/mask/StickerItem;->isHiddenFrame:Z

    .line 243
    .line 244
    goto/16 :goto_3

    .line 245
    .line 246
    :cond_e
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 247
    .line 248
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_f

    .line 253
    .line 254
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerItem;->lastShouldShow:Z

    .line 255
    .line 256
    :cond_f
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 257
    .line 258
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-eqz v0, :cond_10

    .line 263
    .line 264
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 265
    .line 266
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 267
    .line 268
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    sub-int/2addr v0, v1

    .line 273
    if-ne v4, v0, :cond_10

    .line 274
    .line 275
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 276
    .line 277
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 278
    .line 279
    if-lez v4, :cond_10

    .line 280
    .line 281
    iput v3, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 282
    .line 283
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerItem;->resumeDisplay()V

    .line 284
    .line 285
    .line 286
    :goto_2
    move v2, v1

    .line 287
    goto :goto_3

    .line 288
    :cond_10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 289
    .line 290
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNoBreakLoop()Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    if-eqz v0, :cond_11

    .line 295
    .line 296
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 297
    .line 298
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 299
    .line 300
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    sub-int/2addr v0, v1

    .line 305
    if-ge v4, v0, :cond_11

    .line 306
    .line 307
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerItem;->hasShowed:Z

    .line 308
    .line 309
    if-eqz v0, :cond_11

    .line 310
    .line 311
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 312
    .line 313
    iget v0, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 314
    .line 315
    if-lez v0, :cond_11

    .line 316
    .line 317
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerItem;->needPlayLoop:Z

    .line 318
    .line 319
    if-eqz v0, :cond_11

    .line 320
    .line 321
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerItem;->resumeDisplay()V

    .line 322
    .line 323
    .line 324
    goto :goto_2

    .line 325
    :cond_11
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 326
    .line 327
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 328
    .line 329
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    sub-int/2addr v0, v1

    .line 334
    if-ne v4, v0, :cond_13

    .line 335
    .line 336
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 337
    .line 338
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    if-lez v0, :cond_12

    .line 343
    .line 344
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 345
    .line 346
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    if-nez v0, :cond_13

    .line 351
    .line 352
    :cond_12
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 353
    .line 354
    iput v3, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 355
    .line 356
    :cond_13
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->stopPlay()V

    .line 357
    .line 358
    .line 359
    :goto_3
    if-eqz v2, :cond_14

    .line 360
    .line 361
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->hasShowedThisTrigger:Z

    .line 362
    .line 363
    :cond_14
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 364
    .line 365
    if-eqz v0, :cond_15

    .line 366
    .line 367
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 368
    .line 369
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 374
    .line 375
    .line 376
    move-result v0

    .line 377
    if-nez v0, :cond_15

    .line 378
    .line 379
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 380
    .line 381
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 382
    .line 383
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    invoke-interface {v0, v1, v2}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->stickerGestureTypeChanged(Ljava/lang/String;Z)V

    .line 388
    .line 389
    .line 390
    :cond_15
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 391
    .line 392
    const-wide/16 v3, -0x1

    .line 393
    .line 394
    cmp-long v0, v0, v3

    .line 395
    .line 396
    if-lez v0, :cond_16

    .line 397
    .line 398
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 399
    .line 400
    cmp-long v0, v0, v3

    .line 401
    .line 402
    if-eqz v0, :cond_16

    .line 403
    .line 404
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 405
    .line 406
    .line 407
    move-result-wide v0

    .line 408
    iget-wide v5, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 409
    .line 410
    sub-long/2addr v0, v5

    .line 411
    iget-wide v5, p0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 412
    .line 413
    cmp-long v0, v0, v5

    .line 414
    .line 415
    if-lez v0, :cond_16

    .line 416
    .line 417
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 418
    .line 419
    .line 420
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

    .line 421
    .line 422
    if-eqz p0, :cond_17

    .line 423
    .line 424
    invoke-interface {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;->stickerRenderFinished()V

    .line 425
    .line 426
    .line 427
    return-void

    .line 428
    :cond_16
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->maskLock:Ljava/lang/Object;

    .line 429
    .line 430
    monitor-enter v0

    .line 431
    :try_start_0
    iget v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 432
    .line 433
    iget v5, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 434
    .line 435
    iget-object v6, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 436
    .line 437
    iget p1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 438
    .line 439
    invoke-virtual {p0, v1, v5, v6, p1}, Lcom/momo/mcamera/mask/StickerItem;->setParamForMatrix(FFLandroid/graphics/PointF;F)V

    .line 440
    .line 441
    .line 442
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 443
    .line 444
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 446
    .line 447
    cmp-long p1, v0, v3

    .line 448
    .line 449
    if-nez p1, :cond_17

    .line 450
    .line 451
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 452
    .line 453
    .line 454
    move-result-wide v0

    .line 455
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 456
    .line 457
    :cond_17
    :goto_4
    return-void

    .line 458
    :catchall_0
    move-exception p0

    .line 459
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 460
    throw p0
.end method

.method public setEffectTimeInfo(Ll/ore;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->mEffectTimeBean:Ll/ore;

    .line 2
    .line 3
    return-void
.end method

.method public setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

    .line 2
    .line 3
    return-void
.end method

.method public setNeedUpdate(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerItem;->needUpdateSticker:Z

    .line 2
    .line 3
    return-void
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;F)V
    .locals 10

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, v2

    .line 12
    neg-float v0, v0

    .line 13
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    neg-float p3, p3

    .line 16
    mul-float/2addr p3, v1

    .line 17
    add-float/2addr p3, v2

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    new-array v3, v1, [F

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/4 v9, 0x0

    .line 25
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 26
    .line 27
    .line 28
    neg-float v0, v0

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-static {v1, v9, v0, p3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 31
    .line 32
    .line 33
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerItem;->mViewMatrix:[F

    .line 34
    .line 35
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerItem;->mProjectionMatrix:[F

    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 41
    .line 42
    .line 43
    move-object v7, v3

    .line 44
    move-object v5, v1

    .line 45
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 46
    .line 47
    .line 48
    move-object p3, v5

    .line 49
    const/4 v7, 0x0

    .line 50
    const/high16 v8, 0x3f800000    # 1.0f

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    move v5, p4

    .line 54
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 55
    .line 56
    .line 57
    mul-float/2addr p1, v2

    .line 58
    mul-float/2addr p2, v2

    .line 59
    invoke-static {v3, v9, p1, p2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerItem;->texData0:[F

    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    move-object v5, v3

    .line 67
    move-object v3, p3

    .line 68
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 69
    .line 70
    .line 71
    aget p1, p3, v9

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    aget p4, p3, p2

    .line 75
    .line 76
    const/4 v0, 0x4

    .line 77
    aget v1, p3, v0

    .line 78
    .line 79
    const/4 v2, 0x5

    .line 80
    aget v3, p3, v2

    .line 81
    .line 82
    const/16 v4, 0x8

    .line 83
    .line 84
    aget v5, p3, v4

    .line 85
    .line 86
    const/16 v6, 0x9

    .line 87
    .line 88
    aget v6, p3, v6

    .line 89
    .line 90
    const/16 v7, 0xc

    .line 91
    .line 92
    aget v7, p3, v7

    .line 93
    .line 94
    const/16 v8, 0xd

    .line 95
    .line 96
    aget p3, p3, v8

    .line 97
    .line 98
    new-array v4, v4, [F

    .line 99
    .line 100
    aput p1, v4, v9

    .line 101
    .line 102
    aput p4, v4, p2

    .line 103
    .line 104
    const/4 p1, 0x2

    .line 105
    aput v1, v4, p1

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    aput v3, v4, p1

    .line 109
    .line 110
    aput v5, v4, v0

    .line 111
    .line 112
    aput v6, v4, v2

    .line 113
    .line 114
    const/4 p1, 0x6

    .line 115
    aput v7, v4, p1

    .line 116
    .line 117
    const/4 p1, 0x7

    .line 118
    aput p3, v4, p1

    .line 119
    .line 120
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public setProjectionMatrix([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->mProjectionMatrix:[F

    .line 2
    .line 3
    return-void
.end method

.method public setRenderTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerItem;->mRenderTime:J

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MmcvImageLoader;->setRenderTime(J)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setStickerStateChangeListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public startPlay()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotResetOnHide()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 10
    .line 11
    iget v1, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->hasShowed:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 24
    .line 25
    :cond_0
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerItem;->isPlaying:Z

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-lez v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-interface {v0, v2, v1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->playStateChanged(IZ)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isPlaying:Z

    .line 54
    .line 55
    :cond_2
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isPlaying:Z

    .line 56
    .line 57
    return-void
.end method

.method public stopPlay()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerItem;->isPlaying:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-interface {v0, v2, v1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->playStateChanged(IZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isPlaying:Z

    .line 30
    .line 31
    :cond_1
    return-void
.end method
