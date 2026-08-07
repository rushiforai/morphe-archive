.class public Ll/re5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final f:Ljava/lang/String;

.field private static final g:Ljava/lang/String;


# instance fields
.field a:Ll/vmw;

.field b:Landroid/content/Context;

.field private final c:Ll/ag60;

.field private d:Ll/bqe0;

.field private e:Lcom/immomo/utils/sensors/MotionDetector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/re5;->f:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    fill-array-data v0, :array_1

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Ll/re5;->g:Ljava/lang/String;

    .line 25
    .line 26
    return-void

    .line 27
    :array_0
    .array-data 1
        0x55t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x6ft
        0x3t
        0x43t
        0x45t
        0xet
        0x14t
    .end array-data

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    :array_1
    .array-data 1
        0x6t
        0x50t
        0x7t
        0x1t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Ll/vmw;Ll/ag60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/re5;->a:Ll/vmw;

    .line 5
    .line 6
    iput-object p1, p0, Ll/re5;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/re5;->c:Ll/ag60;

    .line 9
    .line 10
    return-void
.end method

.method private static d(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    nop

    .line 17
    :array_0
    .array-data 1
        0x5ct
        0x7t
        0x44t
        0x59t
        0x2t
        0xet
    .end array-data
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/re5;->b:Landroid/content/Context;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p0, v1}, Ll/ul20;->g(Landroid/content/Context;Z)Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ll/vmw;->m(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 4
    .line 5
    iget-object v2, p0, Ll/re5;->c:Ll/ag60;

    .line 6
    .line 7
    iget-wide v2, v2, Ll/ag60;->l:J

    .line 8
    .line 9
    invoke-virtual {v1, v2, v3}, Ll/vmw;->j0(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-virtual {v1, v2, v3}, Ll/vmw;->j0(J)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {p1}, Ll/re5;->d(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    :try_start_1
    new-instance v1, Ll/bqe0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/bqe0;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/re5;->d:Ll/bqe0;

    .line 34
    .line 35
    iget-object v2, p0, Ll/re5;->b:Landroid/content/Context;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/bqe0;->z(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    new-instance v1, Lcom/immomo/utils/sensors/MotionDetector;

    .line 41
    .line 42
    iget-object v2, p0, Ll/re5;->b:Landroid/content/Context;

    .line 43
    .line 44
    invoke-direct {v1, v2}, Lcom/immomo/utils/sensors/MotionDetector;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Ll/re5;->e:Lcom/immomo/utils/sensors/MotionDetector;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/immomo/utils/sensors/MotionDetector;->q()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 50
    .line 51
    .line 52
    :catch_1
    :cond_0
    :try_start_2
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 53
    .line 54
    invoke-static {}, Ll/g6g0;->a()Lorg/json/JSONObject;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ll/vmw;->k0(Lorg/json/JSONObject;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 59
    .line 60
    .line 61
    :catch_2
    :try_start_3
    iget-object v1, p0, Ll/re5;->b:Landroid/content/Context;

    .line 62
    .line 63
    invoke-static {v1}, Ll/o0e;->G(Landroid/content/Context;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 68
    .line 69
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v2, v1}, Ll/vmw;->b(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :catch_3
    move-exception v1

    .line 78
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v2, v1}, Ll/vmw;->b(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :goto_1
    :try_start_4
    iget-object v1, p0, Ll/re5;->b:Landroid/content/Context;

    .line 88
    .line 89
    invoke-static {v1}, Ll/o0e;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 94
    .line 95
    invoke-virtual {v2, v1}, Ll/vmw;->c(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :catch_4
    move-exception v1

    .line 100
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v2, v1}, Ll/vmw;->c(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :goto_2
    :try_start_5
    invoke-static {}, Ll/xgl;->f()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 114
    .line 115
    invoke-virtual {v2, v1}, Ll/vmw;->a0(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :catch_5
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 120
    .line 121
    sget-object v2, Ll/re5;->f:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Ll/vmw;->a0(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_3
    :try_start_6
    invoke-static {}, Ll/xgl;->c()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 131
    .line 132
    invoke-virtual {v2, v1}, Ll/vmw;->Q(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 133
    .line 134
    .line 135
    goto :goto_4

    .line 136
    :catch_6
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 137
    .line 138
    sget-object v2, Ll/re5;->f:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Ll/vmw;->Q(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :goto_4
    :try_start_7
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 144
    .line 145
    iget-object v2, p0, Ll/re5;->b:Landroid/content/Context;

    .line 146
    .line 147
    invoke-static {v2}, Ll/o0e;->s(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v1, v2}, Ll/vmw;->E(Lorg/json/JSONObject;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 152
    .line 153
    .line 154
    :catch_7
    :try_start_8
    iget-object v1, p0, Ll/re5;->b:Landroid/content/Context;

    .line 155
    .line 156
    invoke-static {v1}, Ll/xgl;->b(Landroid/content/Context;)I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    iget-object v2, p0, Ll/re5;->a:Ll/vmw;

    .line 161
    .line 162
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v2, v1}, Ll/vmw;->n(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    .line 167
    .line 168
    .line 169
    goto :goto_5

    .line 170
    :catch_8
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 171
    .line 172
    sget-object v2, Ll/re5;->f:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v1, v2}, Ll/vmw;->n(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :goto_5
    const/4 v1, -0x1

    .line 178
    const/4 v2, 0x1

    .line 179
    const/4 v3, 0x0

    .line 180
    :try_start_9
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 181
    .line 182
    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    const/16 v5, 0xb

    .line 187
    .line 188
    new-array v5, v5, [B

    .line 189
    .line 190
    fill-array-data v5, :array_0

    .line 191
    .line 192
    .line 193
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-static {v4, v5}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v4
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    .line 201
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 202
    .line 203
    if-lez v4, :cond_1

    .line 204
    .line 205
    :try_start_a
    invoke-virtual {v5, v2}, Ll/vmw;->d(I)V

    .line 206
    .line 207
    .line 208
    goto :goto_6

    .line 209
    :cond_1
    invoke-virtual {v5, v3}, Ll/vmw;->d(I)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    .line 210
    .line 211
    .line 212
    goto :goto_6

    .line 213
    :catch_9
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 214
    .line 215
    invoke-virtual {v4, v1}, Ll/vmw;->d(I)V

    .line 216
    .line 217
    .line 218
    :goto_6
    :try_start_b
    invoke-static {}, Ll/o0e;->C()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 223
    .line 224
    invoke-virtual {v5, v4}, Ll/vmw;->d0(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_a

    .line 225
    .line 226
    .line 227
    :catch_a
    :try_start_c
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 228
    .line 229
    iget-object v5, p0, Ll/re5;->c:Ll/ag60;

    .line 230
    .line 231
    iget-object v5, v5, Ll/ag60;->f:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v4, v5}, Ll/vmw;->k(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_b

    .line 234
    .line 235
    .line 236
    goto :goto_7

    .line 237
    :catch_b
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 238
    .line 239
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v4, v5}, Ll/vmw;->k(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :goto_7
    :try_start_d
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    iget-object v5, p0, Ll/re5;->c:Ll/ag60;

    .line 249
    .line 250
    iget-object v5, v5, Ll/ag60;->h:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {v4, v5}, Ll/o0e;->z(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 257
    .line 258
    invoke-virtual {v5, v4}, Ll/vmw;->R(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_c

    .line 259
    .line 260
    .line 261
    goto :goto_8

    .line 262
    :catch_c
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 263
    .line 264
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v4, v5}, Ll/vmw;->R(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    :goto_8
    :try_start_e
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 270
    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 274
    .line 275
    .line 276
    iget-object v6, p0, Ll/re5;->b:Landroid/content/Context;

    .line 277
    .line 278
    invoke-static {v6}, Ll/ul20;->e(Landroid/content/Context;)I

    .line 279
    .line 280
    .line 281
    move-result v6

    .line 282
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-virtual {v4, v5}, Ll/vmw;->U(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_d

    .line 293
    .line 294
    .line 295
    goto :goto_9

    .line 296
    :catch_d
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 297
    .line 298
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 299
    .line 300
    invoke-virtual {v4, v5}, Ll/vmw;->U(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :goto_9
    :try_start_f
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 304
    .line 305
    iget-object v5, p0, Ll/re5;->b:Landroid/content/Context;

    .line 306
    .line 307
    invoke-static {v5}, Ll/ul20;->f(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-virtual {v4, v5}, Ll/vmw;->V(Lorg/json/JSONObject;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_e

    .line 312
    .line 313
    .line 314
    :catch_e
    :try_start_10
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 315
    .line 316
    invoke-static {v4}, Ll/ul20;->j(Landroid/content/Context;)Z

    .line 317
    .line 318
    .line 319
    move-result v4
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_f

    .line 320
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 321
    .line 322
    if-eqz v4, :cond_2

    .line 323
    .line 324
    :try_start_11
    invoke-virtual {v5, v2}, Ll/vmw;->b0(I)V

    .line 325
    .line 326
    .line 327
    goto :goto_a

    .line 328
    :cond_2
    invoke-virtual {v5, v3}, Ll/vmw;->b0(I)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_f

    .line 329
    .line 330
    .line 331
    :catch_f
    :goto_a
    :try_start_12
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 332
    .line 333
    invoke-static {}, Ll/o0e;->A()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v5

    .line 337
    invoke-virtual {v4, v5}, Ll/vmw;->n0(Ljava/lang/String;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_10

    .line 338
    .line 339
    .line 340
    :catch_10
    :try_start_13
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    iget-object v5, p0, Ll/re5;->b:Landroid/content/Context;

    .line 345
    .line 346
    invoke-static {v4, v5}, Ll/xgl;->e(Ljava/lang/ClassLoader;Landroid/content/Context;)I

    .line 347
    .line 348
    .line 349
    move-result v4
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_11

    .line 350
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 351
    .line 352
    if-ne v4, v2, :cond_3

    .line 353
    .line 354
    :try_start_14
    invoke-virtual {v5, v4}, Ll/vmw;->z(I)V

    .line 355
    .line 356
    .line 357
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 358
    .line 359
    invoke-static {}, Ll/xgl;->g()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v5

    .line 363
    invoke-virtual {v4, v5}, Ll/vmw;->A(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    goto :goto_b

    .line 367
    :cond_3
    invoke-virtual {v5, v3}, Ll/vmw;->z(I)V

    .line 368
    .line 369
    .line 370
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 371
    .line 372
    sget-object v5, Ll/re5;->g:Ljava/lang/String;

    .line 373
    .line 374
    invoke-virtual {v4, v5}, Ll/vmw;->A(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_11

    .line 375
    .line 376
    .line 377
    :catch_11
    :goto_b
    :try_start_15
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 378
    .line 379
    invoke-static {}, Ll/o0e;->B()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v5

    .line 383
    invoke-virtual {v4, v5}, Ll/vmw;->T(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_12

    .line 384
    .line 385
    .line 386
    :catch_12
    :try_start_16
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 387
    .line 388
    invoke-static {v4}, Ll/yxm;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v4

    .line 392
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 393
    .line 394
    .line 395
    move-result v5
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_13

    .line 396
    iget-object v6, p0, Ll/re5;->a:Ll/vmw;

    .line 397
    .line 398
    if-eqz v5, :cond_4

    .line 399
    .line 400
    :try_start_17
    invoke-virtual {v6, v0}, Ll/vmw;->F(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 404
    .line 405
    sget-object v5, Ll/yxm;->e:Ljava/lang/String;

    .line 406
    .line 407
    invoke-virtual {v4, v5}, Ll/vmw;->G(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    goto :goto_c

    .line 411
    :cond_4
    invoke-virtual {v6, v4}, Ll/vmw;->F(Ljava/lang/String;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_13

    .line 412
    .line 413
    .line 414
    :catch_13
    :goto_c
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 415
    .line 416
    invoke-static {v4}, Ll/yxm;->a(Landroid/content/Context;)Ljava/lang/Long;

    .line 417
    .line 418
    .line 419
    move-result-object v4

    .line 420
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 421
    .line 422
    .line 423
    move-result-wide v5

    .line 424
    const-wide/16 v7, -0x1

    .line 425
    .line 426
    cmp-long v5, v5, v7

    .line 427
    .line 428
    iget-object v6, p0, Ll/re5;->a:Ll/vmw;

    .line 429
    .line 430
    if-nez v5, :cond_5

    .line 431
    .line 432
    invoke-virtual {v6, v7, v8}, Ll/vmw;->v(J)V

    .line 433
    .line 434
    .line 435
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 436
    .line 437
    sget-object v5, Ll/yxm;->e:Ljava/lang/String;

    .line 438
    .line 439
    invoke-virtual {v4, v5}, Ll/vmw;->w(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    goto :goto_d

    .line 443
    :cond_5
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 444
    .line 445
    .line 446
    move-result-wide v4

    .line 447
    invoke-virtual {v6, v4, v5}, Ll/vmw;->v(J)V

    .line 448
    .line 449
    .line 450
    :goto_d
    :try_start_18
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 451
    .line 452
    invoke-static {}, Ll/o0e;->j()Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v5

    .line 456
    invoke-virtual {v4, v5}, Ll/vmw;->i(Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_14

    .line 457
    .line 458
    .line 459
    :catch_14
    :try_start_19
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 460
    .line 461
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 462
    .line 463
    .line 464
    move-result-object v4

    .line 465
    iget-object v5, p0, Ll/re5;->b:Landroid/content/Context;

    .line 466
    .line 467
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v5

    .line 471
    invoke-virtual {v4, v5, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 472
    .line 473
    .line 474
    move-result-object v4

    .line 475
    iget v5, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 476
    .line 477
    iget-object v6, p0, Ll/re5;->a:Ll/vmw;

    .line 478
    .line 479
    invoke-virtual {v6, v5}, Ll/vmw;->o0(I)V

    .line 480
    .line 481
    .line 482
    iget-object v5, v4, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 483
    .line 484
    iget-object v6, p0, Ll/re5;->a:Ll/vmw;

    .line 485
    .line 486
    invoke-virtual {v6, v5}, Ll/vmw;->p0(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    iget-object v4, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 490
    .line 491
    iget v4, v4, Landroid/content/pm/ApplicationInfo;->labelRes:I

    .line 492
    .line 493
    iget-object v5, p0, Ll/re5;->b:Landroid/content/Context;

    .line 494
    .line 495
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 496
    .line 497
    .line 498
    move-result-object v5

    .line 499
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v4

    .line 503
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 504
    .line 505
    invoke-virtual {v5, v4}, Ll/vmw;->f(Ljava/lang/String;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_15

    .line 506
    .line 507
    .line 508
    :catch_15
    :try_start_1a
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 509
    .line 510
    iget-object v5, p0, Ll/re5;->b:Landroid/content/Context;

    .line 511
    .line 512
    invoke-static {v5}, Ll/o0e;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v5

    .line 516
    invoke-virtual {v4, v5}, Ll/vmw;->o(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_16

    .line 517
    .line 518
    .line 519
    :catch_16
    :try_start_1b
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 520
    .line 521
    invoke-static {}, Ll/o0e;->o()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v5

    .line 525
    invoke-virtual {v4, v5}, Ll/vmw;->t(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_17

    .line 526
    .line 527
    .line 528
    goto :goto_e

    .line 529
    :catch_17
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 530
    .line 531
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 532
    .line 533
    invoke-virtual {v4, v5}, Ll/vmw;->t(Ljava/lang/String;)V

    .line 534
    .line 535
    .line 536
    :goto_e
    :try_start_1c
    new-instance v4, Lcom/immomo/utils/sensors/SensorInfo;

    .line 537
    .line 538
    iget-object v5, p0, Ll/re5;->b:Landroid/content/Context;

    .line 539
    .line 540
    invoke-direct {v4, v5}, Lcom/immomo/utils/sensors/SensorInfo;-><init>(Landroid/content/Context;)V

    .line 541
    .line 542
    .line 543
    invoke-virtual {v4}, Lcom/immomo/utils/sensors/SensorInfo;->e()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v5

    .line 547
    invoke-virtual {v4}, Lcom/immomo/utils/sensors/SensorInfo;->h()I

    .line 548
    .line 549
    .line 550
    move-result v6

    .line 551
    const/4 v9, 0x4

    .line 552
    new-array v9, v9, [B

    .line 553
    .line 554
    fill-array-data v9, :array_1

    .line 555
    .line 556
    .line 557
    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v9

    .line 561
    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 562
    .line 563
    .line 564
    move-result v9
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_18

    .line 565
    iget-object v10, p0, Ll/re5;->a:Ll/vmw;

    .line 566
    .line 567
    if-nez v9, :cond_6

    .line 568
    .line 569
    :try_start_1d
    invoke-virtual {v10, v5}, Ll/vmw;->y(Ljava/lang/String;)V

    .line 570
    .line 571
    .line 572
    goto :goto_f

    .line 573
    :cond_6
    sget-object v5, Ll/re5;->g:Ljava/lang/String;

    .line 574
    .line 575
    invoke-virtual {v10, v5}, Ll/vmw;->y(Ljava/lang/String;)V

    .line 576
    .line 577
    .line 578
    :goto_f
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 579
    .line 580
    invoke-virtual {v5, v6}, Ll/vmw;->J(I)V

    .line 581
    .line 582
    .line 583
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 584
    .line 585
    invoke-virtual {v4}, Lcom/immomo/utils/sensors/SensorInfo;->f()Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v4

    .line 589
    invoke-virtual {v5, v4}, Ll/vmw;->f0(Ljava/lang/String;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_18

    .line 590
    .line 591
    .line 592
    :catch_18
    :try_start_1e
    invoke-static {}, Ll/o0e;->J()I

    .line 593
    .line 594
    .line 595
    move-result v4

    .line 596
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 597
    .line 598
    new-instance v6, Ljava/lang/StringBuilder;

    .line 599
    .line 600
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 601
    .line 602
    .line 603
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v4

    .line 613
    invoke-virtual {v5, v4}, Ll/vmw;->r0(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_19

    .line 614
    .line 615
    .line 616
    goto :goto_10

    .line 617
    :catch_19
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 618
    .line 619
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 620
    .line 621
    invoke-virtual {v4, v5}, Ll/vmw;->r0(Ljava/lang/String;)V

    .line 622
    .line 623
    .line 624
    :goto_10
    :try_start_1f
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 625
    .line 626
    .line 627
    move-result-object v4

    .line 628
    invoke-static {v4}, Ll/o0e;->e(Landroid/content/Context;)I

    .line 629
    .line 630
    .line 631
    move-result v4

    .line 632
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 633
    .line 634
    new-instance v6, Ljava/lang/StringBuilder;

    .line 635
    .line 636
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 637
    .line 638
    .line 639
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 640
    .line 641
    .line 642
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    .line 644
    .line 645
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v4

    .line 649
    invoke-virtual {v5, v4}, Ll/vmw;->s0(Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_1a

    .line 650
    .line 651
    .line 652
    goto :goto_11

    .line 653
    :catch_1a
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 654
    .line 655
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 656
    .line 657
    invoke-virtual {v4, v5}, Ll/vmw;->s0(Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    :goto_11
    :try_start_20
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 661
    .line 662
    .line 663
    move-result-object v4

    .line 664
    invoke-static {v4}, Ll/o0e;->I(Landroid/content/Context;)I

    .line 665
    .line 666
    .line 667
    move-result v4

    .line 668
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 669
    .line 670
    invoke-virtual {v5, v4}, Ll/vmw;->r(I)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_1b

    .line 671
    .line 672
    .line 673
    goto :goto_12

    .line 674
    :catch_1b
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 675
    .line 676
    invoke-virtual {v4, v1}, Ll/vmw;->r(I)V

    .line 677
    .line 678
    .line 679
    :goto_12
    :try_start_21
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 680
    .line 681
    .line 682
    move-result-object v4

    .line 683
    invoke-static {v4}, Ll/o0e;->H(Landroid/content/Context;)Ljava/lang/String;

    .line 684
    .line 685
    .line 686
    move-result-object v4

    .line 687
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 688
    .line 689
    invoke-virtual {v5, v4}, Ll/vmw;->I(Ljava/lang/String;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_1c

    .line 690
    .line 691
    .line 692
    goto :goto_13

    .line 693
    :catch_1c
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 694
    .line 695
    sget-object v5, Ll/re5;->f:Ljava/lang/String;

    .line 696
    .line 697
    invoke-virtual {v4, v5}, Ll/vmw;->I(Ljava/lang/String;)V

    .line 698
    .line 699
    .line 700
    :goto_13
    :try_start_22
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 701
    .line 702
    invoke-static {v4}, Ll/o0e;->F(Landroid/content/Context;)I

    .line 703
    .line 704
    .line 705
    move-result v4

    .line 706
    iget-object v5, p0, Ll/re5;->a:Ll/vmw;

    .line 707
    .line 708
    new-instance v6, Ljava/lang/StringBuilder;

    .line 709
    .line 710
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 711
    .line 712
    .line 713
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 714
    .line 715
    .line 716
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 717
    .line 718
    .line 719
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object v0

    .line 723
    invoke-virtual {v5, v0}, Ll/vmw;->i0(Ljava/lang/String;)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_1d

    .line 724
    .line 725
    .line 726
    goto :goto_14

    .line 727
    :catch_1d
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 728
    .line 729
    sget-object v4, Ll/re5;->f:Ljava/lang/String;

    .line 730
    .line 731
    invoke-virtual {v0, v4}, Ll/vmw;->i0(Ljava/lang/String;)V

    .line 732
    .line 733
    .line 734
    :goto_14
    :try_start_23
    iget-object v0, p0, Ll/re5;->b:Landroid/content/Context;

    .line 735
    .line 736
    invoke-static {v0}, Ll/o0e;->E(Landroid/content/Context;)Ljava/lang/String;

    .line 737
    .line 738
    .line 739
    move-result-object v0

    .line 740
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 741
    .line 742
    invoke-virtual {v4, v0}, Ll/vmw;->q0(Ljava/lang/String;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_1e

    .line 743
    .line 744
    .line 745
    goto :goto_15

    .line 746
    :catch_1e
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 747
    .line 748
    sget-object v4, Ll/re5;->f:Ljava/lang/String;

    .line 749
    .line 750
    invoke-virtual {v0, v4}, Ll/vmw;->q0(Ljava/lang/String;)V

    .line 751
    .line 752
    .line 753
    :goto_15
    :try_start_24
    iget-object v0, p0, Ll/re5;->b:Landroid/content/Context;

    .line 754
    .line 755
    invoke-static {v0}, Ll/o0e;->p(Landroid/content/Context;)Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v0

    .line 759
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 760
    .line 761
    invoke-virtual {v4, v0}, Ll/vmw;->B(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_1f

    .line 762
    .line 763
    .line 764
    goto :goto_16

    .line 765
    :catch_1f
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 766
    .line 767
    sget-object v4, Ll/re5;->f:Ljava/lang/String;

    .line 768
    .line 769
    invoke-virtual {v0, v4}, Ll/vmw;->B(Ljava/lang/String;)V

    .line 770
    .line 771
    .line 772
    :goto_16
    :try_start_25
    iget-object v0, p0, Ll/re5;->b:Landroid/content/Context;

    .line 773
    .line 774
    invoke-static {v0}, Ll/o0e;->q(Landroid/content/Context;)Ljava/lang/String;

    .line 775
    .line 776
    .line 777
    move-result-object v0

    .line 778
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 779
    .line 780
    invoke-virtual {v4, v0}, Ll/vmw;->C(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_20

    .line 781
    .line 782
    .line 783
    goto :goto_17

    .line 784
    :catch_20
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 785
    .line 786
    sget-object v4, Ll/re5;->f:Ljava/lang/String;

    .line 787
    .line 788
    invoke-virtual {v0, v4}, Ll/vmw;->C(Ljava/lang/String;)V

    .line 789
    .line 790
    .line 791
    :goto_17
    :try_start_26
    iget-object v0, p0, Ll/re5;->c:Ll/ag60;

    .line 792
    .line 793
    iget-object v0, v0, Ll/ag60;->k:Ljava/lang/String;

    .line 794
    .line 795
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 796
    .line 797
    .line 798
    move-result v0

    .line 799
    if-eqz v0, :cond_7

    .line 800
    .line 801
    iget-object v0, p0, Ll/re5;->b:Landroid/content/Context;

    .line 802
    .line 803
    invoke-static {v0}, Ll/o0e;->h(Landroid/content/Context;)Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object v0

    .line 807
    goto :goto_18

    .line 808
    :cond_7
    iget-object v0, p0, Ll/re5;->c:Ll/ag60;

    .line 809
    .line 810
    iget-object v0, v0, Ll/ag60;->k:Ljava/lang/String;

    .line 811
    .line 812
    :goto_18
    iget-object v4, p0, Ll/re5;->a:Ll/vmw;

    .line 813
    .line 814
    invoke-virtual {v4, v0}, Ll/vmw;->e(Ljava/lang/String;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_21

    .line 815
    .line 816
    .line 817
    goto :goto_19

    .line 818
    :catch_21
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 819
    .line 820
    sget-object v4, Ll/re5;->f:Ljava/lang/String;

    .line 821
    .line 822
    invoke-virtual {v0, v4}, Ll/vmw;->e(Ljava/lang/String;)V

    .line 823
    .line 824
    .line 825
    :goto_19
    :try_start_27
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 826
    .line 827
    invoke-static {}, Ll/o0e;->D()Lorg/json/JSONObject;

    .line 828
    .line 829
    .line 830
    move-result-object v4

    .line 831
    invoke-virtual {v0, v4}, Ll/vmw;->Y(Lorg/json/JSONObject;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_22

    .line 832
    .line 833
    .line 834
    goto :goto_1a

    .line 835
    :catch_22
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 836
    .line 837
    new-instance v4, Lorg/json/JSONObject;

    .line 838
    .line 839
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 840
    .line 841
    .line 842
    invoke-virtual {v0, v4}, Ll/vmw;->Y(Lorg/json/JSONObject;)V

    .line 843
    .line 844
    .line 845
    :goto_1a
    :try_start_28
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 846
    .line 847
    invoke-static {}, Ll/o0e;->u()Lorg/json/JSONObject;

    .line 848
    .line 849
    .line 850
    move-result-object v4

    .line 851
    invoke-virtual {v0, v4}, Ll/vmw;->K(Lorg/json/JSONObject;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_23

    .line 852
    .line 853
    .line 854
    goto :goto_1b

    .line 855
    :catch_23
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 856
    .line 857
    new-instance v4, Lorg/json/JSONObject;

    .line 858
    .line 859
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 860
    .line 861
    .line 862
    invoke-virtual {v0, v4}, Ll/vmw;->K(Lorg/json/JSONObject;)V

    .line 863
    .line 864
    .line 865
    :goto_1b
    :try_start_29
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 866
    .line 867
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 868
    .line 869
    .line 870
    move-result-wide v4

    .line 871
    invoke-virtual {v0, v4, v5}, Ll/vmw;->u(J)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_24

    .line 872
    .line 873
    .line 874
    goto :goto_1c

    .line 875
    :catch_24
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 876
    .line 877
    invoke-virtual {v0, v7, v8}, Ll/vmw;->u(J)V

    .line 878
    .line 879
    .line 880
    :goto_1c
    :try_start_2a
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 881
    .line 882
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 883
    .line 884
    invoke-static {v4}, Ll/tmf0;->a(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 885
    .line 886
    .line 887
    move-result-object v4

    .line 888
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 889
    .line 890
    .line 891
    move-result-object v4

    .line 892
    invoke-virtual {v0, v4}, Ll/vmw;->g0(Ljava/lang/String;)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_25

    .line 893
    .line 894
    .line 895
    goto :goto_1d

    .line 896
    :catch_25
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 897
    .line 898
    sget-object v4, Ll/re5;->f:Ljava/lang/String;

    .line 899
    .line 900
    invoke-virtual {v0, v4}, Ll/vmw;->g0(Ljava/lang/String;)V

    .line 901
    .line 902
    .line 903
    :goto_1d
    :try_start_2b
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 904
    .line 905
    invoke-static {}, Ll/eiw;->a()Landroid/content/Context;

    .line 906
    .line 907
    .line 908
    move-result-object v4

    .line 909
    invoke-static {v4}, Ll/o0e;->c(Landroid/content/Context;)Ljava/util/List;

    .line 910
    .line 911
    .line 912
    move-result-object v4

    .line 913
    invoke-virtual {v0, v4}, Ll/vmw;->m0(Ljava/util/List;)V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_26

    .line 914
    .line 915
    .line 916
    goto :goto_1e

    .line 917
    :catch_26
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 918
    .line 919
    new-instance v4, Ljava/util/ArrayList;

    .line 920
    .line 921
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 922
    .line 923
    .line 924
    invoke-virtual {v0, v4}, Ll/vmw;->m0(Ljava/util/List;)V

    .line 925
    .line 926
    .line 927
    :goto_1e
    :try_start_2c
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 928
    .line 929
    invoke-static {}, Ll/o0e;->k()J

    .line 930
    .line 931
    .line 932
    move-result-wide v4

    .line 933
    invoke-virtual {v0, v4, v5}, Ll/vmw;->j(J)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_27

    .line 934
    .line 935
    .line 936
    goto :goto_1f

    .line 937
    :catch_27
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 938
    .line 939
    invoke-virtual {v0, v7, v8}, Ll/vmw;->j(J)V

    .line 940
    .line 941
    .line 942
    :goto_1f
    :try_start_2d
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 943
    .line 944
    iget-object v4, p0, Ll/re5;->b:Landroid/content/Context;

    .line 945
    .line 946
    invoke-static {v4}, Ll/sd1;->c(Landroid/content/Context;)Ll/sd1;

    .line 947
    .line 948
    .line 949
    move-result-object v4

    .line 950
    invoke-virtual {v4}, Ll/sd1;->b()Lorg/json/JSONObject;

    .line 951
    .line 952
    .line 953
    move-result-object v4

    .line 954
    invoke-virtual {v0, v4}, Ll/vmw;->g(Lorg/json/JSONObject;)V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_2d} :catch_28

    .line 955
    .line 956
    .line 957
    goto :goto_20

    .line 958
    :catch_28
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 959
    .line 960
    new-instance v4, Lorg/json/JSONObject;

    .line 961
    .line 962
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 963
    .line 964
    .line 965
    invoke-virtual {v0, v4}, Ll/vmw;->g(Lorg/json/JSONObject;)V

    .line 966
    .line 967
    .line 968
    :goto_20
    :try_start_2e
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 969
    .line 970
    invoke-static {}, Ll/o0e;->r()Ljava/util/List;

    .line 971
    .line 972
    .line 973
    move-result-object v4

    .line 974
    invoke-virtual {v0, v4}, Ll/vmw;->D(Ljava/util/List;)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_2e} :catch_29

    .line 975
    .line 976
    .line 977
    goto :goto_21

    .line 978
    :catch_29
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 979
    .line 980
    new-instance v4, Ljava/util/ArrayList;

    .line 981
    .line 982
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 983
    .line 984
    .line 985
    invoke-virtual {v0, v4}, Ll/vmw;->D(Ljava/util/List;)V

    .line 986
    .line 987
    .line 988
    :goto_21
    :try_start_2f
    sget-object v0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 989
    .line 990
    if-eqz v0, :cond_8

    .line 991
    .line 992
    sget-object v0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 993
    .line 994
    invoke-interface {v0}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 995
    .line 996
    .line 997
    move-result-object v0

    .line 998
    if-eqz v0, :cond_8

    .line 999
    .line 1000
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1001
    .line 1002
    invoke-virtual {v0, v2}, Ll/vmw;->M(I)V

    .line 1003
    .line 1004
    .line 1005
    goto :goto_22

    .line 1006
    :cond_8
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1007
    .line 1008
    invoke-virtual {v0, v3}, Ll/vmw;->M(I)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_2f} :catch_2a

    .line 1009
    .line 1010
    .line 1011
    goto :goto_22

    .line 1012
    :catch_2a
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1013
    .line 1014
    invoke-virtual {v0, v1}, Ll/vmw;->M(I)V

    .line 1015
    .line 1016
    .line 1017
    :goto_22
    :try_start_30
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1018
    .line 1019
    invoke-static {}, Ll/o0e;->f()Ljava/lang/String;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v2

    .line 1023
    invoke-virtual {v0, v2}, Ll/vmw;->c0(Ljava/lang/String;)V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_30} :catch_2b

    .line 1024
    .line 1025
    .line 1026
    goto :goto_23

    .line 1027
    :catch_2b
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1028
    .line 1029
    sget-object v2, Ll/re5;->f:Ljava/lang/String;

    .line 1030
    .line 1031
    invoke-virtual {v0, v2}, Ll/vmw;->c0(Ljava/lang/String;)V

    .line 1032
    .line 1033
    .line 1034
    :goto_23
    :try_start_31
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1035
    .line 1036
    iget-object v2, p0, Ll/re5;->b:Landroid/content/Context;

    .line 1037
    .line 1038
    invoke-static {v2}, Ll/o0e;->m(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 1039
    .line 1040
    .line 1041
    move-result-object v2

    .line 1042
    invoke-virtual {v0, v2}, Ll/vmw;->s(Lorg/json/JSONObject;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_31} :catch_2c

    .line 1043
    .line 1044
    .line 1045
    goto :goto_24

    .line 1046
    :catch_2c
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1047
    .line 1048
    new-instance v2, Lorg/json/JSONObject;

    .line 1049
    .line 1050
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1051
    .line 1052
    .line 1053
    invoke-virtual {v0, v2}, Ll/vmw;->s(Lorg/json/JSONObject;)V

    .line 1054
    .line 1055
    .line 1056
    :goto_24
    :try_start_32
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1057
    .line 1058
    invoke-static {}, Ll/o0e;->b()Ljava/util/List;

    .line 1059
    .line 1060
    .line 1061
    move-result-object v2

    .line 1062
    invoke-virtual {v0, v2}, Ll/vmw;->P(Ljava/util/List;)V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_32} :catch_2d

    .line 1063
    .line 1064
    .line 1065
    goto :goto_25

    .line 1066
    :catch_2d
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1067
    .line 1068
    new-instance v2, Ljava/util/ArrayList;

    .line 1069
    .line 1070
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1071
    .line 1072
    .line 1073
    invoke-virtual {v0, v2}, Ll/vmw;->P(Ljava/util/List;)V

    .line 1074
    .line 1075
    .line 1076
    :goto_25
    :try_start_33
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1077
    .line 1078
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 1079
    .line 1080
    .line 1081
    move-result-object v2

    .line 1082
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 1083
    .line 1084
    .line 1085
    move-result-object v2

    .line 1086
    invoke-virtual {v0, v2}, Ll/vmw;->X(Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_33} :catch_2e

    .line 1087
    .line 1088
    .line 1089
    goto :goto_26

    .line 1090
    :catch_2e
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1091
    .line 1092
    sget-object v2, Ll/re5;->f:Ljava/lang/String;

    .line 1093
    .line 1094
    invoke-virtual {v0, v2}, Ll/vmw;->X(Ljava/lang/String;)V

    .line 1095
    .line 1096
    .line 1097
    :goto_26
    :try_start_34
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1098
    .line 1099
    invoke-static {}, Ll/iyk;->a()Lorg/json/JSONObject;

    .line 1100
    .line 1101
    .line 1102
    move-result-object v2

    .line 1103
    invoke-virtual {v0, v2}, Ll/vmw;->x(Lorg/json/JSONObject;)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_34} :catch_2f

    .line 1104
    .line 1105
    .line 1106
    goto :goto_27

    .line 1107
    :catch_2f
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1108
    .line 1109
    new-instance v2, Lorg/json/JSONObject;

    .line 1110
    .line 1111
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1112
    .line 1113
    .line 1114
    invoke-virtual {v0, v2}, Ll/vmw;->x(Lorg/json/JSONObject;)V

    .line 1115
    .line 1116
    .line 1117
    :goto_27
    :try_start_35
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1118
    .line 1119
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 1120
    .line 1121
    .line 1122
    move-result-object v2

    .line 1123
    invoke-static {v2}, Ll/xe5;->d(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 1124
    .line 1125
    .line 1126
    move-result-object v2

    .line 1127
    invoke-virtual {v0, v2}, Ll/vmw;->l0(Lorg/json/JSONObject;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_35} :catch_30

    .line 1128
    .line 1129
    .line 1130
    goto :goto_28

    .line 1131
    :catch_30
    move-exception v0

    .line 1132
    new-instance v2, Lorg/json/JSONObject;

    .line 1133
    .line 1134
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1135
    .line 1136
    .line 1137
    const/16 v3, 0xa

    .line 1138
    .line 1139
    :try_start_36
    new-array v3, v3, [B

    .line 1140
    .line 1141
    fill-array-data v3, :array_2

    .line 1142
    .line 1143
    .line 1144
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v3

    .line 1148
    invoke-static {}, Ll/xiw;->b()Ljava/lang/String;

    .line 1149
    .line 1150
    .line 1151
    move-result-object v4

    .line 1152
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1153
    .line 1154
    .line 1155
    const/16 v3, 0x11

    .line 1156
    .line 1157
    new-array v3, v3, [B

    .line 1158
    .line 1159
    fill-array-data v3, :array_3

    .line 1160
    .line 1161
    .line 1162
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 1163
    .line 1164
    .line 1165
    move-result-object v3

    .line 1166
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1167
    .line 1168
    .line 1169
    move-result-object v0

    .line 1170
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_36
    .catch Lorg/json/JSONException; {:try_start_36 .. :try_end_36} :catch_31

    .line 1171
    .line 1172
    .line 1173
    :catch_31
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1174
    .line 1175
    invoke-virtual {v0, v2}, Ll/vmw;->l0(Lorg/json/JSONObject;)V

    .line 1176
    .line 1177
    .line 1178
    :goto_28
    invoke-static {p1}, Ll/re5;->d(Ljava/lang/String;)Z

    .line 1179
    .line 1180
    .line 1181
    move-result v0

    .line 1182
    if-eqz v0, :cond_9

    .line 1183
    .line 1184
    iget-object v0, p0, Ll/re5;->d:Ll/bqe0;

    .line 1185
    .line 1186
    if-eqz v0, :cond_9

    .line 1187
    .line 1188
    const-wide/16 v2, 0x7d0

    .line 1189
    .line 1190
    :try_start_37
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 1191
    .line 1192
    .line 1193
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1194
    .line 1195
    iget-object v2, p0, Ll/re5;->d:Ll/bqe0;

    .line 1196
    .line 1197
    invoke-virtual {v2}, Ll/bqe0;->w()Ljava/lang/String;

    .line 1198
    .line 1199
    .line 1200
    move-result-object v2

    .line 1201
    invoke-virtual {v0, v2}, Ll/vmw;->e0(Ljava/lang/String;)V

    .line 1202
    .line 1203
    .line 1204
    iget-object v0, p0, Ll/re5;->d:Ll/bqe0;

    .line 1205
    .line 1206
    invoke-virtual {v0}, Ll/bqe0;->A()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_37} :catch_32

    .line 1207
    .line 1208
    .line 1209
    :catch_32
    :cond_9
    :try_start_38
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1210
    .line 1211
    iget-object v2, p0, Ll/re5;->c:Ll/ag60;

    .line 1212
    .line 1213
    iget-object v2, v2, Ll/ag60;->j:Ljava/lang/String;

    .line 1214
    .line 1215
    invoke-virtual {v0, v2}, Ll/vmw;->O(Ljava/lang/String;)V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_38} :catch_33

    .line 1216
    .line 1217
    .line 1218
    goto :goto_29

    .line 1219
    :catch_33
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1220
    .line 1221
    sget-object v2, Ll/re5;->g:Ljava/lang/String;

    .line 1222
    .line 1223
    invoke-virtual {v0, v2}, Ll/vmw;->O(Ljava/lang/String;)V

    .line 1224
    .line 1225
    .line 1226
    :goto_29
    :try_start_39
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1227
    .line 1228
    iget-object v2, p0, Ll/re5;->c:Ll/ag60;

    .line 1229
    .line 1230
    iget-object v2, v2, Ll/ag60;->h:Ljava/lang/String;

    .line 1231
    .line 1232
    invoke-virtual {v0, v2}, Ll/vmw;->W(Ljava/lang/String;)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_39} :catch_34

    .line 1233
    .line 1234
    .line 1235
    goto :goto_2a

    .line 1236
    :catch_34
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1237
    .line 1238
    sget-object v2, Ll/re5;->f:Ljava/lang/String;

    .line 1239
    .line 1240
    invoke-virtual {v0, v2}, Ll/vmw;->W(Ljava/lang/String;)V

    .line 1241
    .line 1242
    .line 1243
    :goto_2a
    sget-boolean v0, Ll/xiw;->d:Z

    .line 1244
    .line 1245
    if-eqz v0, :cond_a

    .line 1246
    .line 1247
    invoke-virtual {p0}, Ll/re5;->c()V

    .line 1248
    .line 1249
    .line 1250
    goto :goto_2b

    .line 1251
    :cond_a
    invoke-virtual {p0}, Ll/re5;->a()V

    .line 1252
    .line 1253
    .line 1254
    :goto_2b
    invoke-static {p1}, Ll/re5;->d(Ljava/lang/String;)Z

    .line 1255
    .line 1256
    .line 1257
    move-result p1

    .line 1258
    if-eqz p1, :cond_b

    .line 1259
    .line 1260
    iget-object p1, p0, Ll/re5;->e:Lcom/immomo/utils/sensors/MotionDetector;

    .line 1261
    .line 1262
    if-eqz p1, :cond_b

    .line 1263
    .line 1264
    :try_start_3a
    invoke-virtual {p1}, Lcom/immomo/utils/sensors/MotionDetector;->o()Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 1265
    .line 1266
    .line 1267
    move-result-object p1

    .line 1268
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 1269
    .line 1270
    invoke-virtual {p1}, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->getValue()I

    .line 1271
    .line 1272
    .line 1273
    move-result p1

    .line 1274
    invoke-virtual {v0, p1}, Ll/vmw;->q(I)V

    .line 1275
    .line 1276
    .line 1277
    iget-object p1, p0, Ll/re5;->e:Lcom/immomo/utils/sensors/MotionDetector;

    .line 1278
    .line 1279
    invoke-virtual {p1}, Lcom/immomo/utils/sensors/MotionDetector;->p()V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3a} :catch_35

    .line 1280
    .line 1281
    .line 1282
    goto :goto_2c

    .line 1283
    :catch_35
    iget-object p1, p0, Ll/re5;->a:Ll/vmw;

    .line 1284
    .line 1285
    invoke-virtual {p1, v1}, Ll/vmw;->q(I)V

    .line 1286
    .line 1287
    .line 1288
    :cond_b
    :goto_2c
    :try_start_3b
    iget-object p1, p0, Ll/re5;->a:Ll/vmw;

    .line 1289
    .line 1290
    iget-object v0, p0, Ll/re5;->c:Ll/ag60;

    .line 1291
    .line 1292
    iget-object v0, v0, Ll/ag60;->i:Ljava/lang/String;

    .line 1293
    .line 1294
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1295
    .line 1296
    .line 1297
    move-result v0

    .line 1298
    if-eqz v0, :cond_c

    .line 1299
    .line 1300
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 1301
    .line 1302
    .line 1303
    move-result-object v0

    .line 1304
    invoke-static {v0}, Ll/rmw;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 1305
    .line 1306
    .line 1307
    move-result-object v0

    .line 1308
    goto :goto_2d

    .line 1309
    :cond_c
    iget-object v0, p0, Ll/re5;->c:Ll/ag60;

    .line 1310
    .line 1311
    iget-object v0, v0, Ll/ag60;->i:Ljava/lang/String;

    .line 1312
    .line 1313
    :goto_2d
    invoke-virtual {p1, v0}, Ll/vmw;->S(Ljava/lang/String;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3b} :catch_36

    .line 1314
    .line 1315
    .line 1316
    goto :goto_2e

    .line 1317
    :catch_36
    iget-object p0, p0, Ll/re5;->a:Ll/vmw;

    .line 1318
    .line 1319
    sget-object p1, Ll/re5;->f:Ljava/lang/String;

    .line 1320
    .line 1321
    invoke-virtual {p0, p1}, Ll/vmw;->S(Ljava/lang/String;)V

    .line 1322
    .line 1323
    .line 1324
    :goto_2e
    return-void

    .line 1325
    :array_0
    .array-data 1
        0x51t
        0x2t
        0x53t
        0x68t
        0x4t
        0x8t
        0x51t
        0x4t
        0x5dt
        0x52t
        0x5t
    .end array-data

    .line 1326
    .line 1327
    .line 1328
    .line 1329
    .line 1330
    .line 1331
    .line 1332
    .line 1333
    .line 1334
    .line 1335
    :array_1
    .array-data 1
        0x7et
        0x9t
        0x5ft
        0x52t
    .end array-data

    .line 1336
    .line 1337
    .line 1338
    .line 1339
    .line 1340
    .line 1341
    :array_2
    .array-data 1
        0x43t
        0x2t
        0x5at
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data

    .line 1342
    .line 1343
    .line 1344
    .line 1345
    .line 1346
    .line 1347
    .line 1348
    .line 1349
    .line 1350
    nop

    :array_3
    .array-data 1
        0x44t
        0xet
        0x62t
        0x73t
        0x2at
        0x25t
        0x5ft
        0xat
        0x5dt
        0x52t
        0x2t
        0x12t
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
    .end array-data
.end method

.method public c()V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 2
    .line 3
    invoke-static {}, Ll/o0e;->i()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/vmw;->h(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_0
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 12
    .line 13
    sget-object v1, Ll/re5;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/vmw;->h(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    :try_start_1
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 19
    .line 20
    iget-object v1, p0, Ll/re5;->b:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {v1}, Ll/a2m;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/vmw;->p(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catch_1
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 31
    .line 32
    sget-object v1, Ll/re5;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/vmw;->p(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :goto_1
    :try_start_2
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 38
    .line 39
    iget-object v1, p0, Ll/re5;->b:Landroid/content/Context;

    .line 40
    .line 41
    invoke-static {v1}, Ll/o0e;->w(Landroid/content/Context;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ll/vmw;->N(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :catch_2
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 50
    .line 51
    sget-object v1, Ll/re5;->f:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/vmw;->N(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :goto_2
    :try_start_3
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 57
    .line 58
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x1

    .line 63
    invoke-static {v1, v2}, Ll/ul20;->g(Landroid/content/Context;Z)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Ll/vmw;->t0(Lorg/json/JSONObject;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 68
    .line 69
    .line 70
    :catch_3
    :try_start_4
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 71
    .line 72
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v1}, Ll/ul20;->h(Landroid/content/Context;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ll/vmw;->u0(Ljava/util/List;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 81
    .line 82
    .line 83
    :catch_4
    :try_start_5
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 84
    .line 85
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v1}, Ll/ul20;->b(Landroid/content/Context;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Ll/vmw;->l(Ljava/util/List;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 94
    .line 95
    .line 96
    :catch_5
    :try_start_6
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 97
    .line 98
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-static {v1}, Ll/o0e;->t(Landroid/content/Context;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Ll/vmw;->H(Ljava/util/List;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 107
    .line 108
    .line 109
    :catch_6
    :try_start_7
    new-instance v0, Lorg/json/JSONObject;

    .line 110
    .line 111
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/cyv;->a()Landroid/location/Location;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const/16 v2, 0xc

    .line 119
    .line 120
    const/4 v3, 0x3

    .line 121
    if-nez v1, :cond_0

    .line 122
    .line 123
    new-array v1, v3, [B

    .line 124
    .line 125
    fill-array-data v1, :array_0

    .line 126
    .line 127
    .line 128
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    const-wide/16 v4, 0x0

    .line 133
    .line 134
    invoke-virtual {v0, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    new-array v1, v3, [B

    .line 138
    .line 139
    fill-array-data v1, :array_1

    .line 140
    .line 141
    .line 142
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    new-array v1, v2, [B

    .line 150
    .line 151
    fill-array-data v1, :array_2

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    const/4 v2, 0x0

    .line 159
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 160
    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_0
    new-array v4, v3, [B

    .line 164
    .line 165
    fill-array-data v4, :array_3

    .line 166
    .line 167
    .line 168
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    .line 173
    .line 174
    .line 175
    move-result-wide v5

    .line 176
    invoke-virtual {v0, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 177
    .line 178
    .line 179
    new-array v3, v3, [B

    .line 180
    .line 181
    fill-array-data v3, :array_4

    .line 182
    .line 183
    .line 184
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    .line 189
    .line 190
    .line 191
    move-result-wide v4

    .line 192
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 193
    .line 194
    .line 195
    new-array v2, v2, [B

    .line 196
    .line 197
    fill-array-data v2, :array_5

    .line 198
    .line 199
    .line 200
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v1}, Landroid/location/Location;->isFromMockProvider()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 209
    .line 210
    .line 211
    :goto_3
    iget-object v1, p0, Ll/re5;->a:Ll/vmw;

    .line 212
    .line 213
    invoke-virtual {v1, v0}, Ll/vmw;->L(Lorg/json/JSONObject;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 214
    .line 215
    .line 216
    :catch_7
    :try_start_8
    iget-object v0, p0, Ll/re5;->a:Ll/vmw;

    .line 217
    .line 218
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-static {v1}, Ll/tj70;->d(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v0, v1}, Ll/vmw;->Z(Lorg/json/JSONObject;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    .line 227
    .line 228
    .line 229
    :catch_8
    :try_start_9
    iget-object p0, p0, Ll/re5;->a:Ll/vmw;

    .line 230
    .line 231
    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-static {v0}, Ll/hnf0;->c(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {p0, v0}, Ll/vmw;->h0(Lorg/json/JSONObject;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    .line 240
    .line 241
    .line 242
    :catch_9
    return-void

    .line 243
    :array_0
    .array-data 1
        0x5ct
        0x7t
        0x45t
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    :array_1
    .array-data 1
        0x5ct
        0x9t
        0x5ft
    .end array-data

    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    :array_2
    .array-data 1
        0x5dt
        0x9t
        0x52t
        0x5ct
        0x2dt
        0x9t
        0x53t
        0x7t
        0x45t
        0x5et
        0xet
        0x8t
    .end array-data

    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    :array_3
    .array-data 1
        0x5ct
        0x7t
        0x45t
    .end array-data

    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_4
    .array-data 1
        0x5ct
        0x9t
        0x5ft
    .end array-data

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    :array_5
    .array-data 1
        0x5dt
        0x9t
        0x52t
        0x5ct
        0x2dt
        0x9t
        0x53t
        0x7t
        0x45t
        0x5et
        0xet
        0x8t
    .end array-data
.end method
