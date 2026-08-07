.class Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;,
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;,
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;,
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    }
.end annotation


# static fields
.field private static ʻ:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/reflect/Member;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static ʼ:Ljava/lang/reflect/Field; = null

.field private static final ʽ:[B = null

.field private static ˊ:Ljava/lang/Class; = null

.field private static ˋ:Ljava/lang/Class; = null

.field private static ˋॱ:I = 0x1

.field private static ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

.field private static ˏ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/guardsquare/dexguard/runtime/devicefingerprinting/\u0269$\u0269;",
            ">;"
        }
    .end annotation
.end field

.field private static ॱ:Ljava/lang/Class;

.field private static ॱॱ:I

.field private static ᐝ:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    const-class v0, Ljava/lang/reflect/Member;

    .line 2
    .line 3
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ:Ljava/util/List;

    .line 12
    .line 13
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 14
    .line 15
    const/16 v2, 0x30

    .line 16
    .line 17
    aget-byte v2, v1, v2

    .line 18
    .line 19
    int-to-byte v2, v2

    .line 20
    const/16 v3, 0x8d

    .line 21
    .line 22
    aget-byte v1, v1, v3

    .line 23
    .line 24
    int-to-byte v1, v1

    .line 25
    const/16 v3, 0x67

    .line 26
    .line 27
    invoke-static {v3, v2, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 36
    .line 37
    sput-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    const/4 v5, 0x2

    .line 41
    const/4 v6, 0x1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 45
    .line 46
    or-int/lit8 v7, v1, 0x43

    .line 47
    .line 48
    shl-int/2addr v7, v6

    .line 49
    xor-int/lit8 v1, v1, 0x43

    .line 50
    .line 51
    sub-int/2addr v7, v1

    .line 52
    rem-int/lit16 v1, v7, 0x80

    .line 53
    .line 54
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 55
    .line 56
    rem-int/2addr v7, v5

    .line 57
    if-eqz v7, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    throw v4

    .line 61
    :cond_1
    const/4 v2, 0x0

    .line 62
    :try_start_0
    invoke-virtual {v1, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    if-lt v1, v5, :cond_3

    .line 71
    .line 72
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x47

    .line 75
    .line 76
    rem-int/lit16 v2, v1, 0x80

    .line 77
    .line 78
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 79
    .line 80
    rem-int/2addr v1, v5

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    :try_start_1
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 84
    .line 85
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 86
    .line 87
    xor-int/lit8 v4, v1, 0x7

    .line 88
    .line 89
    and-int/lit8 v1, v1, 0x7

    .line 90
    .line 91
    shl-int/2addr v1, v6

    .line 92
    add-int/2addr v4, v1

    .line 93
    rem-int/lit16 v4, v4, 0x80

    .line 94
    .line 95
    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    :try_start_2
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 99
    .line 100
    throw v4

    .line 101
    :cond_3
    :try_start_3
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 102
    .line 103
    :goto_0
    sput-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0

    .line 104
    .line 105
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 106
    .line 107
    and-int/lit8 v2, v1, 0x67

    .line 108
    .line 109
    or-int/2addr v1, v3

    .line 110
    add-int/2addr v2, v1

    .line 111
    rem-int/lit16 v2, v2, 0x80

    .line 112
    .line 113
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 114
    .line 115
    :catch_0
    const/16 v1, 0x53

    .line 116
    .line 117
    :try_start_4
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 118
    .line 119
    const/16 v3, 0x135

    .line 120
    .line 121
    aget-byte v3, v2, v3

    .line 122
    .line 123
    xor-int/lit8 v4, v3, -0x1

    .line 124
    .line 125
    shl-int/2addr v3, v6

    .line 126
    add-int/2addr v4, v3

    .line 127
    int-to-byte v3, v4

    .line 128
    const/16 v4, 0x18c

    .line 129
    .line 130
    aget-byte v5, v2, v4

    .line 131
    .line 132
    int-to-byte v5, v5

    .line 133
    const/16 v7, 0x104

    .line 134
    .line 135
    invoke-static {v7, v3, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-static {v3, v6, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_2

    .line 148
    .line 149
    if-eqz v3, :cond_4

    .line 150
    .line 151
    sget v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 152
    .line 153
    xor-int/lit8 v5, v3, 0x3f

    .line 154
    .line 155
    and-int/lit8 v3, v3, 0x3f

    .line 156
    .line 157
    shl-int/2addr v3, v6

    .line 158
    add-int/2addr v5, v3

    .line 159
    rem-int/lit16 v5, v5, 0x80

    .line 160
    .line 161
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 162
    .line 163
    :try_start_5
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ:Ljava/util/List;

    .line 164
    .line 165
    sget-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 166
    .line 167
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_2

    .line 168
    .line 169
    .line 170
    :try_start_6
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 171
    .line 172
    const/16 v5, 0x1b7

    .line 173
    .line 174
    aget-byte v5, v2, v5

    .line 175
    .line 176
    int-to-byte v5, v5

    .line 177
    const/4 v7, 0x5

    .line 178
    aget-byte v7, v2, v7

    .line 179
    .line 180
    int-to-byte v7, v7

    .line 181
    const/16 v8, 0x127

    .line 182
    .line 183
    invoke-static {v8, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    invoke-virtual {v3, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v3, v6}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 192
    .line 193
    .line 194
    sget-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 195
    .line 196
    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    check-cast v3, Ljava/util/HashMap;

    .line 201
    .line 202
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʻ:Ljava/util/Map;

    .line 203
    .line 204
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 205
    .line 206
    aget-byte v5, v2, v4

    .line 207
    .line 208
    int-to-byte v5, v5

    .line 209
    const/16 v7, 0x46

    .line 210
    .line 211
    const/16 v8, 0x137

    .line 212
    .line 213
    invoke-static {v8, v7, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    invoke-virtual {v3, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʼ:Ljava/lang/reflect/Field;

    .line 222
    .line 223
    invoke-virtual {v3, v6}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 224
    .line 225
    .line 226
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 227
    .line 228
    const/16 v5, 0xcc

    .line 229
    .line 230
    aget-byte v5, v2, v5

    .line 231
    .line 232
    int-to-short v5, v5

    .line 233
    const/16 v8, 0x6e

    .line 234
    .line 235
    aget-byte v8, v2, v8

    .line 236
    .line 237
    int-to-byte v8, v8

    .line 238
    const/16 v9, 0x25

    .line 239
    .line 240
    aget-byte v9, v2, v9

    .line 241
    .line 242
    int-to-byte v9, v9

    .line 243
    invoke-static {v5, v8, v9}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    const-class v8, Ljava/lang/Object;

    .line 248
    .line 249
    const-class v9, [Ljava/lang/Object;

    .line 250
    .line 251
    filled-new-array {v0, v8, v9}, [Ljava/lang/Class;

    .line 252
    .line 253
    .line 254
    move-result-object v8

    .line 255
    invoke-virtual {v3, v5, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ᐝ:Ljava/lang/reflect/Method;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 260
    .line 261
    const/16 v3, 0xe9

    .line 262
    .line 263
    :try_start_7
    aget-byte v3, v2, v3

    .line 264
    .line 265
    int-to-byte v3, v3

    .line 266
    aget-byte v4, v2, v4

    .line 267
    .line 268
    int-to-byte v4, v4

    .line 269
    const/16 v5, 0x192

    .line 270
    .line 271
    invoke-static {v5, v3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-static {v3, v6, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ:Ljava/lang/Class;

    .line 284
    .line 285
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 286
    .line 287
    aget-byte v2, v2, v1

    .line 288
    .line 289
    int-to-byte v2, v2

    .line 290
    const/16 v4, 0x1f5

    .line 291
    .line 292
    invoke-static {v4, v7, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    sget-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ:Ljava/lang/Class;

    .line 297
    .line 298
    filled-new-array {v0, v4}, [Ljava/lang/Class;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v3, v2, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 303
    .line 304
    .line 305
    goto :goto_1

    .line 306
    :catch_1
    :cond_4
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 307
    .line 308
    and-int/lit8 v2, v0, 0x41

    .line 309
    .line 310
    or-int/lit8 v0, v0, 0x41

    .line 311
    .line 312
    add-int/2addr v2, v0

    .line 313
    rem-int/lit16 v2, v2, 0x80

    .line 314
    .line 315
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 316
    .line 317
    goto :goto_1

    .line 318
    :catch_2
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ǃ;->ˊ()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 323
    .line 324
    const/16 v3, 0x11e

    .line 325
    .line 326
    aget-byte v3, v2, v3

    .line 327
    .line 328
    int-to-byte v3, v3

    .line 329
    const/16 v4, 0xe

    .line 330
    .line 331
    aget-byte v2, v2, v4

    .line 332
    .line 333
    int-to-byte v2, v2

    .line 334
    const/16 v4, 0x12c

    .line 335
    .line 336
    invoke-static {v4, v3, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-eqz v0, :cond_5

    .line 345
    .line 346
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ:Ljava/util/List;

    .line 347
    .line 348
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 349
    .line 350
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    :catch_3
    :cond_5
    :goto_1
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 354
    .line 355
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 356
    .line 357
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 361
    .line 362
    xor-int/lit8 v2, v0, 0x53

    .line 363
    .line 364
    and-int/2addr v0, v1

    .line 365
    shl-int/2addr v0, v6

    .line 366
    add-int/2addr v2, v0

    .line 367
    rem-int/lit16 v2, v2, 0x80

    .line 368
    .line 369
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 370
    .line 371
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

.method private static ˊ(Ljava/lang/reflect/Member;Ljava/lang/Object;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x5f

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_9

    .line 13
    .line 14
    invoke-static {p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ(Ljava/lang/reflect/Member;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    invoke-static {p3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˏ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x15

    .line 30
    .line 31
    rem-int/lit16 v2, v2, 0x80

    .line 32
    .line 33
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 34
    .line 35
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, 0x1

    .line 40
    xor-int/2addr v2, v3

    .line 41
    const/4 v4, 0x0

    .line 42
    if-eq v2, v3, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ne v2, v3, :cond_6

    .line 50
    .line 51
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 52
    .line 53
    or-int/lit8 v5, v2, 0x7

    .line 54
    .line 55
    shl-int/2addr v5, v3

    .line 56
    xor-int/lit8 v2, v2, 0x7

    .line 57
    .line 58
    sub-int/2addr v5, v2

    .line 59
    rem-int/lit16 v5, v5, 0x80

    .line 60
    .line 61
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 62
    .line 63
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$2;->ॱ:[I

    .line 64
    .line 65
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    aget v0, v2, v0

    .line 76
    .line 77
    if-eq v0, v3, :cond_2

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    if-eqz p3, :cond_3

    .line 81
    .line 82
    invoke-virtual {p3, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ(Z)V

    .line 83
    .line 84
    .line 85
    sget p3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 86
    .line 87
    xor-int/lit8 v0, p3, 0x43

    .line 88
    .line 89
    and-int/lit8 p3, p3, 0x43

    .line 90
    .line 91
    shl-int/2addr p3, v3

    .line 92
    add-int/2addr v0, p3

    .line 93
    rem-int/lit16 v0, v0, 0x80

    .line 94
    .line 95
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 96
    .line 97
    :cond_3
    instance-of p3, p0, Ljava/lang/reflect/Method;

    .line 98
    .line 99
    if-eqz p3, :cond_5

    .line 100
    .line 101
    sget p3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 102
    .line 103
    or-int/lit8 v0, p3, 0x4d

    .line 104
    .line 105
    shl-int/2addr v0, v3

    .line 106
    xor-int/lit8 p3, p3, 0x4d

    .line 107
    .line 108
    sub-int/2addr v0, p3

    .line 109
    rem-int/lit16 v0, v0, 0x80

    .line 110
    .line 111
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 112
    .line 113
    sget-object p3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ᐝ:Ljava/lang/reflect/Method;

    .line 114
    .line 115
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 116
    .line 117
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p3, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 126
    .line 127
    add-int/lit8 p1, p1, 0x73

    .line 128
    .line 129
    rem-int/lit16 p2, p1, 0x80

    .line 130
    .line 131
    sput p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 132
    .line 133
    rem-int/lit8 p1, p1, 0x2

    .line 134
    .line 135
    if-nez p1, :cond_4

    .line 136
    .line 137
    return-object p0

    .line 138
    :cond_4
    throw v1

    .line 139
    :cond_5
    sget-object p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʼ:Ljava/lang/reflect/Field;

    .line 140
    .line 141
    sget-object p3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 142
    .line 143
    invoke-virtual {p1, p3, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 144
    .line 145
    .line 146
    check-cast p0, Ljava/lang/reflect/Constructor;

    .line 147
    .line 148
    invoke-virtual {p0, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    sget-object p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʼ:Ljava/lang/reflect/Field;

    .line 153
    .line 154
    sget-object p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ:Ljava/lang/Class;

    .line 155
    .line 156
    invoke-virtual {p1, p2, v4}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 157
    .line 158
    .line 159
    return-object p0

    .line 160
    :cond_6
    :goto_0
    if-eqz p3, :cond_7

    .line 161
    .line 162
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 163
    .line 164
    or-int/lit8 v1, v0, 0x6d

    .line 165
    .line 166
    shl-int/2addr v1, v3

    .line 167
    xor-int/lit8 v0, v0, 0x6d

    .line 168
    .line 169
    sub-int/2addr v1, v0

    .line 170
    rem-int/lit16 v0, v1, 0x80

    .line 171
    .line 172
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 173
    .line 174
    rem-int/lit8 v1, v1, 0x2

    .line 175
    .line 176
    invoke-virtual {p3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ(Z)V

    .line 177
    .line 178
    .line 179
    :cond_7
    instance-of p3, p0, Ljava/lang/reflect/Constructor;

    .line 180
    .line 181
    if-eqz p3, :cond_8

    .line 182
    .line 183
    check-cast p0, Ljava/lang/reflect/Constructor;

    .line 184
    .line 185
    invoke-virtual {p0, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0

    .line 190
    :cond_8
    check-cast p0, Ljava/lang/reflect/Method;

    .line 191
    .line 192
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0

    .line 197
    :cond_9
    invoke-static {p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ(Ljava/lang/reflect/Member;)Ljava/util/List;

    .line 198
    .line 199
    .line 200
    throw v1
.end method

.method public static ˊ(Ljava/lang/String;Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;
    .locals 4

    .line 203
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    or-int/lit8 v1, v0, 0x53

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v0, v0, 0x53

    sub-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v0, 0x0

    if-nez v1, :cond_3

    .line 204
    invoke-static {p0, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/io/File;

    move-result-object p0

    .line 205
    const-string v1, ""

    if-eqz p0, :cond_2

    .line 206
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    or-int/lit8 v3, v2, 0x67

    shl-int/lit8 v3, v3, 0x1

    xor-int/lit8 v2, v2, 0x67

    sub-int/2addr v3, v2

    rem-int/lit16 v3, v3, 0x80

    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 207
    invoke-static {p0, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˎ(Ljava/io/File;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Z

    move-result p2

    if-eqz p2, :cond_2

    sget p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    xor-int/lit8 v2, p2, 0x2b

    and-int/lit8 p2, p2, 0x2b

    shl-int/lit8 p2, p2, 0x1

    add-int/2addr v2, p2

    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 208
    :try_start_0
    new-instance p2, Ljava/util/Scanner;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p2, v2}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p2, p1}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object p0

    .line 209
    invoke-virtual {p0}, Ljava/util/Scanner;->hasNext()Z

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_1

    .line 210
    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    and-int/lit8 p2, p1, 0x59

    or-int/lit8 p1, p1, 0x59

    add-int/2addr p2, p1

    rem-int/lit16 p1, p2, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    rem-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_0

    .line 211
    :try_start_1
    invoke-virtual {p0}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 212
    :cond_0
    invoke-virtual {p0}, Ljava/util/Scanner;->next()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    throw v0

    :cond_1
    move-object p1, v1

    .line 213
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Ljava/util/Scanner;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object p1

    :catch_0
    :cond_2
    return-object v1

    .line 214
    :cond_3
    invoke-static {p0, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ(Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/io/File;

    .line 215
    throw v0
.end method

.method private static ˊ(SBB)Ljava/lang/String;
    .locals 7

    .line 202
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    add-int/lit8 v1, v0, 0x11

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    rsub-int p0, p0, 0x1f9

    rsub-int/lit8 p2, p2, 0x78

    rsub-int/lit8 v2, p1, 0x52

    new-array v2, v2, [B

    rsub-int/lit8 p1, p1, 0x51

    const/4 v3, 0x0

    if-nez v1, :cond_1

    add-int/lit8 v0, v0, 0x11

    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    move v4, p2

    move v0, v3

    move p2, p0

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    throw p0

    :cond_1
    move v0, p2

    move p2, p0

    move p0, v0

    move v0, v3

    :goto_0
    int-to-byte v4, p0

    aput-byte v4, v2, v0

    if-ne v0, p1, :cond_2

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    aget-byte v4, v1, p2

    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    add-int/lit8 v5, v5, 0x1f

    rem-int/lit16 v5, v5, 0x80

    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    move v6, p2

    move p2, p0

    move p0, v6

    :goto_1
    add-int/lit8 p0, p0, 0x1

    add-int/2addr p2, v4

    add-int/lit8 p2, p2, -0xb

    move v6, p2

    move p2, p0

    move p0, v6

    goto :goto_0
.end method

.method private static ˊ()V
    .locals 4

    .line 201
    const/16 v0, 0x21c

    new-array v1, v0, [B

    const-string v2, "\u0006Y\u0001X\u0004\u0005\u0012\u000b\u0007\u00ed#\u001a\u00ff\u0012\u0000P,\u0010\u00b7^\u00f9\u0010\n\u00c6_\u0006\u00bcP\u001e\u00f8\t\u001d\n\u00fc\u00c6[\n\u000f\u000b\u0001\u0004\u0015\u0018\u00b2Y\u000c\u0010\u00c4C\u001e\u00fc\u0015\u000c\u0000\u0010\u0004\u00c4M\u0012\u0010\u00fe\u001c\u0002\u0007\u0019\u00b8Z\n\u00bd_\u00ff\u000c\u0015\u00b8O\u000c\u001c\u00fe\u0005\r\u00d2\u00ff^\u0003\t\u0012\u000b\u0004\u0010\u0004\u00c4_\u00fc\u0019\u000c\u00c5\t\u001a\u0007\r\u0008\u000c\u00bb\u000c\u00d4O\u0008\u00fe\u001f\u00c3>\u0018\u0001\u0019\u0008\u0005\u0006\u00d5U\u0003\n\u000f\u00fd\n\u00d55\u00f6\'\u00f9#\u001a\u00ff\u0012\u0000\u00ef2\u000b\u0007\u0005\u0011\u0005\u000e\r\u000b\r\u0019\u000b\u00de1\u0000\u0011\u0017\u001c\r\u00e4#\u001a\u00ff\u0012\u0000\u0000\t\u001a\u0002 \u00f6\u00d8I\u0000\u0018\u0004\u00d2O\u00fe\u000c\u0011\u0004\t\u001c\u00c5\u001e,\u001c\u000c\t\u00fa\r\u001c\u00e4#\u001a\u00ff\u0012\u0000\u0010\u0015\u00f9\u000c\u0015\u0004\u00ee2\u000b\u0007\u0013\u0003\n\u000f\u00fd\n\u00e02\u000b\u0007\u0005\n\u00f4#\u001a\u00ff\u0012\u0000\u00ea)\u0016\u000b\u0001\n\r\u0013\u0013\u0015\u00de.\u000e\u0004\u00f0\n\u00fd\u00f2\u0016\u001e\u00fc\u0016\u00a1\u000c\u00d4O\u0008\u00fe\u001f\u00c3>\u0018\u0001\u0019\u0008\u0005\u0006\u00d5U\u0003\n\u000f\u00fd\n\u00d55#\n\u000f\u00fd\n\u00e9;\u0002\u0006\u000e\t\u0018\u0001\u0019\u0008\u0005\u0006\u00d5L\u000f\u00c6M\r\u0008\u000c\u0000\u0018\r\u0000\u0007\u0019\u0018\u0001\u0019\u0008\u0005\u0006\u00d5L\u000f\u00c601\u0005\u000c\u00fc\u0013\u00ee-\u0008\u000c\u0000\u0018\r\u0000\u0007\u0019#\u0013\u0000\u000e\u0018\u00b9X\u0013\t\u000c\u00b7M\u000e\u00c6X\u0003\u001a\u00ff\u0012\u0000\u00c7Z\u000e\u00b9N\u0017\n\u0010\u000c\t\u000e\u00f9\u001c\u0006\u000e\u00b9Z\u00fe\u0013\u0006\t\u001c\u00c5\t\u001a\u00e7-\u0008\u000c\u0000\u0018\r\u0010\u00cd\u00f0Q\u0006\u0013\u000e\u0004\n\u00c7_\u0006\u00bcQ\u000e\u0010\u0001\u00c7N\u0014\u0000\u001d\u000b\u00b8\u0012\u0002 \u00f6\u00d8S\u0002\u00ccS\u00fa\u0018\u000c\u0001\u0011\n\u001e\u00fc\u0015\u000c\n\u0002 \u00f6\u00d8I\u0000\u0018\u0004\u00d2O\u00fe\u000c\u0011\u0004\t\u001c\u00c5\u001e<\r\u00e4#\u001a\u00ff\u0012\u0000&\u0013\u000e\u0004\n\u00c7_\u0006\u00bcN\u001a\u00fe\u0007\u001e\u00fc\u00c6L\u00ca[\r\u0008\u00ff\r\u0019\u000b\u00c6\u001e\u00f8\t\u0015\u00dc0\u0014\u00fe\t\u001c\u0006\u000e\u0012\u0010\u0013\u0004\u0007\u0005\u00f5.\u0002\t\r\u0010\u00fe\u0016\u00ec#\u001a\u00ff\u0012\u0000$\u0002\u001e\u0003\u0000\t\u001c\u00fc\n\u00c7P\u001e\u00f6\r\u0016\u000f\u0000\u0011\n\u00bdT\u0010\u00bdP\u001e\u00f8\t\u00eb7\t\u000b\u00ff\u0018\u0001\u00d5"

    const-string v3, "ISO-8859-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    return-void
.end method

.method public static ˋ(Landroid/content/Context;Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;
    .locals 8

    .line 1
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ:Ljava/lang/Class;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 9
    .line 10
    xor-int/lit8 v4, v0, 0xf

    .line 11
    .line 12
    and-int/lit8 v0, v0, 0xf

    .line 13
    .line 14
    shl-int/2addr v0, v3

    .line 15
    add-int/2addr v4, v0

    .line 16
    rem-int/lit16 v4, v4, 0x80

    .line 17
    .line 18
    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 25
    .line 26
    const/16 v4, 0x215

    .line 27
    .line 28
    aget-byte v4, v0, v4

    .line 29
    .line 30
    int-to-byte v4, v4

    .line 31
    const/16 v5, 0x97

    .line 32
    .line 33
    aget-byte v6, v0, v5

    .line 34
    .line 35
    int-to-byte v6, v6

    .line 36
    const/16 v7, 0xce

    .line 37
    .line 38
    invoke-static {v7, v4, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const/16 v6, 0x6d

    .line 43
    .line 44
    aget-byte v6, v0, v6

    .line 45
    .line 46
    neg-int v6, v6

    .line 47
    int-to-byte v6, v6

    .line 48
    aget-byte v0, v0, v5

    .line 49
    .line 50
    int-to-byte v0, v0

    .line 51
    const/16 v5, 0xe2

    .line 52
    .line 53
    invoke-static {v5, v6, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {v4, v0}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 62
    .line 63
    add-int/lit8 v4, v4, 0x9

    .line 64
    .line 65
    rem-int/lit16 v4, v4, 0x80

    .line 66
    .line 67
    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 68
    .line 69
    move v4, v2

    .line 70
    :goto_0
    if-ge v4, v1, :cond_0

    .line 71
    .line 72
    aget-object v5, v0, v4

    .line 73
    .line 74
    :try_start_0
    invoke-virtual {p0, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    sput-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 81
    .line 82
    add-int/lit8 p0, p0, 0x75

    .line 83
    .line 84
    rem-int/lit16 p0, p0, 0x80

    .line 85
    .line 86
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :catch_0
    or-int/lit8 v5, v4, 0x1

    .line 90
    .line 91
    shl-int/2addr v5, v3

    .line 92
    xor-int/lit8 v4, v4, 0x1

    .line 93
    .line 94
    sub-int v4, v5, v4

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    :goto_1
    sget-object p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ:Ljava/lang/Class;

    .line 98
    .line 99
    const/16 v0, 0x8b

    .line 100
    .line 101
    const/4 v4, 0x0

    .line 102
    if-eqz p0, :cond_2

    .line 103
    .line 104
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 105
    .line 106
    and-int/lit8 v5, p0, 0x4b

    .line 107
    .line 108
    or-int/lit8 p0, p0, 0x4b

    .line 109
    .line 110
    add-int/2addr v5, p0

    .line 111
    rem-int/lit16 p0, v5, 0x80

    .line 112
    .line 113
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 114
    .line 115
    rem-int/2addr v5, v1

    .line 116
    const-class p0, Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v5, :cond_1

    .line 119
    .line 120
    :try_start_1
    sget-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 121
    .line 122
    const/16 v6, 0x6b

    .line 123
    .line 124
    aget-byte v6, v5, v6

    .line 125
    .line 126
    int-to-byte v6, v6

    .line 127
    const/16 v7, 0xf3f

    .line 128
    .line 129
    aget-byte v5, v5, v7

    .line 130
    .line 131
    int-to-byte v5, v5

    .line 132
    const/16 v7, 0x5629

    .line 133
    .line 134
    invoke-static {v7, v6, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    sget-object v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ:Ljava/lang/Class;

    .line 139
    .line 140
    new-array v7, v2, [Ljava/lang/Class;

    .line 141
    .line 142
    aput-object p0, v7, v3

    .line 143
    .line 144
    new-array p0, v2, [Ljava/lang/Object;

    .line 145
    .line 146
    aput-object p1, p0, v2

    .line 147
    .line 148
    invoke-static {v5, v6, v7, p0, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    :goto_2
    check-cast p0, Ljava/lang/String;

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_1
    sget-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 156
    .line 157
    const/16 v6, 0x4a

    .line 158
    .line 159
    aget-byte v6, v5, v6

    .line 160
    .line 161
    int-to-byte v6, v6

    .line 162
    aget-byte v5, v5, v0

    .line 163
    .line 164
    int-to-byte v5, v5

    .line 165
    const/16 v7, 0x158

    .line 166
    .line 167
    invoke-static {v7, v6, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    sget-object v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ:Ljava/lang/Class;

    .line 172
    .line 173
    filled-new-array {p0}, [Ljava/lang/Class;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    invoke-static {v5, v6, p0, v7, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 185
    goto :goto_2

    .line 186
    :catch_1
    :cond_2
    move-object p0, v4

    .line 187
    :goto_3
    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    sget-object v6, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 193
    .line 194
    const/16 v7, 0xa7

    .line 195
    .line 196
    aget-byte v7, v6, v7

    .line 197
    .line 198
    add-int/2addr v7, v3

    .line 199
    int-to-byte v7, v7

    .line 200
    aget-byte v0, v6, v0

    .line 201
    .line 202
    int-to-byte v0, v0

    .line 203
    const/16 v6, 0x199

    .line 204
    .line 205
    invoke-static {v6, v7, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    filled-new-array {p1}, [Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-static {p1, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ([Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 231
    goto :goto_4

    .line 232
    :catch_2
    move-object p1, v4

    .line 233
    :goto_4
    if-eqz p0, :cond_4

    .line 234
    .line 235
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 236
    .line 237
    add-int/lit8 v0, v0, 0x73

    .line 238
    .line 239
    rem-int/lit16 v0, v0, 0x80

    .line 240
    .line 241
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 242
    .line 243
    if-eqz p1, :cond_4

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-eqz v0, :cond_3

    .line 250
    .line 251
    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 252
    .line 253
    xor-int/lit8 p2, p1, 0x31

    .line 254
    .line 255
    and-int/lit8 p1, p1, 0x31

    .line 256
    .line 257
    shl-int/2addr p1, v3

    .line 258
    add-int/2addr p2, p1

    .line 259
    rem-int/lit16 p2, p2, 0x80

    .line 260
    .line 261
    sput p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 262
    .line 263
    return-object p0

    .line 264
    :cond_3
    if-eqz p2, :cond_4

    .line 265
    .line 266
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 267
    .line 268
    add-int/lit8 v0, v0, 0x77

    .line 269
    .line 270
    rem-int/lit16 v0, v0, 0x80

    .line 271
    .line 272
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 273
    .line 274
    invoke-static {p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˏ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/util/Set;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    sget-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 279
    .line 280
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    invoke-virtual {p2, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ(Z)V

    .line 284
    .line 285
    .line 286
    sget p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 287
    .line 288
    and-int/lit8 v0, p2, 0x3d

    .line 289
    .line 290
    or-int/lit8 p2, p2, 0x3d

    .line 291
    .line 292
    add-int/2addr v0, p2

    .line 293
    rem-int/lit16 v0, v0, 0x80

    .line 294
    .line 295
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 296
    .line 297
    :cond_4
    if-eqz p0, :cond_5

    .line 298
    .line 299
    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 300
    .line 301
    add-int/lit8 p1, p1, 0x7

    .line 302
    .line 303
    rem-int/lit16 p1, p1, 0x80

    .line 304
    .line 305
    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 306
    .line 307
    return-object p0

    .line 308
    :cond_5
    if-eqz p1, :cond_7

    .line 309
    .line 310
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 311
    .line 312
    or-int/lit8 p2, p0, 0x21

    .line 313
    .line 314
    shl-int/2addr p2, v3

    .line 315
    xor-int/lit8 p0, p0, 0x21

    .line 316
    .line 317
    sub-int/2addr p2, p0

    .line 318
    rem-int/lit16 p0, p2, 0x80

    .line 319
    .line 320
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 321
    .line 322
    rem-int/2addr p2, v1

    .line 323
    if-nez p2, :cond_6

    .line 324
    .line 325
    return-object p1

    .line 326
    :cond_6
    throw v4

    .line 327
    :cond_7
    const-string p0, ""

    .line 328
    .line 329
    return-object p0
.end method

.method private static ˋ(Ljava/lang/reflect/Member;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Member;",
            ")",
            "Ljava/util/List<",
            "Lcom/guardsquare/dexguard/runtime/devicefingerprinting/\u0269$\u0269;",
            ">;"
        }
    .end annotation

    .line 330
    instance-of v0, p0, Ljava/lang/reflect/Method;

    if-nez v0, :cond_1

    .line 331
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 332
    instance-of v0, p0, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 333
    :cond_0
    sget-object p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    const/16 v0, 0x1bf

    aget-byte v0, p0, v0

    int-to-byte v0, v0

    const/16 v1, 0x75

    aget-byte p0, p0, v1

    neg-int p0, p0

    int-to-byte p0, p0

    const/16 v1, 0xb4

    invoke-static {v1, v0, p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    .line 334
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 335
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ:Ljava/util/List;

    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 336
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    or-int/lit8 v3, v1, 0x53

    shl-int/lit8 v3, v3, 0x1

    xor-int/lit8 v1, v1, 0x53

    sub-int/2addr v3, v1

    rem-int/lit16 v3, v3, 0x80

    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 337
    invoke-static {p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˎ(Ljava/lang/reflect/Member;)I

    move-result v1

    and-int/lit16 v3, v1, 0x100

    if-nez v3, :cond_4

    .line 338
    sget v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    and-int/lit8 v4, v3, 0x4d

    or-int/lit8 v5, v3, 0x4d

    add-int/2addr v4, v5

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    rem-int/lit8 v4, v4, 0x2

    const/high16 v5, 0x10000000

    if-nez v4, :cond_2

    const v4, -0x10000001

    and-int/2addr v4, v1

    not-int v1, v1

    and-int/2addr v1, v5

    or-int/2addr v1, v4

    if-eqz v1, :cond_3

    goto :goto_2

    :cond_2
    and-int/2addr v1, v5

    if-eqz v1, :cond_3

    goto :goto_2

    .line 339
    :cond_3
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʻ:Ljava/util/Map;

    if-eqz v1, :cond_5

    add-int/lit8 v3, v3, 0x1

    .line 340
    rem-int/lit16 v3, v3, 0x80

    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 341
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 342
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    xor-int/lit8 v3, v1, 0x3b

    and-int/lit8 v1, v1, 0x3b

    shl-int/lit8 v1, v1, 0x1

    add-int/2addr v3, v1

    rem-int/lit16 v3, v3, 0x80

    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 343
    invoke-virtual {v0, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 344
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    and-int/lit8 v2, v1, 0x5

    or-int/lit8 v1, v1, 0x5

    add-int/2addr v2, v1

    :goto_1
    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    goto :goto_3

    .line 345
    :cond_4
    :goto_2
    invoke-virtual {v0, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 346
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    or-int/lit8 v2, v1, 0x41

    shl-int/lit8 v2, v2, 0x1

    xor-int/lit8 v1, v1, 0x41

    sub-int/2addr v2, v1

    goto :goto_1

    .line 347
    :cond_5
    :goto_3
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7

    .line 348
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    xor-int/lit8 v2, v1, 0x13

    and-int/lit8 v1, v1, 0x13

    shl-int/lit8 v1, v1, 0x1

    add-int/2addr v2, v1

    rem-int/lit16 v2, v2, 0x80

    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 349
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˏ:Ljava/util/List;

    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_4

    :cond_6
    return-object v0

    .line 350
    :cond_7
    :goto_4
    invoke-interface {p0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result p0

    and-int/lit16 p0, p0, 0x100

    if-eqz p0, :cond_8

    .line 351
    sget-object p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    :cond_8
    return-object v0
.end method

.method private static ˎ(Ljava/lang/reflect/Member;)I
    .locals 3

    .line 173
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    or-int/lit8 v1, v0, 0x61

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v2, v0, 0x61

    sub-int/2addr v1, v2

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_4

    .line 174
    instance-of v1, p0, Ljava/lang/reflect/Method;

    if-nez v1, :cond_1

    or-int/lit8 v1, v0, 0x11

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v0, v0, 0x11

    sub-int/2addr v1, v0

    .line 175
    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 176
    instance-of v0, p0, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 177
    :cond_0
    sget-object p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    const/16 v0, 0x1bf

    aget-byte v0, p0, v0

    int-to-byte v0, v0

    const/16 v1, 0x75

    aget-byte p0, p0, v1

    neg-int p0, p0

    int-to-byte p0, p0

    const/16 v1, 0xb4

    invoke-static {v1, v0, p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    .line 178
    :cond_1
    :goto_0
    :try_start_0
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_2

    .line 179
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    add-int/lit8 v0, v0, 0x39

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    const/16 v0, 0x30

    .line 180
    :try_start_1
    div-int/lit8 v0, v0, 0x0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    add-int/lit8 v0, v0, 0x1f

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 181
    :catchall_0
    invoke-interface {p0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result p0

    .line 182
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_3

    const/16 v0, 0x9

    div-int/lit8 v0, v0, 0x0

    :cond_3
    return p0

    :cond_4
    const/4 p0, 0x0

    .line 183
    throw p0
.end method

.method public static ˎ(Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;
    .locals 3

    .line 184
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    and-int/lit8 v1, v0, 0x71

    or-int/lit8 v0, v0, 0x71

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    rem-int/lit8 v1, v1, 0x2

    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    if-eqz v1, :cond_0

    const/16 v1, 0x40

    aget-byte v1, v0, v1

    int-to-byte v1, v1

    const/16 v2, 0x3f

    aget-byte v0, v0, v2

    int-to-byte v0, v0

    const/16 v2, 0x7c86

    :goto_0
    invoke-static {v2, v1, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(Ljava/lang/String;Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/16 v1, 0xf

    aget-byte v1, v0, v1

    int-to-byte v1, v1

    const/16 v2, 0x3d

    aget-byte v0, v0, v2

    int-to-byte v0, v0

    const/16 v2, 0x10d

    goto :goto_0
.end method

.method private static ˎ(Ljava/io/File;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Z
    .locals 8

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x11

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 8
    .line 9
    :try_start_0
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    aget-byte v2, v0, v1

    .line 13
    .line 14
    int-to-short v2, v2

    .line 15
    const/16 v3, 0x11e

    .line 16
    .line 17
    aget-byte v4, v0, v3

    .line 18
    .line 19
    int-to-byte v4, v4

    .line 20
    const/16 v5, 0xcc

    .line 21
    .line 22
    aget-byte v5, v0, v5

    .line 23
    .line 24
    int-to-byte v5, v5

    .line 25
    invoke-static {v2, v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-static {v2, p0, v4, v4, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    if-nez v2, :cond_2

    .line 41
    .line 42
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 43
    .line 44
    xor-int/lit8 v5, v2, 0x9

    .line 45
    .line 46
    and-int/lit8 v2, v2, 0x9

    .line 47
    .line 48
    shl-int/2addr v2, v1

    .line 49
    add-int/2addr v5, v2

    .line 50
    rem-int/lit16 v5, v5, 0x80

    .line 51
    .line 52
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 53
    .line 54
    const/16 v2, 0x1f

    .line 55
    .line 56
    :try_start_1
    aget-byte v2, v0, v2

    .line 57
    .line 58
    int-to-short v2, v2

    .line 59
    const/16 v5, 0x14a

    .line 60
    .line 61
    aget-byte v5, v0, v5

    .line 62
    .line 63
    neg-int v5, v5

    .line 64
    int-to-byte v5, v5

    .line 65
    const/16 v6, 0x25

    .line 66
    .line 67
    aget-byte v7, v0, v6

    .line 68
    .line 69
    int-to-byte v7, v7

    .line 70
    invoke-static {v2, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {v2, p0, v4, v4, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 81
    .line 82
    .line 83
    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 84
    if-nez v2, :cond_2

    .line 85
    .line 86
    sget v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 87
    .line 88
    add-int/lit8 v2, v2, 0x3f

    .line 89
    .line 90
    rem-int/lit16 v5, v2, 0x80

    .line 91
    .line 92
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 93
    .line 94
    rem-int/lit8 v2, v2, 0x2

    .line 95
    .line 96
    if-eqz v2, :cond_0

    .line 97
    .line 98
    const/16 v2, 0x6f20

    .line 99
    .line 100
    :try_start_2
    aget-byte v2, v0, v2

    .line 101
    .line 102
    int-to-byte v2, v2

    .line 103
    const/16 v3, 0x35

    .line 104
    .line 105
    aget-byte v0, v0, v3

    .line 106
    .line 107
    int-to-byte v0, v0

    .line 108
    const/16 v3, 0x4aa8

    .line 109
    .line 110
    invoke-static {v3, v2, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0, p0, v4, v4, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Ljava/lang/Boolean;

    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_1

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_0
    aget-byte v2, v0, v3

    .line 128
    .line 129
    int-to-byte v2, v2

    .line 130
    aget-byte v0, v0, v6

    .line 131
    .line 132
    int-to-byte v0, v0

    .line 133
    const/16 v3, 0x112

    .line 134
    .line 135
    invoke-static {v3, v2, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0, p0, v4, v4, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Ljava/lang/Boolean;

    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 146
    .line 147
    .line 148
    move-result p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 149
    if-eqz p0, :cond_1

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_1
    const/4 p0, 0x0

    .line 153
    return p0

    .line 154
    :cond_2
    :goto_0
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 155
    .line 156
    add-int/lit8 p0, p0, 0x1f

    .line 157
    .line 158
    rem-int/lit16 p0, p0, 0x80

    .line 159
    .line 160
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 161
    .line 162
    return v1

    .line 163
    :catch_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 164
    .line 165
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    return p0
.end method

.method private static ˏ(Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/io/File;
    .locals 5

    .line 389
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    rem-int/lit8 v0, v0, 0x2

    const-class v1, Ljava/lang/String;

    const-class v2, Ljava/io/File;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 390
    :try_start_0
    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x1

    aput-object v1, v3, v4

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v4

    const/4 v1, 0x0

    .line 391
    invoke-virtual {v2, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 392
    invoke-static {v1, v2, v0, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(Ljava/lang/reflect/Member;Ljava/lang/Object;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    move-result-object p1

    .line 393
    :goto_0
    check-cast p1, Ljava/io/File;

    return-object p1

    :cond_0
    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    .line 394
    invoke-virtual {v2, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 395
    invoke-static {v0, v2, v1, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(Ljava/lang/reflect/Member;Ljava/lang/Object;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 396
    :catch_0
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object p1
.end method

.method public static ˏ(Ljava/lang/String;Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 388
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    or-int/lit8 v1, v0, 0x45

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v0, v0, 0x45

    sub-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0, p2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    move-result-object p0

    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    or-int/lit8 p2, p1, 0x15

    shl-int/lit8 p2, p2, 0x1

    xor-int/lit8 p1, p1, 0x15

    sub-int/2addr p2, p1

    rem-int/lit16 p1, p2, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    rem-int/lit8 p2, p2, 0x2

    if-nez p2, :cond_0

    return-object p0

    :cond_0
    throw v0
.end method

.method private static ˏ([Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-class v0, [Ljava/lang/String;

    .line 2
    .line 3
    const/16 v1, 0xf

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 7
    .line 8
    const/16 v4, 0xa4

    .line 9
    .line 10
    aget-byte v4, v3, v4

    .line 11
    .line 12
    int-to-short v4, v4

    .line 13
    const/16 v5, 0x15d

    .line 14
    .line 15
    aget-byte v5, v3, v5

    .line 16
    .line 17
    int-to-byte v5, v5

    .line 18
    const/16 v6, 0xcc

    .line 19
    .line 20
    aget-byte v7, v3, v6

    .line 21
    .line 22
    int-to-byte v7, v7

    .line 23
    invoke-static {v4, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const-class v7, Ljava/io/File;

    .line 32
    .line 33
    filled-new-array {v0, v0, v7}, [Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    aget-byte v7, v3, v1

    .line 38
    .line 39
    int-to-byte v7, v7

    .line 40
    const/4 v8, 0x5

    .line 41
    aget-byte v3, v3, v8

    .line 42
    .line 43
    int-to-byte v3, v3

    .line 44
    const/16 v8, 0x159

    .line 45
    .line 46
    invoke-static {v8, v7, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    filled-new-array {v3}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    filled-new-array {v3, v2, v2}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    move-object/from16 v7, p1

    .line 59
    .line 60
    invoke-static {v4, v5, v0, v3, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    move-object v3, v0

    .line 65
    check-cast v3, Ljava/lang/Process;

    .line 66
    .line 67
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-direct {v0, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;-><init>(Ljava/io/InputStream;)V

    .line 74
    .line 75
    .line 76
    new-instance v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;

    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-direct {v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;-><init>(Ljava/io/InputStream;)V

    .line 83
    .line 84
    .line 85
    new-instance v5, Ljava/io/DataOutputStream;

    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-direct {v5, v7}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    .line 98
    .line 99
    .line 100
    sget v7, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 101
    .line 102
    or-int/lit8 v8, v7, 0x2d

    .line 103
    .line 104
    shl-int/lit8 v8, v8, 0x1

    .line 105
    .line 106
    xor-int/lit8 v7, v7, 0x2d

    .line 107
    .line 108
    sub-int/2addr v8, v7

    .line 109
    rem-int/lit16 v8, v8, 0x80

    .line 110
    .line 111
    sput v8, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 112
    .line 113
    const/4 v7, 0x0

    .line 114
    move v8, v7

    .line 115
    :goto_0
    const/16 v9, 0xa

    .line 116
    .line 117
    const/16 v10, 0x10c

    .line 118
    .line 119
    const/16 v11, 0x39

    .line 120
    .line 121
    if-gtz v8, :cond_0

    .line 122
    .line 123
    :try_start_1
    aget-object v12, p0, v7

    .line 124
    .line 125
    new-instance v13, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    sget-object v12, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 134
    .line 135
    const/16 v14, 0x17c

    .line 136
    .line 137
    aget-byte v14, v12, v14
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    .line 138
    .line 139
    int-to-byte v14, v14

    .line 140
    const/16 v15, 0x6e

    .line 141
    .line 142
    move/from16 v16, v1

    .line 143
    .line 144
    const/16 v1, 0x16f

    .line 145
    .line 146
    :try_start_2
    invoke-static {v1, v14, v15}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    aget-byte v11, v12, v11

    .line 158
    .line 159
    int-to-byte v11, v11

    .line 160
    aget-byte v9, v12, v9

    .line 161
    .line 162
    int-to-byte v9, v9

    .line 163
    invoke-static {v10, v11, v9}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v9

    .line 167
    invoke-virtual {v1, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v5, v1}, Ljava/io/OutputStream;->write([B)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 175
    .line 176
    .line 177
    or-int/lit8 v1, v8, 0x1

    .line 178
    .line 179
    shl-int/lit8 v1, v1, 0x1

    .line 180
    .line 181
    xor-int/lit8 v8, v8, 0x1

    .line 182
    .line 183
    sub-int v8, v1, v8

    .line 184
    .line 185
    move/from16 v1, v16

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :catch_0
    move-exception v0

    .line 189
    goto/16 :goto_4

    .line 190
    .line 191
    :catch_1
    move-exception v0

    .line 192
    move/from16 v16, v1

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_0
    move/from16 v16, v1

    .line 196
    .line 197
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 198
    .line 199
    aget-byte v8, v1, v11

    .line 200
    .line 201
    int-to-byte v8, v8

    .line 202
    aget-byte v6, v1, v6

    .line 203
    .line 204
    int-to-byte v6, v6

    .line 205
    const/16 v12, 0x108

    .line 206
    .line 207
    invoke-static {v12, v8, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    aget-byte v8, v1, v11

    .line 212
    .line 213
    int-to-byte v8, v8

    .line 214
    aget-byte v1, v1, v9

    .line 215
    .line 216
    int-to-byte v1, v1

    .line 217
    invoke-static {v10, v8, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-virtual {v6, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v5, v1}, Ljava/io/OutputStream;->write([B)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V
    :try_end_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6

    .line 229
    .line 230
    .line 231
    :try_start_3
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 232
    .line 233
    .line 234
    :try_start_4
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 235
    .line 236
    .line 237
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 238
    .line 239
    or-int/lit8 v5, v1, 0x4f

    .line 240
    .line 241
    shl-int/lit8 v5, v5, 0x1

    .line 242
    .line 243
    xor-int/lit8 v1, v1, 0x4f

    .line 244
    .line 245
    sub-int/2addr v5, v1

    .line 246
    rem-int/lit16 v5, v5, 0x80

    .line 247
    .line 248
    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 249
    .line 250
    goto :goto_1

    .line 251
    :catchall_0
    move-exception v0

    .line 252
    goto :goto_2

    .line 253
    :catch_2
    move-exception v0

    .line 254
    goto :goto_3

    .line 255
    :catch_3
    :goto_1
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v4}, Ljava/lang/Thread;->join()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 259
    .line 260
    .line 261
    :try_start_6
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 262
    .line 263
    .line 264
    :catch_4
    :try_start_7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˎ()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/If;->ˎ()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0
    :try_end_7
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 287
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 288
    .line 289
    add-int/lit8 v1, v1, 0x47

    .line 290
    .line 291
    rem-int/lit16 v2, v1, 0x80

    .line 292
    .line 293
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 294
    .line 295
    rem-int/lit8 v1, v1, 0x2

    .line 296
    .line 297
    if-nez v1, :cond_1

    .line 298
    .line 299
    const/4 v1, 0x6

    .line 300
    div-int/2addr v1, v7

    .line 301
    :cond_1
    return-object v0

    .line 302
    :goto_2
    :try_start_8
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 303
    .line 304
    .line 305
    :catch_5
    :try_start_9
    throw v0

    .line 306
    :goto_3
    throw v0
    :try_end_9
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    .line 307
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    check-cast v0, Ljava/lang/Exception;

    .line 312
    .line 313
    instance-of v1, v0, Ljava/lang/NullPointerException;

    .line 314
    .line 315
    if-nez v1, :cond_4

    .line 316
    .line 317
    instance-of v1, v0, Ljava/lang/IllegalArgumentException;

    .line 318
    .line 319
    if-nez v1, :cond_4

    .line 320
    .line 321
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 322
    .line 323
    and-int/lit8 v3, v1, 0xf

    .line 324
    .line 325
    or-int/lit8 v1, v1, 0xf

    .line 326
    .line 327
    add-int/2addr v3, v1

    .line 328
    rem-int/lit16 v1, v3, 0x80

    .line 329
    .line 330
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 331
    .line 332
    rem-int/lit8 v3, v3, 0x2

    .line 333
    .line 334
    if-nez v3, :cond_3

    .line 335
    .line 336
    instance-of v3, v0, Ljava/lang/SecurityException;

    .line 337
    .line 338
    if-nez v3, :cond_4

    .line 339
    .line 340
    instance-of v3, v0, Ljava/io/IOException;

    .line 341
    .line 342
    if-nez v3, :cond_2

    .line 343
    .line 344
    :catch_6
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ʽ:[B

    .line 345
    .line 346
    const/16 v1, 0x17

    .line 347
    .line 348
    aget-byte v1, v0, v1

    .line 349
    .line 350
    neg-int v1, v1

    .line 351
    int-to-short v1, v1

    .line 352
    const/16 v3, 0x215

    .line 353
    .line 354
    aget-byte v3, v0, v3

    .line 355
    .line 356
    int-to-byte v3, v3

    .line 357
    const/16 v4, 0x87

    .line 358
    .line 359
    aget-byte v0, v0, v4

    .line 360
    .line 361
    int-to-byte v0, v0

    .line 362
    invoke-static {v1, v3, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(SBB)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    return-object v2

    .line 370
    :cond_2
    xor-int/lit8 v2, v1, 0x1d

    .line 371
    .line 372
    and-int/lit8 v1, v1, 0x1d

    .line 373
    .line 374
    shl-int/lit8 v1, v1, 0x1

    .line 375
    .line 376
    add-int/2addr v2, v1

    .line 377
    rem-int/lit16 v2, v2, 0x80

    .line 378
    .line 379
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 380
    .line 381
    check-cast v0, Ljava/io/IOException;

    .line 382
    .line 383
    throw v0

    .line 384
    :cond_3
    throw v2

    .line 385
    :cond_4
    check-cast v0, Ljava/lang/RuntimeException;

    .line 386
    .line 387
    throw v0
.end method

.method public static ॱ(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x9

    .line 4
    .line 5
    or-int/lit8 v2, v0, 0x9

    .line 6
    .line 7
    add-int/2addr v1, v2

    .line 8
    rem-int/lit16 v1, v1, 0x80

    .line 9
    .line 10
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 11
    .line 12
    instance-of v1, p1, Ljava/lang/Class;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    check-cast v1, Ljava/lang/Class;

    .line 18
    .line 19
    and-int/lit8 v2, v0, 0x77

    .line 20
    .line 21
    or-int/lit8 v0, v0, 0x77

    .line 22
    .line 23
    add-int/2addr v2, v0

    .line 24
    rem-int/lit16 v2, v2, 0x80

    .line 25
    .line 26
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    :goto_0
    if-nez p2, :cond_2

    .line 34
    .line 35
    sget p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 36
    .line 37
    add-int/lit8 p2, p2, 0x79

    .line 38
    .line 39
    rem-int/lit16 v0, p2, 0x80

    .line 40
    .line 41
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 42
    .line 43
    rem-int/lit8 p2, p2, 0x2

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    new-array p2, v2, [Ljava/lang/Class;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const/4 p2, 0x0

    .line 52
    new-array p2, p2, [Ljava/lang/Class;

    .line 53
    .line 54
    :goto_1
    xor-int/lit8 v3, v0, 0x2f

    .line 55
    .line 56
    and-int/lit8 v0, v0, 0x2f

    .line 57
    .line 58
    shl-int/2addr v0, v2

    .line 59
    add-int/2addr v3, v0

    .line 60
    rem-int/lit16 v3, v3, 0x80

    .line 61
    .line 62
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 66
    .line 67
    add-int/lit8 v0, v0, 0x59

    .line 68
    .line 69
    rem-int/lit16 v0, v0, 0x80

    .line 70
    .line 71
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 72
    .line 73
    :goto_2
    invoke-virtual {v1, p0, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    :try_start_0
    invoke-static {p0, p1, p3, p4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˊ(Ljava/lang/reflect/Member;Ljava/lang/Object;[Ljava/lang/Object;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ॱॱ:I

    .line 82
    .line 83
    add-int/lit8 p1, p1, 0x2b

    .line 84
    .line 85
    rem-int/lit16 p1, p1, 0x80

    .line 86
    .line 87
    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋॱ:I

    .line 88
    .line 89
    return-object p0

    .line 90
    :catch_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 91
    .line 92
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 93
    .line 94
    .line 95
    const/4 p0, 0x0

    .line 96
    return-object p0
.end method
