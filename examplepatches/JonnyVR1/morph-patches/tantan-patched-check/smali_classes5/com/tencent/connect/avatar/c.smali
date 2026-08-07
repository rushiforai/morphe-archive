.class public Lcom/tencent/connect/avatar/c;
.super Landroid/widget/ImageView;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field public b:Z

.field private c:Landroid/graphics/Matrix;

.field private d:Landroid/graphics/Matrix;

.field private e:I

.field private f:F

.field private g:F

.field private h:Landroid/graphics/Bitmap;

.field private i:Z

.field private j:F

.field private k:F

.field private l:Landroid/graphics/PointF;

.field private m:Landroid/graphics/PointF;

.field private n:F

.field private o:F

.field private p:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/tencent/connect/avatar/c;->d:Landroid/graphics/Matrix;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/tencent/connect/avatar/c;->e:I

    .line 20
    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/connect/avatar/c;->f:F

    .line 24
    .line 25
    iput v0, p0, Lcom/tencent/connect/avatar/c;->g:F

    .line 26
    .line 27
    iput-boolean p1, p0, Lcom/tencent/connect/avatar/c;->i:Z

    .line 28
    .line 29
    const-string v1, "TouchView"

    .line 30
    .line 31
    iput-object v1, p0, Lcom/tencent/connect/avatar/c;->a:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v1, Landroid/graphics/PointF;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Lcom/tencent/connect/avatar/c;->l:Landroid/graphics/PointF;

    .line 39
    .line 40
    new-instance v1, Landroid/graphics/PointF;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 46
    .line 47
    iput v0, p0, Lcom/tencent/connect/avatar/c;->n:F

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/tencent/connect/avatar/c;->o:F

    .line 51
    .line 52
    iput-boolean p1, p0, Lcom/tencent/connect/avatar/c;->b:Z

    .line 53
    .line 54
    new-instance p1, Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Lcom/tencent/connect/avatar/c;->a()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private a(Landroid/view/MotionEvent;)F
    .locals 3

    .line 117
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p0

    const/4 v0, 0x2

    if-ge p0, v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x0

    .line 118
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    sub-float/2addr v0, v2

    .line 119
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr p0, p1

    mul-float/2addr v0, v0

    mul-float/2addr p0, p0

    add-float/2addr v0, p0

    float-to-double p0, v0

    .line 120
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method private a()V
    .locals 0

    .line 124
    return-void
.end method

