.class public Ll/r4f0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r4f0$a;
    }
.end annotation


# static fields
.field public static final a:Ljava/lang/String;

.field public static final b:Ljava/lang/String;

.field public static final c:Ljava/lang/String;

.field public static final d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sput-object v1, Ll/r4f0;->a:Ljava/lang/String;

    .line 12
    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    fill-array-data v0, :array_1

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Ll/r4f0;->b:Ljava/lang/String;

    .line 23
    .line 24
    const/16 v0, 0xe

    .line 25
    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    fill-array-data v0, :array_2

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Ll/r4f0;->c:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    new-array v2, v2, [B

    .line 48
    .line 49
    fill-array-data v2, :array_3

    .line 50
    .line 51
    .line 52
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Ll/r4f0;->d:Ljava/lang/String;

    .line 67
    .line 68
    return-void

    .line 69
    :array_0
    .array-data 1
        0x43t
        0x13t
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    nop

    .line 75
    :array_1
    .array-data 1
        0x43t
        0xet
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    nop

    .line 81
    :array_2
    .array-data 1
        0x5ct
        0xft
        0x5ft
        0x52t
        0x4ft
        0x15t
        0x55t
        0x16t
        0x50t
        0x45t
        0x0t
        0x12t
        0x5ft
        0x14t
    .end array-data

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    nop

    .line 93
    :array_3
    .array-data 1
        0x55t
        0x1et
        0x58t
        0x43t
    .end array-data
.end method

.method public static a([Ljava/lang/String;Z)Ll/r4f0$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Ll/r4f0;->b([Ljava/lang/String;ZZ)Ll/r4f0$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b([Ljava/lang/String;ZZ)Ll/r4f0$a;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    if-eqz p0, :cond_16

    .line 4
    .line 5
    array-length v2, p0

    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    goto/16 :goto_20

    .line 9
    .line 10
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    sget-object p1, Ll/r4f0;->a:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_5

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    move-object p1, v0

    .line 21
    move-object v3, p1

    .line 22
    :goto_0
    move-object v4, v3

    .line 23
    goto/16 :goto_1c

    .line 24
    .line 25
    :catch_0
    move-exception p0

    .line 26
    move-object p1, v0

    .line 27
    move-object p2, p1

    .line 28
    move-object v3, p2

    .line 29
    :goto_1
    move-object v4, v3

    .line 30
    move-object v5, v4

    .line 31
    :goto_2
    move v2, v1

    .line 32
    move-object v1, v5

    .line 33
    goto/16 :goto_10

    .line 34
    .line 35
    :catch_1
    move-exception p0

    .line 36
    move-object p1, v0

    .line 37
    move-object p2, p1

    .line 38
    move-object v3, p2

    .line 39
    :goto_3
    move-object v4, v3

    .line 40
    move-object v5, v4

    .line 41
    :goto_4
    move v2, v1

    .line 42
    move-object v1, v5

    .line 43
    goto/16 :goto_15

    .line 44
    .line 45
    :cond_1
    sget-object p1, Ll/r4f0;->b:Ljava/lang/String;

    .line 46
    .line 47
    :goto_5
    invoke-virtual {v2, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 48
    .line 49
    .line 50
    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    :try_start_1
    new-instance v2, Ljava/io/DataOutputStream;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-direct {v2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_d
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 58
    .line 59
    .line 60
    :try_start_2
    array-length v3, p0

    .line 61
    const/4 v4, 0x0

    .line 62
    :goto_6
    if-ge v4, v3, :cond_3

    .line 63
    .line 64
    aget-object v5, p0, v4

    .line 65
    .line 66
    if-nez v5, :cond_2

    .line 67
    .line 68
    goto :goto_7

    .line 69
    :cond_2
    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v2, v5}, Ljava/io/OutputStream;->write([B)V

    .line 74
    .line 75
    .line 76
    sget-object v5, Ll/r4f0;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v2, v5}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    .line 82
    .line 83
    .line 84
    :goto_7
    add-int/lit8 v4, v4, 0x1

    .line 85
    .line 86
    goto :goto_6

    .line 87
    :catchall_1
    move-exception p0

    .line 88
    move-object v3, v0

    .line 89
    move-object v4, v3

    .line 90
    :goto_8
    move-object v0, v2

    .line 91
    goto/16 :goto_1c

    .line 92
    .line 93
    :catch_2
    move-exception p0

    .line 94
    move-object p2, p1

    .line 95
    move-object p1, v0

    .line 96
    move-object v4, p1

    .line 97
    :goto_9
    move-object v5, v4

    .line 98
    move-object v3, v2

    .line 99
    goto :goto_2

    .line 100
    :catch_3
    move-exception p0

    .line 101
    move-object p2, p1

    .line 102
    move-object p1, v0

    .line 103
    move-object v4, p1

    .line 104
    :goto_a
    move-object v5, v4

    .line 105
    move-object v3, v2

    .line 106
    goto :goto_4

    .line 107
    :cond_3
    sget-object p0, Ll/r4f0;->d:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v2, p0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/Process;->waitFor()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz p2, :cond_5

    .line 120
    .line 121
    new-instance p0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 124
    .line 125
    .line 126
    :try_start_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_a
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 129
    .line 130
    .line 131
    :try_start_4
    new-instance v3, Ljava/io/BufferedReader;

    .line 132
    .line 133
    new-instance v4, Ljava/io/InputStreamReader;

    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 140
    .line 141
    .line 142
    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_8
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 143
    .line 144
    .line 145
    :try_start_5
    new-instance v4, Ljava/io/BufferedReader;

    .line 146
    .line 147
    new-instance v5, Ljava/io/InputStreamReader;

    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 154
    .line 155
    .line 156
    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 157
    .line 158
    .line 159
    :goto_b
    :try_start_6
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    if-eqz v5, :cond_4

    .line 164
    .line 165
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    goto :goto_b

    .line 169
    :catchall_2
    move-exception p0

    .line 170
    goto :goto_8

    .line 171
    :catch_4
    move-exception v5

    .line 172
    move-object v7, p1

    .line 173
    move-object p1, p0

    .line 174
    move-object p0, v5

    .line 175
    move-object v5, v4

    .line 176
    move-object v4, v3

    .line 177
    move-object v3, v2

    .line 178
    move v2, v1

    .line 179
    move-object v1, p2

    .line 180
    move-object p2, v7

    .line 181
    goto/16 :goto_10

    .line 182
    .line 183
    :catch_5
    move-exception v5

    .line 184
    move-object v7, p1

    .line 185
    move-object p1, p0

    .line 186
    move-object p0, v5

    .line 187
    move-object v5, v4

    .line 188
    move-object v4, v3

    .line 189
    move-object v3, v2

    .line 190
    move v2, v1

    .line 191
    move-object v1, p2

    .line 192
    move-object p2, v7

    .line 193
    goto/16 :goto_15

    .line 194
    .line 195
    :cond_4
    :goto_c
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    if-eqz v5, :cond_6

    .line 200
    .line 201
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 202
    .line 203
    .line 204
    goto :goto_c

    .line 205
    :catchall_3
    move-exception p0

    .line 206
    move-object v4, v0

    .line 207
    goto :goto_8

    .line 208
    :catch_6
    move-exception v4

    .line 209
    move-object v5, p1

    .line 210
    move-object p1, p0

    .line 211
    move-object p0, v4

    .line 212
    move-object v4, v3

    .line 213
    move-object v3, v2

    .line 214
    move v2, v1

    .line 215
    move-object v1, p2

    .line 216
    move-object p2, v5

    .line 217
    move-object v5, v0

    .line 218
    goto/16 :goto_10

    .line 219
    .line 220
    :catch_7
    move-exception v4

    .line 221
    move-object v5, p1

    .line 222
    move-object p1, p0

    .line 223
    move-object p0, v4

    .line 224
    move-object v4, v3

    .line 225
    move-object v3, v2

    .line 226
    move v2, v1

    .line 227
    move-object v1, p2

    .line 228
    move-object p2, v5

    .line 229
    move-object v5, v0

    .line 230
    goto/16 :goto_15

    .line 231
    .line 232
    :catch_8
    move-exception v3

    .line 233
    move-object v4, p1

    .line 234
    move-object p1, p0

    .line 235
    move-object p0, v3

    .line 236
    move-object v3, v2

    .line 237
    move v2, v1

    .line 238
    move-object v1, p2

    .line 239
    move-object p2, v4

    .line 240
    move-object v4, v0

    .line 241
    move-object v5, v4

    .line 242
    goto/16 :goto_10

    .line 243
    .line 244
    :catch_9
    move-exception v3

    .line 245
    move-object v4, p1

    .line 246
    move-object p1, p0

    .line 247
    move-object p0, v3

    .line 248
    move-object v3, v2

    .line 249
    move v2, v1

    .line 250
    move-object v1, p2

    .line 251
    move-object p2, v4

    .line 252
    move-object v4, v0

    .line 253
    move-object v5, v4

    .line 254
    goto/16 :goto_15

    .line 255
    .line 256
    :catch_a
    move-exception p2

    .line 257
    move-object v3, p1

    .line 258
    move-object p1, p0

    .line 259
    move-object p0, p2

    .line 260
    move-object p2, v3

    .line 261
    move-object v4, v0

    .line 262
    goto/16 :goto_9

    .line 263
    .line 264
    :catch_b
    move-exception p2

    .line 265
    move-object v3, p1

    .line 266
    move-object p1, p0

    .line 267
    move-object p0, p2

    .line 268
    move-object p2, v3

    .line 269
    move-object v4, v0

    .line 270
    goto/16 :goto_a

    .line 271
    .line 272
    :cond_5
    move-object p0, v0

    .line 273
    move-object p2, p0

    .line 274
    move-object v3, p2

    .line 275
    move-object v4, v3

    .line 276
    :cond_6
    :try_start_7
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 277
    .line 278
    .line 279
    if-eqz v3, :cond_7

    .line 280
    .line 281
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 282
    .line 283
    .line 284
    goto :goto_d

    .line 285
    :catch_c
    move-exception v2

    .line 286
    goto :goto_e

    .line 287
    :cond_7
    :goto_d
    if-eqz v4, :cond_8

    .line 288
    .line 289
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_c

    .line 290
    .line 291
    .line 292
    goto :goto_f

    .line 293
    :goto_e
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 294
    .line 295
    .line 296
    :cond_8
    :goto_f
    invoke-virtual {p1}, Ljava/lang/Process;->destroy()V

    .line 297
    .line 298
    .line 299
    goto/16 :goto_19

    .line 300
    .line 301
    :catchall_4
    move-exception p0

    .line 302
    move-object v3, v0

    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :catch_d
    move-exception p0

    .line 306
    move-object p2, p1

    .line 307
    move-object p1, v0

    .line 308
    move-object v3, p1

    .line 309
    goto/16 :goto_1

    .line 310
    .line 311
    :catch_e
    move-exception p0

    .line 312
    move-object p2, p1

    .line 313
    move-object p1, v0

    .line 314
    move-object v3, p1

    .line 315
    goto/16 :goto_3

    .line 316
    .line 317
    :goto_10
    :try_start_8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 318
    .line 319
    .line 320
    if-eqz v3, :cond_9

    .line 321
    .line 322
    :try_start_9
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 323
    .line 324
    .line 325
    goto :goto_11

    .line 326
    :catch_f
    move-exception p0

    .line 327
    goto :goto_12

    .line 328
    :cond_9
    :goto_11
    if-eqz v4, :cond_a

    .line 329
    .line 330
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 331
    .line 332
    .line 333
    :cond_a
    if-eqz v5, :cond_b

    .line 334
    .line 335
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_f

    .line 336
    .line 337
    .line 338
    goto :goto_13

    .line 339
    :goto_12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 340
    .line 341
    .line 342
    :cond_b
    :goto_13
    if-eqz p2, :cond_c

    .line 343
    .line 344
    :goto_14
    invoke-virtual {p2}, Ljava/lang/Process;->destroy()V

    .line 345
    .line 346
    .line 347
    :cond_c
    move-object p0, p1

    .line 348
    move-object p2, v1

    .line 349
    move v1, v2

    .line 350
    goto :goto_19

    .line 351
    :catchall_5
    move-exception p0

    .line 352
    move-object p1, p2

    .line 353
    move-object v0, v3

    .line 354
    move-object v3, v4

    .line 355
    move-object v4, v5

    .line 356
    goto :goto_1c

    .line 357
    :goto_15
    :try_start_a
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 358
    .line 359
    .line 360
    if-eqz v3, :cond_d

    .line 361
    .line 362
    :try_start_b
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 363
    .line 364
    .line 365
    goto :goto_16

    .line 366
    :catch_10
    move-exception p0

    .line 367
    goto :goto_17

    .line 368
    :cond_d
    :goto_16
    if-eqz v4, :cond_e

    .line 369
    .line 370
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 371
    .line 372
    .line 373
    :cond_e
    if-eqz v5, :cond_f

    .line 374
    .line 375
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_10

    .line 376
    .line 377
    .line 378
    goto :goto_18

    .line 379
    :goto_17
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 380
    .line 381
    .line 382
    :cond_f
    :goto_18
    if-eqz p2, :cond_c

    .line 383
    .line 384
    goto :goto_14

    .line 385
    :goto_19
    new-instance p1, Ll/r4f0$a;

    .line 386
    .line 387
    if-nez p0, :cond_10

    .line 388
    .line 389
    move-object p0, v0

    .line 390
    goto :goto_1a

    .line 391
    :cond_10
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    :goto_1a
    if-nez p2, :cond_11

    .line 396
    .line 397
    goto :goto_1b

    .line 398
    :cond_11
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    :goto_1b
    invoke-direct {p1, v1, p0, v0}, Ll/r4f0$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    return-object p1

    .line 406
    :goto_1c
    if-eqz v0, :cond_12

    .line 407
    .line 408
    :try_start_c
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 409
    .line 410
    .line 411
    goto :goto_1d

    .line 412
    :catch_11
    move-exception p2

    .line 413
    goto :goto_1e

    .line 414
    :cond_12
    :goto_1d
    if-eqz v3, :cond_13

    .line 415
    .line 416
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 417
    .line 418
    .line 419
    :cond_13
    if-eqz v4, :cond_14

    .line 420
    .line 421
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_11

    .line 422
    .line 423
    .line 424
    goto :goto_1f

    .line 425
    :goto_1e
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 426
    .line 427
    .line 428
    :cond_14
    :goto_1f
    if-eqz p1, :cond_15

    .line 429
    .line 430
    invoke-virtual {p1}, Ljava/lang/Process;->destroy()V

    .line 431
    .line 432
    .line 433
    :cond_15
    throw p0

    .line 434
    :cond_16
    :goto_20
    new-instance p0, Ll/r4f0$a;

    .line 435
    .line 436
    invoke-direct {p0, v1, v0, v0}, Ll/r4f0$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    return-object p0
.end method
