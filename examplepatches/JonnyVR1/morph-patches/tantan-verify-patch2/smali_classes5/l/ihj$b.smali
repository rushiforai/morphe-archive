.class public Ll/ihj$b;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ihj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final e:Lcom/p1/mobile/android/app/Act;

.field public final f:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final g:Ljava/lang/String;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ihj$b;->h:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    iput-object p3, p0, Ll/ihj$b;->g:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean p4, p0, Ll/ihj$b;->i:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s(Landroid/view/View;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/hge0;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Landroid/view/View;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/hge0;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihj$b;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ihj$b;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v3, v0

    .line 8
    check-cast v3, Ll/a690;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    iget-object v0, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 39
    .line 40
    if-ne v0, v4, :cond_1

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v1}, Ll/r97;->I0()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_0

    .line 75
    .line 76
    iget-object p2, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    sget v0, Ll/rec0;->Z1:I

    .line 83
    .line 84
    invoke-virtual {p2, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    move-object v0, p2

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SeeLetterBlockPage;

    .line 90
    .line 91
    iget-object p0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    invoke-virtual {v0, p0, v3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SeeLetterBlockPage;->c(Lcom/p1/mobile/android/app/Act;Ll/a690;)V

    .line 94
    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :cond_0
    iget-object v0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    sget v1, Ll/rec0;->Q2:I

    .line 105
    .line 106
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    move-object v1, v0

    .line 111
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;

    .line 112
    .line 113
    iget-object v2, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    iget-boolean v4, p0, Ll/ihj$b;->i:Z

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/ihj$b;->getCount()I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    move v6, p2

    .line 122
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d(Lcom/p1/mobile/android/app/Act;Ll/a690;ZII)V

    .line 123
    .line 124
    .line 125
    move-object p2, v0

    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :cond_1
    invoke-virtual {v3}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_chat_request_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 133
    .line 134
    if-ne p2, v0, :cond_2

    .line 135
    .line 136
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    check-cast p2, Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    if-nez p2, :cond_2

    .line 159
    .line 160
    new-instance p2, Ll/fje0;

    .line 161
    .line 162
    iget-object p0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    invoke-direct {p2, p0, v3, v1}, Ll/fje0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/a690;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2, p1}, Ll/fje0;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_2
    new-instance p2, Ll/hge0;

    .line 174
    .line 175
    iget-object v0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    invoke-direct {p2, v0, v3}, Ll/hge0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/a690;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2, p1}, Ll/hge0;->c(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-static {p2}, Ll/hge0;->h(Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    iget-object p0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 188
    .line 189
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 192
    .line 193
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->i7()Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    new-instance v0, Ll/jhj;

    .line 202
    .line 203
    invoke-direct {v0, p2}, Ll/jhj;-><init>(Landroid/view/View;)V

    .line 204
    .line 205
    .line 206
    new-instance v1, Ll/khj;

    .line 207
    .line 208
    invoke-direct {v1}, Ll/khj;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 216
    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_3
    move v6, p2

    .line 221
    iget-object p2, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 222
    .line 223
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 224
    .line 225
    if-ne p2, v0, :cond_5

    .line 226
    .line 227
    invoke-virtual {p0, v3}, Ll/ihj$b;->u(Ll/a690;)Z

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    if-eqz p2, :cond_5

    .line 232
    .line 233
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/a0;->e:Ll/jxd0;

    .line 238
    .line 239
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    check-cast p2, Ljava/lang/Boolean;

    .line 244
    .line 245
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    if-eqz p2, :cond_4

    .line 250
    .line 251
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 252
    .line 253
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 254
    .line 255
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 256
    .line 257
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result p2

    .line 265
    if-eqz p2, :cond_4

    .line 266
    .line 267
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 268
    .line 269
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 270
    .line 271
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 272
    .line 273
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p2

    .line 277
    check-cast p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 278
    .line 279
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 280
    .line 281
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result p2

    .line 285
    if-nez p2, :cond_4

    .line 286
    .line 287
    new-instance p2, Ll/fje0;

    .line 288
    .line 289
    iget-object p0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 290
    .line 291
    invoke-direct {p2, p0, v3, v1}, Ll/fje0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/a690;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p2, p1}, Ll/fje0;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :cond_4
    new-instance p2, Ll/hge0;

    .line 301
    .line 302
    iget-object v0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 303
    .line 304
    invoke-direct {p2, v0, v3}, Ll/hge0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/a690;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p2, p1}, Ll/hge0;->c(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object p2

    .line 311
    invoke-static {p2}, Ll/hge0;->h(Landroid/view/View;)V

    .line 312
    .line 313
    .line 314
    iget-object p0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 315
    .line 316
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 317
    .line 318
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 319
    .line 320
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->i7()Lrx/c;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    new-instance v0, Ll/lhj;

    .line 329
    .line 330
    invoke-direct {v0, p2}, Ll/lhj;-><init>(Landroid/view/View;)V

    .line 331
    .line 332
    .line 333
    new-instance v1, Ll/mhj;

    .line 334
    .line 335
    invoke-direct {v1}, Ll/mhj;-><init>()V

    .line 336
    .line 337
    .line 338
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 343
    .line 344
    .line 345
    goto :goto_0

    .line 346
    :cond_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 347
    .line 348
    .line 349
    move-result-object p2

    .line 350
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 351
    .line 352
    .line 353
    move-result-object p2

    .line 354
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 355
    .line 356
    .line 357
    move-result-object p2

    .line 358
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object p2

    .line 362
    check-cast p2, Ljava/lang/String;

    .line 363
    .line 364
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 365
    .line 366
    .line 367
    move-result p2

    .line 368
    if-nez p2, :cond_6

    .line 369
    .line 370
    iget-object p2, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 371
    .line 372
    if-ne p2, v0, :cond_6

    .line 373
    .line 374
    if-nez v6, :cond_6

    .line 375
    .line 376
    new-instance p2, Ll/fje0;

    .line 377
    .line 378
    iget-object p0, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 379
    .line 380
    invoke-direct {p2, p0, v3, v1}, Ll/fje0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/a690;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {p2, p1}, Ll/fje0;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 384
    .line 385
    .line 386
    move-result-object p2

    .line 387
    goto :goto_0

    .line 388
    :cond_6
    iget-object p2, p0, Ll/ihj$b;->h:Ljava/util/List;

    .line 389
    .line 390
    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object p2

    .line 394
    check-cast p2, Ll/a690;

    .line 395
    .line 396
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 397
    .line 398
    .line 399
    move-result-object p2

    .line 400
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 401
    .line 402
    iget-object v1, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 403
    .line 404
    if-ne p2, v0, :cond_7

    .line 405
    .line 406
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 407
    .line 408
    .line 409
    move-result-object p2

    .line 410
    sget v0, Ll/rec0;->P2:I

    .line 411
    .line 412
    invoke-virtual {p2, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 413
    .line 414
    .line 415
    move-result-object p2

    .line 416
    move-object v0, p2

    .line 417
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;

    .line 418
    .line 419
    iget-object v1, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 420
    .line 421
    iget-object p0, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 422
    .line 423
    invoke-virtual {v0, v1, v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPageBlock;->c(Lcom/p1/mobile/android/app/Act;Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 424
    .line 425
    .line 426
    goto :goto_0

    .line 427
    :cond_7
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 428
    .line 429
    .line 430
    move-result-object p2

    .line 431
    sget v0, Ll/rec0;->i:I

    .line 432
    .line 433
    invoke-virtual {p2, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 434
    .line 435
    .line 436
    move-result-object p2

    .line 437
    move-object v1, p2

    .line 438
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;

    .line 439
    .line 440
    iget-object v2, p0, Ll/ihj$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 441
    .line 442
    iget-boolean v4, p0, Ll/ihj$b;->i:Z

    .line 443
    .line 444
    invoke-virtual {p0}, Ll/ihj$b;->getCount()I

    .line 445
    .line 446
    .line 447
    move-result v5

    .line 448
    iget-object v7, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 449
    .line 450
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d(Lcom/p1/mobile/android/app/Act;Ll/a690;ZIILcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 451
    .line 452
    .line 453
    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 454
    .line 455
    .line 456
    return-object p2
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p3, Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Landroid/view/View;

    .line 7
    .line 8
    sget v1, Ll/fdc0;->J0:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->k()V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/cf60;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public u(Ll/a690;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ihj$b;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sget p1, Ll/jbc0;->vc:I

    .line 20
    .line 21
    if-eq p0, p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public v(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ihj$b;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ihj$b;->h:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
