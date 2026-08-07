.class public Lcom/momo/mcamera/mask/StickerETC1Item;
.super Lcom/momo/mcamera/mask/StickerItem;
.source "SourceFile"


# instance fields
.field private curIndex:I

.field private etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

.field public etc1_texture_sticker:I

.field private lastFrameTime:J

.field public texture:Landroid/opengl/ETC1Util$ETC1Texture;

.field private texturePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 p1, -0x1

    .line 5
    .line 6
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->lastFrameTime:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->curIndex:I

    .line 10
    .line 11
    iput p1, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerETC1Item;->getETC1Texture()Landroid/opengl/ETC1Util$ETC1Texture;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->texture:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 18
    .line 19
    return-void
.end method

.method private getETC1Texture()Landroid/opengl/ETC1Util$ETC1Texture;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->texturePath:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getETC1Path()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->texturePath:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/StickerETC1Item;->loadPkmFile(Ljava/lang/String;)Landroid/opengl/ETC1Util$ETC1Texture;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->texture:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->texture:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 20
    .line 21
    return-object p0
.end method

.method private loadPkmFile(Ljava/lang/String;)Landroid/opengl/ETC1Util$ETC1Texture;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 3
    .line 4
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ljava/io/FileInputStream;

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/opengl/ETC1Util;->createTexture(Ljava/io/InputStream;)Landroid/opengl/ETC1Util$ETC1Texture;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :catch_0
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/StickerItem;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public initCoordinate()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getETC1JsonPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Lcom/core/glcore/util/FileUtil;->readString(Ljava/io/File;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    if-nez v0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v0}, Lcom/momo/mcamera/mask/Etc1Batch;->getEffectModel(Ljava/lang/String;)Lcom/momo/mcamera/mask/Etc1Batch;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerETC1Item;->updateETC1Coordinate()V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/StickerItem;->stickerScale:F

    .line 35
    .line 36
    const/high16 v1, 0x3f000000    # 0.5f

    .line 37
    .line 38
    mul-float v2, v0, v1

    .line 39
    .line 40
    const/high16 v3, -0x41000000    # -0.5f

    .line 41
    .line 42
    mul-float v4, v3, v0

    .line 43
    .line 44
    mul-float v5, v3, v0

    .line 45
    .line 46
    mul-float/2addr v0, v1

    .line 47
    const/16 v6, 0x10

    .line 48
    .line 49
    new-array v6, v6, [F

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    aput v3, v6, v7

    .line 53
    .line 54
    const/4 v7, 0x1

    .line 55
    aput v2, v6, v7

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    const/4 v7, 0x0

    .line 59
    aput v7, v6, v2

    .line 60
    .line 61
    const/4 v2, 0x3

    .line 62
    const/high16 v8, 0x3f800000    # 1.0f

    .line 63
    .line 64
    aput v8, v6, v2

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    aput v3, v6, v2

    .line 68
    .line 69
    const/4 v2, 0x5

    .line 70
    aput v4, v6, v2

    .line 71
    .line 72
    const/4 v2, 0x6

    .line 73
    aput v7, v6, v2

    .line 74
    .line 75
    const/4 v2, 0x7

    .line 76
    aput v8, v6, v2

    .line 77
    .line 78
    const/16 v2, 0x8

    .line 79
    .line 80
    aput v1, v6, v2

    .line 81
    .line 82
    const/16 v2, 0x9

    .line 83
    .line 84
    aput v5, v6, v2

    .line 85
    .line 86
    const/16 v2, 0xa

    .line 87
    .line 88
    aput v7, v6, v2

    .line 89
    .line 90
    const/16 v2, 0xb

    .line 91
    .line 92
    aput v8, v6, v2

    .line 93
    .line 94
    const/16 v2, 0xc

    .line 95
    .line 96
    aput v1, v6, v2

    .line 97
    .line 98
    const/16 v1, 0xd

    .line 99
    .line 100
    aput v0, v6, v1

    .line 101
    .line 102
    const/16 v0, 0xe

    .line 103
    .line 104
    aput v7, v6, v0

    .line 105
    .line 106
    const/16 v0, 0xf

    .line 107
    .line 108
    aput v8, v6, v0

    .line 109
    .line 110
    iput-object v6, p0, Lcom/momo/mcamera/mask/StickerItem;->texData0:[F

    .line 111
    .line 112
    return-void
.end method

.method public updateETC1Coordinate()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->lastFrameTime:J

    .line 4
    .line 5
    const-wide/16 v3, -0x1

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->lastFrameTime:J

    .line 16
    .line 17
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getETC1ImageIndex()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->curIndex:I

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-wide v3, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->lastFrameTime:J

    .line 30
    .line 31
    sub-long/2addr v1, v3

    .line 32
    const-wide/16 v3, 0x32

    .line 33
    .line 34
    cmp-long v1, v1, v3

    .line 35
    .line 36
    if-lez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getETC1ImageIndex()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->curIndex:I

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    iput-wide v1, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->lastFrameTime:J

    .line 51
    .line 52
    :cond_1
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Etc1Batch;->getBatchStickers()Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget v2, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->curIndex:I

    .line 59
    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/momo/mcamera/mask/batchbean/BatchSticker;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->getFrame()Lcom/momo/mcamera/mask/batchbean/BatchFrame;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, v0, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1Batch:Lcom/momo/mcamera/mask/Etc1Batch;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Etc1Batch;->getBatchMeta()Lcom/momo/mcamera/mask/batchbean/BatchMeta;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchMeta;->getSize()Lcom/momo/mcamera/mask/batchbean/BatchSize;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    int-to-float v3, v3

    .line 85
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    int-to-float v4, v4

    .line 90
    div-float/2addr v3, v4

    .line 91
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    int-to-float v4, v4

    .line 96
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    const/4 v6, 0x2

    .line 101
    mul-int/2addr v5, v6

    .line 102
    int-to-float v5, v5

    .line 103
    div-float/2addr v4, v5

    .line 104
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    int-to-float v5, v5

    .line 109
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    int-to-float v7, v7

    .line 114
    div-float/2addr v5, v7

    .line 115
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageHeight()I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    add-int/2addr v7, v8

    .line 124
    int-to-float v7, v7

    .line 125
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    mul-int/2addr v8, v6

    .line 130
    int-to-float v8, v8

    .line 131
    div-float/2addr v7, v8

    .line 132
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageWidth()I

    .line 137
    .line 138
    .line 139
    move-result v9

    .line 140
    add-int/2addr v8, v9

    .line 141
    int-to-float v8, v8

    .line 142
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    int-to-float v9, v9

    .line 147
    div-float/2addr v8, v9

    .line 148
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageHeight()I

    .line 153
    .line 154
    .line 155
    move-result v10

    .line 156
    add-int/2addr v9, v10

    .line 157
    int-to-float v9, v9

    .line 158
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    mul-int/2addr v10, v6

    .line 163
    int-to-float v10, v10

    .line 164
    div-float/2addr v9, v10

    .line 165
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageX()I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageWidth()I

    .line 170
    .line 171
    .line 172
    move-result v11

    .line 173
    add-int/2addr v10, v11

    .line 174
    int-to-float v10, v10

    .line 175
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchWidth()I

    .line 176
    .line 177
    .line 178
    move-result v11

    .line 179
    int-to-float v11, v11

    .line 180
    div-float/2addr v10, v11

    .line 181
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageY()I

    .line 182
    .line 183
    .line 184
    move-result v11

    .line 185
    int-to-float v11, v11

    .line 186
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/batchbean/BatchSize;->getImageBatchHeight()I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    mul-int/2addr v2, v6

    .line 191
    int-to-float v2, v2

    .line 192
    div-float/2addr v11, v2

    .line 193
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageHeight()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    int-to-float v2, v2

    .line 198
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->getImageWidth()I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    int-to-float v1, v1

    .line 203
    div-float/2addr v2, v1

    .line 204
    iput v2, v0, Lcom/momo/mcamera/mask/StickerItem;->stickerScale:F

    .line 205
    .line 206
    const/high16 v1, -0x41000000    # -0.5f

    .line 207
    .line 208
    add-float/2addr v3, v1

    .line 209
    const/high16 v2, 0x3f000000    # 0.5f

    .line 210
    .line 211
    sub-float v12, v2, v4

    .line 212
    .line 213
    add-float/2addr v5, v1

    .line 214
    sub-float v13, v2, v7

    .line 215
    .line 216
    add-float/2addr v8, v1

    .line 217
    sub-float v14, v2, v9

    .line 218
    .line 219
    add-float/2addr v10, v1

    .line 220
    sub-float/2addr v2, v11

    .line 221
    const/16 v1, 0x8

    .line 222
    .line 223
    new-array v15, v1, [F

    .line 224
    .line 225
    move/from16 v16, v6

    .line 226
    .line 227
    const/4 v6, 0x0

    .line 228
    aput v3, v15, v6

    .line 229
    .line 230
    const/16 v17, 0x1

    .line 231
    .line 232
    aput v12, v15, v17

    .line 233
    .line 234
    aput v5, v15, v16

    .line 235
    .line 236
    const/4 v12, 0x3

    .line 237
    aput v13, v15, v12

    .line 238
    .line 239
    const/4 v13, 0x4

    .line 240
    aput v8, v15, v13

    .line 241
    .line 242
    const/16 v18, 0x5

    .line 243
    .line 244
    aput v14, v15, v18

    .line 245
    .line 246
    const/4 v14, 0x6

    .line 247
    aput v10, v15, v14

    .line 248
    .line 249
    const/16 v19, 0x7

    .line 250
    .line 251
    aput v2, v15, v19

    .line 252
    .line 253
    neg-float v2, v4

    .line 254
    neg-float v4, v7

    .line 255
    neg-float v7, v9

    .line 256
    neg-float v9, v11

    .line 257
    new-array v1, v1, [F

    .line 258
    .line 259
    aput v3, v1, v6

    .line 260
    .line 261
    aput v2, v1, v17

    .line 262
    .line 263
    aput v5, v1, v16

    .line 264
    .line 265
    aput v4, v1, v12

    .line 266
    .line 267
    aput v8, v1, v13

    .line 268
    .line 269
    aput v7, v1, v18

    .line 270
    .line 271
    aput v10, v1, v14

    .line 272
    .line 273
    aput v9, v1, v19

    .line 274
    .line 275
    const/16 v2, 0x20

    .line 276
    .line 277
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    iput-object v3, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 293
    .line 294
    invoke-virtual {v3, v15}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 295
    .line 296
    .line 297
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 298
    .line 299
    invoke-virtual {v3, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 300
    .line 301
    .line 302
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    iput-object v2, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer2:Ljava/nio/FloatBuffer;

    .line 318
    .line 319
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 320
    .line 321
    .line 322
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer2:Ljava/nio/FloatBuffer;

    .line 323
    .line 324
    invoke-virtual {v0, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 325
    .line 326
    .line 327
    return-void
.end method
