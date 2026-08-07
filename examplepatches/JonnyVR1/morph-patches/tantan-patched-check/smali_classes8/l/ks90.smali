.class public Ll/ks90;
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

.method public static synthetic a(Ll/l4g0;Ll/kcg0;Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p2}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic b(Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fake_alert_example_popup_replace_button"

    .line 2
    .line 3
    const-string v0, "p_fake_alert_example_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic c(Ll/jl80;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_fake_alert_example_popup_close_button"

    .line 2
    .line 3
    const-string v0, "p_fake_alert_example_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;Ll/x20;)V
    .locals 9

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_fake_alert_example_popup"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/kec0;->J9:I

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/adc0;->d7:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lv/VLinear;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    sget v5, Ll/kec0;->K9:I

    .line 38
    .line 39
    invoke-virtual {v4, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;

    .line 44
    .line 45
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->d:Lv/VImage;

    .line 46
    .line 47
    const-string v6, "male"

    .line 48
    .line 49
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-eqz v7, :cond_0

    .line 54
    .line 55
    sget v7, Ll/dbc0;->vm:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    sget v7, Ll/dbc0;->Bm:I

    .line 59
    .line 60
    :goto_0
    invoke-virtual {v5, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->g:Lv/VImage;

    .line 64
    .line 65
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    if-eqz v7, :cond_1

    .line 70
    .line 71
    sget v7, Ll/dbc0;->wm:I

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    sget v7, Ll/dbc0;->Cm:I

    .line 75
    .line 76
    :goto_1
    invoke-virtual {v5, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 77
    .line 78
    .line 79
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->h:Lv/VImage;

    .line 80
    .line 81
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-eqz v7, :cond_2

    .line 86
    .line 87
    sget v7, Ll/dbc0;->xm:I

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    sget v7, Ll/dbc0;->Dm:I

    .line 91
    .line 92
    :goto_2
    invoke-virtual {v5, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 93
    .line 94
    .line 95
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->e:Lv/VText;

    .line 96
    .line 97
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_3

    .line 102
    .line 103
    const-string v7, "\u8bb8\u51ef 25"

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_3
    const-string v7, "\u5b89\u742a 25"

    .line 107
    .line 108
    :goto_3
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-eqz v5, :cond_4

    .line 116
    .line 117
    sget v5, Lcom/p1/mobile/putong/core/R$string;->z4:I

    .line 118
    .line 119
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    goto :goto_4

    .line 124
    :cond_4
    sget v5, Lcom/p1/mobile/putong/core/R$string;->y4:I

    .line 125
    .line 126
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    :goto_4
    const-string v7, "<font color=\'#ff6244\'>1663</font>"

    .line 131
    .line 132
    const-string v8, "%s"

    .line 133
    .line 134
    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    iget-object v7, v4, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->f:Lv/VText;

    .line 139
    .line 140
    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 155
    .line 156
    sget v7, Ll/qa00;->f:I

    .line 157
    .line 158
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 159
    .line 160
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 161
    .line 162
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    sget v5, Ll/kec0;->K9:I

    .line 170
    .line 171
    invoke-virtual {v4, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    check-cast v3, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;

    .line 176
    .line 177
    iget-object v4, v3, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->d:Lv/VImage;

    .line 178
    .line 179
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-eqz v5, :cond_5

    .line 184
    .line 185
    sget v5, Ll/dbc0;->ym:I

    .line 186
    .line 187
    goto :goto_5

    .line 188
    :cond_5
    sget v5, Ll/dbc0;->Em:I

    .line 189
    .line 190
    :goto_5
    invoke-virtual {v4, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 191
    .line 192
    .line 193
    iget-object v4, v3, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->g:Lv/VImage;

    .line 194
    .line 195
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    if-eqz v5, :cond_6

    .line 200
    .line 201
    sget v5, Ll/dbc0;->zm:I

    .line 202
    .line 203
    goto :goto_6

    .line 204
    :cond_6
    sget v5, Ll/dbc0;->Fm:I

    .line 205
    .line 206
    :goto_6
    invoke-virtual {v4, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 207
    .line 208
    .line 209
    iget-object v4, v3, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->h:Lv/VImage;

    .line 210
    .line 211
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    if-eqz v5, :cond_7

    .line 216
    .line 217
    sget v5, Ll/dbc0;->Am:I

    .line 218
    .line 219
    goto :goto_7

    .line 220
    :cond_7
    sget v5, Ll/dbc0;->Gm:I

    .line 221
    .line 222
    :goto_7
    invoke-virtual {v4, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 223
    .line 224
    .line 225
    iget-object v4, v3, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->e:Lv/VText;

    .line 226
    .line 227
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    if-eqz v5, :cond_8

    .line 232
    .line 233
    const-string v5, "\u9ad8\u6668 22"

    .line 234
    .line 235
    goto :goto_8

    .line 236
    :cond_8
    const-string v5, "\u6234\u6668\u99a8 22"

    .line 237
    .line 238
    :goto_8
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    .line 240
    .line 241
    invoke-static {p1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-eqz p1, :cond_9

    .line 246
    .line 247
    sget p1, Lcom/p1/mobile/putong/core/R$string;->z4:I

    .line 248
    .line 249
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    goto :goto_9

    .line 254
    :cond_9
    sget p1, Lcom/p1/mobile/putong/core/R$string;->y4:I

    .line 255
    .line 256
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    :goto_9
    const-string v4, "<font color=\'#ff6244\'>1829</font>"

    .line 261
    .line 262
    invoke-virtual {p1, v8, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iget-object v4, v3, Lcom/p1/mobile/putong/core/ui/growth/fakenew/ProfileExampleItemView;->f:Lv/VText;

    .line 267
    .line 268
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 283
    .line 284
    iput v7, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 285
    .line 286
    iput v7, p1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 287
    .line 288
    invoke-virtual {v3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    .line 290
    .line 291
    new-instance p1, Ll/jl80$a;

    .line 292
    .line 293
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p1, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    const/4 v2, 0x1

    .line 301
    invoke-virtual {p1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p1, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    sget v2, Ll/adc0;->A1:I

    .line 314
    .line 315
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    new-instance v3, Ll/gs90;

    .line 320
    .line 321
    invoke-direct {v3, p1}, Ll/gs90;-><init>(Ll/jl80;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 325
    .line 326
    .line 327
    sget v2, Ll/adc0;->Y0:I

    .line 328
    .line 329
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    check-cast v1, Lv/VButton;

    .line 334
    .line 335
    new-instance v2, Ll/hs90;

    .line 336
    .line 337
    invoke-direct {v2, p2, p1}, Ll/hs90;-><init>(Ljava/lang/Runnable;Ll/jl80;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 341
    .line 342
    .line 343
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 344
    .line 345
    .line 346
    move-result-object p2

    .line 347
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/fake/b;->q()Lrx/c;

    .line 348
    .line 349
    .line 350
    move-result-object p2

    .line 351
    const/4 v1, 0x0

    .line 352
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    new-instance p2, Ll/is90;

    .line 357
    .line 358
    invoke-direct {p2, p1}, Ll/is90;-><init>(Ll/jl80;)V

    .line 359
    .line 360
    .line 361
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 362
    .line 363
    .line 364
    move-result-object p2

    .line 365
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    new-instance p2, Ll/js90;

    .line 370
    .line 371
    invoke-direct {p2, v0, p0, p3}, Ll/js90;-><init>(Ll/l4g0;Ll/kcg0;Ll/x20;)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {p1, p2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 378
    .line 379
    .line 380
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 381
    .line 382
    .line 383
    return-void
.end method
