.class public Ll/pta0$c;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pta0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/nta0;

.field public final synthetic c:Ll/pta0;


# direct methods
.method public constructor <init>(Ll/pta0;Ll/nta0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/pta0$c;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    iput-object p2, p0, Ll/pta0$c;->b:Ll/nta0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0$c;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    return-object p0
.end method

.method public b(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pta0$c;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pta0$c;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0$c;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pta0$c;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 5
    .line 6
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget v1, Ll/sec0;->w:I

    .line 15
    .line 16
    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance p3, Ll/pta0$d;

    .line 21
    .line 22
    iget-object v1, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 23
    .line 24
    invoke-direct {p3, v1}, Ll/pta0$d;-><init>(Ll/pta0;)V

    .line 25
    .line 26
    .line 27
    sget v1, Ll/gdc0;->Y:I

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v1, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 36
    .line 37
    sget v1, Ll/gdc0;->a:I

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/ImageView;

    .line 44
    .line 45
    iput-object v1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 46
    .line 47
    sget v1, Ll/gdc0;->y:I

    .line 48
    .line 49
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 54
    .line 55
    sget v1, Ll/gdc0;->z:I

    .line 56
    .line 57
    invoke-virtual {p2, v1, p3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    sget p3, Ll/gdc0;->z:I

    .line 62
    .line 63
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    check-cast p3, Ll/pta0$d;

    .line 68
    .line 69
    :goto_0
    invoke-virtual {p0, p1}, Ll/pta0$c;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const/4 v2, 0x1

    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object v3, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 81
    .line 82
    iget-object v3, v3, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 83
    .line 84
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->V2:I

    .line 85
    .line 86
    invoke-virtual {v3, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_1

    .line 95
    .line 96
    iget-object p1, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 97
    .line 98
    const-string v3, "#e6000000"

    .line 99
    .line 100
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 108
    .line 109
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 110
    .line 111
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 115
    .line 116
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 120
    .line 121
    iget-object v3, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 122
    .line 123
    iget-object v3, v3, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 124
    .line 125
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    sget v4, Ll/kbc0;->s:I

    .line 130
    .line 131
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_1
    iget-object p1, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 140
    .line 141
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 142
    .line 143
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-nez v3, :cond_3

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->k()Z

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    if-eqz v3, :cond_2

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    move v3, v0

    .line 162
    goto :goto_2

    .line 163
    :cond_3
    :goto_1
    move v3, v2

    .line 164
    :goto_2
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 168
    .line 169
    iget-object v3, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 170
    .line 171
    iget-object v3, v3, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 172
    .line 173
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    sget v4, Ll/kbc0;->r0:I

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 184
    .line 185
    .line 186
    :goto_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->d()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->SELECT_JUST_TEXT:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 191
    .line 192
    if-ne p1, v3, :cond_5

    .line 193
    .line 194
    iget-object p0, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 195
    .line 196
    const/high16 p1, 0x42200000    # 40.0f

    .line 197
    .line 198
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    invoke-static {p0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 206
    .line 207
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 215
    .line 216
    const/high16 p1, 0x40c00000    # 6.0f

    .line 217
    .line 218
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    invoke-static {p0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 223
    .line 224
    .line 225
    iget-object p0, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 226
    .line 227
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 235
    .line 236
    const/4 p1, 0x3

    .line 237
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 242
    .line 243
    .line 244
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 245
    .line 246
    const/16 p1, 0x11

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 249
    .line 250
    .line 251
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 252
    .line 253
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 254
    .line 255
    .line 256
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 257
    .line 258
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 263
    .line 264
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 265
    .line 266
    iget-object p1, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 267
    .line 268
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    iget-object p1, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 276
    .line 277
    const/high16 v0, 0x41800000    # 16.0f

    .line 278
    .line 279
    if-eqz p0, :cond_4

    .line 280
    .line 281
    sget p0, Ll/kbc0;->p0:I

    .line 282
    .line 283
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 284
    .line 285
    .line 286
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 287
    .line 288
    const/4 p1, -0x1

    .line 289
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 290
    .line 291
    .line 292
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 293
    .line 294
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 295
    .line 296
    .line 297
    goto :goto_4

    .line 298
    :cond_4
    sget p0, Ll/kbc0;->q0:I

    .line 299
    .line 300
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 301
    .line 302
    .line 303
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 304
    .line 305
    const p1, -0xcdcdce

    .line 306
    .line 307
    .line 308
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 309
    .line 310
    .line 311
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 312
    .line 313
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 314
    .line 315
    .line 316
    goto :goto_4

    .line 317
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    if-eqz p1, :cond_6

    .line 322
    .line 323
    iget-object p1, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 324
    .line 325
    sget v0, Ll/kbc0;->t0:I

    .line 326
    .line 327
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 328
    .line 329
    .line 330
    iget-object p1, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 331
    .line 332
    iget-object v0, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 333
    .line 334
    iget-object v0, v0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 335
    .line 336
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    sget v3, Ll/j9c0;->f:I

    .line 341
    .line 342
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 350
    .line 351
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 352
    .line 353
    .line 354
    iget-object p1, p3, Ll/pta0$d;->b:Landroid/widget/ImageView;

    .line 355
    .line 356
    iget-object p0, p0, Ll/pta0$c;->c:Ll/pta0;

    .line 357
    .line 358
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 359
    .line 360
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    sget v0, Ll/kbc0;->h:I

    .line 365
    .line 366
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 371
    .line 372
    .line 373
    goto :goto_4

    .line 374
    :cond_6
    iget-object p0, p3, Ll/pta0$d;->c:Landroid/view/View;

    .line 375
    .line 376
    sget p1, Ll/kbc0;->s0:I

    .line 377
    .line 378
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 379
    .line 380
    .line 381
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 382
    .line 383
    const-string p1, "#cf000000"

    .line 384
    .line 385
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 386
    .line 387
    .line 388
    move-result p1

    .line 389
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 390
    .line 391
    .line 392
    :goto_4
    iget-object p0, p3, Ll/pta0$d;->a:Landroid/widget/TextView;

    .line 393
    .line 394
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 399
    .line 400
    .line 401
    return-object p2
.end method
