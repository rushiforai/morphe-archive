.class public Lcom/p1/mobile/putong/core/api/a0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile q:Lcom/p1/mobile/putong/core/api/a0;


# instance fields
.field public a:Ll/byd0;

.field public b:Ll/vxd0;

.field public c:Ll/vxd0;

.field public d:Ll/wyd0;

.field public e:Ll/jxd0;

.field public f:Ll/vxd0;

.field public g:Ll/vxd0;

.field public h:Ll/jxd0;

.field public i:Ll/jxd0;

.field public j:Ll/jxd0;

.field public k:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/core/data/HideSpecialUserList;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/HideSpecialUserList;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/lang/String;

.field public p:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "last_special_card_shown_time"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->a:Ll/byd0;

    .line 38
    .line 39
    new-instance v0, Ll/vxd0;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "num_insert_card_limit_left"

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/16 v2, -0x63

    .line 64
    .line 65
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->b:Ll/vxd0;

    .line 69
    .line 70
    new-instance v0, Ll/vxd0;

    .line 71
    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v2, "swipe_wright_time_show_card"

    .line 75
    .line 76
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const v2, 0x98967f

    .line 95
    .line 96
    .line 97
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->c:Ll/vxd0;

    .line 101
    .line 102
    new-instance v0, Ll/wyd0;

    .line 103
    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v2, "current_hide_special_user_id"

    .line 107
    .line 108
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v2, ""

    .line 127
    .line 128
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 132
    .line 133
    new-instance v0, Ll/jxd0;

    .line 134
    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v3, "has_special_card_swiping"

    .line 138
    .line 139
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 158
    .line 159
    invoke-direct {v0, v1, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 160
    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->e:Ll/jxd0;

    .line 163
    .line 164
    new-instance v0, Ll/vxd0;

    .line 165
    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string v4, "special_card_config_last_update_time"

    .line 169
    .line 170
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    const/4 v4, 0x0

    .line 189
    invoke-direct {v0, v1, v4}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 190
    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->f:Ll/vxd0;

    .line 193
    .line 194
    new-instance v0, Ll/vxd0;

    .line 195
    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    const-string v4, "gp_special_card_toast_show_count_"

    .line 199
    .line 200
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    const/4 v4, -0x1

    .line 219
    invoke-direct {v0, v1, v4}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 220
    .line 221
    .line 222
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 223
    .line 224
    new-instance v0, Ll/jxd0;

    .line 225
    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    const-string v5, "has_show_intl_tab_emoji_alert"

    .line 229
    .line 230
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    sget-object v5, Ll/uqb0;->b0:Ll/sre0;

    .line 234
    .line 235
    iget-object v5, v5, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 236
    .line 237
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-direct {v0, v1, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 249
    .line 250
    .line 251
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->h:Ll/jxd0;

    .line 252
    .line 253
    new-instance v0, Ll/jxd0;

    .line 254
    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    const-string v5, "has_show_emoji_guide_page"

    .line 258
    .line 259
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    sget-object v5, Ll/uqb0;->b0:Ll/sre0;

    .line 263
    .line 264
    iget-object v5, v5, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 265
    .line 266
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-direct {v0, v1, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 278
    .line 279
    .line 280
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->i:Ll/jxd0;

    .line 281
    .line 282
    new-instance v0, Ll/jxd0;

    .line 283
    .line 284
    new-instance v1, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    const-string v5, "has_show_name_emoji_alert"

    .line 287
    .line 288
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    sget-object v5, Ll/uqb0;->b0:Ll/sre0;

    .line 292
    .line 293
    iget-object v5, v5, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 294
    .line 295
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v5

    .line 299
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-direct {v0, v1, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 307
    .line 308
    .line 309
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->j:Ll/jxd0;

    .line 310
    .line 311
    new-instance v0, Ll/dji;

    .line 312
    .line 313
    new-instance v1, Ll/vod;

    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    const-string v5, "intl_special_card_hide_users"

    .line 324
    .line 325
    const-string v6, "_1"

    .line 326
    .line 327
    invoke-direct {v1, v5, v6, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    sget-object v3, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 331
    .line 332
    invoke-direct {v0, v1, v4, v3}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 333
    .line 334
    .line 335
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->k:Ll/dji;

    .line 336
    .line 337
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 342
    .line 343
    new-instance v0, Ljava/util/ArrayList;

    .line 344
    .line 345
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 346
    .line 347
    .line 348
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->m:Ljava/util/ArrayList;

    .line 349
    .line 350
    new-instance v0, Ljava/util/ArrayList;

    .line 351
    .line 352
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 353
    .line 354
    .line 355
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->n:Ljava/util/ArrayList;

    .line 356
    .line 357
    iput-object v2, p0, Lcom/p1/mobile/putong/core/api/a0;->o:Ljava/lang/String;

    .line 358
    .line 359
    return-void
.end method

.method public static synthetic a(Ll/dji$a;)Lcom/p1/mobile/putong/core/data/HideSpecialUserList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dji$a;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/api/a0;Lcom/p1/mobile/putong/core/data/HideSpecialUserList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/a0;->t(Lcom/p1/mobile/putong/core/data/HideSpecialUserList;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/api/a0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/a0;->u(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Ll/dji$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/dji$a;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static j()Lcom/p1/mobile/putong/core/api/a0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a0;->q:Lcom/p1/mobile/putong/core/api/a0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/api/a0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/api/a0;->q:Lcom/p1/mobile/putong/core/api/a0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/api/a0;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/api/a0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/api/a0;->q:Lcom/p1/mobile/putong/core/api/a0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/api/a0;->q:Lcom/p1/mobile/putong/core/api/a0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->m:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/a0;->c:Ll/vxd0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ne v0, v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/a0;->x()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/a0;->o:Ljava/lang/String;

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ll/vg60;

    .line 45
    .line 46
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/a0;->n(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->m:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(Ljava/util/List;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ul()Lrx/subjects/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_c

    .line 42
    .line 43
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ul()Lrx/subjects/a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    goto/16 :goto_4

    .line 70
    .line 71
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 77
    .line 78
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    if-eqz v1, :cond_2

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 85
    .line 86
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 93
    .line 94
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 101
    .line 102
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 109
    .line 110
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ul()Lrx/subjects/a;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    if-eqz v2, :cond_3

    .line 132
    .line 133
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ul()Lrx/subjects/a;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 150
    .line 151
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 152
    .line 153
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    if-nez v2, :cond_3

    .line 158
    .line 159
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ul()Lrx/subjects/a;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    check-cast v1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 176
    .line 177
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 178
    .line 179
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->new_()Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    new-instance v3, Ljava/util/ArrayList;

    .line 184
    .line 185
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    :cond_4
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-eqz v5, :cond_5

    .line 197
    .line 198
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    check-cast v5, Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    .line 203
    .line 204
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 205
    .line 206
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 207
    .line 208
    .line 209
    move-result-wide v5

    .line 210
    invoke-static {}, Ll/pzi0;->o()J

    .line 211
    .line 212
    .line 213
    move-result-wide v7

    .line 214
    const-wide/32 v9, 0x5265c00

    .line 215
    .line 216
    .line 217
    sub-long/2addr v7, v9

    .line 218
    cmp-long v5, v5, v7

    .line 219
    .line 220
    if-gtz v5, :cond_4

    .line 221
    .line 222
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 223
    .line 224
    .line 225
    goto :goto_0

    .line 226
    :cond_5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    :cond_6
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 231
    .line 232
    .line 233
    move-result v4

    .line 234
    if-eqz v4, :cond_b

    .line 235
    .line 236
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 241
    .line 242
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    const/4 v6, 0x0

    .line 247
    :cond_7
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 248
    .line 249
    .line 250
    move-result v7

    .line 251
    const/4 v8, 0x1

    .line 252
    if-eqz v7, :cond_8

    .line 253
    .line 254
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v7

    .line 258
    check-cast v7, Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    .line 259
    .line 260
    iget-object v9, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 261
    .line 262
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result v7

    .line 268
    if-eqz v7, :cond_7

    .line 269
    .line 270
    move v6, v8

    .line 271
    goto :goto_2

    .line 272
    :cond_8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 273
    .line 274
    .line 275
    move-result-object v5

    .line 276
    :cond_9
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 277
    .line 278
    .line 279
    move-result v7

    .line 280
    if-eqz v7, :cond_a

    .line 281
    .line 282
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v7

    .line 286
    check-cast v7, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 287
    .line 288
    iget-object v9, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v7

    .line 296
    if-eqz v7, :cond_9

    .line 297
    .line 298
    move v6, v8

    .line 299
    goto :goto_3

    .line 300
    :cond_a
    if-nez v6, :cond_6

    .line 301
    .line 302
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    goto :goto_1

    .line 306
    :cond_b
    iget-object p1, v2, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 307
    .line 308
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 309
    .line 310
    .line 311
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 312
    .line 313
    invoke-virtual {p0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    return-object v3

    .line 317
    :cond_c
    :goto_4
    return-object p1
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->k:Ll/dji;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dji;->k()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/c6b;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/c6b;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/d6b;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/d6b;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/e6b;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/e6b;-><init>(Lcom/p1/mobile/putong/core/api/a0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->p:Ll/kcg0;

    .line 47
    .line 48
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->e:Ll/jxd0;

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/SpecialCard;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/a0;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->f:Ll/vxd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->c:Ll/vxd0;

    .line 22
    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 24
    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->b:Ll/vxd0;

    .line 33
    .line 34
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->f:Ll/vxd0;

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 46
    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 55
    .line 56
    const/4 p1, -0x1

    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public o(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    sget v0, Ll/uqb0;->f0:I

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return p0

    .line 25
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/data/DeviceType;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string v0, "both"

    .line 6
    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    const-string v0, "android"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return p0

    .line 23
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public q(Lcom/p1/mobile/putong/core/data/SpecialCardGender;Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string v0, "both"

    .line 6
    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return p0

    .line 31
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public r(Ljava/util/List;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ljava/lang/Double;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 40
    .line 41
    .line 42
    move-result-wide v4

    .line 43
    const-wide/high16 v6, 0x4038000000000000L    # 24.0

    .line 44
    .line 45
    mul-double/2addr v4, v6

    .line 46
    double-to-int p1, v4

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->a:Ll/byd0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Long;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 56
    .line 57
    .line 58
    move-result-wide v4

    .line 59
    sub-long/2addr v2, v4

    .line 60
    int-to-long p0, p1

    .line 61
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 62
    .line 63
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 64
    .line 65
    invoke-virtual {v4, p0, p1, v0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 66
    .line 67
    .line 68
    move-result-wide p0

    .line 69
    cmp-long p0, v2, p0

    .line 70
    .line 71
    if-ltz p0, :cond_1

    .line 72
    .line 73
    return v1

    .line 74
    :cond_1
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method public final s(I)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 14
    .line 15
    double-to-long v2, v2

    .line 16
    invoke-static {v2, v3}, Ll/tzi0;->c(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    sub-long/2addr v0, v2

    .line 21
    const-wide/32 v2, 0x5265c00

    .line 22
    .line 23
    .line 24
    div-long/2addr v0, v2

    .line 25
    long-to-int p0, v0

    .line 26
    if-lt p0, p1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/core/data/HideSpecialUserList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u(Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->new_()Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 23
    .line 24
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 47
    .line 48
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/4 v3, 0x0

    .line 58
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_3

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    .line 69
    .line 70
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 73
    .line 74
    .line 75
    move-result-wide v5

    .line 76
    invoke-static {}, Ll/pzi0;->o()J

    .line 77
    .line 78
    .line 79
    move-result-wide v7

    .line 80
    const-wide/32 v9, 0x5265c00

    .line 81
    .line 82
    .line 83
    sub-long/2addr v7, v9

    .line 84
    cmp-long v5, v5, v7

    .line 85
    .line 86
    if-gtz v5, :cond_1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_2

    .line 96
    .line 97
    invoke-static {}, Ll/pzi0;->o()J

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 106
    .line 107
    const/4 v3, 0x1

    .line 108
    :cond_2
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    if-nez v3, :cond_4

    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->new_()Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {}, Ll/pzi0;->o()J

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 129
    .line 130
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;->users:Ljava/util/List;

    .line 134
    .line 135
    invoke-interface {p1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/a0;->k:Ll/dji;

    .line 139
    .line 140
    invoke-virtual {p1}, Ll/dji;->c()V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/a0;->k:Ll/dji;

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->l:Lrx/subjects/a;

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->e:Ll/jxd0;

    .line 9
    .line 10
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->p:Ll/kcg0;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->p:Ll/kcg0;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/a0;->p:Ll/kcg0;

    .line 30
    .line 31
    :cond_0
    sput-object v1, Lcom/p1/mobile/putong/core/api/a0;->q:Lcom/p1/mobile/putong/core/api/a0;

    .line 32
    .line 33
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/f6b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f6b;-><init>(Lcom/p1/mobile/putong/core/api/a0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x()Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eqz v2, :cond_a

    .line 17
    .line 18
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 23
    .line 24
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ll/vg60;

    .line 29
    .line 30
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    goto/16 :goto_1

    .line 39
    .line 40
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/a0;->b:Ll/vxd0;

    .line 41
    .line 42
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-gtz v2, :cond_1

    .line 53
    .line 54
    return v0

    .line 55
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 56
    .line 57
    invoke-virtual {v2}, Ll/yy6;->G()Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 64
    .line 65
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    if-eqz v2, :cond_a

    .line 70
    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    goto/16 :goto_1

    .line 74
    .line 75
    :cond_2
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 76
    .line 77
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/api/a0;->p(Lcom/p1/mobile/putong/core/data/DeviceType;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_a

    .line 82
    .line 83
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 84
    .line 85
    invoke-virtual {p0, v4, v3}, Lcom/p1/mobile/putong/core/api/a0;->q(Lcom/p1/mobile/putong/core/data/SpecialCardGender;Lcom/p1/mobile/putong/data/User;)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eqz v3, :cond_a

    .line 90
    .line 91
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 92
    .line 93
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/api/a0;->o(Ljava/util/List;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_a

    .line 98
    .line 99
    iget v3, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 100
    .line 101
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/api/a0;->s(I)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_3

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->o()Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-nez v3, :cond_4

    .line 112
    .line 113
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->o()Z

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-nez v3, :cond_a

    .line 118
    .line 119
    :cond_4
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 120
    .line 121
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/api/a0;->r(Ljava/util/List;)Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-nez v3, :cond_5

    .line 126
    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 128
    .line 129
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    check-cast v3, Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    if-nez v3, :cond_a

    .line 140
    .line 141
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iget-object v3, p0, Lcom/p1/mobile/putong/core/api/a0;->a:Ll/byd0;

    .line 154
    .line 155
    const/4 v4, 0x1

    .line 156
    if-nez v0, :cond_6

    .line 157
    .line 158
    invoke-static {}, Ll/pzi0;->o()J

    .line 159
    .line 160
    .line 161
    move-result-wide v0

    .line 162
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v3, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_6
    invoke-static {}, Ll/pzi0;->o()J

    .line 171
    .line 172
    .line 173
    move-result-wide v5

    .line 174
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v3, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->b:Ll/vxd0;

    .line 182
    .line 183
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    check-cast v3, Ljava/lang/Integer;

    .line 188
    .line 189
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    sub-int/2addr v3, v4

    .line 194
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-virtual {v0, v3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 202
    .line 203
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Ljava/lang/Integer;

    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    iget-object v3, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 214
    .line 215
    if-gez v0, :cond_7

    .line 216
    .line 217
    invoke-virtual {v3, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    goto :goto_0

    .line 221
    :cond_7
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Ljava/lang/Integer;

    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 232
    .line 233
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    sub-int/2addr v3, v4

    .line 238
    if-ge v0, v3, :cond_8

    .line 239
    .line 240
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 241
    .line 242
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    check-cast v0, Ljava/lang/Integer;

    .line 247
    .line 248
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    add-int/2addr v0, v4

    .line 253
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_8
    iget v0, v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 262
    .line 263
    if-ne v0, v4, :cond_9

    .line 264
    .line 265
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/a0;->g:Ll/vxd0;

    .line 266
    .line 267
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    :cond_9
    :goto_0
    return v4

    .line 271
    :cond_a
    :goto_1
    return v0
.end method
