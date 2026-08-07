.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "2x2"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, "2x2"

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, "2x2"

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_6

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 31
    .line 32
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 38
    .line 39
    sget v3, Ll/qa00;->d:I

    .line 40
    .line 41
    int-to-float v3, v3

    .line 42
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 43
    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 46
    .line 47
    const-string v3, "#38373B"

    .line 48
    .line 49
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 59
    .line 60
    .line 61
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->a:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    const/4 v6, -0x1

    .line 79
    sparse-switch v5, :sswitch_data_0

    .line 80
    .line 81
    .line 82
    :goto_0
    move v2, v6

    .line 83
    goto :goto_1

    .line 84
    :sswitch_0
    const-string v2, "1plus8"

    .line 85
    .line 86
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-nez v2, :cond_2

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    const/4 v2, 0x3

    .line 94
    goto :goto_1

    .line 95
    :sswitch_1
    const-string v2, "1plus5"

    .line 96
    .line 97
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-nez v2, :cond_3

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    const/4 v2, 0x2

    .line 105
    goto :goto_1

    .line 106
    :sswitch_2
    const-string v5, "3x3"

    .line 107
    .line 108
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-nez v4, :cond_5

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_3
    const-string v2, "2x2"

    .line 116
    .line 117
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-nez v2, :cond_4

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    const/4 v2, 0x0

    .line 125
    :cond_5
    :goto_1
    const v4, 0x3eaa7efa    # 0.333f

    .line 126
    .line 127
    .line 128
    const v5, 0x3f2ac083    # 0.667f

    .line 129
    .line 130
    .line 131
    const/high16 v6, 0x3f000000    # 0.5f

    .line 132
    .line 133
    const/high16 v7, 0x3f800000    # 1.0f

    .line 134
    .line 135
    packed-switch v2, :pswitch_data_0

    .line 136
    .line 137
    .line 138
    goto/16 :goto_2

    .line 139
    .line 140
    :pswitch_0
    int-to-float v1, v1

    .line 141
    mul-float v9, v1, v6

    .line 142
    .line 143
    int-to-float v2, v3

    .line 144
    const/4 v3, 0x0

    .line 145
    mul-float v10, v2, v3

    .line 146
    .line 147
    mul-float v14, v2, v7

    .line 148
    .line 149
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 150
    .line 151
    move v11, v9

    .line 152
    move-object/from16 v8, p1

    .line 153
    .line 154
    move v12, v14

    .line 155
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 156
    .line 157
    .line 158
    const/high16 v3, 0x3f400000    # 0.75f

    .line 159
    .line 160
    mul-float v11, v1, v3

    .line 161
    .line 162
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 163
    .line 164
    move v13, v11

    .line 165
    move v12, v10

    .line 166
    move-object/from16 v10, p1

    .line 167
    .line 168
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 169
    .line 170
    .line 171
    const/high16 v4, 0x3e800000    # 0.25f

    .line 172
    .line 173
    mul-float v10, v2, v4

    .line 174
    .line 175
    mul-float v11, v1, v7

    .line 176
    .line 177
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 178
    .line 179
    move v12, v10

    .line 180
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 181
    .line 182
    .line 183
    mul-float v10, v2, v6

    .line 184
    .line 185
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 186
    .line 187
    move v12, v10

    .line 188
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 189
    .line 190
    .line 191
    mul-float v10, v2, v3

    .line 192
    .line 193
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 194
    .line 195
    move v12, v10

    .line 196
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :pswitch_1
    int-to-float v2, v3

    .line 201
    mul-float v17, v2, v5

    .line 202
    .line 203
    int-to-float v1, v1

    .line 204
    mul-float v18, v1, v7

    .line 205
    .line 206
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 207
    .line 208
    const/16 v16, 0x0

    .line 209
    .line 210
    move/from16 v19, v17

    .line 211
    .line 212
    move-object/from16 v15, p1

    .line 213
    .line 214
    move-object/from16 v20, v3

    .line 215
    .line 216
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 217
    .line 218
    .line 219
    move/from16 v3, v17

    .line 220
    .line 221
    move/from16 v6, v18

    .line 222
    .line 223
    mul-float v16, v1, v5

    .line 224
    .line 225
    mul-float v19, v2, v7

    .line 226
    .line 227
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 228
    .line 229
    const/16 v17, 0x0

    .line 230
    .line 231
    move/from16 v18, v16

    .line 232
    .line 233
    move-object/from16 v20, v5

    .line 234
    .line 235
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 236
    .line 237
    .line 238
    move/from16 v7, v19

    .line 239
    .line 240
    mul-float v17, v2, v4

    .line 241
    .line 242
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 243
    .line 244
    move/from16 v19, v17

    .line 245
    .line 246
    move-object/from16 v20, v2

    .line 247
    .line 248
    move/from16 v18, v6

    .line 249
    .line 250
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 251
    .line 252
    .line 253
    mul-float v16, v1, v4

    .line 254
    .line 255
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 256
    .line 257
    move/from16 v18, v16

    .line 258
    .line 259
    move-object/from16 v20, v0

    .line 260
    .line 261
    move/from16 v17, v3

    .line 262
    .line 263
    move/from16 v19, v7

    .line 264
    .line 265
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :pswitch_2
    int-to-float v2, v3

    .line 270
    mul-float v17, v2, v4

    .line 271
    .line 272
    int-to-float v1, v1

    .line 273
    mul-float v18, v1, v7

    .line 274
    .line 275
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 276
    .line 277
    const/16 v16, 0x0

    .line 278
    .line 279
    move/from16 v19, v17

    .line 280
    .line 281
    move-object/from16 v15, p1

    .line 282
    .line 283
    move-object/from16 v20, v3

    .line 284
    .line 285
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 286
    .line 287
    .line 288
    mul-float v17, v2, v5

    .line 289
    .line 290
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 291
    .line 292
    move/from16 v19, v17

    .line 293
    .line 294
    move-object/from16 v20, v3

    .line 295
    .line 296
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 297
    .line 298
    .line 299
    mul-float v16, v1, v4

    .line 300
    .line 301
    mul-float v19, v2, v7

    .line 302
    .line 303
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 304
    .line 305
    const/16 v17, 0x0

    .line 306
    .line 307
    move/from16 v18, v16

    .line 308
    .line 309
    move-object/from16 v20, v2

    .line 310
    .line 311
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 312
    .line 313
    .line 314
    mul-float v16, v1, v5

    .line 315
    .line 316
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 317
    .line 318
    move/from16 v18, v16

    .line 319
    .line 320
    move-object/from16 v20, v0

    .line 321
    .line 322
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 323
    .line 324
    .line 325
    return-void

    .line 326
    :pswitch_3
    int-to-float v2, v3

    .line 327
    mul-float v17, v2, v6

    .line 328
    .line 329
    int-to-float v1, v1

    .line 330
    mul-float v18, v1, v7

    .line 331
    .line 332
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 333
    .line 334
    const/16 v16, 0x0

    .line 335
    .line 336
    move/from16 v19, v17

    .line 337
    .line 338
    move-object/from16 v15, p1

    .line 339
    .line 340
    move-object/from16 v20, v3

    .line 341
    .line 342
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 343
    .line 344
    .line 345
    mul-float v16, v1, v6

    .line 346
    .line 347
    mul-float v19, v2, v7

    .line 348
    .line 349
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopLineView;->b:Landroid/graphics/Paint;

    .line 350
    .line 351
    const/16 v17, 0x0

    .line 352
    .line 353
    move/from16 v18, v16

    .line 354
    .line 355
    move-object/from16 v20, v0

    .line 356
    .line 357
    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 358
    .line 359
    .line 360
    :cond_6
    :goto_2
    return-void

    .line 361
    :sswitch_data_0
    .sparse-switch
        0xca6c -> :sswitch_3
        0xce2e -> :sswitch_2
        0x59fa9c4a -> :sswitch_1
        0x59fa9c4d -> :sswitch_0
    .end sparse-switch

    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
