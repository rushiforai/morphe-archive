.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic k:Z = true


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/a;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/Call;

.field public final e:Lcom/tencent/cloud/ai/network/okhttp3/m;

.field public f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

.field public final g:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;

.field public h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

.field public i:Z

.field public j:Lcom/tencent/cloud/ai/network/okhttp3/s;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->d:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->e:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 13
    .line 14
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    .line 17
    .line 18
    invoke-direct {p1, p3, p2, p4, p5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;
    .locals 1

    .line 762
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->k:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    const/4 p0, 0x0

    return-object p0

    .line 763
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    return-object p0
.end method

.method public final a(IIIIZ)Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 7
    .line 8
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_27

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->i:Z

    .line 16
    .line 17
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 18
    .line 19
    iget-object v4, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    iget-boolean v6, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e()Ljava/net/Socket;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto/16 :goto_15

    .line 35
    .line 36
    :cond_0
    move-object v3, v5

    .line 37
    :goto_0
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 38
    .line 39
    iget-object v7, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 40
    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    move-object v4, v5

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move-object v7, v5

    .line 46
    :goto_1
    const/4 v8, 0x1

    .line 47
    if-nez v7, :cond_4

    .line 48
    .line 49
    iget-object v9, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 50
    .line 51
    iget-object v10, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 52
    .line 53
    invoke-virtual {v9, v10, v6, v5, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Ljava/util/List;Z)Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-eqz v6, :cond_2

    .line 58
    .line 59
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 60
    .line 61
    iget-object v7, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 62
    .line 63
    move-object v6, v5

    .line 64
    move v9, v8

    .line 65
    goto :goto_3

    .line 66
    :cond_2
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->j:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 67
    .line 68
    if-eqz v6, :cond_3

    .line 69
    .line 70
    iput-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->j:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 71
    .line 72
    :goto_2
    move v9, v2

    .line 73
    goto :goto_3

    .line 74
    :cond_3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c()Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eqz v6, :cond_4

    .line 79
    .line 80
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 81
    .line 82
    iget-object v6, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 83
    .line 84
    iget-object v6, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    move v9, v2

    .line 88
    move-object v6, v5

    .line 89
    :goto_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 91
    .line 92
    .line 93
    if-eqz v4, :cond_5

    .line 94
    .line 95
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->e:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    :cond_5
    if-eqz v9, :cond_6

    .line 101
    .line 102
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->e:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 105
    .line 106
    .line 107
    :cond_6
    if-eqz v7, :cond_7

    .line 108
    .line 109
    return-object v7

    .line 110
    :cond_7
    if-nez v6, :cond_19

    .line 111
    .line 112
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->a()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-nez v1, :cond_19

    .line 121
    .line 122
    :cond_8
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a()Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-nez v3, :cond_a

    .line 129
    .line 130
    iget-object v3, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->h:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-nez v3, :cond_9

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_9
    invoke-static {}, Ll/mor;->a()V

    .line 140
    .line 141
    .line 142
    return-object v5

    .line 143
    :cond_a
    :goto_4
    new-instance v3, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    :goto_5
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a()Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-eqz v4, :cond_17

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a()Z

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    if-eqz v4, :cond_16

    .line 159
    .line 160
    iget-object v4, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->e:Ljava/util/List;

    .line 161
    .line 162
    iget v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->f:I

    .line 163
    .line 164
    add-int/lit8 v11, v10, 0x1

    .line 165
    .line 166
    iput v11, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->f:I

    .line 167
    .line 168
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    check-cast v4, Ljava/net/Proxy;

    .line 173
    .line 174
    new-instance v10, Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .line 178
    .line 179
    iput-object v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->g:Ljava/util/List;

    .line 180
    .line 181
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 182
    .line 183
    .line 184
    move-result-object v10

    .line 185
    sget-object v11, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 186
    .line 187
    if-eq v10, v11, :cond_e

    .line 188
    .line 189
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 190
    .line 191
    .line 192
    move-result-object v10

    .line 193
    sget-object v11, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    .line 194
    .line 195
    if-ne v10, v11, :cond_b

    .line 196
    .line 197
    goto :goto_7

    .line 198
    :cond_b
    invoke-virtual {v4}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    .line 199
    .line 200
    .line 201
    move-result-object v10

    .line 202
    instance-of v11, v10, Ljava/net/InetSocketAddress;

    .line 203
    .line 204
    if-eqz v11, :cond_d

    .line 205
    .line 206
    check-cast v10, Ljava/net/InetSocketAddress;

    .line 207
    .line 208
    invoke-virtual {v10}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 209
    .line 210
    .line 211
    move-result-object v11

    .line 212
    if-nez v11, :cond_c

    .line 213
    .line 214
    invoke-virtual {v10}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v11

    .line 218
    goto :goto_6

    .line 219
    :cond_c
    invoke-virtual {v11}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v11

    .line 223
    :goto_6
    invoke-virtual {v10}, Ljava/net/InetSocketAddress;->getPort()I

    .line 224
    .line 225
    .line 226
    move-result v10

    .line 227
    goto :goto_8

    .line 228
    :cond_d
    const-string v0, "Proxy.address() is not an InetSocketAddress: "

    .line 229
    .line 230
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-static {v0, v1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    return-object v5

    .line 238
    :cond_e
    :goto_7
    iget-object v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 239
    .line 240
    iget-object v10, v10, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 241
    .line 242
    iget-object v11, v10, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 243
    .line 244
    iget v10, v10, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 245
    .line 246
    :goto_8
    if-lt v10, v8, :cond_15

    .line 247
    .line 248
    const v12, 0xffff

    .line 249
    .line 250
    .line 251
    if-gt v10, v12, :cond_15

    .line 252
    .line 253
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 254
    .line 255
    .line 256
    move-result-object v12

    .line 257
    sget-object v13, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    .line 258
    .line 259
    if-ne v12, v13, :cond_f

    .line 260
    .line 261
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->g:Ljava/util/List;

    .line 262
    .line 263
    invoke-static {v11, v10}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    .line 264
    .line 265
    .line 266
    move-result-object v10

    .line 267
    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    goto :goto_a

    .line 271
    :cond_f
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 272
    .line 273
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    .line 275
    .line 276
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 277
    .line 278
    iget-object v12, v12, Lcom/tencent/cloud/ai/network/okhttp3/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 279
    .line 280
    invoke-interface {v12, v11}, Lcom/tencent/cloud/ai/network/okhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    .line 281
    .line 282
    .line 283
    move-result-object v12

    .line 284
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v13

    .line 288
    if-nez v13, :cond_14

    .line 289
    .line 290
    iget-object v11, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 291
    .line 292
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 296
    .line 297
    .line 298
    move-result v11

    .line 299
    move v13, v2

    .line 300
    :goto_9
    if-ge v13, v11, :cond_10

    .line 301
    .line 302
    invoke-interface {v12, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v14

    .line 306
    check-cast v14, Ljava/net/InetAddress;

    .line 307
    .line 308
    iget-object v15, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->g:Ljava/util/List;

    .line 309
    .line 310
    new-instance v8, Ljava/net/InetSocketAddress;

    .line 311
    .line 312
    invoke-direct {v8, v14, v10}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 313
    .line 314
    .line 315
    invoke-interface {v15, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    add-int/lit8 v13, v13, 0x1

    .line 319
    .line 320
    const/4 v8, 0x1

    .line 321
    goto :goto_9

    .line 322
    :cond_10
    :goto_a
    iget-object v8, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->g:Ljava/util/List;

    .line 323
    .line 324
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 325
    .line 326
    .line 327
    move-result v8

    .line 328
    move v10, v2

    .line 329
    :goto_b
    if-ge v10, v8, :cond_12

    .line 330
    .line 331
    new-instance v11, Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 332
    .line 333
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 334
    .line 335
    iget-object v13, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->g:Ljava/util/List;

    .line 336
    .line 337
    invoke-interface {v13, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v13

    .line 341
    check-cast v13, Ljava/net/InetSocketAddress;

    .line 342
    .line 343
    invoke-direct {v11, v12, v4, v13}, Lcom/tencent/cloud/ai/network/okhttp3/s;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/a;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 344
    .line 345
    .line 346
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    .line 347
    .line 348
    monitor-enter v12

    .line 349
    :try_start_1
    iget-object v13, v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;->a:Ljava/util/Set;

    .line 350
    .line 351
    invoke-interface {v13, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 355
    monitor-exit v12

    .line 356
    if-eqz v13, :cond_11

    .line 357
    .line 358
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->h:Ljava/util/List;

    .line 359
    .line 360
    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    goto :goto_c

    .line 364
    :cond_11
    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    :goto_c
    add-int/lit8 v10, v10, 0x1

    .line 368
    .line 369
    goto :goto_b

    .line 370
    :catchall_1
    move-exception v0

    .line 371
    monitor-exit v12

    .line 372
    throw v0

    .line 373
    :cond_12
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 374
    .line 375
    .line 376
    move-result v4

    .line 377
    if-nez v4, :cond_13

    .line 378
    .line 379
    goto :goto_d

    .line 380
    :cond_13
    const/4 v8, 0x1

    .line 381
    goto/16 :goto_5

    .line 382
    .line 383
    :cond_14
    new-instance v0, Ljava/net/UnknownHostException;

    .line 384
    .line 385
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 386
    .line 387
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 388
    .line 389
    new-instance v2, Ljava/lang/StringBuilder;

    .line 390
    .line 391
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    const-string v1, " returned no addresses for "

    .line 398
    .line 399
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    throw v0

    .line 413
    :cond_15
    new-instance v0, Ljava/net/SocketException;

    .line 414
    .line 415
    new-instance v1, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    const-string v2, "No route to "

    .line 418
    .line 419
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    const-string v2, ":"

    .line 426
    .line 427
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    const-string v2, "; port is out of range"

    .line 434
    .line 435
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    throw v0

    .line 446
    :cond_16
    new-instance v0, Ljava/net/SocketException;

    .line 447
    .line 448
    const-string v2, "No route to "

    .line 449
    .line 450
    iget-object v3, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 451
    .line 452
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 453
    .line 454
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 455
    .line 456
    const-string v4, "; exhausted proxy configurations: "

    .line 457
    .line 458
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->e:Ljava/util/List;

    .line 459
    .line 460
    new-instance v5, Ljava/lang/StringBuilder;

    .line 461
    .line 462
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .line 479
    .line 480
    .line 481
    throw v0

    .line 482
    :cond_17
    :goto_d
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 483
    .line 484
    .line 485
    move-result v4

    .line 486
    if-eqz v4, :cond_18

    .line 487
    .line 488
    iget-object v4, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->h:Ljava/util/List;

    .line 489
    .line 490
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 491
    .line 492
    .line 493
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->h:Ljava/util/List;

    .line 494
    .line 495
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 496
    .line 497
    .line 498
    :cond_18
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

    .line 499
    .line 500
    invoke-direct {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;-><init>(Ljava/util/List;)V

    .line 501
    .line 502
    .line 503
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

    .line 504
    .line 505
    const/4 v1, 0x1

    .line 506
    goto :goto_e

    .line 507
    :cond_19
    move v1, v2

    .line 508
    :goto_e
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 509
    .line 510
    monitor-enter v3

    .line 511
    :try_start_2
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 512
    .line 513
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d()Z

    .line 514
    .line 515
    .line 516
    move-result v4

    .line 517
    if-nez v4, :cond_26

    .line 518
    .line 519
    if-eqz v1, :cond_1b

    .line 520
    .line 521
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

    .line 522
    .line 523
    if-eqz v1, :cond_1a

    .line 524
    .line 525
    new-instance v4, Ljava/util/ArrayList;

    .line 526
    .line 527
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->a:Ljava/util/List;

    .line 528
    .line 529
    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 530
    .line 531
    .line 532
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 533
    .line 534
    iget-object v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 535
    .line 536
    iget-object v10, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 537
    .line 538
    invoke-virtual {v1, v8, v10, v4, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Ljava/util/List;Z)Z

    .line 539
    .line 540
    .line 541
    move-result v1

    .line 542
    if-eqz v1, :cond_1c

    .line 543
    .line 544
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 545
    .line 546
    iget-object v7, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 547
    .line 548
    const/4 v9, 0x1

    .line 549
    goto :goto_f

    .line 550
    :catchall_2
    move-exception v0

    .line 551
    goto/16 :goto_14

    .line 552
    .line 553
    :cond_1a
    throw v5

    .line 554
    :cond_1b
    move-object v4, v5

    .line 555
    :cond_1c
    :goto_f
    if-nez v9, :cond_1f

    .line 556
    .line 557
    if-nez v6, :cond_1e

    .line 558
    .line 559
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

    .line 560
    .line 561
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->a()Z

    .line 562
    .line 563
    .line 564
    move-result v2

    .line 565
    if-eqz v2, :cond_1d

    .line 566
    .line 567
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->a:Ljava/util/List;

    .line 568
    .line 569
    iget v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->b:I

    .line 570
    .line 571
    add-int/lit8 v7, v6, 0x1

    .line 572
    .line 573
    iput v7, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->b:I

    .line 574
    .line 575
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 576
    .line 577
    .line 578
    move-result-object v1

    .line 579
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 580
    .line 581
    move-object v6, v1

    .line 582
    goto :goto_10

    .line 583
    :cond_1d
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 584
    .line 585
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 586
    .line 587
    .line 588
    throw v0

    .line 589
    :cond_1e
    :goto_10
    new-instance v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 590
    .line 591
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 592
    .line 593
    invoke-direct {v7, v1, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;Lcom/tencent/cloud/ai/network/okhttp3/s;)V

    .line 594
    .line 595
    .line 596
    iput-object v7, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 597
    .line 598
    :cond_1f
    move-object/from16 v16, v7

    .line 599
    .line 600
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 601
    if-eqz v9, :cond_20

    .line 602
    .line 603
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->e:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 604
    .line 605
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 606
    .line 607
    .line 608
    return-object v16

    .line 609
    :cond_20
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->d:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 610
    .line 611
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->e:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 612
    .line 613
    move/from16 v17, p1

    .line 614
    .line 615
    move/from16 v18, p2

    .line 616
    .line 617
    move/from16 v19, p3

    .line 618
    .line 619
    move/from16 v20, p4

    .line 620
    .line 621
    move/from16 v21, p5

    .line 622
    .line 623
    move-object/from16 v22, v1

    .line 624
    .line 625
    move-object/from16 v23, v2

    .line 626
    .line 627
    invoke-virtual/range {v16 .. v23}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(IIIIZLcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V

    .line 628
    .line 629
    .line 630
    move-object/from16 v7, v16

    .line 631
    .line 632
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 633
    .line 634
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    .line 635
    .line 636
    iget-object v2, v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 637
    .line 638
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;->a(Lcom/tencent/cloud/ai/network/okhttp3/s;)V

    .line 639
    .line 640
    .line 641
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 642
    .line 643
    monitor-enter v1

    .line 644
    :try_start_3
    iput-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 645
    .line 646
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 647
    .line 648
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 649
    .line 650
    iget-object v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 651
    .line 652
    const/4 v9, 0x1

    .line 653
    invoke-virtual {v2, v3, v8, v4, v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Ljava/util/List;Z)Z

    .line 654
    .line 655
    .line 656
    move-result v2

    .line 657
    if-eqz v2, :cond_21

    .line 658
    .line 659
    iput-boolean v9, v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 660
    .line 661
    iget-object v5, v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 662
    .line 663
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 664
    .line 665
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 666
    .line 667
    iput-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->j:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 668
    .line 669
    move-object/from16 v16, v2

    .line 670
    .line 671
    goto :goto_12

    .line 672
    :catchall_3
    move-exception v0

    .line 673
    goto :goto_13

    .line 674
    :cond_21
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 675
    .line 676
    if-eqz v2, :cond_25

    .line 677
    .line 678
    sget-boolean v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->h:Z

    .line 679
    .line 680
    if-nez v3, :cond_23

    .line 681
    .line 682
    invoke-static {v2}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 683
    .line 684
    .line 685
    move-result v3

    .line 686
    if-eqz v3, :cond_22

    .line 687
    .line 688
    goto :goto_11

    .line 689
    :cond_22
    new-instance v0, Ljava/lang/AssertionError;

    .line 690
    .line 691
    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    .line 692
    .line 693
    .line 694
    throw v0

    .line 695
    :cond_23
    :goto_11
    iget-boolean v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->f:Z

    .line 696
    .line 697
    if-nez v3, :cond_24

    .line 698
    .line 699
    const/4 v9, 0x1

    .line 700
    iput-boolean v9, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->f:Z

    .line 701
    .line 702
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->g:Ljava/util/concurrent/Executor;

    .line 703
    .line 704
    iget-object v4, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->c:Ljava/lang/Runnable;

    .line 705
    .line 706
    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 707
    .line 708
    .line 709
    :cond_24
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->d:Ljava/util/Deque;

    .line 710
    .line 711
    invoke-interface {v2, v7}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 712
    .line 713
    .line 714
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 715
    .line 716
    invoke-virtual {v2, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;)V

    .line 717
    .line 718
    .line 719
    move-object/from16 v16, v7

    .line 720
    .line 721
    :goto_12
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 722
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 723
    .line 724
    .line 725
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->e:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 726
    .line 727
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 728
    .line 729
    .line 730
    return-object v16

    .line 731
    :cond_25
    :try_start_4
    throw v5

    .line 732
    :goto_13
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 733
    throw v0

    .line 734
    :cond_26
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    .line 735
    .line 736
    const-string v1, "Canceled"

    .line 737
    .line 738
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 739
    .line 740
    .line 741
    throw v0

    .line 742
    :goto_14
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 743
    throw v0

    .line 744
    :cond_27
    :try_start_6
    new-instance v0, Ljava/io/IOException;

    .line 745
    .line 746
    const-string v2, "Canceled"

    .line 747
    .line 748
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 749
    .line 750
    .line 751
    throw v0

    .line 752
    :goto_15
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 753
    throw v0
.end method

.method public final a(IIIIZZ)Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;
    .locals 3

    .line 754
    :goto_0
    invoke-virtual/range {p0 .. p5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a(IIIIZ)Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    move-result-object v0

    .line 755
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    monitor-enter v1

    .line 756
    :try_start_0
    iget v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->m:I

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a()Z

    move-result v2

    if-nez v2, :cond_0

    .line 757
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    .line 758
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 759
    invoke-virtual {v0, p6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 760
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    goto :goto_0

    :cond_1
    return-object v0

    .line 761
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public b()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->j:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return v2

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->j:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return v2

    .line 29
    :cond_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_4

    .line 38
    .line 39
    :cond_2
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_4

    .line 46
    .line 47
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->h:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v2, 0x0

    .line 57
    :cond_4
    :goto_0
    monitor-exit v0

    .line 58
    return v2

    .line 59
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw p0
.end method

.method public final c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/p;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public d()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    const/4 v1, 0x1

    .line 22
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->i:Z

    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method
