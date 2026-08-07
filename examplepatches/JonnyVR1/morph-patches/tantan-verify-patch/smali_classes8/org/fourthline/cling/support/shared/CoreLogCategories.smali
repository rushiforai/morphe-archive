.class public Lorg/fourthline/cling/support/shared/CoreLogCategories;
.super Ljava/util/ArrayList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lorg/seamless/swing/logging/LogCategory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lorg/seamless/swing/logging/LogCategory;

    .line 9
    .line 10
    const/4 v2, 0x6

    .line 11
    new-array v3, v2, [Lorg/seamless/swing/logging/LogCategory$Group;

    .line 12
    .line 13
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 14
    .line 15
    const/4 v5, 0x2

    .line 16
    new-array v6, v5, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 17
    .line 18
    new-instance v7, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 19
    .line 20
    const-class v8, Lorg/fourthline/cling/transport/spi/DatagramIO;

    .line 21
    .line 22
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v8

    .line 26
    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 27
    .line 28
    invoke-direct {v7, v8, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 29
    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    aput-object v7, v6, v8

    .line 33
    .line 34
    new-instance v7, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 35
    .line 36
    const-class v10, Lorg/fourthline/cling/transport/spi/MulticastReceiver;

    .line 37
    .line 38
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v10

    .line 42
    invoke-direct {v7, v10, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 43
    .line 44
    .line 45
    const/4 v10, 0x1

    .line 46
    aput-object v7, v6, v10

    .line 47
    .line 48
    const-string v7, "UDP communication"

    .line 49
    .line 50
    invoke-direct {v4, v7, v6}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 51
    .line 52
    .line 53
    aput-object v4, v3, v8

    .line 54
    .line 55
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 56
    .line 57
    new-array v6, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 58
    .line 59
    new-instance v7, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 60
    .line 61
    const-class v11, Lorg/fourthline/cling/transport/spi/DatagramProcessor;

    .line 62
    .line 63
    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v11

    .line 67
    sget-object v12, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    .line 68
    .line 69
    invoke-direct {v7, v11, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 70
    .line 71
    .line 72
    aput-object v7, v6, v8

    .line 73
    .line 74
    const-string v7, "UDP datagram processing and content"

    .line 75
    .line 76
    invoke-direct {v4, v7, v6}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 77
    .line 78
    .line 79
    aput-object v4, v3, v10

    .line 80
    .line 81
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 82
    .line 83
    const/4 v6, 0x3

    .line 84
    new-array v7, v6, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 85
    .line 86
    new-instance v11, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 87
    .line 88
    const-class v13, Lorg/fourthline/cling/transport/spi/UpnpStream;

    .line 89
    .line 90
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v13

    .line 94
    invoke-direct {v11, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 95
    .line 96
    .line 97
    aput-object v11, v7, v8

    .line 98
    .line 99
    new-instance v11, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 100
    .line 101
    const-class v13, Lorg/fourthline/cling/transport/spi/StreamServer;

    .line 102
    .line 103
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v13

    .line 107
    invoke-direct {v11, v13, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 108
    .line 109
    .line 110
    aput-object v11, v7, v10

    .line 111
    .line 112
    new-instance v11, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 113
    .line 114
    const-class v13, Lorg/fourthline/cling/transport/spi/StreamClient;

    .line 115
    .line 116
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v13

    .line 120
    invoke-direct {v11, v13, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 121
    .line 122
    .line 123
    aput-object v11, v7, v5

    .line 124
    .line 125
    const-string v11, "TCP communication"

    .line 126
    .line 127
    invoke-direct {v4, v11, v7}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 128
    .line 129
    .line 130
    aput-object v4, v3, v5

    .line 131
    .line 132
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 133
    .line 134
    new-array v7, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 135
    .line 136
    new-instance v11, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 137
    .line 138
    const-class v13, Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;

    .line 139
    .line 140
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v13

    .line 144
    invoke-direct {v11, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 145
    .line 146
    .line 147
    aput-object v11, v7, v8

    .line 148
    .line 149
    const-string v11, "SOAP action message processing and content"

    .line 150
    .line 151
    invoke-direct {v4, v11, v7}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 152
    .line 153
    .line 154
    aput-object v4, v3, v6

    .line 155
    .line 156
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 157
    .line 158
    new-array v7, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 159
    .line 160
    new-instance v11, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 161
    .line 162
    const-class v13, Lorg/fourthline/cling/transport/spi/GENAEventProcessor;

    .line 163
    .line 164
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v13

    .line 168
    invoke-direct {v11, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 169
    .line 170
    .line 171
    aput-object v11, v7, v8

    .line 172
    .line 173
    const-string v11, "GENA event message processing and content"

    .line 174
    .line 175
    invoke-direct {v4, v11, v7}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 176
    .line 177
    .line 178
    const/4 v7, 0x4

    .line 179
    aput-object v4, v3, v7

    .line 180
    .line 181
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 182
    .line 183
    new-array v11, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 184
    .line 185
    new-instance v13, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 186
    .line 187
    const-class v14, Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 188
    .line 189
    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v14

    .line 193
    invoke-direct {v13, v14, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 194
    .line 195
    .line 196
    aput-object v13, v11, v8

    .line 197
    .line 198
    const-string v13, "HTTP header processing"

    .line 199
    .line 200
    invoke-direct {v4, v13, v11}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 201
    .line 202
    .line 203
    const/4 v11, 0x5

    .line 204
    aput-object v4, v3, v11

    .line 205
    .line 206
    const-string v4, "Network"

    .line 207
    .line 208
    invoke-direct {v1, v4, v3}, Lorg/seamless/swing/logging/LogCategory;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$Group;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    new-instance v1, Lorg/seamless/swing/logging/LogCategory;

    .line 215
    .line 216
    new-array v3, v7, [Lorg/seamless/swing/logging/LogCategory$Group;

    .line 217
    .line 218
    new-instance v4, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 219
    .line 220
    new-array v13, v5, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 221
    .line 222
    new-instance v14, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 223
    .line 224
    const-class v15, Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 225
    .line 226
    move/from16 v16, v2

    .line 227
    .line 228
    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-direct {v14, v2, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 233
    .line 234
    .line 235
    aput-object v14, v13, v8

    .line 236
    .line 237
    new-instance v2, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 238
    .line 239
    const-string v14, "org.fourthline.cling.protocol.async"

    .line 240
    .line 241
    invoke-direct {v2, v14, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 242
    .line 243
    .line 244
    aput-object v2, v13, v10

    .line 245
    .line 246
    const-string v2, "Discovery (Notification & Search)"

    .line 247
    .line 248
    invoke-direct {v4, v2, v13}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 249
    .line 250
    .line 251
    aput-object v4, v3, v8

    .line 252
    .line 253
    new-instance v2, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 254
    .line 255
    new-array v4, v11, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 256
    .line 257
    new-instance v13, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 258
    .line 259
    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v14

    .line 263
    invoke-direct {v13, v14, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 264
    .line 265
    .line 266
    aput-object v13, v4, v8

    .line 267
    .line 268
    new-instance v13, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 269
    .line 270
    const-class v14, Lorg/fourthline/cling/protocol/RetrieveRemoteDescriptors;

    .line 271
    .line 272
    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v14

    .line 276
    invoke-direct {v13, v14, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 277
    .line 278
    .line 279
    aput-object v13, v4, v10

    .line 280
    .line 281
    new-instance v13, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 282
    .line 283
    const-class v14, Lorg/fourthline/cling/protocol/sync/ReceivingRetrieval;

    .line 284
    .line 285
    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v14

    .line 289
    invoke-direct {v13, v14, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 290
    .line 291
    .line 292
    aput-object v13, v4, v5

    .line 293
    .line 294
    new-instance v13, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 295
    .line 296
    const-class v14, Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;

    .line 297
    .line 298
    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v14

    .line 302
    invoke-direct {v13, v14, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 303
    .line 304
    .line 305
    aput-object v13, v4, v6

    .line 306
    .line 307
    new-instance v13, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 308
    .line 309
    const-class v14, Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;

    .line 310
    .line 311
    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v14

    .line 315
    invoke-direct {v13, v14, v9}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 316
    .line 317
    .line 318
    aput-object v13, v4, v7

    .line 319
    .line 320
    const-string v9, "Description"

    .line 321
    .line 322
    invoke-direct {v2, v9, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 323
    .line 324
    .line 325
    aput-object v2, v3, v10

    .line 326
    .line 327
    new-instance v2, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 328
    .line 329
    new-array v4, v6, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 330
    .line 331
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 332
    .line 333
    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v13

    .line 337
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 338
    .line 339
    .line 340
    aput-object v9, v4, v8

    .line 341
    .line 342
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 343
    .line 344
    const-class v13, Lorg/fourthline/cling/protocol/sync/ReceivingAction;

    .line 345
    .line 346
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v13

    .line 350
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 351
    .line 352
    .line 353
    aput-object v9, v4, v10

    .line 354
    .line 355
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 356
    .line 357
    const-class v13, Lorg/fourthline/cling/protocol/sync/SendingAction;

    .line 358
    .line 359
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v13

    .line 363
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 364
    .line 365
    .line 366
    aput-object v9, v4, v5

    .line 367
    .line 368
    const-string v9, "Control"

    .line 369
    .line 370
    invoke-direct {v2, v9, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 371
    .line 372
    .line 373
    aput-object v2, v3, v5

    .line 374
    .line 375
    new-instance v2, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 376
    .line 377
    const/16 v4, 0x9

    .line 378
    .line 379
    new-array v4, v4, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 380
    .line 381
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 382
    .line 383
    const-string v13, "org.fourthline.cling.model.gena"

    .line 384
    .line 385
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 386
    .line 387
    .line 388
    aput-object v9, v4, v8

    .line 389
    .line 390
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 391
    .line 392
    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v13

    .line 396
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 397
    .line 398
    .line 399
    aput-object v9, v4, v10

    .line 400
    .line 401
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 402
    .line 403
    const-class v13, Lorg/fourthline/cling/protocol/sync/ReceivingEvent;

    .line 404
    .line 405
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v13

    .line 409
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 410
    .line 411
    .line 412
    aput-object v9, v4, v5

    .line 413
    .line 414
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 415
    .line 416
    const-class v13, Lorg/fourthline/cling/protocol/sync/ReceivingSubscribe;

    .line 417
    .line 418
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v13

    .line 422
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 423
    .line 424
    .line 425
    aput-object v9, v4, v6

    .line 426
    .line 427
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 428
    .line 429
    const-class v13, Lorg/fourthline/cling/protocol/sync/ReceivingUnsubscribe;

    .line 430
    .line 431
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v13

    .line 435
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 436
    .line 437
    .line 438
    aput-object v9, v4, v7

    .line 439
    .line 440
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 441
    .line 442
    const-class v13, Lorg/fourthline/cling/protocol/sync/SendingEvent;

    .line 443
    .line 444
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v13

    .line 448
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 449
    .line 450
    .line 451
    aput-object v9, v4, v11

    .line 452
    .line 453
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 454
    .line 455
    const-class v13, Lorg/fourthline/cling/protocol/sync/SendingSubscribe;

    .line 456
    .line 457
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v13

    .line 461
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 462
    .line 463
    .line 464
    aput-object v9, v4, v16

    .line 465
    .line 466
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 467
    .line 468
    const-class v13, Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;

    .line 469
    .line 470
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v13

    .line 474
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 475
    .line 476
    .line 477
    const/4 v13, 0x7

    .line 478
    aput-object v9, v4, v13

    .line 479
    .line 480
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 481
    .line 482
    const-class v13, Lorg/fourthline/cling/protocol/sync/SendingRenewal;

    .line 483
    .line 484
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v13

    .line 488
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 489
    .line 490
    .line 491
    const/16 v13, 0x8

    .line 492
    .line 493
    aput-object v9, v4, v13

    .line 494
    .line 495
    const-string v9, "GENA "

    .line 496
    .line 497
    invoke-direct {v2, v9, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 498
    .line 499
    .line 500
    aput-object v2, v3, v6

    .line 501
    .line 502
    const-string v2, "UPnP Protocol"

    .line 503
    .line 504
    invoke-direct {v1, v2, v3}, Lorg/seamless/swing/logging/LogCategory;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$Group;)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    new-instance v1, Lorg/seamless/swing/logging/LogCategory;

    .line 511
    .line 512
    new-array v2, v7, [Lorg/seamless/swing/logging/LogCategory$Group;

    .line 513
    .line 514
    new-instance v3, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 515
    .line 516
    new-array v4, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 517
    .line 518
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 519
    .line 520
    const-class v13, Lorg/fourthline/cling/transport/Router;

    .line 521
    .line 522
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v13

    .line 526
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 527
    .line 528
    .line 529
    aput-object v9, v4, v8

    .line 530
    .line 531
    const-string v9, "Router"

    .line 532
    .line 533
    invoke-direct {v3, v9, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 534
    .line 535
    .line 536
    aput-object v3, v2, v8

    .line 537
    .line 538
    new-instance v3, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 539
    .line 540
    new-array v4, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 541
    .line 542
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 543
    .line 544
    const-class v13, Lorg/fourthline/cling/registry/Registry;

    .line 545
    .line 546
    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v13

    .line 550
    invoke-direct {v9, v13, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 551
    .line 552
    .line 553
    aput-object v9, v4, v8

    .line 554
    .line 555
    const-string v9, "Registry"

    .line 556
    .line 557
    invoke-direct {v3, v9, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 558
    .line 559
    .line 560
    aput-object v3, v2, v10

    .line 561
    .line 562
    new-instance v3, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 563
    .line 564
    new-array v4, v11, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 565
    .line 566
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 567
    .line 568
    const-string v11, "org.fourthline.cling.binding.annotations"

    .line 569
    .line 570
    invoke-direct {v9, v11, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 571
    .line 572
    .line 573
    aput-object v9, v4, v8

    .line 574
    .line 575
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 576
    .line 577
    const-class v11, Lorg/fourthline/cling/model/meta/LocalService;

    .line 578
    .line 579
    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object v11

    .line 583
    invoke-direct {v9, v11, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 584
    .line 585
    .line 586
    aput-object v9, v4, v10

    .line 587
    .line 588
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 589
    .line 590
    const-string v11, "org.fourthline.cling.model.action"

    .line 591
    .line 592
    invoke-direct {v9, v11, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 593
    .line 594
    .line 595
    aput-object v9, v4, v5

    .line 596
    .line 597
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 598
    .line 599
    const-string v11, "org.fourthline.cling.model.state"

    .line 600
    .line 601
    invoke-direct {v9, v11, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 602
    .line 603
    .line 604
    aput-object v9, v4, v6

    .line 605
    .line 606
    new-instance v9, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 607
    .line 608
    const-class v11, Lorg/fourthline/cling/model/DefaultServiceManager;

    .line 609
    .line 610
    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v11

    .line 614
    invoke-direct {v9, v11, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 615
    .line 616
    .line 617
    aput-object v9, v4, v7

    .line 618
    .line 619
    const-string v7, "Local service binding & invocation"

    .line 620
    .line 621
    invoke-direct {v3, v7, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 622
    .line 623
    .line 624
    aput-object v3, v2, v5

    .line 625
    .line 626
    new-instance v3, Lorg/seamless/swing/logging/LogCategory$Group;

    .line 627
    .line 628
    new-array v4, v10, [Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 629
    .line 630
    new-instance v5, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;

    .line 631
    .line 632
    const-string v7, "org.fourthline.cling.controlpoint"

    .line 633
    .line 634
    invoke-direct {v5, v7, v12}, Lorg/seamless/swing/logging/LogCategory$LoggerLevel;-><init>(Ljava/lang/String;Ljava/util/logging/Level;)V

    .line 635
    .line 636
    .line 637
    aput-object v5, v4, v8

    .line 638
    .line 639
    const-string v5, "Control Point interaction"

    .line 640
    .line 641
    invoke-direct {v3, v5, v4}, Lorg/seamless/swing/logging/LogCategory$Group;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$LoggerLevel;)V

    .line 642
    .line 643
    .line 644
    aput-object v3, v2, v6

    .line 645
    .line 646
    const-string v3, "Core"

    .line 647
    .line 648
    invoke-direct {v1, v3, v2}, Lorg/seamless/swing/logging/LogCategory;-><init>(Ljava/lang/String;[Lorg/seamless/swing/logging/LogCategory$Group;)V

    .line 649
    .line 650
    .line 651
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 652
    .line 653
    .line 654
    return-void
.end method
