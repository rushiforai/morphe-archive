.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;
.super Lv/VLinear;
.source "SourceFile"


# static fields
.field public static j:Landroid/graphics/Bitmap;


# instance fields
.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Path;

.field public e:Landroid/graphics/Rect;

.field public f:Landroid/graphics/RectF;

.field public g:Landroid/graphics/PorterDuffXfermode;

.field public h:Z

.field public i:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 5
    .line 6
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->g:Landroid/graphics/PorterDuffXfermode;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->h:Z

    .line 15
    .line 16
    const v1, -0x8ff6

    .line 17
    .line 18
    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->i:I

    .line 20
    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    sget-object v2, Ll/khc0;->o0:[I

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget p2, Ll/khc0;->q0:I

    .line 31
    .line 32
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->h:Z

    .line 37
    .line 38
    sget p2, Ll/khc0;->p0:I

    .line 39
    .line 40
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->i:I

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->r()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v1, v0, v0, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->e:Landroid/graphics/Rect;

    .line 22
    .line 23
    new-instance v0, Landroid/graphics/RectF;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->f:Landroid/graphics/RectF;

    .line 30
    .line 31
    new-instance v0, Landroid/graphics/Path;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final P()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/dbc0;->nm:I

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sput-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public Q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->h:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 13
    .line 14
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->i:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 20
    .line 21
    const v2, -0x1f2226

    .line 22
    .line 23
    .line 24
    const/high16 v3, 0x41200000    # 10.0f

    .line 25
    .line 26
    const/4 v9, 0x0

    .line 27
    invoke-virtual {v1, v3, v9, v9, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v4, v1

    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v5, v1

    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    int-to-float v1, v1

    .line 45
    const/high16 v10, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float v6, v1, v10

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    int-to-float v1, v1

    .line 54
    div-float v7, v1, v10

    .line 55
    .line 56
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    const/4 v3, 0x0

    .line 60
    move-object/from16 v1, p1

    .line 61
    .line 62
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 63
    .line 64
    .line 65
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->h:Z

    .line 66
    .line 67
    if-eqz v1, :cond_0

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->P()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    int-to-float v4, v1

    .line 78
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    int-to-float v5, v1

    .line 83
    const/4 v6, 0x0

    .line 84
    const/16 v7, 0x1f

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    const/4 v3, 0x0

    .line 88
    move-object/from16 v1, p1

    .line 89
    .line 90
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 99
    .line 100
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    mul-int/2addr v3, v4

    .line 105
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    div-int/2addr v3, v4

    .line 110
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 111
    .line 112
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->e:Landroid/graphics/Rect;

    .line 121
    .line 122
    sget-object v5, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 123
    .line 124
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    const/4 v6, 0x0

    .line 129
    invoke-virtual {v4, v6, v6, v3, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    mul-int/2addr v3, v4

    .line 137
    int-to-float v3, v3

    .line 138
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 139
    .line 140
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    int-to-float v4, v4

    .line 145
    div-float/2addr v3, v4

    .line 146
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->f:Landroid/graphics/RectF;

    .line 147
    .line 148
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    int-to-float v5, v5

    .line 153
    invoke-virtual {v4, v9, v9, v3, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 154
    .line 155
    .line 156
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->j:Landroid/graphics/Bitmap;

    .line 157
    .line 158
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->e:Landroid/graphics/Rect;

    .line 159
    .line 160
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->f:Landroid/graphics/RectF;

    .line 161
    .line 162
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 163
    .line 164
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 165
    .line 166
    .line 167
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 168
    .line 169
    const/4 v4, -0x1

    .line 170
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 171
    .line 172
    .line 173
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 174
    .line 175
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 176
    .line 177
    .line 178
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 179
    .line 180
    sget-object v4, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 181
    .line 182
    invoke-virtual {v3, v4}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 183
    .line 184
    .line 185
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 186
    .line 187
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    add-int/lit8 v3, v3, 0x1

    .line 192
    .line 193
    int-to-float v14, v3

    .line 194
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    add-int/lit8 v3, v3, 0x1

    .line 199
    .line 200
    int-to-float v15, v3

    .line 201
    sget-object v16, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 202
    .line 203
    const/high16 v12, -0x40800000    # -1.0f

    .line 204
    .line 205
    const/high16 v13, -0x40800000    # -1.0f

    .line 206
    .line 207
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 208
    .line 209
    .line 210
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    int-to-float v4, v4

    .line 217
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    int-to-float v5, v5

    .line 222
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 223
    .line 224
    .line 225
    move-result v6

    .line 226
    int-to-float v6, v6

    .line 227
    div-float v21, v6, v10

    .line 228
    .line 229
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    int-to-float v6, v6

    .line 234
    div-float v22, v6, v10

    .line 235
    .line 236
    const/16 v17, 0x0

    .line 237
    .line 238
    const/16 v18, 0x0

    .line 239
    .line 240
    move/from16 v19, v4

    .line 241
    .line 242
    move/from16 v20, v5

    .line 243
    .line 244
    move-object/from16 v23, v16

    .line 245
    .line 246
    move-object/from16 v16, v3

    .line 247
    .line 248
    invoke-virtual/range {v16 .. v23}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 249
    .line 250
    .line 251
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 252
    .line 253
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->g:Landroid/graphics/PorterDuffXfermode;

    .line 254
    .line 255
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 256
    .line 257
    .line 258
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 259
    .line 260
    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 261
    .line 262
    .line 263
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->d:Landroid/graphics/Path;

    .line 264
    .line 265
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->c:Landroid/graphics/Paint;

    .line 266
    .line 267
    invoke-virtual {v1, v3, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 271
    .line 272
    .line 273
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
