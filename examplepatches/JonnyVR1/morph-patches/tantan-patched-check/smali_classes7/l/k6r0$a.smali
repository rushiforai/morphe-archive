.class final Ll/k6r0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k6r0;->d(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/k6r0$a;->b:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const-string v0, "do sync info"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/xiaomi/push/he;

    .line 7
    .line 8
    invoke-static {}, Lcom/xiaomi/push/service/aj;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, v1, v2}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget-object v3, Lcom/xiaomi/push/gp;->v:Lcom/xiaomi/push/gp;

    .line 23
    .line 24
    iget-object v3, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0, v3}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v0, v3}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 43
    .line 44
    .line 45
    new-instance v3, Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 51
    .line 52
    iget-object v4, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-static {v4, v5}, Lcom/xiaomi/push/g;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    const-string v5, "app_version"

    .line 63
    .line 64
    invoke-static {v3, v5, v4}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 68
    .line 69
    iget-object v4, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 70
    .line 71
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-static {v4, v5}, Lcom/xiaomi/push/g;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    const-string v5, "app_version_code"

    .line 84
    .line 85
    invoke-static {v3, v5, v4}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 89
    .line 90
    const-string v4, "push_sdk_vn"

    .line 91
    .line 92
    const-string v5, "5_9_9-C"

    .line 93
    .line 94
    invoke-static {v3, v4, v5}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 98
    .line 99
    const v4, 0xc6dd

    .line 100
    .line 101
    .line 102
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    const-string v5, "push_sdk_vc"

    .line 107
    .line 108
    invoke-static {v3, v5, v4}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 112
    .line 113
    const-string v4, "token"

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->m()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-static {v3, v4, v5}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ll/l4r0;->t()Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    const-string v4, ","

    .line 127
    .line 128
    if-nez v3, :cond_1

    .line 129
    .line 130
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 131
    .line 132
    invoke-static {v3}, Ll/u3r0;->t(Landroid/content/Context;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-static {v3}, Ll/bvq0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    iget-object v5, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 141
    .line 142
    invoke-static {v5}, Ll/u3r0;->x(Landroid/content/Context;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    if-nez v6, :cond_0

    .line 151
    .line 152
    new-instance v6, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    if-nez v5, :cond_1

    .line 175
    .line 176
    iget-object v5, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 177
    .line 178
    const-string v6, "imei_md5"

    .line 179
    .line 180
    invoke-static {v5, v6, v3}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_1
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 184
    .line 185
    invoke-static {v3}, Ll/etq0;->c(Landroid/content/Context;)Ll/etq0;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    iget-object v5, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 190
    .line 191
    invoke-virtual {v3, v5}, Ll/etq0;->e(Ljava/util/Map;)V

    .line 192
    .line 193
    .line 194
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 195
    .line 196
    const-string v5, "reg_id"

    .line 197
    .line 198
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->q()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    invoke-static {v3, v5, v6}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 206
    .line 207
    const-string v5, "reg_secret"

    .line 208
    .line 209
    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/c;->t()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-static {v3, v5, v1}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    iget-object v1, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 217
    .line 218
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAcceptTime(Landroid/content/Context;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    const-string v3, "-"

    .line 223
    .line 224
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 229
    .line 230
    const-string v4, "accept_time"

    .line 231
    .line 232
    invoke-static {v3, v4, v1}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-boolean v1, p0, Ll/k6r0$a;->b:Z

    .line 236
    .line 237
    iget-object v3, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 238
    .line 239
    if-eqz v1, :cond_2

    .line 240
    .line 241
    iget-object v1, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 242
    .line 243
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllAlias(Landroid/content/Context;)Ljava/util/List;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-static {v1}, Ll/k6r0;->a(Ljava/util/List;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    const-string v4, "aliases_md5"

    .line 252
    .line 253
    invoke-static {v3, v4, v1}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object v1, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 257
    .line 258
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 259
    .line 260
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllTopic(Landroid/content/Context;)Ljava/util/List;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    invoke-static {v3}, Ll/k6r0;->a(Ljava/util/List;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    const-string v4, "topics_md5"

    .line 269
    .line 270
    invoke-static {v1, v4, v3}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object v1, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 274
    .line 275
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 276
    .line 277
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllUserAccount(Landroid/content/Context;)Ljava/util/List;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-static {v3}, Ll/k6r0;->a(Ljava/util/List;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    const-string v4, "accounts_md5"

    .line 286
    .line 287
    invoke-static {v1, v4, v3}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    goto :goto_0

    .line 291
    :cond_2
    iget-object v1, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 292
    .line 293
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllAlias(Landroid/content/Context;)Ljava/util/List;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-static {v1}, Ll/k6r0;->e(Ljava/util/List;)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    const-string v4, "aliases"

    .line 302
    .line 303
    invoke-static {v3, v4, v1}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    iget-object v1, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 307
    .line 308
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 309
    .line 310
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllTopic(Landroid/content/Context;)Ljava/util/List;

    .line 311
    .line 312
    .line 313
    move-result-object v3

    .line 314
    invoke-static {v3}, Ll/k6r0;->e(Ljava/util/List;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    const-string v4, "topics"

    .line 319
    .line 320
    invoke-static {v1, v4, v3}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    iget-object v1, v0, Lcom/xiaomi/push/he;->a:Ljava/util/Map;

    .line 324
    .line 325
    iget-object v3, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 326
    .line 327
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->getAllUserAccount(Landroid/content/Context;)Ljava/util/List;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    invoke-static {v3}, Ll/k6r0;->e(Ljava/util/List;)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v3

    .line 335
    const-string v4, "user_accounts"

    .line 336
    .line 337
    invoke-static {v1, v4, v3}, Ll/u4r0;->c(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    :goto_0
    iget-object p0, p0, Ll/k6r0$a;->a:Landroid/content/Context;

    .line 341
    .line 342
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    sget-object v1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 347
    .line 348
    const/4 v3, 0x0

    .line 349
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 350
    .line 351
    .line 352
    return-void
.end method
