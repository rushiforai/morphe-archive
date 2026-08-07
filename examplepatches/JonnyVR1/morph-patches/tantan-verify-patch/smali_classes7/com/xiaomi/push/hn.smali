.class public Lcom/xiaomi/push/hn;
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
        "Lcom/xiaomi/push/hn;",
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
.field public a:Lcom/xiaomi/push/gu;

.field public a:Ljava/lang/String;

.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "XmPushActionUnSubscription"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/hn;->a:Ll/z3r0;

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
    const/16 v3, 0xb

    .line 16
    .line 17
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/xiaomi/push/hn;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/16 v1, 0xc

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    invoke-direct {v0, v2, v1, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/xiaomi/push/hn;->b:Ll/m3r0;

    .line 31
    .line 32
    new-instance v0, Ll/m3r0;

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/xiaomi/push/hn;->c:Ll/m3r0;

    .line 39
    .line 40
    new-instance v0, Ll/m3r0;

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/xiaomi/push/hn;->d:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hn;->e:Ll/m3r0;

    .line 55
    .line 56
    new-instance v0, Ll/m3r0;

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/xiaomi/push/hn;->f:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hn;->g:Ll/m3r0;

    .line 71
    .line 72
    new-instance v0, Ll/m3r0;

    .line 73
    .line 74
    const/16 v1, 0xf

    .line 75
    .line 76
    const/16 v3, 0x8

    .line 77
    .line 78
    invoke-direct {v0, v2, v1, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 79
    .line 80
    .line 81
    sput-object v0, Lcom/xiaomi/push/hn;->h:Ll/m3r0;

    .line 82
    .line 83
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
.method public a(Lcom/xiaomi/push/hn;)I
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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->a()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->b()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->b()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    .line 106
    .line 107
    iget-object v1, p1, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->c()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->c()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-object v0, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v1, p1, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->d()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->d()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->e()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->e()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->e()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-object v0, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v1, p1, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->f()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->f()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->f()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget-object v0, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v1, p1, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->g()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->g()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->g()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-object v0, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v1, p1, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->h()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->h()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->h()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    .line 346
    .line 347
    iget-object p1, p1, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    .line 348
    .line 349
    invoke-static {p0, p1}, Ll/k3r0;->g(Ljava/util/List;Ljava/util/List;)I

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

.method public a(Ljava/lang/String;)Lcom/xiaomi/push/hn;
    .locals 0

    .line 358
    iput-object p1, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 414
    iget-object v0, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 415
    iget-object v0, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 416
    iget-object v0, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-void

    .line 417
    :cond_0
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'topic\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0

    .line 418
    :cond_1
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'appId\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0

    .line 419
    :cond_2
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'id\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ll/w3r0;)V
    .locals 4

    .line 384
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 385
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 386
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_0

    .line 387
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 388
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()V

    return-void

    .line 389
    :cond_0
    iget-short v0, v0, Ll/m3r0;->c:S

    const/16 v2, 0xb

    packed-switch v0, :pswitch_data_0

    .line 390
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_0
    const/16 v0, 0xf

    if-ne v1, v0, :cond_2

    .line 391
    invoke-virtual {p1}, Ll/w3r0;->h()Ll/n3r0;

    move-result-object v0

    .line 392
    new-instance v1, Ljava/util/ArrayList;

    iget v2, v0, Ll/n3r0;->b:I

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    const/4 v1, 0x0

    .line 393
    :goto_1
    iget v2, v0, Ll/n3r0;->b:I

    if-ge v1, v2, :cond_1

    .line 394
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v2

    .line 395
    iget-object v3, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 396
    :cond_1
    invoke-virtual {p1}, Ll/w3r0;->G()V

    goto/16 :goto_2

    .line 397
    :cond_2
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_1
    if-ne v1, v2, :cond_3

    .line 398
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    goto :goto_2

    .line 399
    :cond_3
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_2
    if-ne v1, v2, :cond_4

    .line 400
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    goto :goto_2

    .line 401
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_3
    if-ne v1, v2, :cond_5

    .line 402
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    goto :goto_2

    .line 403
    :cond_5
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_4
    if-ne v1, v2, :cond_6

    .line 404
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    goto :goto_2

    .line 405
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_5
    if-ne v1, v2, :cond_7

    .line 406
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    goto :goto_2

    .line 407
    :cond_7
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_6
    const/16 v0, 0xc

    if-ne v1, v0, :cond_8

    .line 408
    new-instance v0, Lcom/xiaomi/push/gu;

    invoke-direct {v0}, Lcom/xiaomi/push/gu;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    .line 409
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->a(Ll/w3r0;)V

    goto :goto_2

    .line 410
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_7
    if-ne v1, v2, :cond_9

    .line 411
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    goto :goto_2

    .line 412
    :cond_9
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 413
    :goto_2
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    nop

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

.method public a()Z
    .locals 0

    .line 383
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Lcom/xiaomi/push/hn;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 359
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()Z

    move-result v1

    .line 360
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->a()Z

    move-result v2

    if-nez v1, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v1, :cond_19

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 361
    :cond_2
    iget-object v1, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    .line 362
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->b()Z

    move-result v1

    .line 363
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->b()Z

    move-result v2

    if-nez v1, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    if-eqz v1, :cond_19

    if-nez v2, :cond_5

    goto/16 :goto_0

    .line 364
    :cond_5
    iget-object v1, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gu;->a(Lcom/xiaomi/push/gu;)Z

    move-result v1

    if-nez v1, :cond_6

    return v0

    .line 365
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->c()Z

    move-result v1

    .line 366
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->c()Z

    move-result v2

    if-nez v1, :cond_7

    if-eqz v2, :cond_9

    :cond_7
    if-eqz v1, :cond_19

    if-nez v2, :cond_8

    goto/16 :goto_0

    .line 367
    :cond_8
    iget-object v1, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v0

    .line 368
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->d()Z

    move-result v1

    .line 369
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->d()Z

    move-result v2

    if-nez v1, :cond_a

    if-eqz v2, :cond_c

    :cond_a
    if-eqz v1, :cond_19

    if-nez v2, :cond_b

    goto/16 :goto_0

    .line 370
    :cond_b
    iget-object v1, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v0

    .line 371
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->e()Z

    move-result v1

    .line 372
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->e()Z

    move-result v2

    if-nez v1, :cond_d

    if-eqz v2, :cond_f

    :cond_d
    if-eqz v1, :cond_19

    if-nez v2, :cond_e

    goto :goto_0

    .line 373
    :cond_e
    iget-object v1, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    return v0

    .line 374
    :cond_f
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->f()Z

    move-result v1

    .line 375
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->f()Z

    move-result v2

    if-nez v1, :cond_10

    if-eqz v2, :cond_12

    :cond_10
    if-eqz v1, :cond_19

    if-nez v2, :cond_11

    goto :goto_0

    .line 376
    :cond_11
    iget-object v1, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    return v0

    .line 377
    :cond_12
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->g()Z

    move-result v1

    .line 378
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->g()Z

    move-result v2

    if-nez v1, :cond_13

    if-eqz v2, :cond_15

    :cond_13
    if-eqz v1, :cond_19

    if-nez v2, :cond_14

    goto :goto_0

    .line 379
    :cond_14
    iget-object v1, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    return v0

    .line 380
    :cond_15
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->h()Z

    move-result v1

    .line 381
    invoke-virtual {p1}, Lcom/xiaomi/push/hn;->h()Z

    move-result v2

    if-nez v1, :cond_16

    if-eqz v2, :cond_18

    :cond_16
    if-eqz v1, :cond_19

    if-nez v2, :cond_17

    goto :goto_0

    .line 382
    :cond_17
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    iget-object p1, p1, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    return v0

    :cond_18
    const/4 p0, 0x1

    return p0

    :cond_19
    :goto_0
    return v0
.end method

.method public b(Ljava/lang/String;)Lcom/xiaomi/push/hn;
    .locals 0

    .line 218
    iput-object p1, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ll/w3r0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/hn;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/xiaomi/push/hn;->a:Ll/m3r0;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    sget-object v0, Lcom/xiaomi/push/hn;->b:Ll/m3r0;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->b(Ll/w3r0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    sget-object v0, Lcom/xiaomi/push/hn;->c:Ll/m3r0;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    sget-object v0, Lcom/xiaomi/push/hn;->d:Ll/m3r0;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 87
    .line 88
    .line 89
    :cond_3
    iget-object v0, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    sget-object v0, Lcom/xiaomi/push/hn;->e:Ll/m3r0;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v0, :cond_5

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->f()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_5

    .line 115
    .line 116
    sget-object v0, Lcom/xiaomi/push/hn;->f:Ll/m3r0;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 127
    .line 128
    .line 129
    :cond_5
    iget-object v0, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz v0, :cond_6

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->g()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    sget-object v0, Lcom/xiaomi/push/hn;->g:Ll/m3r0;

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 150
    .line 151
    .line 152
    :cond_6
    iget-object v0, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    .line 153
    .line 154
    if-eqz v0, :cond_8

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->h()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_8

    .line 161
    .line 162
    sget-object v0, Lcom/xiaomi/push/hn;->h:Ll/m3r0;

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 165
    .line 166
    .line 167
    new-instance v0, Ll/n3r0;

    .line 168
    .line 169
    iget-object v1, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    .line 170
    .line 171
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    const/16 v2, 0xb

    .line 176
    .line 177
    invoke-direct {v0, v2, v1}, Ll/n3r0;-><init>(BI)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, v0}, Ll/w3r0;->t(Ll/n3r0;)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_7

    .line 194
    .line 195
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_7
    invoke-virtual {p1}, Ll/w3r0;->C()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 209
    .line 210
    .line 211
    :cond_8
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public b()Z
    .locals 0

    .line 219
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public c(Ljava/lang/String;)Lcom/xiaomi/push/hn;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

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

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/xiaomi/push/hn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hn;->a(Lcom/xiaomi/push/hn;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ljava/lang/String;)Lcom/xiaomi/push/hn;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

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

.method public e(Ljava/lang/String;)Lcom/xiaomi/push/hn;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

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
    instance-of v1, p1, Lcom/xiaomi/push/hn;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/hn;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hn;->a(Lcom/xiaomi/push/hn;)Z

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
    iget-object p0, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

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

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "XmPushActionUnSubscription("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const-string v3, "null"

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    const-string v1, "debug:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/xiaomi/push/hn;->a:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :goto_0
    move v1, v2

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/4 v1, 0x1

    .line 36
    :goto_1
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    const-string v5, ", "

    .line 41
    .line 42
    if-eqz v4, :cond_4

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    :cond_2
    const-string v1, "target:"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/xiaomi/push/hn;->a:Lcom/xiaomi/push/gu;

    .line 55
    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_4
    move v2, v1

    .line 67
    :goto_2
    if-nez v2, :cond_5

    .line 68
    .line 69
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    :cond_5
    const-string v1, "id:"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/xiaomi/push/hn;->b:Ljava/lang/String;

    .line 78
    .line 79
    if-nez v1, :cond_6

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    :goto_3
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, "appId:"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/xiaomi/push/hn;->c:Ljava/lang/String;

    .line 97
    .line 98
    if-nez v1, :cond_7

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    :goto_4
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v1, "topic:"

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Lcom/xiaomi/push/hn;->d:Ljava/lang/String;

    .line 116
    .line 117
    if-nez v1, :cond_8

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    goto :goto_5

    .line 123
    :cond_8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    :goto_5
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->f()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_a

    .line 131
    .line 132
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, "packageName:"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Lcom/xiaomi/push/hn;->e:Ljava/lang/String;

    .line 141
    .line 142
    if-nez v1, :cond_9

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    goto :goto_6

    .line 148
    :cond_9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    :cond_a
    :goto_6
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->g()Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_c

    .line 156
    .line 157
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v1, "category:"

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/xiaomi/push/hn;->f:Ljava/lang/String;

    .line 166
    .line 167
    if-nez v1, :cond_b

    .line 168
    .line 169
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    goto :goto_7

    .line 173
    :cond_b
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    :cond_c
    :goto_7
    invoke-virtual {p0}, Lcom/xiaomi/push/hn;->h()Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    if-eqz v1, :cond_e

    .line 181
    .line 182
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, "aliases:"

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object p0, p0, Lcom/xiaomi/push/hn;->a:Ljava/util/List;

    .line 191
    .line 192
    if-nez p0, :cond_d

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    goto :goto_8

    .line 198
    :cond_d
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    :cond_e
    :goto_8
    const-string p0, ")"

    .line 202
    .line 203
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    return-object p0
.end method
