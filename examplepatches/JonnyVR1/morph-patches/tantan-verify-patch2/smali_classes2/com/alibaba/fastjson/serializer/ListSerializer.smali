.class public final Lcom/alibaba/fastjson/serializer/ListSerializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/ListSerializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/serializer/ListSerializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/ListSerializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/ListSerializer;->instance:Lcom/alibaba/fastjson/serializer/ListSerializer;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move/from16 v0, p5

    .line 6
    .line 7
    iget-object v3, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 8
    .line 9
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/4 v5, 0x0

    .line 16
    if-nez v3, :cond_1

    .line 17
    .line 18
    invoke-static {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->isEnabled(ILcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v6, v5

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    const/4 v3, 0x1

    .line 28
    move v6, v3

    .line 29
    :goto_1
    iget-object v8, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 30
    .line 31
    if-eqz v6, :cond_2

    .line 32
    .line 33
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/util/TypeUtils;->getCollectionItemType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    :goto_2
    move-object v9, v3

    .line 38
    goto :goto_3

    .line 39
    :cond_2
    const/4 v3, 0x0

    .line 40
    goto :goto_2

    .line 41
    :goto_3
    if-nez v2, :cond_3

    .line 42
    .line 43
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 44
    .line 45
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    move-object v7, v2

    .line 50
    check-cast v7, Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_4

    .line 57
    .line 58
    const-string v0, "[]"

    .line 59
    .line 60
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_4
    iget-object v3, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 65
    .line 66
    move-object/from16 v4, p3

    .line 67
    .line 68
    invoke-virtual {v1, v3, v2, v4, v5}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 69
    .line 70
    .line 71
    :try_start_0
    sget-object v10, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 72
    .line 73
    invoke-virtual {v8, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 74
    .line 75
    .line 76
    move-result v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    const/16 v11, 0x5d

    .line 78
    .line 79
    const/16 v12, 0x2c

    .line 80
    .line 81
    const/16 v13, 0x5b

    .line 82
    .line 83
    if-eqz v10, :cond_9

    .line 84
    .line 85
    :try_start_1
    invoke-virtual {v8, v13}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->incrementIndent()V

    .line 89
    .line 90
    .line 91
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    move v13, v5

    .line 96
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-eqz v5, :cond_8

    .line 101
    .line 102
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 106
    if-eqz v13, :cond_5

    .line 107
    .line 108
    :try_start_2
    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    .line 110
    .line 111
    goto :goto_5

    .line 112
    :catchall_0
    move-exception v0

    .line 113
    move-object v9, v3

    .line 114
    goto/16 :goto_f

    .line 115
    .line 116
    :cond_5
    :goto_5
    :try_start_3
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 117
    .line 118
    .line 119
    if-eqz v14, :cond_7

    .line 120
    .line 121
    invoke-virtual {v1, v14}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->containsReference(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 125
    if-eqz v5, :cond_6

    .line 126
    .line 127
    :try_start_4
    invoke-virtual {v1, v14}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 128
    .line 129
    .line 130
    move-object v6, v3

    .line 131
    move-object v4, v9

    .line 132
    goto :goto_7

    .line 133
    :cond_6
    :try_start_5
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    invoke-virtual {v1, v5}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 138
    .line 139
    .line 140
    move-result-object v15

    .line 141
    new-instance v2, Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 142
    .line 143
    const/4 v6, 0x0

    .line 144
    const/4 v7, 0x0

    .line 145
    move-object v5, v4

    .line 146
    move-object/from16 v4, p2

    .line 147
    .line 148
    invoke-direct/range {v2 .. v7}, Lcom/alibaba/fastjson/serializer/SerialContext;-><init>(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 149
    .line 150
    .line 151
    move-object v6, v3

    .line 152
    :try_start_6
    iput-object v2, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 153
    .line 154
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    move v5, v0

    .line 159
    move-object v4, v9

    .line 160
    move-object v2, v14

    .line 161
    move-object v0, v15

    .line 162
    invoke-interface/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    .line 163
    .line 164
    .line 165
    goto :goto_7

    .line 166
    :catchall_1
    move-exception v0

    .line 167
    :goto_6
    move-object v9, v6

    .line 168
    goto/16 :goto_f

    .line 169
    .line 170
    :catchall_2
    move-exception v0

    .line 171
    move-object v6, v3

    .line 172
    goto :goto_6

    .line 173
    :cond_7
    move-object v6, v3

    .line 174
    move-object v4, v9

    .line 175
    iget-object v0, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 178
    .line 179
    .line 180
    :goto_7
    add-int/lit8 v13, v13, 0x1

    .line 181
    .line 182
    move-object/from16 v2, p2

    .line 183
    .line 184
    move/from16 v0, p5

    .line 185
    .line 186
    move-object v9, v4

    .line 187
    move-object v3, v6

    .line 188
    move-object/from16 v4, p3

    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_8
    move-object v6, v3

    .line 192
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->decrementIdent()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v8, v11}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 199
    .line 200
    .line 201
    iput-object v6, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 202
    .line 203
    return-void

    .line 204
    :cond_9
    move-object v4, v9

    .line 205
    move-object v9, v3

    .line 206
    :try_start_7
    invoke-virtual {v8, v13}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 207
    .line 208
    .line 209
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 210
    .line 211
    .line 212
    move-result v10

    .line 213
    move v13, v5

    .line 214
    :goto_8
    if-ge v13, v10, :cond_13

    .line 215
    .line 216
    invoke-interface {v7, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    if-eqz v13, :cond_a

    .line 221
    .line 222
    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 223
    .line 224
    .line 225
    goto :goto_9

    .line 226
    :catchall_3
    move-exception v0

    .line 227
    goto/16 :goto_f

    .line 228
    .line 229
    :cond_a
    :goto_9
    if-nez v2, :cond_b

    .line 230
    .line 231
    const-string v0, "null"

    .line 232
    .line 233
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 234
    .line 235
    .line 236
    goto/16 :goto_e

    .line 237
    .line 238
    :cond_b
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    const-class v3, Ljava/lang/Integer;

    .line 243
    .line 244
    if-ne v0, v3, :cond_c

    .line 245
    .line 246
    check-cast v2, Ljava/lang/Integer;

    .line 247
    .line 248
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 253
    .line 254
    .line 255
    goto/16 :goto_e

    .line 256
    .line 257
    :cond_c
    const-class v3, Ljava/lang/Long;

    .line 258
    .line 259
    if-ne v0, v3, :cond_e

    .line 260
    .line 261
    check-cast v2, Ljava/lang/Long;

    .line 262
    .line 263
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 264
    .line 265
    .line 266
    move-result-wide v2

    .line 267
    if-eqz v6, :cond_d

    .line 268
    .line 269
    invoke-virtual {v8, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 270
    .line 271
    .line 272
    const/16 v0, 0x4c

    .line 273
    .line 274
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 275
    .line 276
    .line 277
    goto/16 :goto_e

    .line 278
    .line 279
    :cond_d
    invoke-virtual {v8, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 280
    .line 281
    .line 282
    goto/16 :goto_e

    .line 283
    .line 284
    :cond_e
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 285
    .line 286
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 287
    .line 288
    and-int v0, v0, p5

    .line 289
    .line 290
    if-eqz v0, :cond_f

    .line 291
    .line 292
    :try_start_8
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {v1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    move/from16 v5, p5

    .line 305
    .line 306
    invoke-interface/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 307
    .line 308
    .line 309
    move-object v14, v1

    .line 310
    move-object v15, v4

    .line 311
    :goto_a
    move-object v1, v14

    .line 312
    move-object v4, v15

    .line 313
    goto/16 :goto_e

    .line 314
    .line 315
    :catchall_4
    move-exception v0

    .line 316
    move-object v14, v1

    .line 317
    goto/16 :goto_f

    .line 318
    .line 319
    :cond_f
    move-object v14, v1

    .line 320
    move-object v15, v4

    .line 321
    :try_start_9
    iget-boolean v0, v8, Lcom/alibaba/fastjson/serializer/SerializeWriter;->disableCircularReferenceDetect:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_9

    .line 322
    .line 323
    if-nez v0, :cond_10

    .line 324
    .line 325
    :try_start_a
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerialContext;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 326
    .line 327
    const/4 v4, 0x0

    .line 328
    const/4 v5, 0x0

    .line 329
    move-object/from16 v3, p3

    .line 330
    .line 331
    move-object v1, v9

    .line 332
    move-object v9, v2

    .line 333
    move-object/from16 v2, p2

    .line 334
    .line 335
    :try_start_b
    invoke-direct/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/SerialContext;-><init>(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 336
    .line 337
    .line 338
    iput-object v0, v14, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 339
    .line 340
    goto :goto_c

    .line 341
    :catchall_5
    move-exception v0

    .line 342
    move-object v9, v1

    .line 343
    :goto_b
    move-object v1, v14

    .line 344
    goto/16 :goto_f

    .line 345
    .line 346
    :catchall_6
    move-exception v0

    .line 347
    move-object v1, v9

    .line 348
    goto :goto_b

    .line 349
    :cond_10
    move-object v1, v9

    .line 350
    move-object v9, v2

    .line 351
    :goto_c
    invoke-virtual {v14, v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->containsReference(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    if-eqz v0, :cond_11

    .line 356
    .line 357
    invoke-virtual {v14, v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    move-object v9, v1

    .line 361
    goto :goto_a

    .line 362
    :cond_11
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v14, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 371
    .line 372
    iget v2, v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 373
    .line 374
    and-int v2, v2, p5

    .line 375
    .line 376
    if-eqz v2, :cond_12

    .line 377
    .line 378
    :try_start_c
    instance-of v2, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    .line 379
    .line 380
    if-eqz v2, :cond_12

    .line 381
    .line 382
    check-cast v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    .line 383
    .line 384
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 385
    .line 386
    .line 387
    move-result-object v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    .line 388
    move/from16 v5, p5

    .line 389
    .line 390
    move-object v2, v9

    .line 391
    move-object v4, v15

    .line 392
    move-object v9, v1

    .line 393
    move-object v1, v14

    .line 394
    :try_start_d
    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->writeNoneASM(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    .line 395
    .line 396
    .line 397
    move-object/from16 v1, p1

    .line 398
    .line 399
    goto :goto_e

    .line 400
    :catchall_7
    move-exception v0

    .line 401
    :goto_d
    move-object/from16 v1, p1

    .line 402
    .line 403
    goto :goto_f

    .line 404
    :catchall_8
    move-exception v0

    .line 405
    move-object v9, v1

    .line 406
    goto :goto_d

    .line 407
    :cond_12
    move-object v2, v9

    .line 408
    move-object v4, v15

    .line 409
    move-object v9, v1

    .line 410
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 411
    .line 412
    .line 413
    move-result-object v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 414
    move-object/from16 v1, p1

    .line 415
    .line 416
    move/from16 v5, p5

    .line 417
    .line 418
    :try_start_e
    invoke-interface/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    .line 419
    .line 420
    .line 421
    :goto_e
    add-int/lit8 v13, v13, 0x1

    .line 422
    .line 423
    goto/16 :goto_8

    .line 424
    .line 425
    :catchall_9
    move-exception v0

    .line 426
    goto :goto_b

    .line 427
    :cond_13
    invoke-virtual {v8, v11}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 428
    .line 429
    .line 430
    iput-object v9, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 431
    .line 432
    return-void

    .line 433
    :goto_f
    iput-object v9, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 434
    .line 435
    throw v0
.end method
