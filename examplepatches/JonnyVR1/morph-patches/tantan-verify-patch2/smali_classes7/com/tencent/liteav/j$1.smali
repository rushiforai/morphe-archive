.class Lcom/tencent/liteav/j$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/j;->a(Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/j$a;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/tencent/liteav/j$a;

.field final synthetic e:Lcom/tencent/liteav/j;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/j;ILjava/lang/String;Ljava/lang/String;Lcom/tencent/liteav/j$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/j$1;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/j$1;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/j$1;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/j$1;->d:Lcom/tencent/liteav/j$a;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const-string v0, "TXCTimeShiftUtil"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;J)J

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 13
    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {v1, v2}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 20
    .line 21
    iget v3, p0, Lcom/tencent/liteav/j$1;->a:I

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;I)I

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 27
    .line 28
    iget-object v3, p0, Lcom/tencent/liteav/j$1;->b:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1, v3}, Lcom/tencent/liteav/j;->b(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/tencent/liteav/j$1;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getStreamIDByStreamUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v1, v3}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 45
    .line 46
    iget-object v3, p0, Lcom/tencent/liteav/j$1;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v3}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getAppNameByStreamUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {v1, v3}, Lcom/tencent/liteav/j;->c(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-nez v1, :cond_0

    .line 62
    .line 63
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 64
    .line 65
    const-string v3, "live"

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tencent/liteav/j;->c(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 71
    .line 72
    invoke-static {v1}, Lcom/tencent/liteav/j;->b(Lcom/tencent/liteav/j;)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iget-object v3, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 77
    .line 78
    if-gez v1, :cond_1

    .line 79
    .line 80
    invoke-static {v3}, Lcom/tencent/liteav/j;->c(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v3, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 85
    .line 86
    invoke-static {v3}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget-object v4, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 91
    .line 92
    invoke-static {v4}, Lcom/tencent/liteav/j;->d(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    filled-new-array {v1, v3, v4}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v3, "http://%s/timeshift/%s/%s/timeshift.m3u8?delay=0"

    .line 101
    .line 102
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    goto :goto_0

    .line 107
    :cond_1
    invoke-static {v3}, Lcom/tencent/liteav/j;->c(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iget-object v3, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 112
    .line 113
    invoke-static {v3}, Lcom/tencent/liteav/j;->b(Lcom/tencent/liteav/j;)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iget-object v4, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 122
    .line 123
    invoke-static {v4}, Lcom/tencent/liteav/j;->d(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    iget-object v5, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 128
    .line 129
    invoke-static {v5}, Lcom/tencent/liteav/j;->e(Lcom/tencent/liteav/j;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    filled-new-array {v1, v3, v4, v5}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-string v3, "http://%s/%s/%s/timeshift.m3u8?delay=0&appid=%s&txKbps=0"

    .line 138
    .line 139
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    :goto_0
    :try_start_0
    new-instance v3, Ljava/net/URL;

    .line 144
    .line 145
    invoke-direct {v3, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 153
    .line 154
    const/4 v3, 0x1

    .line 155
    invoke-virtual {v1, v3}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v3}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 159
    .line 160
    .line 161
    const/4 v3, 0x0

    .line 162
    invoke-virtual {v1, v3}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 163
    .line 164
    .line 165
    const/16 v3, 0x1388

    .line 166
    .line 167
    invoke-virtual {v1, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 171
    .line 172
    .line 173
    const-string v3, "GET"

    .line 174
    .line 175
    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    const-string v3, "Charsert"

    .line 179
    .line 180
    const-string v4, "UTF-8"

    .line 181
    .line 182
    invoke-virtual {v1, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    const-string v3, "Content-Type"

    .line 186
    .line 187
    const-string v4, "text/plain;"

    .line 188
    .line 189
    invoke-virtual {v1, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    new-instance v3, Ljava/io/BufferedReader;

    .line 193
    .line 194
    new-instance v4, Ljava/io/InputStreamReader;

    .line 195
    .line 196
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-direct {v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 201
    .line 202
    .line 203
    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 204
    .line 205
    .line 206
    :goto_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    if-eqz v1, :cond_2

    .line 211
    .line 212
    new-instance v4, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    goto :goto_1

    .line 228
    :catch_0
    move-exception v1

    .line 229
    goto :goto_2

    .line 230
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .line 234
    .line 235
    const-string v3, "prepareSeekTime: receive response, strResponse = "

    .line 236
    .line 237
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    iget-object v1, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 251
    .line 252
    invoke-static {v1, v2}, Lcom/tencent/liteav/j;->d(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    if-eqz v1, :cond_3

    .line 257
    .line 258
    iget-object v2, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 259
    .line 260
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 261
    .line 262
    .line 263
    move-result-wide v3

    .line 264
    const-wide/16 v5, 0x3e8

    .line 265
    .line 266
    mul-long/2addr v3, v5

    .line 267
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;J)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    .line 269
    .line 270
    goto :goto_3

    .line 271
    :goto_2
    iget-object v2, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 272
    .line 273
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 274
    .line 275
    .line 276
    move-result-wide v3

    .line 277
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/j;->a(Lcom/tencent/liteav/j;J)J

    .line 278
    .line 279
    .line 280
    new-instance v2, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    const-string v3, "prepareSeekTime error "

    .line 283
    .line 284
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    :cond_3
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 302
    .line 303
    .line 304
    move-result-wide v1

    .line 305
    new-instance v3, Ljava/lang/StringBuilder;

    .line 306
    .line 307
    const-string v4, "live start time:"

    .line 308
    .line 309
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    iget-object v4, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 313
    .line 314
    invoke-static {v4}, Lcom/tencent/liteav/j;->f(Lcom/tencent/liteav/j;)J

    .line 315
    .line 316
    .line 317
    move-result-wide v4

    .line 318
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    const-string v4, ",currentTime:"

    .line 322
    .line 323
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    const-string v4, ",diff:"

    .line 330
    .line 331
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    iget-object v4, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 335
    .line 336
    invoke-static {v4}, Lcom/tencent/liteav/j;->f(Lcom/tencent/liteav/j;)J

    .line 337
    .line 338
    .line 339
    move-result-wide v4

    .line 340
    sub-long v4, v1, v4

    .line 341
    .line 342
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    iget-object v0, p0, Lcom/tencent/liteav/j$1;->e:Lcom/tencent/liteav/j;

    .line 353
    .line 354
    invoke-static {v0}, Lcom/tencent/liteav/j;->f(Lcom/tencent/liteav/j;)J

    .line 355
    .line 356
    .line 357
    move-result-wide v3

    .line 358
    sub-long/2addr v1, v3

    .line 359
    iget-object v0, p0, Lcom/tencent/liteav/j$1;->d:Lcom/tencent/liteav/j$a;

    .line 360
    .line 361
    if-eqz v0, :cond_4

    .line 362
    .line 363
    new-instance v0, Landroid/os/Handler;

    .line 364
    .line 365
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    invoke-direct {v0, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 370
    .line 371
    .line 372
    new-instance v3, Lcom/tencent/liteav/j$1$1;

    .line 373
    .line 374
    invoke-direct {v3, p0, v1, v2}, Lcom/tencent/liteav/j$1$1;-><init>(Lcom/tencent/liteav/j$1;J)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 378
    .line 379
    .line 380
    :cond_4
    return-void
.end method
