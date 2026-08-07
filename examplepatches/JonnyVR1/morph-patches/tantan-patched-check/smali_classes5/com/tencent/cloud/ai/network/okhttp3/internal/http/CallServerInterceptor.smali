.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http/CallServerInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;


# instance fields
.field public final a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/CallServerInterceptor;->a:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public intercept(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 12

    .line 1
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->exchange()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    :try_start_0
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    if-eqz v3, :cond_14

    .line 22
    .line 23
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 24
    .line 25
    invoke-interface {v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/Request;)V

    .line 26
    .line 27
    .line 28
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 29
    .line 30
    if-eqz v3, :cond_13

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/d;->a(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/4 v5, 0x1

    .line 41
    const/4 v6, 0x0

    .line 42
    if-eqz v3, :cond_4

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    if-eqz v3, :cond_4

    .line 49
    .line 50
    const-string v3, "Expect"

    .line 51
    .line 52
    invoke-virtual {p1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    const-string v7, "100-continue"

    .line 57
    .line 58
    invoke-virtual {v7, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    :try_start_1
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 65
    .line 66
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->b()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 67
    .line 68
    .line 69
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    move v7, v5

    .line 79
    goto :goto_0

    .line 80
    :catch_0
    move-exception p0

    .line 81
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    .line 87
    .line 88
    .line 89
    throw p0

    .line 90
    :cond_0
    move-object v3, v4

    .line 91
    move v7, v6

    .line 92
    :goto_0
    if-nez v3, :cond_3

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 95
    .line 96
    .line 97
    move-result-object v8

    .line 98
    invoke-virtual {v8}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->isDuplex()Z

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    if-eqz v8, :cond_1

    .line 103
    .line 104
    :try_start_2
    iget-object v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 105
    .line 106
    invoke-interface {v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->b()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, p1, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okio/v;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/v;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    invoke-virtual {v8, v5}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->writeTo(Lcom/tencent/cloud/ai/network/okio/f;)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :catch_1
    move-exception p0

    .line 126
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    .line 132
    .line 133
    .line 134
    throw p0

    .line 135
    :cond_1
    invoke-virtual {v0, p1, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okio/v;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/v;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    invoke-virtual {v8, v5}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->writeTo(Lcom/tencent/cloud/ai/network/okio/f;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    if-eqz v8, :cond_2

    .line 155
    .line 156
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    new-instance v9, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v10, "current url: "

    .line 163
    .line 164
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 168
    .line 169
    .line 170
    move-result-object v10

    .line 171
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v10, " date size:"

    .line 175
    .line 176
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 180
    .line 181
    .line 182
    move-result-object v10

    .line 183
    invoke-virtual {v10}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->contentLength()J

    .line 184
    .line 185
    .line 186
    move-result-wide v10

    .line 187
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v9

    .line 194
    invoke-virtual {v8, v9}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logInfo(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_2
    check-cast v5, Lcom/tencent/cloud/ai/network/okio/q;

    .line 198
    .line 199
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okio/q;->close()V

    .line 200
    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_3
    iget-object v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 204
    .line 205
    invoke-virtual {v8, v0, v5, v6, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 206
    .line 207
    .line 208
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 209
    .line 210
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a()Z

    .line 215
    .line 216
    .line 217
    move-result v5

    .line 218
    if-nez v5, :cond_5

    .line 219
    .line 220
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 221
    .line 222
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 227
    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_4
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 231
    .line 232
    invoke-virtual {v3, v0, v5, v6, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 233
    .line 234
    .line 235
    move-object v3, v4

    .line 236
    move v7, v6

    .line 237
    :cond_5
    :goto_1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    if-eqz v5, :cond_6

    .line 242
    .line 243
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->isDuplex()Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-nez v5, :cond_7

    .line 252
    .line 253
    :cond_6
    :try_start_3
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 254
    .line 255
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->c()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 256
    .line 257
    .line 258
    :cond_7
    if-nez v7, :cond_8

    .line 259
    .line 260
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 261
    .line 262
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 263
    .line 264
    .line 265
    :cond_8
    if-nez v3, :cond_9

    .line 266
    .line 267
    invoke-virtual {v0, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    :cond_9
    invoke-virtual {v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 276
    .line 277
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 282
    .line 283
    invoke-virtual {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->handshake(Lcom/tencent/cloud/ai/network/okhttp3/n;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    invoke-virtual {v3, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 292
    .line 293
    .line 294
    move-result-wide v7

    .line 295
    invoke-virtual {v3, v7, v8}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 304
    .line 305
    .line 306
    move-result v5

    .line 307
    const/16 v7, 0x64

    .line 308
    .line 309
    if-ne v5, v7, :cond_a

    .line 310
    .line 311
    invoke-virtual {v0, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    invoke-virtual {v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 320
    .line 321
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 322
    .line 323
    .line 324
    move-result-object v3

    .line 325
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 326
    .line 327
    invoke-virtual {p1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->handshake(Lcom/tencent/cloud/ai/network/okhttp3/n;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-virtual {p1, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 336
    .line 337
    .line 338
    move-result-wide v1

    .line 339
    invoke-virtual {p1, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    :cond_a
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 352
    .line 353
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 354
    .line 355
    .line 356
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/CallServerInterceptor;->a:Z

    .line 357
    .line 358
    if-eqz p0, :cond_b

    .line 359
    .line 360
    const/16 p0, 0x65

    .line 361
    .line 362
    if-ne v5, p0, :cond_b

    .line 363
    .line 364
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 369
    .line 370
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    goto :goto_2

    .line 379
    :cond_b
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    :try_start_4
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 384
    .line 385
    if-eqz p1, :cond_12

    .line 386
    .line 387
    const-string p1, "Content-Type"

    .line 388
    .line 389
    invoke-virtual {v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 394
    .line 395
    invoke-interface {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J

    .line 396
    .line 397
    .line 398
    move-result-wide v1

    .line 399
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 400
    .line 401
    invoke-interface {v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okio/w;

    .line 402
    .line 403
    .line 404
    move-result-object v3

    .line 405
    new-instance v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;

    .line 406
    .line 407
    invoke-direct {v4, v0, v3, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;Lcom/tencent/cloud/ai/network/okio/w;J)V

    .line 408
    .line 409
    .line 410
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;

    .line 411
    .line 412
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/w;)Lcom/tencent/cloud/ai/network/okio/g;

    .line 413
    .line 414
    .line 415
    move-result-object v4

    .line 416
    invoke-direct {v3, p1, v1, v2, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;-><init>(Ljava/lang/String;JLcom/tencent/cloud/ai/network/okio/g;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    :goto_2
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    const-string v1, "Connection"

    .line 432
    .line 433
    invoke-virtual {p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    const-string v2, "close"

    .line 438
    .line 439
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 440
    .line 441
    .line 442
    move-result p1

    .line 443
    if-nez p1, :cond_c

    .line 444
    .line 445
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 450
    .line 451
    .line 452
    move-result p1

    .line 453
    if-eqz p1, :cond_d

    .line 454
    .line 455
    :cond_c
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 456
    .line 457
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 458
    .line 459
    .line 460
    move-result-object p1

    .line 461
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 462
    .line 463
    .line 464
    :cond_d
    const/16 p1, 0xcc

    .line 465
    .line 466
    if-eq v5, p1, :cond_e

    .line 467
    .line 468
    const/16 p1, 0xcd

    .line 469
    .line 470
    if-ne v5, p1, :cond_f

    .line 471
    .line 472
    :cond_e
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 473
    .line 474
    .line 475
    move-result-object p1

    .line 476
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->contentLength()J

    .line 477
    .line 478
    .line 479
    move-result-wide v0

    .line 480
    const-wide/16 v2, 0x0

    .line 481
    .line 482
    cmp-long p1, v0, v2

    .line 483
    .line 484
    if-gtz p1, :cond_11

    .line 485
    .line 486
    :cond_f
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 487
    .line 488
    .line 489
    move-result-object p1

    .line 490
    if-eqz p1, :cond_10

    .line 491
    .line 492
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 493
    .line 494
    .line 495
    move-result-object p1

    .line 496
    new-instance v0, Ljava/lang/StringBuilder;

    .line 497
    .line 498
    const-string v1, "response size: "

    .line 499
    .line 500
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 504
    .line 505
    .line 506
    move-result-object v1

    .line 507
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->contentLength()J

    .line 508
    .line 509
    .line 510
    move-result-wide v1

    .line 511
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 512
    .line 513
    .line 514
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logInfo(Ljava/lang/String;)V

    .line 519
    .line 520
    .line 521
    :cond_10
    return-object p0

    .line 522
    :cond_11
    new-instance p1, Ljava/net/ProtocolException;

    .line 523
    .line 524
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 525
    .line 526
    .line 527
    move-result-object p0

    .line 528
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->contentLength()J

    .line 529
    .line 530
    .line 531
    move-result-wide v0

    .line 532
    new-instance p0, Ljava/lang/StringBuilder;

    .line 533
    .line 534
    const-string v2, "HTTP "

    .line 535
    .line 536
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 537
    .line 538
    .line 539
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 540
    .line 541
    .line 542
    const-string v2, " had non-zero Content-Length: "

    .line 543
    .line 544
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 548
    .line 549
    .line 550
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 551
    .line 552
    .line 553
    move-result-object p0

    .line 554
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 555
    .line 556
    .line 557
    throw p1

    .line 558
    :catch_2
    move-exception p0

    .line 559
    goto :goto_3

    .line 560
    :cond_12
    :try_start_5
    throw v4
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 561
    :goto_3
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 562
    .line 563
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 564
    .line 565
    .line 566
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    .line 567
    .line 568
    .line 569
    throw p0

    .line 570
    :catch_3
    move-exception p0

    .line 571
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 572
    .line 573
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    .line 577
    .line 578
    .line 579
    throw p0

    .line 580
    :cond_13
    :try_start_6
    throw v4

    .line 581
    :catch_4
    move-exception p0

    .line 582
    goto :goto_4

    .line 583
    :cond_14
    throw v4
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 584
    :goto_4
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 585
    .line 586
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 587
    .line 588
    .line 589
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    .line 590
    .line 591
    .line 592
    throw p0
.end method
