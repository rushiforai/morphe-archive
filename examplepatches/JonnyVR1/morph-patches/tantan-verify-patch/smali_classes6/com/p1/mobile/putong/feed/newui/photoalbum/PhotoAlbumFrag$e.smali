.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/navigationbar/VNavigationTabLayout$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->g()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->f()V

    return-void
.end method


# virtual methods
.method public a(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    aget-object p0, p0, p1

    .line 24
    .line 25
    invoke-interface {v0, v1, p0}, Ll/jfh;->m(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-nez p1, :cond_5

    .line 18
    .line 19
    invoke-static {}, Ll/cmg;->Y()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_5

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/high16 v5, 0x41700000    # 15.0f

    .line 34
    .line 35
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    aget-object v0, v0, v1

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/cmg;->f0()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/ImageView;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    aget-object v0, v0, v1

    .line 70
    .line 71
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_7

    .line 76
    .line 77
    sget-boolean v0, Ll/kbh;->g:Z

    .line 78
    .line 79
    if-nez v0, :cond_1

    .line 80
    .line 81
    sput-boolean v2, Ll/kbh;->i:Z

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->w5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 90
    .line 91
    if-eqz v0, :cond_0

    .line 92
    .line 93
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->I5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Z)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v2, Ll/rh70;

    .line 102
    .line 103
    invoke-direct {v2, p0}, Ll/rh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;)V

    .line 104
    .line 105
    .line 106
    const-wide/16 v3, 0xc8

    .line 107
    .line 108
    invoke-static {v0, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/jka;->oc()Lrx/c;

    .line 115
    .line 116
    .line 117
    :goto_0
    sput-boolean v1, Ll/kbh;->g:Z

    .line 118
    .line 119
    sput-boolean v1, Ll/kbh;->h:Z

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v2, Ll/sh70;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/sh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;)V

    .line 130
    .line 131
    .line 132
    const-wide/16 v3, 0x1f4

    .line 133
    .line 134
    invoke-static {v0, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 135
    .line 136
    .line 137
    goto/16 :goto_1

    .line 138
    .line 139
    :cond_2
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->x5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_3

    .line 144
    .line 145
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 150
    .line 151
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->N5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-virtual {v0, v2}, Ll/byh;->f(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v2, Ll/pf60;

    .line 160
    .line 161
    const-string v3, "red_dot_relation_child"

    .line 162
    .line 163
    const-string v4, "red_dot_like"

    .line 164
    .line 165
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    filled-new-array {v2}, [Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    const-string v3, "e_red_dot_explore"

    .line 173
    .line 174
    invoke-static {v3, v0, v2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 175
    .line 176
    .line 177
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 178
    .line 179
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->x5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_4

    .line 184
    .line 185
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iget-object v0, v0, Ll/ach;->b:Ll/pbh;

    .line 190
    .line 191
    invoke-virtual {v0}, Ll/pbh;->f()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_4

    .line 196
    .line 197
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 198
    .line 199
    const-string v2, "recommend"

    .line 200
    .line 201
    iput-object v2, v0, Ll/jka;->G1:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 204
    .line 205
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i7()V

    .line 206
    .line 207
    .line 208
    :cond_4
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {v0}, Ll/ach;->m()V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_5
    invoke-static {}, Ll/cmg;->Y()Z

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    if-eqz v3, :cond_6

    .line 221
    .line 222
    invoke-static {}, Ll/cmg;->f0()Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-nez v3, :cond_6

    .line 227
    .line 228
    invoke-static {}, Ll/ach;->g()Ll/ach;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v3, v2}, Ll/ach;->l(Z)V

    .line 233
    .line 234
    .line 235
    :cond_6
    invoke-static {}, Ll/cmg;->Y()Z

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    if-eqz v2, :cond_7

    .line 240
    .line 241
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 242
    .line 243
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    if-eqz v2, :cond_7

    .line 248
    .line 249
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 250
    .line 251
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    array-length v2, v2

    .line 256
    if-lez v2, :cond_7

    .line 257
    .line 258
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 263
    .line 264
    .line 265
    move-result v3

    .line 266
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 267
    .line 268
    .line 269
    move-result v4

    .line 270
    invoke-virtual {v0, v2, v3, v1, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 274
    .line 275
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    aget-object v0, v0, v1

    .line 280
    .line 281
    const/16 v2, 0x8

    .line 282
    .line 283
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 284
    .line 285
    .line 286
    :cond_7
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 287
    .line 288
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 293
    .line 294
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 299
    .line 300
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    aget-object v3, v3, p1

    .line 305
    .line 306
    invoke-interface {v0, v2, v3}, Ll/jfh;->c(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;)V

    .line 307
    .line 308
    .line 309
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 310
    .line 311
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->h5:I

    .line 312
    .line 313
    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 318
    .line 319
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    aget-object v2, v2, p1

    .line 324
    .line 325
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    const-string v2, "\u559c\u6b22"

    .line 338
    .line 339
    if-nez v0, :cond_8

    .line 340
    .line 341
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 342
    .line 343
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    aget-object v0, v0, p1

    .line 348
    .line 349
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    if-eqz v0, :cond_a

    .line 362
    .line 363
    :cond_8
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 368
    .line 369
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    aget-object v3, v3, p1

    .line 374
    .line 375
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result v2

    .line 387
    if-eqz v2, :cond_9

    .line 388
    .line 389
    const/16 v2, 0xf

    .line 390
    .line 391
    goto :goto_2

    .line 392
    :cond_9
    const/4 v2, 0x3

    .line 393
    :goto_2
    invoke-virtual {v0, v2}, Ll/byh;->l(I)V

    .line 394
    .line 395
    .line 396
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 397
    .line 398
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->g2()V

    .line 399
    .line 400
    .line 401
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 402
    .line 403
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->i5:I

    .line 404
    .line 405
    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 410
    .line 411
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    aget-object v2, v2, p1

    .line 416
    .line 417
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-eqz v0, :cond_b

    .line 430
    .line 431
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 432
    .line 433
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    if-eqz v0, :cond_b

    .line 438
    .line 439
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    const/16 v2, 0xb

    .line 444
    .line 445
    invoke-virtual {v0, v2}, Ll/byh;->l(I)V

    .line 446
    .line 447
    .line 448
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 449
    .line 450
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->C5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    if-eqz v0, :cond_b

    .line 455
    .line 456
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 457
    .line 458
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->M5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Z

    .line 459
    .line 460
    .line 461
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 462
    .line 463
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->E0:I

    .line 464
    .line 465
    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 470
    .line 471
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    aget-object v2, v2, p1

    .line 476
    .line 477
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 478
    .line 479
    .line 480
    move-result-object v2

    .line 481
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v2

    .line 485
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    if-eqz v0, :cond_c

    .line 490
    .line 491
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 492
    .line 493
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    if-eq p1, v0, :cond_c

    .line 498
    .line 499
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 500
    .line 501
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I

    .line 502
    .line 503
    .line 504
    move-result v2

    .line 505
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->P5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    new-array v1, v1, [Ll/tfj0$a;

    .line 510
    .line 511
    const-string v2, "e_recommend"

    .line 512
    .line 513
    invoke-static {v2, v0, v1}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 514
    .line 515
    .line 516
    :cond_c
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 517
    .line 518
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->K5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V

    .line 519
    .line 520
    .line 521
    return-void
.end method

.method public final synthetic f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->i7()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$e;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    aget-object p0, p0, v0

    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
