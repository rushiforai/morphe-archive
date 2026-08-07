.class public Ll/pd5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grl;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VIcon;

.field public e:Lv/VText;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public final g:I

.field public h:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput p2, p0, Ll/pd5;->g:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/rec0;->A2:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/pd5;->e(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/pd5;->a:Lv/VText;

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {p2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/pd5;->e:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pd5;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd5;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qd5;->a(Ll/pd5;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    const/high16 p0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 14
    .line 15
    .line 16
    int-to-float p0, p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final g()V
    .locals 10

    .line 1
    iget v0, p0, Ll/pd5;->g:I

    .line 2
    .line 3
    if-eqz v0, :cond_14

    .line 4
    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    if-eq v0, v1, :cond_14

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-eq v0, v1, :cond_14

    .line 12
    .line 13
    const/16 v1, 0x9

    .line 14
    .line 15
    if-eq v0, v1, :cond_14

    .line 16
    .line 17
    const/16 v1, 0x11

    .line 18
    .line 19
    if-eq v0, v1, :cond_14

    .line 20
    .line 21
    const/16 v1, 0x20

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    goto/16 :goto_8

    .line 26
    .line 27
    :cond_0
    const/4 v1, 0x1

    .line 28
    if-eq v0, v1, :cond_11

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    const-string v2, "#2bccff"

    .line 32
    .line 33
    const-string v3, "#142bccff"

    .line 34
    .line 35
    if-eq v0, v1, :cond_10

    .line 36
    .line 37
    const/4 v1, 0x3

    .line 38
    const-string v4, "#ff7beb"

    .line 39
    .line 40
    const-string v5, "#f9f1ff"

    .line 41
    .line 42
    if-eq v0, v1, :cond_b

    .line 43
    .line 44
    const/4 v1, 0x6

    .line 45
    if-eq v0, v1, :cond_9

    .line 46
    .line 47
    const/4 v1, 0x7

    .line 48
    if-eq v0, v1, :cond_8

    .line 49
    .line 50
    const/16 v1, 0x16

    .line 51
    .line 52
    if-eq v0, v1, :cond_7

    .line 53
    .line 54
    const/16 v1, 0x1f

    .line 55
    .line 56
    const-string v6, "#FF6DF0"

    .line 57
    .line 58
    const-string v7, "#FFEEFD"

    .line 59
    .line 60
    const-string v8, "\u62a2\u5148\u544a\u767d %s\u63a2\u63a2\u5e01/\u6b21"

    .line 61
    .line 62
    if-eq v0, v1, :cond_2

    .line 63
    .line 64
    const/16 v1, 0x21

    .line 65
    .line 66
    if-eq v0, v1, :cond_1

    .line 67
    .line 68
    packed-switch v0, :pswitch_data_0

    .line 69
    .line 70
    .line 71
    packed-switch v0, :pswitch_data_1

    .line 72
    .line 73
    .line 74
    const-string v0, "Unexpected value: "

    .line 75
    .line 76
    iget p0, p0, Ll/pd5;->g:I

    .line 77
    .line 78
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :pswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/lqb;->A4()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-string v1, "\u4e00\u952e\u914d\u5bf9 \u9650\u65f6%s\u63a2\u63a2\u5e01/\u6b21"

    .line 99
    .line 100
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v1, "#15FFA378"

    .line 105
    .line 106
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    const-string v2, "#FAA780"

    .line 111
    .line 112
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    sget v3, Ll/jbc0;->Y9:I

    .line 117
    .line 118
    goto/16 :goto_7

    .line 119
    .line 120
    :pswitch_1
    iget-object v0, p0, Ll/pd5;->a:Lv/VText;

    .line 121
    .line 122
    const-string v1, "\u8d85\u7ea7\u559c\u6b22\u53e0\u52a0\u5305"

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    goto/16 :goto_5

    .line 128
    .line 129
    :pswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/lqb;->d5()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "\u8d44\u6599\u7559\u8a00 %s\u63a2\u63a2\u5e01/\u6b21"

    .line 146
    .line 147
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v1, "#19ff6298"

    .line 152
    .line 153
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    const-string v2, "#ff80b8"

    .line 158
    .line 159
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->bc()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    goto/16 :goto_7

    .line 176
    .line 177
    :pswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 180
    .line 181
    invoke-virtual {v0}, Ll/lqb;->h5()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    const-string v1, "\u95ea\u804a\u52a0\u901f\u5361\uff1a%s \u63a2\u63a2\u5e01/\u6b21"

    .line 194
    .line 195
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    const-string v1, "#eeffe4"

    .line 200
    .line 201
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    const-string v2, "#43c21f"

    .line 206
    .line 207
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    sget v3, Ll/jbc0;->ba:I

    .line 212
    .line 213
    goto/16 :goto_7

    .line 214
    .line 215
    :pswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 216
    .line 217
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/lqb;->l4()I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const-string v1, "\u8bed\u97f3\u95ea\u804a\uff1a%s \u63a2\u63a2\u5e01/\u6b21"

    .line 232
    .line 233
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    sget v3, Ll/jbc0;->aa:I

    .line 246
    .line 247
    goto/16 :goto_7

    .line 248
    .line 249
    :pswitch_5
    iget-object v0, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 250
    .line 251
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->D8:I

    .line 252
    .line 253
    new-instance v2, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    iget v3, p0, Ll/pd5;->h:I

    .line 259
    .line 260
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v3, " "

    .line 264
    .line 265
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    const-string v1, "#142b7aff"

    .line 281
    .line 282
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    const-string v2, "#2b7aff"

    .line 287
    .line 288
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    sget v3, Ll/jbc0;->i3:I

    .line 293
    .line 294
    goto/16 :goto_7

    .line 295
    .line 296
    :pswitch_6
    iget v0, p0, Ll/pd5;->h:I

    .line 297
    .line 298
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    const-string v1, "\u6bcf\u65e5\u5fc3\u52a8 %s\u63a2\u63a2\u5e01/\u6b21"

    .line 307
    .line 308
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    const-string v1, "#14e7b853"

    .line 313
    .line 314
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    const-string v2, "#ebb958"

    .line 319
    .line 320
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    sget v3, Ll/jbc0;->d9:I

    .line 325
    .line 326
    goto/16 :goto_7

    .line 327
    .line 328
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 329
    .line 330
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 331
    .line 332
    invoke-virtual {v0}, Ll/lqb;->b5()I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    invoke-static {v8, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    sget v3, Ll/jbc0;->L8:I

    .line 357
    .line 358
    goto/16 :goto_7

    .line 359
    .line 360
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 361
    .line 362
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-eqz v0, :cond_3

    .line 371
    .line 372
    goto :goto_0

    .line 373
    :cond_3
    const-string v8, "\u6253\u62db\u547c %s\u63a2\u63a2\u5e01/\u6b21"

    .line 374
    .line 375
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 376
    .line 377
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 378
    .line 379
    invoke-virtual {v0}, Ll/lqb;->t5()I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-static {v8, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 396
    .line 397
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    if-eqz v1, :cond_4

    .line 406
    .line 407
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 408
    .line 409
    .line 410
    move-result v1

    .line 411
    goto :goto_1

    .line 412
    :cond_4
    const-string v1, "#15FFD359"

    .line 413
    .line 414
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 419
    .line 420
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 421
    .line 422
    .line 423
    move-result-object v2

    .line 424
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 425
    .line 426
    .line 427
    move-result v2

    .line 428
    if-eqz v2, :cond_5

    .line 429
    .line 430
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    goto :goto_2

    .line 435
    :cond_5
    const-string v2, "#F6C53E"

    .line 436
    .line 437
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    :goto_2
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 442
    .line 443
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 444
    .line 445
    .line 446
    move-result-object v3

    .line 447
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 448
    .line 449
    .line 450
    move-result v3

    .line 451
    if-eqz v3, :cond_6

    .line 452
    .line 453
    sget v3, Ll/jbc0;->L8:I

    .line 454
    .line 455
    goto/16 :goto_7

    .line 456
    .line 457
    :cond_6
    sget v3, Ll/jbc0;->K8:I

    .line 458
    .line 459
    goto/16 :goto_7

    .line 460
    .line 461
    :cond_7
    iget-object v0, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 462
    .line 463
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->N3:I

    .line 464
    .line 465
    invoke-static {}, Ll/m27;->E3()I

    .line 466
    .line 467
    .line 468
    move-result v2

    .line 469
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v2

    .line 473
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object v2

    .line 477
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    const-string v1, "#fff6ef"

    .line 482
    .line 483
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 484
    .line 485
    .line 486
    move-result v1

    .line 487
    const-string v2, "#f78c41"

    .line 488
    .line 489
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 490
    .line 491
    .line 492
    move-result v2

    .line 493
    sget v3, Ll/jbc0;->k8:I

    .line 494
    .line 495
    goto/16 :goto_7

    .line 496
    .line 497
    :cond_8
    iget-object v0, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 498
    .line 499
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->x8:I

    .line 500
    .line 501
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 502
    .line 503
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 504
    .line 505
    invoke-virtual {v2}, Ll/lqb;->y4()I

    .line 506
    .line 507
    .line 508
    move-result v2

    .line 509
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v2

    .line 513
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    move-result-object v2

    .line 517
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    const-string v1, "#145adf9f"

    .line 522
    .line 523
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    const-string v2, "#5adf9f"

    .line 528
    .line 529
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 530
    .line 531
    .line 532
    move-result v2

    .line 533
    sget v3, Ll/jbc0;->jc:I

    .line 534
    .line 535
    goto/16 :goto_7

    .line 536
    .line 537
    :cond_9
    sget v0, Ll/jbc0;->Z9:I

    .line 538
    .line 539
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B()Z

    .line 548
    .line 549
    .line 550
    move-result v1

    .line 551
    iget-object v4, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 552
    .line 553
    if-eqz v1, :cond_a

    .line 554
    .line 555
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->M2:I

    .line 556
    .line 557
    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v0

    .line 561
    sget v1, Ll/jbc0;->e8:I

    .line 562
    .line 563
    goto :goto_3

    .line 564
    :cond_a
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->P7:I

    .line 565
    .line 566
    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    move-object v9, v1

    .line 571
    move v1, v0

    .line 572
    move-object v0, v9

    .line 573
    :goto_3
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 574
    .line 575
    .line 576
    move-result v3

    .line 577
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 578
    .line 579
    .line 580
    move-result v2

    .line 581
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 582
    .line 583
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 584
    .line 585
    invoke-virtual {v4}, Ll/lqb;->X4()I

    .line 586
    .line 587
    .line 588
    move-result v4

    .line 589
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 590
    .line 591
    .line 592
    move-result-object v4

    .line 593
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 594
    .line 595
    .line 596
    move-result-object v4

    .line 597
    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    move v9, v3

    .line 602
    move v3, v1

    .line 603
    move v1, v9

    .line 604
    goto/16 :goto_7

    .line 605
    .line 606
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 611
    .line 612
    .line 613
    move-result-object v0

    .line 614
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Op()Z

    .line 615
    .line 616
    .line 617
    move-result v0

    .line 618
    if-eqz v0, :cond_c

    .line 619
    .line 620
    new-instance v0, Ljava/lang/StringBuilder;

    .line 621
    .line 622
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 623
    .line 624
    .line 625
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 626
    .line 627
    .line 628
    move-result-object v1

    .line 629
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 630
    .line 631
    .line 632
    move-result-object v1

    .line 633
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->al()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object v1

    .line 637
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    const-string v1, "\uff1a%s \u63a2\u63a2\u5e01/\u6b21"

    .line 641
    .line 642
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    .line 644
    .line 645
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v0

    .line 649
    goto :goto_4

    .line 650
    :cond_c
    iget-object v0, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 651
    .line 652
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Q7:I

    .line 653
    .line 654
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v0

    .line 658
    :goto_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 659
    .line 660
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 661
    .line 662
    invoke-virtual {v1}, Ll/lqb;->f5()I

    .line 663
    .line 664
    .line 665
    move-result v1

    .line 666
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v1

    .line 670
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 671
    .line 672
    .line 673
    move-result-object v1

    .line 674
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 679
    .line 680
    .line 681
    move-result-object v1

    .line 682
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 683
    .line 684
    .line 685
    move-result-object v1

    .line 686
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Op()Z

    .line 687
    .line 688
    .line 689
    move-result v1

    .line 690
    if-eqz v1, :cond_d

    .line 691
    .line 692
    const-string v5, "#14fcbc87"

    .line 693
    .line 694
    :cond_d
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 695
    .line 696
    .line 697
    move-result v1

    .line 698
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 699
    .line 700
    .line 701
    move-result-object v2

    .line 702
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 703
    .line 704
    .line 705
    move-result-object v2

    .line 706
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Op()Z

    .line 707
    .line 708
    .line 709
    move-result v2

    .line 710
    if-eqz v2, :cond_e

    .line 711
    .line 712
    const-string v4, "#ff9f65"

    .line 713
    .line 714
    :cond_e
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 715
    .line 716
    .line 717
    move-result v2

    .line 718
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 719
    .line 720
    .line 721
    move-result-object v3

    .line 722
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 723
    .line 724
    .line 725
    move-result-object v3

    .line 726
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Op()Z

    .line 727
    .line 728
    .line 729
    move-result v3

    .line 730
    if-eqz v3, :cond_f

    .line 731
    .line 732
    sget v3, Ll/jbc0;->s0:I

    .line 733
    .line 734
    goto :goto_7

    .line 735
    :cond_f
    sget v3, Ll/jbc0;->aa:I

    .line 736
    .line 737
    goto :goto_7

    .line 738
    :cond_10
    :goto_5
    iget-object v0, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 739
    .line 740
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->R7:I

    .line 741
    .line 742
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 743
    .line 744
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 745
    .line 746
    invoke-virtual {v4}, Ll/lqb;->z5()I

    .line 747
    .line 748
    .line 749
    move-result v4

    .line 750
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 751
    .line 752
    .line 753
    move-result-object v4

    .line 754
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 755
    .line 756
    .line 757
    move-result-object v4

    .line 758
    invoke-virtual {v0, v1, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 759
    .line 760
    .line 761
    move-result-object v0

    .line 762
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 763
    .line 764
    .line 765
    move-result v1

    .line 766
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 767
    .line 768
    .line 769
    move-result v2

    .line 770
    sget v3, Ll/jbc0;->ca:I

    .line 771
    .line 772
    goto :goto_7

    .line 773
    :cond_11
    :pswitch_7
    iget-object v1, p0, Ll/pd5;->f:Lcom/p1/mobile/android/app/Act;

    .line 774
    .line 775
    const/16 v2, 0xe

    .line 776
    .line 777
    if-ne v0, v2, :cond_12

    .line 778
    .line 779
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->O7:I

    .line 780
    .line 781
    invoke-static {}, Ll/m27;->B3()I

    .line 782
    .line 783
    .line 784
    move-result v2

    .line 785
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 786
    .line 787
    .line 788
    move-result-object v2

    .line 789
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 790
    .line 791
    .line 792
    move-result-object v2

    .line 793
    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v0

    .line 797
    goto :goto_6

    .line 798
    :cond_12
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->O7:I

    .line 799
    .line 800
    invoke-static {}, Ll/m27;->z3()I

    .line 801
    .line 802
    .line 803
    move-result v2

    .line 804
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 805
    .line 806
    .line 807
    move-result-object v2

    .line 808
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 809
    .line 810
    .line 811
    move-result-object v2

    .line 812
    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 813
    .line 814
    .line 815
    move-result-object v0

    .line 816
    :goto_6
    const-string v1, "#14ff4798"

    .line 817
    .line 818
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 819
    .line 820
    .line 821
    move-result v1

    .line 822
    const-string v2, "#ff6298"

    .line 823
    .line 824
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 825
    .line 826
    .line 827
    move-result v2

    .line 828
    sget v3, Ll/jbc0;->X9:I

    .line 829
    .line 830
    :goto_7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 831
    .line 832
    .line 833
    move-result v4

    .line 834
    if-nez v4, :cond_13

    .line 835
    .line 836
    iget-object v4, p0, Ll/pd5;->d:Lv/VIcon;

    .line 837
    .line 838
    invoke-virtual {v4, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 839
    .line 840
    .line 841
    iget-object v3, p0, Ll/pd5;->e:Lv/VText;

    .line 842
    .line 843
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 844
    .line 845
    .line 846
    iget-object v2, p0, Ll/pd5;->e:Lv/VText;

    .line 847
    .line 848
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 849
    .line 850
    .line 851
    iget-object v0, p0, Ll/pd5;->c:Landroid/widget/LinearLayout;

    .line 852
    .line 853
    invoke-virtual {p0, v1}, Ll/pd5;->f(I)Landroid/graphics/drawable/Drawable;

    .line 854
    .line 855
    .line 856
    move-result-object p0

    .line 857
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 858
    .line 859
    .line 860
    return-void

    .line 861
    :cond_13
    const-string p0, "You should define coin purchase dialog desc style."

    .line 862
    .line 863
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 864
    .line 865
    .line 866
    return-void

    .line 867
    :cond_14
    :goto_8
    iget-object p0, p0, Ll/pd5;->c:Landroid/widget/LinearLayout;

    .line 868
    .line 869
    const/4 v0, 0x0

    .line 870
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 871
    .line 872
    .line 873
    return-void

    .line 874
    nop

    .line 875
    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_7
        :pswitch_3
    .end packed-switch

    .line 876
    .line 877
    .line 878
    .line 879
    .line 880
    .line 881
    .line 882
    .line 883
    .line 884
    .line 885
    .line 886
    .line 887
    .line 888
    .line 889
    :pswitch_data_1
    .packed-switch 0x18
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public h(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pd5;->h:I

    .line 2
    .line 3
    return-void
.end method
