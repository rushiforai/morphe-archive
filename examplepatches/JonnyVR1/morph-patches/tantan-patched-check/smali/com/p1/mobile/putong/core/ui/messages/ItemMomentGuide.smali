.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VLinear;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Lv/VRelative;

.field public f:Lv/VDraweeView;

.field public g:Lv/VFrame;

.field public h:Lv/VText;

.field public i:Lv/VRelative;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->b(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    sget-object v3, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    move-object v0, v2

    .line 30
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->a:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    const/16 v5, 0x8

    .line 37
    .line 38
    if-eqz v3, :cond_f

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->b:Lv/VLinear;

    .line 45
    .line 46
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->i:Lv/VRelative;

    .line 50
    .line 51
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->k:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->e:Lv/VRelative;

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->g:Lv/VFrame;

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->h:Lv/VText;

    .line 70
    .line 71
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 72
    .line 73
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 74
    .line 75
    .line 76
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->k:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 79
    .line 80
    .line 81
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->l:Lv/VText;

    .line 82
    .line 83
    iget v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 84
    .line 85
    const/4 v7, 0x3

    .line 86
    if-ne v6, v7, :cond_1

    .line 87
    .line 88
    move v6, v3

    .line 89
    goto :goto_1

    .line 90
    :cond_1
    const/high16 v6, 0x41400000    # 12.0f

    .line 91
    .line 92
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    :goto_1
    invoke-static {v4, v6}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 97
    .line 98
    .line 99
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->l:Lv/VText;

    .line 100
    .line 101
    iget v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 102
    .line 103
    const/4 v8, 0x2

    .line 104
    const/4 v9, 0x1

    .line 105
    if-ne v6, v7, :cond_2

    .line 106
    .line 107
    move v6, v8

    .line 108
    goto :goto_2

    .line 109
    :cond_2
    move v6, v9

    .line 110
    :goto_2
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setLines(I)V

    .line 111
    .line 112
    .line 113
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->l:Lv/VText;

    .line 120
    .line 121
    if-nez v4, :cond_3

    .line 122
    .line 123
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    .line 124
    .line 125
    .line 126
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->l:Lv/VText;

    .line 127
    .line 128
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_3
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    .line 135
    .line 136
    .line 137
    :goto_3
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->m:Lv/VText;

    .line 138
    .line 139
    new-instance v5, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    new-instance v6, Ljava/util/Date;

    .line 145
    .line 146
    iget-wide v10, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->createdTime:D

    .line 147
    .line 148
    double-to-long v10, v10

    .line 149
    invoke-direct {v6, v10, v11}, Ljava/util/Date;-><init>(J)V

    .line 150
    .line 151
    .line 152
    invoke-static {v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d(Ljava/util/Date;)Z

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    const-string v10, ""

    .line 157
    .line 158
    if-eqz v6, :cond_4

    .line 159
    .line 160
    move-object v6, v10

    .line 161
    goto :goto_4

    .line 162
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    iget-wide v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->createdTime:D

    .line 168
    .line 169
    invoke-static {v11, v12}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b(D)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v11

    .line 173
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v11, " "

    .line 177
    .line 178
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v6

    .line 185
    :goto_4
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    sget-object v6, Ll/pzi0;->h:Ljava/text/SimpleDateFormat;

    .line 189
    .line 190
    iget-wide v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->createdTime:D

    .line 191
    .line 192
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 193
    .line 194
    .line 195
    move-result-object v11

    .line 196
    invoke-virtual {v6, v11}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v6, "\u53d1\u5e03\u4e86"

    .line 204
    .line 205
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->ownerId:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->a:Landroid/widget/LinearLayout;

    .line 220
    .line 221
    invoke-virtual {v6, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 222
    .line 223
    .line 224
    new-instance v2, Ll/q3d0;

    .line 225
    .line 226
    const/high16 v6, 0x42a00000    # 80.0f

    .line 227
    .line 228
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result v11

    .line 232
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 233
    .line 234
    .line 235
    move-result v6

    .line 236
    invoke-direct {v2, v11, v6}, Ll/q3d0;-><init>(II)V

    .line 237
    .line 238
    .line 239
    iget v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 240
    .line 241
    const/4 v11, 0x4

    .line 242
    if-ne v6, v9, :cond_7

    .line 243
    .line 244
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 245
    .line 246
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 247
    .line 248
    .line 249
    move-result v6

    .line 250
    if-nez v6, :cond_7

    .line 251
    .line 252
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 255
    .line 256
    .line 257
    move-result v6

    .line 258
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->b:Lv/VLinear;

    .line 259
    .line 260
    invoke-virtual {v12, v3}, Landroid/view/View;->setVisibility(I)V

    .line 261
    .line 262
    .line 263
    iget-object v12, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 264
    .line 265
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 266
    .line 267
    .line 268
    move-result v12

    .line 269
    if-ne v12, v9, :cond_5

    .line 270
    .line 271
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 272
    .line 273
    invoke-virtual {v12, v3}, Landroid/view/View;->setVisibility(I)V

    .line 274
    .line 275
    .line 276
    move v12, v11

    .line 277
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 278
    .line 279
    move v13, v12

    .line 280
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 281
    .line 282
    iget-object v14, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 283
    .line 284
    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v14

    .line 288
    check-cast v14, Ljava/lang/String;

    .line 289
    .line 290
    const/4 v15, 0x0

    .line 291
    const/16 v17, 0x0

    .line 292
    .line 293
    move/from16 v16, v13

    .line 294
    .line 295
    move-object v13, v14

    .line 296
    const/4 v14, 0x1

    .line 297
    move/from16 v20, v16

    .line 298
    .line 299
    move-object/from16 v16, v2

    .line 300
    .line 301
    move/from16 v2, v20

    .line 302
    .line 303
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 304
    .line 305
    .line 306
    goto/16 :goto_6

    .line 307
    .line 308
    :cond_5
    move-object/from16 v16, v2

    .line 309
    .line 310
    move v2, v11

    .line 311
    iget-object v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 312
    .line 313
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 314
    .line 315
    .line 316
    move-result v11

    .line 317
    if-ne v11, v8, :cond_6

    .line 318
    .line 319
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 320
    .line 321
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 322
    .line 323
    .line 324
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 325
    .line 326
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 327
    .line 328
    .line 329
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 330
    .line 331
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 332
    .line 333
    iget-object v13, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 334
    .line 335
    invoke-interface {v13, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v13

    .line 339
    check-cast v13, Ljava/lang/String;

    .line 340
    .line 341
    const/4 v15, 0x0

    .line 342
    const/16 v17, 0x0

    .line 343
    .line 344
    const/4 v14, 0x1

    .line 345
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 346
    .line 347
    .line 348
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 349
    .line 350
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 351
    .line 352
    .line 353
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 354
    .line 355
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 356
    .line 357
    iget-object v13, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 358
    .line 359
    invoke-interface {v13, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object v13

    .line 363
    check-cast v13, Ljava/lang/String;

    .line 364
    .line 365
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 366
    .line 367
    .line 368
    goto/16 :goto_6

    .line 369
    .line 370
    :cond_6
    iget-object v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 371
    .line 372
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 373
    .line 374
    .line 375
    move-result v11

    .line 376
    if-lt v11, v7, :cond_a

    .line 377
    .line 378
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 379
    .line 380
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 381
    .line 382
    .line 383
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 384
    .line 385
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 386
    .line 387
    .line 388
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->e:Lv/VRelative;

    .line 389
    .line 390
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 391
    .line 392
    .line 393
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 394
    .line 395
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 396
    .line 397
    iget-object v13, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 398
    .line 399
    invoke-interface {v13, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v13

    .line 403
    check-cast v13, Ljava/lang/String;

    .line 404
    .line 405
    const/4 v15, 0x0

    .line 406
    const/16 v17, 0x0

    .line 407
    .line 408
    const/4 v14, 0x1

    .line 409
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 410
    .line 411
    .line 412
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 413
    .line 414
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 415
    .line 416
    .line 417
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 418
    .line 419
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 420
    .line 421
    iget-object v13, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 422
    .line 423
    invoke-interface {v13, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v13

    .line 427
    check-cast v13, Ljava/lang/String;

    .line 428
    .line 429
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 430
    .line 431
    .line 432
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->f:Lv/VDraweeView;

    .line 433
    .line 434
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 435
    .line 436
    .line 437
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 438
    .line 439
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->f:Lv/VDraweeView;

    .line 440
    .line 441
    iget-object v13, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 442
    .line 443
    invoke-interface {v13, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v13

    .line 447
    check-cast v13, Ljava/lang/String;

    .line 448
    .line 449
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 450
    .line 451
    .line 452
    iget-object v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 453
    .line 454
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 455
    .line 456
    .line 457
    move-result v11

    .line 458
    if-le v11, v7, :cond_a

    .line 459
    .line 460
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->g:Lv/VFrame;

    .line 461
    .line 462
    invoke-virtual {v11, v3}, Landroid/view/View;->setVisibility(I)V

    .line 463
    .line 464
    .line 465
    iget-object v11, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->h:Lv/VText;

    .line 466
    .line 467
    new-instance v12, Ljava/lang/StringBuilder;

    .line 468
    .line 469
    const-string v13, "+"

    .line 470
    .line 471
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    iget-object v13, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 475
    .line 476
    invoke-interface {v13}, Ljava/util/List;->size()I

    .line 477
    .line 478
    .line 479
    move-result v13

    .line 480
    sub-int/2addr v13, v7

    .line 481
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 482
    .line 483
    .line 484
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v12

    .line 488
    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 489
    .line 490
    .line 491
    goto :goto_6

    .line 492
    :cond_7
    move-object/from16 v16, v2

    .line 493
    .line 494
    move v2, v11

    .line 495
    iget v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 496
    .line 497
    if-ne v6, v8, :cond_8

    .line 498
    .line 499
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 500
    .line 501
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 502
    .line 503
    .line 504
    move-result v6

    .line 505
    if-nez v6, :cond_8

    .line 506
    .line 507
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->i:Lv/VRelative;

    .line 508
    .line 509
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    .line 510
    .line 511
    .line 512
    sget-object v11, Ll/uqb0;->G:Ll/fsb0;

    .line 513
    .line 514
    iget-object v12, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->j:Lv/VDraweeView;

    .line 515
    .line 516
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 517
    .line 518
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    move-result-object v6

    .line 522
    move-object v13, v6

    .line 523
    check-cast v13, Ljava/lang/String;

    .line 524
    .line 525
    const/4 v15, 0x0

    .line 526
    const/16 v17, 0x0

    .line 527
    .line 528
    const/4 v14, 0x1

    .line 529
    invoke-virtual/range {v11 .. v17}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 530
    .line 531
    .line 532
    goto :goto_5

    .line 533
    :cond_8
    iget v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 534
    .line 535
    if-ne v6, v2, :cond_9

    .line 536
    .line 537
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->k:Lv/VText;

    .line 538
    .line 539
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    .line 540
    .line 541
    .line 542
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->k:Lv/VText;

    .line 543
    .line 544
    iget-object v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->audioDuration:Ljava/lang/String;

    .line 545
    .line 546
    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 547
    .line 548
    .line 549
    :cond_9
    :goto_5
    move v6, v3

    .line 550
    :cond_a
    :goto_6
    iget v11, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 551
    .line 552
    if-ne v11, v2, :cond_b

    .line 553
    .line 554
    const-string v2, "voice"

    .line 555
    .line 556
    goto :goto_7

    .line 557
    :cond_b
    if-ne v11, v9, :cond_c

    .line 558
    .line 559
    const-string v2, "photo"

    .line 560
    .line 561
    goto :goto_7

    .line 562
    :cond_c
    if-ne v11, v8, :cond_d

    .line 563
    .line 564
    const-string v2, "video"

    .line 565
    .line 566
    goto :goto_7

    .line 567
    :cond_d
    if-ne v11, v7, :cond_e

    .line 568
    .line 569
    const-string v2, "word"

    .line 570
    .line 571
    goto :goto_7

    .line 572
    :cond_e
    move-object v2, v10

    .line 573
    :goto_7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->videoDuration:Ljava/lang/String;

    .line 574
    .line 575
    const-string v7, "live_moment_type"

    .line 576
    .line 577
    const-string v8, "revision"

    .line 578
    .line 579
    invoke-static {v7, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 580
    .line 581
    .line 582
    move-result-object v11

    .line 583
    const-string v7, "moment_id"

    .line 584
    .line 585
    invoke-static {v7, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 586
    .line 587
    .line 588
    move-result-object v12

    .line 589
    const-string v7, "moment_photo_numbers"

    .line 590
    .line 591
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 592
    .line 593
    .line 594
    move-result-object v8

    .line 595
    invoke-static {v7, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 596
    .line 597
    .line 598
    move-result-object v13

    .line 599
    const-string v7, "moment_type"

    .line 600
    .line 601
    invoke-static {v7, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 602
    .line 603
    .line 604
    move-result-object v14

    .line 605
    const-string v7, "order"

    .line 606
    .line 607
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 608
    .line 609
    .line 610
    move-result-object v3

    .line 611
    invoke-static {v7, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 612
    .line 613
    .line 614
    move-result-object v15

    .line 615
    const-string v3, "owner_id"

    .line 616
    .line 617
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 618
    .line 619
    .line 620
    move-result-object v16

    .line 621
    const-string v3, "recommend_tag_type"

    .line 622
    .line 623
    invoke-static {v3, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 624
    .line 625
    .line 626
    move-result-object v17

    .line 627
    const-string v3, "report"

    .line 628
    .line 629
    invoke-static {v3, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 630
    .line 631
    .line 632
    move-result-object v18

    .line 633
    const-string v3, "video_time"

    .line 634
    .line 635
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 636
    .line 637
    .line 638
    move-result-object v19

    .line 639
    filled-new-array/range {v11 .. v19}, [Ll/pf60;

    .line 640
    .line 641
    .line 642
    move-result-object v3

    .line 643
    const-string v7, "e_moment"

    .line 644
    .line 645
    const-string v8, "p_chat_view"

    .line 646
    .line 647
    invoke-static {v7, v8, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 648
    .line 649
    .line 650
    iget-object v7, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->a:Landroid/widget/LinearLayout;

    .line 651
    .line 652
    move v3, v6

    .line 653
    move-object v6, v0

    .line 654
    new-instance v0, Ll/ecq;

    .line 655
    .line 656
    move-object/from16 v20, v4

    .line 657
    .line 658
    move-object v4, v2

    .line 659
    move-object/from16 v2, v20

    .line 660
    .line 661
    invoke-direct/range {v0 .. v6}, Ll/ecq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    .line 663
    .line 664
    invoke-static {v7, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 665
    .line 666
    .line 667
    goto :goto_8

    .line 668
    :cond_f
    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 669
    .line 670
    .line 671
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->a:Landroid/widget/LinearLayout;

    .line 672
    .line 673
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 674
    .line 675
    .line 676
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->a:Landroid/widget/LinearLayout;

    .line 677
    .line 678
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 679
    .line 680
    .line 681
    :goto_8
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

.method public final synthetic b(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 14

    .line 1
    const-string v0, "live_moment_type"

    .line 2
    .line 3
    const-string v1, "revision"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v0, "moment_id"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string p1, "moment_photo_numbers"

    .line 16
    .line 17
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p1, "moment_type"

    .line 26
    .line 27
    move-object/from16 v0, p3

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "order"

    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    const-string p1, "owner_id"

    .line 45
    .line 46
    move-object/from16 v0, p4

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    const-string p1, "recommend_tag_type"

    .line 53
    .line 54
    const-string v1, ""

    .line 55
    .line 56
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    const-string p1, "report"

    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v9

    .line 66
    const-string p1, "video_time"

    .line 67
    .line 68
    move-object/from16 v1, p5

    .line 69
    .line 70
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    filled-new-array/range {v2 .. v10}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v1, "e_moment"

    .line 79
    .line 80
    const-string v2, "p_chat_view"

    .line 81
    .line 82
    invoke-static {v1, v2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object v8

    .line 97
    const/4 v12, 0x0

    .line 98
    const/4 v13, 0x2

    .line 99
    const-string v10, "from_chat"

    .line 100
    .line 101
    const/4 v11, -0x1

    .line 102
    move-object v9, v0

    .line 103
    invoke-interface/range {v7 .. v13}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->a:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    sget v0, Ll/edc0;->g3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VLinear;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->b:Lv/VLinear;

    .line 23
    .line 24
    sget v0, Ll/edc0;->s2:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->c:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/edc0;->t2:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VDraweeView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->d:Lv/VDraweeView;

    .line 43
    .line 44
    sget v0, Ll/edc0;->v2:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VRelative;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->e:Lv/VRelative;

    .line 53
    .line 54
    sget v0, Ll/edc0;->u2:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->f:Lv/VDraweeView;

    .line 63
    .line 64
    sget v0, Ll/edc0;->e3:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VFrame;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->g:Lv/VFrame;

    .line 73
    .line 74
    sget v0, Ll/edc0;->f3:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VText;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->h:Lv/VText;

    .line 83
    .line 84
    sget v0, Ll/edc0;->u5:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lv/VRelative;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->i:Lv/VRelative;

    .line 93
    .line 94
    sget v0, Ll/edc0;->B2:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lv/VDraweeView;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->j:Lv/VDraweeView;

    .line 103
    .line 104
    sget v0, Ll/edc0;->m:I

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lv/VText;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->k:Lv/VText;

    .line 113
    .line 114
    sget v0, Ll/edc0;->A4:I

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lv/VText;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->l:Lv/VText;

    .line 123
    .line 124
    sget v0, Ll/edc0;->F4:I

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lv/VText;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuide;->m:Lv/VText;

    .line 133
    .line 134
    return-void
.end method
