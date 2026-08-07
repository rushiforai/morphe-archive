.class public Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/vxk;

.field public final b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/c;


# direct methods
.method public constructor <init>(Ll/vxk;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/c;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;IILjava/lang/String;)Ljava/net/Socket;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->i(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;IILjava/lang/String;)Ljava/net/Socket;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->h(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Ljava/lang/String;Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->j(Ljava/lang/String;Ljava/lang/Throwable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public d(Ljava/util/List;)Ljava/net/Socket;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;",
            ">;)",
            "Ljava/net/Socket;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "connecting with "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " resolved addresses"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->e(Ljava/util/List;)Ljava/net/Socket;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_0
    const-string p0, "No addresses provided"

    .line 41
    .line 42
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method

.method public final e(Ljava/util/List;)Ljava/net/Socket;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;",
            ">;)",
            "Ljava/net/Socket;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

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
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->f()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;->IPV6:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 32
    .line 33
    if-ne v4, v5, :cond_0

    .line 34
    .line 35
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v3, "IPv6 addresses="

    .line 46
    .line 47
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v3, ", IPv4 addresses="

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    new-instance v2, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-eqz v4, :cond_2

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    .line 96
    .line 97
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 98
    .line 99
    invoke-virtual {v5}, Ll/vxk;->c()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->f(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;I)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 120
    .line 121
    if-eqz v4, :cond_3

    .line 122
    .line 123
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    .line 128
    .line 129
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 130
    .line 131
    invoke-virtual {v6}, Ll/vxk;->b()I

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    int-to-long v6, v6

    .line 136
    invoke-static {v6, v7, v5}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    new-instance v6, Ll/cx5;

    .line 141
    .line 142
    invoke-direct {v6, p0, v4}, Ll/cx5;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v5, v6}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v4, "starting "

    .line 156
    .line 157
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v4, " connection attempts (IPv6: "

    .line 168
    .line 169
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v0, ", IPv4: "

    .line 180
    .line 181
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v0, ")"

    .line 192
    .line 193
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 204
    .line 205
    invoke-virtual {v0}, Ll/vxk;->a()I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 210
    .line 211
    invoke-virtual {v1}, Ll/vxk;->c()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 220
    .line 221
    invoke-virtual {v1}, Ll/vxk;->b()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    add-int/2addr v0, v1

    .line 226
    add-int/lit16 v0, v0, 0x3e8

    .line 227
    .line 228
    :try_start_0
    invoke-static {v2}, Lrx/c;->amb(Ljava/lang/Iterable;)Lrx/c;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    int-to-long v2, v0

    .line 233
    invoke-virtual {v1, v2, v3, v5}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Lrx/c;->toBlocking()Ll/o43;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {v0}, Ll/o43;->e()Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    check-cast v0, Ljava/net/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 248
    .line 249
    invoke-virtual {v1}, Ll/vxk;->d()Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    if-eqz v1, :cond_5

    .line 254
    .line 255
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    if-eqz v1, :cond_5

    .line 264
    .line 265
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;

    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b()Ljava/net/InetAddress;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    invoke-virtual {v0}, Ljava/net/Socket;->isConnected()Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    if-eqz v3, :cond_4

    .line 284
    .line 285
    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v2

    .line 297
    if-eqz v2, :cond_4

    .line 298
    .line 299
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->f()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/c;

    .line 304
    .line 305
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/c;->c(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;)V

    .line 306
    .line 307
    .line 308
    new-instance v1, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    const-string v2, "connection successful via "

    .line 311
    .line 312
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    :cond_5
    const/4 p1, 0x0

    .line 326
    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 327
    .line 328
    .line 329
    const-string p1, "connection successful"

    .line 330
    .line 331
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    return-object v0

    .line 335
    :catch_0
    move-exception p1

    .line 336
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 337
    .line 338
    .line 339
    new-instance v0, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string v1, "all connection attempts failed: "

    .line 342
    .line 343
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    new-instance p0, Ljava/io/IOException;

    .line 361
    .line 362
    const-string v0, "All connection attempts failed"

    .line 363
    .line 364
    invoke-direct {p0, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 365
    .line 366
    .line 367
    throw p0
.end method

.method public final f(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;I)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;",
            "I)",
            "Lrx/c<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->g(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->e()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "starting attempt to "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " ("

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->f()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ")"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/dx5;

    .line 44
    .line 45
    move-object v1, p0

    .line 46
    move-object v2, p1

    .line 47
    move v4, p2

    .line 48
    invoke-direct/range {v0 .. v5}, Ll/dx5;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;IILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    int-to-long p1, v4

    .line 64
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2, v0}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p1, Ll/ex5;

    .line 71
    .line 72
    invoke-direct {p1, v1, v5}, Ll/ex5;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public final g(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->e()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->f()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;->IPV6:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 14
    .line 15
    if-ne p1, v1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "["

    .line 20
    .line 21
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "]:"

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p0, ":"

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->a:Ll/vxk;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/vxk;->a()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->f(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;I)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;IILjava/lang/String;)Ljava/net/Socket;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/net/Socket;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/net/InetSocketAddress;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->b()Ljava/net/InetAddress;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p3, "attempt to "

    .line 21
    .line 22
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p3, " succeeded via "

    .line 29
    .line 30
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord;->f()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/AddressRecord$AddressType;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public final synthetic j(Ljava/lang/String;Ljava/lang/Throwable;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "attempt to "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, " failed - "

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/happyeyeballs/a;->k(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lrx/c;->never()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final k(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "ConnectionController: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "[live][longlink]"

    .line 16
    .line 17
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
