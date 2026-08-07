.class public Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView$a;
    }
.end annotation


# instance fields
.field public c:F

.field public d:F

.field public e:J

.field public f:F

.field public g:J

.field public h:J

.field public i:Landroid/graphics/Paint;

.field public j:Landroid/graphics/Path;

.field public k:Landroid/graphics/RectF;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 73
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->f:F

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->l:Z

    .line 10
    .line 11
    const/high16 p1, 0x40400000    # 3.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    int-to-float p1, p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 19
    .line 20
    sget p2, Ll/qa00;->j:I

    .line 21
    .line 22
    int-to-float p2, p2

    .line 23
    const/high16 p3, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr p1, p3

    .line 26
    sub-float/2addr p2, p1

    .line 27
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 28
    .line 29
    new-instance p1, Landroid/graphics/Paint;

    .line 30
    .line 31
    const/4 p2, 0x1

    .line 32
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 36
    .line 37
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 43
    .line 44
    const p2, 0x40ffffff    # 7.9999995f

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 51
    .line 52
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Landroid/graphics/Path;

    .line 58
    .line 59
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 63
    .line 64
    new-instance p1, Landroid/graphics/RectF;

    .line 65
    .line 66
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->k:Landroid/graphics/RectF;

    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public final P(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 6
    .line 7
    const/high16 v3, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float v4, v2, v3

    .line 10
    .line 11
    div-float/2addr v2, v3

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    int-to-float v5, v5

    .line 17
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 18
    .line 19
    div-float/2addr v6, v3

    .line 20
    sub-float/2addr v5, v6

    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    int-to-float v6, v6

    .line 26
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 27
    .line 28
    div-float/2addr v7, v3

    .line 29
    sub-float/2addr v6, v7

    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    int-to-float v7, v7

    .line 35
    iget v8, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 36
    .line 37
    mul-float/2addr v8, v3

    .line 38
    sub-float/2addr v7, v8

    .line 39
    iget v8, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 40
    .line 41
    sub-float/2addr v7, v8

    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    int-to-float v8, v8

    .line 47
    iget v9, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 48
    .line 49
    mul-float v10, v9, v3

    .line 50
    .line 51
    sub-float/2addr v8, v10

    .line 52
    iget v10, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->c:F

    .line 53
    .line 54
    sub-float/2addr v8, v10

    .line 55
    const-wide v10, 0x400921fb54442d18L    # Math.PI

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    float-to-double v12, v9

    .line 61
    mul-double/2addr v12, v10

    .line 62
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 63
    .line 64
    mul-double/2addr v12, v9

    .line 65
    double-to-float v9, v12

    .line 66
    mul-float v10, v7, v3

    .line 67
    .line 68
    mul-float v11, v8, v3

    .line 69
    .line 70
    add-float/2addr v10, v11

    .line 71
    add-float/2addr v10, v9

    .line 72
    iget v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->f:F

    .line 73
    .line 74
    mul-float/2addr v10, v11

    .line 75
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 76
    .line 77
    invoke-virtual {v11}, Landroid/graphics/Path;->reset()V

    .line 78
    .line 79
    .line 80
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 81
    .line 82
    iget v12, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 83
    .line 84
    add-float/2addr v12, v4

    .line 85
    invoke-virtual {v11, v12, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 86
    .line 87
    .line 88
    cmpg-float v11, v10, v7

    .line 89
    .line 90
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 91
    .line 92
    if-gtz v11, :cond_0

    .line 93
    .line 94
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 95
    .line 96
    add-float/2addr v4, v3

    .line 97
    add-float/2addr v4, v10

    .line 98
    invoke-virtual {v12, v4, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 99
    .line 100
    .line 101
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 104
    .line 105
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_0
    iget v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 110
    .line 111
    sub-float v11, v5, v11

    .line 112
    .line 113
    invoke-virtual {v12, v11, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 114
    .line 115
    .line 116
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->k:Landroid/graphics/RectF;

    .line 117
    .line 118
    iget v12, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 119
    .line 120
    mul-float v13, v12, v3

    .line 121
    .line 122
    sub-float v13, v5, v13

    .line 123
    .line 124
    iput v13, v11, Landroid/graphics/RectF;->left:F

    .line 125
    .line 126
    iput v2, v11, Landroid/graphics/RectF;->top:F

    .line 127
    .line 128
    iput v5, v11, Landroid/graphics/RectF;->right:F

    .line 129
    .line 130
    mul-float/2addr v12, v3

    .line 131
    add-float/2addr v12, v2

    .line 132
    iput v12, v11, Landroid/graphics/RectF;->bottom:F

    .line 133
    .line 134
    const/high16 v12, 0x40800000    # 4.0f

    .line 135
    .line 136
    div-float v12, v9, v12

    .line 137
    .line 138
    add-float v13, v7, v12

    .line 139
    .line 140
    cmpg-float v14, v10, v13

    .line 141
    .line 142
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 143
    .line 144
    move/from16 v16, v3

    .line 145
    .line 146
    const/high16 v3, 0x43870000    # 270.0f

    .line 147
    .line 148
    const/high16 v17, 0x43b40000    # 360.0f

    .line 149
    .line 150
    if-gtz v14, :cond_1

    .line 151
    .line 152
    sub-float/2addr v10, v13

    .line 153
    add-float/2addr v10, v12

    .line 154
    div-float/2addr v10, v9

    .line 155
    mul-float v10, v10, v17

    .line 156
    .line 157
    invoke-virtual {v15, v11, v3, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 158
    .line 159
    .line 160
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 163
    .line 164
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_1
    const/high16 v14, 0x42b40000    # 90.0f

    .line 169
    .line 170
    invoke-virtual {v15, v11, v3, v14}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 171
    .line 172
    .line 173
    add-float/2addr v13, v8

    .line 174
    cmpg-float v3, v10, v13

    .line 175
    .line 176
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 177
    .line 178
    if-gtz v3, :cond_2

    .line 179
    .line 180
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 181
    .line 182
    sub-float/2addr v6, v2

    .line 183
    sub-float/2addr v6, v13

    .line 184
    add-float/2addr v6, v10

    .line 185
    invoke-virtual {v11, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 186
    .line 187
    .line 188
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 189
    .line 190
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 191
    .line 192
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_2
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 197
    .line 198
    sub-float v3, v6, v3

    .line 199
    .line 200
    invoke-virtual {v11, v5, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 201
    .line 202
    .line 203
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->k:Landroid/graphics/RectF;

    .line 204
    .line 205
    iget v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 206
    .line 207
    mul-float v15, v11, v16

    .line 208
    .line 209
    sub-float v15, v5, v15

    .line 210
    .line 211
    iput v15, v3, Landroid/graphics/RectF;->left:F

    .line 212
    .line 213
    mul-float v11, v11, v16

    .line 214
    .line 215
    sub-float v11, v6, v11

    .line 216
    .line 217
    iput v11, v3, Landroid/graphics/RectF;->top:F

    .line 218
    .line 219
    iput v5, v3, Landroid/graphics/RectF;->right:F

    .line 220
    .line 221
    iput v6, v3, Landroid/graphics/RectF;->bottom:F

    .line 222
    .line 223
    add-float/2addr v13, v12

    .line 224
    cmpg-float v5, v10, v13

    .line 225
    .line 226
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 227
    .line 228
    const/4 v15, 0x0

    .line 229
    if-gtz v5, :cond_3

    .line 230
    .line 231
    sub-float/2addr v10, v13

    .line 232
    add-float/2addr v10, v12

    .line 233
    div-float/2addr v10, v9

    .line 234
    mul-float v10, v10, v17

    .line 235
    .line 236
    invoke-virtual {v11, v3, v15, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 237
    .line 238
    .line 239
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 240
    .line 241
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 242
    .line 243
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :cond_3
    invoke-virtual {v11, v3, v15, v14}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 248
    .line 249
    .line 250
    add-float/2addr v13, v7

    .line 251
    cmpg-float v3, v10, v13

    .line 252
    .line 253
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 254
    .line 255
    if-gtz v3, :cond_4

    .line 256
    .line 257
    sub-float/2addr v13, v10

    .line 258
    add-float/2addr v13, v4

    .line 259
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 260
    .line 261
    add-float/2addr v13, v2

    .line 262
    invoke-virtual {v5, v13, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 263
    .line 264
    .line 265
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 266
    .line 267
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 268
    .line 269
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_4
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 274
    .line 275
    add-float/2addr v3, v4

    .line 276
    invoke-virtual {v5, v3, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 277
    .line 278
    .line 279
    add-float/2addr v13, v12

    .line 280
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->k:Landroid/graphics/RectF;

    .line 281
    .line 282
    iput v4, v3, Landroid/graphics/RectF;->left:F

    .line 283
    .line 284
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 285
    .line 286
    mul-float v7, v5, v16

    .line 287
    .line 288
    sub-float v7, v6, v7

    .line 289
    .line 290
    iput v7, v3, Landroid/graphics/RectF;->top:F

    .line 291
    .line 292
    mul-float v5, v5, v16

    .line 293
    .line 294
    add-float/2addr v5, v4

    .line 295
    iput v5, v3, Landroid/graphics/RectF;->right:F

    .line 296
    .line 297
    iput v6, v3, Landroid/graphics/RectF;->bottom:F

    .line 298
    .line 299
    cmpg-float v5, v10, v13

    .line 300
    .line 301
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 302
    .line 303
    if-gtz v5, :cond_5

    .line 304
    .line 305
    sub-float/2addr v10, v13

    .line 306
    add-float/2addr v10, v12

    .line 307
    div-float/2addr v10, v9

    .line 308
    mul-float v10, v10, v17

    .line 309
    .line 310
    invoke-virtual {v6, v3, v14, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 311
    .line 312
    .line 313
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 314
    .line 315
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 316
    .line 317
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_5
    invoke-virtual {v6, v3, v14, v14}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 322
    .line 323
    .line 324
    add-float/2addr v13, v8

    .line 325
    cmpg-float v3, v10, v13

    .line 326
    .line 327
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 328
    .line 329
    if-gtz v3, :cond_6

    .line 330
    .line 331
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 332
    .line 333
    add-float/2addr v2, v3

    .line 334
    add-float/2addr v2, v13

    .line 335
    sub-float/2addr v2, v10

    .line 336
    invoke-virtual {v5, v4, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 337
    .line 338
    .line 339
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 340
    .line 341
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 342
    .line 343
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :cond_6
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 348
    .line 349
    add-float/2addr v3, v2

    .line 350
    invoke-virtual {v5, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 351
    .line 352
    .line 353
    add-float/2addr v13, v12

    .line 354
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->k:Landroid/graphics/RectF;

    .line 355
    .line 356
    iput v4, v3, Landroid/graphics/RectF;->left:F

    .line 357
    .line 358
    iput v2, v3, Landroid/graphics/RectF;->top:F

    .line 359
    .line 360
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->d:F

    .line 361
    .line 362
    mul-float v6, v5, v16

    .line 363
    .line 364
    add-float/2addr v4, v6

    .line 365
    iput v4, v3, Landroid/graphics/RectF;->right:F

    .line 366
    .line 367
    mul-float v5, v5, v16

    .line 368
    .line 369
    add-float/2addr v2, v5

    .line 370
    iput v2, v3, Landroid/graphics/RectF;->bottom:F

    .line 371
    .line 372
    cmpg-float v2, v10, v13

    .line 373
    .line 374
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 375
    .line 376
    const/high16 v5, 0x43340000    # 180.0f

    .line 377
    .line 378
    if-gtz v2, :cond_7

    .line 379
    .line 380
    sub-float/2addr v10, v13

    .line 381
    add-float/2addr v10, v12

    .line 382
    div-float/2addr v10, v9

    .line 383
    mul-float v10, v10, v17

    .line 384
    .line 385
    invoke-virtual {v4, v3, v5, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 386
    .line 387
    .line 388
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 389
    .line 390
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 391
    .line 392
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 393
    .line 394
    .line 395
    return-void

    .line 396
    :cond_7
    invoke-virtual {v4, v3, v5, v14}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 397
    .line 398
    .line 399
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->j:Landroid/graphics/Path;

    .line 400
    .line 401
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->i:Landroid/graphics/Paint;

    .line 402
    .line 403
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 404
    .line 405
    .line 406
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->h:J

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->e:J

    .line 8
    .line 9
    sub-long/2addr v2, v4

    .line 10
    sub-long/2addr v0, v2

    .line 11
    long-to-float p1, v0

    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    mul-float/2addr p1, v0

    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->g:J

    .line 16
    .line 17
    long-to-float v0, v0

    .line 18
    div-float/2addr p1, v0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->f:F

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->l:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView;->P(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setOnProgressChangeListener(Lcom/p1/mobile/putong/core/ui/view/CountDownTopicChatView$a;)V
    .locals 0

    return-void
.end method
