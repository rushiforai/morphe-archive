.class public Ll/pri0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static i:I = 0x2

.field public static j:I = 0x3

.field public static k:I = 0x6


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I

.field public final e:I

.field public f:Z

.field public g:I

.field public h:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pri0;->f:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/pri0;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput p3, p0, Ll/pri0;->c:I

    .line 10
    .line 11
    iput p5, p0, Ll/pri0;->d:I

    .line 12
    .line 13
    iput p2, p0, Ll/pri0;->e:I

    .line 14
    .line 15
    new-instance p1, Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {p1, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 23
    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 30
    .line 31
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 35
    .line 36
    .line 37
    sget-object p3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 38
    .line 39
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 40
    .line 41
    .line 42
    iput-boolean p2, p0, Ll/pri0;->f:Z

    .line 43
    .line 44
    iput p6, p0, Ll/pri0;->g:I

    .line 45
    .line 46
    iput p7, p0, Ll/pri0;->h:I

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    int-to-float v3, v3

    .line 12
    iget v4, v2, Landroid/graphics/Rect;->top:I

    .line 13
    .line 14
    int-to-float v4, v4

    .line 15
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 19
    .line 20
    .line 21
    move-result v8

    .line 22
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 23
    .line 24
    .line 25
    move-result v9

    .line 26
    iget v2, p0, Ll/pri0;->c:I

    .line 27
    .line 28
    const/4 v10, 0x2

    .line 29
    if-gez v2, :cond_0

    .line 30
    .line 31
    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    div-int/2addr v2, v10

    .line 36
    :cond_0
    iget-object v3, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 37
    .line 38
    int-to-float v2, v2

    .line 39
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 40
    .line 41
    .line 42
    iget-boolean v2, p0, Ll/pri0;->f:Z

    .line 43
    .line 44
    const/high16 v11, 0x40000000    # 2.0f

    .line 45
    .line 46
    if-eqz v2, :cond_6

    .line 47
    .line 48
    iget v2, p0, Ll/pri0;->g:I

    .line 49
    .line 50
    if-eq v2, v10, :cond_5

    .line 51
    .line 52
    const/4 v3, 0x3

    .line 53
    const/4 v4, 0x0

    .line 54
    if-eq v2, v3, :cond_4

    .line 55
    .line 56
    const/4 v3, 0x4

    .line 57
    if-eq v2, v3, :cond_3

    .line 58
    .line 59
    const/4 v3, 0x5

    .line 60
    if-eq v2, v3, :cond_2

    .line 61
    .line 62
    const/4 v3, 0x6

    .line 63
    if-eq v2, v3, :cond_1

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_1
    iget-object v2, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 68
    .line 69
    iget v3, p0, Ll/pri0;->h:I

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    .line 73
    .line 74
    new-instance v2, Landroid/graphics/RectF;

    .line 75
    .line 76
    int-to-float v3, v8

    .line 77
    int-to-float v5, v9

    .line 78
    invoke-direct {v2, v4, v4, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 79
    .line 80
    .line 81
    div-int/lit8 v3, v9, 0x2

    .line 82
    .line 83
    int-to-float v3, v3

    .line 84
    iget-object v4, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 85
    .line 86
    invoke-virtual {p1, v2, v3, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 87
    .line 88
    .line 89
    goto/16 :goto_0

    .line 90
    .line 91
    :cond_2
    iget-object v2, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 92
    .line 93
    iget v3, p0, Ll/pri0;->h:I

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 96
    .line 97
    .line 98
    new-instance v2, Landroid/graphics/RectF;

    .line 99
    .line 100
    div-int/lit8 v3, v8, 0x2

    .line 101
    .line 102
    int-to-float v3, v3

    .line 103
    int-to-float v5, v9

    .line 104
    invoke-direct {v2, v4, v4, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 110
    .line 111
    .line 112
    new-instance v2, Landroid/graphics/RectF;

    .line 113
    .line 114
    int-to-float v3, v8

    .line 115
    invoke-direct {v2, v4, v4, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 116
    .line 117
    .line 118
    const/4 v5, 0x1

    .line 119
    iget-object v6, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 120
    .line 121
    const/high16 v3, 0x43870000    # 270.0f

    .line 122
    .line 123
    const/high16 v4, 0x43340000    # 180.0f

    .line 124
    .line 125
    move-object v1, p1

    .line 126
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    iget-object v2, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 131
    .line 132
    iget v3, p0, Ll/pri0;->h:I

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 135
    .line 136
    .line 137
    new-instance v2, Landroid/graphics/RectF;

    .line 138
    .line 139
    div-int/lit8 v3, v8, 0x2

    .line 140
    .line 141
    int-to-float v3, v3

    .line 142
    int-to-float v5, v8

    .line 143
    int-to-float v6, v9

    .line 144
    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 145
    .line 146
    .line 147
    iget-object v3, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 148
    .line 149
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 150
    .line 151
    .line 152
    new-instance v2, Landroid/graphics/RectF;

    .line 153
    .line 154
    invoke-direct {v2, v4, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 155
    .line 156
    .line 157
    const/4 v5, 0x1

    .line 158
    iget-object v6, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 159
    .line 160
    const/high16 v3, 0x42b40000    # 90.0f

    .line 161
    .line 162
    const/high16 v4, 0x43340000    # 180.0f

    .line 163
    .line 164
    move-object v1, p1

    .line 165
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 166
    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_4
    iget-object v2, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 170
    .line 171
    iget v3, p0, Ll/pri0;->h:I

    .line 172
    .line 173
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 174
    .line 175
    .line 176
    new-instance v2, Landroid/graphics/RectF;

    .line 177
    .line 178
    int-to-float v3, v8

    .line 179
    int-to-float v5, v9

    .line 180
    invoke-direct {v2, v4, v4, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 181
    .line 182
    .line 183
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    int-to-float v3, v3

    .line 188
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    int-to-float v4, v4

    .line 193
    iget-object v5, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 194
    .line 195
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 196
    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_5
    iget-object v2, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 200
    .line 201
    iget v3, p0, Ll/pri0;->h:I

    .line 202
    .line 203
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 204
    .line 205
    .line 206
    div-int/lit8 v2, v8, 0x2

    .line 207
    .line 208
    int-to-float v2, v2

    .line 209
    div-int/lit8 v3, v9, 0x2

    .line 210
    .line 211
    int-to-float v3, v3

    .line 212
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    div-int/2addr v4, v10

    .line 217
    int-to-float v4, v4

    .line 218
    iget-object v5, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 219
    .line 220
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 221
    .line 222
    .line 223
    :goto_0
    iget-object v2, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 224
    .line 225
    iget v3, p0, Ll/pri0;->d:I

    .line 226
    .line 227
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 228
    .line 229
    .line 230
    :cond_6
    iget-object v2, p0, Ll/pri0;->b:Ljava/lang/String;

    .line 231
    .line 232
    div-int/2addr v8, v10

    .line 233
    int-to-float v3, v8

    .line 234
    div-int/2addr v9, v10

    .line 235
    int-to-float v4, v9

    .line 236
    iget-object v5, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 237
    .line 238
    invoke-virtual {v5}, Landroid/graphics/Paint;->descent()F

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    iget-object v6, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 243
    .line 244
    invoke-virtual {v6}, Landroid/graphics/Paint;->ascent()F

    .line 245
    .line 246
    .line 247
    move-result v6

    .line 248
    add-float/2addr v5, v6

    .line 249
    div-float/2addr v5, v11

    .line 250
    sub-float/2addr v4, v5

    .line 251
    iget-object v0, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 252
    .line 253
    invoke-virtual {p1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 257
    .line 258
    .line 259
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pri0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pri0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pri0;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
