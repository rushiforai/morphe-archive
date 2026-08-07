.class public Ll/e350;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d1m;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e350;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "AnnotateVersionCheck"
        }
    .end annotation

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x1d

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public b(Ll/pul;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e350;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/e350;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/16 p0, 0x2e

    .line 14
    .line 15
    new-array p0, p0, [B

    .line 16
    .line 17
    fill-array-data p0, :array_0

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 28
    .line 29
    const/16 v0, 0x2e

    .line 30
    .line 31
    new-array v0, v0, [B

    .line 32
    .line 33
    fill-array-data v0, :array_1

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p0, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p1, p0}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/16 v0, 0x24

    .line 48
    .line 49
    :try_start_0
    new-array v0, v0, [B

    .line 50
    .line 51
    fill-array-data v0, :array_2

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object p0, p0, Ll/e350;->a:Landroid/content/Context;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0, v0}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    const/4 v0, 0x7

    .line 75
    new-array v1, v0, [B

    .line 76
    .line 77
    fill-array-data v1, :array_3

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-virtual {p0, v1, v2, v2}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V

    .line 90
    .line 91
    .line 92
    if-eqz v1, :cond_3

    .line 93
    .line 94
    const/4 p0, 0x4

    .line 95
    new-array p0, p0, [B

    .line 96
    .line 97
    fill-array-data p0, :array_4

    .line 98
    .line 99
    .line 100
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const/4 v3, -0x1

    .line 105
    invoke-virtual {v1, p0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-nez p0, :cond_1

    .line 110
    .line 111
    const/4 p0, 0x2

    .line 112
    new-array p0, p0, [B

    .line 113
    .line 114
    fill-array-data p0, :array_5

    .line 115
    .line 116
    .line 117
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {v1, p0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    goto :goto_0

    .line 126
    :catch_0
    move-exception p0

    .line 127
    goto :goto_1

    .line 128
    :cond_1
    :goto_0
    if-eqz v2, :cond_2

    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_2

    .line 135
    .line 136
    new-instance p0, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const/16 v0, 0x14

    .line 142
    .line 143
    new-array v0, v0, [B

    .line 144
    .line 145
    fill-array-data v0, :array_6

    .line 146
    .line 147
    .line 148
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {p0}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {p1, v2}, Ll/pul;->a(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_2
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 170
    .line 171
    new-instance v2, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const/16 v3, 0x13

    .line 177
    .line 178
    new-array v3, v3, [B

    .line 179
    .line 180
    fill-array-data v3, :array_7

    .line 181
    .line 182
    .line 183
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    new-array v0, v0, [B

    .line 191
    .line 192
    fill-array-data v0, :array_8

    .line 193
    .line 194
    .line 195
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-direct {p0, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    throw p0

    .line 214
    :cond_3
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 215
    .line 216
    const/16 v0, 0x21

    .line 217
    .line 218
    new-array v0, v0, [B

    .line 219
    .line 220
    fill-array-data v0, :array_9

    .line 221
    .line 222
    .line 223
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-direct {p0, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    throw p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 231
    :goto_1
    invoke-interface {p1, p0}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 232
    .line 233
    .line 234
    :cond_4
    return-void

    .line 235
    :array_0
    .array-data 1
        0x7ft
        0x8t
        0x5dt
        0x4et
        0x41t
        0x15t
        0x45t
        0x16t
        0x41t
        0x58t
        0x13t
        0x12t
        0x43t
        0x46t
        0x70t
        0x59t
        0x5t
        0x14t
        0x5ft
        0xft
        0x55t
        0x17t
        0x50t
        0x56t
        0x1et
        0x56t
        0x11t
        0x56t
        0xft
        0x2t
        0x10t
        0x7t
        0x53t
        0x58t
        0x17t
        0x3t
        0x10t
        0x0t
        0x5et
        0x45t
        0x41t
        0x28t
        0x45t
        0x4t
        0x58t
        0x56t
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    nop

    .line 263
    :array_1
    .array-data 1
        0x7ft
        0x8t
        0x5dt
        0x4et
        0x41t
        0x15t
        0x45t
        0x16t
        0x41t
        0x58t
        0x13t
        0x12t
        0x43t
        0x46t
        0x70t
        0x59t
        0x5t
        0x14t
        0x5ft
        0xft
        0x55t
        0x17t
        0x50t
        0x56t
        0x1et
        0x56t
        0x11t
        0x56t
        0xft
        0x2t
        0x10t
        0x7t
        0x53t
        0x58t
        0x17t
        0x3t
        0x10t
        0x0t
        0x5et
        0x45t
        0x41t
        0x28t
        0x45t
        0x4t
        0x58t
        0x56t
    .end array-data

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    nop

    .line 291
    :array_2
    .array-data 1
        0x53t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x5ct
        0x1et
        0x18t
        0x2t
        0x8t
        0x1et
        0x8t
        0x44t
        0x55t
        0x8t
        0x7t
        0x1et
        0xft
        0x55t
        0x52t
        0xft
        0x12t
        0x59t
        0x12t
        0x48t
        0x18t
        0x8t
        0x2t
        0x55t
        0x8t
        0x45t
        0x5et
        0x15t
        0x1ft
    .end array-data

    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
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
    :array_3
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x78t
        0x20t
        0x2ft
        0x74t
    .end array-data

    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    :array_4
    .array-data 1
        0x53t
        0x9t
        0x55t
        0x52t
    .end array-data

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    :array_5
    .array-data 1
        0x59t
        0x2t
    .end array-data

    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    nop

    .line 333
    :array_6
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x15t
        0x45t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
        0xat
        0x46t
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
    .line 346
    .line 347
    :array_7
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x0t
        0x51t
        0xft
        0x5dt
        0x52t
        0x5t
        0x5ct
        0x10t
    .end array-data

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
    .line 359
    .line 360
    .line 361
    :array_8
    .array-data 1
        0x5dt
        0x3t
        0x42t
        0x44t
        0x0t
        0x1t
        0x55t
    .end array-data

    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    :array_9
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x0t
        0x51t
        0xft
        0x5dt
        0x52t
        0x5t
        0x5ct
        0x10t
        0x4t
        0x44t
        0x59t
        0x5t
        0xat
        0x55t
        0x46t
        0x58t
        0x44t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
    .end array-data
.end method
