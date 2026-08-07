.class public Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:F

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->a:F

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Ll/ius;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)V

    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->a:F

    .line 2
    .line 3
    return-void
.end method

.method public b(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->j()Landroid/graphics/RectF;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 25
    .line 26
    .line 27
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 28
    .line 29
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->f()Landroid/graphics/Paint;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 38
    .line 39
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v4}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->f()Landroid/graphics/Paint;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const/4 v6, 0x1

    .line 48
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 55
    .line 56
    invoke-static {v7}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-virtual {v7}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->h()Landroid/graphics/Path;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 65
    .line 66
    .line 67
    iget-object v8, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 68
    .line 69
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    shr-int/2addr v8, v6

    .line 74
    int-to-float v8, v8

    .line 75
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 76
    .line 77
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    .line 78
    .line 79
    .line 80
    move-result v9

    .line 81
    shr-int/2addr v9, v6

    .line 82
    int-to-float v9, v9

    .line 83
    invoke-virtual {v1, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    const/high16 v9, 0x40000000    # 2.0f

    .line 91
    .line 92
    div-float/2addr v8, v9

    .line 93
    sget v10, Ll/qa00;->c:I

    .line 94
    .line 95
    int-to-float v10, v10

    .line 96
    sub-float/2addr v8, v10

    .line 97
    sget-object v10, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 98
    .line 99
    invoke-virtual {v7, v5, v5, v8, v10}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 100
    .line 101
    .line 102
    sget-object v8, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 103
    .line 104
    invoke-virtual {v1, v7, v8}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 105
    .line 106
    .line 107
    iget-object v8, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 108
    .line 109
    invoke-static {v8}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->b(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Landroid/graphics/LinearGradient;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    if-nez v8, :cond_0

    .line 114
    .line 115
    iget-object v8, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 116
    .line 117
    new-instance v10, Landroid/graphics/LinearGradient;

    .line 118
    .line 119
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 120
    .line 121
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    .line 122
    .line 123
    .line 124
    move-result v11

    .line 125
    neg-int v11, v11

    .line 126
    shr-int/2addr v11, v6

    .line 127
    int-to-float v12, v11

    .line 128
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 129
    .line 130
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    .line 131
    .line 132
    .line 133
    move-result v11

    .line 134
    shr-int/lit8 v6, v11, 0x1

    .line 135
    .line 136
    int-to-float v14, v6

    .line 137
    const v6, -0xbcb7

    .line 138
    .line 139
    .line 140
    const v11, -0x183c1

    .line 141
    .line 142
    .line 143
    filled-new-array {v6, v11}, [I

    .line 144
    .line 145
    .line 146
    move-result-object v15

    .line 147
    const/4 v6, 0x2

    .line 148
    new-array v6, v6, [F

    .line 149
    .line 150
    fill-array-data v6, :array_0

    .line 151
    .line 152
    .line 153
    sget-object v17, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 154
    .line 155
    const/4 v11, 0x0

    .line 156
    const/4 v13, 0x0

    .line 157
    move-object/from16 v16, v6

    .line 158
    .line 159
    invoke-direct/range {v10 .. v17}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v8, v10}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Landroid/graphics/LinearGradient;)V

    .line 163
    .line 164
    .line 165
    :cond_0
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 166
    .line 167
    invoke-static {v6}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->b(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Landroid/graphics/LinearGradient;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 172
    .line 173
    .line 174
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 175
    .line 176
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 177
    .line 178
    .line 179
    iget v8, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->a:F

    .line 180
    .line 181
    const/high16 v10, 0x3f800000    # 1.0f

    .line 182
    .line 183
    sub-float/2addr v10, v8

    .line 184
    const/high16 v8, 0x434c0000    # 204.0f

    .line 185
    .line 186
    mul-float/2addr v10, v8

    .line 187
    float-to-int v8, v10

    .line 188
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    div-float/2addr v8, v9

    .line 196
    sget v10, Ll/qa00;->g:I

    .line 197
    .line 198
    int-to-float v10, v10

    .line 199
    iget v11, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->a:F

    .line 200
    .line 201
    mul-float/2addr v10, v11

    .line 202
    add-float/2addr v8, v10

    .line 203
    invoke-virtual {v1, v5, v5, v8, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 204
    .line 205
    .line 206
    iget-object v8, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 207
    .line 208
    invoke-static {v8}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->b(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Landroid/graphics/LinearGradient;

    .line 209
    .line 210
    .line 211
    move-result-object v8

    .line 212
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 216
    .line 217
    .line 218
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 219
    .line 220
    .line 221
    move-result v6

    .line 222
    div-float/2addr v6, v9

    .line 223
    invoke-virtual {v1, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 227
    .line 228
    .line 229
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 230
    .line 231
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->i(Landroid/graphics/RectF;)V

    .line 236
    .line 237
    .line 238
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 239
    .line 240
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->e(Landroid/graphics/Paint;)V

    .line 245
    .line 246
    .line 247
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 248
    .line 249
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->e(Landroid/graphics/Paint;)V

    .line 254
    .line 255
    .line 256
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 257
    .line 258
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->g(Landroid/graphics/Path;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    nop

    .line 267
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
