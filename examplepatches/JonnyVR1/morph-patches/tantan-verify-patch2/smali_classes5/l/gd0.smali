.class public final Ll/gd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tol;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\r\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/gd0;",
        "Ll/tol;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "Ll/bd0;",
        "requestData",
        "",
        "b",
        "(Ll/bd0;)Z",
        "",
        "a",
        "(Ll/bd0;)Ljava/lang/CharSequence;",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "c",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/gd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Ll/gd0;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Ll/bd0;)Ljava/lang/CharSequence;
    .locals 8
    .param p1    # Ll/bd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/bd0;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->q()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->o()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    invoke-static {v4}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-nez v4, :cond_0

    .line 27
    .line 28
    iget-object v4, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    invoke-static {v4}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    :cond_0
    iget-object v4, p0, Ll/gd0;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v4}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/gd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->H1:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_1
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    const-string v5, "#.#"

    .line 65
    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    iget-object v4, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 69
    .line 70
    invoke-static {v4}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_2

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-static {v4}, Ll/v5b0;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    if-eqz v4, :cond_2

    .line 95
    .line 96
    iget-object p0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 101
    .line 102
    new-instance p1, Ljava/text/DecimalFormat;

    .line 103
    .line 104
    invoke-direct {p1, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 110
    .line 111
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 112
    .line 113
    invoke-virtual {p1, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {p0, p1}, Ll/bn60;->L(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_2
    iget-object v4, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 126
    .line 127
    invoke-static {v4}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_3

    .line 132
    .line 133
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    if-eqz v4, :cond_3

    .line 138
    .line 139
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-eqz v4, :cond_3

    .line 144
    .line 145
    invoke-static {v3}, Ll/v5b0;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_3

    .line 150
    .line 151
    iget-object p0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 156
    .line 157
    new-instance p1, Ljava/text/DecimalFormat;

    .line 158
    .line 159
    invoke-direct {p1, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 165
    .line 166
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 167
    .line 168
    invoke-virtual {p1, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {p0, p1}, Ll/bn60;->L(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    .line 178
    .line 179
    return-object p0

    .line 180
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    const-string v5, "lowPrice3Month"

    .line 193
    .line 194
    const-string v6, "tttVip"

    .line 195
    .line 196
    if-eqz v4, :cond_4

    .line 197
    .line 198
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 199
    .line 200
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 201
    .line 202
    iget-object v7, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 203
    .line 204
    invoke-virtual {v4, v7}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    if-nez v4, :cond_b

    .line 209
    .line 210
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-eqz v4, :cond_b

    .line 219
    .line 220
    const-string v1, "svipPicksMembership"

    .line 221
    .line 222
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const-string v2, "lowPriceSVIPPicks"

    .line 227
    .line 228
    invoke-static {v3, v1, v2}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    iget-object v2, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 233
    .line 234
    if-eqz v1, :cond_5

    .line 235
    .line 236
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    invoke-static {v3, v2, p0, p1}, Ll/bn60;->K(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_5
    invoke-static {v2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    const-string v2, "svip"

    .line 255
    .line 256
    if-eqz v1, :cond_7

    .line 257
    .line 258
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    const-string v4, "lowPriceCustomerSVIP"

    .line 263
    .line 264
    invoke-static {v3, v1, v4}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    if-eqz v1, :cond_7

    .line 269
    .line 270
    invoke-static {v0}, Ll/pta;->v(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_6

    .line 275
    .line 276
    invoke-virtual {p1}, Ll/bd0;->a()Lcom/p1/mobile/putong/data/PayMethod;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    const-string v2, "wechat"

    .line 281
    .line 282
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    if-eqz v1, :cond_6

    .line 287
    .line 288
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 289
    .line 290
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    invoke-static {v3, p0, p1}, Ll/bn60;->I(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :cond_6
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 301
    .line 302
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    invoke-static {v3, p0, v0, p1}, Ll/bn60;->K(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 311
    .line 312
    .line 313
    move-result-object p0

    .line 314
    goto/16 :goto_0

    .line 315
    .line 316
    :cond_7
    iget-object v1, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 317
    .line 318
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    if-eqz v1, :cond_8

    .line 323
    .line 324
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    const-string v2, "lowPriceCustomerUpliftSVIP"

    .line 329
    .line 330
    invoke-static {v3, v1, v2}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    if-eqz v1, :cond_8

    .line 335
    .line 336
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 337
    .line 338
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 343
    .line 344
    .line 345
    move-result p1

    .line 346
    invoke-static {v3, p0, v0, p1}, Ll/bn60;->K(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    goto :goto_0

    .line 351
    :cond_8
    iget-object v1, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 352
    .line 353
    invoke-static {v1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 354
    .line 355
    .line 356
    move-result v1

    .line 357
    if-eqz v1, :cond_9

    .line 358
    .line 359
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    const-string v2, "lowPriceCustomerVIP"

    .line 364
    .line 365
    invoke-static {v3, v1, v2}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    if-eqz v1, :cond_9

    .line 370
    .line 371
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 372
    .line 373
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 378
    .line 379
    .line 380
    move-result p1

    .line 381
    invoke-static {v3, p0, v0, p1}, Ll/bn60;->K(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    goto :goto_0

    .line 386
    :cond_9
    iget-object v1, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 387
    .line 388
    invoke-static {v1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 389
    .line 390
    .line 391
    move-result v1

    .line 392
    if-eqz v1, :cond_a

    .line 393
    .line 394
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 395
    .line 396
    .line 397
    move-result v1

    .line 398
    if-eqz v1, :cond_a

    .line 399
    .line 400
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    invoke-static {v3, v1, v5}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    if-eqz v1, :cond_a

    .line 409
    .line 410
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 411
    .line 412
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 417
    .line 418
    .line 419
    move-result p1

    .line 420
    invoke-static {v3, p0, v0, p1}, Ll/bn60;->K(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    goto :goto_0

    .line 425
    :cond_a
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 432
    .line 433
    .line 434
    move-result p1

    .line 435
    invoke-static {p0, v0, p1}, Ll/bn60;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 436
    .line 437
    .line 438
    move-result-object p0

    .line 439
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 440
    .line 441
    .line 442
    return-object p0

    .line 443
    :cond_b
    iget-object v4, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 444
    .line 445
    invoke-static {v4}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 446
    .line 447
    .line 448
    move-result v4

    .line 449
    if-eqz v4, :cond_c

    .line 450
    .line 451
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 452
    .line 453
    .line 454
    move-result v4

    .line 455
    if-eqz v4, :cond_c

    .line 456
    .line 457
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 458
    .line 459
    .line 460
    move-result-object v4

    .line 461
    invoke-static {v3, v4, v5}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 462
    .line 463
    .line 464
    move-result v4

    .line 465
    if-eqz v4, :cond_c

    .line 466
    .line 467
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 468
    .line 469
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 474
    .line 475
    .line 476
    move-result p1

    .line 477
    invoke-static {v3, p0, v0, p1}, Ll/bn60;->K(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 478
    .line 479
    .line 480
    move-result-object p0

    .line 481
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 482
    .line 483
    .line 484
    return-object p0

    .line 485
    :cond_c
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 486
    .line 487
    .line 488
    move-result-object v4

    .line 489
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 490
    .line 491
    .line 492
    move-result-object v4

    .line 493
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->K4()Z

    .line 494
    .line 495
    .line 496
    move-result v4

    .line 497
    if-eqz v4, :cond_d

    .line 498
    .line 499
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 500
    .line 501
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 506
    .line 507
    .line 508
    move-result p1

    .line 509
    invoke-static {p0, v0, p1}, Ll/bn60;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 510
    .line 511
    .line 512
    move-result-object p0

    .line 513
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 514
    .line 515
    .line 516
    return-object p0

    .line 517
    :cond_d
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 518
    .line 519
    .line 520
    move-result-object v4

    .line 521
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 522
    .line 523
    .line 524
    move-result-object v4

    .line 525
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 526
    .line 527
    .line 528
    move-result v4

    .line 529
    iget-object v5, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 530
    .line 531
    if-eqz v4, :cond_e

    .line 532
    .line 533
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->n()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object p0

    .line 537
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 538
    .line 539
    .line 540
    move-result p1

    .line 541
    invoke-static {v5, p0, p1}, Ll/bn60;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Z)Ljava/lang/CharSequence;

    .line 542
    .line 543
    .line 544
    move-result-object p0

    .line 545
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 546
    .line 547
    .line 548
    return-object p0

    .line 549
    :cond_e
    invoke-static {v5}, Ll/wib0;->r(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 550
    .line 551
    .line 552
    move-result p1

    .line 553
    iget-object v0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 554
    .line 555
    if-eqz p1, :cond_11

    .line 556
    .line 557
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 558
    .line 559
    .line 560
    move-result p1

    .line 561
    if-nez p1, :cond_10

    .line 562
    .line 563
    iget-object p1, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 564
    .line 565
    invoke-static {p1}, Ll/wib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 566
    .line 567
    .line 568
    move-result p1

    .line 569
    if-eqz p1, :cond_f

    .line 570
    .line 571
    goto :goto_1

    .line 572
    :cond_f
    iget-object p0, p0, Ll/gd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 573
    .line 574
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->N8:I

    .line 575
    .line 576
    iget v0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 577
    .line 578
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object p0

    .line 590
    goto :goto_2

    .line 591
    :cond_10
    :goto_1
    iget-object p0, p0, Ll/gd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 592
    .line 593
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->O8:I

    .line 594
    .line 595
    iget v0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 596
    .line 597
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object p0

    .line 609
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 610
    .line 611
    .line 612
    return-object p0

    .line 613
    :cond_11
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 614
    .line 615
    .line 616
    move-result p1

    .line 617
    if-nez p1, :cond_13

    .line 618
    .line 619
    iget-object p1, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 620
    .line 621
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 622
    .line 623
    .line 624
    move-result p1

    .line 625
    if-nez p1, :cond_13

    .line 626
    .line 627
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 628
    .line 629
    iget-object v0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 630
    .line 631
    if-ne p1, v0, :cond_12

    .line 632
    .line 633
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 634
    .line 635
    .line 636
    move-result-object p1

    .line 637
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 638
    .line 639
    .line 640
    move-result-object p1

    .line 641
    invoke-interface {p1}, Ll/r97;->c()Z

    .line 642
    .line 643
    .line 644
    move-result p1

    .line 645
    if-eqz p1, :cond_12

    .line 646
    .line 647
    goto :goto_3

    .line 648
    :cond_12
    iget-object p0, p0, Ll/gd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 649
    .line 650
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->L8:I

    .line 651
    .line 652
    iget v0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 653
    .line 654
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v0

    .line 658
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 663
    .line 664
    .line 665
    move-result-object p0

    .line 666
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 667
    .line 668
    .line 669
    return-object p0

    .line 670
    :cond_13
    :goto_3
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 671
    .line 672
    iget-object v0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 673
    .line 674
    if-ne p1, v0, :cond_14

    .line 675
    .line 676
    goto :goto_4

    .line 677
    :cond_14
    move-object v1, v2

    .line 678
    :goto_4
    iget-object p0, p0, Ll/gd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 679
    .line 680
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->M8:I

    .line 681
    .line 682
    iget v0, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 683
    .line 684
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 685
    .line 686
    .line 687
    move-result-object v0

    .line 688
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 689
    .line 690
    .line 691
    move-result-object v0

    .line 692
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 693
    .line 694
    .line 695
    move-result-object p0

    .line 696
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 697
    .line 698
    .line 699
    return-object p0
.end method

.method public b(Ll/bd0;)Z
    .locals 2
    .param p1    # Ll/bd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ll/v5b0;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    return v1

    .line 44
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 61
    .line 62
    iget-object p0, p0, Ll/gd0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 63
    .line 64
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/4 p0, 0x0

    .line 72
    return p0

    .line 73
    :cond_2
    :goto_0
    return v1
.end method
