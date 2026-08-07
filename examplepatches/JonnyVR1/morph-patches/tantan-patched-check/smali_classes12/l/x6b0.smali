.class public Ll/x6b0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x6b0$a;
    }
.end annotation


# static fields
.field private static final c:Ljava/io/File;

.field private static final d:Z


# instance fields
.field private a:Ljava/nio/ByteBuffer;

.field private b:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const/16 v1, 0x13

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/x6b0;->c:Ljava/io/File;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput-boolean v0, Ll/x6b0;->d:Z

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :array_0
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
        0x4et
        0x39t
        0x6ft
        0x16t
        0x43t
        0x58t
        0x11t
        0x3t
        0x42t
        0x12t
        0x58t
        0x52t
        0x12t
        0x39t
        0x6ft
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Ll/x6b0;->d:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/x6b0;->c:Ljava/io/File;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 12
    .line 13
    sget-object v1, Ll/x6b0;->c:Ljava/io/File;

    .line 14
    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const/16 v3, 0xb

    .line 21
    .line 22
    new-array v3, v3, [B

    .line 23
    .line 24
    fill-array-data v3, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x3

    .line 38
    new-array p1, p1, [B

    .line 39
    .line 40
    fill-array-data p1, :array_1

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    move-object p1, v0

    .line 64
    :goto_0
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 65
    .line 66
    .line 67
    move-result-wide v5

    .line 68
    const-wide/16 v0, 0x0

    .line 69
    .line 70
    cmp-long v0, v5, v0

    .line 71
    .line 72
    if-lez v0, :cond_4

    .line 73
    .line 74
    const-wide/32 v0, 0x7fffffff

    .line 75
    .line 76
    .line 77
    cmp-long v0, v5, v0

    .line 78
    .line 79
    if-gez v0, :cond_4

    .line 80
    .line 81
    new-instance v0, Ljava/io/FileInputStream;

    .line 82
    .line 83
    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    :try_start_0
    sget-object v2, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    .line 91
    .line 92
    const-wide/16 v3, 0x0

    .line 93
    .line 94
    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Ll/x6b0;->b:I

    .line 118
    .line 119
    iget-object p1, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    const v0, 0x504f5250

    .line 131
    .line 132
    .line 133
    if-ne p1, v0, :cond_2

    .line 134
    .line 135
    iget-object p1, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    const v0, -0x3912f55    # -4.9599958E36f

    .line 142
    .line 143
    .line 144
    if-ne p1, v0, :cond_1

    .line 145
    .line 146
    iget-object p0, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    add-int/lit8 p1, p1, 0x1c

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 159
    .line 160
    const/16 v0, 0x11

    .line 161
    .line 162
    new-array v0, v0, [B

    .line 163
    .line 164
    fill-array-data v0, :array_2

    .line 165
    .line 166
    .line 167
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    throw p0

    .line 190
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 191
    .line 192
    const/16 v0, 0x10

    .line 193
    .line 194
    new-array v0, v0, [B

    .line 195
    .line 196
    fill-array-data v0, :array_3

    .line 197
    .line 198
    .line 199
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    throw p0

    .line 222
    :catchall_0
    move-exception v0

    .line 223
    move-object p0, v0

    .line 224
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 225
    :catchall_1
    move-exception v0

    .line 226
    move-object p1, v0

    .line 227
    if-eqz v1, :cond_3

    .line 228
    .line 229
    :try_start_2
    invoke-virtual {v1}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :catchall_2
    move-exception v0

    .line 234
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 235
    .line 236
    .line 237
    :cond_3
    :goto_1
    throw p1

    .line 238
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 239
    .line 240
    const/16 p1, 0x12

    .line 241
    .line 242
    new-array p1, p1, [B

    .line 243
    .line 244
    fill-array-data p1, :array_4

    .line 245
    .line 246
    .line 247
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    throw p0

    .line 270
    :cond_5
    new-instance p0, Ljava/io/FileNotFoundException;

    .line 271
    .line 272
    const/16 p1, 0xc

    .line 273
    .line 274
    new-array p1, p1, [B

    .line 275
    .line 276
    fill-array-data p1, :array_5

    .line 277
    .line 278
    .line 279
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    throw p0

    .line 302
    nop

    .line 303
    :array_0
    .array-data 1
        0x45t
        0x5ct
        0x5et
        0x55t
        0xbt
        0x3t
        0x53t
        0x12t
        0x6et
        0x45t
        0x5bt
    .end array-data

    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    :array_1
    .array-data 1
        0xat
        0x15t
        0x1t
    .end array-data

    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    :array_2
    .array-data 1
        0x72t
        0x7t
        0x55t
        0x17t
        0x0t
        0x14t
        0x55t
        0x7t
        0x11t
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5ft
        0xdt
        0x41t
    .end array-data

    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    nop

    .line 333
    :array_3
    .array-data 1
        0x72t
        0x7t
        0x55t
        0x17t
        0x7t
        0xft
        0x5ct
        0x3t
        0x11t
        0x5at
        0x0t
        0x1t
        0x59t
        0x5t
        0xbt
        0x17t
    .end array-data

    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    :array_4
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
        0x46t
        0x57t
        0x5et
        0xdt
        0x3t
        0x10t
        0x15t
        0x58t
        0x4dt
        0x4t
        0x46t
    .end array-data

    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    nop

    .line 359
    :array_5
    .array-data 1
        0x7et
        0x9t
        0x45t
        0x17t
        0x0t
        0x46t
        0x56t
        0xft
        0x5dt
        0x52t
        0x5bt
        0x46t
    .end array-data
.end method

.method public static synthetic a(Ljava/util/List;Ljava/nio/ByteBuffer;I)V
    .locals 2

    .line 1
    const/16 v0, 0x60

    .line 2
    .line 3
    if-ge p2, v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    add-int/lit8 v0, p2, -0x60

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v1, 0x10000

    .line 13
    .line 14
    and-int/2addr v0, v1

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_1
    const/16 v0, 0x5c

    .line 19
    .line 20
    sub-int/2addr p2, v0

    .line 21
    invoke-static {p1, p2, v0}, Ll/x6b0;->e(Ljava/nio/ByteBuffer;II)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static varargs b([Ljava/lang/String;)Ll/x6b0;
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p0, v1

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Ll/x6b0;

    .line 8
    .line 9
    invoke-direct {v3, v2}, Ll/x6b0;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object v3

    .line 13
    :catch_0
    move-exception p0

    .line 14
    new-instance v0, Ljava/lang/RuntimeException;

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    new-array v1, v1, [B

    .line 18
    .line 19
    fill-array-data v1, :array_0

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :catch_1
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return-object p0

    .line 50
    nop

    .line 51
    :array_0
    .array-data 1
        0x5ft
        0x16t
        0x54t
        0x59t
        0x41t
    .end array-data
.end method

.method private static c(Ljava/nio/ByteBuffer;[BLl/x6b0$a;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_2

    .line 8
    .line 9
    move v2, v0

    .line 10
    :goto_1
    array-length v3, p1

    .line 11
    if-ge v2, v3, :cond_1

    .line 12
    .line 13
    add-int v3, v1, v2

    .line 14
    .line 15
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    aget-byte v4, p1, v2

    .line 20
    .line 21
    if-eq v3, v4, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-interface {p2, p0, v1}, Ll/x6b0$a;->a(Ljava/nio/ByteBuffer;I)V

    .line 28
    .line 29
    .line 30
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    return-void
.end method

.method private static e(Ljava/nio/ByteBuffer;II)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    add-int v2, v1, p1

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    if-le v1, p2, :cond_0

    .line 18
    .line 19
    const/16 p0, 0x32

    .line 20
    .line 21
    new-array p0, p0, [B

    .line 22
    .line 23
    fill-array-data p0, :array_0

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    int-to-char v2, v2

    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :catch_0
    const/16 p0, 0x15

    .line 44
    .line 45
    new-array p0, p0, [B

    .line 46
    .line 47
    fill-array-data p0, :array_1

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :array_0
    .array-data 1
        0xct
        0xft
        0x5ft
        0x53t
        0x4t
        0x1et
        0x10t
        0x14t
        0x54t
        0x56t
        0x2t
        0xet
        0x55t
        0x2t
        0x11t
        0x5bt
        0x8t
        0xbt
        0x59t
        0x12t
        0x11t
        0x55t
        0x14t
        0x12t
        0x10t
        0x8t
        0x5et
        0x17t
        0xft
        0x13t
        0x5ct
        0xat
        0x11t
        0x43t
        0x4t
        0x14t
        0x5dt
        0xft
        0x5ft
        0x56t
        0x15t
        0x9t
        0x42t
        0x46t
        0x57t
        0x58t
        0x14t
        0x8t
        0x54t
        0x58t
    .end array-data

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    nop

    .line 85
    :array_1
    .array-data 1
        0xct
        0xft
        0x5ft
        0x53t
        0x4t
        0x1et
        0x10t
        0x9t
        0x44t
        0x43t
        0x41t
        0x9t
        0x56t
        0x46t
        0x53t
        0x58t
        0x14t
        0x8t
        0x54t
        0x15t
        0xft
    .end array-data
.end method


# virtual methods
.method public d(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/x6b0;->a:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v1, Ll/w6b0;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ll/w6b0;-><init>(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p1, v1}, Ll/x6b0;->c(Ljava/nio/ByteBuffer;[BLl/x6b0$a;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
