.class public Lv/VPageIndicator_Action;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/text/TextPaint;

.field public c:Landroid/graphics/RectF;

.field public d:Ll/cf60;

.field public e:Landroid/database/DataSetObserver;

.field public f:I

.field public g:I

.field public h:F

.field public i:I

.field public j:I

.field public k:Ll/x20;

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Landroid/graphics/Paint$FontMetrics;

.field public o:Ll/kmj;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, p1, v0, v1}, Lv/VPageIndicator_Action;->g(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lv/VPageIndicator_Action;->g(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lv/VPageIndicator_Action;->g(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic a(Lv/VPageIndicator_Action;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VPageIndicator_Action;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic b(Lv/VPageIndicator_Action;)Ll/cf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VPageIndicator_Action;->d:Ll/cf60;

    return-object p0
.end method

.method public static bridge synthetic c(Lv/VPageIndicator_Action;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VPageIndicator_Action;->f:I

    return p0
.end method

.method public static bridge synthetic d(Lv/VPageIndicator_Action;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VPageIndicator_Action;->g:I

    return p0
.end method

.method public static bridge synthetic e(Lv/VPageIndicator_Action;)F
    .locals 0

    .line 1
    iget p0, p0, Lv/VPageIndicator_Action;->h:F

    return p0
.end method

.method public static bridge synthetic f(Lv/VPageIndicator_Action;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPageIndicator_Action;->f:I

    return-void
.end method

.method private g(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 1
    sget-object v0, Ll/hhc0;->b4:[I

    .line 2
    .line 3
    sget v1, Ll/tgc0;->r:I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget p3, Ll/hhc0;->c4:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    sget v0, Ll/hhc0;->g4:I

    .line 17
    .line 18
    const/high16 v1, -0x1000000

    .line 19
    .line 20
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget v1, Ll/hhc0;->d4:I

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sget v3, Ll/hhc0;->e4:I

    .line 32
    .line 33
    invoke-virtual {p2, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sget v3, Ll/hhc0;->f4:I

    .line 38
    .line 39
    invoke-virtual {p2, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 44
    .line 45
    .line 46
    new-instance p2, Landroid/graphics/RectF;

    .line 47
    .line 48
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lv/VPageIndicator_Action;->c:Landroid/graphics/RectF;

    .line 52
    .line 53
    new-instance p2, Landroid/graphics/Paint;

    .line 54
    .line 55
    const/4 v4, 0x1

    .line 56
    invoke-direct {p2, v4}, Landroid/graphics/Paint;-><init>(I)V

    .line 57
    .line 58
    .line 59
    iput-object p2, p0, Lv/VPageIndicator_Action;->a:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    .line 63
    .line 64
    new-instance p2, Landroid/text/TextPaint;

    .line 65
    .line 66
    invoke-direct {p2, v4}, Landroid/text/TextPaint;-><init>(I)V

    .line 67
    .line 68
    .line 69
    iput-object p2, p0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 70
    .line 71
    sget-object p3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 72
    .line 73
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 77
    .line 78
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 82
    .line 83
    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 87
    .line 88
    const/4 p3, 0x3

    .line 89
    invoke-static {p3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 94
    .line 95
    .line 96
    new-instance p2, Landroid/graphics/Paint$FontMetrics;

    .line 97
    .line 98
    invoke-direct {p2}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object p2, p0, Lv/VPageIndicator_Action;->n:Landroid/graphics/Paint$FontMetrics;

    .line 102
    .line 103
    iput v1, p0, Lv/VPageIndicator_Action;->i:I

    .line 104
    .line 105
    iput v2, p0, Lv/VPageIndicator_Action;->j:I

    .line 106
    .line 107
    const/high16 p2, 0x40800000    # 4.0f

    .line 108
    .line 109
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    iput p2, p0, Lv/VPageIndicator_Action;->l:I

    .line 114
    .line 115
    iput-object v3, p0, Lv/VPageIndicator_Action;->m:Ljava/lang/String;

    .line 116
    .line 117
    new-instance p2, Ll/kmj;

    .line 118
    .line 119
    new-instance p3, Lv/VPageIndicator_Action$a;

    .line 120
    .line 121
    invoke-direct {p3, p0}, Lv/VPageIndicator_Action$a;-><init>(Lv/VPageIndicator_Action;)V

    .line 122
    .line 123
    .line 124
    invoke-direct {p2, p1, p3}, Ll/kmj;-><init>(Landroid/content/Context;Ll/kmj$c;)V

    .line 125
    .line 126
    .line 127
    iput-object p2, p0, Lv/VPageIndicator_Action;->o:Ll/kmj;

    .line 128
    .line 129
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lv/VPageIndicator_Action;->h:F

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    cmpl-float v3, v2, v3

    .line 9
    .line 10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    iget v3, v0, Lv/VPageIndicator_Action;->g:I

    .line 15
    .line 16
    if-lez v3, :cond_0

    .line 17
    .line 18
    add-int/lit8 v3, v3, -0x1

    .line 19
    .line 20
    move v2, v4

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget v3, v0, Lv/VPageIndicator_Action;->g:I

    .line 23
    .line 24
    :goto_0
    iget v5, v0, Lv/VPageIndicator_Action;->f:I

    .line 25
    .line 26
    add-int/lit8 v6, v5, -0x1

    .line 27
    .line 28
    iget v7, v0, Lv/VPageIndicator_Action;->j:I

    .line 29
    .line 30
    mul-int/2addr v6, v7

    .line 31
    add-int/lit8 v5, v5, 0x2

    .line 32
    .line 33
    iget v7, v0, Lv/VPageIndicator_Action;->i:I

    .line 34
    .line 35
    mul-int/2addr v5, v7

    .line 36
    add-int/2addr v6, v5

    .line 37
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    iget v7, v0, Lv/VPageIndicator_Action;->i:I

    .line 42
    .line 43
    sub-int/2addr v5, v7

    .line 44
    int-to-float v5, v5

    .line 45
    const/high16 v8, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v5, v8

    .line 48
    int-to-float v7, v7

    .line 49
    add-float/2addr v7, v5

    .line 50
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    sub-int/2addr v9, v6

    .line 55
    int-to-float v6, v9

    .line 56
    div-float/2addr v6, v8

    .line 57
    const/4 v9, 0x0

    .line 58
    :goto_1
    iget v10, v0, Lv/VPageIndicator_Action;->f:I

    .line 59
    .line 60
    if-ge v9, v10, :cond_6

    .line 61
    .line 62
    if-ne v9, v3, :cond_1

    .line 63
    .line 64
    iget v10, v0, Lv/VPageIndicator_Action;->i:I

    .line 65
    .line 66
    int-to-float v11, v10

    .line 67
    mul-int/lit8 v10, v10, 0x2

    .line 68
    .line 69
    int-to-float v10, v10

    .line 70
    sub-float v12, v4, v2

    .line 71
    .line 72
    mul-float/2addr v10, v12

    .line 73
    add-float/2addr v11, v10

    .line 74
    goto :goto_2

    .line 75
    :cond_1
    add-int/lit8 v10, v3, 0x1

    .line 76
    .line 77
    iget v11, v0, Lv/VPageIndicator_Action;->i:I

    .line 78
    .line 79
    if-ne v9, v10, :cond_2

    .line 80
    .line 81
    int-to-float v10, v11

    .line 82
    mul-int/lit8 v11, v11, 0x2

    .line 83
    .line 84
    int-to-float v11, v11

    .line 85
    mul-float/2addr v11, v2

    .line 86
    add-float/2addr v11, v10

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    int-to-float v11, v11

    .line 89
    :goto_2
    iget-object v10, v0, Lv/VPageIndicator_Action;->c:Landroid/graphics/RectF;

    .line 90
    .line 91
    add-float v12, v6, v11

    .line 92
    .line 93
    invoke-virtual {v10, v6, v5, v12, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 94
    .line 95
    .line 96
    iget v10, v0, Lv/VPageIndicator_Action;->f:I

    .line 97
    .line 98
    add-int/lit8 v13, v10, -0x2

    .line 99
    .line 100
    const/16 v14, 0xff

    .line 101
    .line 102
    if-ge v3, v13, :cond_3

    .line 103
    .line 104
    iget-object v10, v0, Lv/VPageIndicator_Action;->a:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {v10, v14}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 107
    .line 108
    .line 109
    iget-object v10, v0, Lv/VPageIndicator_Action;->c:Landroid/graphics/RectF;

    .line 110
    .line 111
    iget v12, v0, Lv/VPageIndicator_Action;->i:I

    .line 112
    .line 113
    int-to-float v13, v12

    .line 114
    int-to-float v12, v12

    .line 115
    iget-object v14, v0, Lv/VPageIndicator_Action;->a:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {v1, v10, v13, v12, v14}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 118
    .line 119
    .line 120
    goto/16 :goto_3

    .line 121
    .line 122
    :cond_3
    add-int/lit8 v10, v10, -0x1

    .line 123
    .line 124
    iget-object v13, v0, Lv/VPageIndicator_Action;->a:Landroid/graphics/Paint;

    .line 125
    .line 126
    if-ge v9, v10, :cond_4

    .line 127
    .line 128
    const/high16 v10, 0x437f0000    # 255.0f

    .line 129
    .line 130
    sub-float v12, v4, v2

    .line 131
    .line 132
    mul-float/2addr v12, v10

    .line 133
    float-to-int v10, v12

    .line 134
    invoke-virtual {v13, v10}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 135
    .line 136
    .line 137
    iget-object v10, v0, Lv/VPageIndicator_Action;->c:Landroid/graphics/RectF;

    .line 138
    .line 139
    iget v12, v0, Lv/VPageIndicator_Action;->i:I

    .line 140
    .line 141
    int-to-float v13, v12

    .line 142
    int-to-float v12, v12

    .line 143
    iget-object v14, v0, Lv/VPageIndicator_Action;->a:Landroid/graphics/Paint;

    .line 144
    .line 145
    invoke-virtual {v1, v10, v13, v12, v14}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_3

    .line 149
    .line 150
    :cond_4
    invoke-virtual {v13, v14}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    int-to-float v5, v5

    .line 158
    sub-float/2addr v5, v12

    .line 159
    mul-float/2addr v5, v2

    .line 160
    add-float/2addr v12, v5

    .line 161
    iget v5, v0, Lv/VPageIndicator_Action;->i:I

    .line 162
    .line 163
    int-to-float v5, v5

    .line 164
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    iget v11, v0, Lv/VPageIndicator_Action;->i:I

    .line 169
    .line 170
    sub-int/2addr v10, v11

    .line 171
    int-to-float v10, v10

    .line 172
    mul-float/2addr v10, v2

    .line 173
    add-float/2addr v5, v10

    .line 174
    int-to-float v10, v11

    .line 175
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 176
    .line 177
    .line 178
    move-result v11

    .line 179
    iget v13, v0, Lv/VPageIndicator_Action;->i:I

    .line 180
    .line 181
    sub-int/2addr v11, v13

    .line 182
    int-to-float v11, v11

    .line 183
    mul-float/2addr v11, v2

    .line 184
    add-float/2addr v10, v11

    .line 185
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 186
    .line 187
    .line 188
    move-result v11

    .line 189
    int-to-float v11, v11

    .line 190
    sub-float/2addr v11, v10

    .line 191
    div-float/2addr v11, v8

    .line 192
    iget-object v13, v0, Lv/VPageIndicator_Action;->c:Landroid/graphics/RectF;

    .line 193
    .line 194
    sub-float v14, v12, v5

    .line 195
    .line 196
    add-float v15, v11, v10

    .line 197
    .line 198
    invoke-virtual {v13, v14, v11, v12, v15}, Landroid/graphics/RectF;->set(FFFF)V

    .line 199
    .line 200
    .line 201
    iget-object v13, v0, Lv/VPageIndicator_Action;->c:Landroid/graphics/RectF;

    .line 202
    .line 203
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 204
    .line 205
    .line 206
    move-result v14

    .line 207
    int-to-float v14, v14

    .line 208
    div-float/2addr v14, v8

    .line 209
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 210
    .line 211
    .line 212
    move-result v15

    .line 213
    int-to-float v15, v15

    .line 214
    div-float/2addr v15, v8

    .line 215
    iget-object v4, v0, Lv/VPageIndicator_Action;->a:Landroid/graphics/Paint;

    .line 216
    .line 217
    invoke-virtual {v1, v13, v14, v15, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 218
    .line 219
    .line 220
    const/high16 v4, 0x40400000    # 3.0f

    .line 221
    .line 222
    div-float/2addr v10, v4

    .line 223
    iget v4, v0, Lv/VPageIndicator_Action;->l:I

    .line 224
    .line 225
    int-to-float v4, v4

    .line 226
    cmpl-float v4, v10, v4

    .line 227
    .line 228
    if-lez v4, :cond_5

    .line 229
    .line 230
    iget-object v4, v0, Lv/VPageIndicator_Action;->m:Ljava/lang/String;

    .line 231
    .line 232
    if-eqz v4, :cond_5

    .line 233
    .line 234
    iget-object v4, v0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 235
    .line 236
    invoke-virtual {v4, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 237
    .line 238
    .line 239
    iget-object v4, v0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 240
    .line 241
    iget-object v10, v0, Lv/VPageIndicator_Action;->n:Landroid/graphics/Paint$FontMetrics;

    .line 242
    .line 243
    invoke-virtual {v4, v10}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 244
    .line 245
    .line 246
    iget-object v4, v0, Lv/VPageIndicator_Action;->m:Ljava/lang/String;

    .line 247
    .line 248
    div-float v10, v5, v8

    .line 249
    .line 250
    sub-float/2addr v12, v10

    .line 251
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 252
    .line 253
    .line 254
    move-result v10

    .line 255
    div-int/lit8 v10, v10, 0x2

    .line 256
    .line 257
    int-to-float v10, v10

    .line 258
    iget-object v13, v0, Lv/VPageIndicator_Action;->n:Landroid/graphics/Paint$FontMetrics;

    .line 259
    .line 260
    iget v14, v13, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 261
    .line 262
    iget v13, v13, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 263
    .line 264
    sub-float v13, v14, v13

    .line 265
    .line 266
    div-float/2addr v13, v8

    .line 267
    add-float/2addr v10, v13

    .line 268
    sub-float/2addr v10, v14

    .line 269
    iget-object v13, v0, Lv/VPageIndicator_Action;->b:Landroid/text/TextPaint;

    .line 270
    .line 271
    invoke-virtual {v1, v4, v12, v10, v13}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 272
    .line 273
    .line 274
    :cond_5
    move/from16 v16, v11

    .line 275
    .line 276
    move v11, v5

    .line 277
    move/from16 v5, v16

    .line 278
    .line 279
    :goto_3
    iget v4, v0, Lv/VPageIndicator_Action;->j:I

    .line 280
    .line 281
    int-to-float v4, v4

    .line 282
    add-float/2addr v11, v4

    .line 283
    add-float/2addr v6, v11

    .line 284
    add-int/lit8 v9, v9, 0x1

    .line 285
    .line 286
    const/high16 v4, 0x3f800000    # 1.0f

    .line 287
    .line 288
    goto/16 :goto_1

    .line 289
    .line 290
    :cond_6
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VPageIndicator_Action;->g:I

    .line 2
    .line 3
    iput p2, p0, Lv/VPageIndicator_Action;->h:F

    .line 4
    .line 5
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VPageIndicator_Action;->o:Ll/kmj;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kmj;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public setAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VPageIndicator_Action;->k:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VPageIndicator_Action;->d:Ll/cf60;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lv/VPageIndicator_Action;->e:Landroid/database/DataSetObserver;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/cf60;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lv/VPageIndicator_Action;->d:Ll/cf60;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lv/VPageIndicator_Action;->f:I

    .line 23
    .line 24
    iget-object v0, p0, Lv/VPageIndicator_Action;->e:Landroid/database/DataSetObserver;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Lv/VPageIndicator_Action$b;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lv/VPageIndicator_Action$b;-><init>(Lv/VPageIndicator_Action;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lv/VPageIndicator_Action;->e:Landroid/database/DataSetObserver;

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lv/VPageIndicator_Action;->d:Ll/cf60;

    .line 36
    .line 37
    iget-object v1, p0, Lv/VPageIndicator_Action;->e:Landroid/database/DataSetObserver;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/cf60;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    const-string p0, "setViewPager must be called after ViewPager#setAdapter"

    .line 47
    .line 48
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
