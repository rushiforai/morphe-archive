.class public Lorg/eclipse/jetty/client/AsyncHttpConnection;
.super Lorg/eclipse/jetty/client/AbstractHttpConnection;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/nio/AsyncConnection;


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private final _asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

.field private _requestComplete:Z

.field private _requestContentChunk:Lorg/eclipse/jetty/io/Buffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/client/AsyncHttpConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

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
    check-cast p3, Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 5
    .line 6
    iput-object p3, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public handle()Lorg/eclipse/jetty/io/Connection;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    move-object v3, p0

    .line 4
    move v2, v0

    .line 5
    move v4, v1

    .line 6
    :goto_0
    if-eqz v2, :cond_2a

    .line 7
    .line 8
    if-ne v3, p0, :cond_2a

    .line 9
    .line 10
    :try_start_0
    sget-object v5, Lorg/eclipse/jetty/client/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 11
    .line 12
    const-string v6, "while open={} more={} progress={}"

    .line 13
    .line 14
    iget-object v7, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 15
    .line 16
    invoke-interface {v7}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    iget-object v8, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 25
    .line 26
    invoke-virtual {v8}, Lorg/eclipse/jetty/http/HttpParser;->isMoreInBuffer()Z

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    filled-new-array {v7, v8, v2}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v5, v6, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 46
    .line 47
    const-string v6, "exchange {} on {}"

    .line 48
    .line 49
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-interface {v5, v6, v7}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 54
    .line 55
    .line 56
    const/16 v6, 0x65

    .line 57
    .line 58
    const/4 v7, 0x0

    .line 59
    :try_start_1
    iget-object v8, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 60
    .line 61
    invoke-virtual {v8}, Lorg/eclipse/jetty/http/AbstractGenerator;->isCommitted()Z

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    const/4 v9, 0x2

    .line 66
    if-nez v8, :cond_0

    .line 67
    .line 68
    if-eqz v2, :cond_0

    .line 69
    .line 70
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    if-ne v8, v9, :cond_0

    .line 75
    .line 76
    const-string v8, "commit {}"

    .line 77
    .line 78
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    invoke-interface {v5, v8, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 83
    .line 84
    .line 85
    :try_start_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->commitRequest()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 86
    .line 87
    .line 88
    move v8, v0

    .line 89
    goto :goto_1

    .line 90
    :catchall_0
    move-exception v5

    .line 91
    move v8, v0

    .line 92
    goto/16 :goto_d

    .line 93
    .line 94
    :catchall_1
    move-exception v5

    .line 95
    move v8, v1

    .line 96
    goto/16 :goto_d

    .line 97
    .line 98
    :cond_0
    move v8, v1

    .line 99
    :goto_1
    :try_start_3
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 100
    .line 101
    invoke-virtual {v10}, Lorg/eclipse/jetty/http/AbstractGenerator;->isCommitted()Z

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    if-eqz v10, :cond_6

    .line 106
    .line 107
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 108
    .line 109
    invoke-virtual {v10}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    if-nez v10, :cond_6

    .line 114
    .line 115
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 116
    .line 117
    invoke-virtual {v10}, Lorg/eclipse/jetty/http/HttpGenerator;->flushBuffer()I

    .line 118
    .line 119
    .line 120
    move-result v10

    .line 121
    if-lez v10, :cond_1

    .line 122
    .line 123
    const-string v10, "flushed"

    .line 124
    .line 125
    new-array v11, v1, [Ljava/lang/Object;

    .line 126
    .line 127
    invoke-interface {v5, v10, v11}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    move v8, v0

    .line 131
    goto :goto_2

    .line 132
    :catchall_2
    move-exception v5

    .line 133
    goto/16 :goto_d

    .line 134
    .line 135
    :cond_1
    :goto_2
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 136
    .line 137
    invoke-virtual {v10, v9}, Lorg/eclipse/jetty/http/AbstractGenerator;->isState(I)Z

    .line 138
    .line 139
    .line 140
    move-result v9

    .line 141
    if-eqz v9, :cond_6

    .line 142
    .line 143
    iget-object v9, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 144
    .line 145
    if-nez v9, :cond_2

    .line 146
    .line 147
    invoke-virtual {v2, v7}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestContentChunk(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 148
    .line 149
    .line 150
    move-result-object v9

    .line 151
    iput-object v9, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 152
    .line 153
    :cond_2
    iget-object v9, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 154
    .line 155
    if-nez v9, :cond_4

    .line 156
    .line 157
    const-string v9, "complete {}"

    .line 158
    .line 159
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v10

    .line 163
    invoke-interface {v5, v9, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 164
    .line 165
    .line 166
    :try_start_4
    iget-object v8, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 167
    .line 168
    invoke-virtual {v8}, Lorg/eclipse/jetty/http/HttpGenerator;->complete()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 169
    .line 170
    .line 171
    :cond_3
    :goto_3
    move v8, v0

    .line 172
    goto :goto_5

    .line 173
    :cond_4
    :try_start_5
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 174
    .line 175
    invoke-virtual {v9}, Lorg/eclipse/jetty/http/HttpGenerator;->isEmpty()Z

    .line 176
    .line 177
    .line 178
    move-result v9

    .line 179
    if-eqz v9, :cond_6

    .line 180
    .line 181
    const-string v9, "addChunk"

    .line 182
    .line 183
    new-array v10, v1, [Ljava/lang/Object;

    .line 184
    .line 185
    invoke-interface {v5, v9, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 186
    .line 187
    .line 188
    :try_start_6
    iget-object v8, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 189
    .line 190
    invoke-virtual {v2, v7}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestContentChunk(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 191
    .line 192
    .line 193
    move-result-object v9

    .line 194
    iput-object v9, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 195
    .line 196
    iget-object v10, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 197
    .line 198
    if-nez v9, :cond_5

    .line 199
    .line 200
    move v9, v0

    .line 201
    goto :goto_4

    .line 202
    :cond_5
    move v9, v1

    .line 203
    :goto_4
    invoke-virtual {v10, v8, v9}, Lorg/eclipse/jetty/http/HttpGenerator;->addContent(Lorg/eclipse/jetty/io/Buffer;Z)V

    .line 204
    .line 205
    .line 206
    iget-object v8, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestContentChunk:Lorg/eclipse/jetty/io/Buffer;

    .line 207
    .line 208
    if-nez v8, :cond_3

    .line 209
    .line 210
    const/4 v8, 0x4

    .line 211
    invoke-virtual {v2, v8}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 212
    .line 213
    .line 214
    goto :goto_3

    .line 215
    :cond_6
    :goto_5
    :try_start_7
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 216
    .line 217
    invoke-virtual {v9}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 218
    .line 219
    .line 220
    move-result v9

    .line 221
    if-eqz v9, :cond_7

    .line 222
    .line 223
    iget-boolean v9, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestComplete:Z

    .line 224
    .line 225
    if-nez v9, :cond_7

    .line 226
    .line 227
    const-string v9, "requestComplete {}"

    .line 228
    .line 229
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v10

    .line 233
    invoke-interface {v5, v9, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 234
    .line 235
    .line 236
    :try_start_8
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestComplete:Z

    .line 237
    .line 238
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 239
    .line 240
    .line 241
    move-result-object v8

    .line 242
    invoke-interface {v8}, Lorg/eclipse/jetty/client/HttpEventListener;->onRequestComplete()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 243
    .line 244
    .line 245
    move v8, v0

    .line 246
    :cond_7
    :try_start_9
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 247
    .line 248
    invoke-virtual {v9}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 249
    .line 250
    .line 251
    move-result v9

    .line 252
    if-nez v9, :cond_8

    .line 253
    .line 254
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 255
    .line 256
    invoke-virtual {v9}, Lorg/eclipse/jetty/http/HttpParser;->parseAvailable()Z

    .line 257
    .line 258
    .line 259
    move-result v9

    .line 260
    if-eqz v9, :cond_8

    .line 261
    .line 262
    const-string v9, "parsed {}"

    .line 263
    .line 264
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v10

    .line 268
    invoke-interface {v5, v9, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    move v8, v0

    .line 272
    :cond_8
    iget-object v9, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 273
    .line 274
    invoke-interface {v9}, Lorg/eclipse/jetty/io/EndPoint;->flush()V

    .line 275
    .line 276
    .line 277
    iget-object v9, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 278
    .line 279
    invoke-interface {v9}, Lorg/eclipse/jetty/io/AsyncEndPoint;->hasProgressed()Z

    .line 280
    .line 281
    .line 282
    move-result v9

    .line 283
    if-eqz v9, :cond_9

    .line 284
    .line 285
    const-string v9, "hasProgressed {}"

    .line 286
    .line 287
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v10

    .line 291
    invoke-interface {v5, v9, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 292
    .line 293
    .line 294
    move v8, v0

    .line 295
    :cond_9
    :try_start_a
    const-string v9, "finally {} on {} progress={} {}"

    .line 296
    .line 297
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 298
    .line 299
    .line 300
    move-result-object v10

    .line 301
    iget-object v11, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 302
    .line 303
    filled-new-array {v2, p0, v10, v11}, [Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    invoke-interface {v5, v9, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    if-nez v4, :cond_a

    .line 311
    .line 312
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 313
    .line 314
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    if-eqz v2, :cond_14

    .line 319
    .line 320
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 321
    .line 322
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 323
    .line 324
    .line 325
    move-result v2

    .line 326
    if-eqz v2, :cond_14

    .line 327
    .line 328
    goto :goto_6

    .line 329
    :catchall_3
    move-exception v0

    .line 330
    goto/16 :goto_17

    .line 331
    .line 332
    :cond_a
    :goto_6
    if-nez v4, :cond_b

    .line 333
    .line 334
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 335
    .line 336
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpParser;->isPersistent()Z

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    if-eqz v2, :cond_b

    .line 341
    .line 342
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 343
    .line 344
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->isPersistent()Z

    .line 345
    .line 346
    .line 347
    move-result v2

    .line 348
    if-eqz v2, :cond_b

    .line 349
    .line 350
    move v2, v0

    .line 351
    goto :goto_7

    .line 352
    :cond_b
    move v2, v1

    .line 353
    :goto_7
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 354
    .line 355
    invoke-virtual {v5, v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->setPersistent(Z)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AsyncHttpConnection;->reset()V

    .line 359
    .line 360
    .line 361
    if-eqz v2, :cond_c

    .line 362
    .line 363
    iget-object v5, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 364
    .line 365
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 366
    .line 367
    invoke-virtual {v9}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 368
    .line 369
    .line 370
    move-result-object v9

    .line 371
    invoke-virtual {v9}, Lorg/eclipse/jetty/client/HttpClient;->getIdleTimeout()J

    .line 372
    .line 373
    .line 374
    move-result-wide v9

    .line 375
    long-to-int v9, v9

    .line 376
    invoke-interface {v5, v9}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 377
    .line 378
    .line 379
    :cond_c
    monitor-enter p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 380
    :try_start_b
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 381
    .line 382
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 383
    .line 384
    if-eqz v5, :cond_d

    .line 385
    .line 386
    iget-object v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 387
    .line 388
    invoke-virtual {v9}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 389
    .line 390
    .line 391
    move-result-object v9

    .line 392
    invoke-virtual {v5, v9}, Lorg/eclipse/jetty/client/HttpExchange;->cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 393
    .line 394
    .line 395
    goto :goto_8

    .line 396
    :catchall_4
    move-exception v0

    .line 397
    goto :goto_c

    .line 398
    :cond_d
    :goto_8
    iget v9, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 399
    .line 400
    if-ne v9, v6, :cond_f

    .line 401
    .line 402
    iget-object v6, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 403
    .line 404
    invoke-virtual {v5, v6}, Lorg/eclipse/jetty/client/HttpExchange;->onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    if-eqz v5, :cond_f

    .line 409
    .line 410
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 411
    .line 412
    if-eqz v3, :cond_e

    .line 413
    .line 414
    iget-object v6, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 415
    .line 416
    invoke-virtual {v6, v3}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 417
    .line 418
    .line 419
    :cond_e
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 420
    .line 421
    move-object v3, v5

    .line 422
    :cond_f
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 423
    .line 424
    if-eqz v5, :cond_12

    .line 425
    .line 426
    if-eqz v2, :cond_11

    .line 427
    .line 428
    if-eq v3, p0, :cond_10

    .line 429
    .line 430
    goto :goto_9

    .line 431
    :cond_10
    iput-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 432
    .line 433
    goto :goto_a

    .line 434
    :cond_11
    :goto_9
    iget-object v6, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 435
    .line 436
    invoke-virtual {v6, v5}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 437
    .line 438
    .line 439
    :goto_a
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 440
    .line 441
    :cond_12
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 442
    .line 443
    if-nez v5, :cond_13

    .line 444
    .line 445
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->isReserved()Z

    .line 446
    .line 447
    .line 448
    move-result v5

    .line 449
    if-nez v5, :cond_13

    .line 450
    .line 451
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 452
    .line 453
    xor-int/lit8 v2, v2, 0x1

    .line 454
    .line 455
    invoke-virtual {v5, p0, v2}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V

    .line 456
    .line 457
    .line 458
    :cond_13
    monitor-exit p0

    .line 459
    :cond_14
    :goto_b
    move v2, v8

    .line 460
    goto/16 :goto_0

    .line 461
    .line 462
    :goto_c
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 463
    :try_start_c
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 464
    :goto_d
    :try_start_d
    sget-object v9, Lorg/eclipse/jetty/client/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 465
    .line 466
    new-instance v10, Ljava/lang/StringBuilder;

    .line 467
    .line 468
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 469
    .line 470
    .line 471
    const-string v11, "Failure on "

    .line 472
    .line 473
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    iget-object v11, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 477
    .line 478
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v10

    .line 485
    invoke-interface {v9, v10, v5}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    .line 486
    .line 487
    .line 488
    :try_start_e
    monitor-enter p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    .line 489
    if-eqz v2, :cond_1b

    .line 490
    .line 491
    :try_start_f
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 492
    .line 493
    .line 494
    move-result v4

    .line 495
    const/16 v10, 0xa

    .line 496
    .line 497
    if-eq v4, v10, :cond_15

    .line 498
    .line 499
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 500
    .line 501
    .line 502
    move-result v4

    .line 503
    const/16 v10, 0xb

    .line 504
    .line 505
    if-eq v4, v10, :cond_15

    .line 506
    .line 507
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->isDone()Z

    .line 508
    .line 509
    .line 510
    move-result v4

    .line 511
    if-nez v4, :cond_15

    .line 512
    .line 513
    const/16 v4, 0x9

    .line 514
    .line 515
    invoke-virtual {v2, v4}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 516
    .line 517
    .line 518
    move-result v4

    .line 519
    if-eqz v4, :cond_15

    .line 520
    .line 521
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 522
    .line 523
    .line 524
    move-result-object v4

    .line 525
    invoke-interface {v4, v5}, Lorg/eclipse/jetty/client/HttpEventListener;->onException(Ljava/lang/Throwable;)V

    .line 526
    .line 527
    .line 528
    goto :goto_e

    .line 529
    :catchall_5
    move-exception v4

    .line 530
    goto/16 :goto_11

    .line 531
    .line 532
    :cond_15
    :goto_e
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 533
    :try_start_10
    const-string v4, "finally {} on {} progress={} {}"

    .line 534
    .line 535
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 536
    .line 537
    .line 538
    move-result-object v5

    .line 539
    iget-object v10, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 540
    .line 541
    filled-new-array {v2, p0, v5, v10}, [Ljava/lang/Object;

    .line 542
    .line 543
    .line 544
    move-result-object v2

    .line 545
    invoke-interface {v9, v4, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 546
    .line 547
    .line 548
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 549
    .line 550
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->setPersistent(Z)V

    .line 551
    .line 552
    .line 553
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AsyncHttpConnection;->reset()V

    .line 554
    .line 555
    .line 556
    monitor-enter p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    .line 557
    :try_start_11
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 558
    .line 559
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 560
    .line 561
    if-eqz v2, :cond_16

    .line 562
    .line 563
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 564
    .line 565
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 566
    .line 567
    .line 568
    move-result-object v4

    .line 569
    invoke-virtual {v2, v4}, Lorg/eclipse/jetty/client/HttpExchange;->cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 570
    .line 571
    .line 572
    goto :goto_f

    .line 573
    :catchall_6
    move-exception v0

    .line 574
    goto :goto_10

    .line 575
    :cond_16
    :goto_f
    iget v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 576
    .line 577
    if-ne v4, v6, :cond_18

    .line 578
    .line 579
    iget-object v4, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 580
    .line 581
    invoke-virtual {v2, v4}, Lorg/eclipse/jetty/client/HttpExchange;->onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;

    .line 582
    .line 583
    .line 584
    move-result-object v2

    .line 585
    if-eqz v2, :cond_18

    .line 586
    .line 587
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 588
    .line 589
    if-eqz v3, :cond_17

    .line 590
    .line 591
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 592
    .line 593
    invoke-virtual {v4, v3}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 594
    .line 595
    .line 596
    :cond_17
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 597
    .line 598
    move-object v3, v2

    .line 599
    :cond_18
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 600
    .line 601
    if-eqz v2, :cond_19

    .line 602
    .line 603
    iget-object v4, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 604
    .line 605
    invoke-virtual {v4, v2}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 606
    .line 607
    .line 608
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 609
    .line 610
    :cond_19
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 611
    .line 612
    if-nez v2, :cond_1a

    .line 613
    .line 614
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->isReserved()Z

    .line 615
    .line 616
    .line 617
    move-result v2

    .line 618
    if-nez v2, :cond_1a

    .line 619
    .line 620
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 621
    .line 622
    invoke-virtual {v2, p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V

    .line 623
    .line 624
    .line 625
    :cond_1a
    monitor-exit p0

    .line 626
    move v4, v0

    .line 627
    goto/16 :goto_b

    .line 628
    .line 629
    :goto_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    .line 630
    :try_start_12
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 631
    :cond_1b
    :try_start_13
    instance-of v4, v5, Ljava/io/IOException;

    .line 632
    .line 633
    if-nez v4, :cond_1e

    .line 634
    .line 635
    instance-of v4, v5, Ljava/lang/Error;

    .line 636
    .line 637
    if-nez v4, :cond_1d

    .line 638
    .line 639
    instance-of v4, v5, Ljava/lang/RuntimeException;

    .line 640
    .line 641
    if-eqz v4, :cond_1c

    .line 642
    .line 643
    check-cast v5, Ljava/lang/RuntimeException;

    .line 644
    .line 645
    throw v5

    .line 646
    :cond_1c
    new-instance v4, Ljava/lang/RuntimeException;

    .line 647
    .line 648
    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 649
    .line 650
    .line 651
    throw v4

    .line 652
    :cond_1d
    check-cast v5, Ljava/lang/Error;

    .line 653
    .line 654
    throw v5

    .line 655
    :cond_1e
    check-cast v5, Ljava/io/IOException;

    .line 656
    .line 657
    throw v5

    .line 658
    :goto_11
    monitor-exit p0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 659
    :try_start_14
    throw v4
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_7

    .line 660
    :catchall_7
    move-exception v4

    .line 661
    move v5, v0

    .line 662
    goto :goto_12

    .line 663
    :catchall_8
    move-exception v5

    .line 664
    move-object v12, v5

    .line 665
    move v5, v4

    .line 666
    move-object v4, v12

    .line 667
    :goto_12
    :try_start_15
    sget-object v9, Lorg/eclipse/jetty/client/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 668
    .line 669
    const-string v10, "finally {} on {} progress={} {}"

    .line 670
    .line 671
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 672
    .line 673
    .line 674
    move-result-object v8

    .line 675
    iget-object v11, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 676
    .line 677
    filled-new-array {v2, p0, v8, v11}, [Ljava/lang/Object;

    .line 678
    .line 679
    .line 680
    move-result-object v2

    .line 681
    invoke-interface {v9, v10, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 682
    .line 683
    .line 684
    if-nez v5, :cond_1f

    .line 685
    .line 686
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 687
    .line 688
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->isComplete()Z

    .line 689
    .line 690
    .line 691
    move-result v2

    .line 692
    if-eqz v2, :cond_29

    .line 693
    .line 694
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 695
    .line 696
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 697
    .line 698
    .line 699
    move-result v2

    .line 700
    if-eqz v2, :cond_29

    .line 701
    .line 702
    :cond_1f
    if-nez v5, :cond_20

    .line 703
    .line 704
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 705
    .line 706
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpParser;->isPersistent()Z

    .line 707
    .line 708
    .line 709
    move-result v2

    .line 710
    if-eqz v2, :cond_20

    .line 711
    .line 712
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 713
    .line 714
    invoke-virtual {v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->isPersistent()Z

    .line 715
    .line 716
    .line 717
    move-result v2

    .line 718
    if-eqz v2, :cond_20

    .line 719
    .line 720
    move v1, v0

    .line 721
    :cond_20
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 722
    .line 723
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->setPersistent(Z)V

    .line 724
    .line 725
    .line 726
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AsyncHttpConnection;->reset()V

    .line 727
    .line 728
    .line 729
    if-eqz v1, :cond_21

    .line 730
    .line 731
    iget-object v2, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 732
    .line 733
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 734
    .line 735
    invoke-virtual {v5}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 736
    .line 737
    .line 738
    move-result-object v5

    .line 739
    invoke-virtual {v5}, Lorg/eclipse/jetty/client/HttpClient;->getIdleTimeout()J

    .line 740
    .line 741
    .line 742
    move-result-wide v8

    .line 743
    long-to-int v5, v8

    .line 744
    invoke-interface {v2, v5}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 745
    .line 746
    .line 747
    :cond_21
    monitor-enter p0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    .line 748
    :try_start_16
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 749
    .line 750
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 751
    .line 752
    if-eqz v2, :cond_22

    .line 753
    .line 754
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 755
    .line 756
    invoke-virtual {v5}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 757
    .line 758
    .line 759
    move-result-object v5

    .line 760
    invoke-virtual {v2, v5}, Lorg/eclipse/jetty/client/HttpExchange;->cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 761
    .line 762
    .line 763
    goto :goto_13

    .line 764
    :catchall_9
    move-exception v0

    .line 765
    goto :goto_16

    .line 766
    :cond_22
    :goto_13
    iget v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 767
    .line 768
    if-ne v5, v6, :cond_24

    .line 769
    .line 770
    iget-object v5, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 771
    .line 772
    invoke-virtual {v2, v5}, Lorg/eclipse/jetty/client/HttpExchange;->onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;

    .line 773
    .line 774
    .line 775
    move-result-object v2

    .line 776
    if-eqz v2, :cond_24

    .line 777
    .line 778
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 779
    .line 780
    if-eqz v3, :cond_23

    .line 781
    .line 782
    iget-object v5, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 783
    .line 784
    invoke-virtual {v5, v3}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 785
    .line 786
    .line 787
    :cond_23
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 788
    .line 789
    move-object v3, v2

    .line 790
    :cond_24
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 791
    .line 792
    if-eqz v2, :cond_27

    .line 793
    .line 794
    if-eqz v1, :cond_26

    .line 795
    .line 796
    if-eq v3, p0, :cond_25

    .line 797
    .line 798
    goto :goto_14

    .line 799
    :cond_25
    iput-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 800
    .line 801
    goto :goto_15

    .line 802
    :cond_26
    :goto_14
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 803
    .line 804
    invoke-virtual {v3, v2}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 805
    .line 806
    .line 807
    :goto_15
    iput-object v7, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_pipeline:Lorg/eclipse/jetty/client/HttpExchange;

    .line 808
    .line 809
    :cond_27
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 810
    .line 811
    if-nez v2, :cond_28

    .line 812
    .line 813
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->isReserved()Z

    .line 814
    .line 815
    .line 816
    move-result v2

    .line 817
    if-nez v2, :cond_28

    .line 818
    .line 819
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 820
    .line 821
    xor-int/2addr v0, v1

    .line 822
    invoke-virtual {v2, p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V

    .line 823
    .line 824
    .line 825
    :cond_28
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9

    .line 826
    :cond_29
    :try_start_17
    throw v4
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    .line 827
    :goto_16
    :try_start_18
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_9

    .line 828
    :try_start_19
    throw v0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_3

    .line 829
    :goto_17
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 830
    .line 831
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->returnBuffers()V

    .line 832
    .line 833
    .line 834
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 835
    .line 836
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->returnBuffers()V

    .line 837
    .line 838
    .line 839
    sget-object v1, Lorg/eclipse/jetty/client/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 840
    .line 841
    const-string v2, "unhandle {} on {}"

    .line 842
    .line 843
    iget-object v3, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 844
    .line 845
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 846
    .line 847
    filled-new-array {v3, p0}, [Ljava/lang/Object;

    .line 848
    .line 849
    .line 850
    move-result-object p0

    .line 851
    invoke-interface {v1, v2, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 852
    .line 853
    .line 854
    throw v0

    .line 855
    :cond_2a
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 856
    .line 857
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser;->returnBuffers()V

    .line 858
    .line 859
    .line 860
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 861
    .line 862
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->returnBuffers()V

    .line 863
    .line 864
    .line 865
    sget-object v0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 866
    .line 867
    const-string v1, "unhandle {} on {}"

    .line 868
    .line 869
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 870
    .line 871
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 872
    .line 873
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 874
    .line 875
    .line 876
    move-result-object p0

    .line 877
    invoke-interface {v0, v1, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 878
    .line 879
    .line 880
    return-object v3
.end method

.method public onInputShutdown()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/HttpGenerator;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isIdle()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 10
    .line 11
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
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
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_requestComplete:Z

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
    iget-object p0, p0, Lorg/eclipse/jetty/client/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 8
    .line 9
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->asyncDispatch()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return p1
.end method
