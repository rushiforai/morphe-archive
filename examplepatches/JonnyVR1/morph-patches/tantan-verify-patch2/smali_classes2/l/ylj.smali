.class public Ll/ylj;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xlj;->s()Lcom/facebook/drawee/generic/RoundingParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/xlj;->s()Lcom/facebook/drawee/generic/RoundingParams;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static c(Landroid/content/res/TypedArray;I)Ll/h1e0;
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    packed-switch p0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    const-string p0, "XML attribute not specified!"

    .line 10
    .line 11
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :pswitch_0
    sget-object p0, Ll/h1e0;->k:Ll/h1e0;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_1
    sget-object p0, Ll/h1e0;->j:Ll/h1e0;

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_2
    sget-object p0, Ll/h1e0;->i:Ll/h1e0;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_3
    sget-object p0, Ll/h1e0;->h:Ll/h1e0;

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_4
    sget-object p0, Ll/h1e0;->g:Ll/h1e0;

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_5
    sget-object p0, Ll/h1e0;->f:Ll/h1e0;

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_6
    sget-object p0, Ll/h1e0;->e:Ll/h1e0;

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_7
    sget-object p0, Ll/h1e0;->d:Ll/h1e0;

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_8
    sget-object p0, Ll/h1e0;->a:Ll/h1e0;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_9
    const/4 p0, 0x0

    .line 44
    return-object p0

    .line 45
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/xlj;
    .locals 2

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "GenericDraweeHierarchyBuilder#inflateBuilder"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/xlj;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0, p1}, Ll/ylj;->e(Ll/xlj;Landroid/content/Context;Landroid/util/AttributeSet;)Ll/xlj;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ll/i9j;->d()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/i9j;->b()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-object p0
.end method

