.class public Ll/ook0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/RelativeLayout;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public c:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/ook0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/ook0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/ook0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 9
    .line 10
    iput-object p2, p0, Ll/ook0;->c:Ll/nsv;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic H(Ll/ook0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ook0;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/ook0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ook0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ook0;->d:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ook0;->e:Ll/y20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ook0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public N(Landroid/widget/RelativeLayout;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    sget v2, Ll/mdc0;->S2:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Lv/VDraweeView;

    .line 15
    .line 16
    sget v3, Ll/mdc0;->p7:I

    .line 17
    .line 18
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Landroid/widget/TextView;

    .line 23
    .line 24
    sget v4, Ll/mdc0;->l7:I

    .line 25
    .line 26
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Landroid/widget/TextView;

    .line 31
    .line 32
    sget v5, Ll/mdc0;->r7:I

    .line 33
    .line 34
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Landroid/widget/TextView;

    .line 39
    .line 40
    sget v6, Ll/mdc0;->R2:I

    .line 41
    .line 42
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    move-object v7, v6

    .line 47
    check-cast v7, Landroid/widget/ImageView;

    .line 48
    .line 49
    sget v6, Ll/mdc0;->H1:I

    .line 50
    .line 51
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    check-cast v6, Landroid/widget/FrameLayout;

    .line 56
    .line 57
    sget v8, Ll/mdc0;->b7:I

    .line 58
    .line 59
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    move-object v15, v8

    .line 64
    check-cast v15, Landroid/widget/TextView;

    .line 65
    .line 66
    sget v8, Ll/mdc0;->A7:I

    .line 67
    .line 68
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    check-cast v8, Landroid/widget/TextView;

    .line 73
    .line 74
    sget v9, Ll/mdc0;->f7:I

    .line 75
    .line 76
    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v9

    .line 80
    check-cast v9, Landroid/widget/TextView;

    .line 81
    .line 82
    iget-object v10, v0, Ll/ook0;->c:Ll/nsv;

    .line 83
    .line 84
    new-instance v11, Ll/lok0;

    .line 85
    .line 86
    invoke-direct {v11}, Ll/lok0;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v2, v10, v11}, Ll/ql3;->c(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/nsv;Ll/qcj;)V

    .line 90
    .line 91
    .line 92
    iget-object v10, v0, Ll/ook0;->c:Ll/nsv;

    .line 93
    .line 94
    iget-object v10, v10, Ll/nsv;->a:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v10, Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    iget-object v10, v10, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v7}, Landroid/view/View;->clearAnimation()V

    .line 104
    .line 105
    .line 106
    const/4 v3, 0x0

    .line 107
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    invoke-static {v7, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    sget v4, Ll/obc0;->p7:I

    .line 117
    .line 118
    invoke-virtual {v6, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 119
    .line 120
    .line 121
    iget-object v4, v0, Ll/ook0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 122
    .line 123
    invoke-static {v4}, Ll/guk0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    const/4 v6, 0x1

    .line 128
    if-eqz v4, :cond_1

    .line 129
    .line 130
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->B:I

    .line 134
    .line 135
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(I)V

    .line 136
    .line 137
    .line 138
    const-string v4, "#ffffff"

    .line 139
    .line 140
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    :cond_0
    move-object v4, v8

    .line 148
    move-object/from16 v17, v9

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    iget-object v4, v0, Ll/ook0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 152
    .line 153
    invoke-static {v4}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-eqz v4, :cond_0

    .line 158
    .line 159
    invoke-static {v7, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    new-instance v13, Landroid/view/animation/LinearInterpolator;

    .line 163
    .line 164
    invoke-direct {v13}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 165
    .line 166
    .line 167
    const/4 v4, 0x2

    .line 168
    new-array v14, v4, [F

    .line 169
    .line 170
    fill-array-data v14, :array_0

    .line 171
    .line 172
    .line 173
    move-object v4, v8

    .line 174
    const-string v8, "rotation"

    .line 175
    .line 176
    move-object v11, v9

    .line 177
    const-wide/16 v9, 0x0

    .line 178
    .line 179
    move-object/from16 v16, v11

    .line 180
    .line 181
    const-wide/16 v11, 0x258

    .line 182
    .line 183
    move-object/from16 v17, v16

    .line 184
    .line 185
    invoke-static/range {v7 .. v14}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    check-cast v7, Landroid/animation/ObjectAnimator;

    .line 190
    .line 191
    const/4 v8, -0x1

    .line 192
    invoke-virtual {v7, v8}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v7}, Landroid/animation/ObjectAnimator;->start()V

    .line 196
    .line 197
    .line 198
    :goto_0
    new-instance v7, Ll/mok0;

    .line 199
    .line 200
    invoke-direct {v7, v0}, Ll/mok0;-><init>(Ll/ook0;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v5, v7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    new-instance v5, Ll/nok0;

    .line 207
    .line 208
    invoke-direct {v5, v0}, Ll/nok0;-><init>(Ll/ook0;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v2, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 212
    .line 213
    .line 214
    iget-object v2, v0, Ll/ook0;->c:Ll/nsv;

    .line 215
    .line 216
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 217
    .line 218
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 219
    .line 220
    invoke-static {v2, v15}, Ll/egu;->c(Lcom/p1/mobile/putong/data/User;Landroid/widget/TextView;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v15, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 224
    .line 225
    .line 226
    iget-object v2, v0, Ll/ook0;->c:Ll/nsv;

    .line 227
    .line 228
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 229
    .line 230
    move-object v5, v2

    .line 231
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 232
    .line 233
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 234
    .line 235
    const/high16 v7, 0x40000000    # 2.0f

    .line 236
    .line 237
    if-eqz v5, :cond_2

    .line 238
    .line 239
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 240
    .line 241
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 242
    .line 243
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 244
    .line 245
    invoke-static {v2}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    .line 251
    .line 252
    iget-object v2, v0, Ll/ook0;->c:Ll/nsv;

    .line 253
    .line 254
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 255
    .line 256
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 257
    .line 258
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 259
    .line 260
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 261
    .line 262
    invoke-static {v2}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    int-to-float v5, v5

    .line 271
    invoke-static {v2, v5}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 276
    .line 277
    .line 278
    invoke-static {v4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 279
    .line 280
    .line 281
    goto :goto_1

    .line 282
    :cond_2
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 283
    .line 284
    .line 285
    :goto_1
    iget-object v2, v0, Ll/ook0;->c:Ll/nsv;

    .line 286
    .line 287
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 288
    .line 289
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 290
    .line 291
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 292
    .line 293
    if-eqz v2, :cond_3

    .line 294
    .line 295
    move-object/from16 v11, v17

    .line 296
    .line 297
    invoke-static {v11, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 298
    .line 299
    .line 300
    new-instance v2, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 303
    .line 304
    .line 305
    iget-object v3, v0, Ll/ook0;->c:Ll/nsv;

    .line 306
    .line 307
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 308
    .line 309
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 310
    .line 311
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 312
    .line 313
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 314
    .line 315
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    const-string v3, " "

    .line 321
    .line 322
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    iget-object v0, v0, Ll/ook0;->c:Ll/nsv;

    .line 326
    .line 327
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 328
    .line 329
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 330
    .line 331
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 332
    .line 333
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 334
    .line 335
    invoke-static {v0, v6}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    sget v1, Ll/n9c0;->v:I

    .line 358
    .line 359
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 360
    .line 361
    .line 362
    move-result v0

    .line 363
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    int-to-float v1, v1

    .line 368
    invoke-static {v0, v1}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    invoke-virtual {v11, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :cond_3
    move-object/from16 v11, v17

    .line 377
    .line 378
    invoke-static {v11, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 379
    .line 380
    .line 381
    return-void

    .line 382
    nop

    .line 383
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public O(Ll/y20;)Ll/ook0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ook0;",
            ">;)",
            "Ll/ook0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ook0;->d:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public P(Ll/y20;)Ll/ook0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/ook0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ook0;->e:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ook0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ook0;->N(Landroid/widget/RelativeLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
