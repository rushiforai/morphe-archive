.class public Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->Y(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/d3z;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    const/16 p1, 0x8

    .line 47
    .line 48
    if-ne p0, p1, :cond_1

    .line 49
    .line 50
    :goto_0
    return-void

    .line 51
    :cond_1
    sget-object p0, Ll/clz;->F0:Lrx/subjects/b;

    .line 52
    .line 53
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    sget p3, Ll/edc0;->A4:I

    .line 5
    .line 6
    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    check-cast p3, Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    instance-of p4, p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p4, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    check-cast p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    iget-object p4, p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 28
    .line 29
    invoke-virtual {p4}, Ll/clz;->t7()Ll/qzz;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    instance-of p4, p4, Ll/yxz;

    .line 34
    .line 35
    if-eqz p4, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p4

    .line 41
    check-cast p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 42
    .line 43
    iget-object p4, p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 44
    .line 45
    invoke-virtual {p4}, Ll/clz;->t7()Ll/qzz;

    .line 46
    .line 47
    .line 48
    move-result-object p4

    .line 49
    check-cast p4, Ll/yxz;

    .line 50
    .line 51
    iget-boolean p4, p4, Ll/yxz;->M1:Z

    .line 52
    .line 53
    if-eqz p4, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    sget v1, Ll/ibc0;->R4:I

    .line 60
    .line 61
    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    invoke-virtual {p3, p4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object p4

    .line 72
    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p4

    .line 76
    sget v1, Ll/g9c0;->a0:I

    .line 77
    .line 78
    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 79
    .line 80
    .line 81
    move-result p4

    .line 82
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p4

    .line 90
    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_1

    .line 107
    .line 108
    sget v1, Ll/g9c0;->i:I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    sget v1, Ll/g9c0;->k:I

    .line 112
    .line 113
    :goto_0
    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 121
    .line 122
    .line 123
    :cond_2
    :goto_1
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result p4

    .line 129
    const/4 v1, 0x3

    .line 130
    if-nez p4, :cond_5

    .line 131
    .line 132
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result p4

    .line 138
    if-nez p4, :cond_5

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 141
    .line 142
    .line 143
    move-result-object p4

    .line 144
    invoke-interface {p4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p4

    .line 148
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    if-eqz p4, :cond_5

    .line 155
    .line 156
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 157
    .line 158
    const-string v2, "<<<"

    .line 159
    .line 160
    invoke-virtual {p4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    const-string v4, ">>>"

    .line 165
    .line 166
    invoke-virtual {p4, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    const-string v6, ""

    .line 171
    .line 172
    if-lez v3, :cond_3

    .line 173
    .line 174
    if-lez v5, :cond_3

    .line 175
    .line 176
    invoke-virtual {p4, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    goto :goto_2

    .line 185
    :cond_3
    move-object v3, v6

    .line 186
    :goto_2
    invoke-virtual {p4, v2, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p4

    .line 190
    invoke-virtual {p4, v4, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p4

    .line 194
    filled-new-array {v3}, [Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    if-eqz v3, :cond_4

    .line 215
    .line 216
    sget v3, Ll/g9c0;->j:I

    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_4
    sget v3, Ll/g9c0;->E:I

    .line 220
    .line 221
    :goto_3
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-static {p4, v2, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 226
    .line 227
    .line 228
    move-result-object p4

    .line 229
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    new-instance p4, Ll/efq;

    .line 233
    .line 234
    invoke-direct {p4, p0}, Ll/efq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    goto :goto_5

    .line 241
    :cond_5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 242
    .line 243
    .line 244
    move-result-object p4

    .line 245
    const-string v2, "profile_cover_comment"

    .line 246
    .line 247
    invoke-static {p4, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result p4

    .line 251
    if-nez p4, :cond_7

    .line 252
    .line 253
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 254
    .line 255
    .line 256
    move-result-object p4

    .line 257
    const-string v2, "profile_cover_like"

    .line 258
    .line 259
    invoke-static {p4, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 260
    .line 261
    .line 262
    move-result p4

    .line 263
    if-nez p4, :cond_7

    .line 264
    .line 265
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 266
    .line 267
    .line 268
    move-result-object p4

    .line 269
    const-string v2, "mood_like"

    .line 270
    .line 271
    invoke-static {p4, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 272
    .line 273
    .line 274
    move-result p4

    .line 275
    if-nez p4, :cond_7

    .line 276
    .line 277
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 278
    .line 279
    .line 280
    move-result-object p4

    .line 281
    const-string v2, "mood_comment"

    .line 282
    .line 283
    invoke-static {p4, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result p4

    .line 287
    if-eqz p4, :cond_6

    .line 288
    .line 289
    goto :goto_4

    .line 290
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 291
    .line 292
    .line 293
    move-result-object p4

    .line 294
    invoke-virtual {p4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 295
    .line 296
    .line 297
    move-result-object p4

    .line 298
    invoke-interface {p4, p2}, Ll/r97;->P5(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p4

    .line 302
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 303
    .line 304
    .line 305
    goto :goto_5

    .line 306
    :cond_7
    :goto_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 307
    .line 308
    .line 309
    move-result-object p4

    .line 310
    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 311
    .line 312
    .line 313
    move-result-object p4

    .line 314
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->N4:I

    .line 315
    .line 316
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object p4

    .line 320
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 321
    .line 322
    .line 323
    :goto_5
    instance-of p4, p1, Ll/g900;

    .line 324
    .line 325
    if-eqz p4, :cond_8

    .line 326
    .line 327
    check-cast p1, Ll/g900;

    .line 328
    .line 329
    invoke-virtual {p1, p2}, Ll/g900;->V(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    if-eqz p1, :cond_b

    .line 346
    .line 347
    if-nez v0, :cond_b

    .line 348
    .line 349
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    invoke-interface {p1}, Ll/r97;->l()Z

    .line 358
    .line 359
    .line 360
    move-result p1

    .line 361
    if-eqz p1, :cond_b

    .line 362
    .line 363
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 372
    .line 373
    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result p1

    .line 377
    if-eqz p1, :cond_b

    .line 378
    .line 379
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 380
    .line 381
    const-string p4, "text"

    .line 382
    .line 383
    invoke-static {p1, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 384
    .line 385
    .line 386
    move-result p1

    .line 387
    if-eqz p1, :cond_b

    .line 388
    .line 389
    new-instance p1, Ljava/lang/StringBuilder;

    .line 390
    .line 391
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 392
    .line 393
    .line 394
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 395
    .line 396
    .line 397
    move-result-object p4

    .line 398
    invoke-virtual {p4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 399
    .line 400
    .line 401
    move-result-object p4

    .line 402
    invoke-interface {p4, p2}, Ll/r97;->P5(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object p4

    .line 406
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    const-string p4, " "

    .line 410
    .line 411
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->R4:I

    .line 419
    .line 420
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->R4:I

    .line 436
    .line 437
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 446
    .line 447
    .line 448
    move-result-object v2

    .line 449
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 450
    .line 451
    .line 452
    move-result-object v2

    .line 453
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 454
    .line 455
    .line 456
    move-result v2

    .line 457
    if-eqz v2, :cond_9

    .line 458
    .line 459
    sget v2, Ll/g9c0;->j:I

    .line 460
    .line 461
    goto :goto_6

    .line 462
    :cond_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 463
    .line 464
    .line 465
    move-result-object v2

    .line 466
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    invoke-interface {v2}, Ll/r97;->G1()Z

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    if-eqz v2, :cond_a

    .line 475
    .line 476
    sget v2, Ll/g9c0;->E:I

    .line 477
    .line 478
    goto :goto_6

    .line 479
    :cond_a
    const-string v2, "#006DF7"

    .line 480
    .line 481
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 482
    .line 483
    .line 484
    move-result v2

    .line 485
    :goto_6
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 486
    .line 487
    .line 488
    move-result-object v1

    .line 489
    invoke-static {p1, v0, v2, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 490
    .line 491
    .line 492
    move-result-object p1

    .line 493
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;

    .line 494
    .line 495
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 496
    .line 497
    .line 498
    new-instance v1, Ljava/lang/StringBuilder;

    .line 499
    .line 500
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 501
    .line 502
    .line 503
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    invoke-interface {v2, p2}, Ll/r97;->P5(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p2

    .line 515
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 522
    .line 523
    .line 524
    move-result-object p2

    .line 525
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->R4:I

    .line 526
    .line 527
    invoke-virtual {p2, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object p2

    .line 531
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    .line 533
    .line 534
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object p2

    .line 538
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRecalled;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 539
    .line 540
    .line 541
    move-result-object p0

    .line 542
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->R4:I

    .line 543
    .line 544
    invoke-virtual {p0, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object p0

    .line 548
    invoke-virtual {p2, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 549
    .line 550
    .line 551
    move-result p0

    .line 552
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 553
    .line 554
    .line 555
    move-result p2

    .line 556
    const/16 p4, 0x21

    .line 557
    .line 558
    invoke-virtual {p1, v0, p0, p2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 559
    .line 560
    .line 561
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 562
    .line 563
    .line 564
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 565
    .line 566
    .line 567
    move-result-object p0

    .line 568
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 569
    .line 570
    .line 571
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 572
    .line 573
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 574
    .line 575
    .line 576
    move-result-object p0

    .line 577
    sget p1, Ll/g9c0;->Y:I

    .line 578
    .line 579
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 580
    .line 581
    .line 582
    move-result p0

    .line 583
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 584
    .line 585
    .line 586
    :cond_b
    return-void
.end method

.method public j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
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
