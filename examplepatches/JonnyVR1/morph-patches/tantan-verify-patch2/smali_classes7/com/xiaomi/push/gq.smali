.class public Lcom/xiaomi/push/gq;
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
        "Lcom/xiaomi/push/gq;",
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


# instance fields
.field public a:I

.field public a:J

.field public a:Ljava/lang/String;

.field private a:Ljava/util/BitSet;

.field public a:Z

.field public b:I

.field public b:Z

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "OnlineConfigItem"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/gq;->a:Ll/z3r0;

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
    sput-object v0, Lcom/xiaomi/push/gq;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/xiaomi/push/gq;->b:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/gq;->c:Ll/m3r0;

    .line 37
    .line 38
    new-instance v0, Ll/m3r0;

    .line 39
    .line 40
    const/4 v4, 0x4

    .line 41
    invoke-direct {v0, v2, v3, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/xiaomi/push/gq;->d:Ll/m3r0;

    .line 45
    .line 46
    new-instance v0, Ll/m3r0;

    .line 47
    .line 48
    const/16 v3, 0xa

    .line 49
    .line 50
    const/4 v4, 0x5

    .line 51
    invoke-direct {v0, v2, v3, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lcom/xiaomi/push/gq;->e:Ll/m3r0;

    .line 55
    .line 56
    new-instance v0, Ll/m3r0;

    .line 57
    .line 58
    const/16 v3, 0xb

    .line 59
    .line 60
    const/4 v4, 0x6

    .line 61
    invoke-direct {v0, v2, v3, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/xiaomi/push/gq;->f:Ll/m3r0;

    .line 65
    .line 66
    new-instance v0, Ll/m3r0;

    .line 67
    .line 68
    const/4 v3, 0x7

    .line 69
    invoke-direct {v0, v2, v1, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 70
    .line 71
    .line 72
    sput-object v0, Lcom/xiaomi/push/gq;->g:Ll/m3r0;

    .line 73
    .line 74
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
    iput-object v0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 318
    iget p0, p0, Lcom/xiaomi/push/gq;->a:I

    return p0
.end method

.method public a(Lcom/xiaomi/push/gq;)I
    .locals 4

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->a()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget v0, p0, Lcom/xiaomi/push/gq;->a:I

    .line 66
    .line 67
    iget v1, p1, Lcom/xiaomi/push/gq;->a:I

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->b()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->b()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget v0, p0, Lcom/xiaomi/push/gq;->b:I

    .line 106
    .line 107
    iget v1, p1, Lcom/xiaomi/push/gq;->b:I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->c()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->c()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-boolean v0, p0, Lcom/xiaomi/push/gq;->a:Z

    .line 146
    .line 147
    iget-boolean v1, p1, Lcom/xiaomi/push/gq;->a:Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->d()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->d()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget v0, p0, Lcom/xiaomi/push/gq;->c:I

    .line 186
    .line 187
    iget v1, p1, Lcom/xiaomi/push/gq;->c:I

    .line 188
    .line 189
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->e()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->e()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->e()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-wide v0, p0, Lcom/xiaomi/push/gq;->a:J

    .line 226
    .line 227
    iget-wide v2, p1, Lcom/xiaomi/push/gq;->a:J

    .line 228
    .line 229
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->f()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->f()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->f()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget-object v0, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v1, p1, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->h()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->h()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->h()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-boolean p0, p0, Lcom/xiaomi/push/gq;->b:Z

    .line 306
    .line 307
    iget-boolean p1, p1, Lcom/xiaomi/push/gq;->b:Z

    .line 308
    .line 309
    invoke-static {p0, p1}, Ll/k3r0;->k(ZZ)I

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    if-eqz p0, :cond_e

    .line 314
    .line 315
    return p0

    .line 316
    :cond_e
    const/4 p0, 0x0

    .line 317
    return p0
.end method

.method public a()J
    .locals 2

    .line 321
    iget-wide v0, p0, Lcom/xiaomi/push/gq;->a:J

    return-wide v0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 322
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a()V
    .locals 0

    .line 344
    return-void
.end method

.method public a(Ll/w3r0;)V
    .locals 5

    .line 345
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 346
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 347
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_0

    .line 348
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 349
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()V

    return-void

    .line 350
    :cond_0
    iget-short v0, v0, Ll/m3r0;->c:S

    const/4 v2, 0x2

    const/16 v3, 0x8

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    .line 351
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_1

    :pswitch_0
    if-ne v1, v2, :cond_1

    .line 352
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/gq;->b:Z

    .line 353
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/gq;->f(Z)V

    goto/16 :goto_1

    .line 354
    :cond_1
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_1
    const/16 v0, 0xb

    if-ne v1, v0, :cond_2

    .line 355
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    goto :goto_1

    .line 356
    :cond_2
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_2
    const/16 v0, 0xa

    if-ne v1, v0, :cond_3

    .line 357
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/gq;->a:J

    .line 358
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/gq;->e(Z)V

    goto :goto_1

    .line 359
    :cond_3
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_3
    if-ne v1, v3, :cond_4

    .line 360
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/gq;->c:I

    .line 361
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/gq;->d(Z)V

    goto :goto_1

    .line 362
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_4
    if-ne v1, v2, :cond_5

    .line 363
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/gq;->a:Z

    .line 364
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/gq;->c(Z)V

    goto :goto_1

    .line 365
    :cond_5
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_5
    if-ne v1, v3, :cond_6

    .line 366
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/gq;->b:I

    .line 367
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/gq;->b(Z)V

    goto :goto_1

    .line 368
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_1

    :pswitch_6
    if-ne v1, v3, :cond_7

    .line 369
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/gq;->a:I

    .line 370
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/gq;->a(Z)V

    goto :goto_1

    .line 371
    :cond_7
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 372
    :goto_1
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
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

    .line 320
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 319
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public a(Lcom/xiaomi/push/gq;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 323
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()Z

    move-result v1

    .line 324
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->a()Z

    move-result v2

    if-nez v1, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v1, :cond_16

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 325
    :cond_2
    iget v1, p0, Lcom/xiaomi/push/gq;->a:I

    iget v2, p1, Lcom/xiaomi/push/gq;->a:I

    if-eq v1, v2, :cond_3

    return v0

    .line 326
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->b()Z

    move-result v1

    .line 327
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->b()Z

    move-result v2

    if-nez v1, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    if-eqz v1, :cond_16

    if-nez v2, :cond_5

    goto/16 :goto_0

    .line 328
    :cond_5
    iget v1, p0, Lcom/xiaomi/push/gq;->b:I

    iget v2, p1, Lcom/xiaomi/push/gq;->b:I

    if-eq v1, v2, :cond_6

    return v0

    .line 329
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->c()Z

    move-result v1

    .line 330
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->c()Z

    move-result v2

    if-nez v1, :cond_7

    if-eqz v2, :cond_9

    :cond_7
    if-eqz v1, :cond_16

    if-nez v2, :cond_8

    goto/16 :goto_0

    .line 331
    :cond_8
    iget-boolean v1, p0, Lcom/xiaomi/push/gq;->a:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/gq;->a:Z

    if-eq v1, v2, :cond_9

    return v0

    .line 332
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->d()Z

    move-result v1

    .line 333
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->d()Z

    move-result v2

    if-nez v1, :cond_a

    if-eqz v2, :cond_c

    :cond_a
    if-eqz v1, :cond_16

    if-nez v2, :cond_b

    goto :goto_0

    .line 334
    :cond_b
    iget v1, p0, Lcom/xiaomi/push/gq;->c:I

    iget v2, p1, Lcom/xiaomi/push/gq;->c:I

    if-eq v1, v2, :cond_c

    return v0

    .line 335
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->e()Z

    move-result v1

    .line 336
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->e()Z

    move-result v2

    if-nez v1, :cond_d

    if-eqz v2, :cond_f

    :cond_d
    if-eqz v1, :cond_16

    if-nez v2, :cond_e

    goto :goto_0

    .line 337
    :cond_e
    iget-wide v1, p0, Lcom/xiaomi/push/gq;->a:J

    iget-wide v3, p1, Lcom/xiaomi/push/gq;->a:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_f

    return v0

    .line 338
    :cond_f
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->f()Z

    move-result v1

    .line 339
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->f()Z

    move-result v2

    if-nez v1, :cond_10

    if-eqz v2, :cond_12

    :cond_10
    if-eqz v1, :cond_16

    if-nez v2, :cond_11

    goto :goto_0

    .line 340
    :cond_11
    iget-object v1, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    return v0

    .line 341
    :cond_12
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->h()Z

    move-result v1

    .line 342
    invoke-virtual {p1}, Lcom/xiaomi/push/gq;->h()Z

    move-result v2

    if-nez v1, :cond_13

    if-eqz v2, :cond_15

    :cond_13
    if-eqz v1, :cond_16

    if-nez v2, :cond_14

    goto :goto_0

    .line 343
    :cond_14
    iget-boolean p0, p0, Lcom/xiaomi/push/gq;->b:Z

    iget-boolean p1, p1, Lcom/xiaomi/push/gq;->b:Z

    if-eq p0, p1, :cond_15

    return v0

    :cond_15
    const/4 p0, 0x1

    return p0

    :cond_16
    :goto_0
    return v0
.end method

.method public b()I
    .locals 0

    .line 155
    iget p0, p0, Lcom/xiaomi/push/gq;->b:I

    return p0
.end method

.method public b(Ll/w3r0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/gq;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/xiaomi/push/gq;->a:Ll/m3r0;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/xiaomi/push/gq;->a:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->b()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    sget-object v0, Lcom/xiaomi/push/gq;->b:Ll/m3r0;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/xiaomi/push/gq;->b:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->c()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    sget-object v0, Lcom/xiaomi/push/gq;->c:Ll/m3r0;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 56
    .line 57
    .line 58
    iget-boolean v0, p0, Lcom/xiaomi/push/gq;->a:Z

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 64
    .line 65
    .line 66
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->d()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    sget-object v0, Lcom/xiaomi/push/gq;->d:Ll/m3r0;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 75
    .line 76
    .line 77
    iget v0, p0, Lcom/xiaomi/push/gq;->c:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->e()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    sget-object v0, Lcom/xiaomi/push/gq;->e:Ll/m3r0;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 94
    .line 95
    .line 96
    iget-wide v0, p0, Lcom/xiaomi/push/gq;->a:J

    .line 97
    .line 98
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 102
    .line 103
    .line 104
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v0, :cond_5

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->f()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_5

    .line 113
    .line 114
    sget-object v0, Lcom/xiaomi/push/gq;->f:Ll/m3r0;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 125
    .line 126
    .line 127
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->h()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_6

    .line 132
    .line 133
    sget-object v0, Lcom/xiaomi/push/gq;->g:Ll/m3r0;

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 136
    .line 137
    .line 138
    iget-boolean p0, p0, Lcom/xiaomi/push/gq;->b:Z

    .line 139
    .line 140
    invoke-virtual {p1, p0}, Ll/w3r0;->x(Z)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 144
    .line 145
    .line 146
    :cond_6
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 154
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 1

    .line 153
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public c()I
    .locals 0

    .line 10
    iget p0, p0, Lcom/xiaomi/push/gq;->c:I

    return p0
.end method

.method public c(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

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
    check-cast p1, Lcom/xiaomi/push/gq;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gq;->a(Lcom/xiaomi/push/gq;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

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

.method public e(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

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
    instance-of v1, p1, Lcom/xiaomi/push/gq;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/gq;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gq;->a(Lcom/xiaomi/push/gq;)Z

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
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

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
    iget-boolean p0, p0, Lcom/xiaomi/push/gq;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gq;->a:Ljava/util/BitSet;

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

.method public hashCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "OnlineConfigItem("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "key:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v1, p0, Lcom/xiaomi/push/gq;->a:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    move v1, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x1

    .line 28
    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->b()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const-string v4, ", "

    .line 33
    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    :cond_1
    const-string v1, "type:"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v1, p0, Lcom/xiaomi/push/gq;->b:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    move v1, v2

    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->c()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_4

    .line 57
    .line 58
    if-nez v1, :cond_3

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    :cond_3
    const-string v1, "clear:"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/xiaomi/push/gq;->a:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    move v1, v2

    .line 74
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->d()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_6

    .line 79
    .line 80
    if-nez v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    :cond_5
    const-string v1, "intValue:"

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget v1, p0, Lcom/xiaomi/push/gq;->c:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    move v1, v2

    .line 96
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->e()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_8

    .line 101
    .line 102
    if-nez v1, :cond_7

    .line 103
    .line 104
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    :cond_7
    const-string v1, "longValue:"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget-wide v5, p0, Lcom/xiaomi/push/gq;->a:J

    .line 113
    .line 114
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    move v1, v2

    .line 118
    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->f()Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_b

    .line 123
    .line 124
    if-nez v1, :cond_9

    .line 125
    .line 126
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    :cond_9
    const-string v1, "stringValue:"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Lcom/xiaomi/push/gq;->a:Ljava/lang/String;

    .line 135
    .line 136
    if-nez v1, :cond_a

    .line 137
    .line 138
    const-string v1, "null"

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_b
    move v2, v1

    .line 149
    :goto_1
    invoke-virtual {p0}, Lcom/xiaomi/push/gq;->h()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_d

    .line 154
    .line 155
    if-nez v2, :cond_c

    .line 156
    .line 157
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    :cond_c
    const-string v1, "boolValue:"

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget-boolean p0, p0, Lcom/xiaomi/push/gq;->b:Z

    .line 166
    .line 167
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    :cond_d
    const-string p0, ")"

    .line 171
    .line 172
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0
.end method
