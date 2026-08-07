.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/navigationbar/VNavigationTabLayout$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    aget-object p0, p0, v0

    .line 12
    .line 13
    sget v0, Ll/fgc0;->r:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->d()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    sget p1, Ll/hdc0;->W1:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->getTitleView()Lv/VText;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget p1, Ll/lbc0;->W0:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public b(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/cmg;->K()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->d()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    sget v3, Ll/hdc0;->W1:I

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->q0()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->t0()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lv/VImage;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/4 v3, 0x0

    .line 54
    if-eqz v1, :cond_6

    .line 55
    .line 56
    invoke-static {}, Ll/cmg;->D()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    invoke-static {}, Ll/cmg;->K()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_1

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 69
    .line 70
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lv/VImage;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    :cond_1
    invoke-static {}, Ll/cmg;->D()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_3

    .line 82
    .line 83
    invoke-static {}, Ll/cmg;->K()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_3

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 90
    .line 91
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lv/VImage;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    if-ne v0, v2, :cond_2

    .line 96
    .line 97
    move v4, v2

    .line 98
    goto :goto_0

    .line 99
    :cond_2
    move v4, v3

    .line 100
    :goto_0
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    :cond_3
    invoke-static {}, Ll/cmg;->D()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_5

    .line 108
    .line 109
    invoke-static {}, Ll/cmg;->K()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-nez v1, :cond_5

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 116
    .line 117
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lv/VImage;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    if-nez v0, :cond_4

    .line 122
    .line 123
    move v4, v2

    .line 124
    goto :goto_1

    .line 125
    :cond_4
    move v4, v3

    .line 126
    :goto_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    :cond_5
    invoke-static {}, Ll/cmg;->D()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_6

    .line 134
    .line 135
    invoke-static {}, Ll/cmg;->K()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_6

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 142
    .line 143
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lv/VImage;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 151
    .line 152
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_8

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 163
    .line 164
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    if-nez v0, :cond_7

    .line 169
    .line 170
    move v3, v2

    .line 171
    :cond_7
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 175
    .line 176
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    aget-object v1, v1, v0

    .line 181
    .line 182
    sget v3, Ll/fgc0;->q:I

    .line 183
    .line 184
    invoke-static {v1, v3}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->d()Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    if-eqz p1, :cond_9

    .line 192
    .line 193
    sget v1, Ll/hdc0;->W1:I

    .line 194
    .line 195
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 200
    .line 201
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->getTitleView()Lv/VText;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    sget v1, Ll/lbc0;->X0:I

    .line 206
    .line 207
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 208
    .line 209
    .line 210
    :cond_9
    invoke-static {}, Ll/cmg;->K()Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    const-string v1, "sort_type"

    .line 215
    .line 216
    const-string v3, "e_second_tab"

    .line 217
    .line 218
    if-nez p1, :cond_a

    .line 219
    .line 220
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 225
    .line 226
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    aget-object v4, v4, v0

    .line 231
    .line 232
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-eqz p1, :cond_a

    .line 245
    .line 246
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-virtual {p1}, Ll/t8c;->h()V

    .line 251
    .line 252
    .line 253
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    const/16 v4, 0x11

    .line 258
    .line 259
    invoke-virtual {p1, v4}, Ll/byh;->l(I)V

    .line 260
    .line 261
    .line 262
    const-string p1, "follow"

    .line 263
    .line 264
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    filled-new-array {p1}, [Ll/pf60;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    const-string v4, "p_follow"

    .line 273
    .line 274
    invoke-static {v3, v4, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 275
    .line 276
    .line 277
    :cond_a
    invoke-static {}, Ll/cmg;->K()Z

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    if-eqz p1, :cond_c

    .line 282
    .line 283
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 288
    .line 289
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    aget-object v4, v4, v0

    .line 294
    .line 295
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    if-nez p1, :cond_b

    .line 308
    .line 309
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 314
    .line 315
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    aget-object v4, v4, v0

    .line 320
    .line 321
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 322
    .line 323
    .line 324
    move-result-object v4

    .line 325
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v4

    .line 329
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-eqz p1, :cond_c

    .line 334
    .line 335
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 336
    .line 337
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/ImageView;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    aget-object p1, p1, v0

    .line 342
    .line 343
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 344
    .line 345
    .line 346
    move-result p1

    .line 347
    if-eqz p1, :cond_c

    .line 348
    .line 349
    invoke-static {}, Ll/cmg;->K()Z

    .line 350
    .line 351
    .line 352
    move-result p1

    .line 353
    if-eqz p1, :cond_c

    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 356
    .line 357
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->f5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Z)V

    .line 358
    .line 359
    .line 360
    :cond_c
    invoke-static {}, Ll/pu20;->p()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 365
    .line 366
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    aget-object p0, p0, v0

    .line 371
    .line 372
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result p0

    .line 384
    if-eqz p0, :cond_d

    .line 385
    .line 386
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    const/16 p1, 0x10

    .line 391
    .line 392
    invoke-virtual {p0, p1}, Ll/byh;->l(I)V

    .line 393
    .line 394
    .line 395
    const-string p0, "dating"

    .line 396
    .line 397
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    filled-new-array {p0}, [Ll/pf60;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    const-string p1, "p_discover_dating"

    .line 406
    .line 407
    invoke-static {v3, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 408
    .line 409
    .line 410
    :cond_d
    return-void
.end method
