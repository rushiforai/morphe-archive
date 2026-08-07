.class public Ll/mql0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mql0;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mql0;


# direct methods
.method public constructor <init>(Ll/mql0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p1, :cond_8

    .line 4
    .line 5
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 6
    .line 7
    iget-object v2, p1, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 8
    .line 9
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 25
    .line 26
    iget-object v2, p1, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 27
    .line 28
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {v4, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 44
    .line 45
    iget-object v2, p1, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 46
    .line 47
    sget-object v5, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 48
    .line 49
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {v5, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 63
    .line 64
    iget-object v2, p1, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 65
    .line 66
    sget-object v6, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 67
    .line 68
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {v6, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 82
    .line 83
    iget-object v2, p1, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 84
    .line 85
    sget-object v7, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 86
    .line 87
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-static {v7, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 101
    .line 102
    iget-object v2, p1, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 103
    .line 104
    sget-object v8, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 105
    .line 106
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-static {v8, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 120
    .line 121
    iget-object v2, p1, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 122
    .line 123
    sget-object v9, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 124
    .line 125
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 126
    .line 127
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-static {v9, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_0

    .line 136
    .line 137
    invoke-static {}, Ll/joa;->O3()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-nez p1, :cond_0

    .line 142
    .line 143
    move v0, v1

    .line 144
    :cond_0
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 148
    .line 149
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 150
    .line 151
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 160
    .line 161
    if-eqz p1, :cond_1

    .line 162
    .line 163
    invoke-static {v0}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 168
    .line 169
    invoke-virtual {p1, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 173
    .line 174
    invoke-static {p1, v3}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 175
    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_1
    iget-object p1, v0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 180
    .line 181
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    invoke-static {v4, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 190
    .line 191
    if-eqz p1, :cond_2

    .line 192
    .line 193
    invoke-static {v0}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 198
    .line 199
    invoke-virtual {p1, v4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 203
    .line 204
    invoke-static {p1, v4}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 205
    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_2
    iget-object p1, v0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 210
    .line 211
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    invoke-static {v5, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 220
    .line 221
    if-eqz p1, :cond_3

    .line 222
    .line 223
    invoke-static {v0}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 228
    .line 229
    invoke-virtual {p1, v5}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 233
    .line 234
    invoke-static {p1, v5}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 235
    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :cond_3
    iget-object p1, v0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 240
    .line 241
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    invoke-static {v6, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 250
    .line 251
    if-eqz p1, :cond_4

    .line 252
    .line 253
    invoke-static {v0}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 258
    .line 259
    invoke-virtual {p1, v6}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 260
    .line 261
    .line 262
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 263
    .line 264
    invoke-static {p1, v6}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 265
    .line 266
    .line 267
    goto :goto_0

    .line 268
    :cond_4
    iget-object p1, v0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 269
    .line 270
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    invoke-static {v7, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 279
    .line 280
    if-eqz p1, :cond_5

    .line 281
    .line 282
    invoke-static {v0}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 287
    .line 288
    invoke-virtual {p1, v7}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 289
    .line 290
    .line 291
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 292
    .line 293
    invoke-static {p1, v7}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 294
    .line 295
    .line 296
    goto :goto_0

    .line 297
    :cond_5
    iget-object p1, v0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 298
    .line 299
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    invoke-static {v8, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 308
    .line 309
    if-eqz p1, :cond_6

    .line 310
    .line 311
    invoke-static {v0}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 316
    .line 317
    invoke-virtual {p1, v8}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 321
    .line 322
    invoke-static {p1, v8}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 323
    .line 324
    .line 325
    goto :goto_0

    .line 326
    :cond_6
    iget-object p1, v0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 327
    .line 328
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    invoke-static {v9, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    if-eqz p1, :cond_7

    .line 337
    .line 338
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 339
    .line 340
    invoke-static {p1}, Ll/mql0;->i(Ll/mql0;)Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 345
    .line 346
    invoke-virtual {p1, v9}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 350
    .line 351
    invoke-static {p1, v9}, Ll/mql0;->m(Ll/mql0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 352
    .line 353
    .line 354
    :cond_7
    :goto_0
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 355
    .line 356
    invoke-static {p1}, Ll/mql0;->l(Ll/mql0;)V

    .line 357
    .line 358
    .line 359
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 360
    .line 361
    invoke-virtual {p1}, Ll/mql0;->O()V

    .line 362
    .line 363
    .line 364
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 365
    .line 366
    invoke-static {p1}, Ll/mql0;->j(Ll/mql0;)Ll/fql0;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result p1

    .line 374
    if-eqz p1, :cond_a

    .line 375
    .line 376
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 377
    .line 378
    invoke-static {p1}, Ll/mql0;->j(Ll/mql0;)Ll/fql0;

    .line 379
    .line 380
    .line 381
    move-result-object p1

    .line 382
    iget-object p0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 383
    .line 384
    iget-object p0, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 385
    .line 386
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 387
    .line 388
    .line 389
    move-result p0

    .line 390
    invoke-static {p0}, Ll/eql0;->o0(I)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    invoke-virtual {p1, p0}, Ll/fql0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 395
    .line 396
    .line 397
    return-void

    .line 398
    :cond_8
    const/4 v2, 0x2

    .line 399
    if-ne p1, v2, :cond_a

    .line 400
    .line 401
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 402
    .line 403
    invoke-virtual {p1}, Ll/mql0;->u()V

    .line 404
    .line 405
    .line 406
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 407
    .line 408
    iget-object v2, p1, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 409
    .line 410
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 411
    .line 412
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 413
    .line 414
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 415
    .line 416
    .line 417
    move-result p1

    .line 418
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 419
    .line 420
    .line 421
    move-result p1

    .line 422
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 423
    .line 424
    .line 425
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 426
    .line 427
    iget-object v2, p1, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 428
    .line 429
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 430
    .line 431
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 432
    .line 433
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 434
    .line 435
    .line 436
    move-result p1

    .line 437
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 442
    .line 443
    .line 444
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 445
    .line 446
    iget-object v2, p1, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 447
    .line 448
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 449
    .line 450
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 451
    .line 452
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 453
    .line 454
    .line 455
    move-result p1

    .line 456
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 457
    .line 458
    .line 459
    move-result p1

    .line 460
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 461
    .line 462
    .line 463
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 464
    .line 465
    iget-object v2, p1, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 466
    .line 467
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 468
    .line 469
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 470
    .line 471
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 472
    .line 473
    .line 474
    move-result p1

    .line 475
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 476
    .line 477
    .line 478
    move-result p1

    .line 479
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 480
    .line 481
    .line 482
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 483
    .line 484
    iget-object v2, p1, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 485
    .line 486
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 487
    .line 488
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 489
    .line 490
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 491
    .line 492
    .line 493
    move-result p1

    .line 494
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 499
    .line 500
    .line 501
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 502
    .line 503
    iget-object v2, p1, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 504
    .line 505
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 506
    .line 507
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 508
    .line 509
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 510
    .line 511
    .line 512
    move-result p1

    .line 513
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 514
    .line 515
    .line 516
    move-result p1

    .line 517
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 518
    .line 519
    .line 520
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 521
    .line 522
    iget-object v2, p1, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 523
    .line 524
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 525
    .line 526
    iget-object p1, p1, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 527
    .line 528
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 529
    .line 530
    .line 531
    move-result p1

    .line 532
    invoke-static {v3, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 533
    .line 534
    .line 535
    move-result p1

    .line 536
    if-eqz p1, :cond_9

    .line 537
    .line 538
    invoke-static {}, Ll/joa;->O3()Z

    .line 539
    .line 540
    .line 541
    move-result p1

    .line 542
    if-nez p1, :cond_9

    .line 543
    .line 544
    move v0, v1

    .line 545
    :cond_9
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 546
    .line 547
    .line 548
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 549
    .line 550
    invoke-static {p1}, Ll/mql0;->j(Ll/mql0;)Ll/fql0;

    .line 551
    .line 552
    .line 553
    move-result-object p1

    .line 554
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 555
    .line 556
    .line 557
    move-result p1

    .line 558
    if-eqz p1, :cond_a

    .line 559
    .line 560
    iget-object p1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 561
    .line 562
    invoke-static {p1}, Ll/mql0;->j(Ll/mql0;)Ll/fql0;

    .line 563
    .line 564
    .line 565
    move-result-object p1

    .line 566
    iget-object p0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 567
    .line 568
    iget-object p0, p0, Ll/mql0;->h:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/AlphaTransformerViewPager;

    .line 569
    .line 570
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 571
    .line 572
    .line 573
    move-result p0

    .line 574
    invoke-static {p0}, Ll/eql0;->o0(I)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 575
    .line 576
    .line 577
    move-result-object p0

    .line 578
    invoke-virtual {p1, p0}, Ll/fql0;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 579
    .line 580
    .line 581
    :cond_a
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p2, v0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/eql0;->q0()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    iget-object v1, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 33
    .line 34
    invoke-static {v1}, Ll/mql0;->k(Ll/mql0;)Ll/lib0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v1, v0}, Ll/lib0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 46
    .line 47
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/high16 v1, 0x3f800000    # 1.0f

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 56
    .line 57
    iget-object v0, v0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 58
    .line 59
    sub-float/2addr v1, p2

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 64
    .line 65
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 66
    .line 67
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 71
    .line 72
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 73
    .line 74
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 78
    .line 79
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 80
    .line 81
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 85
    .line 86
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 87
    .line 88
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 92
    .line 93
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 94
    .line 95
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 99
    .line 100
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 101
    .line 102
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 108
    .line 109
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 116
    .line 117
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 118
    .line 119
    sub-float/2addr v1, p2

    .line 120
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 124
    .line 125
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 126
    .line 127
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 131
    .line 132
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 133
    .line 134
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 138
    .line 139
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 140
    .line 141
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 145
    .line 146
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 147
    .line 148
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 152
    .line 153
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 154
    .line 155
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 161
    .line 162
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_3

    .line 167
    .line 168
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 169
    .line 170
    iget-object v0, v0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 171
    .line 172
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 176
    .line 177
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 178
    .line 179
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 183
    .line 184
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 185
    .line 186
    sub-float/2addr v1, p2

    .line 187
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 191
    .line 192
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 193
    .line 194
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 198
    .line 199
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 200
    .line 201
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 205
    .line 206
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 207
    .line 208
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 212
    .line 213
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 214
    .line 215
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 221
    .line 222
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_4

    .line 227
    .line 228
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 229
    .line 230
    iget-object v0, v0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 231
    .line 232
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 236
    .line 237
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 238
    .line 239
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 243
    .line 244
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 245
    .line 246
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 250
    .line 251
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 252
    .line 253
    sub-float/2addr v1, p2

    .line 254
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 258
    .line 259
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 260
    .line 261
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 265
    .line 266
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 267
    .line 268
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 272
    .line 273
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 274
    .line 275
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 276
    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 281
    .line 282
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-eqz v0, :cond_5

    .line 287
    .line 288
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 289
    .line 290
    iget-object v0, v0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 291
    .line 292
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 296
    .line 297
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 298
    .line 299
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 303
    .line 304
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 305
    .line 306
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 307
    .line 308
    .line 309
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 310
    .line 311
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 312
    .line 313
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 314
    .line 315
    .line 316
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 317
    .line 318
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 319
    .line 320
    sub-float/2addr v1, p2

    .line 321
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 325
    .line 326
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 327
    .line 328
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 329
    .line 330
    .line 331
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 332
    .line 333
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 334
    .line 335
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 336
    .line 337
    .line 338
    goto :goto_0

    .line 339
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 340
    .line 341
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-eqz v0, :cond_6

    .line 346
    .line 347
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 348
    .line 349
    iget-object v0, v0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 350
    .line 351
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 352
    .line 353
    .line 354
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 355
    .line 356
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 357
    .line 358
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 359
    .line 360
    .line 361
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 362
    .line 363
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 364
    .line 365
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 366
    .line 367
    .line 368
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 369
    .line 370
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 371
    .line 372
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 373
    .line 374
    .line 375
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 376
    .line 377
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 378
    .line 379
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 380
    .line 381
    .line 382
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 383
    .line 384
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 385
    .line 386
    sub-float/2addr v1, p2

    .line 387
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 388
    .line 389
    .line 390
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 391
    .line 392
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 393
    .line 394
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 395
    .line 396
    .line 397
    goto :goto_0

    .line 398
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 399
    .line 400
    invoke-static {v0, p1}, Ll/eql0;->t0(Lcom/p1/mobile/putong/core/data/PurchaseType;I)Z

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    if-eqz v0, :cond_7

    .line 405
    .line 406
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 407
    .line 408
    iget-object v0, v0, Ll/mql0;->k:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 409
    .line 410
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 411
    .line 412
    .line 413
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 414
    .line 415
    iget-object v0, v0, Ll/mql0;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 416
    .line 417
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 421
    .line 422
    iget-object v0, v0, Ll/mql0;->m:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 423
    .line 424
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 425
    .line 426
    .line 427
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 428
    .line 429
    iget-object v0, v0, Ll/mql0;->n:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 430
    .line 431
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 432
    .line 433
    .line 434
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 435
    .line 436
    iget-object v0, v0, Ll/mql0;->p:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 437
    .line 438
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 439
    .line 440
    .line 441
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 442
    .line 443
    iget-object v0, v0, Ll/mql0;->o:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 444
    .line 445
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setViewsAlpha(F)V

    .line 446
    .line 447
    .line 448
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 449
    .line 450
    iget-object v0, v0, Ll/mql0;->q:Landroid/widget/FrameLayout;

    .line 451
    .line 452
    sub-float/2addr v1, p2

    .line 453
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 454
    .line 455
    .line 456
    :cond_7
    :goto_0
    iget-object v0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 457
    .line 458
    invoke-static {v0}, Ll/mql0;->j(Ll/mql0;)Ll/fql0;

    .line 459
    .line 460
    .line 461
    move-result-object v0

    .line 462
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_8

    .line 467
    .line 468
    iget-object p0, p0, Ll/mql0$a;->a:Ll/mql0;

    .line 469
    .line 470
    invoke-static {p0}, Ll/mql0;->j(Ll/mql0;)Ll/fql0;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    invoke-static {p1}, Ll/eql0;->o0(I)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 475
    .line 476
    .line 477
    move-result-object p1

    .line 478
    invoke-virtual {p0, p1, p2, p3}, Ll/fql0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;FI)V

    .line 479
    .line 480
    .line 481
    :cond_8
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    return-void
.end method
