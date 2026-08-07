.class public final Ll/fry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hzl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/hzl<",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/fry;",
        "Ll/hzl;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "type",
        "detail",
        "",
        "b",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/fry;->b(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/purchase/d$a;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 v0, 0x1

    .line 28
    const/4 v1, 0x0

    .line 29
    const/4 v2, 0x0

    .line 30
    sparse-switch p2, :sswitch_data_0

    .line 31
    .line 32
    .line 33
    goto/16 :goto_4

    .line 34
    .line 35
    :sswitch_0
    const-string p2, "picksMembership"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_3

    .line 42
    .line 43
    goto/16 :goto_4

    .line 44
    .line 45
    :sswitch_1
    const-string p2, "platinum"

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :sswitch_2
    const-string p2, "undoMembership"

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_3

    .line 62
    .line 63
    goto/16 :goto_4

    .line 64
    .line 65
    :sswitch_3
    const-string p2, "roaming"

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    goto/16 :goto_4

    .line 74
    .line 75
    :sswitch_4
    const-string p2, "quickchatMembership"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_0

    .line 82
    .line 83
    goto/16 :goto_4

    .line 84
    .line 85
    :sswitch_5
    const-string p2, "oDiamondPrivateCustom"

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_3

    .line 92
    .line 93
    goto/16 :goto_4

    .line 94
    .line 95
    :sswitch_6
    const-string p2, "privateCustom"

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_3

    .line 102
    .line 103
    goto/16 :goto_4

    .line 104
    .line 105
    :sswitch_7
    const-string p2, "svip"

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_3

    .line 112
    .line 113
    goto/16 :goto_4

    .line 114
    .line 115
    :sswitch_8
    const-string p2, "svipPicksMembership"

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_3

    .line 122
    .line 123
    goto/16 :goto_4

    .line 124
    .line 125
    :sswitch_9
    const-string p2, "unlimitedSwipes"

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-nez p1, :cond_3

    .line 132
    .line 133
    goto/16 :goto_4

    .line 134
    .line 135
    :sswitch_a
    const-string p2, "oDiamond"

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-nez p1, :cond_3

    .line 142
    .line 143
    goto/16 :goto_4

    .line 144
    .line 145
    :sswitch_b
    const-string p2, "tttVip"

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-nez p1, :cond_0

    .line 152
    .line 153
    goto/16 :goto_4

    .line 154
    .line 155
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_6

    .line 160
    .line 161
    sget-object p1, Ll/e3e;->INSTANCE:Ll/e3e;

    .line 162
    .line 163
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-nez p2, :cond_2

    .line 168
    .line 169
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->G()Z

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    if-eqz p2, :cond_1

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_1
    move p2, v1

    .line 177
    goto :goto_1

    .line 178
    :cond_2
    :goto_0
    move p2, v0

    .line 179
    :goto_1
    invoke-virtual {p1, p0, p2}, Ll/e3e;->d(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d()D

    .line 184
    .line 185
    .line 186
    move-result-wide v3

    .line 187
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    invoke-virtual {p1, p0, v3, v4, v5}, Ll/e3e;->f(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    move-object v6, v2

    .line 196
    move-object v2, p2

    .line 197
    move-object p2, v6

    .line 198
    goto :goto_5

    .line 199
    :sswitch_c
    const-string p2, "superLikeMembership"

    .line 200
    .line 201
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-nez p1, :cond_3

    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-eqz p1, :cond_6

    .line 213
    .line 214
    sget-object p1, Ll/e3e;->INSTANCE:Ll/e3e;

    .line 215
    .line 216
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-nez p2, :cond_5

    .line 221
    .line 222
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->G()Z

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    if-eqz p2, :cond_4

    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_4
    move p2, v1

    .line 230
    goto :goto_3

    .line 231
    :cond_5
    :goto_2
    move p2, v0

    .line 232
    :goto_3
    invoke-virtual {p1, p0, p2}, Ll/e3e;->c(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d()D

    .line 237
    .line 238
    .line 239
    move-result-wide v3

    .line 240
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    invoke-virtual {p1, p0, v3, v4, v5}, Ll/e3e;->f(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)I

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    goto :goto_5

    .line 249
    :cond_6
    :goto_4
    move p1, v1

    .line 250
    move-object p2, v2

    .line 251
    :goto_5
    invoke-virtual {p3, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->b0(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->Z(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a0(I)V

    .line 258
    .line 259
    .line 260
    sget-object p1, Ll/e3e;->INSTANCE:Ll/e3e;

    .line 261
    .line 262
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d()D

    .line 263
    .line 264
    .line 265
    move-result-wide v2

    .line 266
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 267
    .line 268
    .line 269
    move-result p2

    .line 270
    if-nez p2, :cond_8

    .line 271
    .line 272
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->G()Z

    .line 273
    .line 274
    .line 275
    move-result p2

    .line 276
    if-eqz p2, :cond_7

    .line 277
    .line 278
    goto :goto_6

    .line 279
    :cond_7
    move v0, v1

    .line 280
    :cond_8
    :goto_6
    invoke-virtual {p1, p0, v2, v3, v0}, Ll/e3e;->a(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->Y(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    nop

    .line 289
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_c
        -0x33752677 -> :sswitch_b
        -0x2f7ed21b -> :sswitch_a
        -0x199fff46 -> :sswitch_9
        -0x59a8242 -> :sswitch_8
        0x360eca -> :sswitch_7
        0x9dd2ed4 -> :sswitch_6
        0xa71acef -> :sswitch_5
        0x458b6c7b -> :sswitch_4
        0x517a5c19 -> :sswitch_3
        0x6e276fda -> :sswitch_2
        0x6fbec22c -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch
.end method
