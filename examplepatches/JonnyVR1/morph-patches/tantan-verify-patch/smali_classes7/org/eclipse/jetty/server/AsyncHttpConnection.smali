.class public Lorg/eclipse/jetty/server/AsyncHttpConnection;
.super Lorg/eclipse/jetty/server/AbstractHttpConnection;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/nio/AsyncConnection;


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static final NO_PROGRESS_CLOSE:I

.field private static final NO_PROGRESS_INFO:I


# instance fields
.field private final _asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

.field private _readInterested:Z

.field private _total_no_progress:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "org.mortbay.jetty.NO_PROGRESS_INFO"

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_INFO:I

    .line 14
    .line 15
    const-string v0, "org.mortbay.jetty.NO_PROGRESS_CLOSE"

    .line 16
    .line 17
    const/16 v1, 0xc8

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sput v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_CLOSE:I

    .line 28
    .line 29
    const-class v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;

    .line 30
    .line 31
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/server/Connector;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Server;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/server/AbstractHttpConnection;-><init>(Lorg/eclipse/jetty/server/Connector;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Server;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_readInterested:Z

    .line 6
    .line 7
    check-cast p2, Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 8
    .line 9
    iput-object p2, p0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public handle()Lorg/eclipse/jetty/io/Connection;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "Closing EndPoint making no progress: "

    .line 4
    .line 5
    const-string v3, "EndPoint making no progress: "

    .line 6
    .line 7
    const-string v4, "suspended {}"

    .line 8
    .line 9
    const-string v5, "Disabled read interest while writing response {}"

    .line 10
    .line 11
    const-string v6, "Safety net oshut!!!  IF YOU SEE THIS, PLEASE RAISE BUGZILLA"

    .line 12
    .line 13
    const-string v7, "org.eclipse.jetty.io.Connection"

    .line 14
    .line 15
    const-string v8, " "

    .line 16
    .line 17
    const/4 v10, 0x0

    .line 18
    :try_start_0
    invoke-static {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->setCurrentConnection(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 22
    .line 23
    invoke-interface {v0, v10}, Lorg/eclipse/jetty/io/AsyncEndPoint;->setCheckForIdle(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 24
    .line 25
    .line 26
    move-object v12, v1

    .line 27
    move v13, v10

    .line 28
    const/4 v0, 0x1

    .line 29
    :goto_0
    if-eqz v0, :cond_15

    .line 30
    .line 31
    if-ne v12, v1, :cond_15

    .line 32
    .line 33
    const/16 v14, 0x65

    .line 34
    .line 35
    :try_start_1
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 36
    .line 37
    iget-object v0, v0, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 38
    .line 39
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsync()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 46
    .line 47
    iget-object v0, v0, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 48
    .line 49
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isDispatchable()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->handleRequest()V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    move v15, v10

    .line 61
    goto/16 :goto_e

    .line 62
    .line 63
    :catch_0
    move-exception v0

    .line 64
    move v15, v10

    .line 65
    goto/16 :goto_8

    .line 66
    .line 67
    :cond_0
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 68
    .line 69
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isComplete()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 76
    .line 77
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->parseAvailable()Z

    .line 78
    .line 79
    .line 80
    move-result v0
    :try_end_1
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    const/4 v15, 0x1

    .line 84
    goto :goto_2

    .line 85
    :cond_1
    :goto_1
    move v15, v10

    .line 86
    :goto_2
    :try_start_2
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 87
    .line 88
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isCommitted()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 95
    .line 96
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isComplete()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_2

    .line 101
    .line 102
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 103
    .line 104
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_2

    .line 109
    .line 110
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 111
    .line 112
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_2

    .line 121
    .line 122
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 123
    .line 124
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->flushBuffer()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-lez v0, :cond_2

    .line 129
    .line 130
    const/4 v15, 0x1

    .line 131
    goto :goto_3

    .line 132
    :catchall_1
    move-exception v0

    .line 133
    goto/16 :goto_e

    .line 134
    .line 135
    :catch_1
    move-exception v0

    .line 136
    goto/16 :goto_8

    .line 137
    .line 138
    :cond_2
    :goto_3
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 139
    .line 140
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->flush()V

    .line 141
    .line 142
    .line 143
    iget-object v0, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 144
    .line 145
    invoke-interface {v0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->hasProgressed()Z

    .line 146
    .line 147
    .line 148
    move-result v0
    :try_end_2
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    const/4 v15, 0x1

    .line 152
    :cond_3
    or-int/2addr v13, v15

    .line 153
    :try_start_3
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 154
    .line 155
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isComplete()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iget-object v9, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 160
    .line 161
    invoke-interface {v9}, Lorg/eclipse/jetty/http/Generator;->isComplete()Z

    .line 162
    .line 163
    .line 164
    move-result v9

    .line 165
    if-eqz v0, :cond_4

    .line 166
    .line 167
    if-eqz v9, :cond_4

    .line 168
    .line 169
    const/16 v17, 0x1

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_4
    move/from16 v17, v10

    .line 173
    .line 174
    :goto_4
    if-eqz v0, :cond_8

    .line 175
    .line 176
    if-eqz v9, :cond_7

    .line 177
    .line 178
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 179
    .line 180
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-ne v0, v14, :cond_5

    .line 185
    .line 186
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 187
    .line 188
    invoke-virtual {v0, v7}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    check-cast v0, Lorg/eclipse/jetty/io/Connection;

    .line 193
    .line 194
    if-eqz v0, :cond_5

    .line 195
    .line 196
    move-object v12, v0

    .line 197
    goto :goto_6

    .line 198
    :catchall_2
    move-exception v0

    .line 199
    :goto_5
    const/16 v16, 0x0

    .line 200
    .line 201
    goto/16 :goto_13

    .line 202
    .line 203
    :cond_5
    :goto_6
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AsyncHttpConnection;->reset()V

    .line 204
    .line 205
    .line 206
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 207
    .line 208
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isPersistent()Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-nez v0, :cond_6

    .line 213
    .line 214
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 215
    .line 216
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_6

    .line 221
    .line 222
    sget-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 223
    .line 224
    new-array v9, v10, [Ljava/lang/Object;

    .line 225
    .line 226
    invoke-interface {v0, v6, v9}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 230
    .line 231
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 232
    .line 233
    .line 234
    :cond_6
    const/4 v15, 0x1

    .line 235
    goto :goto_7

    .line 236
    :cond_7
    iput-boolean v10, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_readInterested:Z

    .line 237
    .line 238
    sget-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 239
    .line 240
    iget-object v9, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 241
    .line 242
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v9

    .line 246
    invoke-interface {v0, v5, v9}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    :cond_8
    :goto_7
    if-nez v17, :cond_9

    .line 250
    .line 251
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 252
    .line 253
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_9

    .line 262
    .line 263
    sget-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 264
    .line 265
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v9

    .line 269
    invoke-interface {v0, v4, v9}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 270
    .line 271
    .line 272
    move v15, v10

    .line 273
    :cond_9
    move v0, v15

    .line 274
    goto/16 :goto_d

    .line 275
    .line 276
    :goto_8
    :try_start_4
    sget-object v9, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 277
    .line 278
    invoke-interface {v9}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 279
    .line 280
    .line 281
    move-result v17

    .line 282
    if-eqz v17, :cond_a

    .line 283
    .line 284
    new-instance v14, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .line 288
    .line 289
    const-string v11, "uri="

    .line 290
    .line 291
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    iget-object v11, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 295
    .line 296
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v11

    .line 303
    new-array v14, v10, [Ljava/lang/Object;

    .line 304
    .line 305
    invoke-interface {v9, v11, v14}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 306
    .line 307
    .line 308
    new-instance v11, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .line 312
    .line 313
    const-string v14, "fields="

    .line 314
    .line 315
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    iget-object v14, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 319
    .line 320
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v11

    .line 327
    new-array v14, v10, [Ljava/lang/Object;

    .line 328
    .line 329
    invoke-interface {v9, v11, v14}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    invoke-interface {v9, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 333
    .line 334
    .line 335
    :cond_a
    :try_start_5
    iget-object v11, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 336
    .line 337
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpException;->getStatus()I

    .line 338
    .line 339
    .line 340
    move-result v14

    .line 341
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpException;->getReason()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    const/4 v10, 0x1

    .line 346
    const/4 v15, 0x0

    .line 347
    invoke-interface {v11, v14, v0, v15, v10}, Lorg/eclipse/jetty/http/Generator;->sendError(ILjava/lang/String;Ljava/lang/String;Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 348
    .line 349
    .line 350
    :try_start_6
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 351
    .line 352
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isComplete()Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    iget-object v10, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 357
    .line 358
    invoke-interface {v10}, Lorg/eclipse/jetty/http/Generator;->isComplete()Z

    .line 359
    .line 360
    .line 361
    move-result v10

    .line 362
    if-eqz v0, :cond_b

    .line 363
    .line 364
    if-eqz v10, :cond_b

    .line 365
    .line 366
    const/4 v11, 0x1

    .line 367
    goto :goto_9

    .line 368
    :cond_b
    const/4 v11, 0x0

    .line 369
    :goto_9
    if-eqz v0, :cond_e

    .line 370
    .line 371
    if-eqz v10, :cond_d

    .line 372
    .line 373
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 374
    .line 375
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 376
    .line 377
    .line 378
    move-result v0

    .line 379
    const/16 v10, 0x65

    .line 380
    .line 381
    if-ne v0, v10, :cond_c

    .line 382
    .line 383
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 384
    .line 385
    invoke-virtual {v0, v7}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    check-cast v0, Lorg/eclipse/jetty/io/Connection;

    .line 390
    .line 391
    if-eqz v0, :cond_c

    .line 392
    .line 393
    move-object v12, v0

    .line 394
    goto :goto_a

    .line 395
    :catchall_3
    move-exception v0

    .line 396
    const/4 v13, 0x1

    .line 397
    goto/16 :goto_5

    .line 398
    .line 399
    :cond_c
    :goto_a
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AsyncHttpConnection;->reset()V

    .line 400
    .line 401
    .line 402
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 403
    .line 404
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isPersistent()Z

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    if-nez v0, :cond_e

    .line 409
    .line 410
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 411
    .line 412
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-nez v0, :cond_e

    .line 417
    .line 418
    const/4 v10, 0x0

    .line 419
    new-array v0, v10, [Ljava/lang/Object;

    .line 420
    .line 421
    invoke-interface {v9, v6, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 422
    .line 423
    .line 424
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 425
    .line 426
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 427
    .line 428
    .line 429
    goto :goto_b

    .line 430
    :cond_d
    const/4 v10, 0x0

    .line 431
    iput-boolean v10, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_readInterested:Z

    .line 432
    .line 433
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 434
    .line 435
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-interface {v9, v5, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    :cond_e
    :goto_b
    if-nez v11, :cond_f

    .line 443
    .line 444
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 445
    .line 446
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    if-eqz v0, :cond_f

    .line 455
    .line 456
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    invoke-interface {v9, v4, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 461
    .line 462
    .line 463
    const/4 v0, 0x0

    .line 464
    goto :goto_c

    .line 465
    :cond_f
    const/4 v0, 0x1

    .line 466
    :goto_c
    const/4 v13, 0x1

    .line 467
    :goto_d
    const/4 v10, 0x0

    .line 468
    goto/16 :goto_0

    .line 469
    .line 470
    :catchall_4
    move-exception v0

    .line 471
    const/4 v15, 0x1

    .line 472
    :goto_e
    or-int/2addr v13, v15

    .line 473
    :try_start_7
    iget-object v9, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 474
    .line 475
    invoke-interface {v9}, Lorg/eclipse/jetty/http/Parser;->isComplete()Z

    .line 476
    .line 477
    .line 478
    move-result v9

    .line 479
    iget-object v10, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 480
    .line 481
    invoke-interface {v10}, Lorg/eclipse/jetty/http/Generator;->isComplete()Z

    .line 482
    .line 483
    .line 484
    move-result v10

    .line 485
    if-eqz v9, :cond_10

    .line 486
    .line 487
    if-eqz v10, :cond_10

    .line 488
    .line 489
    const/4 v11, 0x1

    .line 490
    goto :goto_f

    .line 491
    :cond_10
    const/4 v11, 0x0

    .line 492
    :goto_f
    if-eqz v9, :cond_13

    .line 493
    .line 494
    if-eqz v10, :cond_12

    .line 495
    .line 496
    iget-object v5, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 497
    .line 498
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 499
    .line 500
    .line 501
    move-result v5

    .line 502
    const/16 v10, 0x65

    .line 503
    .line 504
    if-ne v5, v10, :cond_11

    .line 505
    .line 506
    iget-object v5, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 507
    .line 508
    invoke-virtual {v5, v7}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v5

    .line 512
    check-cast v5, Lorg/eclipse/jetty/io/Connection;

    .line 513
    .line 514
    :cond_11
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AsyncHttpConnection;->reset()V

    .line 515
    .line 516
    .line 517
    iget-object v5, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 518
    .line 519
    invoke-interface {v5}, Lorg/eclipse/jetty/http/Generator;->isPersistent()Z

    .line 520
    .line 521
    .line 522
    move-result v5

    .line 523
    if-nez v5, :cond_13

    .line 524
    .line 525
    iget-object v5, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 526
    .line 527
    invoke-interface {v5}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 528
    .line 529
    .line 530
    move-result v5

    .line 531
    if-nez v5, :cond_13

    .line 532
    .line 533
    sget-object v5, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 534
    .line 535
    const/4 v10, 0x0

    .line 536
    new-array v7, v10, [Ljava/lang/Object;

    .line 537
    .line 538
    invoke-interface {v5, v6, v7}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 539
    .line 540
    .line 541
    iget-object v5, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 542
    .line 543
    invoke-interface {v5}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 544
    .line 545
    .line 546
    goto :goto_10

    .line 547
    :cond_12
    const/4 v10, 0x0

    .line 548
    iput-boolean v10, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_readInterested:Z

    .line 549
    .line 550
    sget-object v6, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 551
    .line 552
    iget-object v7, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 553
    .line 554
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 555
    .line 556
    .line 557
    move-result-object v7

    .line 558
    invoke-interface {v6, v5, v7}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 559
    .line 560
    .line 561
    :cond_13
    :goto_10
    if-nez v11, :cond_14

    .line 562
    .line 563
    iget-object v5, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 564
    .line 565
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 566
    .line 567
    .line 568
    move-result-object v5

    .line 569
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 570
    .line 571
    .line 572
    move-result v5

    .line 573
    if-eqz v5, :cond_14

    .line 574
    .line 575
    sget-object v5, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 576
    .line 577
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 578
    .line 579
    .line 580
    move-result-object v6

    .line 581
    invoke-interface {v5, v4, v6}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 582
    .line 583
    .line 584
    :cond_14
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 585
    :cond_15
    const/16 v16, 0x0

    .line 586
    .line 587
    invoke-static/range {v16 .. v16}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->setCurrentConnection(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 588
    .line 589
    .line 590
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 591
    .line 592
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 593
    .line 594
    .line 595
    move-result-object v0

    .line 596
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    if-nez v0, :cond_16

    .line 601
    .line 602
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 603
    .line 604
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->returnBuffers()V

    .line 605
    .line 606
    .line 607
    iget-object v0, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 608
    .line 609
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->returnBuffers()V

    .line 610
    .line 611
    .line 612
    iget-object v0, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 613
    .line 614
    const/4 v10, 0x1

    .line 615
    invoke-interface {v0, v10}, Lorg/eclipse/jetty/io/AsyncEndPoint;->setCheckForIdle(Z)V

    .line 616
    .line 617
    .line 618
    goto :goto_11

    .line 619
    :cond_16
    const/4 v10, 0x1

    .line 620
    :goto_11
    if-eqz v13, :cond_17

    .line 621
    .line 622
    const/4 v4, 0x0

    .line 623
    iput v4, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 624
    .line 625
    goto :goto_12

    .line 626
    :cond_17
    iget v0, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 627
    .line 628
    add-int/2addr v0, v10

    .line 629
    iput v0, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 630
    .line 631
    sget v4, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_INFO:I

    .line 632
    .line 633
    if-lez v4, :cond_19

    .line 634
    .line 635
    rem-int v4, v0, v4

    .line 636
    .line 637
    if-nez v4, :cond_19

    .line 638
    .line 639
    sget v4, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_CLOSE:I

    .line 640
    .line 641
    if-lez v4, :cond_18

    .line 642
    .line 643
    if-ge v0, v4, :cond_19

    .line 644
    .line 645
    :cond_18
    sget-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 646
    .line 647
    new-instance v4, Ljava/lang/StringBuilder;

    .line 648
    .line 649
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 650
    .line 651
    .line 652
    iget v3, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 653
    .line 654
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 658
    .line 659
    .line 660
    iget-object v3, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 661
    .line 662
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 666
    .line 667
    .line 668
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 669
    .line 670
    .line 671
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 672
    .line 673
    .line 674
    move-result-object v3

    .line 675
    const/4 v10, 0x0

    .line 676
    new-array v4, v10, [Ljava/lang/Object;

    .line 677
    .line 678
    invoke-interface {v0, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 679
    .line 680
    .line 681
    :cond_19
    sget v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_CLOSE:I

    .line 682
    .line 683
    if-lez v0, :cond_1a

    .line 684
    .line 685
    iget v3, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 686
    .line 687
    if-ne v3, v0, :cond_1a

    .line 688
    .line 689
    sget-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 690
    .line 691
    new-instance v3, Ljava/lang/StringBuilder;

    .line 692
    .line 693
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 694
    .line 695
    .line 696
    iget v2, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 697
    .line 698
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 699
    .line 700
    .line 701
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 702
    .line 703
    .line 704
    iget-object v2, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 705
    .line 706
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 707
    .line 708
    .line 709
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    .line 711
    .line 712
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 713
    .line 714
    .line 715
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 716
    .line 717
    .line 718
    move-result-object v2

    .line 719
    const/4 v10, 0x0

    .line 720
    new-array v3, v10, [Ljava/lang/Object;

    .line 721
    .line 722
    invoke-interface {v0, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 723
    .line 724
    .line 725
    iget-object v0, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 726
    .line 727
    instance-of v1, v0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 728
    .line 729
    if-eqz v1, :cond_1a

    .line 730
    .line 731
    check-cast v0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 732
    .line 733
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/nio/ChannelEndPoint;->getChannel()Ljava/nio/channels/ByteChannel;

    .line 734
    .line 735
    .line 736
    move-result-object v0

    .line 737
    invoke-interface {v0}, Ljava/nio/channels/Channel;->close()V

    .line 738
    .line 739
    .line 740
    :cond_1a
    :goto_12
    return-object v12

    .line 741
    :catchall_5
    move-exception v0

    .line 742
    const/4 v13, 0x0

    .line 743
    goto/16 :goto_5

    .line 744
    .line 745
    :goto_13
    invoke-static/range {v16 .. v16}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->setCurrentConnection(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 746
    .line 747
    .line 748
    iget-object v4, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 749
    .line 750
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 751
    .line 752
    .line 753
    move-result-object v4

    .line 754
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 755
    .line 756
    .line 757
    move-result v4

    .line 758
    if-nez v4, :cond_1b

    .line 759
    .line 760
    iget-object v4, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 761
    .line 762
    invoke-interface {v4}, Lorg/eclipse/jetty/http/Parser;->returnBuffers()V

    .line 763
    .line 764
    .line 765
    iget-object v4, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 766
    .line 767
    invoke-interface {v4}, Lorg/eclipse/jetty/http/Generator;->returnBuffers()V

    .line 768
    .line 769
    .line 770
    iget-object v4, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_asyncEndp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 771
    .line 772
    const/4 v10, 0x1

    .line 773
    invoke-interface {v4, v10}, Lorg/eclipse/jetty/io/AsyncEndPoint;->setCheckForIdle(Z)V

    .line 774
    .line 775
    .line 776
    goto :goto_14

    .line 777
    :cond_1b
    const/4 v10, 0x1

    .line 778
    :goto_14
    if-nez v13, :cond_1e

    .line 779
    .line 780
    iget v4, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 781
    .line 782
    add-int/2addr v4, v10

    .line 783
    iput v4, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 784
    .line 785
    sget v5, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_INFO:I

    .line 786
    .line 787
    if-lez v5, :cond_1d

    .line 788
    .line 789
    rem-int v5, v4, v5

    .line 790
    .line 791
    if-nez v5, :cond_1d

    .line 792
    .line 793
    sget v5, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_CLOSE:I

    .line 794
    .line 795
    if-lez v5, :cond_1c

    .line 796
    .line 797
    if-ge v4, v5, :cond_1d

    .line 798
    .line 799
    :cond_1c
    sget-object v4, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 800
    .line 801
    new-instance v5, Ljava/lang/StringBuilder;

    .line 802
    .line 803
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 804
    .line 805
    .line 806
    iget v3, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 807
    .line 808
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 809
    .line 810
    .line 811
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 812
    .line 813
    .line 814
    iget-object v3, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 815
    .line 816
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 817
    .line 818
    .line 819
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    .line 821
    .line 822
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 823
    .line 824
    .line 825
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 826
    .line 827
    .line 828
    move-result-object v3

    .line 829
    const/4 v10, 0x0

    .line 830
    new-array v5, v10, [Ljava/lang/Object;

    .line 831
    .line 832
    invoke-interface {v4, v3, v5}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 833
    .line 834
    .line 835
    :cond_1d
    sget v3, Lorg/eclipse/jetty/server/AsyncHttpConnection;->NO_PROGRESS_CLOSE:I

    .line 836
    .line 837
    if-lez v3, :cond_1f

    .line 838
    .line 839
    iget v4, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 840
    .line 841
    if-ne v4, v3, :cond_1f

    .line 842
    .line 843
    sget-object v3, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 844
    .line 845
    new-instance v4, Ljava/lang/StringBuilder;

    .line 846
    .line 847
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 848
    .line 849
    .line 850
    iget v2, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 851
    .line 852
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 853
    .line 854
    .line 855
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 856
    .line 857
    .line 858
    iget-object v2, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 859
    .line 860
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 861
    .line 862
    .line 863
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 864
    .line 865
    .line 866
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 867
    .line 868
    .line 869
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 870
    .line 871
    .line 872
    move-result-object v2

    .line 873
    const/4 v10, 0x0

    .line 874
    new-array v4, v10, [Ljava/lang/Object;

    .line 875
    .line 876
    invoke-interface {v3, v2, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 877
    .line 878
    .line 879
    iget-object v1, v1, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 880
    .line 881
    instance-of v2, v1, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 882
    .line 883
    if-eqz v2, :cond_1f

    .line 884
    .line 885
    check-cast v1, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 886
    .line 887
    invoke-virtual {v1}, Lorg/eclipse/jetty/io/nio/ChannelEndPoint;->getChannel()Ljava/nio/channels/ByteChannel;

    .line 888
    .line 889
    .line 890
    move-result-object v1

    .line 891
    invoke-interface {v1}, Ljava/nio/channels/Channel;->close()V

    .line 892
    .line 893
    .line 894
    goto :goto_15

    .line 895
    :cond_1e
    const/4 v10, 0x0

    .line 896
    iput v10, v1, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_total_no_progress:I

    .line 897
    .line 898
    :cond_1f
    :goto_15
    throw v0
.end method

.method public isSuspended()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_readInterested:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->isSuspended()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public onInputShutdown()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isIdle()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isSuspended()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 22
    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 27
    .line 28
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isIdle()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-interface {p0, v0}, Lorg/eclipse/jetty/http/Parser;->setPersistent(Z)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->_readInterested:Z

    .line 3
    .line 4
    sget-object v0, Lorg/eclipse/jetty/server/AsyncHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 7
    .line 8
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "Enabled read interest {}"

    .line 13
    .line 14
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-super {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->reset()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
