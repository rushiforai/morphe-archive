.class public Lorg/eclipse/jetty/client/BlockingHttpConnection;
.super Lorg/eclipse/jetty/client/AbstractHttpConnection;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _requestComplete:Z

.field private _requestContentChunk:Lorg/eclipse/jetty/io/Buffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/client/BlockingHttpConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/AbstractHttpConnection;-><init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public handle()Lorg/eclipse/jetty/io/Connection;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, p0

    .line 3
    move v2, v0

    .line 4
    :cond_0
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 5
    .line 6
    invoke-interface {v3}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-eqz v3, :cond_22

    .line 11
    .line 12
    if-ne v1, p0, :cond_22

    .line 13
    .line 14
    sget-object v3, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 15
    .line 16
    const-string v4, "open={} more={}"

    .line 17
    .line 18
    iget-object v5, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 19
    .line 20
    invoke-interface {v5}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    iget-object v6, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 29
    .line 30
    invoke-virtual {v6}, Lorg/eclipse/jetty/http/HttpParser;->isMoreInBuffer()Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    filled-new-array {v5, v6}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-interface {v3, v4, v5}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 46
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    :goto_1
    if-nez v3, :cond_1

    .line 49
    .line 50
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catchall_0
    move-exception v0

    .line 57
    goto/16 :goto_14

    .line 58
    .line 59
    :catch_0
    :try_start_3
    new-instance v0, Ljava/io/InterruptedIOException;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 62
    .line 63
    .line 64
    throw v0

    .line 65
    :cond_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 66
    :try_start_4
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 67
    .line 68
    const-string v5, "exchange {}"

    .line 69
    .line 70
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-interface {v4, v5, v6}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 75
    .line 76
    .line 77
    const/16 v5, 0x65

    .line 78
    .line 79
    const/4 v6, 0x1

    .line 80
    const/4 v7, 0x0

    .line 81
    :try_start_5
    iget-object v8, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 82
    .line 83
    invoke-virtual {v8}, Lorg/eclipse/jetty/http/AbstractGenerator;->isCommitted()Z

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    const/4 v9, 0x2

    .line 88
    if-nez v8, :cond_2

    .line 89
    .line 90
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    if-ne v8, v9, :cond_2

    .line 95
    .line 96
    const-string v8, "commit"

    .line 97
    .line 98
    new-array v10, v0, [Ljava/lang/Object;

    .line 99
    .line 100
    invoke-interface {v4, v8, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->commitRequest()V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catchall_1
    move-exception v4

    .line 108
    goto/16 :goto_a

    .line 109
    .line 110
    :cond_2
    :goto_2
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 111
    .line 112
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/AbstractGenerator;->isCommitted()Z

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    if-eqz v4, :cond_7

    .line 117
    .line 118
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 119
    .line 120
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    if-nez v4, :cond_7

    .line 125
    .line 126
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 127
    .line 128
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/HttpGenerator;->flushBuffer()I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    if-lez v4, :cond_3

    .line 133
    .line 134
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 135
    .line 136
    const-string v8, "flushed"

    .line 137
    .line 138
    new-array v10, v0, [Ljava/lang/Object;

    .line 139
    .line 140
    invoke-interface {v4, v8, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    :cond_3
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 144
    .line 145
    invoke-virtual {v4, v9}, Lorg/eclipse/jetty/http/AbstractGenerator;->isState(I)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_2

    .line 150
    .line 151
    iget-object v4, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 152
    .line 153
    if-nez v4, :cond_4

    .line 154
    .line 155
    invoke-virtual {v3, v7}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestContentChunk(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    iput-object v4, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 160
    .line 161
    :cond_4
    iget-object v4, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 162
    .line 163
    if-nez v4, :cond_5

    .line 164
    .line 165
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 166
    .line 167
    const-string v8, "complete"

    .line 168
    .line 169
    new-array v10, v0, [Ljava/lang/Object;

    .line 170
    .line 171
    invoke-interface {v4, v8, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 175
    .line 176
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/HttpGenerator;->complete()V

    .line 177
    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_5
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 181
    .line 182
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/HttpGenerator;->isEmpty()Z

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    if-eqz v4, :cond_2

    .line 187
    .line 188
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 189
    .line 190
    const-string v8, "addChunk"

    .line 191
    .line 192
    new-array v10, v0, [Ljava/lang/Object;

    .line 193
    .line 194
    invoke-interface {v4, v8, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    iget-object v4, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 198
    .line 199
    invoke-virtual {v3, v7}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestContentChunk(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 200
    .line 201
    .line 202
    move-result-object v8

    .line 203
    iput-object v8, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 204
    .line 205
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 206
    .line 207
    if-nez v8, :cond_6

    .line 208
    .line 209
    move v8, v6

    .line 210
    goto :goto_3

    .line 211
    :cond_6
    move v8, v0

    .line 212
    :goto_3
    invoke-virtual {v10, v4, v8}, Lorg/eclipse/jetty/http/HttpGenerator;->addContent(Lorg/eclipse/jetty/io/Buffer;Z)V

    .line 213
    .line 214
    .line 215
    iget-object v4, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 216
    .line 217
    if-nez v4, :cond_2

    .line 218
    .line 219
    const/4 v4, 0x4

    .line 220
    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_7
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 225
    .line 226
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 227
    .line 228
    .line 229
    move-result v4

    .line 230
    if-eqz v4, :cond_8

    .line 231
    .line 232
    iget-boolean v4, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestComplete:Z

    .line 233
    .line 234
    if-nez v4, :cond_8

    .line 235
    .line 236
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 237
    .line 238
    const-string v8, "requestComplete"

    .line 239
    .line 240
    new-array v9, v0, [Ljava/lang/Object;

    .line 241
    .line 242
    invoke-interface {v4, v8, v9}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    iput-boolean v6, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestComplete:Z

    .line 246
    .line 247
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    invoke-interface {v4}, Lorg/eclipse/jetty/client/HttpEventListener;->onRequestComplete()V

    .line 252
    .line 253
    .line 254
    :cond_8
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 255
    .line 256
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    if-nez v4, :cond_9

    .line 261
    .line 262
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 263
    .line 264
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/HttpParser;->parseAvailable()Z

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    if-eqz v4, :cond_9

    .line 269
    .line 270
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 271
    .line 272
    const-string v8, "parsed"

    .line 273
    .line 274
    new-array v9, v0, [Ljava/lang/Object;

    .line 275
    .line 276
    invoke-interface {v4, v8, v9}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 277
    .line 278
    .line 279
    :cond_9
    iget-object v4, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 280
    .line 281
    invoke-interface {v4}, Lorg/eclipse/jetty/io/EndPoint;->flush()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 282
    .line 283
    .line 284
    :try_start_6
    sget-object v3, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 285
    .line 286
    const-string v4, "{} {}"

    .line 287
    .line 288
    iget-object v8, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 289
    .line 290
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 291
    .line 292
    filled-new-array {v8, v9}, [Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v8

    .line 296
    invoke-interface {v3, v4, v8}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    const-string v4, "{}"

    .line 300
    .line 301
    iget-object v8, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 302
    .line 303
    filled-new-array {v8}, [Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v8

    .line 307
    invoke-interface {v3, v4, v8}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    if-nez v2, :cond_a

    .line 311
    .line 312
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 313
    .line 314
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    if-eqz v3, :cond_0

    .line 319
    .line 320
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 321
    .line 322
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    if-eqz v3, :cond_0

    .line 327
    .line 328
    goto :goto_4

    .line 329
    :catchall_2
    move-exception v0

    .line 330
    goto/16 :goto_15

    .line 331
    .line 332
    :cond_a
    :goto_4
    if-nez v2, :cond_b

    .line 333
    .line 334
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 335
    .line 336
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/HttpParser;->isPersistent()Z

    .line 337
    .line 338
    .line 339
    move-result v3

    .line 340
    if-eqz v3, :cond_b

    .line 341
    .line 342
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 343
    .line 344
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/AbstractGenerator;->isPersistent()Z

    .line 345
    .line 346
    .line 347
    move-result v3

    .line 348
    if-eqz v3, :cond_b

    .line 349
    .line 350
    goto :goto_5

    .line 351
    :cond_b
    move v6, v0

    .line 352
    :goto_5
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 353
    .line 354
    invoke-virtual {v3, v6}, Lorg/eclipse/jetty/http/AbstractGenerator;->setPersistent(Z)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/BlockingHttpConnection;->reset()V

    .line 358
    .line 359
    .line 360
    if-eqz v6, :cond_c

    .line 361
    .line 362
    iget-object v3, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 363
    .line 364
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 365
    .line 366
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 367
    .line 368
    .line 369
    move-result-object v4

    .line 370
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpClient;->getIdleTimeout()J

    .line 371
    .line 372
    .line 373
    move-result-wide v8

    .line 374
    long-to-int v4, v8

    .line 375
    invoke-interface {v3, v4}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 376
    .line 377
    .line 378
    :cond_c
    monitor-enter p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 379
    :try_start_7
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 380
    .line 381
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 382
    .line 383
    if-eqz v3, :cond_d

    .line 384
    .line 385
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 386
    .line 387
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 388
    .line 389
    .line 390
    move-result-object v4

    .line 391
    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/client/HttpExchange;->cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 392
    .line 393
    .line 394
    goto :goto_6

    .line 395
    :catchall_3
    move-exception v0

    .line 396
    goto :goto_9

    .line 397
    :cond_d
    :goto_6
    iget v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 398
    .line 399
    if-ne v4, v5, :cond_e

    .line 400
    .line 401
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 402
    .line 403
    invoke-virtual {v3, v1}, Lorg/eclipse/jetty/client/HttpExchange;->onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 408
    .line 409
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 410
    .line 411
    :cond_e
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 412
    .line 413
    if-eqz v3, :cond_11

    .line 414
    .line 415
    if-eqz v6, :cond_10

    .line 416
    .line 417
    if-eq v1, p0, :cond_f

    .line 418
    .line 419
    goto :goto_7

    .line 420
    :cond_f
    iput-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 421
    .line 422
    goto :goto_8

    .line 423
    :cond_10
    :goto_7
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 424
    .line 425
    invoke-virtual {v4, v3}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 426
    .line 427
    .line 428
    :goto_8
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 429
    .line 430
    :cond_11
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 431
    .line 432
    if-nez v3, :cond_12

    .line 433
    .line 434
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->isReserved()Z

    .line 435
    .line 436
    .line 437
    move-result v3

    .line 438
    if-nez v3, :cond_12

    .line 439
    .line 440
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 441
    .line 442
    xor-int/lit8 v4, v6, 0x1

    .line 443
    .line 444
    invoke-virtual {v3, p0, v4}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V

    .line 445
    .line 446
    .line 447
    :cond_12
    monitor-exit p0

    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :goto_9
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 451
    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 452
    :goto_a
    :try_start_9
    sget-object v8, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 453
    .line 454
    new-instance v9, Ljava/lang/StringBuilder;

    .line 455
    .line 456
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 457
    .line 458
    .line 459
    const-string v10, "Failure on "

    .line 460
    .line 461
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 465
    .line 466
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v9

    .line 473
    invoke-interface {v8, v9, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 474
    .line 475
    .line 476
    :try_start_a
    monitor-enter p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 477
    :try_start_b
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 478
    .line 479
    .line 480
    move-result v2

    .line 481
    const/16 v9, 0xa

    .line 482
    .line 483
    if-eq v2, v9, :cond_13

    .line 484
    .line 485
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 486
    .line 487
    .line 488
    move-result v2

    .line 489
    const/16 v9, 0xb

    .line 490
    .line 491
    if-eq v2, v9, :cond_13

    .line 492
    .line 493
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->isDone()Z

    .line 494
    .line 495
    .line 496
    move-result v2

    .line 497
    if-nez v2, :cond_13

    .line 498
    .line 499
    const/16 v2, 0x9

    .line 500
    .line 501
    invoke-virtual {v3, v2}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 502
    .line 503
    .line 504
    move-result v2

    .line 505
    if-eqz v2, :cond_13

    .line 506
    .line 507
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    invoke-interface {v2, v4}, Lorg/eclipse/jetty/client/HttpEventListener;->onException(Ljava/lang/Throwable;)V

    .line 512
    .line 513
    .line 514
    goto :goto_b

    .line 515
    :catchall_4
    move-exception v2

    .line 516
    goto :goto_e

    .line 517
    :cond_13
    :goto_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 518
    :try_start_c
    const-string v2, "{} {}"

    .line 519
    .line 520
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 521
    .line 522
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 523
    .line 524
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    move-result-object v3

    .line 528
    invoke-interface {v8, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 529
    .line 530
    .line 531
    const-string v2, "{}"

    .line 532
    .line 533
    iget-object v3, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 534
    .line 535
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object v3

    .line 539
    invoke-interface {v8, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 540
    .line 541
    .line 542
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 543
    .line 544
    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->setPersistent(Z)V

    .line 545
    .line 546
    .line 547
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/BlockingHttpConnection;->reset()V

    .line 548
    .line 549
    .line 550
    monitor-enter p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 551
    :try_start_d
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 552
    .line 553
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 554
    .line 555
    if-eqz v2, :cond_14

    .line 556
    .line 557
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 558
    .line 559
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 560
    .line 561
    .line 562
    move-result-object v3

    .line 563
    invoke-virtual {v2, v3}, Lorg/eclipse/jetty/client/HttpExchange;->cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 564
    .line 565
    .line 566
    goto :goto_c

    .line 567
    :catchall_5
    move-exception v0

    .line 568
    goto :goto_d

    .line 569
    :cond_14
    :goto_c
    iget v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 570
    .line 571
    if-ne v3, v5, :cond_15

    .line 572
    .line 573
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 574
    .line 575
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/client/HttpExchange;->onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;

    .line 576
    .line 577
    .line 578
    move-result-object v1

    .line 579
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 580
    .line 581
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 582
    .line 583
    :cond_15
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 584
    .line 585
    if-eqz v2, :cond_16

    .line 586
    .line 587
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 588
    .line 589
    invoke-virtual {v3, v2}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 590
    .line 591
    .line 592
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 593
    .line 594
    :cond_16
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 595
    .line 596
    if-nez v2, :cond_17

    .line 597
    .line 598
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->isReserved()Z

    .line 599
    .line 600
    .line 601
    move-result v2

    .line 602
    if-nez v2, :cond_17

    .line 603
    .line 604
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 605
    .line 606
    invoke-virtual {v2, p0, v6}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V

    .line 607
    .line 608
    .line 609
    :cond_17
    monitor-exit p0

    .line 610
    move v2, v6

    .line 611
    goto/16 :goto_0

    .line 612
    .line 613
    :goto_d
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 614
    :try_start_e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 615
    :goto_e
    :try_start_f
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 616
    :try_start_10
    throw v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 617
    :catchall_6
    move-exception v2

    .line 618
    move v3, v6

    .line 619
    goto :goto_f

    .line 620
    :catchall_7
    move-exception v3

    .line 621
    move-object v11, v3

    .line 622
    move v3, v2

    .line 623
    move-object v2, v11

    .line 624
    :goto_f
    :try_start_11
    sget-object v4, Lorg/eclipse/jetty/client/BlockingHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 625
    .line 626
    const-string v8, "{} {}"

    .line 627
    .line 628
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 629
    .line 630
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 631
    .line 632
    filled-new-array {v9, v10}, [Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    move-result-object v9

    .line 636
    invoke-interface {v4, v8, v9}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 637
    .line 638
    .line 639
    const-string v8, "{}"

    .line 640
    .line 641
    iget-object v9, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 642
    .line 643
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 644
    .line 645
    .line 646
    move-result-object v9

    .line 647
    invoke-interface {v4, v8, v9}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 648
    .line 649
    .line 650
    if-nez v3, :cond_18

    .line 651
    .line 652
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 653
    .line 654
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 655
    .line 656
    .line 657
    move-result v4

    .line 658
    if-eqz v4, :cond_21

    .line 659
    .line 660
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 661
    .line 662
    invoke-virtual {v4}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 663
    .line 664
    .line 665
    move-result v4

    .line 666
    if-eqz v4, :cond_21

    .line 667
    .line 668
    :cond_18
    if-nez v3, :cond_19

    .line 669
    .line 670
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 671
    .line 672
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/HttpParser;->isPersistent()Z

    .line 673
    .line 674
    .line 675
    move-result v3

    .line 676
    if-eqz v3, :cond_19

    .line 677
    .line 678
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 679
    .line 680
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/AbstractGenerator;->isPersistent()Z

    .line 681
    .line 682
    .line 683
    move-result v3

    .line 684
    if-eqz v3, :cond_19

    .line 685
    .line 686
    move v0, v6

    .line 687
    :cond_19
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 688
    .line 689
    invoke-virtual {v3, v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->setPersistent(Z)V

    .line 690
    .line 691
    .line 692
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/BlockingHttpConnection;->reset()V

    .line 693
    .line 694
    .line 695
    if-eqz v0, :cond_1a

    .line 696
    .line 697
    iget-object v3, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 698
    .line 699
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 700
    .line 701
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 702
    .line 703
    .line 704
    move-result-object v4

    .line 705
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpClient;->getIdleTimeout()J

    .line 706
    .line 707
    .line 708
    move-result-wide v8

    .line 709
    long-to-int v4, v8

    .line 710
    invoke-interface {v3, v4}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 711
    .line 712
    .line 713
    :cond_1a
    monitor-enter p0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 714
    :try_start_12
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 715
    .line 716
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 717
    .line 718
    if-eqz v3, :cond_1b

    .line 719
    .line 720
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 721
    .line 722
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 723
    .line 724
    .line 725
    move-result-object v4

    .line 726
    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/client/HttpExchange;->cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 727
    .line 728
    .line 729
    goto :goto_10

    .line 730
    :catchall_8
    move-exception v0

    .line 731
    goto :goto_13

    .line 732
    :cond_1b
    :goto_10
    iget v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 733
    .line 734
    if-ne v4, v5, :cond_1c

    .line 735
    .line 736
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 737
    .line 738
    invoke-virtual {v3, v1}, Lorg/eclipse/jetty/client/HttpExchange;->onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;

    .line 739
    .line 740
    .line 741
    move-result-object v1

    .line 742
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 743
    .line 744
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 745
    .line 746
    :cond_1c
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 747
    .line 748
    if-eqz v3, :cond_1f

    .line 749
    .line 750
    if-eqz v0, :cond_1e

    .line 751
    .line 752
    if-eq v1, p0, :cond_1d

    .line 753
    .line 754
    goto :goto_11

    .line 755
    :cond_1d
    iput-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 756
    .line 757
    goto :goto_12

    .line 758
    :cond_1e
    :goto_11
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 759
    .line 760
    invoke-virtual {v1, v3}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 761
    .line 762
    .line 763
    :goto_12
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 764
    .line 765
    :cond_1f
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 766
    .line 767
    if-nez v1, :cond_20

    .line 768
    .line 769
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->isReserved()Z

    .line 770
    .line 771
    .line 772
    move-result v1

    .line 773
    if-nez v1, :cond_20

    .line 774
    .line 775
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 776
    .line 777
    xor-int/2addr v0, v6

    .line 778
    invoke-virtual {v1, p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V

    .line 779
    .line 780
    .line 781
    :cond_20
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    .line 782
    :cond_21
    :try_start_13
    throw v2
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_2

    .line 783
    :goto_13
    :try_start_14
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    .line 784
    :try_start_15
    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    .line 785
    :goto_14
    :try_start_16
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    .line 786
    :try_start_17
    throw v0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_2

    .line 787
    :cond_22
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 788
    .line 789
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser;->returnBuffers()V

    .line 790
    .line 791
    .line 792
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 793
    .line 794
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->returnBuffers()V

    .line 795
    .line 796
    .line 797
    return-object v1

    .line 798
    :goto_15
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 799
    .line 800
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->returnBuffers()V

    .line 801
    .line 802
    .line 803
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 804
    .line 805
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->returnBuffers()V

    .line 806
    .line 807
    .line 808
    throw v0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/BlockingHttpConnection;->_requestComplete:Z

    .line 3
    .line 4
    invoke-super {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public send(Lorg/eclipse/jetty/client/HttpExchange;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->send(Lorg/eclipse/jetty/client/HttpExchange;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return p1

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p1

    .line 16
    :cond_0
    return p1
.end method
