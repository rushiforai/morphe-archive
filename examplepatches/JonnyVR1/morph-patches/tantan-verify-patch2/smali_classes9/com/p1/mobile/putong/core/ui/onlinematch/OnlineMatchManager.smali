.class public Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;,
        Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;
    }
.end annotation


# static fields
.field public static volatile L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;


# instance fields
.field public A:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/kcg0;

.field public C:Ll/kcg0;

.field public D:Ll/kcg0;

.field public E:Ll/kcg0;

.field public F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

.field public G:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public H:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;",
            ">;"
        }
    .end annotation
.end field

.field public I:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public final J:Ll/xyd0;

.field public final K:Ll/byd0;

.field public final a:Ll/jxd0;

.field public b:Ll/vxd0;

.field public final c:Ll/vxd0;

.field public final d:Ll/byd0;

.field public final e:Ll/byd0;

.field public f:Z

.field public final g:Ll/byd0;

.field public final h:Ll/byd0;

.field public final i:Ll/wyd0;

.field public final j:Ll/byd0;

.field public final k:Ll/byd0;

.field public l:Ll/jxd0;

.field public m:Ll/jxd0;

.field public n:Ll/jxd0;

.field public o:Ll/jxd0;

.field public p:Z

.field public final q:Ll/vxd0;

.field public r:Ll/byd0;

.field public s:Ll/vxd0;

.field public t:Ll/byd0;

.field public u:Ll/byd0;

.field public v:Ll/byd0;

.field public w:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public final x:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public y:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;",
            ">;>;"
        }
    .end annotation
.end field

