.class public Lcom/xiaomi/push/hb;
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
        "Lcom/xiaomi/push/hb;",
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


# instance fields
.field public a:Lcom/xiaomi/push/gf;

.field public a:Lcom/xiaomi/push/gs;

.field public a:Lcom/xiaomi/push/gu;

.field public a:Ljava/lang/String;

.field public a:Ljava/nio/ByteBuffer;

.field private a:Ljava/util/BitSet;

.field public a:Z

.field public b:Ljava/lang/String;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "XmPushActionContainer"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/hb;->a:Ll/z3r0;

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
    const/16 v3, 0x8

    .line 16
    .line 17
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/xiaomi/push/hb;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-direct {v0, v2, v1, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/xiaomi/push/hb;->b:Ll/m3r0;

    .line 29
    .line 30
    new-instance v0, Ll/m3r0;

    .line 31
    .line 32
    const/4 v4, 0x3

    .line 33
    invoke-direct {v0, v2, v1, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/xiaomi/push/hb;->c:Ll/m3r0;

    .line 37
    .line 38
    new-instance v0, Ll/m3r0;

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    const/16 v4, 0xb

    .line 42
    .line 43
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/xiaomi/push/hb;->d:Ll/m3r0;

    .line 47
    .line 48
    new-instance v0, Ll/m3r0;

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lcom/xiaomi/push/hb;->e:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hb;->f:Ll/m3r0;

    .line 63
    .line 64
    new-instance v0, Ll/m3r0;

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    const/16 v4, 0xc

    .line 68
    .line 69
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 70
    .line 71
    .line 72
    sput-object v0, Lcom/xiaomi/push/hb;->g:Ll/m3r0;

    .line 73
    .line 74
    new-instance v0, Ll/m3r0;

    .line 75
    .line 76
    invoke-direct {v0, v2, v4, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/xiaomi/push/hb;->h:Ll/m3r0;

    .line 80
    .line 81
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
    const/4 v1, 0x2

    .line 7
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/xiaomi/push/hb;->a:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/xiaomi/push/hb;->b:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/hb;)I
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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->c()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->c()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->c()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-boolean v0, p0, Lcom/xiaomi/push/hb;->a:Z

    .line 106
    .line 107
    iget-boolean v1, p1, Lcom/xiaomi/push/hb;->a:Z

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->d()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->d()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->d()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-boolean v0, p0, Lcom/xiaomi/push/hb;->b:Z

    .line 146
    .line 147
    iget-boolean v1, p1, Lcom/xiaomi/push/hb;->b:Z

    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->e()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->e()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->e()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    .line 188
    .line 189
    invoke-static {v0, v1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->f()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->f()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->f()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v1, p1, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->g()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->g()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->g()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget-object v0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v1, p1, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->h()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->h()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->h()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 306
    .line 307
    iget-object v1, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 308
    .line 309
    invoke-static {v0, v1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->i()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->i()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->i()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 346
    .line 347
    iget-object p1, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 348
    .line 349
    invoke-static {p0, p1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    .line 350
    .line 351
    .line 352
    move-result p0

    .line 353
    if-eqz p0, :cond_10

    .line 354
    .line 355
    return p0

    .line 356
    :cond_10
    const/4 p0, 0x0

    .line 357
    return p0
.end method

.method public a()Lcom/xiaomi/push/gf;
    .locals 0

    .line 391
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    return-object p0
.end method

.method public a()Lcom/xiaomi/push/gs;
    .locals 0

    .line 369
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    return-object p0
.end method

.method public a(Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;
    .locals 0

    .line 358
    iput-object p1, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    return-object p0
.end method

.method public a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/hb;
    .locals 0

    .line 370
    iput-object p1, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    return-object p0
.end method

.method public a(Lcom/xiaomi/push/gu;)Lcom/xiaomi/push/hb;
    .locals 0

    .line 368
    iput-object p1, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/xiaomi/push/hb;
    .locals 0

    .line 367
    iput-object p1, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a(Ljava/nio/ByteBuffer;)Lcom/xiaomi/push/hb;
    .locals 0

    .line 365
    iput-object p1, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method public a(Z)Lcom/xiaomi/push/hb;
    .locals 0

    .line 360
    iput-boolean p1, p0, Lcom/xiaomi/push/hb;->a:Z

    const/4 p1, 0x1

    .line 361
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hb;->a(Z)V

    return-object p0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 366
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a()V
    .locals 1

    .line 424
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    if-eqz v0, :cond_2

    .line 425
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_1

    .line 426
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    if-eqz v0, :cond_0

    return-void

    .line 427
    :cond_0
    const-string v0, "Required field \'target\' was not present! Struct: "

    invoke-static {v0, p0}, Ll/j3r0;->a(Ljava/lang/String;Lcom/xiaomi/push/hb;)V

    return-void

    .line 428
    :cond_1
    const-string v0, "Required field \'pushAction\' was not present! Struct: "

    invoke-static {v0, p0}, Ll/j3r0;->a(Ljava/lang/String;Lcom/xiaomi/push/hb;)V

    return-void

    .line 429
    :cond_2
    const-string v0, "Required field \'action\' was not present! Struct: "

    invoke-static {v0, p0}, Ll/j3r0;->a(Ljava/lang/String;Lcom/xiaomi/push/hb;)V

    return-void
.end method

.method public a(Ll/w3r0;)V
    .locals 6

    .line 392
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 393
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 394
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_2

    .line 395
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 396
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->c()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 397
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->d()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 398
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()V

    return-void

    .line 399
    :cond_0
    const-string p1, "Required field \'isRequest\' was not found in serialized data! Struct: "

    invoke-static {p1, p0}, Ll/j3r0;->a(Ljava/lang/String;Lcom/xiaomi/push/hb;)V

    return-void

    .line 400
    :cond_1
    const-string p1, "Required field \'encryptAction\' was not found in serialized data! Struct: "

    invoke-static {p1, p0}, Ll/j3r0;->a(Ljava/lang/String;Lcom/xiaomi/push/hb;)V

    return-void

    .line 401
    :cond_2
    iget-short v0, v0, Ll/m3r0;->c:S

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/16 v4, 0xc

    const/16 v5, 0xb

    packed-switch v0, :pswitch_data_0

    .line 402
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_0
    if-ne v1, v4, :cond_3

    .line 403
    new-instance v0, Lcom/xiaomi/push/gs;

    invoke-direct {v0}, Lcom/xiaomi/push/gs;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 404
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gs;->a(Ll/w3r0;)V

    goto/16 :goto_1

    .line 405
    :cond_3
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_1
    if-ne v1, v4, :cond_4

    .line 406
    new-instance v0, Lcom/xiaomi/push/gu;

    invoke-direct {v0}, Lcom/xiaomi/push/gu;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 407
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->a(Ll/w3r0;)V

    goto :goto_1

    .line 408
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_2
    if-ne v1, v5, :cond_5

    .line 409
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    goto :goto_1

    .line 410
    :cond_5
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_3
    if-ne v1, v5, :cond_6

    .line 411
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    goto :goto_1

    .line 412
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_4
    if-ne v1, v5, :cond_7

    .line 413
    invoke-virtual {p1}, Ll/w3r0;->f()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 414
    :cond_7
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_5
    if-ne v1, v3, :cond_8

    .line 415
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/hb;->b:Z

    .line 416
    invoke-virtual {p0, v2}, Lcom/xiaomi/push/hb;->b(Z)V

    goto :goto_1

    .line 417
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_6
    if-ne v1, v3, :cond_9

    .line 418
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/hb;->a:Z

    .line 419
    invoke-virtual {p0, v2}, Lcom/xiaomi/push/hb;->a(Z)V

    goto :goto_1

    .line 420
    :cond_9
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_7
    const/16 v0, 0x8

    if-ne v1, v0, :cond_a

    .line 421
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    invoke-static {v0}, Lcom/xiaomi/push/gf;->a(I)Lcom/xiaomi/push/gf;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    goto :goto_1

    .line 422
    :cond_a
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 423
    :goto_1
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
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

    .line 362
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 359
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Lcom/xiaomi/push/hb;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 371
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()Z

    move-result v1

    .line 372
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Z

    move-result v2

    if-nez v1, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v1, :cond_15

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 373
    :cond_2
    iget-object v1, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    iget-object v2, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    .line 374
    :cond_3
    iget-boolean v1, p0, Lcom/xiaomi/push/hb;->a:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/hb;->a:Z

    if-eq v1, v2, :cond_4

    return v0

    .line 375
    :cond_4
    iget-boolean v1, p0, Lcom/xiaomi/push/hb;->b:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/hb;->b:Z

    if-eq v1, v2, :cond_5

    return v0

    .line 376
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->e()Z

    move-result v1

    .line 377
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->e()Z

    move-result v2

    if-nez v1, :cond_6

    if-eqz v2, :cond_8

    :cond_6
    if-eqz v1, :cond_15

    if-nez v2, :cond_7

    goto/16 :goto_0

    .line 378
    :cond_7
    iget-object v1, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    iget-object v2, p1, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v0

    .line 379
    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->f()Z

    move-result v1

    .line 380
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->f()Z

    move-result v2

    if-nez v1, :cond_9

    if-eqz v2, :cond_b

    :cond_9
    if-eqz v1, :cond_15

    if-nez v2, :cond_a

    goto :goto_0

    .line 381
    :cond_a
    iget-object v1, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    return v0

    .line 382
    :cond_b
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->g()Z

    move-result v1

    .line 383
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->g()Z

    move-result v2

    if-nez v1, :cond_c

    if-eqz v2, :cond_e

    :cond_c
    if-eqz v1, :cond_15

    if-nez v2, :cond_d

    goto :goto_0

    .line 384
    :cond_d
    iget-object v1, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    return v0

    .line 385
    :cond_e
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->h()Z

    move-result v1

    .line 386
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->h()Z

    move-result v2

    if-nez v1, :cond_f

    if-eqz v2, :cond_11

    :cond_f
    if-eqz v1, :cond_15

    if-nez v2, :cond_10

    goto :goto_0

    .line 387
    :cond_10
    iget-object v1, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    iget-object v2, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gu;->a(Lcom/xiaomi/push/gu;)Z

    move-result v1

    if-nez v1, :cond_11

    return v0

    .line 388
    :cond_11
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->i()Z

    move-result v1

    .line 389
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->i()Z

    move-result v2

    if-nez v1, :cond_12

    if-eqz v2, :cond_14

    :cond_12
    if-eqz v1, :cond_15

    if-nez v2, :cond_13

    goto :goto_0

    .line 390
    :cond_13
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    iget-object p1, p1, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->a(Lcom/xiaomi/push/gs;)Z

    move-result p0

    if-nez p0, :cond_14

    return v0

    :cond_14
    const/4 p0, 0x1

    return p0

    :cond_15
    :goto_0
    return v0
.end method

.method public a()[B
    .locals 1

    .line 363
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Ll/k3r0;->n(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/hb;->a(Ljava/nio/ByteBuffer;)Lcom/xiaomi/push/hb;

    .line 364
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0
.end method

.method public b(Ljava/lang/String;)Lcom/xiaomi/push/hb;
    .locals 0

    .line 170
    iput-object p1, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    return-object p0
.end method

.method public b(Z)Lcom/xiaomi/push/hb;
    .locals 0

    .line 166
    iput-boolean p1, p0, Lcom/xiaomi/push/hb;->b:Z

    const/4 p1, 0x1

    .line 167
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hb;->b(Z)V

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ll/w3r0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/hb;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/xiaomi/push/hb;->a:Ll/m3r0;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/xiaomi/push/gf;->a()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object v0, Lcom/xiaomi/push/hb;->b:Ll/m3r0;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/xiaomi/push/hb;->a:Z

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 41
    .line 42
    .line 43
    sget-object v0, Lcom/xiaomi/push/hb;->c:Ll/m3r0;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 46
    .line 47
    .line 48
    iget-boolean v0, p0, Lcom/xiaomi/push/hb;->b:Z

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    sget-object v0, Lcom/xiaomi/push/hb;->d:Ll/m3r0;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/w3r0;->r(Ljava/nio/ByteBuffer;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->f()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    sget-object v0, Lcom/xiaomi/push/hb;->e:Ll/m3r0;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 94
    .line 95
    .line 96
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->g()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    sget-object v0, Lcom/xiaomi/push/hb;->f:Ll/m3r0;

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 117
    .line 118
    .line 119
    :cond_3
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 120
    .line 121
    if-eqz v0, :cond_4

    .line 122
    .line 123
    sget-object v0, Lcom/xiaomi/push/hb;->g:Ll/m3r0;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 129
    .line 130
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->b(Ll/w3r0;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 134
    .line 135
    .line 136
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 137
    .line 138
    if-eqz v0, :cond_5

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->i()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_5

    .line 145
    .line 146
    sget-object v0, Lcom/xiaomi/push/hb;->h:Ll/m3r0;

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->b(Ll/w3r0;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 157
    .line 158
    .line 159
    :cond_5
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 168
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 0

    .line 171
    iget-boolean p0, p0, Lcom/xiaomi/push/hb;->a:Z

    return p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x0

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
    check-cast p1, Lcom/xiaomi/push/hb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/hb;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/nio/ByteBuffer;

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
    instance-of v1, p1, Lcom/xiaomi/push/hb;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/hb;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/hb;)Z

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

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

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

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

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

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "XmPushActionContainer(action:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 9
    .line 10
    const-string v2, "null"

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    :goto_0
    const-string v1, ", "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, "encryptAction:"

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-boolean v3, p0, Lcom/xiaomi/push/hb;->a:Z

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, "isRequest:"

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-boolean v3, p0, Lcom/xiaomi/push/hb;->b:Z

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->f()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v3, "appid:"

    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object v3, p0, Lcom/xiaomi/push/hb;->a:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v3, :cond_1

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->g()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_4

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v3, "packageName:"

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v3, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 89
    .line 90
    if-nez v3, :cond_3

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v3, "target:"

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 108
    .line 109
    if-nez v3, :cond_5

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    :goto_3
    invoke-virtual {p0}, Lcom/xiaomi/push/hb;->i()Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_7

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, "metaInfo:"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    .line 133
    .line 134
    if-nez p0, :cond_6

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    goto :goto_4

    .line 140
    :cond_6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    :cond_7
    :goto_4
    const-string p0, ")"

    .line 144
    .line 145
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method