.method public static e(Ll/xlj;Landroid/content/Context;Landroid/util/AttributeSet;)Ll/xlj;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    if-eqz v2, :cond_26

    .line 8
    .line 9
    sget-object v6, Ll/wgc0;->a:[I

    .line 10
    .line 11
    invoke-virtual {v1, v2, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :try_start_0
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 16
    .line 17
    .line 18
    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 19
    const/4 v5, 0x0

    .line 20
    const/4 v7, 0x0

    .line 21
    const/4 v8, 0x1

    .line 22
    const/4 v9, 0x1

    .line 23
    const/4 v10, 0x1

    .line 24
    const/4 v11, 0x1

    .line 25
    const/4 v12, 0x1

    .line 26
    const/4 v13, 0x1

    .line 27
    const/4 v14, 0x1

    .line 28
    const/4 v15, 0x1

    .line 29
    const/16 v16, 0x0

    .line 30
    .line 31
    :goto_0
    if-ge v7, v6, :cond_1d

    .line 32
    .line 33
    :try_start_1
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    sget v4, Ll/wgc0;->b:I

    .line 38
    .line 39
    if-ne v3, v4, :cond_0

    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/ylj;->c(Landroid/content/res/TypedArray;I)Ll/h1e0;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v0, v3}, Ll/xlj;->v(Ll/h1e0;)Ll/xlj;

    .line 46
    .line 47
    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :catchall_0
    move-exception v0

    .line 51
    goto/16 :goto_b

    .line 52
    .line 53
    :cond_0
    sget v4, Ll/wgc0;->h:I

    .line 54
    .line 55
    if-ne v3, v4, :cond_1

    .line 56
    .line 57
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v0, v3}, Ll/xlj;->D(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 62
    .line 63
    .line 64
    goto/16 :goto_1

    .line 65
    .line 66
    :cond_1
    sget v4, Ll/wgc0;->j:I

    .line 67
    .line 68
    if-ne v3, v4, :cond_2

    .line 69
    .line 70
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v0, v3}, Ll/xlj;->F(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 75
    .line 76
    .line 77
    goto/16 :goto_1

    .line 78
    .line 79
    :cond_2
    sget v4, Ll/wgc0;->l:I

    .line 80
    .line 81
    if-ne v3, v4, :cond_3

    .line 82
    .line 83
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v0, v3}, Ll/xlj;->G(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 88
    .line 89
    .line 90
    goto/16 :goto_1

    .line 91
    .line 92
    :cond_3
    sget v4, Ll/wgc0;->d:I

    .line 93
    .line 94
    if-ne v3, v4, :cond_4

    .line 95
    .line 96
    const/4 v4, 0x0

    .line 97
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    invoke-virtual {v0, v3}, Ll/xlj;->y(I)Ll/xlj;

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    sget v4, Ll/wgc0;->D:I

    .line 106
    .line 107
    if-ne v3, v4, :cond_5

    .line 108
    .line 109
    const/4 v4, 0x0

    .line 110
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {v0, v3}, Ll/xlj;->x(F)Ll/xlj;

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    sget v4, Ll/wgc0;->i:I

    .line 119
    .line 120
    if-ne v3, v4, :cond_6

    .line 121
    .line 122
    invoke-static {v2, v3}, Ll/ylj;->c(Landroid/content/res/TypedArray;I)Ll/h1e0;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v0, v3}, Ll/xlj;->E(Ll/h1e0;)Ll/xlj;

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_6
    sget v4, Ll/wgc0;->n:I

    .line 131
    .line 132
    if-ne v3, v4, :cond_7

    .line 133
    .line 134
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v0, v3}, Ll/xlj;->I(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_7
    sget v4, Ll/wgc0;->o:I

    .line 143
    .line 144
    if-ne v3, v4, :cond_8

    .line 145
    .line 146
    invoke-static {v2, v3}, Ll/ylj;->c(Landroid/content/res/TypedArray;I)Ll/h1e0;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v0, v3}, Ll/xlj;->J(Ll/h1e0;)Ll/xlj;

    .line 151
    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_8
    sget v4, Ll/wgc0;->e:I

    .line 155
    .line 156
    if-ne v3, v4, :cond_9

    .line 157
    .line 158
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v0, v3}, Ll/xlj;->A(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_9
    sget v4, Ll/wgc0;->f:I

    .line 167
    .line 168
    if-ne v3, v4, :cond_a

    .line 169
    .line 170
    invoke-static {v2, v3}, Ll/ylj;->c(Landroid/content/res/TypedArray;I)Ll/h1e0;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {v0, v3}, Ll/xlj;->B(Ll/h1e0;)Ll/xlj;

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_a
    sget v4, Ll/wgc0;->m:I

    .line 179
    .line 180
    if-ne v3, v4, :cond_b

    .line 181
    .line 182
    invoke-static {v2, v3}, Ll/ylj;->c(Landroid/content/res/TypedArray;I)Ll/h1e0;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    invoke-virtual {v0, v3}, Ll/xlj;->H(Ll/h1e0;)Ll/xlj;

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_b
    sget v4, Ll/wgc0;->k:I

    .line 191
    .line 192
    if-ne v3, v4, :cond_d

    .line 193
    .line 194
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    :cond_c
    :goto_1
    const/4 v4, 0x0

    .line 199
    goto/16 :goto_3

    .line 200
    .line 201
    :cond_d
    sget v4, Ll/wgc0;->c:I

    .line 202
    .line 203
    if-ne v3, v4, :cond_e

    .line 204
    .line 205
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-virtual {v0, v3}, Ll/xlj;->w(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_e
    sget v4, Ll/wgc0;->g:I

    .line 214
    .line 215
    if-ne v3, v4, :cond_f

    .line 216
    .line 217
    invoke-static {v1, v2, v3}, Ll/ylj;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {v0, v3}, Ll/xlj;->C(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 222
    .line 223
    .line 224
    goto :goto_1

    .line 225
    :cond_f
    sget v4, Ll/wgc0;->p:I

    .line 226
    .line 227
    if-ne v3, v4, :cond_10

    .line 228
    .line 229
    invoke-static {v0}, Ll/ylj;->b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    const/4 v1, 0x0

    .line 234
    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    invoke-virtual {v4, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 239
    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_10
    sget v1, Ll/wgc0;->z:I

    .line 243
    .line 244
    if-ne v3, v1, :cond_11

    .line 245
    .line 246
    move/from16 v4, v16

    .line 247
    .line 248
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 249
    .line 250
    .line 251
    move-result v16

    .line 252
    goto :goto_1

    .line 253
    :cond_11
    move/from16 v4, v16

    .line 254
    .line 255
    sget v1, Ll/wgc0;->v:I

    .line 256
    .line 257
    if-ne v3, v1, :cond_12

    .line 258
    .line 259
    invoke-virtual {v2, v3, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 260
    .line 261
    .line 262
    move-result v8

    .line 263
    :goto_2
    move/from16 v16, v4

    .line 264
    .line 265
    goto :goto_1

    .line 266
    :cond_12
    sget v1, Ll/wgc0;->w:I

    .line 267
    .line 268
    if-ne v3, v1, :cond_13

    .line 269
    .line 270
    invoke-virtual {v2, v3, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 271
    .line 272
    .line 273
    move-result v10

    .line 274
    goto :goto_2

    .line 275
    :cond_13
    sget v1, Ll/wgc0;->r:I

    .line 276
    .line 277
    if-ne v3, v1, :cond_14

    .line 278
    .line 279
    invoke-virtual {v2, v3, v14}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 280
    .line 281
    .line 282
    move-result v14

    .line 283
    goto :goto_2

    .line 284
    :cond_14
    sget v1, Ll/wgc0;->s:I

    .line 285
    .line 286
    if-ne v3, v1, :cond_15

    .line 287
    .line 288
    invoke-virtual {v2, v3, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 289
    .line 290
    .line 291
    move-result v12

    .line 292
    goto :goto_2

    .line 293
    :cond_15
    sget v1, Ll/wgc0;->x:I

    .line 294
    .line 295
    if-ne v3, v1, :cond_16

    .line 296
    .line 297
    invoke-virtual {v2, v3, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 298
    .line 299
    .line 300
    move-result v9

    .line 301
    goto :goto_2

    .line 302
    :cond_16
    sget v1, Ll/wgc0;->u:I

    .line 303
    .line 304
    if-ne v3, v1, :cond_17

    .line 305
    .line 306
    invoke-virtual {v2, v3, v11}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 307
    .line 308
    .line 309
    move-result v11

    .line 310
    goto :goto_2

    .line 311
    :cond_17
    sget v1, Ll/wgc0;->t:I

    .line 312
    .line 313
    if-ne v3, v1, :cond_18

    .line 314
    .line 315
    invoke-virtual {v2, v3, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 316
    .line 317
    .line 318
    move-result v15

    .line 319
    goto :goto_2

    .line 320
    :cond_18
    sget v1, Ll/wgc0;->q:I

    .line 321
    .line 322
    if-ne v3, v1, :cond_19

    .line 323
    .line 324
    invoke-virtual {v2, v3, v13}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 325
    .line 326
    .line 327
    move-result v13

    .line 328
    goto :goto_2

    .line 329
    :cond_19
    sget v1, Ll/wgc0;->y:I

    .line 330
    .line 331
    if-ne v3, v1, :cond_1a

    .line 332
    .line 333
    invoke-static {v0}, Ll/ylj;->b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    move/from16 v16, v4

    .line 338
    .line 339
    const/4 v4, 0x0

    .line 340
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->t(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 345
    .line 346
    .line 347
    goto/16 :goto_1

    .line 348
    .line 349
    :cond_1a
    move/from16 v16, v4

    .line 350
    .line 351
    sget v1, Ll/wgc0;->C:I

    .line 352
    .line 353
    if-ne v3, v1, :cond_1b

    .line 354
    .line 355
    invoke-static {v0}, Ll/ylj;->b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    const/4 v4, 0x0

    .line 360
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 361
    .line 362
    .line 363
    move-result v3

    .line 364
    int-to-float v3, v3

    .line 365
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->q(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 366
    .line 367
    .line 368
    goto/16 :goto_1

    .line 369
    .line 370
    :cond_1b
    sget v1, Ll/wgc0;->A:I

    .line 371
    .line 372
    if-ne v3, v1, :cond_1c

    .line 373
    .line 374
    invoke-static {v0}, Ll/ylj;->b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    const/4 v4, 0x0

    .line 379
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 380
    .line 381
    .line 382
    move-result v3

    .line 383
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->p(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 384
    .line 385
    .line 386
    goto/16 :goto_1

    .line 387
    .line 388
    :cond_1c
    sget v1, Ll/wgc0;->B:I

    .line 389
    .line 390
    if-ne v3, v1, :cond_c

    .line 391
    .line 392
    invoke-static {v0}, Ll/ylj;->b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    const/4 v4, 0x0

    .line 397
    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 398
    .line 399
    .line 400
    move-result v3

    .line 401
    int-to-float v3, v3

    .line 402
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->u(F)Lcom/facebook/drawee/generic/RoundingParams;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 403
    .line 404
    .line 405
    :goto_3
    add-int/lit8 v7, v7, 0x1

    .line 406
    .line 407
    move-object/from16 v1, p1

    .line 408
    .line 409
    goto/16 :goto_0

    .line 410
    .line 411
    :cond_1d
    const/4 v4, 0x0

    .line 412
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 413
    .line 414
    .line 415
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    const/4 v2, 0x1

    .line 428
    if-ne v1, v2, :cond_22

    .line 429
    .line 430
    if-eqz v8, :cond_1e

    .line 431
    .line 432
    if-eqz v11, :cond_1e

    .line 433
    .line 434
    const/4 v1, 0x1

    .line 435
    goto :goto_4

    .line 436
    :cond_1e
    move v1, v4

    .line 437
    :goto_4
    if-eqz v10, :cond_1f

    .line 438
    .line 439
    if-eqz v9, :cond_1f

    .line 440
    .line 441
    const/4 v2, 0x1

    .line 442
    goto :goto_5

    .line 443
    :cond_1f
    move v2, v4

    .line 444
    :goto_5
    if-eqz v12, :cond_20

    .line 445
    .line 446
    if-eqz v15, :cond_20

    .line 447
    .line 448
    const/4 v3, 0x1

    .line 449
    goto :goto_6

    .line 450
    :cond_20
    move v3, v4

    .line 451
    :goto_6
    if-eqz v14, :cond_21

    .line 452
    .line 453
    if-eqz v13, :cond_21

    .line 454
    .line 455
    :goto_7
    const/4 v4, 0x1

    .line 456
    :cond_21
    move v6, v4

    .line 457
    move v4, v5

    .line 458
    move v5, v1

    .line 459
    move/from16 v1, v16

    .line 460
    .line 461
    goto :goto_c

    .line 462
    :cond_22
    if-eqz v8, :cond_23

    .line 463
    .line 464
    if-eqz v9, :cond_23

    .line 465
    .line 466
    const/4 v1, 0x1

    .line 467
    goto :goto_8

    .line 468
    :cond_23
    move v1, v4

    .line 469
    :goto_8
    if-eqz v10, :cond_24

    .line 470
    .line 471
    if-eqz v11, :cond_24

    .line 472
    .line 473
    const/4 v2, 0x1

    .line 474
    goto :goto_9

    .line 475
    :cond_24
    move v2, v4

    .line 476
    :goto_9
    if-eqz v12, :cond_25

    .line 477
    .line 478
    if-eqz v13, :cond_25

    .line 479
    .line 480
    const/4 v3, 0x1

    .line 481
    goto :goto_a

    .line 482
    :cond_25
    move v3, v4

    .line 483
    :goto_a
    if-eqz v14, :cond_21

    .line 484
    .line 485
    if-eqz v15, :cond_21

    .line 486
    .line 487
    goto :goto_7

    .line 488
    :catchall_1
    move-exception v0

    .line 489
    const/4 v8, 0x1

    .line 490
    const/4 v9, 0x1

    .line 491
    const/4 v10, 0x1

    .line 492
    const/4 v11, 0x1

    .line 493
    const/4 v12, 0x1

    .line 494
    const/4 v13, 0x1

    .line 495
    const/4 v14, 0x1

    .line 496
    const/4 v15, 0x1

    .line 497
    :goto_b
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 498
    .line 499
    .line 500
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 509
    .line 510
    .line 511
    move-result v1

    .line 512
    const/4 v2, 0x1

    .line 513
    throw v0

    .line 514
    :cond_26
    const/4 v2, 0x1

    .line 515
    const/4 v4, 0x0

    .line 516
    move v3, v2

    .line 517
    move v5, v3

    .line 518
    move v6, v5

    .line 519
    move v1, v4

    .line 520
    :goto_c
    invoke-virtual {v0}, Ll/xlj;->n()Landroid/graphics/drawable/Drawable;

    .line 521
    .line 522
    .line 523
    move-result-object v7

    .line 524
    if-eqz v7, :cond_27

    .line 525
    .line 526
    if-lez v4, :cond_27

    .line 527
    .line 528
    new-instance v7, Ll/nj1;

    .line 529
    .line 530
    invoke-virtual {v0}, Ll/xlj;->n()Landroid/graphics/drawable/Drawable;

    .line 531
    .line 532
    .line 533
    move-result-object v8

    .line 534
    invoke-direct {v7, v8, v4}, Ll/nj1;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 535
    .line 536
    .line 537
    invoke-virtual {v0, v7}, Ll/xlj;->G(Landroid/graphics/drawable/Drawable;)Ll/xlj;

    .line 538
    .line 539
    .line 540
    :cond_27
    if-lez v1, :cond_2c

    .line 541
    .line 542
    invoke-static {v0}, Ll/ylj;->b(Ll/xlj;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 543
    .line 544
    .line 545
    move-result-object v4

    .line 546
    if-eqz v5, :cond_28

    .line 547
    .line 548
    int-to-float v5, v1

    .line 549
    goto :goto_d

    .line 550
    :cond_28
    const/4 v5, 0x0

    .line 551
    :goto_d
    if-eqz v2, :cond_29

    .line 552
    .line 553
    int-to-float v2, v1

    .line 554
    goto :goto_e

    .line 555
    :cond_29
    const/4 v2, 0x0

    .line 556
    :goto_e
    if-eqz v3, :cond_2a

    .line 557
    .line 558
    int-to-float v3, v1

    .line 559
    goto :goto_f

    .line 560
    :cond_2a
    const/4 v3, 0x0

    .line 561
    :goto_f
    if-eqz v6, :cond_2b

    .line 562
    .line 563
    int-to-float v1, v1

    .line 564
    goto :goto_10

    .line 565
    :cond_2b
    const/4 v1, 0x0

    .line 566
    :goto_10
    invoke-virtual {v4, v5, v2, v3, v1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 567
    .line 568
    .line 569
    :cond_2c
    return-object v0
.end method
