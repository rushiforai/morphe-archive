.class public Lcom/p1/mobile/putong/core/api/CoreProduct;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;
    }
.end annotation


# static fields
.field public static w0:Ljava/lang/String; = "select"


# instance fields
.field public R:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation
.end field

.field public S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/GPContract;",
            ">;>;"
        }
    .end annotation
.end field

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/GPContract;",
            ">;>;"
        }
    .end annotation
.end field

.field public U:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/GPContract;",
            ">;>;"
        }
    .end annotation
.end field

.field public V:Ll/byd0;

.field public W:Ll/byd0;

.field public X:Ll/byd0;

.field public Y:Ll/jxd0;

.field public Z:Ll/jxd0;

.field public a0:Ll/jxd0;

.field public b0:Ll/jxd0;

.field public c0:Ll/jxd0;

.field public d0:Ll/jxd0;

.field public final e0:Ll/jxd0;

.field public f0:Z

.field public g0:Z

.field public h0:Z

.field public i0:Lcom/p1/mobile/putong/core/data/LuckyTtConfig;

.field public final j0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/RefundDetail;",
            ">;>;"
        }
    .end annotation
.end field

.field public final k0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/RefundDetail;",
            ">;>;"
        }
    .end annotation
.end field

.field public final l0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
            ">;"
        }
    .end annotation
.end field

.field public final m0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public final n0:Ll/vxd0;

.field public final o0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation
.end field

.field public final p0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public q0:Z

.field public r0:Lcom/p1/mobile/putong/core/data/FreeTrialData;

.field public s0:Ljava/lang/String;

.field public t0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PushMessageCustom;",
            ">;>;"
        }
    .end annotation
.end field

.field public u0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public v0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->S:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->T:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->U:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance p1, Ll/byd0;

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "display_gp_vip_subs_failed_dlg_"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-wide/16 v1, 0x0

    .line 54
    .line 55
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->V:Ll/byd0;

    .line 63
    .line 64
    new-instance p1, Ll/byd0;

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "display_gp_see_subs_failed_dlg_"

    .line 69
    .line 70
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->W:Ll/byd0;

    .line 92
    .line 93
    new-instance p1, Ll/byd0;

    .line 94
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v2, "display_dlg_in_privilege_"

    .line 98
    .line 99
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 118
    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->X:Ll/byd0;

    .line 121
    .line 122
    new-instance p1, Ll/jxd0;

    .line 123
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string v1, "location_search_bubble_show_"

    .line 127
    .line 128
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 147
    .line 148
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 149
    .line 150
    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->Y:Ll/jxd0;

    .line 152
    .line 153
    new-instance p1, Ll/jxd0;

    .line 154
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v2, "location_bubble_show_"

    .line 158
    .line 159
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 178
    .line 179
    .line 180
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->Z:Ll/jxd0;

    .line 181
    .line 182
    new-instance p1, Ll/jxd0;

    .line 183
    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v2, "location_bubule_has_shown_"

    .line 187
    .line 188
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 207
    .line 208
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 209
    .line 210
    .line 211
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->a0:Ll/jxd0;

    .line 212
    .line 213
    new-instance p1, Ll/jxd0;

    .line 214
    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    const-string v3, "location_search_bubble_has_shown_"

    .line 218
    .line 219
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 238
    .line 239
    .line 240
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->b0:Ll/jxd0;

    .line 241
    .line 242
    new-instance p1, Ll/jxd0;

    .line 243
    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    const-string v3, "is_sign_"

    .line 247
    .line 248
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 267
    .line 268
    .line 269
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->c0:Ll/jxd0;

    .line 270
    .line 271
    new-instance p1, Ll/jxd0;

    .line 272
    .line 273
    const-string v0, "has_shown_lucky_tt_icon"

    .line 274
    .line 275
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 276
    .line 277
    .line 278
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->d0:Ll/jxd0;

    .line 279
    .line 280
    new-instance p1, Ll/jxd0;

    .line 281
    .line 282
    new-instance v0, Ljava/lang/StringBuilder;

    .line 283
    .line 284
    const-string v3, "showcase_horizontal_enable_cache_"

    .line 285
    .line 286
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 305
    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->e0:Ll/jxd0;

    .line 308
    .line 309
    const/4 p1, 0x0

    .line 310
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->g0:Z

    .line 311
    .line 312
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->h0:Z

    .line 313
    .line 314
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->j0:Lrx/subjects/a;

    .line 319
    .line 320
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->k0:Lrx/subjects/a;

    .line 325
    .line 326
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->l0:Lrx/subjects/a;

    .line 331
    .line 332
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->m0:Lrx/subjects/a;

    .line 337
    .line 338
    new-instance v0, Ll/vxd0;

    .line 339
    .line 340
    new-instance v1, Ljava/lang/StringBuilder;

    .line 341
    .line 342
    const-string v3, "show_intl_tab_me_pay_guide_red"

    .line 343
    .line 344
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 348
    .line 349
    .line 350
    move-result-object v3

    .line 351
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    const/4 v3, -0x1

    .line 363
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 364
    .line 365
    .line 366
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->n0:Ll/vxd0;

    .line 367
    .line 368
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->o0:Lrx/subjects/a;

    .line 373
    .line 374
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 379
    .line 380
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->q0:Z

    .line 381
    .line 382
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->t0:Lrx/subjects/b;

    .line 387
    .line 388
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->u0:Lrx/subjects/a;

    .line 393
    .line 394
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 399
    .line 400
    .line 401
    move-result-object p1

    .line 402
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->v0:Lrx/subjects/a;

    .line 403
    .line 404
    return-void
