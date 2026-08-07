.class public Ll/gol;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d1m;


# instance fields
.field private final a:Landroid/content/Context;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gol;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gol;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v2, 0xf

    .line 12
    .line 13
    new-array v3, v2, [B

    .line 14
    .line 15
    fill-array-data v3, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v0, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const/4 v4, 0x1

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    new-array v0, v2, [B

    .line 30
    .line 31
    fill-array-data v0, :array_1

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/gol;->b:Ljava/lang/String;

    .line 39
    .line 40
    return v4

    .line 41
    :cond_1
    const/16 v2, 0x12

    .line 42
    .line 43
    new-array v3, v2, [B

    .line 44
    .line 45
    fill-array-data v3, :array_2

    .line 46
    .line 47
    .line 48
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v0, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    new-array v0, v2, [B

    .line 59
    .line 60
    fill-array-data v0, :array_3

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Ll/gol;->b:Ljava/lang/String;

    .line 68
    .line 69
    return v4

    .line 70
    :cond_2
    const/16 v2, 0xe

    .line 71
    .line 72
    new-array v2, v2, [B

    .line 73
    .line 74
    fill-array-data v2, :array_4

    .line 75
    .line 76
    .line 77
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iput-object v2, p0, Ll/gol;->b:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 84
    .line 85
    .line 86
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    return v4

    .line 90
    :catch_0
    :cond_3
    return v1

    .line 91
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x9t
        0x13t
        0x51t
        0x11t
        0x54t
        0x5et
        0x4ft
        0xet
        0x47t
        0xft
        0x55t
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :array_1
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x9t
        0x13t
        0x51t
        0x11t
        0x54t
        0x5et
        0x4ft
        0xet
        0x47t
        0xft
        0x55t
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :array_2
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x9t
        0x13t
        0x51t
        0x11t
        0x54t
        0x5et
        0x4ft
        0xet
        0x47t
        0xft
        0x55t
        0x19t
        0x15t
        0x10t
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    nop

    .line 129
    :array_3
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x9t
        0x13t
        0x51t
        0x11t
        0x54t
        0x5et
        0x4ft
        0xet
        0x47t
        0xft
        0x55t
        0x19t
        0x15t
        0x10t
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    nop

    .line 143
    :array_4
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x9t
        0x13t
        0x51t
        0x11t
        0x54t
        0x5et
        0x4ft
        0xet
        0x5dt
        0x15t
    .end array-data
.end method

.method public b(Ll/pul;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/gol;->a:Landroid/content/Context;

    .line 6
    .line 7
    if-eqz v2, :cond_3

    .line 8
    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/16 v3, 0x8

    .line 16
    .line 17
    new-array v4, v3, [B

    .line 18
    .line 19
    const/16 v5, 0x40

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    aput-byte v5, v4, v6

    .line 23
    .line 24
    const/16 v5, 0x16

    .line 25
    .line 26
    const/4 v7, 0x1

    .line 27
    aput-byte v5, v4, v7

    .line 28
    .line 29
    const/16 v8, 0x42

    .line 30
    .line 31
    const/4 v9, 0x2

    .line 32
    aput-byte v8, v4, v9

    .line 33
    .line 34
    const/16 v8, 0x68

    .line 35
    .line 36
    const/4 v10, 0x3

    .line 37
    aput-byte v8, v4, v10

    .line 38
    .line 39
    const/16 v8, 0xe

    .line 40
    .line 41
    const/4 v11, 0x4

    .line 42
    aput-byte v8, v4, v11

    .line 43
    .line 44
    const/4 v12, 0x5

    .line 45
    const/4 v13, 0x7

    .line 46
    aput-byte v13, v4, v12

    .line 47
    .line 48
    const/16 v14, 0x59

    .line 49
    .line 50
    const/4 v15, 0x6

    .line 51
    aput-byte v14, v4, v15

    .line 52
    .line 53
    aput-byte v9, v4, v13

    .line 54
    .line 55
    invoke-static {v4}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-static {v2, v4}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_0

    .line 68
    .line 69
    new-instance v4, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    move/from16 v16, v3

    .line 75
    .line 76
    const/16 v3, 0x1f

    .line 77
    .line 78
    new-array v3, v3, [B

    .line 79
    .line 80
    const/16 v17, 0x77

    .line 81
    .line 82
    aput-byte v17, v3, v6

    .line 83
    .line 84
    aput-byte v10, v3, v7

    .line 85
    .line 86
    const/16 v6, 0x45

    .line 87
    .line 88
    aput-byte v6, v3, v9

    .line 89
    .line 90
    const/16 v6, 0x17

    .line 91
    .line 92
    aput-byte v6, v3, v10

    .line 93
    .line 94
    aput-byte v8, v3, v11

    .line 95
    .line 96
    aput-byte v13, v3, v12

    .line 97
    .line 98
    aput-byte v14, v3, v15

    .line 99
    .line 100
    aput-byte v9, v3, v13

    .line 101
    .line 102
    const/16 v7, 0x11

    .line 103
    .line 104
    aput-byte v7, v3, v16

    .line 105
    .line 106
    const/16 v9, 0x51

    .line 107
    .line 108
    const/16 v10, 0x9

    .line 109
    .line 110
    aput-byte v9, v3, v10

    .line 111
    .line 112
    const/16 v12, 0x13

    .line 113
    .line 114
    const/16 v13, 0xa

    .line 115
    .line 116
    aput-byte v12, v3, v13

    .line 117
    .line 118
    const/16 v14, 0xb

    .line 119
    .line 120
    aput-byte v10, v3, v14

    .line 121
    .line 122
    const/16 v10, 0xc

    .line 123
    .line 124
    const/16 v14, 0x5d

    .line 125
    .line 126
    aput-byte v14, v3, v10

    .line 127
    .line 128
    const/16 v10, 0xd

    .line 129
    .line 130
    const/16 v14, 0x46

    .line 131
    .line 132
    aput-byte v14, v3, v10

    .line 133
    .line 134
    const/16 v10, 0x56

    .line 135
    .line 136
    aput-byte v10, v3, v8

    .line 137
    .line 138
    const/16 v10, 0x5b

    .line 139
    .line 140
    const/16 v14, 0xf

    .line 141
    .line 142
    aput-byte v10, v3, v14

    .line 143
    .line 144
    const/16 v10, 0x10

    .line 145
    .line 146
    aput-byte v8, v3, v10

    .line 147
    .line 148
    aput-byte v11, v3, v7

    .line 149
    .line 150
    const/16 v8, 0x12

    .line 151
    .line 152
    aput-byte v9, v3, v8

    .line 153
    .line 154
    aput-byte v13, v3, v12

    .line 155
    .line 156
    const/16 v9, 0x14

    .line 157
    .line 158
    aput-byte v7, v3, v9

    .line 159
    .line 160
    const/16 v7, 0x15

    .line 161
    .line 162
    const/16 v9, 0x44

    .line 163
    .line 164
    aput-byte v9, v3, v7

    .line 165
    .line 166
    aput-byte v11, v3, v5

    .line 167
    .line 168
    aput-byte v8, v3, v6

    .line 169
    .line 170
    const/16 v5, 0x18

    .line 171
    .line 172
    aput-byte v9, v3, v5

    .line 173
    .line 174
    const/16 v5, 0x19

    .line 175
    .line 176
    aput-byte v14, v3, v5

    .line 177
    .line 178
    const/16 v5, 0x1a

    .line 179
    .line 180
    const/16 v6, 0x5f

    .line 181
    .line 182
    aput-byte v6, v3, v5

    .line 183
    .line 184
    const/16 v5, 0x1b

    .line 185
    .line 186
    const/16 v6, 0x50

    .line 187
    .line 188
    aput-byte v6, v3, v5

    .line 189
    .line 190
    const/16 v5, 0x1c

    .line 191
    .line 192
    aput-byte v8, v3, v5

    .line 193
    .line 194
    const/16 v5, 0x1d

    .line 195
    .line 196
    const/16 v6, 0x5c

    .line 197
    .line 198
    aput-byte v6, v3, v5

    .line 199
    .line 200
    const/16 v5, 0x1e

    .line 201
    .line 202
    aput-byte v10, v3, v5

    .line 203
    .line 204
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    invoke-static {v3}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-interface {v1, v2}, Ll/pul;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :catch_0
    :cond_0
    iget-object v2, v0, Ll/gol;->b:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-eqz v2, :cond_2

    .line 232
    .line 233
    invoke-virtual {v0}, Ll/gol;->a()Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    if-eqz v2, :cond_1

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_1
    new-instance v0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 241
    .line 242
    const/16 v2, 0x23

    .line 243
    .line 244
    new-array v2, v2, [B

    .line 245
    .line 246
    fill-array-data v2, :array_0

    .line 247
    .line 248
    .line 249
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-direct {v0, v2}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-interface {v1, v0}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_2
    :goto_0
    new-instance v2, Landroid/content/Intent;

    .line 261
    .line 262
    const/16 v3, 0x24

    .line 263
    .line 264
    new-array v3, v3, [B

    .line 265
    .line 266
    fill-array-data v3, :array_1

    .line 267
    .line 268
    .line 269
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v3, v0, Ll/gol;->b:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 279
    .line 280
    .line 281
    iget-object v3, v0, Ll/gol;->a:Landroid/content/Context;

    .line 282
    .line 283
    new-instance v4, Ll/gol$a;

    .line 284
    .line 285
    invoke-direct {v4, v0}, Ll/gol$a;-><init>(Ll/gol;)V

    .line 286
    .line 287
    .line 288
    invoke-static {v3, v2, v1, v4}, Ll/w350;->a(Landroid/content/Context;Landroid/content/Intent;Ll/pul;Ll/w350$a;)V

    .line 289
    .line 290
    .line 291
    :cond_3
    return-void

    .line 292
    nop

    .line 293
    :array_0
    .array-data 1
        0x78t
        0x13t
        0x50t
        0x40t
        0x4t
        0xft
        0x10t
        0x27t
        0x55t
        0x41t
        0x4t
        0x14t
        0x44t
        0xft
        0x42t
        0x5et
        0xft
        0x1t
        0x10t
        0x2ft
        0x75t
        0x17t
        0xft
        0x9t
        0x44t
        0x46t
        0x50t
        0x41t
        0x0t
        0xft
        0x5ct
        0x7t
        0x53t
        0x5bt
        0x4t
    .end array-data

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
    .line 314
    .line 315
    :array_1
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x14t
        0x9t
        0x54t
        0xft
        0x42t
        0x19t
        0xet
        0x16t
        0x55t
        0x8t
        0x55t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
        0x1ft
        0x78t
        0x31t
        0x23t
        0x7et
        0x2ft
        0x75t
        0x64t
        0x3et
        0x35t
        0x75t
        0x34t
        0x67t
        0x7et
        0x22t
        0x23t
    .end array-data
.end method
