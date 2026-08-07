.class Ll/xo0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xo0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Ll/xo0$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ll/xo0$b;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    invoke-static {p0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xo0;->a()Lcom/sunshine/engine/base/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    if-eqz p0, :cond_b

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    xor-int/lit8 v2, v0, 0x1

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v3, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/sunshine/engine/base/s;->j()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v4, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    goto :goto_2

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object v3, v1

    .line 51
    :goto_1
    move-object v1, v0

    .line 52
    goto/16 :goto_b

    .line 53
    .line 54
    :catch_0
    move-exception v0

    .line 55
    goto/16 :goto_9

    .line 56
    .line 57
    :cond_0
    new-instance v3, Ljava/io/File;

    .line 58
    .line 59
    iget-object v4, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 60
    .line 61
    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    new-instance v4, Ljava/io/FileInputStream;

    .line 65
    .line 66
    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    move-object v3, v4

    .line 70
    :goto_2
    :try_start_1
    invoke-static {v3, p0}, Ll/xo0;->b(Ljava/io/InputStream;Lcom/sunshine/engine/base/a;)V

    .line 71
    .line 72
    .line 73
    const/4 v4, 0x1

    .line 74
    iput-boolean v4, p0, Lcom/sunshine/engine/base/a;->t:Z

    .line 75
    .line 76
    invoke-static {p0}, Ll/n9r;->a(Lcom/sunshine/engine/base/a;)V

    .line 77
    .line 78
    .line 79
    if-nez v0, :cond_1

    .line 80
    .line 81
    iget-object v5, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 82
    .line 83
    invoke-virtual {v5}, Lcom/sunshine/engine/base/s;->j()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    iget-object v6, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v5, v6}, Ll/a2j0;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    goto :goto_3

    .line 94
    :catchall_1
    move-exception v0

    .line 95
    goto :goto_1

    .line 96
    :catch_1
    move-exception v0

    .line 97
    move-object v1, v3

    .line 98
    goto/16 :goto_9

    .line 99
    .line 100
    :cond_1
    iget-object v5, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v5}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    :goto_3
    iget-object v6, p0, Lcom/sunshine/engine/base/a;->d:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v6, :cond_3

    .line 109
    .line 110
    if-nez v0, :cond_2

    .line 111
    .line 112
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/sunshine/engine/base/s;->j()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v6, p0, Lcom/sunshine/engine/base/a;->d:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v0, v6}, Ll/a2j0;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-eqz v0, :cond_3

    .line 125
    .line 126
    new-instance v6, Landroid/media/MediaPlayer;

    .line 127
    .line 128
    invoke-direct {v6}, Landroid/media/MediaPlayer;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v6}, Landroid/media/MediaPlayer;->reset()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 139
    .line 140
    .line 141
    move-result-wide v8

    .line 142
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 143
    .line 144
    .line 145
    move-result-wide v10

    .line 146
    invoke-virtual/range {v6 .. v11}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 147
    .line 148
    .line 149
    move-object v1, v6

    .line 150
    goto :goto_4

    .line 151
    :cond_2
    new-instance v1, Landroid/media/MediaPlayer;

    .line 152
    .line 153
    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->d:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    :goto_4
    if-eqz v5, :cond_6

    .line 165
    .line 166
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 167
    .line 168
    const-string v6, "in parse"

    .line 169
    .line 170
    invoke-virtual {v0, v6}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    new-instance v6, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .line 178
    .line 179
    const-string v7, "   entity.hashCode()="

    .line 180
    .line 181
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    invoke-virtual {v0, v6}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v6, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .line 203
    .line 204
    const-string v7, "   bmp.hashCode()="

    .line 205
    .line 206
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 210
    .line 211
    .line 212
    move-result v7

    .line 213
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v6

    .line 220
    invoke-virtual {v0, v6}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    new-instance v6, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    const-string v7, "   entity.configPath="

    .line 230
    .line 231
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    iget-object v7, p0, Lcom/sunshine/engine/base/a;->b:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v6

    .line 243
    invoke-virtual {v0, v6}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    new-instance v6, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 250
    .line 251
    .line 252
    const-string v7, "   entity.picPath="

    .line 253
    .line 254
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget-object v7, p0, Lcom/sunshine/engine/base/a;->c:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v6

    .line 266
    invoke-virtual {v0, v6}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    new-instance v6, Ljava/lang/StringBuilder;

    .line 271
    .line 272
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 273
    .line 274
    .line 275
    const-string v7, "   entity.inAsset="

    .line 276
    .line 277
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v0, v2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    if-eqz v0, :cond_4

    .line 295
    .line 296
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 297
    .line 298
    const-string v1, "   bmp.isRecycled() in parse"

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {v0}, Lcom/sunshine/engine/base/s;->k()V

    .line 305
    .line 306
    .line 307
    goto :goto_5

    .line 308
    :cond_4
    if-eqz v1, :cond_5

    .line 309
    .line 310
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 311
    .line 312
    .line 313
    :cond_5
    invoke-virtual {p0, v5, v1}, Lcom/sunshine/engine/base/a;->j(Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 314
    .line 315
    .line 316
    goto :goto_6

    .line 317
    :cond_6
    :goto_5
    const/4 v4, 0x0

    .line 318
    :goto_6
    if-eqz v3, :cond_7

    .line 319
    .line 320
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 321
    .line 322
    .line 323
    goto :goto_7

    .line 324
    :catch_2
    move-exception v0

    .line 325
    invoke-static {v0}, Ll/a2j0;->j(Ljava/lang/Exception;)V

    .line 326
    .line 327
    .line 328
    :cond_7
    :goto_7
    if-nez v4, :cond_9

    .line 329
    .line 330
    :cond_8
    :goto_8
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 331
    .line 332
    invoke-virtual {v0, p0}, Lcom/sunshine/engine/base/s;->r(Lcom/sunshine/engine/base/a;)V

    .line 333
    .line 334
    .line 335
    goto :goto_a

    .line 336
    :goto_9
    :try_start_3
    invoke-static {v0}, Ll/a2j0;->j(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 337
    .line 338
    .line 339
    if-eqz v1, :cond_8

    .line 340
    .line 341
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 342
    .line 343
    .line 344
    goto :goto_8

    .line 345
    :catch_3
    move-exception v0

    .line 346
    invoke-static {v0}, Ll/a2j0;->j(Ljava/lang/Exception;)V

    .line 347
    .line 348
    .line 349
    goto :goto_8

    .line 350
    :cond_9
    :goto_a
    invoke-static {}, Ll/xo0;->a()Lcom/sunshine/engine/base/a;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    goto/16 :goto_0

    .line 355
    .line 356
    :goto_b
    if-eqz v3, :cond_a

    .line 357
    .line 358
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 359
    .line 360
    .line 361
    goto :goto_c

    .line 362
    :catch_4
    move-exception v0

    .line 363
    invoke-static {v0}, Ll/a2j0;->j(Ljava/lang/Exception;)V

    .line 364
    .line 365
    .line 366
    :cond_a
    :goto_c
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 367
    .line 368
    invoke-virtual {v0, p0}, Lcom/sunshine/engine/base/s;->r(Lcom/sunshine/engine/base/a;)V

    .line 369
    .line 370
    .line 371
    throw v1

    .line 372
    :cond_b
    return-void
.end method
