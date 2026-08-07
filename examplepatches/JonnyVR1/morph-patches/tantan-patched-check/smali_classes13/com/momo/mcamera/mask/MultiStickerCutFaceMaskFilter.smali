.class public Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;
.super Lcom/momo/mcamera/mask/MultiStickerMaskFilter;
.source "SourceFile"


# static fields
.field public static final UNIFORM_BACKGROUND:Ljava/lang/String; = "bgFlag"


# instance fields
.field private lastHasFace:Z

.field private mBackGroundHandler:I

.field private mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

.field private mPointF:Landroid/graphics/PointF;

.field private mRadius:F

.field private final vertexShaderCode:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42c80000    # 100.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mRadius:F

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->lastHasFace:Z

    .line 13
    .line 14
    const-string p1, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4   position3 ; varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nuniform mediump float etc1Flag;\nuniform mediump float bgFlag;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  if(bgFlag > 0.5){\n     textureCoordinate = position2.xy;\n     return;\n  }\n  if(etc1Flag > 0.5){\n    vec2 coord1 = position3.xy;    textureCoordinate1 = vec2(1.0 - (coord1.x + 0.5),1.0-(coord1.y + 0.5));\n  }else{\n    coord = (coord) / decorationSize;\n   }\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method private drawCutBgBackGround()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x5

    .line 6
    const/4 v2, 0x4

    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-eqz v5, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    check-cast v5, [F

    .line 36
    .line 37
    invoke-virtual {p0, v5}, Ll/wej;->setRenderVertices([F)V

    .line 38
    .line 39
    .line 40
    iget-object v5, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 41
    .line 42
    invoke-virtual {v5, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    iget v6, p0, Ll/wej;->positionHandle:I

    .line 46
    .line 47
    const/16 v10, 0x8

    .line 48
    .line 49
    iget-object v11, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    const/4 v7, 0x2

    .line 52
    const/16 v8, 0x1406

    .line 53
    .line 54
    const/4 v9, 0x0

    .line 55
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 56
    .line 57
    .line 58
    iget v5, p0, Ll/wej;->positionHandle:I

    .line 59
    .line 60
    invoke-static {v5}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 61
    .line 62
    .line 63
    new-instance v5, Landroid/graphics/PointF;

    .line 64
    .line 65
    iget-object v6, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mPointF:Landroid/graphics/PointF;

    .line 66
    .line 67
    iget v6, v6, Landroid/graphics/PointF;->x:F

    .line 68
    .line 69
    iget v7, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mRadius:F

    .line 70
    .line 71
    sub-float/2addr v6, v7

    .line 72
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    int-to-float v7, v7

    .line 77
    iget-object v8, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mPointF:Landroid/graphics/PointF;

    .line 78
    .line 79
    iget v8, v8, Landroid/graphics/PointF;->y:F

    .line 80
    .line 81
    iget v9, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mRadius:F

    .line 82
    .line 83
    add-float/2addr v8, v9

    .line 84
    sub-float/2addr v7, v8

    .line 85
    invoke-direct {v5, v6, v7}, Landroid/graphics/PointF;-><init>(FF)V

    .line 86
    .line 87
    .line 88
    new-instance v6, Landroid/graphics/PointF;

    .line 89
    .line 90
    iget-object v7, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mPointF:Landroid/graphics/PointF;

    .line 91
    .line 92
    iget v7, v7, Landroid/graphics/PointF;->x:F

    .line 93
    .line 94
    iget v8, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mRadius:F

    .line 95
    .line 96
    add-float/2addr v7, v8

    .line 97
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v8

    .line 101
    int-to-float v8, v8

    .line 102
    iget-object v9, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mPointF:Landroid/graphics/PointF;

    .line 103
    .line 104
    iget v9, v9, Landroid/graphics/PointF;->y:F

    .line 105
    .line 106
    iget v10, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mRadius:F

    .line 107
    .line 108
    sub-float/2addr v9, v10

    .line 109
    sub-float/2addr v8, v9

    .line 110
    invoke-direct {v6, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    if-lez v7, :cond_0

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    if-lez v7, :cond_0

    .line 124
    .line 125
    iget-object v7, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 126
    .line 127
    iget v8, v5, Landroid/graphics/PointF;->x:F

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 130
    .line 131
    .line 132
    move-result v9

    .line 133
    int-to-float v9, v9

    .line 134
    div-float/2addr v8, v9

    .line 135
    aput v8, v7, v4

    .line 136
    .line 137
    iget-object v7, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 138
    .line 139
    iget v8, v5, Landroid/graphics/PointF;->y:F

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 142
    .line 143
    .line 144
    move-result v9

    .line 145
    int-to-float v9, v9

    .line 146
    div-float/2addr v8, v9

    .line 147
    aput v8, v7, v3

    .line 148
    .line 149
    iget-object v7, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 150
    .line 151
    iget v8, v6, Landroid/graphics/PointF;->x:F

    .line 152
    .line 153
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 154
    .line 155
    .line 156
    move-result v9

    .line 157
    int-to-float v9, v9

    .line 158
    div-float/2addr v8, v9

    .line 159
    const/4 v9, 0x2

    .line 160
    aput v8, v7, v9

    .line 161
    .line 162
    iget-object v7, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 163
    .line 164
    iget v8, v5, Landroid/graphics/PointF;->y:F

    .line 165
    .line 166
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 167
    .line 168
    .line 169
    move-result v9

    .line 170
    int-to-float v9, v9

    .line 171
    div-float/2addr v8, v9

    .line 172
    const/4 v9, 0x3

    .line 173
    aput v8, v7, v9

    .line 174
    .line 175
    iget-object v7, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 176
    .line 177
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 178
    .line 179
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 180
    .line 181
    .line 182
    move-result v8

    .line 183
    int-to-float v8, v8

    .line 184
    div-float/2addr v5, v8

    .line 185
    aput v5, v7, v2

    .line 186
    .line 187
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 188
    .line 189
    iget v7, v6, Landroid/graphics/PointF;->y:F

    .line 190
    .line 191
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    int-to-float v8, v8

    .line 196
    div-float/2addr v7, v8

    .line 197
    aput v7, v5, v1

    .line 198
    .line 199
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 200
    .line 201
    iget v7, v6, Landroid/graphics/PointF;->x:F

    .line 202
    .line 203
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 204
    .line 205
    .line 206
    move-result v8

    .line 207
    int-to-float v8, v8

    .line 208
    div-float/2addr v7, v8

    .line 209
    const/4 v8, 0x6

    .line 210
    aput v7, v5, v8

    .line 211
    .line 212
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 213
    .line 214
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 215
    .line 216
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 217
    .line 218
    .line 219
    move-result v7

    .line 220
    int-to-float v7, v7

    .line 221
    div-float/2addr v6, v7

    .line 222
    const/4 v7, 0x7

    .line 223
    aput v6, v5, v7

    .line 224
    .line 225
    :cond_0
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 226
    .line 227
    invoke-virtual {v5, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 228
    .line 229
    .line 230
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 231
    .line 232
    iget-object v6, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 233
    .line 234
    invoke-virtual {v5, v6}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 235
    .line 236
    .line 237
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 238
    .line 239
    invoke-virtual {v5, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 240
    .line 241
    .line 242
    iget v6, p0, Ll/wej;->texCoordHandle:I

    .line 243
    .line 244
    const/16 v10, 0x8

    .line 245
    .line 246
    iget-object v11, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 247
    .line 248
    const/4 v7, 0x2

    .line 249
    const/16 v8, 0x1406

    .line 250
    .line 251
    const/4 v9, 0x0

    .line 252
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 253
    .line 254
    .line 255
    iget v5, p0, Ll/wej;->texCoordHandle:I

    .line 256
    .line 257
    invoke-static {v5}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 258
    .line 259
    .line 260
    iput-boolean v3, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->lastHasFace:Z

    .line 261
    .line 262
    invoke-static {v1, v4, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 263
    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 268
    .line 269
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerCutFaceItem;->clearCutFacePoints()V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_2
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->resetBackgroundCanvas()V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 277
    .line 278
    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 282
    .line 283
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 284
    .line 285
    invoke-virtual {v0, v5}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 286
    .line 287
    .line 288
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->lastHasFace:Z

    .line 289
    .line 290
    if-ne v0, v3, :cond_3

    .line 291
    .line 292
    iput-boolean v4, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->lastHasFace:Z

    .line 293
    .line 294
    return-void

    .line 295
    :cond_3
    invoke-static {v1, v4, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 296
    .line 297
    .line 298
    return-void
.end method

.method private resetBackgroundCanvas()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/wej;->setRenderVertices([F)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    nop

    .line 13
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public addSticker(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getEtcTextureBatch()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 12
    .line 13
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerETC1Item;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isGameSticker:Z

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    new-instance v0, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 25
    .line 26
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerGameItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isCutFaceSticker:Z

    .line 31
    .line 32
    if-ne v0, v1, :cond_2

    .line 33
    .line 34
    new-instance v0, Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 37
    .line 38
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerCutFaceItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "STICKER_TYPE_GAME_FIX_TYPE"

    .line 49
    .line 50
    if-ne v0, v1, :cond_3

    .line 51
    .line 52
    new-instance v0, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 55
    .line 56
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerFixItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isHaniSticker:Z

    .line 61
    .line 62
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    new-instance v0, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 67
    .line 68
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerHaniItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    new-instance v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 73
    .line 74
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-virtual {v0, p2}, Lcom/momo/mcamera/mask/StickerItem;->setStickerStateChangeListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    const-wide/16 v3, 0x0

    .line 85
    .line 86
    cmp-long p2, v1, v3

    .line 87
    .line 88
    if-lez p2, :cond_5

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    .line 91
    .line 92
    .line 93
    move-result-wide p1

    .line 94
    iput-wide p1, v0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_5
    const-wide/32 p1, 0x1c9c380

    .line 98
    .line 99
    .line 100
    iput-wide p1, v0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 101
    .line 102
    :goto_1
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    return-void
.end method

.method public drawBackgroundImage()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->decorateHandler:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v0, v2, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 30
    .line 31
    .line 32
    invoke-super {p0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setUseETC1(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 36
    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    const/16 v0, 0x8

    .line 40
    .line 41
    new-array v0, v0, [F

    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    iget v3, p0, Ll/wej;->curRotation:I

    .line 48
    .line 49
    aget-object v0, v0, v3

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    iget v3, p0, Ll/wej;->curRotation:I

    .line 57
    .line 58
    aget-object v0, v0, v3

    .line 59
    .line 60
    iget-object v3, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 66
    .line 67
    const/4 v3, 0x4

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 71
    .line 72
    array-length v0, v0

    .line 73
    mul-int/2addr v0, v3

    .line 74
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 95
    .line 96
    .line 97
    iget v4, p0, Ll/wej;->texCoordHandle:I

    .line 98
    .line 99
    const/16 v8, 0x8

    .line 100
    .line 101
    iget-object v9, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 102
    .line 103
    const/4 v5, 0x2

    .line 104
    const/16 v6, 0x1406

    .line 105
    .line 106
    const/4 v7, 0x0

    .line 107
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 108
    .line 109
    .line 110
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 111
    .line 112
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 113
    .line 114
    .line 115
    const v0, 0x84c0

    .line 116
    .line 117
    .line 118
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 119
    .line 120
    .line 121
    const/16 v0, 0xde1

    .line 122
    .line 123
    iget v4, p0, Ll/wej;->texture_in:I

    .line 124
    .line 125
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 126
    .line 127
    .line 128
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 129
    .line 130
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 131
    .line 132
    .line 133
    iget v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mBackGroundHandler:I

    .line 134
    .line 135
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 139
    .line 140
    if-eqz v0, :cond_2

    .line 141
    .line 142
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->drawCutBgBackGround()V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 152
    .line 153
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 156
    .line 157
    .line 158
    const/4 v0, 0x5

    .line 159
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mBackGroundHandler:I

    .line 163
    .line 164
    const/4 v0, 0x0

    .line 165
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public drawSub()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v0, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x4100

    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->drawBackgroundImage()V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0xbe2

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x302

    .line 38
    .line 39
    const/16 v3, 0x303

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    invoke-static {v1, v3, v4, v3}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-lez v1, :cond_1

    .line 52
    .line 53
    new-instance v1, Ljava/util/ArrayList;

    .line 54
    .line 55
    iget-object v3, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 56
    .line 57
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz v5, :cond_0

    .line 69
    .line 70
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, Lcom/momo/mcamera/mask/StickerItem;

    .line 75
    .line 76
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/StickerItem;->destroy()V

    .line 77
    .line 78
    .line 79
    iget-object v6, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v6, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object v6, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v6, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Lcom/momo/mcamera/mask/StickerItem;

    .line 110
    .line 111
    instance-of v5, v3, Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 112
    .line 113
    if-eqz v5, :cond_2

    .line 114
    .line 115
    iget-object v5, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 116
    .line 117
    invoke-virtual {v3, v5}, Lcom/momo/mcamera/mask/StickerItem;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    if-nez v3, :cond_2

    .line 122
    .line 123
    return-void

    .line 124
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_e

    .line 135
    .line 136
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Lcom/momo/mcamera/mask/StickerItem;

    .line 141
    .line 142
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerItem;->getLockObject()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    monitor-enter v5

    .line 147
    :try_start_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    int-to-float v6, v6

    .line 152
    iput v6, v3, Lcom/momo/mcamera/mask/StickerItem;->imageWidth:F

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    int-to-float v6, v6

    .line 159
    iput v6, v3, Lcom/momo/mcamera/mask/StickerItem;->imageHeight:F

    .line 160
    .line 161
    iget-object v6, v3, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 162
    .line 163
    if-eqz v6, :cond_9

    .line 164
    .line 165
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    if-lez v6, :cond_9

    .line 170
    .line 171
    iget-boolean v6, v3, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 172
    .line 173
    if-eqz v6, :cond_9

    .line 174
    .line 175
    instance-of v6, v3, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 176
    .line 177
    if-eqz v6, :cond_5

    .line 178
    .line 179
    move-object v6, v3

    .line 180
    check-cast v6, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 181
    .line 182
    iget v7, v6, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 183
    .line 184
    if-nez v7, :cond_4

    .line 185
    .line 186
    iget-object v7, v6, Lcom/momo/mcamera/mask/StickerETC1Item;->texture:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 187
    .line 188
    invoke-static {v7}, Lcom/core/glcore/util/TextureHelper;->etc1ToTexture(Landroid/opengl/ETC1Util$ETC1Texture;)I

    .line 189
    .line 190
    .line 191
    move-result v7

    .line 192
    iput v7, v6, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 193
    .line 194
    goto :goto_2

    .line 195
    :catchall_0
    move-exception p0

    .line 196
    goto/16 :goto_6

    .line 197
    .line 198
    :cond_4
    :goto_2
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/StickerETC1Item;->updateETC1Coordinate()V

    .line 199
    .line 200
    .line 201
    move v6, v4

    .line 202
    goto :goto_4

    .line 203
    :cond_5
    iget-object v6, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 204
    .line 205
    invoke-virtual {v3, v6}, Lcom/momo/mcamera/mask/StickerItem;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 206
    .line 207
    .line 208
    move-result-object v6

    .line 209
    if-eqz v6, :cond_7

    .line 210
    .line 211
    invoke-virtual {v6}, Ll/umw;->a()[B

    .line 212
    .line 213
    .line 214
    move-result-object v7

    .line 215
    if-eqz v7, :cond_7

    .line 216
    .line 217
    iget v7, v3, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 218
    .line 219
    if-nez v7, :cond_6

    .line 220
    .line 221
    invoke-static {v6}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 222
    .line 223
    .line 224
    move-result v6

    .line 225
    iput v6, v3, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 226
    .line 227
    goto :goto_3

    .line 228
    :cond_6
    invoke-static {v7, v6}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 229
    .line 230
    .line 231
    move-result v6

    .line 232
    iput v6, v3, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_7
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerItem;->getBitmap()Landroid/graphics/Bitmap;

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    if-eqz v6, :cond_a

    .line 240
    .line 241
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    if-nez v7, :cond_a

    .line 246
    .line 247
    iget v7, v3, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 248
    .line 249
    if-lez v7, :cond_8

    .line 250
    .line 251
    invoke-static {v6, v7}, Lcom/core/glcore/util/TextureHelper;->updateBitmap(Landroid/graphics/Bitmap;I)V

    .line 252
    .line 253
    .line 254
    goto :goto_3

    .line 255
    :cond_8
    invoke-static {v6}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 256
    .line 257
    .line 258
    move-result v6

    .line 259
    iput v6, v3, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 260
    .line 261
    goto :goto_3

    .line 262
    :cond_9
    iget-object v6, v3, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 263
    .line 264
    iput v2, v6, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 265
    .line 266
    :cond_a
    :goto_3
    move v6, v2

    .line 267
    :goto_4
    iget-boolean v7, v3, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 268
    .line 269
    if-eqz v7, :cond_d

    .line 270
    .line 271
    iget v7, v3, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 272
    .line 273
    if-nez v7, :cond_b

    .line 274
    .line 275
    if-eqz v6, :cond_d

    .line 276
    .line 277
    :cond_b
    iget-object v6, v3, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 278
    .line 279
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 284
    .line 285
    .line 286
    move-result v7

    .line 287
    if-eqz v7, :cond_c

    .line 288
    .line 289
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v7

    .line 293
    check-cast v7, [F

    .line 294
    .line 295
    invoke-virtual {p0, v3, v7}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->passStickerShaderValues(Lcom/momo/mcamera/mask/StickerItem;[F)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerItem;->getStickerAspectRatio()F

    .line 299
    .line 300
    .line 301
    move-result v7

    .line 302
    invoke-virtual {p0, v7}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawStick(F)V

    .line 303
    .line 304
    .line 305
    goto :goto_5

    .line 306
    :cond_c
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 307
    .line 308
    .line 309
    :cond_d
    monitor-exit v5

    .line 310
    goto/16 :goto_1

    .line 311
    .line 312
    :goto_6
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 313
    throw p0

    .line 314
    :cond_e
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 315
    .line 316
    .line 317
    return-void
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4   position3 ; varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nuniform mediump float etc1Flag;\nuniform mediump float bgFlag;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  if(bgFlag > 0.5){\n     textureCoordinate = position2.xy;\n     return;\n  }\n  if(etc1Flag > 0.5){\n    vec2 coord1 = position3.xy;    textureCoordinate1 = vec2(1.0 - (coord1.x + 0.5),1.0-(coord1.y + 0.5));\n  }else{\n    coord = (coord) / decorationSize;\n   }\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "bgFlag"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mBackGroundHandler:I

    .line 13
    .line 14
    return-void
.end method

.method public removeSticker(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 20
    .line 21
    if-ne v1, v2, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->resetBackgroundCanvas()V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v2, v1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->lastStickerTime:J

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-gtz v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p0, p1, v0, v2, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfo(Ll/omw;F[FZ)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/nuf;->l()[F

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Landroid/graphics/PointF;

    .line 43
    .line 44
    const/16 v2, 0x12

    .line 45
    .line 46
    aget v2, v0, v2

    .line 47
    .line 48
    const/16 v3, 0x56

    .line 49
    .line 50
    aget v3, v0, v3

    .line 51
    .line 52
    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Landroid/graphics/PointF;

    .line 56
    .line 57
    const/16 v3, 0xa

    .line 58
    .line 59
    aget v3, v0, v3

    .line 60
    .line 61
    const/16 v4, 0x4e

    .line 62
    .line 63
    aget v4, v0, v4

    .line 64
    .line 65
    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Lcom/momo/mcamera/util/PointHelper;->getmDistancePoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    double-to-float v1, v1

    .line 73
    const v2, 0x3f8ccccd    # 1.1f

    .line 74
    .line 75
    .line 76
    mul-float/2addr v1, v2

    .line 77
    const/high16 v2, 0x40000000    # 2.0f

    .line 78
    .line 79
    div-float/2addr v1, v2

    .line 80
    iput v1, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mRadius:F

    .line 81
    .line 82
    new-instance v1, Landroid/graphics/PointF;

    .line 83
    .line 84
    const/16 v2, 0x1d

    .line 85
    .line 86
    aget v2, v0, v2

    .line 87
    .line 88
    const/16 v3, 0x61

    .line 89
    .line 90
    aget v0, v0, v3

    .line 91
    .line 92
    invoke-direct {v1, v2, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 93
    .line 94
    .line 95
    iput-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mPointF:Landroid/graphics/PointF;

    .line 96
    .line 97
    :cond_2
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    const/4 v1, 0x1

    .line 102
    sub-int/2addr v0, v1

    .line 103
    :goto_0
    if-ltz v0, :cond_4

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Ll/nuf;->f()F

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    iget-object v3, p0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;->mCutFaceItem:Lcom/momo/mcamera/mask/StickerCutFaceItem;

    .line 114
    .line 115
    if-eqz v3, :cond_3

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-virtual {v3, v4, v5}, Lcom/momo/mcamera/mask/StickerCutFaceItem;->setRenderSize(II)V

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v3}, Ll/nuf;->l()[F

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {p0, p1, v2, v3, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfo(Ll/omw;F[FZ)V

    .line 137
    .line 138
    .line 139
    add-int/lit8 v0, v0, -0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_4
    :goto_1
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 2

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
    instance-of v1, v0, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setRenderTime(J)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method
