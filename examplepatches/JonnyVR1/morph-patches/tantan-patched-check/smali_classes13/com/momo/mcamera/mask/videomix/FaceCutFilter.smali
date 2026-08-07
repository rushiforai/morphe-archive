.class public Lcom/momo/mcamera/mask/videomix/FaceCutFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# static fields
.field private static final NO_TIME_STAMPS:I = -0x1


# instance fields
.field private cameraFaceRoll:F

.field private faceData:[[F

.field private lastTimestamp:J

.field private listener:Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;

.field private mmcvInfo:Ll/omw;

.field private offset:Landroid/graphics/PointF;

.field private offsetHandle:I

.field private rollHandle:I

.field private startIndex:I

.field private textureCoordinate:[F

.field private textureSizeHandle:I

.field private timestamp:J

.field private timestamps:[F

.field private vertexCoordinate:[F

.field private videoFaceRoll:F

.field private videoVertexCoordinate:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->vertexCoordinate:[F

    .line 9
    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureCoordinate:[F

    .line 13
    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoVertexCoordinate:[F

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->lastTimestamp:J

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamp:J

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->startIndex:I

    .line 26
    .line 27
    new-instance v0, Landroid/graphics/PointF;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offset:Landroid/graphics/PointF;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoFaceRoll:F

    .line 36
    .line 37
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->cameraFaceRoll:F

    .line 38
    .line 39
    return-void
.end method

.method private buildTextureCoordinate()V
    .locals 14

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->canCutFace()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x7

    .line 6
    const/4 v2, 0x6

    .line 7
    const/4 v3, 0x5

    .line 8
    const/4 v4, 0x4

    .line 9
    const/4 v5, 0x2

    .line 10
    const/4 v6, 0x1

    .line 11
    const/4 v7, 0x3

    .line 12
    const/4 v8, 0x0

    .line 13
    const/high16 v9, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->mmcvInfo:Ll/omw;

    .line 18
    .line 19
    invoke-virtual {v0, v8}, Ll/omw;->j(I)Ll/nuf;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/nuf;->j()[F

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    aget v10, v0, v8

    .line 28
    .line 29
    aget v11, v0, v7

    .line 30
    .line 31
    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    .line 32
    .line 33
    .line 34
    move-result v10

    .line 35
    iget v11, p0, Ll/wej;->width:I

    .line 36
    .line 37
    int-to-float v11, v11

    .line 38
    div-float/2addr v10, v11

    .line 39
    const/16 v11, 0xcb

    .line 40
    .line 41
    aget v11, v0, v11

    .line 42
    .line 43
    const/16 v12, 0xcc

    .line 44
    .line 45
    aget v12, v0, v12

    .line 46
    .line 47
    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    .line 48
    .line 49
    .line 50
    move-result v11

    .line 51
    iget v12, p0, Ll/wej;->height:I

    .line 52
    .line 53
    int-to-float v12, v12

    .line 54
    div-float/2addr v11, v12

    .line 55
    const/16 v12, 0x12

    .line 56
    .line 57
    aget v12, v0, v12

    .line 58
    .line 59
    const/16 v13, 0xf

    .line 60
    .line 61
    aget v13, v0, v13

    .line 62
    .line 63
    invoke-static {v12, v13}, Ljava/lang/Math;->max(FF)F

    .line 64
    .line 65
    .line 66
    move-result v12

    .line 67
    iget v13, p0, Ll/wej;->width:I

    .line 68
    .line 69
    int-to-float v13, v13

    .line 70
    div-float/2addr v12, v13

    .line 71
    const/16 v13, 0x71

    .line 72
    .line 73
    aget v0, v0, v13

    .line 74
    .line 75
    iget v13, p0, Ll/wej;->height:I

    .line 76
    .line 77
    int-to-float v13, v13

    .line 78
    div-float/2addr v0, v13

    .line 79
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureCoordinate:[F

    .line 80
    .line 81
    aput v10, p0, v8

    .line 82
    .line 83
    sub-float v0, v9, v0

    .line 84
    .line 85
    aput v0, p0, v6

    .line 86
    .line 87
    aput v12, p0, v5

    .line 88
    .line 89
    aput v0, p0, v7

    .line 90
    .line 91
    aput v10, p0, v4

    .line 92
    .line 93
    sub-float/2addr v9, v11

    .line 94
    aput v9, p0, v3

    .line 95
    .line 96
    aput v12, p0, v2

    .line 97
    .line 98
    aput v9, p0, v1

    .line 99
    .line 100
    return-void

    .line 101
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureCoordinate:[F

    .line 102
    .line 103
    const/4 v0, 0x0

    .line 104
    aput v0, p0, v8

    .line 105
    .line 106
    aput v0, p0, v6

    .line 107
    .line 108
    aput v9, p0, v5

    .line 109
    .line 110
    aput v0, p0, v7

    .line 111
    .line 112
    aput v0, p0, v4

    .line 113
    .line 114
    aput v9, p0, v3

    .line 115
    .line 116
    aput v9, p0, v2

    .line 117
    .line 118
    aput v9, p0, v1

    .line 119
    .line 120
    return-void
.end method

.method private buildVertexCoordinate()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->findNearestIndex()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->canCutFace()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, -0x1

    .line 12
    const/4 v5, 0x6

    .line 13
    const/4 v6, 0x5

    .line 14
    const/4 v7, 0x4

    .line 15
    const/high16 v8, 0x40000000    # 2.0f

    .line 16
    .line 17
    const/4 v9, 0x3

    .line 18
    const/4 v10, 0x1

    .line 19
    const/4 v11, 0x2

    .line 20
    const/4 v12, 0x0

    .line 21
    const/high16 v13, 0x3f800000    # 1.0f

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    if-le v1, v3, :cond_0

    .line 26
    .line 27
    iget-object v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->faceData:[[F

    .line 28
    .line 29
    array-length v14, v2

    .line 30
    if-ge v1, v14, :cond_0

    .line 31
    .line 32
    aget-object v1, v2, v1

    .line 33
    .line 34
    aget v2, v1, v12

    .line 35
    .line 36
    aget v3, v1, v10

    .line 37
    .line 38
    aget v14, v1, v11

    .line 39
    .line 40
    aget v15, v1, v9

    .line 41
    .line 42
    const/16 v16, 0x7

    .line 43
    .line 44
    iget-object v4, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->vertexCoordinate:[F

    .line 45
    .line 46
    mul-float/2addr v3, v8

    .line 47
    sub-float/2addr v3, v13

    .line 48
    aput v3, v4, v12

    .line 49
    .line 50
    mul-float/2addr v14, v8

    .line 51
    sub-float/2addr v14, v13

    .line 52
    neg-float v14, v14

    .line 53
    aput v14, v4, v10

    .line 54
    .line 55
    mul-float/2addr v15, v8

    .line 56
    sub-float/2addr v15, v13

    .line 57
    aput v15, v4, v11

    .line 58
    .line 59
    aput v14, v4, v9

    .line 60
    .line 61
    aput v3, v4, v7

    .line 62
    .line 63
    mul-float/2addr v2, v8

    .line 64
    sub-float/2addr v2, v13

    .line 65
    neg-float v2, v2

    .line 66
    aput v2, v4, v6

    .line 67
    .line 68
    aput v15, v4, v5

    .line 69
    .line 70
    aput v2, v4, v16

    .line 71
    .line 72
    iget-object v4, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoVertexCoordinate:[F

    .line 73
    .line 74
    aput v3, v4, v12

    .line 75
    .line 76
    aput v14, v4, v10

    .line 77
    .line 78
    aput v15, v4, v11

    .line 79
    .line 80
    aput v14, v4, v9

    .line 81
    .line 82
    aput v3, v4, v7

    .line 83
    .line 84
    aput v2, v4, v6

    .line 85
    .line 86
    aput v15, v4, v5

    .line 87
    .line 88
    aput v2, v4, v16

    .line 89
    .line 90
    iget-object v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offset:Landroid/graphics/PointF;

    .line 91
    .line 92
    iget-object v3, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->mmcvInfo:Ll/omw;

    .line 93
    .line 94
    invoke-virtual {v3, v12}, Ll/omw;->j(I)Ll/nuf;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3}, Ll/nuf;->j()[F

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    const/16 v4, 0x4b

    .line 103
    .line 104
    aget v3, v3, v4

    .line 105
    .line 106
    iget v4, v0, Ll/wej;->width:I

    .line 107
    .line 108
    int-to-float v4, v4

    .line 109
    div-float/2addr v3, v4

    .line 110
    iput v3, v2, Landroid/graphics/PointF;->x:F

    .line 111
    .line 112
    iget-object v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offset:Landroid/graphics/PointF;

    .line 113
    .line 114
    iget-object v3, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->mmcvInfo:Ll/omw;

    .line 115
    .line 116
    invoke-virtual {v3, v12}, Ll/omw;->j(I)Ll/nuf;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v3}, Ll/nuf;->j()[F

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    const/16 v4, 0xb3

    .line 125
    .line 126
    aget v3, v3, v4

    .line 127
    .line 128
    iget v4, v0, Ll/wej;->height:I

    .line 129
    .line 130
    int-to-float v4, v4

    .line 131
    div-float/2addr v3, v4

    .line 132
    sub-float/2addr v13, v3

    .line 133
    iput v13, v2, Landroid/graphics/PointF;->y:F

    .line 134
    .line 135
    aget v1, v1, v7

    .line 136
    .line 137
    const/high16 v2, 0x43b40000    # 360.0f

    .line 138
    .line 139
    div-float/2addr v1, v2

    .line 140
    float-to-double v3, v1

    .line 141
    const-wide v5, 0x400921fb54442d18L    # Math.PI

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    mul-double/2addr v3, v5

    .line 147
    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    .line 148
    .line 149
    mul-double/2addr v3, v7

    .line 150
    double-to-float v1, v3

    .line 151
    iput v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoFaceRoll:F

    .line 152
    .line 153
    iget-object v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->mmcvInfo:Ll/omw;

    .line 154
    .line 155
    invoke-virtual {v1, v12}, Ll/omw;->j(I)Ll/nuf;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Ll/nuf;->c()[F

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    aget v1, v1, v11

    .line 164
    .line 165
    div-float/2addr v1, v2

    .line 166
    float-to-double v1, v1

    .line 167
    mul-double/2addr v1, v5

    .line 168
    mul-double/2addr v1, v7

    .line 169
    double-to-float v1, v1

    .line 170
    iput v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->cameraFaceRoll:F

    .line 171
    .line 172
    return-void

    .line 173
    :cond_0
    const/16 v16, 0x7

    .line 174
    .line 175
    const/4 v2, 0x0

    .line 176
    const/high16 v4, 0x3f000000    # 0.5f

    .line 177
    .line 178
    const/high16 v14, -0x40800000    # -1.0f

    .line 179
    .line 180
    if-le v1, v3, :cond_1

    .line 181
    .line 182
    iget-object v3, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->faceData:[[F

    .line 183
    .line 184
    if-eqz v3, :cond_1

    .line 185
    .line 186
    array-length v15, v3

    .line 187
    if-ge v1, v15, :cond_1

    .line 188
    .line 189
    aget-object v1, v3, v1

    .line 190
    .line 191
    aget v3, v1, v12

    .line 192
    .line 193
    aget v15, v1, v10

    .line 194
    .line 195
    aget v17, v1, v11

    .line 196
    .line 197
    aget v1, v1, v9

    .line 198
    .line 199
    move/from16 v18, v5

    .line 200
    .line 201
    iget-object v5, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->vertexCoordinate:[F

    .line 202
    .line 203
    aput v14, v5, v12

    .line 204
    .line 205
    aput v14, v5, v10

    .line 206
    .line 207
    aput v13, v5, v11

    .line 208
    .line 209
    aput v14, v5, v9

    .line 210
    .line 211
    aput v14, v5, v7

    .line 212
    .line 213
    aput v13, v5, v6

    .line 214
    .line 215
    aput v13, v5, v18

    .line 216
    .line 217
    aput v13, v5, v16

    .line 218
    .line 219
    iget-object v5, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoVertexCoordinate:[F

    .line 220
    .line 221
    mul-float/2addr v15, v8

    .line 222
    sub-float/2addr v15, v13

    .line 223
    aput v15, v5, v12

    .line 224
    .line 225
    mul-float v17, v17, v8

    .line 226
    .line 227
    sub-float v12, v17, v13

    .line 228
    .line 229
    neg-float v12, v12

    .line 230
    aput v12, v5, v10

    .line 231
    .line 232
    mul-float/2addr v1, v8

    .line 233
    sub-float/2addr v1, v13

    .line 234
    aput v1, v5, v11

    .line 235
    .line 236
    aput v12, v5, v9

    .line 237
    .line 238
    aput v15, v5, v7

    .line 239
    .line 240
    mul-float/2addr v3, v8

    .line 241
    sub-float/2addr v3, v13

    .line 242
    neg-float v3, v3

    .line 243
    aput v3, v5, v6

    .line 244
    .line 245
    aput v1, v5, v18

    .line 246
    .line 247
    aput v3, v5, v16

    .line 248
    .line 249
    iget-object v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offset:Landroid/graphics/PointF;

    .line 250
    .line 251
    iput v4, v1, Landroid/graphics/PointF;->x:F

    .line 252
    .line 253
    iput v4, v1, Landroid/graphics/PointF;->y:F

    .line 254
    .line 255
    iput v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoFaceRoll:F

    .line 256
    .line 257
    iput v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->cameraFaceRoll:F

    .line 258
    .line 259
    return-void

    .line 260
    :cond_1
    move/from16 v18, v5

    .line 261
    .line 262
    iget-object v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->vertexCoordinate:[F

    .line 263
    .line 264
    aput v14, v1, v12

    .line 265
    .line 266
    aput v14, v1, v10

    .line 267
    .line 268
    aput v13, v1, v11

    .line 269
    .line 270
    aput v14, v1, v9

    .line 271
    .line 272
    aput v14, v1, v7

    .line 273
    .line 274
    aput v13, v1, v6

    .line 275
    .line 276
    aput v13, v1, v18

    .line 277
    .line 278
    aput v13, v1, v16

    .line 279
    .line 280
    iget-object v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoVertexCoordinate:[F

    .line 281
    .line 282
    aput v14, v1, v12

    .line 283
    .line 284
    aput v14, v1, v10

    .line 285
    .line 286
    aput v13, v1, v11

    .line 287
    .line 288
    aput v14, v1, v9

    .line 289
    .line 290
    aput v14, v1, v7

    .line 291
    .line 292
    aput v13, v1, v6

    .line 293
    .line 294
    aput v13, v1, v18

    .line 295
    .line 296
    aput v13, v1, v16

    .line 297
    .line 298
    iget-object v1, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offset:Landroid/graphics/PointF;

    .line 299
    .line 300
    iput v4, v1, Landroid/graphics/PointF;->x:F

    .line 301
    .line 302
    iput v4, v1, Landroid/graphics/PointF;->y:F

    .line 303
    .line 304
    iput v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoFaceRoll:F

    .line 305
    .line 306
    iput v2, v0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->cameraFaceRoll:F

    .line 307
    .line 308
    return-void
.end method

.method private canCutFace()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamps:[F

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->faceData:[[F

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private findNearestIndex()I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamps:[F

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    array-length v0, v0

    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamps:[F

    .line 12
    .line 13
    if-gt v1, v0, :cond_3

    .line 14
    .line 15
    add-int v3, v1, v0

    .line 16
    .line 17
    ushr-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    aget v2, v2, v3

    .line 20
    .line 21
    iget-wide v4, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamp:J

    .line 22
    .line 23
    long-to-float v6, v4

    .line 24
    cmpg-float v6, v2, v6

    .line 25
    .line 26
    if-gez v6, :cond_1

    .line 27
    .line 28
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    move v1, v3

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    long-to-float v0, v4

    .line 33
    cmpl-float v0, v2, v0

    .line 34
    .line 35
    if-lez v0, :cond_2

    .line 36
    .line 37
    add-int/lit8 v3, v3, -0x1

    .line 38
    .line 39
    move v0, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return v3

    .line 42
    :cond_3
    array-length v0, v2

    .line 43
    if-ne v1, v0, :cond_4

    .line 44
    .line 45
    array-length p0, v2

    .line 46
    add-int/lit8 p0, p0, -0x1

    .line 47
    .line 48
    return p0

    .line 49
    :cond_4
    aget v0, v2, v1

    .line 50
    .line 51
    iget-wide v2, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamp:J

    .line 52
    .line 53
    long-to-float v2, v2

    .line 54
    sub-float/2addr v0, v2

    .line 55
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamps:[F

    .line 60
    .line 61
    add-int/lit8 v3, v1, -0x1

    .line 62
    .line 63
    aget v2, v2, v3

    .line 64
    .line 65
    iget-wide v4, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamp:J

    .line 66
    .line 67
    long-to-float p0, v4

    .line 68
    sub-float/2addr v2, p0

    .line 69
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    cmpl-float p0, v0, p0

    .line 74
    .line 75
    if-ltz p0, :cond_5

    .line 76
    .line 77
    return v3

    .line 78
    :cond_5
    return v1
.end method

.method private transformedCoordinate()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec2 transformedCoordinate(vec2 originCoordinate, vec2 offset, mat2 transformMatrix, vec2 textureSize) {\n        vec2 centered = originCoordinate * textureSize - offset * textureSize;\n        vec2 trans = transformMatrix * centered;\n        vec2 result = trans.xy + offset * textureSize;\n        return result / textureSize;\n    }"

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->faceData:[[F

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamps:[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float roll;\nuniform vec2 textureSize;\nuniform vec2 offset;\n\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->transformedCoordinate()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "\nvoid main() {\n    vec2 textureCoordinate = transformedCoordinate(textureCoordinate, offset, mat2(vec2(cos(roll), -sin(roll)), vec2(sin(roll), cos(roll))), textureSize);\n    gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n}\n"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "roll"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->rollHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "textureSize"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureSizeHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "offset"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offsetHandle:I

    .line 33
    .line 34
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->vertexCoordinate:[F

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    mul-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->vertexCoordinate:[F

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 46
    .line 47
    const/16 v6, 0x8

    .line 48
    .line 49
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    const/16 v4, 0x1406

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 56
    .line 57
    .line 58
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 59
    .line 60
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    iget v2, p0, Ll/wej;->curRotation:I

    .line 66
    .line 67
    aget-object v3, v0, v2

    .line 68
    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    iget-object v3, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureCoordinate:[F

    .line 72
    .line 73
    array-length v3, v3

    .line 74
    mul-int/lit8 v3, v3, 0x4

    .line 75
    .line 76
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    aput-object v3, v0, v2

    .line 93
    .line 94
    :cond_1
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 95
    .line 96
    iget v2, p0, Ll/wej;->curRotation:I

    .line 97
    .line 98
    aget-object v0, v0, v2

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    iget v2, p0, Ll/wej;->curRotation:I

    .line 106
    .line 107
    aget-object v0, v0, v2

    .line 108
    .line 109
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureCoordinate:[F

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 116
    .line 117
    .line 118
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 119
    .line 120
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 121
    .line 122
    iget v3, p0, Ll/wej;->curRotation:I

    .line 123
    .line 124
    aget-object v7, v0, v3

    .line 125
    .line 126
    const/4 v3, 0x2

    .line 127
    const/16 v4, 0x1406

    .line 128
    .line 129
    const/4 v5, 0x0

    .line 130
    const/16 v6, 0x8

    .line 131
    .line 132
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 133
    .line 134
    .line 135
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 136
    .line 137
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 138
    .line 139
    .line 140
    const v0, 0x84c0

    .line 141
    .line 142
    .line 143
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 144
    .line 145
    .line 146
    const/16 v0, 0xde1

    .line 147
    .line 148
    iget v2, p0, Ll/wej;->texture_in:I

    .line 149
    .line 150
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 151
    .line 152
    .line 153
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 154
    .line 155
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 156
    .line 157
    .line 158
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->rollHandle:I

    .line 159
    .line 160
    iget v1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->cameraFaceRoll:F

    .line 161
    .line 162
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoFaceRoll:F

    .line 163
    .line 164
    sub-float/2addr v1, v2

    .line 165
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 166
    .line 167
    .line 168
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->textureSizeHandle:I

    .line 169
    .line 170
    iget v1, p0, Ll/wej;->width:I

    .line 171
    .line 172
    int-to-float v1, v1

    .line 173
    iget v2, p0, Ll/wej;->height:I

    .line 174
    .line 175
    int-to-float v2, v2

    .line 176
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 177
    .line 178
    .line 179
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offsetHandle:I

    .line 180
    .line 181
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->offset:Landroid/graphics/PointF;

    .line 182
    .line 183
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 184
    .line 185
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 186
    .line 187
    invoke-static {v0, v1, p0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->buildVertexCoordinate()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->buildTextureCoordinate()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->listener:Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoVertexCoordinate:[F

    .line 14
    .line 15
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->videoFaceRoll:F

    .line 16
    .line 17
    invoke-interface {p1, v0, p0}, Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;->onFaceUpdate([FF)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setOnVertexCoordinateUpdateListener(Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->listener:Lcom/momo/mcamera/mask/videomix/OnFaceUpdateListener;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFileConfig([F[[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamps:[F

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->faceData:[[F

    .line 4
    .line 5
    return-void
.end method

.method public updateTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/videomix/FaceCutFilter;->timestamp:J

    .line 2
    .line 3
    return-void
.end method
