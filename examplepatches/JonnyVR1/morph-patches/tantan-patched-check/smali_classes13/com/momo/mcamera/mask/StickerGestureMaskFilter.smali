.class public Lcom/momo/mcamera/mask/StickerGestureMaskFilter;
.super Lcom/momo/mcamera/mask/StickerMaskFilter;
.source "SourceFile"


# static fields
.field private static final DEFAULT_GESTURE_WIDTH:F = 180.0f


# instance fields
.field private currentCenter:Landroid/graphics/PointF;

.field private currentRect:Landroid/graphics/RectF;

.field private hasGestureRect:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/momo/mcamera/mask/StickerMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->hasGestureRect:Z

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentCenter:Landroid/graphics/PointF;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getAdjustWidthScale()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float p0, p0, v0

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    const/high16 p0, 0x3fc00000    # 1.5f

    .line 16
    .line 17
    return p0
.end method

.method public getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    add-float/2addr p0, v0

    .line 10
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 13
    .line 14
    sub-float/2addr p2, p1

    .line 15
    div-float/2addr p2, v1

    .line 16
    add-float/2addr p1, p2

    .line 17
    new-instance p2, Landroid/graphics/PointF;

    .line 18
    .line 19
    invoke-direct {p2, p0, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    return-object p2
.end method

.method public pauseBitmapCache()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->pauseBitmapCache()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->hasGestureRect:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->hasGestureRect:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 11
    .line 12
    iput-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->hasGestureRect:Z

    .line 22
    .line 23
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 29
    .line 30
    monitor-enter v2

    .line 31
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 32
    .line 33
    iget v3, v0, Landroid/graphics/RectF;->right:F

    .line 34
    .line 35
    iget v4, v0, Landroid/graphics/RectF;->left:F

    .line 36
    .line 37
    sub-float/2addr v3, v4

    .line 38
    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    .line 39
    .line 40
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 41
    .line 42
    sub-float/2addr v4, v0

    .line 43
    const/high16 v0, 0x43340000    # 180.0f

    .line 44
    .line 45
    div-float v0, v3, v0

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    int-to-float v5, v5

    .line 52
    const/high16 v6, 0x40000000    # 2.0f

    .line 53
    .line 54
    div-float/2addr v5, v6

    .line 55
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 56
    .line 57
    invoke-virtual {v7}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    int-to-float v7, v7

    .line 62
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->getAdjustWidthScale()F

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    mul-float/2addr v7, v8

    .line 67
    div-float/2addr v7, v5

    .line 68
    mul-float v9, v0, v7

    .line 69
    .line 70
    const/16 v0, 0x8

    .line 71
    .line 72
    new-array v0, v0, [F

    .line 73
    .line 74
    iput-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points8:[F

    .line 75
    .line 76
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 77
    .line 78
    iget v7, v5, Landroid/graphics/RectF;->left:F

    .line 79
    .line 80
    const/4 v8, 0x0

    .line 81
    aput v7, v0, v8

    .line 82
    .line 83
    iget v10, v5, Landroid/graphics/RectF;->right:F

    .line 84
    .line 85
    aput v10, v0, v1

    .line 86
    .line 87
    const/4 v11, 0x2

    .line 88
    aput v7, v0, v11

    .line 89
    .line 90
    const/4 v7, 0x3

    .line 91
    aput v10, v0, v7

    .line 92
    .line 93
    iget v7, v5, Landroid/graphics/RectF;->top:F

    .line 94
    .line 95
    const/4 v10, 0x4

    .line 96
    aput v7, v0, v10

    .line 97
    .line 98
    const/4 v11, 0x5

    .line 99
    aput v7, v0, v11

    .line 100
    .line 101
    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    .line 102
    .line 103
    const/4 v7, 0x6

    .line 104
    aput v5, v0, v7

    .line 105
    .line 106
    const/4 v7, 0x7

    .line 107
    aput v5, v0, v7

    .line 108
    .line 109
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    if-eqz v0, :cond_3

    .line 116
    .line 117
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    array-length v0, v0

    .line 124
    if-le v0, v1, :cond_3

    .line 125
    .line 126
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    aget v0, v0, v8

    .line 133
    .line 134
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 135
    .line 136
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    aget v1, v3, v1

    .line 141
    .line 142
    iget-object v3, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points8:[F

    .line 143
    .line 144
    aget v4, v3, v0

    .line 145
    .line 146
    add-int/2addr v0, v10

    .line 147
    aget v0, v3, v0

    .line 148
    .line 149
    aget v5, v3, v1

    .line 150
    .line 151
    add-int/2addr v1, v10

    .line 152
    aget v1, v3, v1

    .line 153
    .line 154
    new-instance v3, Landroid/graphics/PointF;

    .line 155
    .line 156
    invoke-direct {v3, v4, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 157
    .line 158
    .line 159
    new-instance v0, Landroid/graphics/PointF;

    .line 160
    .line 161
    invoke-direct {v0, v5, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0, v3, v0}, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Landroid/graphics/PointF;

    .line 169
    .line 170
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 171
    .line 172
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    int-to-float v4, v4

    .line 177
    div-float/2addr v3, v4

    .line 178
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 179
    .line 180
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    int-to-float v4, v4

    .line 185
    div-float/2addr v0, v4

    .line 186
    invoke-direct {v1, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 187
    .line 188
    .line 189
    :goto_1
    move-object v11, v1

    .line 190
    goto :goto_2

    .line 191
    :catchall_0
    move-exception v0

    .line 192
    move-object p0, v0

    .line 193
    goto :goto_3

    .line 194
    :cond_3
    new-instance v1, Landroid/graphics/PointF;

    .line 195
    .line 196
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 197
    .line 198
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 199
    .line 200
    div-float/2addr v3, v6

    .line 201
    add-float/2addr v0, v3

    .line 202
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    int-to-float v3, v3

    .line 207
    div-float/2addr v0, v3

    .line 208
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->currentRect:Landroid/graphics/RectF;

    .line 209
    .line 210
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 211
    .line 212
    div-float/2addr v4, v6

    .line 213
    add-float/2addr v3, v4

    .line 214
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    int-to-float v4, v4

    .line 219
    div-float/2addr v3, v4

    .line 220
    invoke-direct {v1, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :goto_2
    iget-object v13, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 225
    .line 226
    const/4 v12, 0x0

    .line 227
    move v10, v9

    .line 228
    move-object v8, p0

    .line 229
    invoke-virtual/range {v8 .. v13}, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;FLcom/momo/mcamera/mask/FilterTriggerManager;)V

    .line 230
    .line 231
    .line 232
    monitor-exit v2

    .line 233
    return-void

    .line 234
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    throw p0
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;FLcom/momo/mcamera/mask/FilterTriggerManager;)V
    .locals 9

    .line 1
    iget p5, p3, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float/2addr p5, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    sub-float/2addr p5, v1

    .line 9
    neg-float p5, p5

    .line 10
    iget v2, p3, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    neg-float v2, v2

    .line 13
    mul-float/2addr v2, v0

    .line 14
    add-float/2addr v2, v1

    .line 15
    iput p5, p3, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    iput v2, p3, Landroid/graphics/PointF;->y:F

    .line 18
    .line 19
    const/16 p3, 0x10

    .line 20
    .line 21
    new-array v3, p3, [F

    .line 22
    .line 23
    new-array p3, p3, [F

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p3, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 27
    .line 28
    .line 29
    neg-float p5, p5

    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-static {p3, v0, p5, v2, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 32
    .line 33
    .line 34
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mViewMatrix:[F

    .line 35
    .line 36
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mProjectionMatrix:[F

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    const/4 v6, 0x0

    .line 41
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 42
    .line 43
    .line 44
    move-object v7, v3

    .line 45
    move-object v5, p3

    .line 46
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 47
    .line 48
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
    mul-float/2addr p1, v1

    .line 58
    mul-float/2addr p2, v1

    .line 59
    invoke-static {v3, v0, p1, p2, v1}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->texData0:[F

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
    aget p1, p3, v0

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    aget p4, p3, p2

    .line 75
    .line 76
    const/4 p5, 0x4

    .line 77
    aget v1, p3, p5

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
    aput p1, v4, v0

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
    aput v5, v4, p5

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
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method