.field public z:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "quickchatMessageChatShowCurrentDayIsShow"

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
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a:Ll/jxd0;

    .line 34
    .line 35
    new-instance v0, Ll/vxd0;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "quickchatMessageChatCount"

    .line 40
    .line 41
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->b:Ll/vxd0;

    .line 64
    .line 65
    new-instance v0, Ll/vxd0;

    .line 66
    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v4, "quickchatMessageChatShowTime"

    .line 70
    .line 71
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->c:Ll/vxd0;

    .line 93
    .line 94
    new-instance v0, Ll/byd0;

    .line 95
    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v4, "quickchatMessageChatShowCurrentDay"

    .line 99
    .line 100
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const-wide/16 v4, 0x0

    .line 119
    .line 120
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 125
    .line 126
    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->d:Ll/byd0;

    .line 128
    .line 129
    new-instance v0, Ll/byd0;

    .line 130
    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v5, "quickchatMessageChatShowCurrentDayFirstShow"

    .line 134
    .line 135
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 154
    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->e:Ll/byd0;

    .line 157
    .line 158
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->f:Z

    .line 159
    .line 160
    new-instance v0, Ll/byd0;

    .line 161
    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string v5, "online_match_show_time_"

    .line 165
    .line 166
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 185
    .line 186
    .line 187
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->g:Ll/byd0;

    .line 188
    .line 189
    new-instance v0, Ll/byd0;

    .line 190
    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v5, "om_mess_tip_show_time_"

    .line 194
    .line 195
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 214
    .line 215
    .line 216
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->h:Ll/byd0;

    .line 217
    .line 218
    new-instance v0, Ll/wyd0;

    .line 219
    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    const-string v5, "om_mess_tip_show_id_"

    .line 223
    .line 224
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v5

    .line 235
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    const-string v5, ""

    .line 243
    .line 244
    invoke-direct {v0, v1, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->i:Ll/wyd0;

    .line 248
    .line 249
    new-instance v0, Ll/byd0;

    .line 250
    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    const-string v5, "online_match_assistant_fir_time_"

    .line 254
    .line 255
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 259
    .line 260
    .line 261
    move-result-object v5

    .line 262
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 274
    .line 275
    .line 276
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->j:Ll/byd0;

    .line 277
    .line 278
    new-instance v0, Ll/byd0;

    .line 279
    .line 280
    new-instance v1, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    const-string v5, "online_match_assistant_time_"

    .line 283
    .line 284
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 288
    .line 289
    .line 290
    move-result-object v5

    .line 291
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v5

    .line 295
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 303
    .line 304
    .line 305
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->k:Ll/byd0;

    .line 306
    .line 307
    new-instance v0, Ll/jxd0;

    .line 308
    .line 309
    new-instance v1, Ljava/lang/StringBuilder;

    .line 310
    .line 311
    const-string v5, "show_matched_dismissed_"

    .line 312
    .line 313
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 317
    .line 318
    .line 319
    move-result-object v5

    .line 320
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v5

    .line 324
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 332
    .line 333
    .line 334
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->l:Ll/jxd0;

    .line 335
    .line 336
    new-instance v0, Ll/jxd0;

    .line 337
    .line 338
    new-instance v1, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    const-string v5, "online_match_limit_positive_"

    .line 341
    .line 342
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 346
    .line 347
    .line 348
    move-result-object v5

    .line 349
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 361
    .line 362
    .line 363
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->m:Ll/jxd0;

    .line 364
    .line 365
    new-instance v0, Ll/jxd0;

    .line 366
    .line 367
    new-instance v1, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    const-string v5, "online_match_limit_negative_"

    .line 370
    .line 371
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 375
    .line 376
    .line 377
    move-result-object v5

    .line 378
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v5

    .line 382
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 390
    .line 391
    .line 392
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->n:Ll/jxd0;

    .line 393
    .line 394
    new-instance v0, Ll/jxd0;

    .line 395
    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    .line 397
    .line 398
    const-string v2, "isNoChatCallDialogCanShow_"

    .line 399
    .line 400
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 419
    .line 420
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 421
    .line 422
    .line 423
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->o:Ll/jxd0;

    .line 424
    .line 425
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->p:Z

    .line 426
    .line 427
    new-instance v0, Ll/vxd0;

    .line 428
    .line 429
    new-instance v1, Ljava/lang/StringBuilder;

    .line 430
    .line 431
    const-string v2, "today_quick_chat_insert_card_count_"

    .line 432
    .line 433
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 452
    .line 453
    .line 454
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->q:Ll/vxd0;

    .line 455
    .line 456
    new-instance v0, Ll/byd0;

    .line 457
    .line 458
    new-instance v1, Ljava/lang/StringBuilder;

    .line 459
    .line 460
    const-string v2, "last_timestamp_quick_chat_insert_card_"

    .line 461
    .line 462
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v2

    .line 473
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 481
    .line 482
    .line 483
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->r:Ll/byd0;

    .line 484
    .line 485
    new-instance v0, Ll/vxd0;

    .line 486
    .line 487
    new-instance v1, Ljava/lang/StringBuilder;

    .line 488
    .line 489
    const-string v2, "square_data_tab_count_"

    .line 490
    .line 491
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 492
    .line 493
    .line 494
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v2

    .line 502
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v1

    .line 509
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 510
    .line 511
    .line 512
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->s:Ll/vxd0;

    .line 513
    .line 514
    new-instance v0, Ll/byd0;

    .line 515
    .line 516
    new-instance v1, Ljava/lang/StringBuilder;

    .line 517
    .line 518
    const-string v2, "square_data_tab_show_time_"

    .line 519
    .line 520
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 524
    .line 525
    .line 526
    move-result-object v2

    .line 527
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v2

    .line 531
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    .line 533
    .line 534
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 539
    .line 540
    .line 541
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->t:Ll/byd0;

    .line 542
    .line 543
    new-instance v0, Ll/byd0;

    .line 544
    .line 545
    new-instance v1, Ljava/lang/StringBuilder;

    .line 546
    .line 547
    const-string v2, "QuickChatV2ShowNormalTips"

    .line 548
    .line 549
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 553
    .line 554
    .line 555
    move-result-object v2

    .line 556
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 557
    .line 558
    .line 559
    move-result-object v2

    .line 560
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object v1

    .line 567
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 568
    .line 569
    .line 570
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->u:Ll/byd0;

    .line 571
    .line 572
    new-instance v0, Ll/byd0;

    .line 573
    .line 574
    new-instance v1, Ljava/lang/StringBuilder;

    .line 575
    .line 576
    const-string v2, "QuickChatV2ShowVideoTips"

    .line 577
    .line 578
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 582
    .line 583
    .line 584
    move-result-object v2

    .line 585
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v2

    .line 589
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v1

    .line 596
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 597
    .line 598
    .line 599
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->v:Ll/byd0;

    .line 600
    .line 601
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w:Lrx/subjects/a;

    .line 606
    .line 607
    new-instance v0, Ljava/util/HashMap;

    .line 608
    .line 609
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 610
    .line 611
    .line 612
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->x:Ljava/util/Map;

    .line 613
    .line 614
    const-string v0, "default"

    .line 615
    .line 616
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;->QuickChat:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 617
    .line 618
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 619
    .line 620
    .line 621
    move-result-object v0

    .line 622
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 623
    .line 624
    .line 625
    move-result-object v0

    .line 626
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y:Lrx/subjects/a;

    .line 627
    .line 628
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 629
    .line 630
    .line 631
    move-result-object v0

    .line 632
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z:Lrx/subjects/b;

    .line 633
    .line 634
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->A:Lrx/subjects/a;

    .line 639
    .line 640
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 641
    .line 642
    .line 643
    move-result-object v0

    .line 644
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->H:Lrx/subjects/b;

    .line 645
    .line 646
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 647
    .line 648
    .line 649
    move-result-object v0

    .line 650
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 651
    .line 652
    new-instance v0, Ll/xyd0;

    .line 653
    .line 654
    new-instance v1, Ljava/lang/StringBuilder;

    .line 655
    .line 656
    const-string v2, "om_notify_close_set"

    .line 657
    .line 658
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 659
    .line 660
    .line 661
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 662
    .line 663
    .line 664
    move-result-object v2

    .line 665
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 666
    .line 667
    .line 668
    move-result-object v2

    .line 669
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v1

    .line 676
    new-instance v2, Ljava/util/HashSet;

    .line 677
    .line 678
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 679
    .line 680
    .line 681
    invoke-direct {v0, v1, v2}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 682
    .line 683
    .line 684
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->J:Ll/xyd0;

    .line 685
    .line 686
    new-instance v0, Ll/byd0;

    .line 687
    .line 688
    new-instance v1, Ljava/lang/StringBuilder;

    .line 689
    .line 690
    const-string v2, "om_notify_update_time"

    .line 691
    .line 692
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 693
    .line 694
    .line 695
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 696
    .line 697
    .line 698
    move-result-object v2

    .line 699
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v2

    .line 703
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 704
    .line 705
    .line 706
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v1

    .line 710
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 711
    .line 712
    .line 713
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->K:Ll/byd0;

    .line 714
    .line 715
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->d0()V

    .line 716
    .line 717
    .line 718
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->b0()V

    .line 719
    .line 720
    .line 721
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->c0()V

    .line 722
    .line 723
    .line 724
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->W0()V

    .line 6
    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    const/4 v5, 0x0

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move-object v4, p2

    .line 13
    move-object v6, p3

    .line 14
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->U(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->Z(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Ll/pf60;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->P(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/pf60;)V

    return-void
.end method

.method public static e0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    const-class v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_5

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 33
    .line 34
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 43
    .line 44
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v1

    .line 49
    goto/16 :goto_1

    .line 50
    .line 51
    :cond_0
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

    .line 54
    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

    .line 64
    .line 65
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

    .line 74
    .line 75
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 76
    .line 77
    .line 78
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->D:Ll/kcg0;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_2

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->D:Ll/kcg0;

    .line 91
    .line 92
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_2

    .line 97
    .line 98
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->D:Ll/kcg0;

    .line 101
    .line 102
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 103
    .line 104
    .line 105
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->E:Ll/kcg0;

    .line 108
    .line 109
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_3

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->E:Ll/kcg0;

    .line 118
    .line 119
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-nez v1, :cond_3

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->E:Ll/kcg0;

    .line 128
    .line 129
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 130
    .line 131
    .line 132
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 133
    .line 134
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 135
    .line 136
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_4

    .line 141
    .line 142
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 143
    .line 144
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 147
    .line 148
    .line 149
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w()V

    .line 152
    .line 153
    .line 154
    sget-object v1, Lcom/p1/mobile/putong/core/api/v;->Z:Lrx/subjects/a;

    .line 155
    .line 156
    const-string v2, ""

    .line 157
    .line 158
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    const/4 v1, 0x0

    .line 162
    sput-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 163
    .line 164
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    .line 165
    .line 166
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;->b()V

    .line 167
    .line 168
    .line 169
    monitor-exit v0

    .line 170
    return-void

    .line 171
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    throw v1

    .line 173
    :cond_6
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->O(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->S(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h(Ll/y20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wyb0;->I()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    new-instance v1, Ll/yt50;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/yt50;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic j(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->T(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic m(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->Q(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->R(Ll/pf60;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    new-instance v1, Ll/yt50;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/yt50;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic q(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 9

    .line 1
    const/4 v7, 0x7

    .line 2
    const/4 v8, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    const/4 v5, 0x0

    .line 7
    const/4 v6, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 9

    .line 1
    const/4 v7, 0x7

    .line 2
    const/4 v8, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    const/4 v5, 0x0

    .line 7
    const/4 v6, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->p0()V

    return-void
.end method

.method public static z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

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
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public A()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/pf60;

    .line 8
    .line 9
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 12
    .line 13
    return-object p0
.end method

.method public final B(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isUserInSquare:Z

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 4
    .line 5
    const-string v1, "broadcast"

    .line 6
    .line 7
    const-string v2, "grab"

    .line 8
    .line 9
    const-string v3, "p_message,quickchat_pop"

    .line 10
    .line 11
    if-eqz p0, :cond_4

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "p_quickchat,e_quickchat_adpopup_bell,click"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const-string p0, "p_quickchat,e_quickchat_adpopup_grab,click"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "broadcast-bubble"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    const-string v0, "p_quickchat,e_quickchat_adpopup_broadcast,click"

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    return-object v0

    .line 51
    :cond_3
    return-object v3

    .line 52
    :cond_4
    if-eqz v0, :cond_5

    .line 53
    .line 54
    return-object v3

    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    return-object v3

    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_7

    .line 71
    .line 72
    return-object v3

    .line 73
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 74
    .line 75
    const-string p1, "pool"

    .line 76
    .line 77
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    return-object v3
.end method

.method public C()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/pf60;

    .line 8
    .line 9
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public D()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/iu50;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/iu50;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public E()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y:Lrx/subjects/a;

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

.method public F(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->K:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->J:Ll/xyd0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/util/HashSet;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

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

.method public final G()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->r:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->q:Ll/vxd0;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ll/vxd0;->a(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->r:Ll/byd0;

    .line 34
    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public I()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public J()Z
    .locals 2

    .line 1
    const-string v0, "matching"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->A()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;->Heartbeat:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public K(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->bellPrivilegeIntercept:Z

    .line 30
    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public L()Z
    .locals 1

    .line 1
    const-string v0, "matching"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public M()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a:Ll/jxd0;

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

.method public N()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->e:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ll/pzi0;->n()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic O(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->W0()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic P(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 7

    .line 1
    iget-object v0, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "quickchat_ask_result"

    .line 8
    .line 9
    const-string v2, "p_suggest_users_home_view"

    .line 10
    .line 11
    const-string v3, "e_quickchat_askend"

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v3, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->q0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G8(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-string v1, "planA"

    .line 51
    .line 52
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    iget-object v1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_0

    .line 69
    .line 70
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p3, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 75
    .line 76
    move-object v1, p3

    .line 77
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 80
    .line 81
    check-cast p3, Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    new-instance v2, Ll/zt50;

    .line 96
    .line 97
    invoke-direct {v2, p2, v0}, Ll/zt50;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, p2, v1, p3, v2}, Ll/of7;->C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    const-string p3, "planB"

    .line 105
    .line 106
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_1

    .line 111
    .line 112
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    new-instance v6, Ll/bu50;

    .line 117
    .line 118
    invoke-direct {v6, p2, v0}, Ll/bu50;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    const-string v3, "chat"

    .line 122
    .line 123
    const-string v4, ""

    .line 124
    .line 125
    const-string v5, ""

    .line 126
    .line 127
    move-object v2, p2

    .line 128
    invoke-virtual/range {v1 .. v6}, Ll/of7;->D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 129
    .line 130
    .line 131
    :cond_1
    :goto_0
    const-string p1, "default"

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 139
    .line 140
    .line 141
    :cond_2
    return-void

    .line 142
    :cond_3
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 143
    .line 144
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    filled-new-array {p1}, [Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-static {v3, v2, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->v()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public final synthetic Q(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->subCode:I

    .line 8
    .line 9
    const v0, 0x92bb2

    .line 10
    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    const-string p1, "\u6b63\u5728\u8bed\u97f3\u95ea\u804a\u5339\u914d\u4e2d"

    .line 15
    .line 16
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p1, "default"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic R(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->q0(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    move-object v2, v1

    .line 26
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/api/v;->a0:Lrx/subjects/b;

    .line 37
    .line 38
    const-string v2, "match_success"

    .line 39
    .line 40
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/api/v;->Z:Lrx/subjects/a;

    .line 48
    .line 49
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 61
    .line 62
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G8(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const-string p1, "default"

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_0
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->j0(J)V

    .line 89
    .line 90
    .line 91
    const-string p1, "matching"

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const-string p1, "start_match_from_user"

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->V(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic S(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->subCode:I

    .line 8
    .line 9
    const v0, 0x92bb2

    .line 10
    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    const-string p1, "\u6b63\u5728\u8bed\u97f3\u95ea\u804a\u5339\u914d\u4e2d"

    .line 15
    .line 16
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p1, "default"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic T(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "default"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "match_stop"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->V(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic U(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "matching"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;->QuickChat:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->X(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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

.method public final Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->p0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final Z(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "match_success"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->V(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 9
    .line 10
    .line 11
    const-string p1, "default"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public a0(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/rm50;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {}, Ll/rm50;->b()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-le v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->g:Ll/byd0;

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 55
    .line 56
    .line 57
    move-result-wide v3

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const-wide/16 v1, 0x0

    .line 60
    .line 61
    move-wide v3, v1

    .line 62
    :goto_0
    const-string v0, "longitude"

    .line 63
    .line 64
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "latitude"

    .line 73
    .line 74
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 83
    .line 84
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 85
    .line 86
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v2, "distance"

    .line 91
    .line 92
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    filled-new-array {v2, p1}, [Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    const-string v3, "(%s,%s)"

    .line 109
    .line 110
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    const-string v3, "match_id"

    .line 115
    .line 116
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    filled-new-array {v0, v1, p0, v2}, [Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string v0, "e_quickchat_position_distance"

    .line 125
    .line 126
    const-string v1, ""

    .line 127
    .line 128
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/a8d0;->x0()Ll/a8d0;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, p1}, Ll/a8d0;->t0(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final b0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/v;->Z:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/pt50;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/pt50;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/au50;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/au50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->D:Ll/kcg0;

    .line 26
    .line 27
    return-void
.end method

.method public final c0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/du50;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/du50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->E:Ll/kcg0;

    .line 24
    .line 25
    return-void
.end method

.method public final d0()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 2
    .line 3
    new-instance v1, Ll/cu50;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cu50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/b$a;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 12
    .line 13
    return-void
.end method

.method public final f0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/v;->S4()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/eu50;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/eu50;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/fu50;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/fu50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C:Ll/kcg0;

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public g0(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->J:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->K:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->K:Ll/byd0;

    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->J:Ll/xyd0;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public h0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->e:Ll/byd0;

    .line 5
    .line 6
    invoke-static {}, Ll/pzi0;->n()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->v:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->n()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->u:Ll/byd0;

    .line 15
    .line 16
    invoke-static {}, Ll/pzi0;->n()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public k0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->d:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ll/pzi0;->n()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->d:Ll/byd0;

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->n()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->c:Ll/vxd0;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->f:Z

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->c:Ll/vxd0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    add-int/2addr v1, v0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->c:Ll/vxd0;

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/data/Settings;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p1, p1

    .line 19
    sub-float/2addr p1, v0

    .line 20
    const/high16 v0, 0x40400000    # 3.0f

    .line 21
    .line 22
    cmpg-float p1, p1, v0

    .line 23
    .line 24
    if-gez p1, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->j:Ll/byd0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ljava/lang/Long;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    const-wide/16 v2, 0x0

    .line 39
    .line 40
    cmp-long p1, v0, v2

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->j:Ll/byd0;

    .line 46
    .line 47
    invoke-static {}, Ll/pzi0;->o()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return v0

    .line 59
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->k:Ll/byd0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ljava/lang/Long;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v1

    .line 71
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_2

    .line 76
    .line 77
    invoke-static {}, Ll/pzi0;->o()J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->j:Ll/byd0;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Ljava/lang/Long;

    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    sub-long/2addr v1, v3

    .line 94
    long-to-double v1, v1

    .line 95
    const-wide v3, 0x4194997000000000L    # 8.64E7

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    div-double/2addr v1, v3

    .line 101
    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    .line 102
    .line 103
    .line 104
    move-result-wide v1

    .line 105
    double-to-int p1, v1

    .line 106
    const/4 v1, 0x2

    .line 107
    if-eq p1, v1, :cond_1

    .line 108
    .line 109
    const/4 v1, 0x3

    .line 110
    if-eq p1, v1, :cond_1

    .line 111
    .line 112
    const/4 v1, 0x5

    .line 113
    if-eq p1, v1, :cond_1

    .line 114
    .line 115
    if-lez p1, :cond_2

    .line 116
    .line 117
    rem-int/lit8 p1, p1, 0x8

    .line 118
    .line 119
    if-nez p1, :cond_2

    .line 120
    .line 121
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->k:Ll/byd0;

    .line 122
    .line 123
    invoke-static {}, Ll/pzi0;->o()J

    .line 124
    .line 125
    .line 126
    move-result-wide v1

    .line 127
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    return v0

    .line 135
    :cond_2
    const/4 p0, 0x0

    .line 136
    return p0
.end method

.method public m0()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/rm50;->b()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->g:Ll/byd0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    const-wide/32 v3, 0x6ddd00

    .line 25
    .line 26
    .line 27
    add-long/2addr v0, v3

    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    cmp-long p0, v0, v3

    .line 33
    .line 34
    if-gtz p0, :cond_1

    .line 35
    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-ge p0, v2, :cond_2

    .line 41
    .line 42
    :cond_1
    return v2

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public n0()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->d:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ll/pzi0;->n()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->d:Ll/byd0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Long;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-static {}, Ll/pzi0;->n()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    cmp-long v0, v0, v2

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->c:Ll/vxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v1, 0x3

    .line 54
    if-ge v0, v1, :cond_1

    .line 55
    .line 56
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->f:Z

    .line 57
    .line 58
    if-nez p0, :cond_1

    .line 59
    .line 60
    const/4 p0, 0x1

    .line 61
    return p0

    .line 62
    :cond_1
    const/4 p0, 0x0

    .line 63
    return p0
.end method

.method public o0(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/qt50;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/qt50;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->u(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/y20;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final p0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 6
    .line 7
    const-string v1, "match_timeout"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->v()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final q0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ll/m600;->c()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->QUICK_CHAT:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance p1, Ll/q4f;

    .line 47
    .line 48
    invoke-direct {p1}, Ll/q4f;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v0, "e_gotmatch"

    .line 52
    .line 53
    iput-object v0, p1, Ll/q4f;->s:Ljava/lang/String;

    .line 54
    .line 55
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 56
    .line 57
    iput-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData;->toTrackParamMap()Ljava/util/Map;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p1, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)Z
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->H(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {}, Ll/a5i0;->E0()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/a5i0;->K()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    move v6, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v6, v2

    .line 30
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-boolean v1, p2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/gra;->c2()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    const/4 v8, 0x0

    .line 49
    move-object v4, p1

    .line 50
    move-object v5, p2

    .line 51
    move-object v7, p3

    .line 52
    move-object v9, p4

    .line 53
    invoke-static/range {v4 .. v9}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return v3

    .line 57
    :cond_1
    move-object v4, p1

    .line 58
    move-object v5, p2

    .line 59
    move-object v7, p3

    .line 60
    move-object v9, p4

    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-gtz p1, :cond_5

    .line 66
    .line 67
    invoke-static {}, Ll/a5i0;->s0()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-lt p1, v3, :cond_2

    .line 72
    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_2
    if-eqz v0, :cond_3

    .line 77
    .line 78
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string p1, "use_up"

    .line 83
    .line 84
    invoke-virtual {p0, v4, p1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    invoke-static {}, Ll/joa;->f4()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, v4, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 115
    .line 116
    invoke-interface {p1, v4, p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 117
    .line 118
    .line 119
    :goto_1
    return v2

    .line 120
    :cond_5
    :goto_2
    if-eqz v6, :cond_6

    .line 121
    .line 122
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Ll/a5i0;->g1()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_6

    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS_EXTRA:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 133
    .line 134
    new-instance p1, Ll/xt50;

    .line 135
    .line 136
    invoke-direct {p1, v4, v5, v7, v9}, Ll/xt50;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const/4 p2, 0x0

    .line 140
    invoke-static {v4, p0, p1, p2}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_6
    const/4 v8, 0x0

    .line 145
    invoke-static/range {v4 .. v9}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :goto_3
    return v3
.end method

.method public s0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Ll/ju50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ju50;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;Ljava/lang/String;Ll/y20;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;Ljava/lang/String;Ll/y20;)Z
    .locals 2
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    const-string p2, "try_start"

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->V(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/joa;->v4()Lrx/c;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v1, "default"

    .line 31
    .line 32
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p1, v0, p3, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->u(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/y20;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 43
    .line 44
    .line 45
    return p0

    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->v()V

    .line 53
    .line 54
    .line 55
    :cond_2
    return v0
.end method

.method public final u(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/y20;)Z
    .locals 3
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rm50;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->m0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p2, "overheat_protection"

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance p1, Ll/pf60;

    .line 30
    .line 31
    const-string p2, "notify_normal_state"

    .line 32
    .line 33
    const/4 p3, 0x0

    .line 34
    invoke-direct {p1, p2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return v1

    .line 46
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_1

    .line 61
    .line 62
    return v1

    .line 63
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->l0(Lcom/p1/mobile/putong/data/Settings;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/hl3;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return v1

    .line 78
    :cond_2
    invoke-static {}, Ll/rm50;->a()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    invoke-static {}, Ll/a5i0;->s0()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-gtz v0, :cond_4

    .line 89
    .line 90
    invoke-static {p3}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-eqz p2, :cond_3

    .line 95
    .line 96
    const-string p3, "p_quickchat,quickchat_button"

    .line 97
    .line 98
    :cond_3
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 102
    .line 103
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return v1

    .line 107
    :cond_4
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 108
    .line 109
    .line 110
    move-result p3

    .line 111
    if-nez p3, :cond_5

    .line 112
    .line 113
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 114
    .line 115
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 116
    .line 117
    .line 118
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 119
    .line 120
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    return v1

    .line 124
    :cond_5
    invoke-static {}, Ll/a5i0;->E0()Z

    .line 125
    .line 126
    .line 127
    move-result p3

    .line 128
    const/4 v0, 0x1

    .line 129
    if-eqz p3, :cond_6

    .line 130
    .line 131
    invoke-static {}, Ll/a5i0;->K()Z

    .line 132
    .line 133
    .line 134
    move-result p3

    .line 135
    if-eqz p3, :cond_6

    .line 136
    .line 137
    move v1, v0

    .line 138
    :cond_6
    if-eqz v1, :cond_7

    .line 139
    .line 140
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    invoke-virtual {p3}, Ll/a5i0;->g1()Z

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    if-eqz p3, :cond_7

    .line 149
    .line 150
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 151
    .line 152
    if-nez p3, :cond_7

    .line 153
    .line 154
    sget-object p3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS_EXTRA:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 155
    .line 156
    new-instance v1, Ll/gu50;

    .line 157
    .line 158
    invoke-direct {v1, p0, p1, p2, p4}, Ll/gu50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    .line 159
    .line 160
    .line 161
    new-instance p2, Ll/hu50;

    .line 162
    .line 163
    invoke-direct {p2, p4}, Ll/hu50;-><init>(Ll/y20;)V

    .line 164
    .line 165
    .line 166
    invoke-static {p1, p3, v1, p2}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_7
    invoke-virtual {p0, p1, v1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->y(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 171
    .line 172
    .line 173
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 174
    .line 175
    invoke-interface {p4, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->c()V

    .line 181
    .line 182
    .line 183
    return v0
.end method

.method public u0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 4
    .param p2    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->H(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {}, Ll/a5i0;->E0()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/a5i0;->K()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    move v1, v2

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    :goto_0
    invoke-static {}, Ll/a5i0;->s0()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-lt v3, v2, :cond_1

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    :cond_1
    invoke-static {}, Ll/rm50;->a()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-lt v3, v2, :cond_4

    .line 48
    .line 49
    :cond_2
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/a5i0;->g1()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;->ChatTop:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;

    .line 71
    .line 72
    const-string v1, "p_wallet,vas"

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;Ljava/lang/String;Ll/y20;)Z

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    if-eqz v0, :cond_5

    .line 79
    .line 80
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string v0, "use_up"

    .line 85
    .line 86
    invoke-virtual {p0, p1, v0}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_5
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 91
    .line 92
    const-string v1, "p_quickchat,quickchat_button"

    .line 93
    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    move-object v2, p1

    .line 97
    check-cast v2, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 98
    .line 99
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->h2()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_6

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_6
    if-eqz v0, :cond_7

    .line 107
    .line 108
    move-object v2, p1

    .line 109
    check-cast v2, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->k2()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_7

    .line 116
    .line 117
    const-string v1, "p_message,quickchat_entrance"

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_7
    if-eqz v0, :cond_8

    .line 121
    .line 122
    move-object v2, p1

    .line 123
    check-cast v2, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 124
    .line 125
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->n2()Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_8

    .line 130
    .line 131
    const-string v1, "p_quickchat_party,quickchat"

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_8
    if-eqz v0, :cond_9

    .line 135
    .line 136
    move-object v2, p1

    .line 137
    check-cast v2, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 138
    .line 139
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->l2()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_9

    .line 144
    .line 145
    const-string v1, "p_playground,quickchat"

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_9
    if-eqz v0, :cond_a

    .line 149
    .line 150
    move-object v0, p1

    .line 151
    check-cast v0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->m2()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_a

    .line 158
    .line 159
    const-string v1, "p_pay_result,e_quickchat_button,click"

    .line 160
    .line 161
    :cond_a
    :goto_1
    invoke-static {}, Ll/joa;->f4()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_b

    .line 166
    .line 167
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 180
    .line 181
    invoke-interface {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 182
    .line 183
    .line 184
    :goto_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 185
    .line 186
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/wyb0;->Q()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "default"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "match_stop"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->V(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->f0()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F:Lcom/p1/mobile/putong/core/ui/onlinematch/b;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/b;->d()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->G:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 3
    .line 4
    return-void
.end method

.method public x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->C()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "default"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    const-string v0, "p_suggest_users_home_view"

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    new-array v2, v1, [Ll/pf60;

    .line 29
    .line 30
    const-string v3, "e_quickchat_ask"

    .line 31
    .line 32
    invoke-static {v3, v0, v2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/v;->Q4(Z)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/ut50;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/ut50;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/vt50;

    .line 53
    .line 54
    invoke-direct {v1, p0, p2, p1}, Ll/vt50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Ll/wt50;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Ll/wt50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public final y(Lcom/p1/mobile/android/app/Act;ZZ)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 6
    .line 7
    new-instance v0, Ll/pf60;

    .line 8
    .line 9
    const-string v1, "notify_search"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "matching"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->W(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    sget p1, Lcom/p1/mobile/putong/core/R$string;->tt:I

    .line 26
    .line 27
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 47
    .line 48
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 49
    .line 50
    .line 51
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 54
    .line 55
    invoke-static {p2}, Ll/lqb;->i4(Z)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    const-string v0, "quickchatNumber"

    .line 60
    .line 61
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, p3, v0}, Ll/lqb;->s5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 72
    .line 73
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/api/v;->Q4(Z)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {p1}, Ll/z7i0;->e(Ljava/lang/Long;)Lrx/c$d;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p2, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance p2, Ll/rt50;

    .line 86
    .line 87
    invoke-direct {p2}, Ll/rt50;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance p2, Ll/st50;

    .line 95
    .line 96
    invoke-direct {p2, p0}, Ll/st50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 97
    .line 98
    .line 99
    new-instance p3, Ll/tt50;

    .line 100
    .line 101
    invoke-direct {p3, p0}, Ll/tt50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->B:Ll/kcg0;

    .line 113
    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 119
    .line 120
    .line 121
    return-void
.end method
