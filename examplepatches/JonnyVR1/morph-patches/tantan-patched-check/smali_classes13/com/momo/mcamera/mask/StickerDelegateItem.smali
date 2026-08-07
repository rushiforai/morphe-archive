.class public Lcom/momo/mcamera/mask/StickerDelegateItem;
.super Lcom/momo/mcamera/mask/StickerItem;
.source "SourceFile"


# instance fields
.field private stickerHeight:I

.field private stickerWidth:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;->getRealBitmap()Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget v2, p0, Lcom/momo/mcamera/mask/StickerDelegateItem;->stickerWidth:I

    .line 24
    .line 25
    if-ne v1, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget v2, p0, Lcom/momo/mcamera/mask/StickerDelegateItem;->stickerHeight:I

    .line 32
    .line 33
    if-eq v1, v2, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-object v0

    .line 37
    :cond_1
    :goto_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, p0, Lcom/momo/mcamera/mask/StickerDelegateItem;->stickerHeight:I

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p0, Lcom/momo/mcamera/mask/StickerDelegateItem;->stickerWidth:I

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerDelegateItem;->initCoordinate()V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_2
    const/4 p0, 0x0

    .line 54
    return-object p0
.end method

.method public getMmcvImage(Landroid/content/Context;)Ll/umw;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
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
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerItem;->mViewMatrix:[F

    .line 183
    .line 184
    const/high16 v1, -0x40800000    # -1.0f

    .line 185
    .line 186
    aput v1, v0, v9

    .line 187
    .line 188
    return-void
.end method

.method public replaceSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 7
    .line 8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerDelegateItem;->initCoordinate()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 17
    .line 18
    const-wide/16 v0, -0x1

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerItem;->startTime:J

    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p0
.end method