.method private a(Landroid/graphics/PointF;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/16 v0, 0x9

    .line 7
    .line 8
    new-array v0, v0, [F

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    aget v1, v0, v1

    .line 17
    .line 18
    const/4 v2, 0x5

    .line 19
    aget v2, v0, v2

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    aget v0, v0, v3

    .line 23
    .line 24
    iget-object v3, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    int-to-float v3, v3

    .line 31
    iget-object v4, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    int-to-float v4, v4

    .line 38
    mul-float/2addr v3, v0

    .line 39
    mul-float/2addr v4, v0

    .line 40
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 41
    .line 42
    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    int-to-float v5, v5

    .line 45
    sub-float/2addr v5, v1

    .line 46
    const/high16 v6, 0x3f800000    # 1.0f

    .line 47
    .line 48
    cmpg-float v7, v5, v6

    .line 49
    .line 50
    if-gtz v7, :cond_1

    .line 51
    .line 52
    move v5, v6

    .line 53
    :cond_1
    add-float/2addr v1, v3

    .line 54
    iget v3, v0, Landroid/graphics/Rect;->right:I

    .line 55
    .line 56
    int-to-float v3, v3

    .line 57
    sub-float/2addr v1, v3

    .line 58
    cmpg-float v3, v1, v6

    .line 59
    .line 60
    if-gtz v3, :cond_2

    .line 61
    .line 62
    move v1, v6

    .line 63
    :cond_2
    add-float/2addr v1, v5

    .line 64
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    int-to-float v0, v0

    .line 69
    mul-float/2addr v0, v5

    .line 70
    div-float/2addr v0, v1

    .line 71
    iget-object v1, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 72
    .line 73
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    int-to-float v3, v3

    .line 76
    add-float/2addr v0, v3

    .line 77
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    int-to-float v3, v3

    .line 80
    sub-float/2addr v3, v2

    .line 81
    add-float/2addr v2, v4

    .line 82
    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    .line 83
    .line 84
    int-to-float v4, v4

    .line 85
    sub-float/2addr v2, v4

    .line 86
    cmpg-float v4, v3, v6

    .line 87
    .line 88
    if-gtz v4, :cond_3

    .line 89
    .line 90
    move v3, v6

    .line 91
    :cond_3
    cmpg-float v4, v2, v6

    .line 92
    .line 93
    if-gtz v4, :cond_4

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    move v6, v2

    .line 97
    :goto_0
    add-float/2addr v6, v3

    .line 98
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    int-to-float v1, v1

    .line 103
    mul-float/2addr v1, v3

    .line 104
    div-float/2addr v1, v6

    .line 105
    iget-object p0, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 106
    .line 107
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 108
    .line 109
    int-to-float p0, p0

    .line 110
    add-float/2addr v1, p0

    .line 111
    invoke-virtual {p1, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public static synthetic a(Lcom/tencent/connect/avatar/c;)V
    .locals 0

    .line 115
    invoke-direct {p0}, Lcom/tencent/connect/avatar/c;->b()V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/connect/avatar/c;Z)Z
    .locals 0

    .line 116
    iput-boolean p1, p0, Lcom/tencent/connect/avatar/c;->i:Z

    return p1
.end method

.method private b()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    iget-object v2, v0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    const/16 v3, 0x9

    .line 24
    .line 25
    new-array v3, v3, [F

    .line 26
    .line 27
    iget-object v4, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 28
    .line 29
    invoke-virtual {v4, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 30
    .line 31
    .line 32
    const/4 v4, 0x2

    .line 33
    aget v5, v3, v4

    .line 34
    .line 35
    const/4 v6, 0x5

    .line 36
    aget v7, v3, v6

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    aget v9, v3, v8

    .line 40
    .line 41
    iget v10, v0, Lcom/tencent/connect/avatar/c;->f:F

    .line 42
    .line 43
    cmpl-float v11, v9, v10

    .line 44
    .line 45
    const/4 v12, 0x1

    .line 46
    if-lez v11, :cond_1

    .line 47
    .line 48
    div-float/2addr v10, v9

    .line 49
    iput v10, v0, Lcom/tencent/connect/avatar/c;->o:F

    .line 50
    .line 51
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 52
    .line 53
    iget-object v2, v0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 54
    .line 55
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 56
    .line 57
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 58
    .line 59
    invoke-virtual {v1, v10, v10, v3, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 60
    .line 61
    .line 62
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    .line 68
    .line 69
    iget v1, v0, Lcom/tencent/connect/avatar/c;->o:F

    .line 70
    .line 71
    const/high16 v3, 0x3f800000    # 1.0f

    .line 72
    .line 73
    move v4, v3

    .line 74
    div-float v3, v4, v1

    .line 75
    .line 76
    div-float v5, v4, v1

    .line 77
    .line 78
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 79
    .line 80
    iget v7, v1, Landroid/graphics/PointF;->x:F

    .line 81
    .line 82
    iget v8, v1, Landroid/graphics/PointF;->y:F

    .line 83
    .line 84
    const/high16 v4, 0x3f800000    # 1.0f

    .line 85
    .line 86
    const/high16 v6, 0x3f800000    # 1.0f

    .line 87
    .line 88
    invoke-direct/range {v2 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 89
    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :cond_1
    iget v10, v0, Lcom/tencent/connect/avatar/c;->g:F

    .line 94
    .line 95
    cmpg-float v11, v9, v10

    .line 96
    .line 97
    if-gez v11, :cond_2

    .line 98
    .line 99
    div-float/2addr v10, v9

    .line 100
    iput v10, v0, Lcom/tencent/connect/avatar/c;->o:F

    .line 101
    .line 102
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 103
    .line 104
    iget-object v2, v0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 105
    .line 106
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 107
    .line 108
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 109
    .line 110
    invoke-virtual {v1, v10, v10, v3, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 111
    .line 112
    .line 113
    new-instance v13, Landroid/view/animation/ScaleAnimation;

    .line 114
    .line 115
    iget v15, v0, Lcom/tencent/connect/avatar/c;->o:F

    .line 116
    .line 117
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 118
    .line 119
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 120
    .line 121
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 122
    .line 123
    const/high16 v14, 0x3f800000    # 1.0f

    .line 124
    .line 125
    const/high16 v16, 0x3f800000    # 1.0f

    .line 126
    .line 127
    move/from16 v17, v15

    .line 128
    .line 129
    move/from16 v19, v1

    .line 130
    .line 131
    move/from16 v18, v2

    .line 132
    .line 133
    invoke-direct/range {v13 .. v19}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 134
    .line 135
    .line 136
    move-object v2, v13

    .line 137
    goto :goto_0

    .line 138
    :cond_2
    iget-object v10, v0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 139
    .line 140
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    .line 141
    .line 142
    .line 143
    move-result v10

    .line 144
    int-to-float v10, v10

    .line 145
    mul-float/2addr v10, v9

    .line 146
    iget-object v11, v0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 147
    .line 148
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    .line 149
    .line 150
    .line 151
    move-result v11

    .line 152
    int-to-float v11, v11

    .line 153
    mul-float/2addr v11, v9

    .line 154
    iget-object v9, v0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 155
    .line 156
    iget v13, v9, Landroid/graphics/Rect;->left:I

    .line 157
    .line 158
    int-to-float v14, v13

    .line 159
    sub-float/2addr v14, v5

    .line 160
    iget v9, v9, Landroid/graphics/Rect;->top:I

    .line 161
    .line 162
    int-to-float v15, v9

    .line 163
    sub-float/2addr v15, v7

    .line 164
    move/from16 v16, v4

    .line 165
    .line 166
    const/4 v4, 0x0

    .line 167
    cmpg-float v17, v14, v4

    .line 168
    .line 169
    if-gez v17, :cond_3

    .line 170
    .line 171
    int-to-float v5, v13

    .line 172
    move v8, v12

    .line 173
    :cond_3
    cmpg-float v17, v15, v4

    .line 174
    .line 175
    if-gez v17, :cond_4

    .line 176
    .line 177
    int-to-float v7, v9

    .line 178
    move v8, v12

    .line 179
    :cond_4
    sub-float v14, v10, v14

    .line 180
    .line 181
    sub-float v15, v11, v15

    .line 182
    .line 183
    cmpg-float v14, v14, v1

    .line 184
    .line 185
    if-gez v14, :cond_5

    .line 186
    .line 187
    sub-float/2addr v10, v1

    .line 188
    int-to-float v1, v13

    .line 189
    sub-float v5, v1, v10

    .line 190
    .line 191
    move v8, v12

    .line 192
    :cond_5
    cmpg-float v1, v15, v2

    .line 193
    .line 194
    if-gez v1, :cond_6

    .line 195
    .line 196
    sub-float/2addr v11, v2

    .line 197
    int-to-float v1, v9

    .line 198
    sub-float v7, v1, v11

    .line 199
    .line 200
    move v8, v12

    .line 201
    :cond_6
    if-eqz v8, :cond_7

    .line 202
    .line 203
    aget v1, v3, v16

    .line 204
    .line 205
    sub-float/2addr v1, v5

    .line 206
    aget v2, v3, v6

    .line 207
    .line 208
    sub-float/2addr v2, v7

    .line 209
    aput v5, v3, v16

    .line 210
    .line 211
    aput v7, v3, v6

    .line 212
    .line 213
    iget-object v5, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 214
    .line 215
    invoke-virtual {v5, v3}, Landroid/graphics/Matrix;->setValues([F)V

    .line 216
    .line 217
    .line 218
    iget-object v3, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 219
    .line 220
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 221
    .line 222
    .line 223
    new-instance v3, Landroid/view/animation/TranslateAnimation;

    .line 224
    .line 225
    invoke-direct {v3, v1, v4, v2, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 226
    .line 227
    .line 228
    move-object v2, v3

    .line 229
    goto :goto_0

    .line 230
    :cond_7
    iget-object v1, v0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 233
    .line 234
    .line 235
    const/4 v2, 0x0

    .line 236
    :goto_0
    if-eqz v2, :cond_8

    .line 237
    .line 238
    iput-boolean v12, v0, Lcom/tencent/connect/avatar/c;->i:Z

    .line 239
    .line 240
    const-wide/16 v3, 0x12c

    .line 241
    .line 242
    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 246
    .line 247
    .line 248
    new-instance v1, Ljava/lang/Thread;

    .line 249
    .line 250
    new-instance v2, Lcom/tencent/connect/avatar/c$1;

    .line 251
    .line 252
    invoke-direct {v2, v0}, Lcom/tencent/connect/avatar/c$1;-><init>(Lcom/tencent/connect/avatar/c;)V

    .line 253
    .line 254
    .line 255
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 259
    .line 260
    .line 261
    :cond_8
    :goto_1
    return-void
.end method

.method private c()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/16 v0, 0x9

    .line 7
    .line 8
    new-array v0, v0, [F

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    div-float/2addr v1, v2

    .line 30
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    int-to-float v2, v2

    .line 37
    iget-object v3, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    int-to-float v3, v3

    .line 44
    div-float/2addr v2, v3

    .line 45
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 50
    .line 51
    iget v2, v2, Landroid/graphics/Rect;->left:I

    .line 52
    .line 53
    int-to-float v2, v2

    .line 54
    iget-object v3, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 55
    .line 56
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    int-to-float v3, v3

    .line 61
    mul-float/2addr v3, v1

    .line 62
    iget-object v4, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 63
    .line 64
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    int-to-float v4, v4

    .line 69
    sub-float/2addr v3, v4

    .line 70
    const/high16 v4, 0x40000000    # 2.0f

    .line 71
    .line 72
    div-float/2addr v3, v4

    .line 73
    sub-float/2addr v2, v3

    .line 74
    iput v2, p0, Lcom/tencent/connect/avatar/c;->j:F

    .line 75
    .line 76
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 77
    .line 78
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    iget-object v3, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 82
    .line 83
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    int-to-float v3, v3

    .line 88
    mul-float/2addr v3, v1

    .line 89
    iget-object v5, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 90
    .line 91
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    int-to-float v5, v5

    .line 96
    sub-float/2addr v3, v5

    .line 97
    div-float/2addr v3, v4

    .line 98
    sub-float/2addr v2, v3

    .line 99
    iput v2, p0, Lcom/tencent/connect/avatar/c;->k:F

    .line 100
    .line 101
    const/4 v3, 0x2

    .line 102
    iget v4, p0, Lcom/tencent/connect/avatar/c;->j:F

    .line 103
    .line 104
    aput v4, v0, v3

    .line 105
    .line 106
    const/4 v3, 0x5

    .line 107
    aput v2, v0, v3

    .line 108
    .line 109
    const/4 v2, 0x4

    .line 110
    aput v1, v0, v2

    .line 111
    .line 112
    const/4 v2, 0x0

    .line 113
    aput v1, v0, v2

    .line 114
    .line 115
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 116
    .line 117
    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->setValues([F)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    int-to-float v0, v0

    .line 127
    const/high16 v2, 0x45000000    # 2048.0f

    .line 128
    .line 129
    div-float v0, v2, v0

    .line 130
    .line 131
    iget-object v3, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 132
    .line 133
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    int-to-float v3, v3

    .line 138
    div-float/2addr v2, v3

    .line 139
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iput v0, p0, Lcom/tencent/connect/avatar/c;->f:F

    .line 144
    .line 145
    iput v1, p0, Lcom/tencent/connect/avatar/c;->g:F

    .line 146
    .line 147
    cmpg-float v0, v0, v1

    .line 148
    .line 149
    if-gez v0, :cond_1

    .line 150
    .line 151
    iput v1, p0, Lcom/tencent/connect/avatar/c;->f:F

    .line 152
    .line 153
    :cond_1
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Rect;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/tencent/connect/avatar/c;->p:Landroid/graphics/Rect;

    .line 122
    iget-object p1, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    .line 123
    invoke-direct {p0}, Lcom/tencent/connect/avatar/c;->c()V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/connect/avatar/c;->i:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    and-int/lit16 v0, v0, 0xff

    .line 12
    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    if-eq v0, v1, :cond_5

    .line 16
    .line 17
    const/high16 v2, 0x41200000    # 10.0f

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    if-eq v0, v3, :cond_2

    .line 21
    .line 22
    const/4 v4, 0x5

    .line 23
    if-eq v0, v4, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x6

    .line 26
    if-eq v0, p1, :cond_5

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :cond_1
    invoke-direct {p0, p1}, Lcom/tencent/connect/avatar/c;->a(Landroid/view/MotionEvent;)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/tencent/connect/avatar/c;->n:F

    .line 35
    .line 36
    cmpl-float p1, p1, v2

    .line 37
    .line 38
    if-lez p1, :cond_7

    .line 39
    .line 40
    iget-object p1, p0, Lcom/tencent/connect/avatar/c;->d:Landroid/graphics/Matrix;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 48
    .line 49
    invoke-direct {p0, p1}, Lcom/tencent/connect/avatar/c;->a(Landroid/graphics/PointF;)V

    .line 50
    .line 51
    .line 52
    iput v3, p0, Lcom/tencent/connect/avatar/c;->e:I

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_2
    iget v0, p0, Lcom/tencent/connect/avatar/c;->e:I

    .line 57
    .line 58
    if-ne v0, v1, :cond_3

    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->d:Landroid/graphics/Matrix;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->l:Landroid/graphics/PointF;

    .line 72
    .line 73
    iget v2, v2, Landroid/graphics/PointF;->x:F

    .line 74
    .line 75
    sub-float/2addr v0, v2

    .line 76
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->l:Landroid/graphics/PointF;

    .line 81
    .line 82
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 83
    .line 84
    sub-float/2addr p1, v2

    .line 85
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 86
    .line 87
    invoke-virtual {v2, v0, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    if-ne v0, v3, :cond_7

    .line 97
    .line 98
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 99
    .line 100
    invoke-virtual {v0, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 101
    .line 102
    .line 103
    invoke-direct {p0, p1}, Lcom/tencent/connect/avatar/c;->a(Landroid/view/MotionEvent;)F

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    cmpl-float v0, p1, v2

    .line 108
    .line 109
    if-lez v0, :cond_4

    .line 110
    .line 111
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 112
    .line 113
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->d:Landroid/graphics/Matrix;

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 116
    .line 117
    .line 118
    iget v0, p0, Lcom/tencent/connect/avatar/c;->n:F

    .line 119
    .line 120
    div-float/2addr p1, v0

    .line 121
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 122
    .line 123
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->m:Landroid/graphics/PointF;

    .line 124
    .line 125
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 126
    .line 127
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 128
    .line 129
    invoke-virtual {v0, p1, p1, v3, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 130
    .line 131
    .line 132
    :cond_4
    iget-object p1, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_5
    invoke-direct {p0}, Lcom/tencent/connect/avatar/c;->b()V

    .line 139
    .line 140
    .line 141
    const/4 p1, 0x0

    .line 142
    iput p1, p0, Lcom/tencent/connect/avatar/c;->e:I

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_6
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->d:Landroid/graphics/Matrix;

    .line 155
    .line 156
    iget-object v2, p0, Lcom/tencent/connect/avatar/c;->c:Landroid/graphics/Matrix;

    .line 157
    .line 158
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lcom/tencent/connect/avatar/c;->l:Landroid/graphics/PointF;

    .line 162
    .line 163
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    invoke-virtual {v0, v2, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 172
    .line 173
    .line 174
    iput v1, p0, Lcom/tencent/connect/avatar/c;->e:I

    .line 175
    .line 176
    :cond_7
    :goto_0
    iput-boolean v1, p0, Lcom/tencent/connect/avatar/c;->b:Z

    .line 177
    .line 178
    return v1
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tencent/connect/avatar/c;->h:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    :cond_0
    return-void
.end method
