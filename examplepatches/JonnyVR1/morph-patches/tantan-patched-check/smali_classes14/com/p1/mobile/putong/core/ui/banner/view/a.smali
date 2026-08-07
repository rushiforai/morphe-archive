.class public final Lcom/p1/mobile/putong/core/ui/banner/view/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J)\u0010\n\u001a\u001e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00080\u0006j\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0008`\t\u00a2\u0006\u0004\u0008\n\u0010\u000bR0\u0010\r\u001a\u001e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00080\u0006j\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0008`\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/banner/view/a;",
        "",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "privilegeEntranceInfo",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V",
        "Ljava/util/LinkedHashMap;",
        "",
        "Ll/y4;",
        "Lkotlin/collections/LinkedHashMap;",
        "a",
        "()Ljava/util/LinkedHashMap;",
        "Ljava/util/LinkedHashMap;",
        "defaultListMap",
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
.field public final a:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ll/y4;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V
    .locals 51
    .param p1    # Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/fa90;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ll/fa90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "PrivilegeEntrancePendingPaymentStrategy"

    .line 15
    .line 16
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    new-instance v1, Ll/y690;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Ll/y690;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 23
    .line 24
    .line 25
    const-string v2, "PrivilegeEntranceODiamondSpringStrategy"

    .line 26
    .line 27
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    new-instance v1, Ll/o990;

    .line 32
    .line 33
    invoke-direct {v1, v0}, Ll/o990;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "PrivilegeEntranceODiamondStrategy"

    .line 37
    .line 38
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    new-instance v1, Ll/ha90;

    .line 43
    .line 44
    invoke-direct {v1, v0}, Ll/ha90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 45
    .line 46
    .line 47
    const-string v2, "PrivilegeEntrancePlatinumStrategy"

    .line 48
    .line 49
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    new-instance v1, Ll/e990;

    .line 54
    .line 55
    invoke-direct {v1, v0}, Ll/e990;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 56
    .line 57
    .line 58
    const-string v2, "PrivilegeEntranceHuaWeiBefore24SVIPWithODiamondBannerStrategy"

    .line 59
    .line 60
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    new-instance v1, Ll/v990;

    .line 65
    .line 66
    invoke-direct {v1, v0}, Ll/v990;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 67
    .line 68
    .line 69
    const-string v2, "PrivilegeEntranceOdiamondRefundStrategy"

    .line 70
    .line 71
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    new-instance v1, Ll/p690;

    .line 76
    .line 77
    invoke-direct {v1, v0}, Ll/p690;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 78
    .line 79
    .line 80
    const-string v2, "PrivilegeEnhancedPromotionBannerDouble11SVIP6mWithSVIPStrategy"

    .line 81
    .line 82
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    new-instance v1, Ll/c790;

    .line 87
    .line 88
    invoke-direct {v1, v0}, Ll/c790;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 89
    .line 90
    .line 91
    const-string v2, "PrivilegeEnhancedPromotionBannerSVIP12YearWithSVIPStrategy"

    .line 92
    .line 93
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 94
    .line 95
    .line 96
    move-result-object v10

    .line 97
    new-instance v1, Ll/ac90;

    .line 98
    .line 99
    invoke-direct {v1, v0}, Ll/ac90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 100
    .line 101
    .line 102
    const-string v2, "PrivilegeEntranceSVIPRenewableRecoverStrategy"

    .line 103
    .line 104
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 105
    .line 106
    .line 107
    move-result-object v11

    .line 108
    new-instance v1, Ll/nc90;

    .line 109
    .line 110
    invoke-direct {v1, v0}, Ll/nc90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 111
    .line 112
    .line 113
    const-string v2, "PrivilegeEntranceSVIPWithGuideSigningStrategy"

    .line 114
    .line 115
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    new-instance v1, Ll/n890;

    .line 120
    .line 121
    invoke-direct {v1, v0}, Ll/n890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 122
    .line 123
    .line 124
    const-string v2, "PrivilegeEntranceHuaWeiAfter24SVIPWithODiamondBannerStrategy"

    .line 125
    .line 126
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 127
    .line 128
    .line 129
    move-result-object v13

    .line 130
    new-instance v1, Ll/dc90;

    .line 131
    .line 132
    invoke-direct {v1, v0}, Ll/dc90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 133
    .line 134
    .line 135
    const-string v2, "PrivilegeEntranceSVIPStrategy"

    .line 136
    .line 137
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 138
    .line 139
    .line 140
    move-result-object v14

    .line 141
    new-instance v1, Ll/h990;

    .line 142
    .line 143
    invoke-direct {v1, v0}, Ll/h990;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 144
    .line 145
    .line 146
    const-string v2, "PrivilegeEntranceHuaWeiBefore24VIPWithODiamondBannerStrategy"

    .line 147
    .line 148
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 149
    .line 150
    .line 151
    move-result-object v15

    .line 152
    new-instance v1, Ll/z890;

    .line 153
    .line 154
    invoke-direct {v1, v0}, Ll/z890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 155
    .line 156
    .line 157
    const-string v2, "PrivilegeEntranceHuaWeiBefore24SVIPGuideWithVIPStrategy"

    .line 158
    .line 159
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 160
    .line 161
    .line 162
    move-result-object v16

    .line 163
    new-instance v1, Ll/wd90;

    .line 164
    .line 165
    invoke-direct {v1, v0}, Ll/wd90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 166
    .line 167
    .line 168
    const-string v2, "PrivilegeEntranceVIPWithODiamondBannerStrategy"

    .line 169
    .line 170
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 171
    .line 172
    .line 173
    move-result-object v17

    .line 174
    new-instance v1, Ll/q690;

    .line 175
    .line 176
    invoke-direct {v1, v0}, Ll/q690;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 177
    .line 178
    .line 179
    const-string v2, "PrivilegeEnhancedPromotionBannerDouble11SVIP6mWithVIPStrategy"

    .line 180
    .line 181
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 182
    .line 183
    .line 184
    move-result-object v18

    .line 185
    new-instance v1, Ll/d790;

    .line 186
    .line 187
    invoke-direct {v1, v0}, Ll/d790;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 188
    .line 189
    .line 190
    const-string v2, "PrivilegeEnhancedPromotionBannerSVIP12YearWithVIPStrategy"

    .line 191
    .line 192
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 193
    .line 194
    .line 195
    move-result-object v19

    .line 196
    new-instance v1, Ll/pb90;

    .line 197
    .line 198
    invoke-direct {v1, v0}, Ll/pb90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 199
    .line 200
    .line 201
    const-string v2, "PrivilegeEntranceSVIPLowPriceCallbackWithVIPStrategy"

    .line 202
    .line 203
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 204
    .line 205
    .line 206
    move-result-object v20

    .line 207
    new-instance v1, Ll/wb90;

    .line 208
    .line 209
    invoke-direct {v1, v0}, Ll/wb90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 210
    .line 211
    .line 212
    const-string v2, "PrivilegeEntranceSVIPNewCustomerWithVIPStrategy"

    .line 213
    .line 214
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 215
    .line 216
    .line 217
    move-result-object v21

    .line 218
    new-instance v1, Ll/gc90;

    .line 219
    .line 220
    invoke-direct {v1, v0}, Ll/gc90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 221
    .line 222
    .line 223
    const-string v2, "PrivilegeEntranceSVIPTrailHasVipStrategy"

    .line 224
    .line 225
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 226
    .line 227
    .line 228
    move-result-object v22

    .line 229
    new-instance v1, Ll/od90;

    .line 230
    .line 231
    invoke-direct {v1, v0}, Ll/od90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 232
    .line 233
    .line 234
    const-string v2, "PrivilegeEntranceVIPRenewableRecoverStrategy"

    .line 235
    .line 236
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 237
    .line 238
    .line 239
    move-result-object v23

    .line 240
    new-instance v1, Ll/bd90;

    .line 241
    .line 242
    invoke-direct {v1, v0}, Ll/bd90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 243
    .line 244
    .line 245
    const-string v2, "PrivilegeEntranceVIPGuideToSVIPStrategy"

    .line 246
    .line 247
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 248
    .line 249
    .line 250
    move-result-object v24

    .line 251
    new-instance v1, Ll/td90;

    .line 252
    .line 253
    invoke-direct {v1, v0}, Ll/td90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 254
    .line 255
    .line 256
    const-string v2, "PrivilegeEntranceVIPWithGuideSigningStrategy"

    .line 257
    .line 258
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 259
    .line 260
    .line 261
    move-result-object v25

    .line 262
    new-instance v1, Ll/o890;

    .line 263
    .line 264
    invoke-direct {v1, v0}, Ll/o890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 265
    .line 266
    .line 267
    const-string v2, "PrivilegeEntranceHuaWeiAfter24VIPWithODiamondBannerStrategy"

    .line 268
    .line 269
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 270
    .line 271
    .line 272
    move-result-object v26

    .line 273
    new-instance v1, Ll/m890;

    .line 274
    .line 275
    invoke-direct {v1, v0}, Ll/m890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 276
    .line 277
    .line 278
    const-string v2, "PrivilegeEntranceHuaWeiAfter24SVIPGuideWithVIPStrategy"

    .line 279
    .line 280
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 281
    .line 282
    .line 283
    move-result-object v27

    .line 284
    new-instance v1, Ll/qd90;

    .line 285
    .line 286
    invoke-direct {v1, v0}, Ll/qd90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 287
    .line 288
    .line 289
    const-string v2, "PrivilegeEntranceVIPStrategy"

    .line 290
    .line 291
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 292
    .line 293
    .line 294
    move-result-object v28

    .line 295
    new-instance v1, Ll/s890;

    .line 296
    .line 297
    invoke-direct {v1, v0}, Ll/s890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 298
    .line 299
    .line 300
    const-string v2, "PrivilegeEntranceHuaWeiBefore24DefaultWithODiamondBannerStrategy"

    .line 301
    .line 302
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 303
    .line 304
    .line 305
    move-result-object v29

    .line 306
    new-instance v1, Ll/w890;

    .line 307
    .line 308
    invoke-direct {v1, v0}, Ll/w890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 309
    .line 310
    .line 311
    const-string v2, "PrivilegeEntranceHuaWeiBefore24DefaultWithSVIPStrategy"

    .line 312
    .line 313
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 314
    .line 315
    .line 316
    move-result-object v30

    .line 317
    new-instance v1, Ll/qa90;

    .line 318
    .line 319
    invoke-direct {v1, v0}, Ll/qa90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 320
    .line 321
    .line 322
    const-string v2, "PrivilegeEntranceRecoverODiamondStrategy"

    .line 323
    .line 324
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 325
    .line 326
    .line 327
    move-result-object v31

    .line 328
    new-instance v1, Ll/o690;

    .line 329
    .line 330
    invoke-direct {v1, v0}, Ll/o690;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 331
    .line 332
    .line 333
    const-string v2, "PrivilegeEnhancedPromotionBannerDouble11SVIP6mStrategy"

    .line 334
    .line 335
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 336
    .line 337
    .line 338
    move-result-object v32

    .line 339
    new-instance v1, Ll/b790;

    .line 340
    .line 341
    invoke-direct {v1, v0}, Ll/b790;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 342
    .line 343
    .line 344
    const-string v2, "PrivilegeEnhancedPromotionBannerSVIP12YearStrategy"

    .line 345
    .line 346
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 347
    .line 348
    .line 349
    move-result-object v33

    .line 350
    new-instance v1, Ll/i790;

    .line 351
    .line 352
    invoke-direct {v1, v0}, Ll/i790;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 353
    .line 354
    .line 355
    const-string v2, "PrivilegeEnhancedPromotionBannerSVIPLowPriceCallBackStrategy"

    .line 356
    .line 357
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 358
    .line 359
    .line 360
    move-result-object v34

    .line 361
    new-instance v1, Ll/hb90;

    .line 362
    .line 363
    invoke-direct {v1, v0}, Ll/hb90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 364
    .line 365
    .line 366
    const-string v2, "PrivilegeEntranceSVIPLowPriceCallbackStrategy"

    .line 367
    .line 368
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 369
    .line 370
    .line 371
    move-result-object v35

    .line 372
    new-instance v1, Ll/va90;

    .line 373
    .line 374
    invoke-direct {v1, v0}, Ll/va90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 375
    .line 376
    .line 377
    const-string v2, "PrivilegeEntranceSVIPExpiredWithODiamondStrategy"

    .line 378
    .line 379
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 380
    .line 381
    .line 382
    move-result-object v36

    .line 383
    new-instance v1, Ll/za90;

    .line 384
    .line 385
    invoke-direct {v1, v0}, Ll/za90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 386
    .line 387
    .line 388
    const-string v2, "PrivilegeEntranceSVIPExpiredWithoutODiamondStrategy"

    .line 389
    .line 390
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 391
    .line 392
    .line 393
    move-result-object v37

    .line 394
    new-instance v1, Ll/t690;

    .line 395
    .line 396
    invoke-direct {v1, v0}, Ll/t690;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 397
    .line 398
    .line 399
    const-string v2, "PrivilegeEnhancedPromotionBannerLowPriceCustomerSVIPStrategy"

    .line 400
    .line 401
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 402
    .line 403
    .line 404
    move-result-object v38

    .line 405
    new-instance v1, Ll/sb90;

    .line 406
    .line 407
    invoke-direct {v1, v0}, Ll/sb90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 408
    .line 409
    .line 410
    const-string v2, "PrivilegeEntranceSVIPNewCustomerStrategy"

    .line 411
    .line 412
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 413
    .line 414
    .line 415
    move-result-object v39

    .line 416
    new-instance v1, Ll/jc90;

    .line 417
    .line 418
    invoke-direct {v1, v0}, Ll/jc90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 419
    .line 420
    .line 421
    const-string v2, "PrivilegeEntranceSVIPTrailStrategy"

    .line 422
    .line 423
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 424
    .line 425
    .line 426
    move-result-object v40

    .line 427
    new-instance v1, Ll/m790;

    .line 428
    .line 429
    invoke-direct {v1, v0}, Ll/m790;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 430
    .line 431
    .line 432
    const-string v2, "PrivilegeEnhancedPromotionBannerVIPLowPriceCallBackStrategy"

    .line 433
    .line 434
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 435
    .line 436
    .line 437
    move-result-object v41

    .line 438
    new-instance v1, Ll/hd90;

    .line 439
    .line 440
    invoke-direct {v1, v0}, Ll/hd90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 441
    .line 442
    .line 443
    const-string v2, "PrivilegeEntranceVIPLowPriceCallbackStrategy"

    .line 444
    .line 445
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 446
    .line 447
    .line 448
    move-result-object v42

    .line 449
    new-instance v1, Ll/w690;

    .line 450
    .line 451
    invoke-direct {v1, v0}, Ll/w690;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 452
    .line 453
    .line 454
    const-string v2, "PrivilegeEnhancedPromotionBannerLowPriceCustomerVIPStrategy"

    .line 455
    .line 456
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 457
    .line 458
    .line 459
    move-result-object v43

    .line 460
    new-instance v1, Ll/ld90;

    .line 461
    .line 462
    invoke-direct {v1, v0}, Ll/ld90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 463
    .line 464
    .line 465
    const-string v2, "PrivilegeEntranceVIPNewCustomerStrategy"

    .line 466
    .line 467
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 468
    .line 469
    .line 470
    move-result-object v44

    .line 471
    new-instance v1, Ll/tc90;

    .line 472
    .line 473
    invoke-direct {v1, v0}, Ll/tc90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 474
    .line 475
    .line 476
    const-string v2, "PrivilegeEntranceVIPExpiredWithODiamondStrategy"

    .line 477
    .line 478
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 479
    .line 480
    .line 481
    move-result-object v45

    .line 482
    new-instance v1, Ll/h890;

    .line 483
    .line 484
    invoke-direct {v1, v0}, Ll/h890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 485
    .line 486
    .line 487
    const-string v2, "PrivilegeEntranceDefaultWithODiamondBannerStrategy"

    .line 488
    .line 489
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 490
    .line 491
    .line 492
    move-result-object v46

    .line 493
    new-instance v1, Ll/xc90;

    .line 494
    .line 495
    invoke-direct {v1, v0}, Ll/xc90;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 496
    .line 497
    .line 498
    const-string v2, "PrivilegeEntranceVIPExpiredWithoutODiamondStrategy"

    .line 499
    .line 500
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 501
    .line 502
    .line 503
    move-result-object v47

    .line 504
    new-instance v1, Ll/k890;

    .line 505
    .line 506
    invoke-direct {v1, v0}, Ll/k890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 507
    .line 508
    .line 509
    const-string v2, "PrivilegeEntranceHuaWeiAfter24DefaultWithODiamondBannerStrategy"

    .line 510
    .line 511
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 512
    .line 513
    .line 514
    move-result-object v48

    .line 515
    new-instance v1, Ll/l890;

    .line 516
    .line 517
    invoke-direct {v1, v0}, Ll/l890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 518
    .line 519
    .line 520
    const-string v2, "PrivilegeEntranceHuaWeiAfter24DefaultWithSVIPStrategy"

    .line 521
    .line 522
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 523
    .line 524
    .line 525
    move-result-object v49

    .line 526
    new-instance v1, Ll/c890;

    .line 527
    .line 528
    invoke-direct {v1, v0}, Ll/c890;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 529
    .line 530
    .line 531
    const-string v0, "PrivilegeEntranceDefaultStrategy"

    .line 532
    .line 533
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 534
    .line 535
    .line 536
    move-result-object v50

    .line 537
    filled-new-array/range {v3 .. v50}, [Lkotlin/Pair;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    invoke-static {v0}, Lkotlin/collections/MapsKt;->linkedMapOf([Lkotlin/Pair;)Ljava/util/LinkedHashMap;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    move-object/from16 v1, p0

    .line 546
    .line 547
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/banner/view/a;->a:Ljava/util/LinkedHashMap;

    .line 548
    .line 549
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/LinkedHashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ll/y4;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/a;->a:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    return-object p0
.end method
