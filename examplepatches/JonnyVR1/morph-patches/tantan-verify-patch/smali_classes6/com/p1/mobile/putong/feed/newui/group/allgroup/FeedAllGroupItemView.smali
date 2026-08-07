.class public Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VImage;

.field public i:Lv/VFrame;

.field public j:Lv/VFrame;

.field public k:Lv/VDraweeView;

.field public l:Lv/VFrame;

.field public m:Lv/VDraweeView;

.field public n:Lv/VFrame;

.field public o:Lv/VDraweeView;

.field public p:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zng;->a(Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q(J)Ljava/lang/String;
    .locals 3

    .line 1
    const-wide/16 v0, 0x2710

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, ""

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    new-instance p0, Ljava/text/DecimalFormat;

    .line 26
    .line 27
    const-string v0, "#.##"

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Ljava/math/RoundingMode;->DOWN:Ljava/math/RoundingMode;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    long-to-double p1, p1

    .line 43
    const-wide v1, 0x40c3880000000000L    # 10000.0

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    div-double/2addr p1, v1

    .line 49
    invoke-virtual {p0, p1, p2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, "w"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public z(Lcom/p1/mobile/putong/feed/data/Group;I)V
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_7

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->f:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x3

    .line 21
    const/4 v2, 0x2

    .line 22
    const/4 v3, 0x1

    .line 23
    const/4 v4, 0x0

    .line 24
    if-lt v0, v2, :cond_2

    .line 25
    .line 26
    :try_start_0
    new-array v0, v2, [I

    .line 27
    .line 28
    move v5, v4

    .line 29
    :goto_0
    if-ge v5, v2, :cond_1

    .line 30
    .line 31
    iget-object v6, p1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    check-cast v6, Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    aput v6, v0, v5

    .line 44
    .line 45
    add-int/lit8 v5, v5, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    .line 51
    .line 52
    sget-object v6, Landroid/graphics/drawable/GradientDrawable$Orientation;->BL_TR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 53
    .line 54
    invoke-direct {v5, v6, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5, v4}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 58
    .line 59
    .line 60
    const/high16 v0, 0x41800000    # 16.0f

    .line 61
    .line 62
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    int-to-float v0, v0

    .line 67
    const/16 v6, 0x8

    .line 68
    .line 69
    new-array v6, v6, [F

    .line 70
    .line 71
    aput v0, v6, v4

    .line 72
    .line 73
    aput v0, v6, v3

    .line 74
    .line 75
    aput v0, v6, v2

    .line 76
    .line 77
    aput v0, v6, v1

    .line 78
    .line 79
    const/4 v7, 0x4

    .line 80
    aput v0, v6, v7

    .line 81
    .line 82
    const/4 v7, 0x5

    .line 83
    aput v0, v6, v7

    .line 84
    .line 85
    const/4 v7, 0x6

    .line 86
    aput v0, v6, v7

    .line 87
    .line 88
    const/4 v7, 0x7

    .line 89
    aput v0, v6, v7

    .line 90
    .line 91
    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 98
    .line 99
    new-instance v5, Landroid/graphics/drawable/shapes/OvalShape;

    .line 100
    .line 101
    invoke-direct {v5}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-direct {v0, v5}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 105
    .line 106
    .line 107
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    sub-int/2addr v6, v3

    .line 114
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->j:Lv/VFrame;

    .line 132
    .line 133
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 134
    .line 135
    .line 136
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->l:Lv/VFrame;

    .line 137
    .line 138
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 139
    .line 140
    .line 141
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->n:Lv/VFrame;

    .line 142
    .line 143
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->e:Landroid/widget/TextView;

    .line 151
    .line 152
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 158
    .line 159
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->d:Lv/VDraweeView;

    .line 160
    .line 161
    iget-object v6, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 162
    .line 163
    const/high16 v7, 0x42600000    # 56.0f

    .line 164
    .line 165
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    invoke-virtual {v0, v5, v6, v8, v7}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->p:Landroid/widget/TextView;

    .line 177
    .line 178
    if-ne p2, v3, :cond_6

    .line 179
    .line 180
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 184
    .line 185
    new-instance v0, Ljava/util/ArrayList;

    .line 186
    .line 187
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    :cond_3
    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    if-eqz v5, :cond_4

    .line 199
    .line 200
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    check-cast v5, Ljava/lang/String;

    .line 205
    .line 206
    sget-object v6, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 207
    .line 208
    invoke-virtual {v6, v5}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v6

    .line 216
    if-eqz v6, :cond_3

    .line 217
    .line 218
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->i:Lv/VFrame;

    .line 227
    .line 228
    if-lt p2, v1, :cond_5

    .line 229
    .line 230
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    xor-int/2addr p2, v3

    .line 235
    invoke-static {v5, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->k:Lv/VDraweeView;

    .line 241
    .line 242
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 247
    .line 248
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-virtual {p2, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 257
    .line 258
    .line 259
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 260
    .line 261
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->m:Lv/VDraweeView;

    .line 262
    .line 263
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 268
    .line 269
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {p2, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 278
    .line 279
    .line 280
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->o:Lv/VDraweeView;

    .line 283
    .line 284
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 289
    .line 290
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-virtual {p2, v1, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 299
    .line 300
    .line 301
    goto :goto_4

    .line 302
    :cond_5
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 303
    .line 304
    .line 305
    :goto_4
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->g:Landroid/widget/TextView;

    .line 306
    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .line 311
    .line 312
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 313
    .line 314
    int-to-long v1, v1

    .line 315
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->q(J)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 323
    .line 324
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    goto :goto_7

    .line 335
    :cond_6
    iget p2, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 336
    .line 337
    if-lez p2, :cond_7

    .line 338
    .line 339
    goto :goto_5

    .line 340
    :cond_7
    move v3, v4

    .line 341
    :goto_5
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 342
    .line 343
    .line 344
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->i:Lv/VFrame;

    .line 345
    .line 346
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 347
    .line 348
    .line 349
    iget p2, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 350
    .line 351
    const/16 v0, 0x63

    .line 352
    .line 353
    if-le p2, v0, :cond_8

    .line 354
    .line 355
    const-string p2, "99+"

    .line 356
    .line 357
    goto :goto_6

    .line 358
    :cond_8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 361
    .line 362
    .line 363
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 364
    .line 365
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v0, ""

    .line 369
    .line 370
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p2

    .line 377
    :goto_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->p:Landroid/widget/TextView;

    .line 378
    .line 379
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 380
    .line 381
    .line 382
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 383
    .line 384
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 385
    .line 386
    .line 387
    move-result p2

    .line 388
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->g:Landroid/widget/TextView;

    .line 389
    .line 390
    if-eqz p2, :cond_9

    .line 391
    .line 392
    new-instance p2, Ljava/lang/StringBuilder;

    .line 393
    .line 394
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 395
    .line 396
    .line 397
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 398
    .line 399
    int-to-long v1, v1

    .line 400
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->q(J)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 408
    .line 409
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    .line 418
    .line 419
    goto :goto_7

    .line 420
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 423
    .line 424
    .line 425
    :goto_7
    return-void
.end method