.end method

.method public static synthetic A3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttVip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic B3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic C3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "core_merchandises_refresh"

    .line 12
    .line 13
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p1:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 14
    .line 15
    invoke-static {p0, v0, v1}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic D3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttSeeWhoLikedMe"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic E3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttSvipGoogleplayFreeTrial"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic F3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->X4(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic G3(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->c5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic H3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttSeeWhoLikedMe"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic I3(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->b5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->g5(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->p5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttSeeWhoLikedMe"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "picksMembership"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttVipUpgradeToPremium"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic P3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttSeeUpgradeToPremium"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic Q3()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/sry;->deleteAll()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic R3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "svipPicksMembership"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "Promo_premiumUpgradeToUltra"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttPremiumUpgradeToUltra"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "momentCoin"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttUltraPremium"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic W3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic X3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/checkPremiumWeeklyGuide"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "momentCoin"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->a5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->s5(Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/core/api/CoreProduct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->j5()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b4(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttVip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->q5(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->d5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Data;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Z4(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/data/RefundDetail;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RefundDetail;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "oDiamond"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/core/api/CoreProduct;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->h5()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic f4(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->l5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g3()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->p:Ll/u6b0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wzh0;->deleteAll()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 9
    .line 10
    iget-object v0, v0, Ll/il8;->q:Ll/qsb;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/wzh0;->deleteAll()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string v0, "[core][merchandise]"

    .line 30
    .line 31
    const-string v1, "selectPromotion merchandises deleteAlll "

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 37
    .line 38
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/sry;->deleteAll()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Lcom/google/common/base/Optional;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->i5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/google/common/base/Optional;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->A1(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static synthetic h4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lorg/json/JSONObject;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->n5(Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GPContractQueryParams;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/bpa;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/bpa;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GPContractQueryParams;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/data/GPContractEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic i4(Lcom/p1/mobile/putong/core/api/CoreProduct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->t5()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "picksMembership"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic j4(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/zpa;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zpa;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/aqa;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/aqa;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/bqa;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/bqa;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->o5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k4(Lcom/p1/mobile/putong/core/api/CoreProduct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->v5()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u5(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l4(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GPContractQueryParams;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->n1(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/GPContractQueryParams;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->U4(Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "\t"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic n4(Lcom/p1/mobile/putong/core/data/RequestPromotion;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/users/me/merchandises/promotions"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RequestPromotion;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic o3(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{\"currencyCode\":\""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "\"}"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->u2()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 35
    .line 36
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public static synthetic o4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->k5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->C1(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic p4(Lcom/p1/mobile/putong/core/api/CoreProduct;[Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Y4([Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    return-void
.end method

.method public static synthetic q3()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/sry;->deleteAll()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q4(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttVip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic r3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "tttUltraPremium"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic r4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/data/GPContractEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->W4(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/data/GPContractEnvelope;)V

    return-void
.end method

.method public static synthetic s3(Lcom/p1/mobile/putong/core/api/CoreProduct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->V4()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->f5(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->p0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method public static synthetic t4(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/rqa;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rqa;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/sqa;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/sqa;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic u3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->m5(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v3(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v0, "svipPicksMembership"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic w3(Lcom/p1/mobile/putong/core/data/RefundDetail;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RefundDetail;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "svip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic x3(Lorg/json/JSONObject;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->B1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic y3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/RequestPromotion;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->r5(Lcom/p1/mobile/putong/core/data/RequestPromotion;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z3(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->e5(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public A4()Z
    .locals 2

    const/4 v0, 0x0

    return v0

    .line 1
    const-string v0, "seeWhoLikedMe"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->R4()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v1
.end method

.method public A5(Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z5(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public B4()Z
    .locals 2

    const/4 v0, 0x0

    return v0

    .line 1
    const-string v0, "vip"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    return v0
.end method

.method public B5(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/sry;->H(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Ll/wzh0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/wzh0$a;->m()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/ooa;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/ooa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->r0:Lcom/p1/mobile/putong/core/data/FreeTrialData;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->r0:Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionType:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->r0:Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public C5(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/sry;->I(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Ll/wzh0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/wzh0$a;->m()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/ara;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/ara;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public D4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->l0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "tttSeeWhoLikedMe"

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "tttVip"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const-string v0, "svip"

    .line 26
    .line 27
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :cond_0
    filled-new-array {p1}, [Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->w5([Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/util/List;

    .line 47
    .line 48
    return-object p0
.end method

.method public E4()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->o0:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public E5()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->m0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/ppa;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/ppa;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/qpa;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/qpa;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public F4()Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sry;->F()Ll/wzh0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public F5()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "luckytantan_native_entrance"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :try_start_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/LuckyTtConfig;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LuckyTtConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->i0:Lcom/p1/mobile/putong/core/data/LuckyTtConfig;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    new-instance v0, Ljava/io/IOException;

    .line 20
    .line 21
    const-string v1, "lucky tt catch json parse Exception, please ignore. "

    .line 22
    .line 23
    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public G4()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/cpa;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cpa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "promotionInfo"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public G5(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 2

    .line 1
    const-string v0, "purchase_result"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->s0:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "purchase_loading"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->s0:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->t0:Lrx/subjects/b;

    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public H4()Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->r0:Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;->NONE:Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->startTime:J

    .line 16
    .line 17
    cmp-long v2, v0, v2

    .line 18
    .line 19
    if-ltz v2, :cond_2

    .line 20
    .line 21
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->endTime:J

    .line 22
    .line 23
    cmp-long p0, v0, v2

    .line 24
    .line 25
    if-lez p0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;->VALID:Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;->OUTOFDATE:Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;

    .line 32
    .line 33
    return-object p0
.end method

.method public H5(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Data;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/ypa;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ypa;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "query_contracts"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public I4()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public I5(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Merchandise;->DEFAULTSTOCKKEEPUNIT_ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    const/16 v1, 0x14

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0, v1}, Ll/wzh0;->queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public J4()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/RefundDetail;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->j0:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public J5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "[core][merchandise]"

    .line 2
    .line 3
    const-string v1, " refreshMerchandises "

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "/users/me/merchandises"

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, "?appSource=tttApp&affiliate=huawei"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, "?appSource=tttApp&affiliate=googleplay"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    iget-object v1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    new-instance v2, Ll/gpa;

    .line 62
    .line 63
    invoke-direct {v2, p0, v0}, Ll/gpa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const-string p0, "merchandises"

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {v1, p0, v0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public K4()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/RefundDetail;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->k0:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public K5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/RefundDetail;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/voa;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/voa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "refund_detail_of_svip"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public L4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->e0:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public L5(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "name"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p1, "action"

    .line 12
    .line 13
    const-string v1, "select"

    .line 14
    .line 15
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p1

    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    new-instance v1, Ll/dqa;

    .line 26
    .line 27
    invoke-direct {v1, p0, v0}, Ll/dqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lorg/json/JSONObject;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "merchandises-promotions"

    .line 31
    .line 32
    const/4 v0, -0x1

    .line 33
    invoke-virtual {p1, p0, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public M4(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p1}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/Throwable;

    .line 10
    .line 11
    const-string p1, "getTrackerFormItemId\uff1aitemId==null"

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->I5(Ljava/lang/String;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    new-instance p0, Ljava/lang/Throwable;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "getTrackerFormItemId\uff1amerchandises==null itemId="

    .line 35
    .line 36
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    return-object v1

    .line 53
    :cond_1
    const/4 v0, 0x0

    .line 54
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->tracker:Ljava/lang/String;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_2
    new-instance p0, Ljava/lang/Throwable;

    .line 84
    .line 85
    const-string p1, "getTrackerFormItemId\uff1ahave merchandises but return null"

    .line 86
    .line 87
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    return-object v1
.end method

.method public M5(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->u0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 4
    .annotation build Landroidx/annotation/UiThread;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GPContractQueryParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GPContractQueryParams;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "googleplay"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GPContractQueryParams;->platform:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GPContractQueryParams;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "/contracts/iap/query?platform=googleplay&productType="

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v3, "gpContracts/"

    .line 29
    .line 30
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    new-instance v3, Ll/dra;

    .line 41
    .line 42
    invoke-direct {v3, v1, v0}, Ll/dra;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GPContractQueryParams;)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, v2, v0, v3}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/era;

    .line 51
    .line 52
    invoke-direct {v1, p0, p1}, Ll/era;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/fra;

    .line 56
    .line 57
    invoke-direct {p0}, Ll/fra;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public N5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p4, Lcom/p1/mobile/putong/core/data/RequestPromotion;

    .line 2
    .line 3
    invoke-direct {p4}, Lcom/p1/mobile/putong/core/data/RequestPromotion;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p4, Lcom/p1/mobile/putong/core/data/RequestPromotion;->action:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p4, Lcom/p1/mobile/putong/core/data/RequestPromotion;->privilegeType:Ljava/lang/String;

    .line 9
    .line 10
    sget-object p2, Lcom/p1/mobile/putong/core/api/CoreProduct;->w0:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iput-object p3, p4, Lcom/p1/mobile/putong/core/data/RequestPromotion;->selectedID:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    new-instance p2, Ll/eqa;

    .line 23
    .line 24
    invoke-direct {p2, p0, p4}, Ll/eqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/RequestPromotion;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "merchandises/promotions"

    .line 28
    .line 29
    const/4 p3, -0x1

    .line 30
    invoke-virtual {p1, p0, p3, p2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public O4()Z
    .locals 1

    .line 1
    const-string v0, "Promo_premiumUpgradeToUltra"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    return p0
.end method

.method public O5(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/fqa;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/fqa;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "currency_code"

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public P4()Z
    .locals 1

    .line 1
    const-string v0, "tttVipUpgradeToPremium"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "tttSeeUpgradeToPremium"

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const-string v0, "tttPremiumUpgradeToUltra"

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->O4()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    :cond_1
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_2
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method public P5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/woa;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/woa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "upload_premium_weekly_guide"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Q4()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public Q5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/koa;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/koa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "upload_tab_me_payGuide"

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public R4()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 22
    .line 23
    if-lez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public S4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    :cond_0
    invoke-static {p1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    :cond_1
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    :cond_2
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_3
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public T4()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "premium"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->offerType:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "premium-promotion"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final synthetic U4(Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;->data:Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->r0:Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 4
    .line 5
    return-object p1
.end method

.method public final synthetic V4()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/spa;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/spa;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/tpa;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/tpa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic W4(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/data/GPContractEnvelope;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/GPContractEnvelope;->data:Lcom/p1/mobile/putong/data/GPContractData;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const-string v0, "svip"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->T:Lrx/subjects/a;

    .line 16
    .line 17
    iget-object p1, p2, Lcom/p1/mobile/putong/data/GPContractEnvelope;->data:Lcom/p1/mobile/putong/data/GPContractData;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GPContractData;->contracts:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string v0, "vip"

    .line 26
    .line 27
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->S:Lrx/subjects/a;

    .line 34
    .line 35
    iget-object p1, p2, Lcom/p1/mobile/putong/data/GPContractEnvelope;->data:Lcom/p1/mobile/putong/data/GPContractData;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GPContractData;->contracts:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string v0, "seeWhoLikedMe"

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->U:Lrx/subjects/a;

    .line 52
    .line 53
    iget-object p1, p2, Lcom/p1/mobile/putong/data/GPContractEnvelope;->data:Lcom/p1/mobile/putong/data/GPContractData;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/GPContractData;->contracts:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public final synthetic X4(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y4([Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 7

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 8
    .line 9
    iget-object v3, v3, Ll/il8;->k:Ll/sry;

    .line 10
    .line 11
    sget-object v4, Lcom/p1/mobile/putong/core/data/Merchandise;->CATEGORY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    sget-object v5, Lcom/p1/mobile/putong/core/data/Merchandise;->QUANTITY:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 22
    .line 23
    iget-object v5, v5, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 24
    .line 25
    const/4 v6, -0x1

    .line 26
    invoke-virtual {v3, v4, v5, v6}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-nez v4, :cond_0

    .line 35
    .line 36
    new-instance v4, Ll/uoa;

    .line 37
    .line 38
    invoke-direct {v4, p0, v2, v3}, Ll/uoa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v4}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-void
.end method

.method public final synthetic Z4(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/xoa;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/xoa;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/yoa;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/yoa;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    new-array p0, p0, [Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 32
    .line 33
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "\tloadFromDB: "

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->x5(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object p2
.end method

.method public final synthetic a5(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->q0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->J5()Lrx/c;

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic b5(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->J5()Lrx/c;

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic c5(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->J5()Lrx/c;

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic d5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 10
    .line 11
    const-string v1, "all"

    .line 12
    .line 13
    const-string v2, "\tmerchandise from server : "

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->x5(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F4()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    sget-object v0, Ll/rsb;->INSTANCE:Ll/rsb;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ll/rsb;->a(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    new-instance v0, Ll/xpa;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/xpa;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 45
    .line 46
    .line 47
    const-string p0, "[core][merchandise]"

    .line 48
    .line 49
    const-string v0, " mergeNetworkStateIntoLocal complete "

    .line 50
    .line 51
    invoke-static {p0, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object p1
.end method

.method public final synthetic e5(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " refreshMerchandises error "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "[core][merchandise]"

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "tttVip"

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "tttSeeWhoLikedMe"

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "tttSvipGoogleplayFreeTrial"

    .line 33
    .line 34
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    filled-new-array {p1, v0, v1}, [Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->w5([Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic f5(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 10
    .line 11
    const-string v1, "tttVip"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 18
    .line 19
    new-instance v3, Ll/dpa;

    .line 20
    .line 21
    invoke-direct {v3}, Ll/dpa;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 32
    .line 33
    const-string v1, "tttSeeWhoLikedMe"

    .line 34
    .line 35
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 40
    .line 41
    new-instance v3, Ll/fpa;

    .line 42
    .line 43
    invoke-direct {v3}, Ll/fpa;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 54
    .line 55
    const-string v1, "tttSvipGoogleplayFreeTrial"

    .line 56
    .line 57
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 62
    .line 63
    new-instance v3, Ll/hpa;

    .line 64
    .line 65
    invoke-direct {v3}, Ll/hpa;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 76
    .line 77
    const-string v1, "Promo_premiumUpgradeToUltra"

    .line 78
    .line 79
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 84
    .line 85
    new-instance v3, Ll/ipa;

    .line 86
    .line 87
    invoke-direct {v3}, Ll/ipa;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->k()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_0

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 112
    .line 113
    const-string v1, "svipPicksMembership"

    .line 114
    .line 115
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 120
    .line 121
    new-instance v3, Ll/jpa;

    .line 122
    .line 123
    invoke-direct {v3}, Ll/jpa;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 134
    .line 135
    const-string v1, "picksMembership"

    .line 136
    .line 137
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 142
    .line 143
    new-instance v3, Ll/kpa;

    .line 144
    .line 145
    invoke-direct {v3}, Ll/kpa;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 156
    .line 157
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_1

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 164
    .line 165
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 169
    .line 170
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_1

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->e0:Ll/jxd0;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 179
    .line 180
    invoke-virtual {v1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vo()Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_2

    .line 192
    .line 193
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 194
    .line 195
    const-string v1, "momentCoin"

    .line 196
    .line 197
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 202
    .line 203
    new-instance v3, Ll/lpa;

    .line 204
    .line 205
    invoke-direct {v3}, Ll/lpa;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 216
    .line 217
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_3

    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 228
    .line 229
    const-string v1, "tttUltraPremium"

    .line 230
    .line 231
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 236
    .line 237
    new-instance v3, Ll/mpa;

    .line 238
    .line 239
    invoke-direct {v3}, Ll/mpa;-><init>()V

    .line 240
    .line 241
    .line 242
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 250
    .line 251
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Na()Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_4

    .line 260
    .line 261
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 262
    .line 263
    const-string v1, "tttVipUpgradeToPremium"

    .line 264
    .line 265
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 270
    .line 271
    new-instance v3, Ll/npa;

    .line 272
    .line 273
    invoke-direct {v3}, Ll/npa;-><init>()V

    .line 274
    .line 275
    .line 276
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 284
    .line 285
    const-string v1, "tttSeeUpgradeToPremium"

    .line 286
    .line 287
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 292
    .line 293
    new-instance v3, Ll/opa;

    .line 294
    .line 295
    invoke-direct {v3}, Ll/opa;-><init>()V

    .line 296
    .line 297
    .line 298
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 306
    .line 307
    const-string v1, "tttPremiumUpgradeToUltra"

    .line 308
    .line 309
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 314
    .line 315
    new-instance v3, Ll/epa;

    .line 316
    .line 317
    invoke-direct {v3}, Ll/epa;-><init>()V

    .line 318
    .line 319
    .line 320
    invoke-static {v2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->o0:Lrx/subjects/a;

    .line 328
    .line 329
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 330
    .line 331
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 335
    .line 336
    return-object p0
.end method

.method public final synthetic g5(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/poa;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/poa;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/qoa;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/qoa;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/roa;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/roa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/soa;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/soa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/toa;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/toa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public final synthetic h5()Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/a;->V1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic i5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/google/common/base/Optional;
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->s3()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    new-instance v0, Ll/zoa;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/zoa;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->k0:Lrx/subjects/a;

    .line 69
    .line 70
    if-eqz v1, :cond_0

    .line 71
    .line 72
    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    new-instance v0, Ll/apa;

    .line 88
    .line 89
    invoke-direct {v0}, Ll/apa;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_1

    .line 103
    .line 104
    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    goto :goto_1

    .line 109
    :cond_1
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->j0:Lrx/subjects/a;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    return-object p1

    .line 119
    :cond_2
    const/4 v0, 0x0

    .line 120
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 125
    .line 126
    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->j0:Lrx/subjects/a;

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-object p1

    .line 136
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->j0:Lrx/subjects/a;

    .line 137
    .line 138
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->k0:Lrx/subjects/a;

    .line 146
    .line 147
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    return-object p0
.end method

.method public final synthetic j5()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/moa;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/moa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/noa;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/noa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic k5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/rsb;->INSTANCE:Ll/rsb;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/rsb;->c(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    new-instance v0, Ll/pqa;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/pqa;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public final synthetic l5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p1, "tttVip"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "tttSeeWhoLikedMe"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {p1, v0}, [Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->w5([Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic m5(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "tttVip"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 16
    .line 17
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 18
    .line 19
    new-instance v4, Ll/tqa;

    .line 20
    .line 21
    invoke-direct {v4}, Ll/tqa;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 32
    .line 33
    const-string v1, "tttSeeWhoLikedMe"

    .line 34
    .line 35
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 46
    .line 47
    new-instance v4, Ll/uqa;

    .line 48
    .line 49
    invoke-direct {v4}, Ll/uqa;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->k()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 74
    .line 75
    const-string v1, "svipPicksMembership"

    .line 76
    .line 77
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 88
    .line 89
    new-instance v4, Ll/vqa;

    .line 90
    .line 91
    invoke-direct {v4}, Ll/vqa;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 102
    .line 103
    const-string v1, "picksMembership"

    .line 104
    .line 105
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 114
    .line 115
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 116
    .line 117
    new-instance v4, Ll/wqa;

    .line 118
    .line 119
    invoke-direct {v4}, Ll/wqa;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vo()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 140
    .line 141
    const-string v1, "momentCoin"

    .line 142
    .line 143
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 152
    .line 153
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 154
    .line 155
    new-instance v4, Ll/xqa;

    .line 156
    .line 157
    invoke-direct {v4}, Ll/xqa;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 168
    .line 169
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_2

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 180
    .line 181
    const-string v1, "tttUltraPremium"

    .line 182
    .line 183
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 192
    .line 193
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 194
    .line 195
    new-instance v4, Ll/zqa;

    .line 196
    .line 197
    invoke-direct {v4}, Ll/zqa;-><init>()V

    .line 198
    .line 199
    .line 200
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->o0:Lrx/subjects/a;

    .line 208
    .line 209
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 214
    .line 215
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 216
    .line 217
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 221
    .line 222
    return-object p0
.end method

.method public final synthetic n5(Lorg/json/JSONObject;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/gqa;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/gqa;-><init>(Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/hqa;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/hqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/iqa;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/iqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/jqa;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/jqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic o5(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/qqa;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/qqa;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public final synthetic p5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p1, "tttVip"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "tttSeeWhoLikedMe"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {p1, v0}, [Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->w5([Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic q5(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "tttVip"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 16
    .line 17
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 18
    .line 19
    new-instance v4, Ll/bra;

    .line 20
    .line 21
    invoke-direct {v4}, Ll/bra;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->R:Ljava/util/Map;

    .line 32
    .line 33
    const-string v1, "tttSeeWhoLikedMe"

    .line 34
    .line 35
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 46
    .line 47
    new-instance v4, Ll/cra;

    .line 48
    .line 49
    invoke-direct {v4}, Ll/cra;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->o0:Lrx/subjects/a;

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 73
    .line 74
    return-object p0
.end method

.method public final synthetic r5(Lcom/p1/mobile/putong/core/data/RequestPromotion;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/kqa;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/kqa;-><init>(Lcom/p1/mobile/putong/core/data/RequestPromotion;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/lqa;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/lqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/mqa;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/mqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/oqa;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/oqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic s5(Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideEnvelope;->data:Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideData;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideData;->needGuide:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->m0:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 26
    .line 27
    return-object p0
.end method

.method public final synthetic t5()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/upa;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/upa;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/PremiumWeeklyGuideEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/vpa;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/vpa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final u4(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x1

    return v0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    const-wide/16 v2, 0x3e8

    .line 28
    .line 29
    div-long/2addr v0, v2

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/FreeTrialData;->startTime:J

    .line 35
    .line 36
    cmp-long p1, v0, v2

    .line 37
    .line 38
    if-ltz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->endTime:J

    .line 45
    .line 46
    cmp-long p0, v0, p0

    .line 47
    .line 48
    if-gtz p0, :cond_0

    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method public final synthetic u5(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideEnvelope;)Ll/uxj0;
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;->showBanner:Z

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->n0:Ll/vxd0;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, -0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ne v0, v3, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->n0:Ll/vxd0;

    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-ne v0, v2, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->n0:Ll/vxd0;

    .line 46
    .line 47
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->l0:Lrx/subjects/a;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 62
    .line 63
    return-object p0
.end method

.method public v4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->f0:Z

    .line 3
    .line 4
    new-instance p0, Lcom/p1/mobile/putong/data/Order;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Order;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "assumedPurchased"

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/BundleStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BundleStatus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->Z(Lcom/p1/mobile/putong/data/Order;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic v5()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/nqa;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nqa;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlTabMePayGuideEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/yqa;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/yqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public w4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    xor-int/lit8 v2, v1, 0x1

    .line 40
    .line 41
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->e0:Ll/jxd0;

    .line 53
    .line 54
    xor-int/lit8 v0, v1, 0x1

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->new_()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->isShowCheckPopup:Ljava/lang/Boolean;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->p0:Lrx/subjects/a;

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->e0:Ll/jxd0;

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final varargs w5([Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 1

    .line 1
    new-instance v0, Ll/loa;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/loa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;[Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public x4()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->m0:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final x5(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "category:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p2, "\tsize:"

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/wpa;

    .line 27
    .line 28
    invoke-direct {p2}, Ll/wpa;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string p3, ","

    .line 32
    .line 33
    invoke-static {p1, p2, p3}, Ll/jyb;->o0(Ljava/util/Collection;Ll/qcj;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "[core][merchandise]"

    .line 45
    .line 46
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public y4()Z
    .locals 3

    const/4 v0, 0x0

    return v0

    .line 1
    const-string v0, "premium"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    const-string v0, "premium_sale"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return v1

    .line 20
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->R4()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->T4()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_2

    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_2
    return v1
.end method

.method public y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z5(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public z4()Z
    .locals 4

    const/4 v0, 0x0

    return v0

    .line 1
    const-string v0, "premium"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->T4()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->R4()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    return v1

    .line 50
    :cond_0
    return v2

    .line 51
    :cond_1
    const-string v0, "premium_sale"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->u4(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->R4()Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_2

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-nez p0, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_2

    .line 90
    .line 91
    return v1

    .line 92
    :cond_2
    return v2
.end method

.method public z5(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Z)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/sry;->G(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Ll/wzh0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/wzh0$a;->m()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/rpa;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/rpa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/cqa;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/cqa;-><init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
