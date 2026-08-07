.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VFrame_Shadow;

.field public d:Lv/VDraweeView;

.field public e:Lv/VFrame;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VFrame;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Lv/VButton;

.field public o:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lkr;->a(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(ILcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 8

    return-void

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->c:Lv/VFrame_Shadow;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eq p1, v3, :cond_1

    .line 12
    .line 13
    if-le p1, v3, :cond_0

    .line 14
    .line 15
    if-ne v0, v3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v4, v2

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move v4, v3

    .line 21
    :goto_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->e:Lv/VFrame;

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    if-ne p1, v4, :cond_2

    .line 28
    .line 29
    if-ge v0, v4, :cond_3

    .line 30
    .line 31
    :cond_2
    if-le p1, v4, :cond_4

    .line 32
    .line 33
    if-ne v0, v4, :cond_4

    .line 34
    .line 35
    :cond_3
    move v5, v3

    .line 36
    goto :goto_2

    .line 37
    :cond_4
    move v5, v2

    .line 38
    :goto_2
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->h:Lv/VFrame;

    .line 42
    .line 43
    const/4 v5, 0x3

    .line 44
    if-lt p1, v5, :cond_5

    .line 45
    .line 46
    if-lt v0, v5, :cond_5

    .line 47
    .line 48
    move v6, v3

    .line 49
    goto :goto_3

    .line 50
    :cond_5
    move v6, v2

    .line 51
    :goto_3
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    if-eq p1, v3, :cond_a

    .line 55
    .line 56
    if-le p1, v3, :cond_6

    .line 57
    .line 58
    if-ne v0, v3, :cond_6

    .line 59
    .line 60
    goto/16 :goto_4

    .line 61
    .line 62
    :cond_6
    if-ne p1, v4, :cond_7

    .line 63
    .line 64
    if-ge v0, v4, :cond_8

    .line 65
    .line 66
    :cond_7
    if-le p1, v4, :cond_9

    .line 67
    .line 68
    if-ne v0, v4, :cond_9

    .line 69
    .line 70
    :cond_8
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->f:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    sget v6, Ll/qa00;->f:I

    .line 93
    .line 94
    invoke-virtual {v0, v1, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->g:Lv/VDraweeView;

    .line 100
    .line 101
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v0, v1, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    goto :goto_5

    .line 123
    :cond_9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->i:Lv/VDraweeView;

    .line 126
    .line 127
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    check-cast v6, Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    sget v7, Ll/qa00;->f:I

    .line 146
    .line 147
    invoke-virtual {v0, v1, v6, v5, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 148
    .line 149
    .line 150
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->j:Lv/VDraweeView;

    .line 153
    .line 154
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    check-cast v6, Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 161
    .line 162
    .line 163
    move-result-object v6

    .line 164
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    invoke-virtual {v0, v1, v6, v5, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 173
    .line 174
    .line 175
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->k:Lv/VDraweeView;

    .line 178
    .line 179
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v4

    .line 183
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 184
    .line 185
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-virtual {v0, v1, v4, v5, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 198
    .line 199
    .line 200
    goto :goto_5

    .line 201
    :cond_a
    :goto_4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->d:Lv/VDraweeView;

    .line 204
    .line 205
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 210
    .line 211
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    sget v6, Ll/qa00;->f:I

    .line 224
    .line 225
    invoke-virtual {v0, v1, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 226
    .line 227
    .line 228
    :goto_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->n:Lv/VButton;

    .line 229
    .line 230
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 231
    .line 232
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->j1:I

    .line 233
    .line 234
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->o:Landroid/widget/TextView;

    .line 242
    .line 243
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 244
    .line 245
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->m1:I

    .line 246
    .line 247
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    const/16 v0, 0x63

    .line 255
    .line 256
    if-le p1, v0, :cond_b

    .line 257
    .line 258
    const-string v0, "99+"

    .line 259
    .line 260
    goto :goto_6

    .line 261
    :cond_b
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    :goto_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->l:Landroid/widget/TextView;

    .line 266
    .line 267
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 268
    .line 269
    .line 270
    move-result-object v4

    .line 271
    if-ne p1, v3, :cond_c

    .line 272
    .line 273
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->l1:I

    .line 274
    .line 275
    goto :goto_7

    .line 276
    :cond_c
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->k1:I

    .line 277
    .line 278
    :goto_7
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-virtual {v4, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 287
    .line 288
    .line 289
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->m:Landroid/widget/TextView;

    .line 290
    .line 291
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object p2

    .line 303
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 304
    .line 305
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    const-string v1, "#ffe8aa"

    .line 310
    .line 311
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    filled-new-array {v2, v1}, [I

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-interface {v0, p2, p0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bc(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;[I)Ljava/lang/CharSequence;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->c:Lv/VFrame_Shadow;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    move v4, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v4, v3

    .line 21
    :goto_0
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->e:Lv/VFrame;

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    if-ne v0, v4, :cond_2

    .line 28
    .line 29
    move v5, v2

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    move v5, v3

    .line 32
    :goto_1
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->h:Lv/VFrame;

    .line 36
    .line 37
    const/4 v5, 0x3

    .line 38
    if-lt v0, v5, :cond_3

    .line 39
    .line 40
    move v6, v2

    .line 41
    goto :goto_2

    .line 42
    :cond_3
    move v6, v3

    .line 43
    :goto_2
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    if-ne v0, v2, :cond_4

    .line 47
    .line 48
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->d:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/lang/String;

    .line 57
    .line 58
    sget v2, Ll/qa00;->f:I

    .line 59
    .line 60
    invoke-virtual {v0, v1, p1, v5, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    goto :goto_3

    .line 64
    :cond_4
    if-ne v0, v4, :cond_5

    .line 65
    .line 66
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->f:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ljava/lang/String;

    .line 75
    .line 76
    sget v6, Ll/qa00;->f:I

    .line 77
    .line 78
    invoke-virtual {v0, v1, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->g:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1, p1, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 92
    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->i:Lv/VDraweeView;

    .line 98
    .line 99
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    check-cast v6, Ljava/lang/String;

    .line 104
    .line 105
    sget v7, Ll/qa00;->f:I

    .line 106
    .line 107
    invoke-virtual {v0, v1, v6, v5, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 108
    .line 109
    .line 110
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->j:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1, v2, v5, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->k:Lv/VDraweeView;

    .line 126
    .line 127
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    check-cast p1, Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v1, p1, v5, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 134
    .line 135
    .line 136
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->l:Landroid/widget/TextView;

    .line 137
    .line 138
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 139
    .line 140
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->Q0:I

    .line 141
    .line 142
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 143
    .line 144
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y4()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    invoke-static {v2}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->m:Landroid/widget/TextView;

    .line 168
    .line 169
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 170
    .line 171
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->O0:I

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->m:Landroid/widget/TextView;

    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 187
    .line 188
    const/high16 v0, 0x42180000    # 38.0f

    .line 189
    .line 190
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    invoke-virtual {p1, v1, v3, v0, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->n:Lv/VButton;

    .line 202
    .line 203
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 204
    .line 205
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->P0:I

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->o:Landroid/widget/TextView;

    .line 215
    .line 216
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 217
    .line 218
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->m1:I

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
