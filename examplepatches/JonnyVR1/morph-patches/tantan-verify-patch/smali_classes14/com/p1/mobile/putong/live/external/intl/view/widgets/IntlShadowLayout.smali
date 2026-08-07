.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$b;,
        Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$a;
    }
.end annotation


# static fields
.field public static final s:F

.field public static final t:F

.field public static final u:F

.field public static final v:F


# instance fields
.field public a:I

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:I

.field public g:Z

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$a;

.field public m:Landroid/graphics/RectF;

.field public n:Landroid/graphics/RectF;

.field public o:F

.field public p:F

.field public q:Landroid/graphics/Paint;

.field public r:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/high16 v0, 0x40a00000    # 5.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    sput v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->s:F

    .line 9
    .line 10
    const/high16 v1, 0x41a00000    # 20.0f

    .line 11
    .line 12
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    sput v2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->t:F

    .line 18
    .line 19
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    sput v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->u:F

    .line 25
    .line 26
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    int-to-float v0, v0

    .line 31
    sput v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->v:F

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    .line 251
    invoke-direct {p0, p1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 252
    const-string p1, "#333333"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->a:I

    const/4 p1, 0x0

    .line 253
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 254
    sget p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->v:F

    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    const/high16 p1, 0x41200000    # 10.0f

    .line 255
    invoke-static {p1}, Ll/bnl0;->w(F)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 256
    invoke-static {p1}, Ll/bnl0;->w(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    const/4 p1, -0x1

    .line 257
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->f:I

    const/4 p1, 0x0

    .line 258
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->g:Z

    .line 259
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 260
    new-instance p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$b;

    invoke-direct {p1, p0, p0, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$b;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;Ll/zcp;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->l:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$a;

    .line 261
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->m:Landroid/graphics/RectF;

    .line 262
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->n:Landroid/graphics/RectF;

    .line 263
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 264
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->r:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 250
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p3, "#333333"

    .line 5
    .line 6
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->a:I

    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    iput p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->v:F

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 18
    .line 19
    const/high16 v1, 0x41200000    # 10.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    int-to-float v2, v2

    .line 26
    iput v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 27
    .line 28
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    iput v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 34
    .line 35
    const/4 v2, -0x1

    .line 36
    iput v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->f:I

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->g:Z

    .line 40
    .line 41
    iput v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    .line 42
    .line 43
    iput v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    .line 44
    .line 45
    iput v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    .line 46
    .line 47
    iput v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 48
    .line 49
    new-instance v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$b;

    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-direct {v4, p0, p0, v5}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$b;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;Ll/zcp;)V

    .line 53
    .line 54
    .line 55
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->l:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout$a;

    .line 56
    .line 57
    new-instance v4, Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->m:Landroid/graphics/RectF;

    .line 63
    .line 64
    new-instance v4, Landroid/graphics/RectF;

    .line 65
    .line 66
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->n:Landroid/graphics/RectF;

    .line 70
    .line 71
    new-instance v4, Landroid/graphics/Paint;

    .line 72
    .line 73
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 77
    .line 78
    new-instance v4, Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->r:Landroid/graphics/Paint;

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    invoke-virtual {p0, v4, v5}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 87
    .line 88
    .line 89
    sget-object v4, Ll/thc0;->U:[I

    .line 90
    .line 91
    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    sget p2, Ll/thc0;->Y:I

    .line 96
    .line 97
    const v4, -0xffff01

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, p2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->a:I

    .line 105
    .line 106
    sget p2, Ll/thc0;->V:I

    .line 107
    .line 108
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 113
    .line 114
    sget p2, Ll/thc0;->Z:I

    .line 115
    .line 116
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 121
    .line 122
    sget p2, Ll/thc0;->W:I

    .line 123
    .line 124
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->g:Z

    .line 129
    .line 130
    sget p2, Ll/thc0;->a0:I

    .line 131
    .line 132
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    int-to-float v0, v0

    .line 137
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 142
    .line 143
    sget p2, Ll/thc0;->b0:I

    .line 144
    .line 145
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    int-to-float v0, v0

    .line 150
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 155
    .line 156
    sget p2, Ll/thc0;->X:I

    .line 157
    .line 158
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->f:I

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 165
    .line 166
    .line 167
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 168
    .line 169
    cmpg-float p2, p1, p3

    .line 170
    .line 171
    if-gez p2, :cond_0

    .line 172
    .line 173
    neg-float p1, p1

    .line 174
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 175
    .line 176
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 177
    .line 178
    cmpg-float p2, p1, p3

    .line 179
    .line 180
    if-gez p2, :cond_1

    .line 181
    .line 182
    neg-float p1, p1

    .line 183
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 184
    .line 185
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->u:F

    .line 186
    .line 187
    iget p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 188
    .line 189
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 194
    .line 195
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 196
    .line 197
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    sget p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->t:F

    .line 202
    .line 203
    cmpl-float p1, p1, p2

    .line 204
    .line 205
    if-lez p1, :cond_2

    .line 206
    .line 207
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 208
    .line 209
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    div-float/2addr p1, p3

    .line 214
    mul-float/2addr p1, p2

    .line 215
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 216
    .line 217
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 218
    .line 219
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    cmpl-float p1, p1, p2

    .line 224
    .line 225
    if-lez p1, :cond_3

    .line 226
    .line 227
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 228
    .line 229
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 230
    .line 231
    .line 232
    move-result p3

    .line 233
    div-float/2addr p1, p3

    .line 234
    mul-float/2addr p1, p2

    .line 235
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 236
    .line 237
    :cond_3
    const-string p1, "#00ffffff"

    .line 238
    .line 239
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b()V

    .line 247
    .line 248
    .line 249
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->o:F

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->p:F

    .line 14
    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    cmpl-float v1, v1, v2

    .line 19
    .line 20
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    int-to-float v1, v3

    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->o:F

    .line 26
    .line 27
    iget v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 28
    .line 29
    sub-float/2addr v3, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    int-to-float v1, v3

    .line 32
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 33
    .line 34
    add-float/2addr v1, v3

    .line 35
    iget v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->o:F

    .line 36
    .line 37
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    .line 38
    .line 39
    int-to-float v5, v5

    .line 40
    sub-float/2addr v4, v5

    .line 41
    sub-float v3, v4, v3

    .line 42
    .line 43
    :goto_0
    iget v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 44
    .line 45
    cmpl-float v4, v4, v2

    .line 46
    .line 47
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 48
    .line 49
    if-nez v4, :cond_1

    .line 50
    .line 51
    int-to-float v4, v5

    .line 52
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 53
    .line 54
    :goto_1
    sub-float/2addr v0, v5

    .line 55
    goto :goto_2

    .line 56
    :cond_1
    int-to-float v4, v5

    .line 57
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 58
    .line 59
    add-float/2addr v4, v5

    .line 60
    iget v6, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    .line 61
    .line 62
    int-to-float v6, v6

    .line 63
    sub-float/2addr v0, v6

    .line 64
    goto :goto_1

    .line 65
    :goto_2
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 66
    .line 67
    cmpl-float v5, v5, v2

    .line 68
    .line 69
    if-lez v5, :cond_2

    .line 70
    .line 71
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 72
    .line 73
    new-instance v6, Landroid/graphics/BlurMaskFilter;

    .line 74
    .line 75
    iget v7, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 76
    .line 77
    sget-object v8, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    .line 78
    .line 79
    invoke-direct {v6, v7, v8}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 86
    .line 87
    iget v6, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->a:I

    .line 88
    .line 89
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    .line 91
    .line 92
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 93
    .line 94
    const/4 v6, 0x1

    .line 95
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->m:Landroid/graphics/RectF;

    .line 99
    .line 100
    invoke-virtual {v5, v1, v4, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->n:Landroid/graphics/RectF;

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    .line 106
    .line 107
    int-to-float v1, v1

    .line 108
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    .line 109
    .line 110
    int-to-float v3, v3

    .line 111
    iget v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->o:F

    .line 112
    .line 113
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    .line 114
    .line 115
    int-to-float v5, v5

    .line 116
    sub-float/2addr v4, v5

    .line 117
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->p:F

    .line 118
    .line 119
    iget v7, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 120
    .line 121
    int-to-float v7, v7

    .line 122
    sub-float/2addr v5, v7

    .line 123
    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 124
    .line 125
    .line 126
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 127
    .line 128
    cmpl-float v1, v0, v2

    .line 129
    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->m:Landroid/graphics/RectF;

    .line 131
    .line 132
    if-nez v1, :cond_3

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 135
    .line 136
    invoke-virtual {p1, v3, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->q:Landroid/graphics/Paint;

    .line 141
    .line 142
    invoke-virtual {p1, v3, v0, v0, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 143
    .line 144
    .line 145
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->r:Landroid/graphics/Paint;

    .line 146
    .line 147
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->f:I

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->r:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 155
    .line 156
    .line 157
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->b:F

    .line 158
    .line 159
    cmpl-float v1, v0, v2

    .line 160
    .line 161
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->n:Landroid/graphics/RectF;

    .line 162
    .line 163
    if-nez v1, :cond_4

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->r:Landroid/graphics/Paint;

    .line 166
    .line 167
    invoke-virtual {p1, v2, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->r:Landroid/graphics/Paint;

    .line 172
    .line 173
    invoke-virtual {p1, v2, v0, v0, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->d:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v2, v0, v1

    .line 5
    .line 6
    if-lez v2, :cond_0

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-float/2addr v2, v0

    .line 15
    float-to-int v0, v2

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    cmpl-float v2, v0, v1

    .line 20
    .line 21
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 22
    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    float-to-int v0, v3

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    .line 27
    .line 28
    float-to-int v0, v3

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-float/2addr v3, v0

    .line 37
    float-to-int v0, v3

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    .line 39
    .line 40
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->e:F

    .line 41
    .line 42
    cmpl-float v2, v0, v1

    .line 43
    .line 44
    if-lez v2, :cond_2

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 47
    .line 48
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-float/2addr v1, v0

    .line 53
    float-to-int v0, v1

    .line 54
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    cmpl-float v1, v0, v1

    .line 58
    .line 59
    iget v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->c:F

    .line 60
    .line 61
    if-nez v1, :cond_3

    .line 62
    .line 63
    float-to-int v0, v2

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    .line 65
    .line 66
    float-to-int v0, v2

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-float/2addr v2, v0

    .line 75
    float-to-int v0, v2

    .line 76
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    .line 77
    .line 78
    :goto_1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->h:I

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->j:I

    .line 81
    .line 82
    iget v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->i:I

    .line 83
    .line 84
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->k:I

    .line 85
    .line 86
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlShadowLayout;->a(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
