.class public Lcom/xiaomi/push/ej;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/xiaomi/push/hq;
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/xiaomi/push/hq<",
        "Lcom/xiaomi/push/ej;",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final a:Ll/m3r0;

.field private static final a:Ll/z3r0;

.field private static final b:Ll/m3r0;

.field private static final c:Ll/m3r0;

.field private static final d:Ll/m3r0;

.field private static final e:Ll/m3r0;

.field private static final f:Ll/m3r0;

.field private static final g:Ll/m3r0;

.field private static final h:Ll/m3r0;

.field private static final i:Ll/m3r0;

.field private static final j:Ll/m3r0;


# instance fields
.field public a:B

.field public a:I

.field public a:Ljava/lang/String;

.field private a:Ljava/util/BitSet;

.field public b:I

.field public b:Ljava/lang/String;

.field public c:I

.field public c:Ljava/lang/String;

.field public d:I

.field public d:Ljava/lang/String;

.field public e:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "StatsEvent"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/ej;->a:Ll/z3r0;

    .line 9
    .line 10
    new-instance v0, Ll/m3r0;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const-string v2, ""

    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/xiaomi/push/ej;->a:Ll/m3r0;

    .line 20
    .line 21
    new-instance v0, Ll/m3r0;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    const/16 v4, 0x8

    .line 25
    .line 26
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/xiaomi/push/ej;->b:Ll/m3r0;

    .line 30
    .line 31
    new-instance v0, Ll/m3r0;

    .line 32
    .line 33
    invoke-direct {v0, v2, v4, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/xiaomi/push/ej;->c:Ll/m3r0;

    .line 37
    .line 38
    new-instance v0, Ll/m3r0;

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    const/16 v3, 0xb

    .line 42
    .line 43
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/xiaomi/push/ej;->d:Ll/m3r0;

    .line 47
    .line 48
    new-instance v0, Ll/m3r0;

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lcom/xiaomi/push/ej;->e:Ll/m3r0;

    .line 55
    .line 56
    new-instance v0, Ll/m3r0;

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/xiaomi/push/ej;->f:Ll/m3r0;

    .line 63
    .line 64
    new-instance v0, Ll/m3r0;

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/xiaomi/push/ej;->g:Ll/m3r0;

    .line 71
    .line 72
    new-instance v0, Ll/m3r0;

    .line 73
    .line 74
    invoke-direct {v0, v2, v3, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 75
    .line 76
    .line 77
    sput-object v0, Lcom/xiaomi/push/ej;->h:Ll/m3r0;

    .line 78
    .line 79
    new-instance v0, Ll/m3r0;

    .line 80
    .line 81
    const/16 v1, 0x9

    .line 82
    .line 83
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 84
    .line 85
    .line 86
    sput-object v0, Lcom/xiaomi/push/ej;->i:Ll/m3r0;

    .line 87
    .line 88
    new-instance v0, Ll/m3r0;

    .line 89
    .line 90
    const/16 v1, 0xa

    .line 91
    .line 92
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/xiaomi/push/ej;->j:Ll/m3r0;

    .line 96
    .line 97
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/BitSet;

    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/ej;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->a()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    return v0

    .line 59
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-byte v0, p0, Lcom/xiaomi/push/ej;->a:B

    .line 66
    .line 67
    iget-byte v1, p1, Lcom/xiaomi/push/ej;->a:B

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/k3r0;->a(BB)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->b()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->b()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    return v0

    .line 99
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget v0, p0, Lcom/xiaomi/push/ej;->a:I

    .line 106
    .line 107
    iget v1, p1, Lcom/xiaomi/push/ej;->a:I

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    return v0

    .line 116
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->c()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->c()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    return v0

    .line 139
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget v0, p0, Lcom/xiaomi/push/ej;->b:I

    .line 146
    .line 147
    iget v1, p1, Lcom/xiaomi/push/ej;->b:I

    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_6

    .line 154
    .line 155
    return v0

    .line 156
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->d()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->d()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_7

    .line 177
    .line 178
    return v0

    .line 179
    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_8

    .line 194
    .line 195
    return v0

    .line 196
    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->e()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->e()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_9

    .line 217
    .line 218
    return v0

    .line 219
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->e()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-object v0, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v1, p1, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-eqz v0, :cond_a

    .line 234
    .line 235
    return v0

    .line 236
    :cond_a
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->f()Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->f()Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_b

    .line 257
    .line 258
    return v0

    .line 259
    :cond_b
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->f()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget v0, p0, Lcom/xiaomi/push/ej;->c:I

    .line 266
    .line 267
    iget v1, p1, Lcom/xiaomi/push/ej;->c:I

    .line 268
    .line 269
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-eqz v0, :cond_c

    .line 274
    .line 275
    return v0

    .line 276
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->g()Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->g()Z

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_d

    .line 297
    .line 298
    return v0

    .line 299
    :cond_d
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->g()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-object v0, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v1, p1, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_e

    .line 314
    .line 315
    return v0

    .line 316
    :cond_e
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->h()Z

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->h()Z

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-eqz v0, :cond_f

    .line 337
    .line 338
    return v0

    .line 339
    :cond_f
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->h()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget-object v0, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    .line 346
    .line 347
    iget-object v1, p1, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    .line 348
    .line 349
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_10

    .line 354
    .line 355
    return v0

    .line 356
    :cond_10
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->i()Z

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->i()Z

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-eqz v0, :cond_11

    .line 377
    .line 378
    return v0

    .line 379
    :cond_11
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->i()Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-eqz v0, :cond_12

    .line 384
    .line 385
    iget v0, p0, Lcom/xiaomi/push/ej;->d:I

    .line 386
    .line 387
    iget v1, p1, Lcom/xiaomi/push/ej;->d:I

    .line 388
    .line 389
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-eqz v0, :cond_12

    .line 394
    .line 395
    return v0

    .line 396
    :cond_12
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->j()Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->j()Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-eqz v0, :cond_13

    .line 417
    .line 418
    return v0

    .line 419
    :cond_13
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->j()Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-eqz v0, :cond_14

    .line 424
    .line 425
    iget p0, p0, Lcom/xiaomi/push/ej;->e:I

    .line 426
    .line 427
    iget p1, p1, Lcom/xiaomi/push/ej;->e:I

    .line 428
    .line 429
    invoke-static {p0, p1}, Ll/k3r0;->b(II)I

    .line 430
    .line 431
    .line 432
    move-result p0

    .line 433
    if-eqz p0, :cond_14

    .line 434
    .line 435
    return p0

    .line 436
    :cond_14
    const/4 p0, 0x0

    .line 437
    return p0
.end method

.method public a(B)Lcom/xiaomi/push/ej;
    .locals 0

    .line 467
    iput-byte p1, p0, Lcom/xiaomi/push/ej;->a:B

    const/4 p1, 0x1

    .line 468
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->a(Z)V

    return-object p0
.end method

.method public a(I)Lcom/xiaomi/push/ej;
    .locals 0

    .line 440
    iput p1, p0, Lcom/xiaomi/push/ej;->a:I

    const/4 p1, 0x1

    .line 441
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->b(Z)V

    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/xiaomi/push/ej;
    .locals 0

    .line 442
    iput-object p1, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a()V
    .locals 1

    .line 509
    iget-object v0, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-void

    .line 510
    :cond_0
    const-string v0, "Required field \'connpt\' was not present! Struct: "

    invoke-static {v0, p0}, Ll/u0r0;->a(Ljava/lang/String;Lcom/xiaomi/push/ej;)V

    return-void
.end method

.method public a(Ll/w3r0;)V
    .locals 5

    .line 469
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 470
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 471
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_3

    .line 472
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 473
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->a()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 474
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->b()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 475
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->c()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 476
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->a()V

    return-void

    .line 477
    :cond_0
    const-string p1, "Required field \'value\' was not found in serialized data! Struct: "

    invoke-static {p1, p0}, Ll/u0r0;->a(Ljava/lang/String;Lcom/xiaomi/push/ej;)V

    return-void

    .line 478
    :cond_1
    const-string p1, "Required field \'type\' was not found in serialized data! Struct: "

    invoke-static {p1, p0}, Ll/u0r0;->a(Ljava/lang/String;Lcom/xiaomi/push/ej;)V

    return-void

    .line 479
    :cond_2
    const-string p1, "Required field \'chid\' was not found in serialized data! Struct: "

    invoke-static {p1, p0}, Ll/u0r0;->a(Ljava/lang/String;Lcom/xiaomi/push/ej;)V

    return-void

    .line 480
    :cond_3
    iget-short v0, v0, Ll/m3r0;->c:S

    const/16 v2, 0xb

    const/16 v3, 0x8

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    .line 481
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_0
    if-ne v1, v3, :cond_4

    .line 482
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/ej;->e:I

    .line 483
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/ej;->f(Z)V

    goto/16 :goto_1

    .line 484
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_1
    if-ne v1, v3, :cond_5

    .line 485
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/ej;->d:I

    .line 486
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/ej;->e(Z)V

    goto/16 :goto_1

    .line 487
    :cond_5
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_2
    if-ne v1, v2, :cond_6

    .line 488
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    goto/16 :goto_1

    .line 489
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_3
    if-ne v1, v2, :cond_7

    .line 490
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    goto :goto_1

    .line 491
    :cond_7
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_4
    if-ne v1, v3, :cond_8

    .line 492
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/ej;->c:I

    .line 493
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/ej;->d(Z)V

    goto :goto_1

    .line 494
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_5
    if-ne v1, v2, :cond_9

    .line 495
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    goto :goto_1

    .line 496
    :cond_9
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_6
    if-ne v1, v2, :cond_a

    .line 497
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    goto :goto_1

    .line 498
    :cond_a
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_7
    if-ne v1, v3, :cond_b

    .line 499
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/ej;->b:I

    .line 500
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/ej;->c(Z)V

    goto :goto_1

    .line 501
    :cond_b
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_8
    if-ne v1, v3, :cond_c

    .line 502
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/ej;->a:I

    .line 503
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/ej;->b(Z)V

    goto :goto_1

    .line 504
    :cond_c
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_9
    const/4 v0, 0x3

    if-ne v1, v0, :cond_d

    .line 505
    invoke-virtual {p1}, Ll/w3r0;->a()B

    move-result v0

    iput-byte v0, p0, Lcom/xiaomi/push/ej;->a:B

    .line 506
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/ej;->a(Z)V

    goto :goto_1

    .line 507
    :cond_d
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 508
    :goto_1
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Z)V
    .locals 1

    .line 439
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 438
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public a(Lcom/xiaomi/push/ej;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 443
    :cond_0
    iget-byte v1, p0, Lcom/xiaomi/push/ej;->a:B

    iget-byte v2, p1, Lcom/xiaomi/push/ej;->a:B

    if-eq v1, v2, :cond_1

    return v0

    .line 444
    :cond_1
    iget v1, p0, Lcom/xiaomi/push/ej;->a:I

    iget v2, p1, Lcom/xiaomi/push/ej;->a:I

    if-eq v1, v2, :cond_2

    return v0

    .line 445
    :cond_2
    iget v1, p0, Lcom/xiaomi/push/ej;->b:I

    iget v2, p1, Lcom/xiaomi/push/ej;->b:I

    if-eq v1, v2, :cond_3

    return v0

    .line 446
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->d()Z

    move-result v1

    .line 447
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->d()Z

    move-result v2

    if-nez v1, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    if-eqz v1, :cond_19

    if-nez v2, :cond_5

    goto/16 :goto_0

    .line 448
    :cond_5
    iget-object v1, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v0

    .line 449
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->e()Z

    move-result v1

    .line 450
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->e()Z

    move-result v2

    if-nez v1, :cond_7

    if-eqz v2, :cond_9

    :cond_7
    if-eqz v1, :cond_19

    if-nez v2, :cond_8

    goto/16 :goto_0

    .line 451
    :cond_8
    iget-object v1, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v0

    .line 452
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->f()Z

    move-result v1

    .line 453
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->f()Z

    move-result v2

    if-nez v1, :cond_a

    if-eqz v2, :cond_c

    :cond_a
    if-eqz v1, :cond_19

    if-nez v2, :cond_b

    goto/16 :goto_0

    .line 454
    :cond_b
    iget v1, p0, Lcom/xiaomi/push/ej;->c:I

    iget v2, p1, Lcom/xiaomi/push/ej;->c:I

    if-eq v1, v2, :cond_c

    return v0

    .line 455
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->g()Z

    move-result v1

    .line 456
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->g()Z

    move-result v2

    if-nez v1, :cond_d

    if-eqz v2, :cond_f

    :cond_d
    if-eqz v1, :cond_19

    if-nez v2, :cond_e

    goto :goto_0

    .line 457
    :cond_e
    iget-object v1, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    return v0

    .line 458
    :cond_f
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->h()Z

    move-result v1

    .line 459
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->h()Z

    move-result v2

    if-nez v1, :cond_10

    if-eqz v2, :cond_12

    :cond_10
    if-eqz v1, :cond_19

    if-nez v2, :cond_11

    goto :goto_0

    .line 460
    :cond_11
    iget-object v1, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    return v0

    .line 461
    :cond_12
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->i()Z

    move-result v1

    .line 462
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->i()Z

    move-result v2

    if-nez v1, :cond_13

    if-eqz v2, :cond_15

    :cond_13
    if-eqz v1, :cond_19

    if-nez v2, :cond_14

    goto :goto_0

    .line 463
    :cond_14
    iget v1, p0, Lcom/xiaomi/push/ej;->d:I

    iget v2, p1, Lcom/xiaomi/push/ej;->d:I

    if-eq v1, v2, :cond_15

    return v0

    .line 464
    :cond_15
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->j()Z

    move-result v1

    .line 465
    invoke-virtual {p1}, Lcom/xiaomi/push/ej;->j()Z

    move-result v2

    if-nez v1, :cond_16

    if-eqz v2, :cond_18

    :cond_16
    if-eqz v1, :cond_19

    if-nez v2, :cond_17

    goto :goto_0

    .line 466
    :cond_17
    iget p0, p0, Lcom/xiaomi/push/ej;->e:I

    iget p1, p1, Lcom/xiaomi/push/ej;->e:I

    if-eq p0, p1, :cond_18

    return v0

    :cond_18
    const/4 p0, 0x1

    return p0

    :cond_19
    :goto_0
    return v0
.end method

.method public b(I)Lcom/xiaomi/push/ej;
    .locals 0

    .line 199
    iput p1, p0, Lcom/xiaomi/push/ej;->b:I

    const/4 p1, 0x1

    .line 200
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->c(Z)V

    return-object p0
.end method

.method public b(Ljava/lang/String;)Lcom/xiaomi/push/ej;
    .locals 0

    .line 201
    iput-object p1, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ll/w3r0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/ej;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/xiaomi/push/ej;->a:Ll/m3r0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 12
    .line 13
    .line 14
    iget-byte v0, p0, Lcom/xiaomi/push/ej;->a:B

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/w3r0;->n(B)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/xiaomi/push/ej;->b:Ll/m3r0;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcom/xiaomi/push/ej;->a:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/xiaomi/push/ej;->c:Ll/m3r0;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Lcom/xiaomi/push/ej;->b:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    sget-object v0, Lcom/xiaomi/push/ej;->d:Ll/m3r0;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->e()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    sget-object v0, Lcom/xiaomi/push/ej;->e:Ll/m3r0;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 86
    .line 87
    .line 88
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->f()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    sget-object v0, Lcom/xiaomi/push/ej;->f:Ll/m3r0;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 97
    .line 98
    .line 99
    iget v0, p0, Lcom/xiaomi/push/ej;->c:I

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 105
    .line 106
    .line 107
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->g()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_3

    .line 116
    .line 117
    sget-object v0, Lcom/xiaomi/push/ej;->g:Ll/m3r0;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 128
    .line 129
    .line 130
    :cond_3
    iget-object v0, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    .line 131
    .line 132
    if-eqz v0, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->h()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    sget-object v0, Lcom/xiaomi/push/ej;->h:Ll/m3r0;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 151
    .line 152
    .line 153
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->i()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_5

    .line 158
    .line 159
    sget-object v0, Lcom/xiaomi/push/ej;->i:Ll/m3r0;

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 162
    .line 163
    .line 164
    iget v0, p0, Lcom/xiaomi/push/ej;->d:I

    .line 165
    .line 166
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 170
    .line 171
    .line 172
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->j()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_6

    .line 177
    .line 178
    sget-object v0, Lcom/xiaomi/push/ej;->j:Ll/m3r0;

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 181
    .line 182
    .line 183
    iget p0, p0, Lcom/xiaomi/push/ej;->e:I

    .line 184
    .line 185
    invoke-virtual {p1, p0}, Ll/w3r0;->o(I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 189
    .line 190
    .line 191
    :cond_6
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 198
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 1

    .line 202
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public c(I)Lcom/xiaomi/push/ej;
    .locals 0

    .line 10
    iput p1, p0, Lcom/xiaomi/push/ej;->c:I

    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->d(Z)V

    return-object p0
.end method

.method public c(Ljava/lang/String;)Lcom/xiaomi/push/ej;
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    return-object p0
.end method

.method public c(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/xiaomi/push/ej;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->a(Lcom/xiaomi/push/ej;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(I)Lcom/xiaomi/push/ej;
    .locals 0

    .line 11
    iput p1, p0, Lcom/xiaomi/push/ej;->d:I

    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->e(Z)V

    return-object p0
.end method

.method public d(Ljava/lang/String;)Lcom/xiaomi/push/ej;
    .locals 0

    .line 10
    iput-object p1, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    return-object p0
.end method

.method public d(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public e(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/xiaomi/push/ej;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/ej;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->a(Lcom/xiaomi/push/ej;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    return v0
.end method

.method public f(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hashCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public j()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/ej;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "StatsEvent(chid:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-byte v1, p0, Lcom/xiaomi/push/ej;->a:B

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, "type:"

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget v2, p0, Lcom/xiaomi/push/ej;->a:I

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "value:"

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget v2, p0, Lcom/xiaomi/push/ej;->b:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, "connpt:"

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/xiaomi/push/ej;->a:Ljava/lang/String;

    .line 50
    .line 51
    const-string v3, "null"

    .line 52
    .line 53
    if-nez v2, :cond_0

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->e()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, "host:"

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/xiaomi/push/ej;->b:Ljava/lang/String;

    .line 77
    .line 78
    if-nez v2, :cond_1

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->f()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v2, "subvalue:"

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget v2, p0, Lcom/xiaomi/push/ej;->c:I

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->g()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_5

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, "annotation:"

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Lcom/xiaomi/push/ej;->c:Ljava/lang/String;

    .line 121
    .line 122
    if-nez v2, :cond_4

    .line 123
    .line 124
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->h()Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eqz v2, :cond_7

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v2, "user:"

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Lcom/xiaomi/push/ej;->d:Ljava/lang/String;

    .line 146
    .line 147
    if-nez v2, :cond_6

    .line 148
    .line 149
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_6
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    :cond_7
    :goto_3
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->i()Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_8

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v2, "time:"

    .line 166
    .line 167
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    iget v2, p0, Lcom/xiaomi/push/ej;->d:I

    .line 171
    .line 172
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/ej;->j()Z

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    if-eqz v2, :cond_9

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v1, "clientIp:"

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    iget p0, p0, Lcom/xiaomi/push/ej;->e:I

    .line 190
    .line 191
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    :cond_9
    const-string p0, ")"

    .line 195
    .line 196
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    return-object p0
.end method
