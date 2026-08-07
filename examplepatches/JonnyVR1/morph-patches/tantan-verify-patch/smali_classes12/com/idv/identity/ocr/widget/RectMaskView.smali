.class public Lcom/idv/identity/ocr/widget/RectMaskView;
.super Landroid/widget/ImageView;
.source "SourceFile"


# static fields
.field private static final r:Landroid/graphics/Xfermode;


# instance fields
.field private a:Landroid/graphics/Bitmap;

.field private b:Landroid/graphics/Paint;

.field private c:Landroid/graphics/Paint;

.field private d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private e:F

.field private f:F

.field private g:F

.field private h:F

.field private i:Z

.field private j:Z

.field private k:I

.field private l:I

.field private m:I

.field private n:Z

.field o:Landroid/graphics/Paint;

.field p:[F

.field q:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->XOR:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/idv/identity/ocr/widget/RectMaskView;->r:Landroid/graphics/Xfermode;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/ocr/widget/RectMaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/ocr/widget/RectMaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 7
    .line 8
    iput v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 9
    .line 10
    iput v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 11
    .line 12
    iput v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->i:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->j:Z

    .line 18
    .line 19
    const/4 v1, -0x1

    .line 20
    iput v1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->k:I

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    iput v1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->l:I

    .line 24
    .line 25
    const/16 v1, 0x23

    .line 26
    .line 27
    iput v1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->n:Z

    .line 30
    .line 31
    new-instance v0, Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->o:Landroid/graphics/Paint;

    .line 37
    .line 38
    const/16 v0, 0x8

    .line 39
    .line 40
    new-array v0, v0, [F

    .line 41
    .line 42
    iput-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->p:[F

    .line 43
    .line 44
    const/high16 v0, 0x428c0000    # 70.0f

    .line 45
    .line 46
    iput v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 47
    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/idv/identity/ocr/widget/RectMaskView;->f(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 7

    .line 1
    new-instance p0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v0, p2, Landroid/graphics/RectF;->left:F

    .line 7
    .line 8
    const/high16 v1, 0x42c80000    # 100.0f

    .line 9
    .line 10
    add-float v2, v0, v1

    .line 11
    .line 12
    iget v3, p2, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    const/high16 v4, 0x43160000    # 150.0f

    .line 15
    .line 16
    add-float v5, v3, v4

    .line 17
    .line 18
    iget v6, p2, Landroid/graphics/RectF;->right:F

    .line 19
    .line 20
    sub-float v1, v6, v1

    .line 21
    .line 22
    add-float/2addr v3, v4

    .line 23
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 24
    .line 25
    invoke-virtual {p0, v2, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v6, p2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0, p2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0, p3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private c(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 11

    .line 1
    invoke-direct {p0, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->i(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    const/high16 v3, 0x42b40000    # 90.0f

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const/high16 v2, 0x43340000    # 180.0f

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    move-object v5, p3

    .line 12
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    move-object v10, v5

    .line 16
    move-object v5, v0

    .line 17
    invoke-direct {p0, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->k(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    const/high16 v8, 0x42b40000    # 90.0f

    .line 22
    .line 23
    const/4 v9, 0x0

    .line 24
    const/high16 v7, 0x43870000    # 270.0f

    .line 25
    .line 26
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->j(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const/4 v7, 0x0

    .line 34
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->h(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const/high16 v7, 0x42b40000    # 90.0f

    .line 42
    .line 43
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    iget v5, v1, Landroid/graphics/RectF;->top:F

    .line 8
    .line 9
    iget v9, v1, Landroid/graphics/RectF;->right:F

    .line 10
    .line 11
    iget v12, v1, Landroid/graphics/RectF;->bottom:F

    .line 12
    .line 13
    iget v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 14
    .line 15
    int-to-float v3, v1

    .line 16
    add-float v4, v2, v3

    .line 17
    .line 18
    int-to-float v3, v1

    .line 19
    add-float v10, v5, v3

    .line 20
    .line 21
    int-to-float v3, v1

    .line 22
    sub-float v13, v9, v3

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    sub-float v14, v12, v1

    .line 26
    .line 27
    iget-object v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->p:[F

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    aput v4, v1, v3

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    aput v10, v1, v3

    .line 34
    .line 35
    const/4 v3, 0x2

    .line 36
    aput v13, v1, v3

    .line 37
    .line 38
    const/4 v3, 0x3

    .line 39
    aput v10, v1, v3

    .line 40
    .line 41
    const/4 v3, 0x4

    .line 42
    aput v10, v1, v3

    .line 43
    .line 44
    const/4 v3, 0x5

    .line 45
    aput v14, v1, v3

    .line 46
    .line 47
    const/4 v3, 0x6

    .line 48
    aput v13, v1, v3

    .line 49
    .line 50
    const/4 v3, 0x7

    .line 51
    aput v14, v1, v3

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "startX1:"

    .line 56
    .line 57
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v3, "  startY1:"

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v3, "startX2:"

    .line 72
    .line 73
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v3, " startY2:"

    .line 80
    .line 81
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v3, "startX3:"

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v3, " startY3:"

    .line 96
    .line 97
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v3, "startX4:"

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v3, " startY4:"

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const-string v3, "drawSegmentedRoundRect"

    .line 124
    .line 125
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    iget v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 129
    .line 130
    add-float v6, v4, v1

    .line 131
    .line 132
    move v7, v5

    .line 133
    move-object/from16 v3, p1

    .line 134
    .line 135
    move-object/from16 v8, p3

    .line 136
    .line 137
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 138
    .line 139
    .line 140
    move v15, v4

    .line 141
    iget v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 142
    .line 143
    add-float v5, v10, v1

    .line 144
    .line 145
    move v4, v2

    .line 146
    move-object/from16 v1, p1

    .line 147
    .line 148
    move-object/from16 v6, p3

    .line 149
    .line 150
    move v3, v10

    .line 151
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 152
    .line 153
    .line 154
    move v1, v3

    .line 155
    iget v3, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 156
    .line 157
    sub-float v4, v13, v3

    .line 158
    .line 159
    move v5, v7

    .line 160
    move-object/from16 v3, p1

    .line 161
    .line 162
    move v6, v13

    .line 163
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 164
    .line 165
    .line 166
    move/from16 v16, v6

    .line 167
    .line 168
    iget v3, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 169
    .line 170
    add-float v10, v1, v3

    .line 171
    .line 172
    move v7, v9

    .line 173
    move-object/from16 v6, p1

    .line 174
    .line 175
    move-object/from16 v11, p3

    .line 176
    .line 177
    move v8, v1

    .line 178
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 179
    .line 180
    .line 181
    iget v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 182
    .line 183
    sub-float v5, v14, v1

    .line 184
    .line 185
    move v4, v2

    .line 186
    move-object/from16 v1, p1

    .line 187
    .line 188
    move-object/from16 v6, p3

    .line 189
    .line 190
    move v3, v14

    .line 191
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 192
    .line 193
    .line 194
    iget v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 195
    .line 196
    add-float v13, v15, v1

    .line 197
    .line 198
    move v14, v12

    .line 199
    move-object/from16 v10, p1

    .line 200
    .line 201
    move v11, v15

    .line 202
    move-object/from16 v15, p3

    .line 203
    .line 204
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 205
    .line 206
    .line 207
    iget v1, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 208
    .line 209
    sub-float v11, v16, v1

    .line 210
    .line 211
    move/from16 v13, v16

    .line 212
    .line 213
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 214
    .line 215
    .line 216
    iget v0, v0, Lcom/idv/identity/ocr/widget/RectMaskView;->q:F

    .line 217
    .line 218
    sub-float v10, v3, v0

    .line 219
    .line 220
    move-object/from16 v6, p1

    .line 221
    .line 222
    move-object/from16 v11, p3

    .line 223
    .line 224
    move v8, v3

    .line 225
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method private f(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->g(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/idv/identity/ocr/widget/RectMaskView;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private g(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ehc0;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p2, Ll/ehc0;->d:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iput p2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 17
    .line 18
    sget p2, Ll/ehc0;->e:I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 25
    .line 26
    sget p2, Ll/ehc0;->g:I

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 33
    .line 34
    sget p2, Ll/ehc0;->c:I

    .line 35
    .line 36
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 41
    .line 42
    sget p2, Ll/ehc0;->b:I

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput-boolean p2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->i:Z

    .line 50
    .line 51
    sget p2, Ll/ehc0;->f:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->j:Z

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method private h(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 6
    .line 7
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 8
    .line 9
    mul-int/lit8 v2, p0, 0x2

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    sub-float v2, p1, v2

    .line 13
    .line 14
    mul-int/lit8 p0, p0, 0x2

    .line 15
    .line 16
    int-to-float p0, p0

    .line 17
    add-float/2addr p0, v1

    .line 18
    invoke-direct {v0, v1, v2, p0, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method private i(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 6
    .line 7
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 8
    .line 9
    mul-int/lit8 v2, p0, 0x2

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    add-float/2addr v2, v1

    .line 13
    mul-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    int-to-float p0, p0

    .line 16
    add-float/2addr p0, p1

    .line 17
    invoke-direct {v0, v1, p1, v2, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method private j(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/RectF;->right:F

    .line 4
    .line 5
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 6
    .line 7
    mul-int/lit8 v2, p0, 0x2

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    sub-float v2, v1, v2

    .line 11
    .line 12
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 13
    .line 14
    mul-int/lit8 p0, p0, 0x2

    .line 15
    .line 16
    int-to-float p0, p0

    .line 17
    sub-float p0, p1, p0

    .line 18
    .line 19
    invoke-direct {v0, v2, p0, v1, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method private k(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/RectF;->right:F

    .line 4
    .line 5
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 6
    .line 7
    mul-int/lit8 v2, p0, 0x2

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    sub-float v2, v1, v2

    .line 11
    .line 12
    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    mul-int/lit8 p0, p0, 0x2

    .line 15
    .line 16
    int-to-float p0, p0

    .line 17
    add-float/2addr p0, p1

    .line 18
    invoke-direct {v0, v2, p1, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method private l()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget v1, Ll/y9c0;->j:I

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    new-instance v1, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    const/4 v3, -0x1

    .line 30
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    int-to-float v3, v3

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    int-to-float v4, v4

    .line 43
    iget v5, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 44
    .line 45
    const/high16 v6, -0x40800000    # -1.0f

    .line 46
    .line 47
    cmpl-float v7, v5, v6

    .line 48
    .line 49
    const/4 v8, 0x0

    .line 50
    if-lez v7, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move v5, v8

    .line 54
    :goto_0
    iget-boolean v7, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->i:Z

    .line 55
    .line 56
    const/high16 v9, 0x40000000    # 2.0f

    .line 57
    .line 58
    if-eqz v7, :cond_2

    .line 59
    .line 60
    div-float v5, v3, v9

    .line 61
    .line 62
    iget v7, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 63
    .line 64
    div-float/2addr v7, v9

    .line 65
    sub-float/2addr v5, v7

    .line 66
    cmpg-float v7, v5, v8

    .line 67
    .line 68
    if-gez v7, :cond_1

    .line 69
    .line 70
    move v5, v8

    .line 71
    :cond_1
    iput v5, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 72
    .line 73
    :cond_2
    sub-float v7, v4, v3

    .line 74
    .line 75
    div-float/2addr v7, v9

    .line 76
    iget v10, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 77
    .line 78
    cmpl-float v11, v10, v6

    .line 79
    .line 80
    if-lez v11, :cond_3

    .line 81
    .line 82
    move v7, v10

    .line 83
    :cond_3
    iget-boolean v10, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->j:Z

    .line 84
    .line 85
    if-eqz v10, :cond_5

    .line 86
    .line 87
    div-float/2addr v4, v9

    .line 88
    iget v7, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 89
    .line 90
    div-float/2addr v7, v9

    .line 91
    sub-float/2addr v4, v7

    .line 92
    cmpg-float v7, v4, v8

    .line 93
    .line 94
    if-gez v7, :cond_4

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    move v8, v4

    .line 98
    :goto_1
    iput v8, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 99
    .line 100
    move v7, v8

    .line 101
    :cond_5
    iget v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 102
    .line 103
    cmpl-float v8, v4, v6

    .line 104
    .line 105
    if-lez v8, :cond_6

    .line 106
    .line 107
    add-float/2addr v4, v5

    .line 108
    goto :goto_2

    .line 109
    :cond_6
    move v4, v3

    .line 110
    :goto_2
    add-float/2addr v3, v7

    .line 111
    iget v8, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 112
    .line 113
    cmpl-float v6, v8, v6

    .line 114
    .line 115
    if-lez v6, :cond_7

    .line 116
    .line 117
    add-float v3, v7, v8

    .line 118
    .line 119
    :cond_7
    new-instance v6, Landroid/graphics/RectF;

    .line 120
    .line 121
    invoke-direct {v6, v5, v7, v4, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 122
    .line 123
    .line 124
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 125
    .line 126
    int-to-float v3, p0

    .line 127
    int-to-float p0, p0

    .line 128
    invoke-virtual {v1, v6, v3, p0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 129
    .line 130
    .line 131
    return-object v0

    .line 132
    :catch_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 133
    .line 134
    .line 135
    const/4 p0, 0x0

    .line 136
    return-object p0
.end method

.method public e()Landroid/graphics/Path;
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    iget v3, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 17
    .line 18
    const/high16 v4, -0x40800000    # -1.0f

    .line 19
    .line 20
    cmpl-float v5, v3, v4

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    if-lez v5, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v3, v6

    .line 27
    :goto_0
    iget-boolean v5, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->i:Z

    .line 28
    .line 29
    const/high16 v7, 0x40000000    # 2.0f

    .line 30
    .line 31
    if-eqz v5, :cond_2

    .line 32
    .line 33
    div-float v3, v1, v7

    .line 34
    .line 35
    iget v5, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 36
    .line 37
    div-float/2addr v5, v7

    .line 38
    sub-float/2addr v3, v5

    .line 39
    cmpg-float v5, v3, v6

    .line 40
    .line 41
    if-gez v5, :cond_1

    .line 42
    .line 43
    move v3, v6

    .line 44
    :cond_1
    iput v3, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 45
    .line 46
    :cond_2
    sub-float v5, v2, v1

    .line 47
    .line 48
    div-float/2addr v5, v7

    .line 49
    iget v8, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 50
    .line 51
    cmpl-float v9, v8, v4

    .line 52
    .line 53
    if-lez v9, :cond_3

    .line 54
    .line 55
    move v5, v8

    .line 56
    :cond_3
    iget-boolean v8, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->j:Z

    .line 57
    .line 58
    if-eqz v8, :cond_5

    .line 59
    .line 60
    div-float/2addr v2, v7

    .line 61
    iget v5, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 62
    .line 63
    div-float/2addr v5, v7

    .line 64
    sub-float/2addr v2, v5

    .line 65
    cmpg-float v5, v2, v6

    .line 66
    .line 67
    if-gez v5, :cond_4

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    move v6, v2

    .line 71
    :goto_1
    iput v6, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 72
    .line 73
    move v5, v6

    .line 74
    :cond_5
    iget v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 75
    .line 76
    cmpl-float v6, v2, v4

    .line 77
    .line 78
    if-lez v6, :cond_6

    .line 79
    .line 80
    add-float/2addr v2, v3

    .line 81
    goto :goto_2

    .line 82
    :cond_6
    move v2, v1

    .line 83
    :goto_2
    add-float/2addr v1, v5

    .line 84
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 85
    .line 86
    cmpl-float v4, p0, v4

    .line 87
    .line 88
    if-lez v4, :cond_7

    .line 89
    .line 90
    add-float v1, v5, p0

    .line 91
    .line 92
    :cond_7
    const/high16 p0, 0x42c80000    # 100.0f

    .line 93
    .line 94
    add-float v4, v3, p0

    .line 95
    .line 96
    const/high16 v6, 0x43160000    # 150.0f

    .line 97
    .line 98
    add-float/2addr v5, v6

    .line 99
    sub-float p0, v2, p0

    .line 100
    .line 101
    invoke-virtual {v0, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p0, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 114
    .line 115
    .line 116
    return-object v0
.end method

.method public getDrawTrapezoid()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRectColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public getRectHeigth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public getRectLeft()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public getRectPoints()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->p:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getRectRoundCx()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getRectTop()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public getRectWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public getStrokeWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public invalidate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->d:Ljava/lang/ref/WeakReference;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-super {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_b

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v4, v0

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v5, v0

    .line 17
    const/4 v6, 0x0

    .line 18
    const/16 v7, 0x1f

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    move-object v1, p1

    .line 23
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->d:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/graphics/Bitmap;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object p0, v0

    .line 41
    goto/16 :goto_5

    .line 42
    .line 43
    :cond_0
    move-object v0, v2

    .line 44
    :goto_0
    const/4 v3, 0x0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_6

    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    if-eqz v4, :cond_6

    .line 58
    .line 59
    :try_start_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 68
    .line 69
    invoke-static {v0, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    :try_start_2
    new-instance v5, Landroid/graphics/Canvas;

    .line 80
    .line 81
    invoke-direct {v5, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    const/4 v8, 0x0

    .line 93
    invoke-virtual {v4, v8, v8, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 97
    .line 98
    .line 99
    iget-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 100
    .line 101
    invoke-virtual {v4}, Landroid/graphics/Paint;->reset()V

    .line 102
    .line 103
    .line 104
    iget-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 107
    .line 108
    .line 109
    iget-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 110
    .line 111
    sget-object v6, Lcom/idv/identity/ocr/widget/RectMaskView;->r:Landroid/graphics/Xfermode;

    .line 112
    .line 113
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 114
    .line 115
    .line 116
    iget-boolean v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->n:Z

    .line 117
    .line 118
    if-nez v4, :cond_5

    .line 119
    .line 120
    iget-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->a:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    if-eqz v4, :cond_3

    .line 123
    .line 124
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-eqz v4, :cond_4

    .line 129
    .line 130
    :cond_3
    invoke-virtual {p0}, Lcom/idv/identity/ocr/widget/RectMaskView;->a()Landroid/graphics/Bitmap;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    iput-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->a:Landroid/graphics/Bitmap;

    .line 135
    .line 136
    :cond_4
    iget-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->a:Landroid/graphics/Bitmap;

    .line 137
    .line 138
    iget-object v6, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 139
    .line 140
    invoke-virtual {v5, v4, v3, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_5
    invoke-virtual {p0}, Lcom/idv/identity/ocr/widget/RectMaskView;->e()Landroid/graphics/Path;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-virtual {v5, v4}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    int-to-float v8, v4

    .line 156
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    int-to-float v9, v4

    .line 161
    iget-object v10, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 162
    .line 163
    const/4 v6, 0x0

    .line 164
    const/4 v7, 0x0

    .line 165
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 166
    .line 167
    .line 168
    :goto_1
    new-instance v4, Ljava/lang/ref/WeakReference;

    .line 169
    .line 170
    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    iput-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->d:Ljava/lang/ref/WeakReference;

    .line 174
    .line 175
    goto :goto_2

    .line 176
    :catch_0
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_6
    :goto_2
    if-eqz v0, :cond_a

    .line 184
    .line 185
    :try_start_3
    iget-object v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 186
    .line 187
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 188
    .line 189
    .line 190
    iget-object v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 191
    .line 192
    invoke-virtual {v1, v0, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 193
    .line 194
    .line 195
    iget v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 196
    .line 197
    cmpg-float v2, v0, v3

    .line 198
    .line 199
    if-gez v2, :cond_7

    .line 200
    .line 201
    move v0, v3

    .line 202
    :cond_7
    iget v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 203
    .line 204
    cmpg-float v4, v2, v3

    .line 205
    .line 206
    if-gez v4, :cond_8

    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_8
    move v3, v2

    .line 210
    :goto_3
    iget v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 211
    .line 212
    iget v4, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 213
    .line 214
    iget-object v5, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->b:Landroid/graphics/Paint;

    .line 215
    .line 216
    invoke-virtual {v5}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 217
    .line 218
    .line 219
    new-instance v5, Landroid/graphics/RectF;

    .line 220
    .line 221
    add-float/2addr v2, v3

    .line 222
    add-float/2addr v4, v0

    .line 223
    invoke-direct {v5, v3, v0, v2, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 227
    .line 228
    iget v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->k:I

    .line 229
    .line 230
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 234
    .line 235
    iget v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->l:I

    .line 236
    .line 237
    int-to-float v2, v2

    .line 238
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 242
    .line 243
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 244
    .line 245
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 249
    .line 250
    const/4 v2, 0x1

    .line 251
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 252
    .line 253
    .line 254
    iget-boolean v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->n:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 255
    .line 256
    iget-object v2, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 257
    .line 258
    if-eqz v0, :cond_9

    .line 259
    .line 260
    :try_start_4
    invoke-direct {p0, v1, v5, v2}, Lcom/idv/identity/ocr/widget/RectMaskView;->b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 261
    .line 262
    .line 263
    goto :goto_4

    .line 264
    :cond_9
    invoke-direct {p0, v1, v5, v2}, Lcom/idv/identity/ocr/widget/RectMaskView;->c(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->c:Landroid/graphics/Paint;

    .line 268
    .line 269
    invoke-direct {p0, v1, v5, v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 270
    .line 271
    .line 272
    :catch_1
    :cond_a
    :goto_4
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 273
    .line 274
    .line 275
    goto :goto_6

    .line 276
    :goto_5
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 277
    .line 278
    .line 279
    throw p0

    .line 280
    :goto_6
    return-void

    .line 281
    :cond_b
    move-object v1, p1

    .line 282
    invoke-super {p0, v1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method public setDrawTrapezoid(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->n:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRectColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public setRectHeight(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->h:F

    .line 3
    .line 4
    return-void
.end method

.method public setRectLeft(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public setRectRoundCx(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public setRectTop(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->f:F

    .line 3
    .line 4
    return-void
.end method

.method public setRectWidth(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->g:F

    .line 3
    .line 4
    return-void
.end method

.method public setStrokeWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskView;->l:I

    .line 2
    .line 3
    return-void
.end method
