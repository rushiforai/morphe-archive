.class public final Ll/sp60;
.super Ll/r4;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\'\u0010\u001c\u001a\u00020\u00182\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001aH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\"\u0010#\u001a\u0004\u0008$\u0010%\u00a8\u0006&"
    }
    d2 = {
        "Ll/sp60;",
        "Ll/r4;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "Ll/fq60;",
        "request",
        "",
        "e",
        "(Ll/fq60;)Z",
        "Ll/gq60;",
        "response",
        "",
        "b",
        "(Ll/fq60;Ll/gq60;)V",
        "h",
        "(Ll/fq60;)Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandise",
        "",
        "price",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "detail",
        "i",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;DLcom/p1/mobile/putong/core/ui/purchase/d$a;)D",
        "c",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "d",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
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
.field public final c:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
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
    invoke-direct {p0, p3}, Ll/r4;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/sp60;->c:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Ll/fq60;Ll/gq60;)V
    .locals 6
    .param p1    # Ll/fq60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/gq60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    invoke-virtual {p1}, Ll/fq60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-string v0, "\u786e\u8ba4\u534f\u8bae\u5e76\u652f\u4ed8"

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v2, 0x1

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Ll/joa;->f4()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 52
    .line 53
    iget-object v0, p0, Ll/sp60;->c:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->u1:I

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 65
    .line 66
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    goto :goto_2

    .line 91
    :cond_1
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 92
    .line 93
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_3

    .line 98
    .line 99
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 100
    .line 101
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 109
    .line 110
    invoke-static {v0}, Ll/z090;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_3
    :goto_0
    invoke-virtual {p2, v2}, Ll/gq60;->m(Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ll/fq60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Ll/r4;->g(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-eqz v2, :cond_4

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 140
    .line 141
    .line 142
    move-result-wide v2

    .line 143
    goto :goto_1

    .line 144
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 149
    .line 150
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 151
    .line 152
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 153
    .line 154
    :goto_1
    invoke-virtual {p0}, Ll/r4;->d()Ljava/text/NumberFormat;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    const/4 v5, 0x2

    .line 159
    invoke-virtual {v4, v5}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ll/r4;->d()Ljava/text/NumberFormat;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v4, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 171
    .line 172
    .line 173
    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 174
    .line 175
    sget-object v3, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object v4, p0, Ll/sp60;->c:Lcom/p1/mobile/android/app/Act;

    .line 182
    .line 183
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->b:I

    .line 184
    .line 185
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    filled-new-array {v0, v2, v4}, [Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    const/4 v2, 0x3

    .line 194
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    const-string v2, "%s%s %s"

    .line 199
    .line 200
    invoke-static {v3, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    :goto_2
    invoke-virtual {p2, v0}, Ll/gq60;->p(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 208
    .line 209
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_7

    .line 214
    .line 215
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 216
    .line 217
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-nez v0, :cond_7

    .line 222
    .line 223
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 224
    .line 225
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_5

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_5
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 233
    .line 234
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-nez v0, :cond_6

    .line 239
    .line 240
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 241
    .line 242
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_6

    .line 247
    .line 248
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 249
    .line 250
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_8

    .line 255
    .line 256
    :cond_6
    const-string v1, "\u9650\u65f6\u7279\u60e0"

    .line 257
    .line 258
    goto :goto_4

    .line 259
    :cond_7
    :goto_3
    const-string v1, "\u9650\u65f6\u4f18\u60e0"

    .line 260
    .line 261
    :cond_8
    :goto_4
    invoke-virtual {p2, v1}, Ll/gq60;->n(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 265
    .line 266
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-nez v0, :cond_a

    .line 271
    .line 272
    iget-object v0, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 273
    .line 274
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    if-eqz v0, :cond_9

    .line 279
    .line 280
    goto :goto_5

    .line 281
    :cond_9
    return-void

    .line 282
    :cond_a
    :goto_5
    invoke-virtual {p0, p1}, Ll/sp60;->h(Ll/fq60;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-virtual {p2, p0}, Ll/gq60;->o(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    return-void
.end method

.method public e(Ll/fq60;)Z
    .locals 0
    .param p1    # Ll/fq60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x1

    return p0
.end method

.method public final h(Ll/fq60;)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/fq60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/r4;->g(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    const-string v3, "oDiamond"

    .line 16
    .line 17
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const-string v3, ""

    .line 22
    .line 23
    if-nez v2, :cond_7

    .line 24
    .line 25
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    const-string v4, "platinum"

    .line 28
    .line 29
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_7

    .line 34
    .line 35
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    const-string v4, "privateCustom"

    .line 38
    .line 39
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_7

    .line 44
    .line 45
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 46
    .line 47
    const-string v4, "oDiamondPrivateCustom"

    .line 48
    .line 49
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_0

    .line 54
    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_0
    invoke-static {v0}, Ll/pta;->v(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    return-object v3

    .line 64
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    invoke-static {v2}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_2

    .line 77
    .line 78
    iget-object v2, p0, Ll/sp60;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    invoke-static {v2}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_2

    .line 85
    .line 86
    return-object v3

    .line 87
    :cond_2
    invoke-virtual {p0}, Ll/r4;->f()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/fq60;->a()Lcom/p1/mobile/putong/data/PayMethod;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string v2, "alipay"

    .line 98
    .line 99
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_3

    .line 104
    .line 105
    return-object v3

    .line 106
    :cond_3
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 109
    .line 110
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 111
    .line 112
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 113
    .line 114
    check-cast p1, Ljava/util/Collection;

    .line 115
    .line 116
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_4

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 123
    .line 124
    .line 125
    move-result-wide v4

    .line 126
    const-wide/16 v6, 0x0

    .line 127
    .line 128
    cmpl-double p1, v4, v6

    .line 129
    .line 130
    if-lez p1, :cond_4

    .line 131
    .line 132
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 133
    .line 134
    .line 135
    move-result-wide v2

    .line 136
    :cond_4
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 137
    .line 138
    const-string v4, "femaleVip"

    .line 139
    .line 140
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-nez p1, :cond_6

    .line 145
    .line 146
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 147
    .line 148
    const-string v4, "youthVip"

    .line 149
    .line 150
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_5

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d()D

    .line 158
    .line 159
    .line 160
    move-result-wide v4

    .line 161
    iget p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 162
    .line 163
    int-to-double v6, p1

    .line 164
    mul-double/2addr v4, v6

    .line 165
    sub-double/2addr v4, v2

    .line 166
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    .line 167
    .line 168
    .line 169
    move-result-wide v1

    .line 170
    goto :goto_1

    .line 171
    :cond_6
    :goto_0
    invoke-virtual {p0, v1, v2, v3, v0}, Ll/sp60;->i(Lcom/p1/mobile/putong/core/data/Merchandise;DLcom/p1/mobile/putong/core/ui/purchase/d$a;)D

    .line 172
    .line 173
    .line 174
    move-result-wide v1

    .line 175
    :goto_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p0}, Ll/r4;->d()Ljava/text/NumberFormat;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 203
    .line 204
    iget-object p0, p0, Ll/sp60;->c:Lcom/p1/mobile/android/app/Act;

    .line 205
    .line 206
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W6:I

    .line 207
    .line 208
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    const/4 v0, 0x1

    .line 216
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    return-object p0

    .line 229
    :cond_7
    :goto_2
    return-object v3
.end method

.method public final i(Lcom/p1/mobile/putong/core/data/Merchandise;DLcom/p1/mobile/putong/core/ui/purchase/d$a;)D
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 16
    .line 17
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 18
    .line 19
    sub-double/2addr p0, p2

    .line 20
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    return-wide p0

    .line 25
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 26
    .line 27
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 28
    .line 29
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    int-to-double v0, p4

    .line 34
    mul-double/2addr p0, v0

    .line 35
    sub-double/2addr p0, p2

    .line 36
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    return-wide p0

    .line 41
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 44
    .line 45
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 46
    .line 47
    sub-double/2addr p0, p2

    .line 48
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide p0

    .line 52
    return-wide p0
.end method
