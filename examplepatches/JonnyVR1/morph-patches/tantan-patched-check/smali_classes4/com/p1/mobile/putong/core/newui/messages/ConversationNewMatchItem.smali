.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/android/ui/label/CommonLabelView;

.field public d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/view/View;

.field public g:Lv/VImage;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public o:Lcom/p1/mobile/putong/data/User;

.field public p:Lcom/p1/mobile/putong/core/data/Conversation;

.field public q:Landroid/animation/Animator;

.field public r:Landroid/animation/Animator;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;Ll/y20;Ljava/lang/String;Ll/y20;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->g(Ll/y20;Ljava/lang/String;Ll/y20;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->i(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->h(ILandroid/view/View;)V

    return-void
.end method

.method private getRootHeight()I
    .locals 4

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 6
    .line 7
    sget v0, Ll/qa00;->q:I

    .line 8
    .line 9
    sub-int/2addr p0, v0

    .line 10
    div-int/lit8 p0, p0, 0x2

    .line 11
    .line 12
    int-to-double v0, p0

    .line 13
    const-wide v2, 0x3ff553f7ced91687L    # 1.333

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-double/2addr v0, v2

    .line 19
    double-to-int p0, v0

    .line 20
    return p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qj6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 4
    .line 5
    const/high16 v2, 0x421c0000    # 39.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    int-to-float v3, v3

    .line 12
    const/high16 v4, 0x41200000    # 10.0f

    .line 13
    .line 14
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    int-to-float v5, v5

    .line 19
    const/4 v6, 0x2

    .line 20
    new-array v7, v6, [F

    .line 21
    .line 22
    const/4 v8, 0x0

    .line 23
    aput v3, v7, v8

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    aput v5, v7, v3

    .line 27
    .line 28
    const-string v5, "roundedCornerRadius"

    .line 29
    .line 30
    invoke-static {v1, v5, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-wide/16 v9, 0x258

    .line 35
    .line 36
    invoke-virtual {v1, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 41
    .line 42
    new-array v9, v6, [F

    .line 43
    .line 44
    fill-array-data v9, :array_0

    .line 45
    .line 46
    .line 47
    sget-object v10, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 48
    .line 49
    invoke-static {v7, v10, v9}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-wide/16 v11, 0x28a

    .line 54
    .line 55
    invoke-virtual {v7, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    iget-object v9, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 60
    .line 61
    sget-object v13, Ll/ht0;->n:Landroid/util/Property;

    .line 62
    .line 63
    const/high16 v14, 0x42100000    # 36.0f

    .line 64
    .line 65
    invoke-static {v14}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v15

    .line 69
    invoke-static {}, Ll/bnl0;->y0()I

    .line 70
    .line 71
    .line 72
    move-result v16

    .line 73
    div-int/lit8 v16, v16, 0x2

    .line 74
    .line 75
    const/high16 v17, 0x41f80000    # 31.0f

    .line 76
    .line 77
    invoke-static/range {v17 .. v17}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v18

    .line 81
    move/from16 v19, v2

    .line 82
    .line 83
    sub-int v2, v16, v18

    .line 84
    .line 85
    filled-new-array {v15, v2}, [I

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v9, v13, v2}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iget-object v9, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m:Landroid/view/View;

    .line 98
    .line 99
    new-array v11, v6, [F

    .line 100
    .line 101
    fill-array-data v11, :array_1

    .line 102
    .line 103
    .line 104
    invoke-static {v9, v10, v11}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object v9

    .line 108
    const-wide/16 v11, 0x12c

    .line 109
    .line 110
    invoke-virtual {v9, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    iget-object v15, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->h:Lv/VLinear;

    .line 115
    .line 116
    move/from16 v16, v3

    .line 117
    .line 118
    new-array v3, v6, [F

    .line 119
    .line 120
    fill-array-data v3, :array_2

    .line 121
    .line 122
    .line 123
    invoke-static {v15, v10, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v3, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iget-object v15, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 132
    .line 133
    move/from16 v18, v4

    .line 134
    .line 135
    new-array v4, v6, [F

    .line 136
    .line 137
    fill-array-data v4, :array_3

    .line 138
    .line 139
    .line 140
    invoke-static {v15, v10, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    move/from16 v20, v14

    .line 145
    .line 146
    const-wide/16 v14, 0xc8

    .line 147
    .line 148
    invoke-virtual {v4, v14, v15}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    new-instance v14, Ll/lj6;

    .line 156
    .line 157
    invoke-direct {v14, v4}, Ll/lj6;-><init>(Landroid/animation/Animator;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v3, v14}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 161
    .line 162
    .line 163
    filled-new-array {v1, v7, v2, v9, v3}, [Landroid/animation/Animator;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->q:Landroid/animation/Animator;

    .line 172
    .line 173
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 174
    .line 175
    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    int-to-float v2, v2

    .line 180
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    int-to-float v3, v3

    .line 185
    new-array v4, v6, [F

    .line 186
    .line 187
    aput v2, v4, v8

    .line 188
    .line 189
    aput v3, v4, v16

    .line 190
    .line 191
    invoke-static {v1, v5, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v1, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 200
    .line 201
    new-array v3, v6, [F

    .line 202
    .line 203
    fill-array-data v3, :array_4

    .line 204
    .line 205
    .line 206
    invoke-static {v2, v10, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    const-wide/16 v3, 0x145

    .line 211
    .line 212
    invoke-virtual {v2, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 217
    .line 218
    invoke-static {}, Ll/bnl0;->y0()I

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    div-int/2addr v7, v6

    .line 223
    invoke-static/range {v17 .. v17}, Ll/qa00;->d(F)I

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    sub-int/2addr v7, v8

    .line 228
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result v8

    .line 232
    filled-new-array {v7, v8}, [I

    .line 233
    .line 234
    .line 235
    move-result-object v7

    .line 236
    invoke-static {v5, v13, v7}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-virtual {v5, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m:Landroid/view/View;

    .line 245
    .line 246
    new-array v5, v6, [F

    .line 247
    .line 248
    fill-array-data v5, :array_5

    .line 249
    .line 250
    .line 251
    invoke-static {v4, v10, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 252
    .line 253
    .line 254
    move-result-object v4

    .line 255
    const-wide/16 v7, 0x96

    .line 256
    .line 257
    invoke-virtual {v4, v7, v8}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->h:Lv/VLinear;

    .line 262
    .line 263
    new-array v9, v6, [F

    .line 264
    .line 265
    fill-array-data v9, :array_6

    .line 266
    .line 267
    .line 268
    invoke-static {v5, v10, v9}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-virtual {v5, v7, v8}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 273
    .line 274
    .line 275
    move-result-object v5

    .line 276
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 277
    .line 278
    new-array v6, v6, [F

    .line 279
    .line 280
    fill-array-data v6, :array_7

    .line 281
    .line 282
    .line 283
    invoke-static {v7, v10, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    const-wide/16 v7, 0x64

    .line 288
    .line 289
    invoke-virtual {v6, v7, v8}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 290
    .line 291
    .line 292
    move-result-object v6

    .line 293
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    new-instance v7, Ll/lj6;

    .line 297
    .line 298
    invoke-direct {v7, v6}, Ll/lj6;-><init>(Landroid/animation/Animator;)V

    .line 299
    .line 300
    .line 301
    invoke-static {v5, v7}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 302
    .line 303
    .line 304
    filled-new-array {v1, v2, v3, v4, v5}, [Landroid/animation/Animator;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->r:Landroid/animation/Animator;

    .line 313
    .line 314
    return-void

    .line 315
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f6b851f    # 0.92f
    .end array-data

    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    :array_4
    .array-data 4
        0x3f6b851f    # 0.92f
        0x3f800000    # 1.0f
    .end array-data

    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    :array_5
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    :array_6
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    :array_7
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    const/16 v2, 0x1c

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-static {v1, p0, v3, v3, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic g(Ll/y20;Ljava/lang/String;Ll/y20;Landroid/util/Pair;)V
    .locals 10

    .line 1
    iget-object v0, p4, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p4, p4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p4, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-nez p4, :cond_14

    .line 18
    .line 19
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    iget-boolean v0, p4, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 22
    .line 23
    if-nez v0, :cond_14

    .line 24
    .line 25
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 26
    .line 27
    const-string v0, "default"

    .line 28
    .line 29
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    if-nez p4, :cond_0

    .line 34
    .line 35
    goto/16 :goto_9

    .line 36
    .line 37
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 38
    .line 39
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->b:Lv/VDraweeView;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    invoke-static {v0}, Ll/vx6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/16 v1, 0x1e0

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p1, p4, v0, v1}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/pzi0;->o()J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    long-to-double v2, v2

    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 67
    .line 68
    iget-wide v4, p1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 69
    .line 70
    sub-double/2addr v2, v4

    .line 71
    invoke-static {}, Ll/gra;->E0()Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    invoke-static {}, Ll/gra;->E0()Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;->new_tag_show_max_time:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    const/16 p1, 0x1e

    .line 89
    .line 90
    :goto_0
    int-to-long v4, p1

    .line 91
    const-wide/32 v6, 0x5265c00

    .line 92
    .line 93
    .line 94
    mul-long/2addr v4, v6

    .line 95
    long-to-double v4, v4

    .line 96
    cmpg-double p1, v2, v4

    .line 97
    .line 98
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 99
    .line 100
    const/4 p4, 0x1

    .line 101
    if-gez p1, :cond_4

    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->labelExposureTime()D

    .line 106
    .line 107
    .line 108
    move-result-wide v4

    .line 109
    cmpg-double p1, v4, v2

    .line 110
    .line 111
    if-ltz p1, :cond_3

    .line 112
    .line 113
    invoke-static {}, Ll/pzi0;->o()J

    .line 114
    .line 115
    .line 116
    move-result-wide v4

    .line 117
    long-to-double v4, v4

    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->labelExposureTime()D

    .line 121
    .line 122
    .line 123
    move-result-wide v6

    .line 124
    sub-double/2addr v4, v6

    .line 125
    invoke-static {}, Ll/gra;->E0()Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_2

    .line 134
    .line 135
    invoke-static {}, Ll/gra;->E0()Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;->new_tag_exposure_after_max_minutes:I

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    const/4 p1, 0x3

    .line 143
    :goto_1
    int-to-long v6, p1

    .line 144
    const-wide/32 v8, 0xea60

    .line 145
    .line 146
    .line 147
    mul-long/2addr v6, v8

    .line 148
    long-to-double v6, v6

    .line 149
    cmpg-double p1, v4, v6

    .line 150
    .line 151
    if-gez p1, :cond_4

    .line 152
    .line 153
    :cond_3
    move p1, p4

    .line 154
    goto :goto_2

    .line 155
    :cond_4
    move p1, v1

    .line 156
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_6

    .line 165
    .line 166
    if-nez p1, :cond_5

    .line 167
    .line 168
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 169
    .line 170
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->m2:Ljava/util/Set;

    .line 173
    .line 174
    invoke-interface {p1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_6

    .line 179
    .line 180
    :cond_5
    move p1, p4

    .line 181
    goto :goto_3

    .line 182
    :cond_6
    move p1, v1

    .line 183
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->c:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 184
    .line 185
    if-eqz p1, :cond_7

    .line 186
    .line 187
    invoke-static {v0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    const/high16 v0, 0x421c0000    # 39.0f

    .line 191
    .line 192
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->c:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 197
    .line 198
    new-array v5, p4, [Landroid/view/View;

    .line 199
    .line 200
    aput-object v4, v5, v1

    .line 201
    .line 202
    invoke-static {v0, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->c:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 206
    .line 207
    sget v4, Ll/qa00;->o:I

    .line 208
    .line 209
    invoke-static {v0, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 210
    .line 211
    .line 212
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 213
    .line 214
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 215
    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->m2:Ljava/util/Set;

    .line 217
    .line 218
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 223
    .line 224
    .line 225
    :goto_4
    if-eqz p1, :cond_8

    .line 226
    .line 227
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-eqz p1, :cond_8

    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 234
    .line 235
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->labelExposureTime()D

    .line 236
    .line 237
    .line 238
    move-result-wide p1

    .line 239
    cmpg-double p1, p1, v2

    .line 240
    .line 241
    if-gez p1, :cond_8

    .line 242
    .line 243
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 244
    .line 245
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 249
    .line 250
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    if-eqz p1, :cond_a

    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 257
    .line 258
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 259
    .line 260
    .line 261
    invoke-static {}, Ll/gra;->z()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 266
    .line 267
    if-eqz p1, :cond_9

    .line 268
    .line 269
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 274
    .line 275
    sget-object v0, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->ID_VERIFIED:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 276
    .line 277
    invoke-virtual {p1, p3, v0}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    .line 282
    .line 283
    .line 284
    goto :goto_5

    .line 285
    :cond_9
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 290
    .line 291
    sget-object v0, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->OLD_VERIFIED_ICON:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 292
    .line 293
    invoke-virtual {p1, p3, v0}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    .line 298
    .line 299
    .line 300
    goto :goto_5

    .line 301
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 302
    .line 303
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 308
    .line 309
    if-eqz p1, :cond_c

    .line 310
    .line 311
    invoke-static {p2, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 312
    .line 313
    .line 314
    invoke-static {}, Ll/gra;->z()Z

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 319
    .line 320
    if-eqz p1, :cond_b

    .line 321
    .line 322
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 327
    .line 328
    sget-object v0, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->AVATAR_VERIFIED:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 329
    .line 330
    invoke-virtual {p1, p3, v0}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    .line 335
    .line 336
    .line 337
    goto :goto_5

    .line 338
    :cond_b
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 343
    .line 344
    sget-object v0, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->OLD_AVATAR_ICON:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 345
    .line 346
    invoke-virtual {p1, p3, v0}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    .line 351
    .line 352
    .line 353
    goto :goto_5

    .line 354
    :cond_c
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 355
    .line 356
    .line 357
    :goto_5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 358
    .line 359
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 360
    .line 361
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 362
    .line 363
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 364
    .line 365
    invoke-virtual {p1, p2}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 370
    .line 371
    .line 372
    move-result p2

    .line 373
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->i:Lv/VText;

    .line 374
    .line 375
    if-nez p2, :cond_d

    .line 376
    .line 377
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 378
    .line 379
    .line 380
    goto :goto_6

    .line 381
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 382
    .line 383
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    .line 387
    .line 388
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->j:Lv/VText;

    .line 389
    .line 390
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 391
    .line 392
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 393
    .line 394
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object p2

    .line 398
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 399
    .line 400
    .line 401
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->j:Lv/VText;

    .line 402
    .line 403
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 404
    .line 405
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 406
    .line 407
    .line 408
    move-result p2

    .line 409
    xor-int/2addr p2, p4

    .line 410
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 411
    .line 412
    .line 413
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 414
    .line 415
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 416
    .line 417
    .line 418
    move-result p1

    .line 419
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 420
    .line 421
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 422
    .line 423
    .line 424
    move-result p2

    .line 425
    if-eqz p1, :cond_e

    .line 426
    .line 427
    if-eqz p2, :cond_e

    .line 428
    .line 429
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k:Lv/VText;

    .line 430
    .line 431
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 432
    .line 433
    .line 434
    goto :goto_8

    .line 435
    :cond_e
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k:Lv/VText;

    .line 436
    .line 437
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 438
    .line 439
    .line 440
    const/4 p3, 0x0

    .line 441
    if-nez p2, :cond_f

    .line 442
    .line 443
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 444
    .line 445
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 446
    .line 447
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 448
    .line 449
    const/4 v2, 0x5

    .line 450
    invoke-virtual {p2, v0, v2}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 451
    .line 452
    .line 453
    move-result p2

    .line 454
    if-eqz p2, :cond_f

    .line 455
    .line 456
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 457
    .line 458
    .line 459
    move-result-object p2

    .line 460
    sget v0, Ll/dbc0;->mj:I

    .line 461
    .line 462
    invoke-virtual {p2, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 463
    .line 464
    .line 465
    move-result-object p2

    .line 466
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    invoke-virtual {p2, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 475
    .line 476
    .line 477
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k:Lv/VText;

    .line 478
    .line 479
    invoke-virtual {v0, p2, p3, p3, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 480
    .line 481
    .line 482
    const-string p2, "\u5728\u7ebf"

    .line 483
    .line 484
    goto :goto_7

    .line 485
    :cond_f
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k:Lv/VText;

    .line 486
    .line 487
    invoke-virtual {p2, p3, p3, p3, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 488
    .line 489
    .line 490
    const-string p2, ""

    .line 491
    .line 492
    :goto_7
    if-nez p1, :cond_11

    .line 493
    .line 494
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    if-nez p1, :cond_10

    .line 499
    .line 500
    const-string p1, " \u00b7 "

    .line 501
    .line 502
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object p2

    .line 506
    :cond_10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 507
    .line 508
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 509
    .line 510
    .line 511
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    .line 513
    .line 514
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 515
    .line 516
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 517
    .line 518
    iget p2, p2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 519
    .line 520
    invoke-static {p2, p4}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object p2

    .line 524
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object p2

    .line 531
    :cond_11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 532
    .line 533
    .line 534
    move-result p1

    .line 535
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k:Lv/VText;

    .line 536
    .line 537
    if-nez p1, :cond_12

    .line 538
    .line 539
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 540
    .line 541
    .line 542
    goto :goto_8

    .line 543
    :cond_12
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 544
    .line 545
    .line 546
    :goto_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->g:Lv/VImage;

    .line 547
    .line 548
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 549
    .line 550
    .line 551
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f:Landroid/view/View;

    .line 552
    .line 553
    sget p2, Ll/dbc0;->Ng:I

    .line 554
    .line 555
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 556
    .line 557
    .line 558
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f:Landroid/view/View;

    .line 559
    .line 560
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->getRootHeight()I

    .line 561
    .line 562
    .line 563
    move-result p2

    .line 564
    const/high16 p3, 0x42d80000    # 108.0f

    .line 565
    .line 566
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 567
    .line 568
    .line 569
    move-result p3

    .line 570
    mul-int/2addr p2, p3

    .line 571
    const/high16 p3, 0x436a0000    # 234.0f

    .line 572
    .line 573
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 574
    .line 575
    .line 576
    move-result v0

    .line 577
    div-int/2addr p2, v0

    .line 578
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 579
    .line 580
    .line 581
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 582
    .line 583
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 584
    .line 585
    .line 586
    move-result p1

    .line 587
    if-eqz p1, :cond_15

    .line 588
    .line 589
    invoke-static {}, Ll/gra;->z()Z

    .line 590
    .line 591
    .line 592
    move-result p1

    .line 593
    if-eqz p1, :cond_13

    .line 594
    .line 595
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->g:Lv/VImage;

    .line 596
    .line 597
    invoke-static {p0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 598
    .line 599
    .line 600
    return-void

    .line 601
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f:Landroid/view/View;

    .line 602
    .line 603
    sget p2, Ll/dbc0;->Ih:I

    .line 604
    .line 605
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 606
    .line 607
    .line 608
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f:Landroid/view/View;

    .line 609
    .line 610
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->getRootHeight()I

    .line 611
    .line 612
    .line 613
    move-result p0

    .line 614
    const/high16 p2, 0x42640000    # 57.0f

    .line 615
    .line 616
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 617
    .line 618
    .line 619
    move-result p2

    .line 620
    mul-int/2addr p0, p2

    .line 621
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 622
    .line 623
    .line 624
    move-result p2

    .line 625
    div-int/2addr p0, p2

    .line 626
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 627
    .line 628
    .line 629
    return-void

    .line 630
    :cond_14
    :goto_9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 631
    .line 632
    .line 633
    move-result p2

    .line 634
    if-eqz p2, :cond_15

    .line 635
    .line 636
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 637
    .line 638
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 639
    .line 640
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 641
    .line 642
    .line 643
    :cond_15
    return-void
.end method

.method public final synthetic h(ILandroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    const-string v0, "p_new_match"

    .line 9
    .line 10
    const-string v1, "card"

    .line 11
    .line 12
    invoke-static {p2, p0, p1, v0, v1}, Ll/dj0;->b(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;ILjava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic i(ILandroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->p:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    const-string v0, "p_new_match"

    .line 9
    .line 10
    const-string v1, "chat_icon"

    .line 11
    .line 12
    invoke-static {p2, p0, p1, v0, v1}, Ll/dj0;->b(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;ILjava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Frag;Ll/jic0;Ljava/lang/String;Ll/y20;Ll/y20;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v0, p3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/mj6;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/mj6;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p2, p1, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p2, Ll/nj6;

    .line 38
    .line 39
    invoke-direct {p2, p0, p4, p3, p5}, Ll/nj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;Ll/y20;Ljava/lang/String;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/oj6;

    .line 50
    .line 51
    invoke-direct {p1, p0, p6}, Ll/oj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;I)V

    .line 52
    .line 53
    .line 54
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 58
    .line 59
    new-instance p2, Ll/pj6;

    .line 60
    .line 61
    invoke-direct {p2, p0, p6}, Ll/pj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;I)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->q:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->r:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->D0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-static {}, Ll/gra;->D0()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    int-to-double v4, v4

    .line 20
    mul-double/2addr v2, v4

    .line 21
    double-to-int v2, v2

    .line 22
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/CharSequence;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->q:Landroid/animation/Animator;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->q:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->h:Lv/VLinear;

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 25
    .line 26
    const/high16 v2, 0x421c0000    # 39.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;->setRoundedCornerRadius(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    const/high16 v0, 0x42100000    # 36.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    new-array v1, v1, [Landroid/view/View;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    aput-object p0, v1, v2

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public n()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->o:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m:Landroid/view/View;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget v0, Ll/dbc0;->kh:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->h:Lv/VLinear;

    .line 21
    .line 22
    sget v1, Ll/qa00;->h:I

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->g:Lv/VImage;

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->getRootHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/high16 v2, 0x425c0000    # 55.0f

    .line 34
    .line 35
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    mul-int/2addr v1, v2

    .line 40
    const/high16 v2, 0x436a0000    # 234.0f

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    div-int/2addr v1, v2

    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget v0, Ll/dbc0;->Og:I

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->e()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->getRootHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
