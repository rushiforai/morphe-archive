.class public Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;
    }
.end annotation


# instance fields
.field public a:[Lv/VDraweeView;

.field public b:[Lv/VText;

.field public c:Lcom/p1/mobile/putong/core/data/Message;

.field public d:Landroid/graphics/drawable/AnimationDrawable;

.field public e:[Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;

.field public f:Lv/VImage;

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->g:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;ILandroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->f(ILandroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->g(Landroid/view/View;)V

    return-void
.end method

.method public static d(IIZ)Landroid/graphics/Point;
    .locals 6

    .line 1
    const/high16 v0, 0x430c0000    # 140.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const/high16 p2, 0x429c0000    # 78.0f

    .line 10
    .line 11
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget p2, Ll/qa00;->F:I

    .line 17
    .line 18
    :goto_0
    int-to-float v1, p0

    .line 19
    const/high16 v2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    mul-float/2addr v1, v2

    .line 22
    int-to-float v3, p1

    .line 23
    div-float/2addr v1, v3

    .line 24
    int-to-float v3, p2

    .line 25
    mul-float v4, v3, v2

    .line 26
    .line 27
    int-to-float v5, v0

    .line 28
    div-float/2addr v4, v5

    .line 29
    cmpg-float v4, v1, v4

    .line 30
    .line 31
    if-gtz v4, :cond_1

    .line 32
    .line 33
    move p0, p2

    .line 34
    :goto_1
    move p1, v0

    .line 35
    goto :goto_3

    .line 36
    :cond_1
    mul-float/2addr v2, v5

    .line 37
    div-float/2addr v2, v3

    .line 38
    cmpl-float v2, v1, v2

    .line 39
    .line 40
    if-ltz v2, :cond_2

    .line 41
    .line 42
    move p1, p2

    .line 43
    :goto_2
    move p0, v0

    .line 44
    goto :goto_3

    .line 45
    :cond_2
    if-lt p0, p1, :cond_4

    .line 46
    .line 47
    if-le p0, v0, :cond_3

    .line 48
    .line 49
    div-float/2addr v5, v1

    .line 50
    float-to-int p1, v5

    .line 51
    goto :goto_2

    .line 52
    :cond_3
    if-ge p1, p2, :cond_6

    .line 53
    .line 54
    mul-float/2addr v3, v1

    .line 55
    float-to-int p0, v3

    .line 56
    move p1, p2

    .line 57
    goto :goto_3

    .line 58
    :cond_4
    if-le p1, v0, :cond_5

    .line 59
    .line 60
    mul-float/2addr v5, v1

    .line 61
    float-to-int p0, v5

    .line 62
    goto :goto_1

    .line 63
    :cond_5
    if-ge p0, p2, :cond_6

    .line 64
    .line 65
    div-float/2addr v3, v1

    .line 66
    float-to-int p1, v3

    .line 67
    move p0, p2

    .line 68
    :cond_6
    :goto_3
    new-instance p2, Landroid/graphics/Point;

    .line 69
    .line 70
    invoke-direct {p2, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 71
    .line 72
    .line 73
    return-object p2
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v2, v3}, Ll/r97;->z(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 20
    .line 21
    .line 22
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->e(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    if-eqz v3, :cond_3

    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a:[Lv/VDraweeView;

    .line 45
    .line 46
    aget-object v1, v1, v4

    .line 47
    .line 48
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 49
    .line 50
    const/high16 v3, 0x42820000    # 65.0f

    .line 51
    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    const/high16 v4, 0x42180000    # 38.0f

    .line 57
    .line 58
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    sget v2, Ll/ibc0;->s7:I

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->d:Landroid/graphics/drawable/AnimationDrawable;

    .line 79
    .line 80
    if-nez v2, :cond_1

    .line 81
    .line 82
    sget v2, Ll/ibc0;->x7:I

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->d:Landroid/graphics/drawable/AnimationDrawable;

    .line 94
    .line 95
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    invoke-virtual {v2}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_2

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->d:Landroid/graphics/drawable/AnimationDrawable;

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void

    .line 111
    :cond_3
    move v3, v4

    .line 112
    :goto_0
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a:[Lv/VDraweeView;

    .line 113
    .line 114
    array-length v6, v5

    .line 115
    if-ge v3, v6, :cond_4

    .line 116
    .line 117
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->e:[Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;

    .line 118
    .line 119
    aget-object v6, v6, v3

    .line 120
    .line 121
    aget-object v5, v5, v3

    .line 122
    .line 123
    invoke-virtual {v0, v6, v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->h(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;Lv/VDraweeView;)V

    .line 124
    .line 125
    .line 126
    add-int/lit8 v3, v3, 0x1

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_4
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 130
    .line 131
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    new-array v3, v3, [Landroid/graphics/Point;

    .line 136
    .line 137
    move v5, v4

    .line 138
    move v6, v5

    .line 139
    :goto_1
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    const/high16 v8, 0x41400000    # 12.0f

    .line 146
    .line 147
    if-ge v5, v7, :cond_7

    .line 148
    .line 149
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    check-cast v7, Lcom/p1/mobile/putong/data/Media;

    .line 156
    .line 157
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 158
    .line 159
    .line 160
    move-result-object v7

    .line 161
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 162
    .line 163
    if-eqz v7, :cond_5

    .line 164
    .line 165
    iget v9, v7, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 166
    .line 167
    if-eqz v9, :cond_5

    .line 168
    .line 169
    iget v9, v7, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 170
    .line 171
    if-nez v9, :cond_6

    .line 172
    .line 173
    :cond_5
    new-instance v7, Lcom/p1/mobile/putong/data/Dimension;

    .line 174
    .line 175
    const/16 v9, 0xb4

    .line 176
    .line 177
    invoke-direct {v7, v9, v9}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 178
    .line 179
    .line 180
    :cond_6
    iget v9, v7, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 181
    .line 182
    iget v7, v7, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 183
    .line 184
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 185
    .line 186
    .line 187
    move-result v8

    .line 188
    sub-int/2addr v9, v8

    .line 189
    iget-object v8, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 190
    .line 191
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v8

    .line 195
    instance-of v8, v8, Lcom/p1/mobile/putong/data/Video;

    .line 196
    .line 197
    invoke-static {v9, v7, v8}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->d(IIZ)Landroid/graphics/Point;

    .line 198
    .line 199
    .line 200
    move-result-object v7

    .line 201
    aput-object v7, v3, v5

    .line 202
    .line 203
    iget v7, v7, Landroid/graphics/Point;->x:I

    .line 204
    .line 205
    add-int/2addr v6, v7

    .line 206
    add-int/lit8 v5, v5, 0x1

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_7
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a:[Lv/VDraweeView;

    .line 210
    .line 211
    array-length v5, v5

    .line 212
    div-int/2addr v6, v5

    .line 213
    move v5, v4

    .line 214
    move v7, v5

    .line 215
    :goto_2
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a:[Lv/VDraweeView;

    .line 216
    .line 217
    array-length v10, v9

    .line 218
    if-ge v5, v10, :cond_c

    .line 219
    .line 220
    aget-object v10, v3, v5

    .line 221
    .line 222
    iget v11, v10, Landroid/graphics/Point;->y:I

    .line 223
    .line 224
    mul-int/2addr v11, v6

    .line 225
    iget v12, v10, Landroid/graphics/Point;->x:I

    .line 226
    .line 227
    div-int/2addr v11, v12

    .line 228
    iput v11, v10, Landroid/graphics/Point;->y:I

    .line 229
    .line 230
    iput v6, v10, Landroid/graphics/Point;->x:I

    .line 231
    .line 232
    aget-object v9, v9, v5

    .line 233
    .line 234
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->b:[Lv/VText;

    .line 235
    .line 236
    aget-object v10, v10, v5

    .line 237
    .line 238
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    .line 239
    .line 240
    aget-object v12, v3, v5

    .line 241
    .line 242
    iget v13, v12, Landroid/graphics/Point;->x:I

    .line 243
    .line 244
    iget v12, v12, Landroid/graphics/Point;->y:I

    .line 245
    .line 246
    invoke-direct {v11, v13, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 247
    .line 248
    .line 249
    const/high16 v12, 0x40c00000    # 6.0f

    .line 250
    .line 251
    if-nez v5, :cond_8

    .line 252
    .line 253
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 254
    .line 255
    .line 256
    move-result v13

    .line 257
    add-int/2addr v7, v13

    .line 258
    :cond_8
    iput v7, v11, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 259
    .line 260
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 261
    .line 262
    .line 263
    move-result v13

    .line 264
    iput v13, v11, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 265
    .line 266
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 267
    .line 268
    .line 269
    move-result v13

    .line 270
    iput v13, v11, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 271
    .line 272
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 273
    .line 274
    .line 275
    move-result v13

    .line 276
    iput v13, v11, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 277
    .line 278
    aget-object v13, v3, v5

    .line 279
    .line 280
    iget v13, v13, Landroid/graphics/Point;->y:I

    .line 281
    .line 282
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 283
    .line 284
    .line 285
    move-result v12

    .line 286
    add-int/2addr v13, v12

    .line 287
    add-int/2addr v7, v13

    .line 288
    invoke-virtual {v9, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    .line 290
    .line 291
    aget-object v12, v3, v4

    .line 292
    .line 293
    iget v12, v12, Landroid/graphics/Point;->x:I

    .line 294
    .line 295
    iget-object v13, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 296
    .line 297
    invoke-interface {v13, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v13

    .line 301
    check-cast v13, Lcom/p1/mobile/putong/data/Media;

    .line 302
    .line 303
    iget-object v14, v13, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 304
    .line 305
    const-string v15, "raw"

    .line 306
    .line 307
    invoke-static {v14, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 308
    .line 309
    .line 310
    move-result v14

    .line 311
    if-eqz v14, :cond_a

    .line 312
    .line 313
    instance-of v14, v13, Lcom/p1/mobile/putong/data/Video;

    .line 314
    .line 315
    if-eqz v14, :cond_9

    .line 316
    .line 317
    move-object v14, v13

    .line 318
    check-cast v14, Lcom/p1/mobile/putong/data/Video;

    .line 319
    .line 320
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 321
    .line 322
    iget-object v14, v14, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 323
    .line 324
    invoke-static {v14}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v14

    .line 328
    if-eqz v14, :cond_9

    .line 329
    .line 330
    goto :goto_3

    .line 331
    :cond_9
    sget-object v12, Ll/uqb0;->G:Ll/fsb0;

    .line 332
    .line 333
    invoke-virtual {v12, v9}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 334
    .line 335
    .line 336
    goto :goto_4

    .line 337
    :cond_a
    :goto_3
    sget-object v14, Ll/uqb0;->G:Ll/fsb0;

    .line 338
    .line 339
    invoke-virtual {v13}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 340
    .line 341
    .line 342
    move-result-object v15

    .line 343
    invoke-virtual {v15, v12}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 344
    .line 345
    .line 346
    move-result-object v12

    .line 347
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v12

    .line 351
    const/4 v15, 0x7

    .line 352
    const/16 v4, 0x14

    .line 353
    .line 354
    invoke-virtual {v14, v9, v12, v15, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v13}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-static {v1, v4}, Ll/k900;->h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v4

    .line 365
    invoke-virtual {v9, v4}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    :goto_4
    instance-of v4, v13, Lcom/p1/mobile/putong/data/Video;

    .line 369
    .line 370
    if-eqz v4, :cond_b

    .line 371
    .line 372
    invoke-virtual {v10, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 373
    .line 374
    .line 375
    const-string v4, "#ffffff"

    .line 376
    .line 377
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 378
    .line 379
    .line 380
    move-result v4

    .line 381
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 385
    .line 386
    .line 387
    const/16 v4, 0x55

    .line 388
    .line 389
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 390
    .line 391
    .line 392
    const/high16 v4, 0x40a00000    # 5.0f

    .line 393
    .line 394
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 395
    .line 396
    .line 397
    move-result v9

    .line 398
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    const/4 v11, 0x0

    .line 403
    invoke-virtual {v10, v11, v11, v9, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 404
    .line 405
    .line 406
    check-cast v13, Lcom/p1/mobile/putong/data/Video;

    .line 407
    .line 408
    iget v4, v13, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 409
    .line 410
    float-to-int v4, v4

    .line 411
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 412
    .line 413
    .line 414
    move-result-object v9

    .line 415
    div-int/lit8 v12, v4, 0x3c

    .line 416
    .line 417
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 418
    .line 419
    .line 420
    move-result-object v12

    .line 421
    rem-int/lit8 v4, v4, 0x3c

    .line 422
    .line 423
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 424
    .line 425
    .line 426
    move-result-object v4

    .line 427
    filled-new-array {v12, v4}, [Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v4

    .line 431
    const-string v12, "%02d:%02d"

    .line 432
    .line 433
    invoke-static {v9, v12, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v4

    .line 437
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 438
    .line 439
    .line 440
    goto :goto_5

    .line 441
    :cond_b
    const/4 v11, 0x0

    .line 442
    const-string v4, ""

    .line 443
    .line 444
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 445
    .line 446
    .line 447
    :goto_5
    add-int/lit8 v5, v5, 0x1

    .line 448
    .line 449
    move v4, v11

    .line 450
    goto/16 :goto_2

    .line 451
    .line 452
    :cond_c
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->f:Lv/VImage;

    .line 453
    .line 454
    if-eqz v2, :cond_d

    .line 455
    .line 456
    sget v1, Ll/ibc0;->k7:I

    .line 457
    .line 458
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 459
    .line 460
    .line 461
    return-void

    .line 462
    :cond_d
    sget v1, Ll/ibc0;->l7:I

    .line 463
    .line 464
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 465
    .line 466
    .line 467
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(I)V
    .locals 6

    .line 1
    new-array v0, p1, [Lv/VDraweeView;

    .line 2
    .line 3
    new-array v1, p1, [Lv/VText;

    .line 4
    .line 5
    new-array v2, p1, [Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;

    .line 6
    .line 7
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->e:[Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, p1, :cond_0

    .line 12
    .line 13
    new-instance v4, Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-direct {v4, v5}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    aput-object v4, v0, v3

    .line 23
    .line 24
    new-instance v4, Lv/VText;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-direct {v4, v5}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    aput-object v4, v1, v3

    .line 34
    .line 35
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->e:[Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;

    .line 36
    .line 37
    sget-object v5, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;->LEFT:Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;

    .line 38
    .line 39
    aput-object v5, v4, v3

    .line 40
    .line 41
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a:[Lv/VDraweeView;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->b:[Lv/VText;

    .line 47
    .line 48
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a:[Lv/VDraweeView;

    .line 49
    .line 50
    array-length v0, p1

    .line 51
    const/4 v1, 0x1

    .line 52
    if-ge v2, v0, :cond_1

    .line 53
    .line 54
    aget-object p1, p1, v2

    .line 55
    .line 56
    new-instance v0, Ll/u6q;

    .line 57
    .line 58
    invoke-direct {v0, p0, v2}, Ll/u6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/v6q;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/v6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {p0, p1, v0, v3, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->b:[Lv/VText;

    .line 84
    .line 85
    aget-object p1, p1, v2

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {p0, p1, v0, v3, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 96
    .line 97
    .line 98
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    new-instance p1, Lv/VImage;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-direct {p1, v0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->f:Lv/VImage;

    .line 111
    .line 112
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 113
    .line 114
    const/high16 v0, 0x42780000    # 62.0f

    .line 115
    .line 116
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const/high16 v2, 0x42200000    # 40.0f

    .line 121
    .line 122
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-direct {p1, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 127
    .line 128
    .line 129
    const/16 v0, 0x11

    .line 130
    .line 131
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->f:Lv/VImage;

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-virtual {p0, v0, v2, p1, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final synthetic f(ILandroid/view/View;)Z
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->g:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->g:I

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 45
    .line 46
    const-string v0, "video"

    .line 47
    .line 48
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 59
    .line 60
    const-string v0, "picture"

    .line 61
    .line 62
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->c()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v0, "chat_page_hidden_message"

    .line 79
    .line 80
    invoke-interface {p1, p0, v0}, Ll/r97;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$Shape;Lv/VDraweeView;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/eac0;->j:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock$a;->a:[I

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    aget p1, v1, p1

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-eq p1, v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-eq p1, v1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {v0, v0, v0, v0}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {v0, v0, v0, v0}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    :goto_0
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/am2;->l()Ll/xlj;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/xlj;->a()Ll/wlj;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/wlj;

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Ll/wlj;

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    invoke-virtual {p1, v0}, Ll/wlj;->y(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Ll/wlj;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sget p2, Ll/ibc0;->O7:I

    .line 91
    .line 92
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget-object p2, Ll/h1e0;->g:Ll/h1e0;

    .line 97
    .line 98
    invoke-virtual {p1, p0, p2}, Ll/wlj;->F(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
