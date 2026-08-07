.class public Ll/ihj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l3m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ihj$b;
    }
.end annotation


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Landroidx/legacy/widget/Space;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VPager;

.field public i:Lv/VPagerCircleIndicator;

.field public j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

.field public final k:Lcom/p1/mobile/android/app/Act;

.field public final l:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final m:Ljava/lang/String;

.field public n:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public o:Ll/ihj$b;

.field public p:Ll/kcg0;

.field public q:Z

.field public r:Lcom/p1/mobile/putong/core/data/Privilege;

.field public s:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 17
    iput-object p2, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    iput-object p3, p0, Ll/ihj;->m:Ljava/lang/String;

    .line 19
    iput-boolean p4, p0, Ll/ihj;->q:Z

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ihj;->m:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/ihj;->q:Z

    .line 11
    .line 12
    iput-object p5, p0, Ll/ihj;->r:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic d(Ll/ihj;Ljava/util/List;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ihj;->m(Ljava/util/List;Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/ihj;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihj;->p:Ll/kcg0;

    return-object p0
.end method

.method private h()Ljava/lang/CharSequence;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Y6:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o6:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 48
    .line 49
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object p0, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p3:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method

.method private k()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/ihj;->h()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-nez v1, :cond_6

    .line 12
    .line 13
    iget-object v1, p0, Ll/ihj;->e:Lv/VText;

    .line 14
    .line 15
    const-string v3, "sans-serif"

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-static {v3, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    if-ne v1, v3, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Ll/ihj;->e:Lv/VText;

    .line 33
    .line 34
    const/high16 v2, 0x41a80000    # 21.0f

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ihj;->e:Lv/VText;

    .line 40
    .line 41
    const-string v2, "#fde5ac"

    .line 42
    .line 43
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/ihj;->e:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/ihj;->c:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 61
    .line 62
    sget v2, Ll/jbc0;->u2:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 68
    .line 69
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/ihj;->f:Lv/VText;

    .line 73
    .line 74
    const-string v2, "#80edd7a3"

    .line 75
    .line 76
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-static {v1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_1

    .line 89
    .line 90
    iget-object v1, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 91
    .line 92
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 97
    .line 98
    const/high16 v3, 0x41900000    # 18.0f

    .line 99
    .line 100
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 105
    .line 106
    const/high16 v3, 0x42300000    # 44.0f

    .line 107
    .line 108
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 113
    .line 114
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 115
    .line 116
    iget-object v3, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 117
    .line 118
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 122
    .line 123
    sget v3, Ll/jbc0;->X2:I

    .line 124
    .line 125
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 129
    .line 130
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/ihj;->e:Lv/VText;

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_1
    iget-object v1, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 140
    .line 141
    invoke-static {v1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-object v1, p0, Ll/ihj;->d:Landroid/widget/ImageView;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 150
    .line 151
    .line 152
    :cond_2
    :goto_0
    iget-object v1, p0, Ll/ihj;->f:Lv/VText;

    .line 153
    .line 154
    invoke-static {v1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-interface {v1}, Ll/r97;->B()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    const/4 v2, 0x0

    .line 170
    if-eqz v1, :cond_4

    .line 171
    .line 172
    iget-object v1, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 173
    .line 174
    invoke-static {v1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_4

    .line 179
    .line 180
    iget-object v1, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 181
    .line 182
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->see_chat_request_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 191
    .line 192
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v1, :cond_3

    .line 197
    .line 198
    add-int/lit8 v2, v2, -0x1

    .line 199
    .line 200
    :cond_3
    iget-object v1, p0, Ll/ihj;->f:Lv/VText;

    .line 201
    .line 202
    iget-object v3, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 203
    .line 204
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->v6:I

    .line 205
    .line 206
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1}, Ll/j49;->f()Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 235
    .line 236
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 237
    .line 238
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;->yi(Lcom/p1/mobile/putong/data/User;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    iget-object v3, p0, Ll/ihj;->f:Lv/VText;

    .line 247
    .line 248
    if-eqz v1, :cond_5

    .line 249
    .line 250
    iget-object v1, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 251
    .line 252
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->v6:I

    .line 253
    .line 254
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    iget-object v4, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 259
    .line 260
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

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
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    goto :goto_1

    .line 284
    :cond_5
    iget-object v1, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 285
    .line 286
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->v6:I

    .line 287
    .line 288
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    iget-object v4, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 293
    .line 294
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 315
    .line 316
    .line 317
    :goto_1
    iget-object v1, p0, Ll/ihj;->e:Lv/VText;

    .line 318
    .line 319
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 320
    .line 321
    .line 322
    iget-object p0, p0, Ll/ihj;->c:Landroid/widget/LinearLayout;

    .line 323
    .line 324
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :cond_6
    iget-object p0, p0, Ll/ihj;->c:Landroid/widget/LinearLayout;

    .line 329
    .line 330
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 331
    .line 332
    .line 333
    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/rec0;->I2:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/ihj;->f(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ihj;->f:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/ihj;->g(Z)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Ll/ihj;->k()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ihj;->l()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/ihj;->s:Landroid/view/View;

    .line 32
    .line 33
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ihj;->n:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    if-ne v0, v3, :cond_0

    .line 22
    .line 23
    iget-boolean v0, p0, Ll/ihj;->q:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/ihj;->h:Lv/VPager;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ihj;->a:Lv/AutoVDraweeView;

    .line 33
    .line 34
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVGUFFFU08yUzdYUFdNVVhITU5HR1paNjJHVVhTVzExIiwidyI6MTA3NywiaCI6ODY0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6ODgxMzQ5MTQ1Nzc5OX0.png"

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ihj;->a:Lv/AutoVDraweeView;

    .line 40
    .line 41
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Ll/ihj;->h:Lv/VPager;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 64
    .line 65
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 66
    .line 67
    if-ne v0, v3, :cond_1

    .line 68
    .line 69
    iget-boolean v0, p0, Ll/ihj;->q:Z

    .line 70
    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Ll/ihj;->c:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    const/16 v3, 0x10

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/ihj;->h:Lv/VPager;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/ihj;->a:Lv/AutoVDraweeView;

    .line 86
    .line 87
    sget v3, Ll/jbc0;->r9:I

    .line 88
    .line 89
    invoke-virtual {v0, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/ihj;->a:Lv/AutoVDraweeView;

    .line 93
    .line 94
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/ihj;->e:Lv/VText;

    .line 98
    .line 99
    const-string v3, "#ffffff"

    .line 100
    .line 101
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/ihj;->f:Lv/VText;

    .line 109
    .line 110
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object v0, p0, Ll/ihj;->p:Ll/kcg0;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    iget-object v0, p0, Ll/ihj;->p:Ll/kcg0;

    .line 126
    .line 127
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 128
    .line 129
    .line 130
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    const/4 v3, 0x0

    .line 135
    if-le v0, v2, :cond_5

    .line 136
    .line 137
    const-wide/16 v4, 0x5

    .line 138
    .line 139
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 140
    .line 141
    invoke-static {v4, v5, v1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-virtual {v1, v4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    new-instance v4, Ll/hhj;

    .line 158
    .line 159
    invoke-direct {v4, p0, p1}, Ll/hhj;-><init>(Ll/ihj;Ljava/util/List;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iput-object v1, p0, Ll/ihj;->p:Ll/kcg0;

    .line 171
    .line 172
    iget-object v1, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 173
    .line 174
    const/4 v4, 0x5

    .line 175
    if-le v0, v4, :cond_3

    .line 176
    .line 177
    move v5, v2

    .line 178
    goto :goto_0

    .line 179
    :cond_3
    move v5, v3

    .line 180
    :goto_0
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 184
    .line 185
    if-gt v0, v4, :cond_4

    .line 186
    .line 187
    move v0, v2

    .line 188
    goto :goto_1

    .line 189
    :cond_4
    move v0, v3

    .line 190
    :goto_1
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_5
    iput-object v1, p0, Ll/ihj;->p:Ll/kcg0;

    .line 195
    .line 196
    iget-object v0, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 197
    .line 198
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 202
    .line 203
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 204
    .line 205
    .line 206
    :goto_2
    iget-object v0, p0, Ll/ihj;->h:Lv/VPager;

    .line 207
    .line 208
    new-instance v1, Ll/ihj$a;

    .line 209
    .line 210
    invoke-direct {v1, p0}, Ll/ihj$a;-><init>(Ll/ihj;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ll/ihj;->o:Ll/ihj$b;

    .line 217
    .line 218
    invoke-virtual {v0, p1}, Ll/ihj$b;->v(Ljava/util/List;)V

    .line 219
    .line 220
    .line 221
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-lez v0, :cond_7

    .line 226
    .line 227
    iget-object v0, p0, Ll/ihj;->r:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 228
    .line 229
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 230
    .line 231
    if-ne v0, v1, :cond_7

    .line 232
    .line 233
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-ge v3, v0, :cond_7

    .line 238
    .line 239
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    check-cast v0, Ll/a690;

    .line 244
    .line 245
    invoke-virtual {v0}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iget-object v1, p0, Ll/ihj;->r:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 250
    .line 251
    if-ne v0, v1, :cond_6

    .line 252
    .line 253
    iget-object p0, p0, Ll/ihj;->h:Lv/VPager;

    .line 254
    .line 255
    invoke-virtual {p0, v3, v2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 260
    .line 261
    goto :goto_3

    .line 262
    :cond_7
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nhj;->a(Ll/ihj;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Z)V
    .locals 6

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iget-object v2, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    if-ne v1, v2, :cond_2

    .line 12
    .line 13
    iget-object v1, p0, Ll/ihj;->b:Landroidx/legacy/widget/Space;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 20
    .line 21
    invoke-static {}, Ll/bnl0;->w0()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/16 v3, 0x500

    .line 26
    .line 27
    if-gt v2, v3, :cond_0

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    .line 32
    .line 33
    int-to-double v4, v0

    .line 34
    mul-double/2addr v4, v2

    .line 35
    double-to-int v2, v4

    .line 36
    :goto_0
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 37
    .line 38
    iget-object v2, p0, Ll/ihj;->b:Landroidx/legacy/widget/Space;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/ihj;->h:Lv/VPager;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 50
    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    const/16 p1, 0x1c

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const/16 p1, 0x21

    .line 57
    .line 58
    :goto_1
    mul-int/2addr p1, v0

    .line 59
    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 60
    .line 61
    iget-object p0, p0, Ll/ihj;->h:Lv/VPager;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    if-nez p1, :cond_3

    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    iget-object p1, p0, Ll/ihj;->h:Lv/VPager;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 77
    .line 78
    mul-int/lit8 v0, v0, 0x12

    .line 79
    .line 80
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 81
    .line 82
    iget-object p0, p0, Ll/ihj;->h:Lv/VPager;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ihj;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/ihj;->f:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ihj;->b:Landroidx/legacy/widget/Space;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final l()V
    .locals 5

    .line 1
    new-instance v0, Ll/ihj$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ihj;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    iget-object v3, p0, Ll/ihj;->m:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v4, p0, Ll/ihj;->q:Z

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Ll/ihj$b;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/ihj;->o:Ll/ihj$b;

    .line 15
    .line 16
    iget-object v1, p0, Ll/ihj;->h:Lv/VPager;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 22
    .line 23
    iget-object v1, p0, Ll/ihj;->h:Lv/VPager;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 29
    .line 30
    iget-object v1, p0, Ll/ihj;->h:Lv/VPager;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/ihj;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    iget-object v2, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 40
    .line 41
    if-ne v0, v1, :cond_0

    .line 42
    .line 43
    const v0, 0x26ffdea2

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setNormalColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 50
    .line 51
    const/16 v2, -0x215e

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/high16 v0, 0x26000000

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setNormalColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 78
    .line 79
    const/16 v2, -0x30b8

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/ihj;->i:Lv/VPagerCircleIndicator;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 92
    .line 93
    .line 94
    :goto_0
    iget-object p0, p0, Ll/ihj;->j:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic m(Ljava/util/List;Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/ihj;->h:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x1

    .line 12
    sub-int/2addr p1, v0

    .line 13
    iget-object p0, p0, Ll/ihj;->h:Lv/VPager;

    .line 14
    .line 15
    if-ne p2, p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    add-int/2addr p1, v0

    .line 27
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ihj;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ihj;->p:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/ihj;->p:Ll/kcg0;

    .line 16
    .line 17
    :cond_0
    return-void
.end method
