.class public Ll/epe;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Landroid/widget/LinearLayout;

.field public C:Lv/VText;

.field public D:Landroid/widget/ImageView;

.field public E:Lv/VLinear;

.field public F:Lv/VDraweeView;

.field public G:Lv/VDraweeView;

.field public H:Lv/VDraweeView;

.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lv/VLinear;

.field public x:Lv/VText;

.field public y:Landroid/widget/ImageView;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/epe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/epe;->T(Landroid/view/View;)V

    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_edit_profile_pet"

    .line 5
    .line 6
    const-string v1, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PET:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fpe;->b(Ll/epe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/epe;->S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/epe;->v:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/epe;->A:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/epe;->F:Lv/VDraweeView;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/epe;->G:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/epe;->H:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v3, 0x0

    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 72
    .line 73
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 86
    .line 87
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-nez v2, :cond_0

    .line 92
    .line 93
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 94
    .line 95
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 96
    .line 97
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    move-object v2, v4

    .line 103
    :goto_0
    iget-object v5, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 104
    .line 105
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 106
    .line 107
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 108
    .line 109
    iget-object v5, v5, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-nez v5, :cond_2

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    move-object v4, v1

    .line 130
    check-cast v4, Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_1
    move-object v2, v4

    .line 134
    :cond_2
    :goto_1
    iget-object v1, p0, Ll/epe;->w:Lv/VLinear;

    .line 135
    .line 136
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Ll/epe;->z:Landroid/widget/LinearLayout;

    .line 140
    .line 141
    const/4 v5, 0x1

    .line 142
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    const-string v6, "\u5df2\u6709\u5ba0\u7269"

    .line 150
    .line 151
    if-nez v1, :cond_4

    .line 152
    .line 153
    const-string v1, "\u6682\u65e0"

    .line 154
    .line 155
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_3

    .line 160
    .line 161
    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_4

    .line 166
    .line 167
    :cond_3
    iget-object v1, p0, Ll/epe;->B:Landroid/widget/LinearLayout;

    .line 168
    .line 169
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object v1, p0, Ll/epe;->C:Lv/VText;

    .line 173
    .line 174
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Ll/epe;->D:Landroid/widget/ImageView;

    .line 178
    .line 179
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_4
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-nez v1, :cond_5

    .line 188
    .line 189
    const-string v1, "\u6682\u4e0d\u900f\u9732"

    .line 190
    .line 191
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_5

    .line 196
    .line 197
    iget-object v1, p0, Ll/epe;->B:Landroid/widget/LinearLayout;

    .line 198
    .line 199
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Ll/epe;->D:Landroid/widget/ImageView;

    .line 203
    .line 204
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    :cond_5
    :goto_2
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-nez v1, :cond_7

    .line 212
    .line 213
    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_7

    .line 218
    .line 219
    iget-object v1, p0, Ll/epe;->w:Lv/VLinear;

    .line 220
    .line 221
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    iget-object v1, p0, Ll/epe;->z:Landroid/widget/LinearLayout;

    .line 225
    .line 226
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 227
    .line 228
    .line 229
    iget-object v1, p0, Ll/epe;->x:Lv/VText;

    .line 230
    .line 231
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p0, Ll/epe;->E:Lv/VLinear;

    .line 235
    .line 236
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 237
    .line 238
    .line 239
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 244
    .line 245
    .line 246
    move-result v4

    .line 247
    if-eqz v4, :cond_6

    .line 248
    .line 249
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    check-cast v4, Lv/VDraweeView;

    .line 254
    .line 255
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 256
    .line 257
    .line 258
    goto :goto_3

    .line 259
    :cond_6
    move v1, v3

    .line 260
    :goto_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    const/4 v6, 0x3

    .line 265
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    .line 266
    .line 267
    .line 268
    move-result v4

    .line 269
    if-ge v1, v4, :cond_8

    .line 270
    .line 271
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    check-cast v4, Ljava/lang/String;

    .line 276
    .line 277
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v7

    .line 281
    check-cast v7, Lv/VDraweeView;

    .line 282
    .line 283
    invoke-static {v7, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 284
    .line 285
    .line 286
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 287
    .line 288
    invoke-virtual {v8, v7, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 296
    .line 297
    const/high16 v8, 0x42700000    # 60.0f

    .line 298
    .line 299
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 300
    .line 301
    .line 302
    move-result v8

    .line 303
    sub-int/2addr v4, v8

    .line 304
    div-int/2addr v4, v6

    .line 305
    new-array v6, v5, [Landroid/view/View;

    .line 306
    .line 307
    aput-object v7, v6, v3

    .line 308
    .line 309
    invoke-static {v4, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 310
    .line 311
    .line 312
    invoke-static {v7, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 313
    .line 314
    .line 315
    add-int/lit8 v1, v1, 0x1

    .line 316
    .line 317
    goto :goto_4

    .line 318
    :cond_7
    iget-object v0, p0, Ll/epe;->E:Lv/VLinear;

    .line 319
    .line 320
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 321
    .line 322
    .line 323
    :cond_8
    iget-object v0, p0, Ll/epe;->u:Lv/VLinear_Dividers;

    .line 324
    .line 325
    new-instance v1, Ll/dpe;

    .line 326
    .line 327
    invoke-direct {v1, p0}, Ll/dpe;-><init>(Ll/epe;)V

    .line 328
    .line 329
    .line 330
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 331
    .line 332
    .line 333
    return-void
.end method
