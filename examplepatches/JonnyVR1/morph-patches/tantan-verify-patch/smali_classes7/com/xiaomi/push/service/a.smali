.class public Lcom/xiaomi/push/service/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/xiaomi/push/service/ag$a<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/xiaomi/push/service/a$1;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, Lcom/xiaomi/push/service/a$1;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/xiaomi/push/service/a;->a:Landroid/util/SparseArray;

    .line 8
    .line 9
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)I
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1b

    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_1b

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {p0, p1, v1}, Lcom/xiaomi/push/g;->f(Landroid/content/Context;Ljava/lang/String;Z)Lcom/xiaomi/push/g$b;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v2, Lcom/xiaomi/push/g$b;->b:Lcom/xiaomi/push/g$b;

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    if-ne p0, v2, :cond_0

    .line 19
    .line 20
    move v0, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v2, Lcom/xiaomi/push/g$b;->c:Lcom/xiaomi/push/g$b;

    .line 23
    .line 24
    if-ne p0, v2, :cond_1

    .line 25
    .line 26
    move v0, v3

    .line 27
    :cond_1
    :goto_0
    invoke-static {}, Lcom/xiaomi/push/service/ag;->a()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/16 v2, 0x2000

    .line 32
    .line 33
    const/16 v4, 0x1000

    .line 34
    .line 35
    const/16 v5, 0x20

    .line 36
    .line 37
    const/16 v6, 0x10

    .line 38
    .line 39
    const/16 v7, 0x8

    .line 40
    .line 41
    const/4 v8, 0x4

    .line 42
    if-eqz p0, :cond_e

    .line 43
    .line 44
    invoke-static {p1}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;)Landroid/os/Bundle;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object p1, Lcom/xiaomi/push/service/ag;->g:Lcom/xiaomi/push/service/ag$a;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v1, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    iget-object p1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast p1, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    move v7, v8

    .line 71
    :cond_2
    or-int/2addr v0, v7

    .line 72
    :cond_3
    sget-object p1, Lcom/xiaomi/push/service/ag;->e:Lcom/xiaomi/push/service/ag$a;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v1, Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    iget-object p1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast p1, Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_4

    .line 93
    .line 94
    move v5, v6

    .line 95
    :cond_4
    or-int/2addr v0, v5

    .line 96
    :cond_5
    sget-object p1, Lcom/xiaomi/push/service/ag;->f:Lcom/xiaomi/push/service/ag$a;

    .line 97
    .line 98
    iget-object v1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v1, Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    iget-object p1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast p1, Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    const/16 p1, 0x40

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_6
    const/16 p1, 0x80

    .line 122
    .line 123
    :goto_1
    or-int/2addr v0, p1

    .line 124
    :cond_7
    sget-object p1, Lcom/xiaomi/push/service/ag;->b:Lcom/xiaomi/push/service/ag$a;

    .line 125
    .line 126
    iget-object v1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v1, Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_9

    .line 135
    .line 136
    iget-object p1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast p1, Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_8

    .line 145
    .line 146
    const/16 p1, 0x100

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_8
    const/16 p1, 0x200

    .line 150
    .line 151
    :goto_2
    or-int/2addr v0, p1

    .line 152
    :cond_9
    sget-object p1, Lcom/xiaomi/push/service/ag;->c:Lcom/xiaomi/push/service/ag$a;

    .line 153
    .line 154
    iget-object v1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast v1, Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-eqz v1, :cond_b

    .line 163
    .line 164
    iget-object p1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 165
    .line 166
    check-cast p1, Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_a

    .line 173
    .line 174
    const/16 p1, 0x400

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_a
    const/16 p1, 0x800

    .line 178
    .line 179
    :goto_3
    or-int/2addr v0, p1

    .line 180
    :cond_b
    sget-object p1, Lcom/xiaomi/push/service/ag;->h:Lcom/xiaomi/push/service/ag$a;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 183
    .line 184
    check-cast v1, Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    if-eqz v1, :cond_d

    .line 191
    .line 192
    iget-object p1, p1, Lcom/xiaomi/push/service/ag$a;->c:Ljava/lang/Object;

    .line 193
    .line 194
    check-cast p1, Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-eqz p0, :cond_c

    .line 201
    .line 202
    move v2, v4

    .line 203
    :cond_c
    or-int p0, v0, v2

    .line 204
    .line 205
    return p0

    .line 206
    :cond_d
    return v0

    .line 207
    :cond_e
    invoke-static {p1, v1}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;I)I

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-ne p0, v1, :cond_f

    .line 212
    .line 213
    or-int/lit8 v0, v0, 0x4

    .line 214
    .line 215
    goto :goto_4

    .line 216
    :cond_f
    if-nez p0, :cond_10

    .line 217
    .line 218
    or-int/lit8 v0, v0, 0x8

    .line 219
    .line 220
    :cond_10
    :goto_4
    invoke-static {p1, v8}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;I)I

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    if-ne p0, v1, :cond_11

    .line 225
    .line 226
    or-int/lit8 v0, v0, 0x10

    .line 227
    .line 228
    goto :goto_5

    .line 229
    :cond_11
    if-nez p0, :cond_12

    .line 230
    .line 231
    or-int/lit8 v0, v0, 0x20

    .line 232
    .line 233
    :cond_12
    :goto_5
    invoke-static {p1, v3}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;I)I

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-ne p0, v1, :cond_13

    .line 238
    .line 239
    or-int/lit8 v0, v0, 0x40

    .line 240
    .line 241
    goto :goto_6

    .line 242
    :cond_13
    if-nez p0, :cond_14

    .line 243
    .line 244
    or-int/lit16 v0, v0, 0x80

    .line 245
    .line 246
    :cond_14
    :goto_6
    invoke-static {p1, v7}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;I)I

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    if-ne p0, v1, :cond_15

    .line 251
    .line 252
    or-int/lit16 v0, v0, 0x100

    .line 253
    .line 254
    goto :goto_7

    .line 255
    :cond_15
    if-nez p0, :cond_16

    .line 256
    .line 257
    or-int/lit16 v0, v0, 0x200

    .line 258
    .line 259
    :cond_16
    :goto_7
    invoke-static {p1, v6}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;I)I

    .line 260
    .line 261
    .line 262
    move-result p0

    .line 263
    if-ne p0, v1, :cond_17

    .line 264
    .line 265
    or-int/lit16 v0, v0, 0x400

    .line 266
    .line 267
    goto :goto_8

    .line 268
    :cond_17
    if-nez p0, :cond_18

    .line 269
    .line 270
    or-int/lit16 v0, v0, 0x800

    .line 271
    .line 272
    :cond_18
    :goto_8
    invoke-static {p1, v5}, Lcom/xiaomi/push/service/a;->a(Ljava/lang/String;I)I

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    if-ne p0, v1, :cond_19

    .line 277
    .line 278
    or-int/lit16 p0, v0, 0x1000

    .line 279
    .line 280
    return p0

    .line 281
    :cond_19
    if-nez p0, :cond_1a

    .line 282
    .line 283
    or-int/lit16 p0, v0, 0x2000

    .line 284
    .line 285
    return p0

    .line 286
    :cond_1a
    return v0

    .line 287
    :cond_1b
    const-string p0, "context | packageName must not be null"

    .line 288
    .line 289
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    return v0
.end method

.method private static a(Ljava/lang/String;I)I
    .locals 2

    .line 294
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/service/a;->a:Landroid/util/SparseArray;

    .line 295
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/push/service/ag$a;

    const/4 v1, 0x0

    .line 296
    invoke-static {v0, p0, v1, p1}, Lcom/xiaomi/push/service/ag;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/service/ag$a;)I

    move-result p0

    return p0
.end method

.method private static a(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2

    .line 293
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lcom/xiaomi/push/service/ag;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method
