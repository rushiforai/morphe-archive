.class public final Ll/ld0;
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
        "Ll/ld0;",
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
    iput-object p1, p0, Ll/ld0;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Ll/ld0;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Ll/bd0;)Ljava/lang/CharSequence;
    .locals 5
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
    invoke-static {}, Ll/s7a;->f()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 35
    .line 36
    const/4 v1, 0x6

    .line 37
    if-ne v0, v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ll/deh0;->f(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p0, p1}, Ll/deh0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_0
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Ll/v5b0;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    const-string v0, "#.#"

    .line 98
    .line 99
    if-eqz p0, :cond_1

    .line 100
    .line 101
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 110
    .line 111
    new-instance v1, Ljava/text/DecimalFormat;

    .line 112
    .line 113
    invoke-direct {v1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 123
    .line 124
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 125
    .line 126
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p0, p1}, Ll/bn60;->y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    goto :goto_0

    .line 135
    :cond_1
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 144
    .line 145
    new-instance v1, Ljava/text/DecimalFormat;

    .line 146
    .line 147
    invoke-direct {v1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 157
    .line 158
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 159
    .line 160
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-static {p0, p1}, Ll/bn60;->L(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 169
    .line 170
    .line 171
    return-object p0

    .line 172
    :cond_2
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    const-string v1, "svip"

    .line 177
    .line 178
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    const-string v3, "lowPriceCustomerSVIP"

    .line 183
    .line 184
    invoke-static {v0, v2, v3}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    const-string v2, "wechat"

    .line 189
    .line 190
    if-eqz v0, :cond_6

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/bd0;->a()Lcom/p1/mobile/putong/data/PayMethod;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_4

    .line 201
    .line 202
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_3

    .line 207
    .line 208
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 213
    .line 214
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    invoke-static {v0, p0, p1}, Ll/bn60;->u(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    goto :goto_1

    .line 223
    :cond_3
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 228
    .line 229
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    invoke-static {v0, p0, p1}, Ll/bn60;->I(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    goto :goto_1

    .line 238
    :cond_4
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-eqz v0, :cond_5

    .line 243
    .line 244
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 249
    .line 250
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    invoke-static {v0, p0, p1}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    goto :goto_1

    .line 259
    :cond_5
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 264
    .line 265
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    invoke-static {v0, p0, p1}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    .line 275
    .line 276
    return-object p0

    .line 277
    :cond_6
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    const-string v4, "lowPriceCustomerUpliftSVIP"

    .line 286
    .line 287
    invoke-static {v0, v3, v4}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-eqz v0, :cond_a

    .line 292
    .line 293
    invoke-virtual {p1}, Ll/bd0;->a()Lcom/p1/mobile/putong/data/PayMethod;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-eqz v0, :cond_8

    .line 302
    .line 303
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_7

    .line 308
    .line 309
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 314
    .line 315
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    invoke-static {v0, p0, p1}, Ll/bn60;->u(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    goto :goto_2

    .line 324
    :cond_7
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 329
    .line 330
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    invoke-static {v0, p0, p1}, Ll/bn60;->I(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    goto :goto_2

    .line 339
    :cond_8
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_9

    .line 344
    .line 345
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 350
    .line 351
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    invoke-static {v0, p0, p1}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    goto :goto_2

    .line 360
    :cond_9
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 365
    .line 366
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    invoke-static {v0, p0, p1}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 375
    .line 376
    .line 377
    return-object p0

    .line 378
    :cond_a
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_b

    .line 383
    .line 384
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    invoke-static {v1, v0}, Ll/v5b0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    if-eqz v0, :cond_b

    .line 393
    .line 394
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 399
    .line 400
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 401
    .line 402
    .line 403
    move-result p1

    .line 404
    invoke-static {v0, p0, p1}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    goto :goto_3

    .line 409
    :cond_b
    invoke-virtual {p1}, Ll/bd0;->g()Z

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 414
    .line 415
    if-eqz v0, :cond_c

    .line 416
    .line 417
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 418
    .line 419
    .line 420
    move-result p1

    .line 421
    invoke-static {p0, p1}, Ll/bn60;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    goto :goto_3

    .line 426
    :cond_c
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 427
    .line 428
    .line 429
    move-result p1

    .line 430
    invoke-static {p0, p1}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 431
    .line 432
    .line 433
    move-result-object p0

    .line 434
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 435
    .line 436
    .line 437
    return-object p0
.end method

.method public b(Ll/bd0;)Z
    .locals 0
    .param p1    # Ll/bd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ld0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    invoke-static {p0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
