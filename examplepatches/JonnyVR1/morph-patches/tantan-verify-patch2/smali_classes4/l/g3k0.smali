.class public Ll/g3k0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public final f:Landroid/content/Context;

.field public final g:I

.field public h:Ll/x20;

.field public i:Ll/l4g0;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/g3k0;->f:Landroid/content/Context;

    .line 7
    .line 8
    iput p2, p0, Ll/g3k0;->g:I

    .line 9
    .line 10
    invoke-direct {p0}, Ll/g3k0;->E()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-class v0, Ll/g3k0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/g3k0;->i:Ll/l4g0;

    .line 25
    .line 26
    const-string v0, "photo_sample_type"

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ll/g3k0;->G(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    filled-new-array {p2}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p1, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private A()V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget v1, Ll/adc0;->je:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lv/VText;

    .line 10
    .line 11
    sget v2, Ll/adc0;->Yc:I

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VText;

    .line 18
    .line 19
    sget v3, Ll/adc0;->A9:I

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 26
    .line 27
    sget v4, Ll/adc0;->B9:I

    .line 28
    .line 29
    invoke-virtual {v0, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 34
    .line 35
    sget v5, Ll/adc0;->C9:I

    .line 36
    .line 37
    invoke-virtual {v0, v5}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    check-cast v5, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 42
    .line 43
    sget v6, Ll/adc0;->Z9:I

    .line 44
    .line 45
    invoke-virtual {v0, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    check-cast v6, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 50
    .line 51
    sget v7, Ll/adc0;->J3:I

    .line 52
    .line 53
    invoke-virtual {v0, v7}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    check-cast v7, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 58
    .line 59
    sget v8, Ll/adc0;->K3:I

    .line 60
    .line 61
    invoke-virtual {v0, v8}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    check-cast v8, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 66
    .line 67
    sget v9, Ll/adc0;->L3:I

    .line 68
    .line 69
    invoke-virtual {v0, v9}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    check-cast v9, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 74
    .line 75
    sget v10, Ll/adc0;->M3:I

    .line 76
    .line 77
    invoke-virtual {v0, v10}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v10

    .line 81
    check-cast v10, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 82
    .line 83
    sget v11, Ll/adc0;->M1:I

    .line 84
    .line 85
    invoke-virtual {v0, v11}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v11

    .line 89
    check-cast v11, Landroid/widget/TextView;

    .line 90
    .line 91
    if-eqz v1, :cond_f

    .line 92
    .line 93
    if-eqz v2, :cond_f

    .line 94
    .line 95
    if-eqz v3, :cond_f

    .line 96
    .line 97
    if-eqz v4, :cond_f

    .line 98
    .line 99
    if-eqz v5, :cond_f

    .line 100
    .line 101
    if-eqz v6, :cond_f

    .line 102
    .line 103
    if-eqz v7, :cond_f

    .line 104
    .line 105
    if-eqz v8, :cond_f

    .line 106
    .line 107
    if-eqz v9, :cond_f

    .line 108
    .line 109
    if-eqz v10, :cond_f

    .line 110
    .line 111
    if-nez v11, :cond_0

    .line 112
    .line 113
    goto/16 :goto_e

    .line 114
    .line 115
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    invoke-interface {v12}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    .line 122
    move-result-object v12

    .line 123
    if-nez v12, :cond_1

    .line 124
    .line 125
    goto/16 :goto_e

    .line 126
    .line 127
    :cond_1
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 128
    .line 129
    .line 130
    move-result v12

    .line 131
    iget v13, v0, Ll/g3k0;->g:I

    .line 132
    .line 133
    const-string v14, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikc2NElHWkNYM0RJVE9MM04yWkRXUVY0VlZCSDZRSzE0IiwidyI6MjM1LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTg2MzEyOTI5ODA1NzQ4NzM5N30.png"

    .line 134
    .line 135
    const-string v15, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdEU0RJREJNQ1U1RURISUJEQTNINUpQNEpNRkI2QzE0IiwidyI6MjM1LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzIxMjk5MTEzNzUxMTExMTQ0fQ.png"

    .line 136
    .line 137
    move/from16 v16, v12

    .line 138
    .line 139
    const-string v12, "\u7f51\u56fe"

    .line 140
    .line 141
    const-string v17, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJMUlhNNUhVV0NYTVlMTUtQUDZFN0M1RjJVWDNLSTE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2Nzg0NTUzNjk0Mjg3NDk4ODg4fQ.png"

    .line 142
    .line 143
    const-string v18, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZQNklZRUFMUUVES0ZUTVAyVDZYVFlQRzM2RDVPSjE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTQ2NjYwMzc3NjM5Mzk5NjMzMX0.png"

    .line 144
    .line 145
    move/from16 v19, v13

    .line 146
    .line 147
    const-string v13, "\u7167\u7247\u6a21\u7cca"

    .line 148
    .line 149
    const-string v20, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFaM1pJMkI0QUxSMlVEMkZGS0FFNDdGU0JIMlNLVjE0IiwidyI6NDIzLCJoIjo1MjIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3OTQ1NTk2MjM1OTY0NzA5MjI4fQ.png"

    .line 150
    .line 151
    const-string v21, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik1JWkUzSVRRVlE2VUtPSDJSTUpYV05WTDVXVFRIVzE0IiwidyI6NDIzLCJoIjo1MjIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTc2NzI0MzE4NDEwNDA0MzU5Nn0.png"

    .line 152
    .line 153
    move-object/from16 v22, v14

    .line 154
    .line 155
    const-string v14, "\u5168\u8eab\u7167"

    .line 156
    .line 157
    const-string v23, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFLTFlQNUFSUEE2VU9YQlVMMllYR1FGRU5SWklJTDE0IiwidyI6NDIzLCJoIjo1MjIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTIyMzM1NzE3OTQ2Mjk4ODQ4NX0.png"

    .line 158
    .line 159
    const-string v24, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpFSUFEWFdPWjJLTEwyWVNaNk8zREhGRFVPVVRNNTE0IiwidyI6NDIzLCJoIjo1MjIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NDcyMDAxODEwNzg2OTAwOTE2fQ.png"

    .line 160
    .line 161
    move-object/from16 v25, v15

    .line 162
    .line 163
    const-string v15, "\u6237\u5916\u7167"

    .line 164
    .line 165
    move-object/from16 v26, v11

    .line 166
    .line 167
    if-nez v19, :cond_7

    .line 168
    .line 169
    if-eqz v16, :cond_2

    .line 170
    .line 171
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJMRkRXR0o2N0gzUks3REczS0JDTExUV0UzUkFEMjE0IiwidyI6MjgwLCJoIjozMjEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzM5OTkxOTIwNjgyMDQ4OTMzfQ.png"

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_2
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNWRjNDU1JIRkJPUDVFQUJSNTNYSFE1QlNQWVRGTzE0IiwidyI6MjgwLCJoIjozMjEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTk0MjI5Mzc1MjAwNzgyODU4fQ.png"

    .line 175
    .line 176
    :goto_0
    const-string v2, "\u6b63\u9762\u7167"

    .line 177
    .line 178
    const/4 v11, 0x1

    .line 179
    invoke-virtual {v3, v11, v2, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    if-eqz v16, :cond_3

    .line 183
    .line 184
    move-object/from16 v1, v24

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_3
    move-object/from16 v1, v23

    .line 188
    .line 189
    :goto_1
    invoke-virtual {v4, v11, v15, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    if-eqz v16, :cond_4

    .line 193
    .line 194
    move-object/from16 v1, v21

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_4
    move-object/from16 v1, v20

    .line 198
    .line 199
    :goto_2
    invoke-virtual {v5, v11, v14, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    const/4 v11, 0x0

    .line 203
    invoke-static {v6, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 204
    .line 205
    .line 206
    if-eqz v16, :cond_5

    .line 207
    .line 208
    move-object/from16 v1, v18

    .line 209
    .line 210
    :goto_3
    const/4 v2, 0x3

    .line 211
    goto :goto_4

    .line 212
    :cond_5
    move-object/from16 v1, v17

    .line 213
    .line 214
    goto :goto_3

    .line 215
    :goto_4
    invoke-virtual {v7, v2, v13, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    if-eqz v16, :cond_6

    .line 219
    .line 220
    move-object/from16 v14, v25

    .line 221
    .line 222
    goto :goto_5

    .line 223
    :cond_6
    move-object/from16 v14, v22

    .line 224
    .line 225
    :goto_5
    invoke-virtual {v8, v2, v12, v14}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-static {v9, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 229
    .line 230
    .line 231
    invoke-static {v10, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 232
    .line 233
    .line 234
    goto/16 :goto_d

    .line 235
    .line 236
    :cond_7
    const/4 v11, 0x0

    .line 237
    invoke-static {v3, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    invoke-static {v4, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    invoke-static {v5, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 244
    .line 245
    .line 246
    const/4 v11, 0x1

    .line 247
    invoke-static {v6, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    const/4 v3, 0x2

    .line 251
    invoke-virtual {v6, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 252
    .line 253
    .line 254
    const-string v4, "\u53ea\u6709\u4e0a\u4f20\u7b26\u5408\u8981\u6c42\u7684\u7167\u7247\uff0c\u624d\u53ef\u9886\u53d6\u5956\u52b1"

    .line 255
    .line 256
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    .line 258
    .line 259
    iget v2, v0, Ll/g3k0;->g:I

    .line 260
    .line 261
    if-ne v2, v3, :cond_9

    .line 262
    .line 263
    if-eqz v16, :cond_8

    .line 264
    .line 265
    move-object/from16 v2, v21

    .line 266
    .line 267
    goto :goto_6

    .line 268
    :cond_8
    move-object/from16 v2, v20

    .line 269
    .line 270
    :goto_6
    const-string v3, "\u5168\u8eab\u7167\u793a\u4f8b"

    .line 271
    .line 272
    invoke-virtual {v6, v11, v3, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    goto :goto_8

    .line 276
    :cond_9
    if-ne v2, v11, :cond_b

    .line 277
    .line 278
    if-eqz v16, :cond_a

    .line 279
    .line 280
    move-object/from16 v2, v24

    .line 281
    .line 282
    goto :goto_7

    .line 283
    :cond_a
    move-object/from16 v2, v23

    .line 284
    .line 285
    :goto_7
    const-string v3, "\u6237\u5916\u7167\u793a\u4f8b"

    .line 286
    .line 287
    invoke-virtual {v6, v11, v3, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    move-object v14, v15

    .line 291
    goto :goto_8

    .line 292
    :cond_b
    const-string v14, ""

    .line 293
    .line 294
    :goto_8
    const-string v2, "\u4e0a\u4f20\u672c\u4eba\u4e94\u5b98\u6e05\u6670\u7684"

    .line 295
    .line 296
    invoke-virtual {v2, v14}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 301
    .line 302
    invoke-direct {v3, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 303
    .line 304
    .line 305
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    .line 306
    .line 307
    const-string v5, "#fe7e1d"

    .line 308
    .line 309
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result v5

    .line 313
    invoke-direct {v4, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 317
    .line 318
    .line 319
    move-result v5

    .line 320
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    const/16 v6, 0x21

    .line 325
    .line 326
    invoke-virtual {v3, v4, v5, v2, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    .line 331
    .line 332
    const/4 v11, 0x0

    .line 333
    invoke-virtual {v7, v11}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v8, v11}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v9, v11}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v10, v11}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 343
    .line 344
    .line 345
    if-eqz v16, :cond_c

    .line 346
    .line 347
    move-object/from16 v1, v18

    .line 348
    .line 349
    :goto_9
    const/4 v2, 0x3

    .line 350
    goto :goto_a

    .line 351
    :cond_c
    move-object/from16 v1, v17

    .line 352
    .line 353
    goto :goto_9

    .line 354
    :goto_a
    invoke-virtual {v7, v2, v13, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    if-eqz v16, :cond_d

    .line 358
    .line 359
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVRUDZZNVJJR1FLT0wyT0NPR1ZaSTZWQzdNR01JRzE0IiwidyI6MjM1LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NDQ1NDk3NDU0NjQxMDkwODI5fQ.png"

    .line 360
    .line 361
    goto :goto_b

    .line 362
    :cond_d
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVUWVZTQlpHMk9BT0lFQkZDT0VMUzVFTUtBRkRaRDE0IiwidyI6MjM1LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3Mzk3NzcwMzMzMDgxNzM1OTkwfQ.png"

    .line 363
    .line 364
    :goto_b
    const-string v3, "\u906e\u6321\u4e94\u5b98"

    .line 365
    .line 366
    invoke-virtual {v8, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    if-eqz v16, :cond_e

    .line 370
    .line 371
    move-object/from16 v14, v25

    .line 372
    .line 373
    goto :goto_c

    .line 374
    :cond_e
    move-object/from16 v14, v22

    .line 375
    .line 376
    :goto_c
    invoke-virtual {v9, v2, v12, v14}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    const-string v1, "\u65e0\u4eba"

    .line 380
    .line 381
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFPSTdQTEdTSkRSQkJUNFVVSlFQT05IUDRUUDNLWjE0IiwidyI6MjM1LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxODE2MzgxMjc2NjUxMDcxMDg3fQ.png"

    .line 382
    .line 383
    invoke-virtual {v10, v2, v1, v3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    :goto_d
    new-instance v1, Ll/f3k0;

    .line 387
    .line 388
    invoke-direct {v1, v0}, Ll/f3k0;-><init>(Ll/g3k0;)V

    .line 389
    .line 390
    .line 391
    move-object/from16 v11, v26

    .line 392
    .line 393
    invoke-static {v11, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 394
    .line 395
    .line 396
    :cond_f
    :goto_e
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/g3k0;->h:Ll/x20;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const-string p1, "e_open_album"

    .line 9
    .line 10
    invoke-direct {p0}, Ll/g3k0;->E()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic D(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g3k0;->i:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private E()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_upload_photo_sample"

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Ll/g3k0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g3k0;->D(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/g3k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g3k0;->C(Landroid/view/View;)V

    return-void
.end method

.method private z()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, -0x1

    .line 16
    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setLayout(II)V

    .line 17
    .line 18
    .line 19
    const v1, 0x1020002

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Ll/adc0;->q2:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/FrameLayout;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v2, 0x3

    .line 39
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 40
    .line 41
    .line 42
    sget v2, Ll/dbc0;->v5:I

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/g3k0$a;

    .line 48
    .line 49
    invoke-direct {v0, p0, v1}, Ll/g3k0$a;-><init>(Ll/g3k0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method


# virtual methods
.method public F(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g3k0;->h:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final G(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "full_photo"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "outdoor_photo"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    const-string p0, "other_photo"

    .line 19
    .line 20
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/g3k0;->f:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/kec0;->Qc:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Ll/g3k0;->z()V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Ll/g3k0;->A()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public show()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g3k0;->i:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/e3k0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/e3k0;-><init>(Ll/g3k0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
