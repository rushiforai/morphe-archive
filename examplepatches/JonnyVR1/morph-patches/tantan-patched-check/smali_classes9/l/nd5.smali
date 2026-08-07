.class public Ll/nd5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/frl;


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public final j:Lcom/p1/mobile/android/app/Act;

.field public final k:I

.field public final l:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public m:J

.field public n:Ljava/lang/String;

.field public o:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public q:Ll/lib0;

.field public r:Lcom/p1/mobile/putong/data/PayMethod;

.field public s:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/nd5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd5;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/nd5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd5;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/nd5;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd5;->v(Ll/y20;)V

    return-void
.end method

.method public static synthetic j(Ll/nd5;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nd5;->y(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/nd5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nd5;->w()V

    return-void
.end method

.method public static bridge synthetic l(Ll/nd5;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/nd5;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/nd5;->k:I

    return p0
.end method

.method public static bridge synthetic n(Ll/nd5;)Lcom/p1/mobile/putong/data/PayMethod;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd5;->r:Lcom/p1/mobile/putong/data/PayMethod;

    return-object p0
.end method

.method public static bridge synthetic o(Ll/nd5;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd5;->n:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic p(Ll/nd5;)Ll/a30;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd5;->o:Ll/a30;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/nd5;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd5;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method

.method private s()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nd5;->p:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/nd5;->p:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Ll/nd5;->p:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method


# virtual methods
.method public final A(Ll/y20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/nd5;->s()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mf()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/16 v2, 0x19

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget v1, p0, Ll/nd5;->k:I

    .line 25
    .line 26
    if-ne v1, v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/nd5;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v2, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v3, Ll/id5;

    .line 56
    .line 57
    invoke-direct {v3, p0, p1}, Ll/id5;-><init>(Ll/nd5;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    new-instance p1, Ll/jd5;

    .line 61
    .line 62
    invoke-direct {p1, p0}, Ll/jd5;-><init>(Ll/nd5;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v1, v2, v0, v3, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ll/x20;Ll/x20;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 76
    .line 77
    new-instance v3, Ll/do60;

    .line 78
    .line 79
    iget-object v4, p0, Ll/nd5;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 80
    .line 81
    invoke-direct {v3, v4}, Ll/do60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v1}, Ll/do60;->h(Ljava/lang/String;)Ll/do60;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    invoke-virtual {v3, v4}, Ll/do60;->l(I)Ll/do60;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    iget v4, p0, Ll/nd5;->k:I

    .line 97
    .line 98
    invoke-virtual {v3, v4}, Ll/do60;->d(I)Ll/do60;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v3}, Ll/do60;->a()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    iget-object v4, p0, Ll/nd5;->q:Ll/lib0;

    .line 107
    .line 108
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_2

    .line 113
    .line 114
    iget-object v4, p0, Ll/nd5;->q:Ll/lib0;

    .line 115
    .line 116
    invoke-virtual {v4}, Ll/lib0;->n()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/data/PaymentParam;->setPurchaseTrackId(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    new-instance v4, Ll/qeb0;

    .line 124
    .line 125
    invoke-direct {v4}, Ll/qeb0;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4, v3}, Ll/qeb0;->b(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Ll/qeb0;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    new-instance v4, Ll/nd5$a;

    .line 133
    .line 134
    invoke-direct {v4, p0, v0, v1, p1}, Ll/nd5$a;-><init>(Ll/nd5;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;Ll/y20;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3, v4}, Ll/qeb0;->c(Ll/bn50;)Ll/qeb0;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Ll/qeb0;->a()Ll/peb0;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iget-object v3, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    iget-object v4, p0, Ll/nd5;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 148
    .line 149
    iget-object v5, p0, Ll/nd5;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 150
    .line 151
    invoke-static {v3, v4, v5, p1}, Ll/a5i0;->B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/peb0;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 159
    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 161
    .line 162
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 163
    .line 164
    iget-object p1, p0, Ll/nd5;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 165
    .line 166
    const-string v5, "alipay"

    .line 167
    .line 168
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_3

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_3
    iget-object p1, p0, Ll/nd5;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 176
    .line 177
    const-string v5, "wechat"

    .line 178
    .line 179
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_4

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_4
    const-string v5, ""

    .line 187
    .line 188
    :goto_0
    new-instance p1, Ljava/util/HashMap;

    .line 189
    .line 190
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 191
    .line 192
    .line 193
    iget v6, p0, Ll/nd5;->k:I

    .line 194
    .line 195
    if-ne v6, v2, :cond_5

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget v0, v0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 202
    .line 203
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    const-string v2, "coin_price"

    .line 208
    .line 209
    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    :cond_5
    const-string v0, "skuID"

    .line 213
    .line 214
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    const-string v0, "platform"

    .line 218
    .line 219
    invoke-interface {p1, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 223
    .line 224
    invoke-static {v0}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    const-string v1, "purchaseShowFrom"

    .line 229
    .line 230
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    const-string v0, "price"

    .line 234
    .line 235
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    const/4 v0, 0x0

    .line 243
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    const-string v1, "fold"

    .line 248
    .line 249
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    iget-object p0, p0, Ll/nd5;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 253
    .line 254
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    const-string v0, "productType"

    .line 263
    .line 264
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    if-eqz p0, :cond_6

    .line 280
    .line 281
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 282
    .line 283
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 284
    .line 285
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->E3()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    const-string v0, "no_secret_payment"

    .line 290
    .line 291
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 295
    .line 296
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 297
    .line 298
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->D3()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    const-string v0, "user_secret_staus"

    .line 303
    .line 304
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    :cond_6
    const-string p0, "e_purchase_button"

    .line 308
    .line 309
    const-string v0, "p_purchase_page"

    .line 310
    .line 311
    invoke-static {p0, v0, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 312
    .line 313
    .line 314
    return-void
.end method

.method public final B()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_purchase_intermediate_page"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "tooltips_trigger_mode"

    .line 16
    .line 17
    const-string v2, "active"

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "purchaseShowFrom"

    .line 30
    .line 31
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, p0, Ll/nd5;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-string v4, "productType"

    .line 46
    .line 47
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v4, "skuID"

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/nd5;->t()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    filled-new-array {v1, v2, v3, v4}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Ll/bo60;

    .line 69
    .line 70
    iget-object v2, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/nd5;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object p0, p0, Ll/nd5;->s:Ll/y20;

    .line 82
    .line 83
    invoke-virtual {v1, p0}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance v1, Ll/ld5;

    .line 88
    .line 89
    invoke-direct {v1, v0}, Ll/ld5;-><init>(Ll/l4g0;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v1}, Ll/bo60;->p(Landroid/content/DialogInterface$OnDismissListener;)Ll/bo60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v1, "coin"

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Ll/bo60;->o(Ljava/lang/String;)Ll/bo60;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 103
    .line 104
    .line 105
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final C()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->b8:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->a8:I

    .line 12
    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->c8:I

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    new-instance v4, Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    invoke-direct {v4, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 39
    .line 40
    iget-object v5, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    sget v6, Ll/h9c0;->l:I

    .line 43
    .line 44
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-direct {v1, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 49
    .line 50
    .line 51
    new-instance v5, Ll/nd5$b;

    .line 52
    .line 53
    invoke-direct {v5, p0, v2}, Ll/nd5$b;-><init>(Ll/nd5;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    add-int/2addr v2, v3

    .line 61
    const/16 v6, 0x21

    .line 62
    .line 63
    invoke-virtual {v4, v5, v3, v2, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/2addr v0, v3

    .line 71
    invoke-virtual {v4, v1, v3, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/nd5;->i:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/nd5;->i:Lv/VText;

    .line 80
    .line 81
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final D()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nd5;->c:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->R9:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nd5;->b:Lv/VImage;

    .line 9
    .line 10
    sget v1, Ll/jbc0;->da:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    const-string v0, "alipay"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/nd5;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Oo()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->oc()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/nd5;->d:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/nd5;->d:Lv/VText;

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    iget-object p0, p0, Ll/nd5;->d:Lv/VText;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final E()V
    .locals 2

    .line 1
    iget v0, p0, Ll/nd5;->k:I

    .line 2
    .line 3
    const/16 v1, 0x19

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/nd5;->f:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nd5;->f:Landroid/widget/TextView;

    .line 14
    .line 15
    new-instance v1, Ll/kd5;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/kd5;-><init>(Ll/nd5;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public F(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nd5;->o:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public G(Ll/lib0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nd5;->q:Ll/lib0;

    .line 2
    .line 3
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->y2:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/nd5;->r(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/nd5;->c:Lv/VText;

    .line 18
    .line 19
    const/4 p2, 0x3

    .line 20
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, p2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/nd5;->p:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    iget p1, p0, Ll/nd5;->k:I

    .line 4
    .line 5
    const/16 v0, 0x19

    .line 6
    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mf()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-direct {p0}, Ll/nd5;->s()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/nd5;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/nd5;->h:Lv/VText;

    .line 34
    .line 35
    const-string p1, "\u7acb\u5373\u8d2d\u4e70"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p1, p0, Ll/nd5;->h:Lv/VText;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/nd5;->s()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-direct {p0}, Ll/nd5;->s()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "\u7acb\u5373\u8d2d\u4e70 %s%s"

    .line 64
    .line 65
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/nd5;->C()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nd5;->D()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nd5;->E()V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/nd5;->a:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    new-instance v0, Ll/gd5;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/gd5;-><init>(Ll/nd5;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Ll/nd5;->g:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    new-instance v0, Ll/hd5;

    .line 23
    .line 24
    invoke-direct {v0, p0, p1}, Ll/hd5;-><init>(Ll/nd5;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public e(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/nd5;->m:J

    .line 2
    .line 3
    return-void
.end method

.method public final r(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/od5;->a(Ll/nd5;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nd5;->s()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-wide v1, p0, Ll/nd5;->m:J

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 12
    .line 13
    int-to-long p0, p0

    .line 14
    cmp-long p0, v1, p0

    .line 15
    .line 16
    if-ltz p0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    return v0
.end method

.method public final synthetic v(Ll/y20;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nd5;->o:Ll/a30;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/nd5;->o:Ll/a30;

    .line 15
    .line 16
    iget-object v1, p0, Ll/nd5;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    iget-object v2, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    iget-object v3, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {v0, v1, v2, v3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    const-string p1, "p_suggest_users_home_view,e_superlike,click"

    .line 34
    .line 35
    iget-object v0, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    const-string p1, "p_home,superlike"

    .line 44
    .line 45
    iget-object p0, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_1

    .line 52
    .line 53
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->fa:I

    .line 54
    .line 55
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public final synthetic w()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    const-string p0, "\u8d2d\u4e70\u5931\u8d25"

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nd5;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd5;->A(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/nd5;->j:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p0, p0, Ll/nd5;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p1, v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Uh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
