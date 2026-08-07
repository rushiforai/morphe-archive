.class public Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;
.super Lcom/momo/mcamera/mask/MultiStickerMaskFilter;
.source "SourceFile"


# static fields
.field private static INDEX_MOUSE_DOWNBOTTOM:I = 0x39

.field private static INDEX_MOUSE_LEFT:I = 0x30

.field private static INDEX_MOUSE_RIGHT:I = 0x36

.field private static INDEX_MOUSE_UPTOP:I = 0x33

.field public static final POINTS_LENGTH:I = 0x44


# instance fields
.field private curTimeStamp:J

.field private isGameOver:Z

.field private isMouthOpen:Z

.field private lastOpenState:Z

.field mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

.field private triggerRegionOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->triggerRegionOffset:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->curTimeStamp:J

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->isGameOver:Z

    .line 12
    .line 13
    new-instance p1, Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/momo/mcamera/mask/StickerGameEngine;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 19
    .line 20
    return-void
.end method

.method private updateFaceStatus(Ll/omw;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, v0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    :goto_0
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->isMouthOpen:Z

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->lastOpenState:Z

    .line 19
    .line 20
    if-ne v0, v2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-lez v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/nuf;->l()[F

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget v0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->INDEX_MOUSE_UPTOP:I

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x44

    .line 39
    .line 40
    aget v0, p1, v0

    .line 41
    .line 42
    iget v1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->triggerRegionOffset:I

    .line 43
    .line 44
    int-to-float v2, v1

    .line 45
    sub-float/2addr v0, v2

    .line 46
    sget v2, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->INDEX_MOUSE_LEFT:I

    .line 47
    .line 48
    aget v2, p1, v2

    .line 49
    .line 50
    int-to-float v3, v1

    .line 51
    sub-float/2addr v2, v3

    .line 52
    sget v3, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->INDEX_MOUSE_RIGHT:I

    .line 53
    .line 54
    aget v3, p1, v3

    .line 55
    .line 56
    int-to-float v4, v1

    .line 57
    add-float/2addr v3, v4

    .line 58
    sget v4, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->INDEX_MOUSE_DOWNBOTTOM:I

    .line 59
    .line 60
    add-int/lit8 v4, v4, 0x44

    .line 61
    .line 62
    aget p1, p1, v4

    .line 63
    .line 64
    int-to-float v1, v1

    .line 65
    add-float/2addr p1, v1

    .line 66
    sub-float v1, v2, v3

    .line 67
    .line 68
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    sub-float v4, v0, p1

    .line 73
    .line 74
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    cmpg-float v5, v4, v1

    .line 79
    .line 80
    const/high16 v6, 0x40000000    # 2.0f

    .line 81
    .line 82
    if-gez v5, :cond_1

    .line 83
    .line 84
    sub-float/2addr v1, v4

    .line 85
    div-float/2addr v1, v6

    .line 86
    sub-float/2addr v0, v1

    .line 87
    add-float/2addr p1, v1

    .line 88
    goto :goto_1

    .line 89
    :cond_1
    sub-float/2addr v4, v1

    .line 90
    div-float/2addr v4, v6

    .line 91
    sub-float/2addr v2, v4

    .line 92
    add-float/2addr v3, v4

    .line 93
    :goto_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 94
    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->isGameOver:Z

    .line 98
    .line 99
    if-nez v4, :cond_2

    .line 100
    .line 101
    invoke-virtual {v1, v2, v0, v3, p1}, Lcom/momo/mcamera/mask/StickerGameEngine;->updateTriggerStatus(FFFF)V

    .line 102
    .line 103
    .line 104
    :cond_2
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->isMouthOpen:Z

    .line 105
    .line 106
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->lastOpenState:Z

    .line 107
    .line 108
    :cond_3
    return-void
.end method


# virtual methods
.method public addSticker(Lcom/momo/mcamera/mask/StickerItem;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    instance-of v0, p1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 11
    .line 12
    check-cast p1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerGameEngine;->addSticker(Lcom/momo/mcamera/mask/StickerGameItem;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public initGameFixStickerItem(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    sub-int/2addr v1, v2

    .line 12
    new-instance v2, Lcom/momo/mcamera/mask/Sticker;

    .line 13
    .line 14
    invoke-direct {v2}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 15
    .line 16
    .line 17
    const-wide v3, 0x174876e7ffL

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v3, v4}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 23
    .line 24
    .line 25
    const/16 v5, 0x14

    .line 26
    .line 27
    invoke-virtual {v2, v5}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 28
    .line 29
    .line 30
    const/4 v6, 0x5

    .line 31
    invoke-virtual {v2, v6}, Lcom/momo/mcamera/mask/Sticker;->setType(I)V

    .line 32
    .line 33
    .line 34
    const-string v7, "STICKER_TYPE_GAME_FIX_TYPE"

    .line 35
    .line 36
    invoke-virtual {v2, v7}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v8, "default"

    .line 40
    .line 41
    invoke-virtual {v2, v8}, Lcom/momo/mcamera/mask/Sticker;->setLayerType(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 v9, 0x1

    .line 45
    invoke-virtual {v2, v9}, Lcom/momo/mcamera/mask/Sticker;->setAlwaysShow(Z)V

    .line 46
    .line 47
    .line 48
    const-string v10, ""

    .line 49
    .line 50
    invoke-virtual {v2, v10}, Lcom/momo/mcamera/mask/Sticker;->setObjectTriggerType(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v11

    .line 57
    invoke-virtual {v2, v11}, Lcom/momo/mcamera/mask/Sticker;->setImageWidth(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    invoke-virtual {v2, v11}, Lcom/momo/mcamera/mask/Sticker;->setImageHeight(I)V

    .line 65
    .line 66
    .line 67
    new-instance v11, Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 68
    .line 69
    invoke-direct {v11}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v12, Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 73
    .line 74
    invoke-direct {v12}, Lcom/momo/mcamera/mask/bean/ObjectRegion;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 78
    .line 79
    .line 80
    move/from16 v13, p3

    .line 81
    .line 82
    int-to-float v13, v13

    .line 83
    const/high16 v14, 0x3f800000    # 1.0f

    .line 84
    .line 85
    mul-float v15, v13, v14

    .line 86
    .line 87
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 88
    .line 89
    .line 90
    move/from16 p3, v14

    .line 91
    .line 92
    move/from16 v14, p4

    .line 93
    .line 94
    int-to-float v14, v14

    .line 95
    mul-float v16, v14, p3

    .line 96
    .line 97
    if-lez v1, :cond_0

    .line 98
    .line 99
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 100
    .line 101
    .line 102
    move-result v17

    .line 103
    div-int/lit8 v17, v17, 0x2

    .line 104
    .line 105
    add-int v9, v17, v1

    .line 106
    .line 107
    :goto_0
    int-to-float v9, v9

    .line 108
    div-float/2addr v9, v15

    .line 109
    goto :goto_1

    .line 110
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    div-int/lit8 v9, v9, 0x2

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :goto_1
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 118
    .line 119
    .line 120
    move-result v17

    .line 121
    div-int/lit8 v6, v17, 0x2

    .line 122
    .line 123
    int-to-float v6, v6

    .line 124
    div-float v6, v6, v16

    .line 125
    .line 126
    sub-float v9, p3, v9

    .line 127
    .line 128
    const v17, 0x3d4ccccd    # 0.05f

    .line 129
    .line 130
    .line 131
    sub-float v9, v9, v17

    .line 132
    .line 133
    iput v9, v12, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 134
    .line 135
    add-float v6, v6, v17

    .line 136
    .line 137
    iput v6, v12, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 138
    .line 139
    iput v13, v12, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 140
    .line 141
    iput v14, v12, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 142
    .line 143
    invoke-virtual {v11, v12}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->setCenter(Lcom/momo/mcamera/mask/bean/ObjectRegion;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v11}, Lcom/momo/mcamera/mask/Sticker;->setAbsolutePos(Lcom/momo/mcamera/mask/bean/AbsolutePosition;)V

    .line 147
    .line 148
    .line 149
    new-instance v6, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 150
    .line 151
    const/4 v9, 0x0

    .line 152
    invoke-direct {v6, v2, v9}, Lcom/momo/mcamera/mask/StickerFixItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 153
    .line 154
    .line 155
    move-object/from16 v2, p2

    .line 156
    .line 157
    invoke-virtual {v6, v2}, Lcom/momo/mcamera/mask/StickerFixItem;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 158
    .line 159
    .line 160
    iget-object v11, v6, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 161
    .line 162
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 163
    .line 164
    .line 165
    move-result v12

    .line 166
    invoke-virtual {v11, v12}, Lcom/momo/mcamera/mask/Sticker;->setImageWidth(I)V

    .line 167
    .line 168
    .line 169
    iget-object v11, v6, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 170
    .line 171
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 172
    .line 173
    .line 174
    move-result v12

    .line 175
    invoke-virtual {v11, v12}, Lcom/momo/mcamera/mask/Sticker;->setImageHeight(I)V

    .line 176
    .line 177
    .line 178
    const-string v11, "FIX_STICKER_TYPE_ICON"

    .line 179
    .line 180
    iput-object v11, v6, Lcom/momo/mcamera/mask/StickerFixItem;->fixStickerType:Ljava/lang/String;

    .line 181
    .line 182
    invoke-super {v0, v6}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 183
    .line 184
    .line 185
    new-instance v6, Lcom/momo/mcamera/mask/Sticker;

    .line 186
    .line 187
    invoke-direct {v6}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v6, v3, v4}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v6, v5}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 194
    .line 195
    .line 196
    const/4 v3, 0x5

    .line 197
    invoke-virtual {v6, v3}, Lcom/momo/mcamera/mask/Sticker;->setType(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v6, v7}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v6, v8}, Lcom/momo/mcamera/mask/Sticker;->setLayerType(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    const/4 v3, 0x1

    .line 207
    invoke-virtual {v6, v3}, Lcom/momo/mcamera/mask/Sticker;->setAlwaysShow(Z)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v6, v10}, Lcom/momo/mcamera/mask/Sticker;->setObjectTriggerType(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    invoke-virtual {v6, v3}, Lcom/momo/mcamera/mask/Sticker;->setImageWidth(I)V

    .line 218
    .line 219
    .line 220
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    invoke-virtual {v6, v3}, Lcom/momo/mcamera/mask/Sticker;->setImageHeight(I)V

    .line 225
    .line 226
    .line 227
    new-instance v3, Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 228
    .line 229
    invoke-direct {v3}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;-><init>()V

    .line 230
    .line 231
    .line 232
    new-instance v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 233
    .line 234
    invoke-direct {v4}, Lcom/momo/mcamera/mask/bean/ObjectRegion;-><init>()V

    .line 235
    .line 236
    .line 237
    if-lez v1, :cond_1

    .line 238
    .line 239
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    div-int/lit8 v1, v1, 0x2

    .line 244
    .line 245
    int-to-float v1, v1

    .line 246
    :goto_2
    div-float/2addr v1, v15

    .line 247
    goto :goto_3

    .line 248
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    div-int/lit8 v5, v5, 0x2

    .line 253
    .line 254
    add-int/2addr v5, v1

    .line 255
    int-to-float v1, v5

    .line 256
    goto :goto_2

    .line 257
    :goto_3
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    div-int/lit8 v5, v5, 0x2

    .line 262
    .line 263
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    add-int/2addr v5, v2

    .line 268
    int-to-float v2, v5

    .line 269
    div-float v2, v2, v16

    .line 270
    .line 271
    sub-float v1, p3, v1

    .line 272
    .line 273
    sub-float v1, v1, v17

    .line 274
    .line 275
    iput v1, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 276
    .line 277
    add-float v2, v2, v17

    .line 278
    .line 279
    const v1, 0x3c23d70a    # 0.01f

    .line 280
    .line 281
    .line 282
    add-float/2addr v2, v1

    .line 283
    iput v2, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 284
    .line 285
    iput v13, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 286
    .line 287
    iput v14, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 288
    .line 289
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->setCenter(Lcom/momo/mcamera/mask/bean/ObjectRegion;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v6, v3}, Lcom/momo/mcamera/mask/Sticker;->setAbsolutePos(Lcom/momo/mcamera/mask/bean/AbsolutePosition;)V

    .line 293
    .line 294
    .line 295
    new-instance v1, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 296
    .line 297
    invoke-direct {v1, v6, v9}, Lcom/momo/mcamera/mask/StickerFixItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 298
    .line 299
    .line 300
    move-object/from16 v2, p1

    .line 301
    .line 302
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/StickerFixItem;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 303
    .line 304
    .line 305
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 306
    .line 307
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 308
    .line 309
    .line 310
    move-result v4

    .line 311
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/mask/Sticker;->setImageWidth(I)V

    .line 312
    .line 313
    .line 314
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 315
    .line 316
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 317
    .line 318
    .line 319
    move-result v2

    .line 320
    invoke-virtual {v3, v2}, Lcom/momo/mcamera/mask/Sticker;->setImageHeight(I)V

    .line 321
    .line 322
    .line 323
    const-string v2, "FIX_STICKER_TYPE_SCORE"

    .line 324
    .line 325
    iput-object v2, v1, Lcom/momo/mcamera/mask/StickerFixItem;->fixStickerType:Ljava/lang/String;

    .line 326
    .line 327
    invoke-super {v0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerGameEngine;->setImageHeight(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerGameEngine;->setImageWidth(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 22
    .line 23
    iget v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleWidthRatio:F

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerGameEngine;->setSrcImageWidthScaleRatio(F)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 29
    .line 30
    iget v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleHeightRatio:F

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerGameEngine;->setSrcImageHeightScaleRatio(F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-wide v1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->curTimeStamp:J

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/mask/StickerGameEngine;->setTimeStamp(J)V

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->newTextureReady(ILl/gfj;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public playingTailMoving()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->isGameOver:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 24
    .line 25
    iput-boolean v0, v1, Lcom/momo/mcamera/mask/StickerItem;->isTriggered:Z

    .line 26
    .line 27
    iget-object v2, v1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v2, v1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "game_over"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerItem;->startPlay()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->mStickerGameEngine:Lcom/momo/mcamera/mask/StickerGameEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerGameEngine;->setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setMMCVInfo(Ll/omw;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->updateFaceStatus(Ll/omw;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->curTimeStamp:J

    .line 5
    .line 6
    return-void
.end method

.method public updateGameFixStickerScore(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 18
    .line 19
    instance-of v1, v0, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    check-cast v0, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerFixItem;->fixStickerType:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "FIX_STICKER_TYPE_SCORE"

    .line 28
    .line 29
    if-ne v1, v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/StickerFixItem;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method
