.class public Lcom/idv/identity/face/ui/widget/RoundProgressBar;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:Ljava/lang/Runnable;

.field C:I

.field private a:Z

.field private b:Landroid/content/Context;

.field protected c:Landroid/graphics/Paint;

.field protected d:I

.field private e:F

.field protected f:I

.field private g:I

.field private h:Z

.field private i:I

.field private j:I

.field private k:I

.field protected l:I

.field private m:I

.field private n:F

.field private o:F

.field private p:I

.field private q:I

.field private r:Z

.field private s:I

.field private t:I

.field public u:Landroid/graphics/BitmapShader;

.field private v:Landroid/graphics/SweepGradient;

.field private w:Landroid/graphics/Matrix;

.field private x:I

.field private y:I

.field private z:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 269
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 270
    iput-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->b:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 267
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 268
    iput-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->b:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->a:Z

    .line 6
    .line 7
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->s:I

    .line 8
    .line 9
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->t:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->A:I

    .line 13
    .line 14
    new-instance v1, Lcom/idv/identity/face/ui/widget/RoundProgressBar$a;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar$a;-><init>(Lcom/idv/identity/face/ui/widget/RoundProgressBar;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->B:Ljava/lang/Runnable;

    .line 20
    .line 21
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->C:I

    .line 22
    .line 23
    new-instance v1, Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 29
    .line 30
    new-instance v1, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->z:Landroid/os/Handler;

    .line 40
    .line 41
    sget-object v1, Ll/dhc0;->G:[I

    .line 42
    .line 43
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget p2, Ll/dhc0;->O:I

    .line 48
    .line 49
    const/high16 v1, -0x10000

    .line 50
    .line 51
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 56
    .line 57
    sget p2, Ll/dhc0;->P:I

    .line 58
    .line 59
    const v1, -0xff0100

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->f:I

    .line 67
    .line 68
    sget p2, Ll/dhc0;->P:I

    .line 69
    .line 70
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->g:I

    .line 75
    .line 76
    sget p2, Ll/dhc0;->T:I

    .line 77
    .line 78
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->k:I

    .line 83
    .line 84
    sget p2, Ll/dhc0;->V:I

    .line 85
    .line 86
    const/high16 v1, 0x41700000    # 15.0f

    .line 87
    .line 88
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->n:F

    .line 93
    .line 94
    sget p2, Ll/dhc0;->Q:I

    .line 95
    .line 96
    const/high16 v1, 0x40a00000    # 5.0f

    .line 97
    .line 98
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->o:F

    .line 103
    .line 104
    sget p2, Ll/dhc0;->M:I

    .line 105
    .line 106
    const/16 v1, 0x64

    .line 107
    .line 108
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->p:I

    .line 113
    .line 114
    sget p2, Ll/dhc0;->U:I

    .line 115
    .line 116
    const/4 v1, 0x1

    .line 117
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->r:Z

    .line 122
    .line 123
    sget p2, Ll/dhc0;->S:I

    .line 124
    .line 125
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->s:I

    .line 130
    .line 131
    sget p2, Ll/dhc0;->N:I

    .line 132
    .line 133
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->h:Z

    .line 138
    .line 139
    sget p2, Ll/dhc0;->I:I

    .line 140
    .line 141
    const/4 v1, 0x0

    .line 142
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->e:F

    .line 147
    .line 148
    sget p2, Ll/dhc0;->L:I

    .line 149
    .line 150
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->i:I

    .line 155
    .line 156
    sget p2, Ll/dhc0;->K:I

    .line 157
    .line 158
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->j:I

    .line 163
    .line 164
    sget p2, Ll/dhc0;->R:I

    .line 165
    .line 166
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->l:I

    .line 171
    .line 172
    sget p2, Ll/dhc0;->J:I

    .line 173
    .line 174
    const/16 p3, 0x168

    .line 175
    .line 176
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->m:I

    .line 181
    .line 182
    sget p2, Ll/dhc0;->H:I

    .line 183
    .line 184
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->y:I

    .line 189
    .line 190
    iget p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->e:F

    .line 191
    .line 192
    cmpl-float p2, p2, v1

    .line 193
    .line 194
    if-lez p2, :cond_0

    .line 195
    .line 196
    iget-boolean p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->h:Z

    .line 197
    .line 198
    if-eqz p2, :cond_0

    .line 199
    .line 200
    new-instance p2, Landroid/graphics/Matrix;

    .line 201
    .line 202
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 203
    .line 204
    .line 205
    iput-object p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->w:Landroid/graphics/Matrix;

    .line 206
    .line 207
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    sget p3, Ll/rfc0;->a:I

    .line 212
    .line 213
    invoke-static {p2, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    new-instance p3, Landroid/graphics/BitmapShader;

    .line 218
    .line 219
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 220
    .line 221
    invoke-direct {p3, p2, v0, v0}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 222
    .line 223
    .line 224
    iput-object p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->u:Landroid/graphics/BitmapShader;

    .line 225
    .line 226
    iget p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->e:F

    .line 227
    .line 228
    float-to-int p3, p3

    .line 229
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->x:I

    .line 230
    .line 231
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 232
    .line 233
    .line 234
    move-result p3

    .line 235
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 236
    .line 237
    .line 238
    move-result p2

    .line 239
    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    iget p3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->x:I

    .line 244
    .line 245
    int-to-float p3, p3

    .line 246
    const/high16 v0, 0x3f800000    # 1.0f

    .line 247
    .line 248
    mul-float/2addr p3, v0

    .line 249
    int-to-float p2, p2

    .line 250
    div-float/2addr p3, p2

    .line 251
    iget-object p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->w:Landroid/graphics/Matrix;

    .line 252
    .line 253
    invoke-virtual {p2, p3, p3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 254
    .line 255
    .line 256
    iget-object p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->u:Landroid/graphics/BitmapShader;

    .line 257
    .line 258
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->w:Landroid/graphics/Matrix;

    .line 259
    .line 260
    invoke-virtual {p2, p0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 261
    .line 262
    .line 263
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 264
    .line 265
    .line 266
    return-void
.end method

.method public static synthetic a(Lcom/idv/identity/face/ui/widget/RoundProgressBar;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/idv/identity/face/ui/widget/RoundProgressBar;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/idv/identity/face/ui/widget/RoundProgressBar;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->z:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/idv/identity/face/ui/widget/RoundProgressBar;)Ll/wmd0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method private e(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->l:I

    .line 16
    .line 17
    int-to-float v3, v0

    .line 18
    iget v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->m:I

    .line 19
    .line 20
    sub-int/2addr v1, v0

    .line 21
    int-to-float v4, v1

    .line 22
    const/4 v5, 0x0

    .line 23
    iget-object v6, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 24
    .line 25
    move-object v1, p1

    .line 26
    move-object v2, p2

    .line 27
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->u:Landroid/graphics/BitmapShader;

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-boolean p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->h:Z

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->i:I

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->j:I

    .line 49
    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->v:Landroid/graphics/SweepGradient;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    new-instance v3, Landroid/graphics/SweepGradient;

    .line 65
    .line 66
    iget v4, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->i:I

    .line 67
    .line 68
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->j:I

    .line 69
    .line 70
    filled-new-array {v4, v5}, [I

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-direct {v3, p1, v0, v4, p2}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 75
    .line 76
    .line 77
    iput-object v3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->v:Landroid/graphics/SweepGradient;

    .line 78
    .line 79
    new-instance v3, Landroid/graphics/Matrix;

    .line 80
    .line 81
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 82
    .line 83
    .line 84
    const/high16 v4, 0x42b40000    # 90.0f

    .line 85
    .line 86
    invoke-virtual {v3, v4, p1, v0}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->v:Landroid/graphics/SweepGradient;

    .line 90
    .line 91
    invoke-virtual {p1, v3}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->v:Landroid/graphics/SweepGradient;

    .line 95
    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 101
    .line 102
    .line 103
    :cond_2
    iget-object p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 104
    .line 105
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->f:I

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 108
    .line 109
    .line 110
    iget p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->q:I

    .line 111
    .line 112
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->m:I

    .line 113
    .line 114
    iget v3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->l:I

    .line 115
    .line 116
    sub-int/2addr v0, v3

    .line 117
    mul-int/2addr p1, v0

    .line 118
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->getMax()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    div-int/2addr p1, v0

    .line 123
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->l:I

    .line 124
    .line 125
    int-to-float v9, v0

    .line 126
    int-to-float v10, p1

    .line 127
    const/4 v11, 0x0

    .line 128
    iget-object v12, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 129
    .line 130
    move-object v7, v1

    .line 131
    move-object v8, v2

    .line 132
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 138
    .line 139
    .line 140
    return-void
.end method


# virtual methods
.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->z:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->B:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getCricleColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public getCricleProgressColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized getMax()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->p:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized getProgress()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->q:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public getRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getRoundWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public getTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextSize()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->n:F

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    int-to-float v1, v0

    .line 11
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->o:F

    .line 12
    .line 13
    const/high16 v3, 0x40000000    # 2.0f

    .line 14
    .line 15
    div-float/2addr v2, v3

    .line 16
    sub-float v2, v1, v2

    .line 17
    .line 18
    float-to-int v2, v2

    .line 19
    iput v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->t:I

    .line 20
    .line 21
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 22
    .line 23
    iget v4, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 24
    .line 25
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 29
    .line 30
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 31
    .line 32
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 36
    .line 37
    iget v4, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->o:F

    .line 38
    .line 39
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 43
    .line 44
    const/4 v4, 0x1

    .line 45
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 49
    .line 50
    sget-object v5, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 51
    .line 52
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 56
    .line 57
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->y:I

    .line 58
    .line 59
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 69
    .line 70
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->k:I

    .line 71
    .line 72
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 76
    .line 77
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->n:F

    .line 78
    .line 79
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 83
    .line 84
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 85
    .line 86
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 87
    .line 88
    .line 89
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->q:I

    .line 90
    .line 91
    int-to-float v2, v2

    .line 92
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->p:I

    .line 93
    .line 94
    int-to-float v5, v5

    .line 95
    div-float/2addr v2, v5

    .line 96
    const/high16 v5, 0x42c80000    # 100.0f

    .line 97
    .line 98
    mul-float/2addr v2, v5

    .line 99
    float-to-int v2, v2

    .line 100
    iget-object v5, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 101
    .line 102
    new-instance v6, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v7, "%"

    .line 111
    .line 112
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    iget-object v6, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 124
    .line 125
    const/4 v8, 0x0

    .line 126
    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 127
    .line 128
    .line 129
    iget-boolean v6, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->r:Z

    .line 130
    .line 131
    if-eqz v6, :cond_0

    .line 132
    .line 133
    if-eqz v2, :cond_0

    .line 134
    .line 135
    iget v6, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->s:I

    .line 136
    .line 137
    if-nez v6, :cond_0

    .line 138
    .line 139
    new-instance v6, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    div-float/2addr v5, v3

    .line 155
    sub-float v5, v1, v5

    .line 156
    .line 157
    iget v6, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->n:F

    .line 158
    .line 159
    div-float/2addr v6, v3

    .line 160
    add-float/2addr v1, v6

    .line 161
    iget-object v3, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 162
    .line 163
    invoke-virtual {p1, v2, v5, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 164
    .line 165
    .line 166
    :cond_0
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 167
    .line 168
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->o:F

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 171
    .line 172
    .line 173
    new-instance v6, Landroid/graphics/RectF;

    .line 174
    .line 175
    iget v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->t:I

    .line 176
    .line 177
    sub-int v2, v0, v1

    .line 178
    .line 179
    int-to-float v2, v2

    .line 180
    sub-int v3, v0, v1

    .line 181
    .line 182
    int-to-float v3, v3

    .line 183
    add-int v5, v0, v1

    .line 184
    .line 185
    int-to-float v5, v5

    .line 186
    add-int/2addr v0, v1

    .line 187
    int-to-float v0, v0

    .line 188
    invoke-direct {v6, v2, v3, v5, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 192
    .line 193
    iget v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 196
    .line 197
    .line 198
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->s:I

    .line 199
    .line 200
    if-eqz v0, :cond_3

    .line 201
    .line 202
    if-eq v0, v4, :cond_1

    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 206
    .line 207
    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 210
    .line 211
    .line 212
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->q:I

    .line 213
    .line 214
    if-eqz v0, :cond_2

    .line 215
    .line 216
    iget v1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->l:I

    .line 217
    .line 218
    add-int/lit8 v2, v1, 0x5a

    .line 219
    .line 220
    int-to-float v7, v2

    .line 221
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->m:I

    .line 222
    .line 223
    sub-int/2addr v2, v1

    .line 224
    mul-int/2addr v2, v0

    .line 225
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->p:I

    .line 226
    .line 227
    div-int/2addr v2, v0

    .line 228
    int-to-float v8, v2

    .line 229
    const/4 v9, 0x1

    .line 230
    iget-object v10, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->c:Landroid/graphics/Paint;

    .line 231
    .line 232
    move-object v5, p1

    .line 233
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 234
    .line 235
    .line 236
    :cond_2
    :goto_0
    return-void

    .line 237
    :cond_3
    move-object v5, p1

    .line 238
    invoke-direct {p0, v5, v6}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->e(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->y:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCricleColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setCricleProgressColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public setGradientColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized setMax(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    if-ltz p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->p:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    const-string v0, "max not less than 0"

    .line 13
    .line 14
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw p1

    .line 18
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public declared-synchronized setProgress(I)V
    .locals 4

    .line 1
    const-string v0, "progress not less than 0 progress"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    if-gez p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-direct {v2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->p:I

    .line 35
    .line 36
    if-le p1, v0, :cond_1

    .line 37
    .line 38
    move p1, v0

    .line 39
    :cond_1
    if-gt p1, v0, :cond_2

    .line 40
    .line 41
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->q:I

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    .line 46
    :cond_2
    monitor-exit p0

    .line 47
    return-void

    .line 48
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    throw p1
.end method

.method public declared-synchronized setProgressAngle(I)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->C:I

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public setRoundColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->d:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRoundProgressColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public setRoundWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->o:F

    .line 2
    .line 3
    return-void
.end method

.method public setStartColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public setTextSize(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->n:F

    .line 2
    .line 3
    return-void
.end method
