.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Path;

.field public c:F

.field public d:F

.field public e:F

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40a00000    # 5.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    .line 7
    .line 8
    const/high16 p1, -0x4e000000

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->f:I

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->g:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x40a00000    # 5.0f

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    const/high16 p1, -0x4e000000

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->f:I

    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->g:I

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x40a00000    # 5.0f

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    const/high16 p1, -0x4e000000

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->f:I

    const/4 p1, -0x1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->g:I

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/qa00;->o:I

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 23
    .line 24
    const/high16 v0, 0x41400000    # 12.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    int-to-float v0, v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 32
    .line 33
    new-instance v0, Landroid/graphics/Path;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->f:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v4, v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v5, v0

    .line 23
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 24
    .line 25
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a:Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v3, 0x0

    .line 29
    move v7, v6

    .line 30
    move-object v1, p1

    .line 31
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-object v1, p1

    .line 36
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    cmpl-float p1, p1, v0

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 49
    .line 50
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    .line 51
    .line 52
    neg-float v2, v2

    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    int-to-float v3, v3

    .line 58
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 59
    .line 60
    sub-float/2addr v3, v4

    .line 61
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 62
    .line 63
    sub-float/2addr v3, v4

    .line 64
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    int-to-float v2, v2

    .line 74
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 75
    .line 76
    sub-float/2addr v2, v3

    .line 77
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 78
    .line 79
    sub-float/2addr v2, v3

    .line 80
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 81
    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    int-to-float p1, p1

    .line 90
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 91
    .line 92
    sub-float/2addr p1, v0

    .line 93
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 94
    .line 95
    const/high16 v2, 0x40000000    # 2.0f

    .line 96
    .line 97
    mul-float v4, v0, v2

    .line 98
    .line 99
    sub-float v5, p1, v4

    .line 100
    .line 101
    mul-float v6, v0, v2

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    int-to-float p1, p1

    .line 108
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 109
    .line 110
    sub-float v7, p1, v0

    .line 111
    .line 112
    const/high16 v9, -0x3d4c0000    # -90.0f

    .line 113
    .line 114
    const/4 v10, 0x0

    .line 115
    const/4 v4, 0x0

    .line 116
    const/high16 v8, 0x43340000    # 180.0f

    .line 117
    .line 118
    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    int-to-float v0, v0

    .line 128
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 129
    .line 130
    sub-float/2addr v0, v3

    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    int-to-float v3, v3

    .line 136
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 137
    .line 138
    sub-float/2addr v3, v4

    .line 139
    invoke-virtual {p1, v0, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 140
    .line 141
    .line 142
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    int-to-float p1, p1

    .line 149
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 150
    .line 151
    mul-float/2addr v0, v2

    .line 152
    sub-float v5, p1, v0

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    int-to-float p1, p1

    .line 159
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 160
    .line 161
    sub-float/2addr p1, v0

    .line 162
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 163
    .line 164
    mul-float/2addr v0, v2

    .line 165
    sub-float v6, p1, v0

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    int-to-float v7, p1

    .line 172
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    int-to-float p1, p1

    .line 177
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 178
    .line 179
    sub-float v8, p1, v0

    .line 180
    .line 181
    const/high16 v10, -0x3d4c0000    # -90.0f

    .line 182
    .line 183
    const/4 v11, 0x0

    .line 184
    const/high16 v9, 0x42b40000    # 90.0f

    .line 185
    .line 186
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 190
    .line 191
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    int-to-float v0, v0

    .line 196
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    .line 197
    .line 198
    add-float/2addr v0, v2

    .line 199
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    int-to-float v2, v2

    .line 204
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 205
    .line 206
    sub-float/2addr v2, v3

    .line 207
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 208
    .line 209
    sub-float/2addr v2, v3

    .line 210
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 214
    .line 215
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    int-to-float v0, v0

    .line 220
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    .line 221
    .line 222
    add-float/2addr v0, v2

    .line 223
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    int-to-float v2, v2

    .line 228
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 232
    .line 233
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    .line 234
    .line 235
    neg-float v0, v0

    .line 236
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    int-to-float v2, v2

    .line 241
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 242
    .line 243
    .line 244
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 245
    .line 246
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->e:F

    .line 247
    .line 248
    neg-float v0, v0

    .line 249
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    int-to-float v2, v2

    .line 254
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->c:F

    .line 255
    .line 256
    sub-float/2addr v2, v3

    .line 257
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 258
    .line 259
    sub-float/2addr v2, v3

    .line 260
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 261
    .line 262
    .line 263
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 264
    .line 265
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a:Landroid/graphics/Paint;

    .line 269
    .line 270
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->g:I

    .line 271
    .line 272
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->b:Landroid/graphics/Path;

    .line 276
    .line 277
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->a:Landroid/graphics/Paint;

    .line 278
    .line 279
    invoke-virtual {v1, p1, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 280
    .line 281
    .line 282
    :cond_1
    return-void
.end method

.method public setBottomSize(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedGuideBgView;->d:F

    .line 3
    .line 4
    return-void
.end method
