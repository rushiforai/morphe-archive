.class Lcom/tencent/liteav/network/d$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/b/b;
.implements Lcom/tencent/liteav/network/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/network/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final a:I

.field private b:J

.field private c:J

.field private d:I

.field private e:Z

.field private f:J

.field private g:J

.field private h:J

.field private i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/basic/structs/TXSNALPacket;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/basic/structs/a;",
            ">;"
        }
    .end annotation
.end field

.field private k:Lcom/tencent/liteav/network/TXIStreamDownloader;

.field private l:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/network/d;",
            ">;"
        }
    .end annotation
.end field

.field private m:Lcom/tencent/liteav/network/f;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXIStreamDownloader;Lcom/tencent/liteav/network/d;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tencent/liteav/network/d$b;->a:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    iput v2, p0, Lcom/tencent/liteav/network/d$b;->d:I

    .line 15
    .line 16
    iput-boolean v2, p0, Lcom/tencent/liteav/network/d$b;->e:Z

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->g:J

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->h:J

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/liteav/network/d$b;->i:Ljava/util/ArrayList;

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/tencent/liteav/network/d$b;->j:Ljava/util/ArrayList;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/tencent/liteav/network/d$b;->l:Ljava/lang/ref/WeakReference;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setListener(Lcom/tencent/liteav/network/f;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->l:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/liteav/network/d;

    .line 8
    .line 9
    iget v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const-string v3, " type "

    .line 13
    .line 14
    const-string v4, " from "

    .line 15
    .line 16
    const-string v5, "TXCMultiStreamDownloader"

    .line 17
    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/tencent/liteav/network/d$b;->e:Z

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    iget v1, p0, Lcom/tencent/liteav/network/d$b;->d:I

    .line 25
    .line 26
    add-int/2addr v1, v2

    .line 27
    iput v1, p0, Lcom/tencent/liteav/network/d$b;->d:I

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tencent/liteav/network/d;->a(Lcom/tencent/liteav/network/d;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v6

    .line 35
    iget-wide v8, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 36
    .line 37
    cmp-long v1, v6, v8

    .line 38
    .line 39
    if-lez v1, :cond_0

    .line 40
    .line 41
    iget v1, p0, Lcom/tencent/liteav/network/d$b;->d:I

    .line 42
    .line 43
    const/4 v6, 0x2

    .line 44
    if-ne v1, v6, :cond_1

    .line 45
    .line 46
    :cond_0
    invoke-virtual {v0, v8, v9}, Lcom/tencent/liteav/network/d;->a(J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v6

    .line 50
    iput-wide v6, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 51
    .line 52
    iput-boolean v2, p0, Lcom/tencent/liteav/network/d$b;->e:Z

    .line 53
    .line 54
    :cond_1
    if-eqz v0, :cond_2

    .line 55
    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v6, " stream_switch pre start begin gop "

    .line 59
    .line 60
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget v6, p0, Lcom/tencent/liteav/network/d$b;->d:I

    .line 64
    .line 65
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v6, " last iframe ts "

    .line 69
    .line 70
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Lcom/tencent/liteav/network/d;->a(Lcom/tencent/liteav/network/d;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v6

    .line 77
    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v6, " pts "

    .line 81
    .line 82
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-wide v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 86
    .line 87
    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-wide v6, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 94
    .line 95
    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 102
    .line 103
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static {v5, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    iget-boolean v1, p0, Lcom/tencent/liteav/network/d$b;->e:Z

    .line 114
    .line 115
    if-nez v1, :cond_3

    .line 116
    .line 117
    goto/16 :goto_2

    .line 118
    .line 119
    :cond_3
    if-eqz v0, :cond_4

    .line 120
    .line 121
    iget-wide v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 122
    .line 123
    invoke-virtual {v0, v6, v7}, Lcom/tencent/liteav/network/d;->b(J)V

    .line 124
    .line 125
    .line 126
    :cond_4
    iget-wide v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 127
    .line 128
    iget-wide v8, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 129
    .line 130
    cmp-long v1, v6, v8

    .line 131
    .line 132
    if-ltz v1, :cond_d

    .line 133
    .line 134
    iget v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 135
    .line 136
    const-wide/16 v8, 0x0

    .line 137
    .line 138
    if-nez v1, :cond_5

    .line 139
    .line 140
    iget-wide v10, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 141
    .line 142
    cmp-long v1, v10, v8

    .line 143
    .line 144
    if-nez v1, :cond_5

    .line 145
    .line 146
    iput-wide v6, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 147
    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    const-string v6, " stream_switch pre start end "

    .line 151
    .line 152
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-wide v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 156
    .line 157
    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-wide v6, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 164
    .line 165
    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    iget v6, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 172
    .line 173
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v5, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_5
    iget-wide v6, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 184
    .line 185
    cmp-long v1, v6, v8

    .line 186
    .line 187
    if-lez v1, :cond_d

    .line 188
    .line 189
    iget-object v1, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 190
    .line 191
    if-eqz v1, :cond_c

    .line 192
    .line 193
    if-eqz v0, :cond_6

    .line 194
    .line 195
    iget-object v1, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 196
    .line 197
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/network/d;->a(Lcom/tencent/liteav/network/TXIStreamDownloader;Z)V

    .line 198
    .line 199
    .line 200
    :cond_6
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->j:Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-nez v0, :cond_9

    .line 207
    .line 208
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->j:Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    :cond_7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-eqz v1, :cond_8

    .line 219
    .line 220
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    check-cast v1, Lcom/tencent/liteav/basic/structs/a;

    .line 225
    .line 226
    iget-wide v6, v1, Lcom/tencent/liteav/basic/structs/a;->e:J

    .line 227
    .line 228
    iget-wide v8, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 229
    .line 230
    cmp-long v2, v6, v8

    .line 231
    .line 232
    if-ltz v2, :cond_7

    .line 233
    .line 234
    new-instance v2, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string v6, " stream_switch pre start cache audio pts "

    .line 237
    .line 238
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    iget-wide v6, v1, Lcom/tencent/liteav/basic/structs/a;->e:J

    .line 242
    .line 243
    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget-wide v6, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 250
    .line 251
    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-static {v5, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iget-object v2, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 262
    .line 263
    invoke-interface {v2, v1}, Lcom/tencent/liteav/network/f;->onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V

    .line 264
    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v1, " stream_switch pre start end audio cache  "

    .line 270
    .line 271
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v1, p0, Lcom/tencent/liteav/network/d$b;->j:Ljava/util/ArrayList;

    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->j:Ljava/util/ArrayList;

    .line 291
    .line 292
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 293
    .line 294
    .line 295
    :cond_9
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->i:Ljava/util/ArrayList;

    .line 296
    .line 297
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_b

    .line 302
    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    .line 304
    .line 305
    const-string v1, " stream_switch pre start end video cache  "

    .line 306
    .line 307
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    iget-object v1, p0, Lcom/tencent/liteav/network/d$b;->i:Ljava/util/ArrayList;

    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->i:Ljava/util/ArrayList;

    .line 327
    .line 328
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    if-eqz v1, :cond_a

    .line 337
    .line 338
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    check-cast v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 343
    .line 344
    iget-object v2, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 345
    .line 346
    invoke-interface {v2, v1}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 347
    .line 348
    .line 349
    goto :goto_1

    .line 350
    :cond_a
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->i:Ljava/util/ArrayList;

    .line 351
    .line 352
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 353
    .line 354
    .line 355
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 356
    .line 357
    const-string v1, " stream_switch pre start first pull nal "

    .line 358
    .line 359
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    iget-wide v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 363
    .line 364
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    iget-wide v1, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 371
    .line 372
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    iget v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 379
    .line 380
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 391
    .line 392
    invoke-interface {v0, p1}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 393
    .line 394
    .line 395
    const/4 p1, 0x0

    .line 396
    iput-object p1, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 397
    .line 398
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 399
    .line 400
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V

    .line 401
    .line 402
    .line 403
    return-void

    .line 404
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    const-string v1, " stream_switch pre start cache video pts "

    .line 407
    .line 408
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    iget-wide v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 412
    .line 413
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    iget-wide v1, p0, Lcom/tencent/liteav/network/d$b;->c:J

    .line 420
    .line 421
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    iget v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 428
    .line 429
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->i:Ljava/util/ArrayList;

    .line 440
    .line 441
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    :cond_d
    :goto_2
    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/structs/a;)V
    .locals 7

    if-nez p1, :cond_0

    goto :goto_0

    .line 446
    :cond_0
    iget-wide v0, p1, Lcom/tencent/liteav/basic/structs/a;->e:J

    iget-wide v2, p0, Lcom/tencent/liteav/network/d$b;->c:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_3

    iget-wide v4, p0, Lcom/tencent/liteav/network/d$b;->b:J

    cmp-long v4, v0, v4

    if-gez v4, :cond_1

    goto :goto_0

    .line 447
    :cond_1
    iget-object v4, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    if-eqz v4, :cond_2

    const-wide/16 v5, 0x0

    cmp-long v5, v2, v5

    if-lez v5, :cond_2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 448
    invoke-interface {v4, p1}, Lcom/tencent/liteav/network/f;->onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V

    return-void

    .line 449
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->j:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_0
    return-void
.end method

.method private b(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->l:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/liteav/network/d;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-wide v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/network/d;->c(J)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-wide v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 17
    .line 18
    iget-wide v3, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 19
    .line 20
    cmp-long v3, v1, v3

    .line 21
    .line 22
    if-ltz v3, :cond_5

    .line 23
    .line 24
    iget v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    iput-wide v1, p0, Lcom/tencent/liteav/network/d$b;->g:J

    .line 29
    .line 30
    :cond_1
    iget-wide v1, p0, Lcom/tencent/liteav/network/d$b;->g:J

    .line 31
    .line 32
    const-wide/16 v3, 0x0

    .line 33
    .line 34
    cmp-long v1, v1, v3

    .line 35
    .line 36
    if-lez v1, :cond_4

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/tencent/liteav/network/d$b;->h:J

    .line 39
    .line 40
    cmp-long v1, v1, v3

    .line 41
    .line 42
    const-string v2, " from "

    .line 43
    .line 44
    const-string v3, "TXCMultiStreamDownloader"

    .line 45
    .line 46
    if-lez v1, :cond_3

    .line 47
    .line 48
    new-instance p1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v1, " stream_switch delay stop end video pts "

    .line 51
    .line 52
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-wide v4, p0, Lcom/tencent/liteav/network/d$b;->g:J

    .line 56
    .line 57
    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, " audio ts "

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-wide v4, p0, Lcom/tencent/liteav/network/d$b;->h:J

    .line 66
    .line 67
    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-wide v1, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 74
    .line 75
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {v3, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/tencent/liteav/network/d;->b()V

    .line 88
    .line 89
    .line 90
    :cond_2
    const/4 p1, 0x0

    .line 91
    iput-object p1, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 92
    .line 93
    iget-object v0, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setListener(Lcom/tencent/liteav/network/f;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/tencent/liteav/network/TXIStreamDownloader;->stopDownload()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v1, " stream_switch delay stop video end wait audio end video pts "

    .line 107
    .line 108
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-wide v4, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 112
    .line 113
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-wide v1, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 120
    .line 121
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p0, " type "

    .line 125
    .line 126
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    iget p0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_4
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 143
    .line 144
    if-eqz p0, :cond_6

    .line 145
    .line 146
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_5
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 151
    .line 152
    if-eqz p0, :cond_6

    .line 153
    .line 154
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 155
    .line 156
    .line 157
    :cond_6
    return-void
.end method

.method private b(Lcom/tencent/liteav/basic/structs/a;)V
    .locals 4

    .line 158
    iget-wide v0, p0, Lcom/tencent/liteav/network/d$b;->h:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    iget-wide v0, p0, Lcom/tencent/liteav/network/d$b;->g:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    if-eqz p1, :cond_1

    iget-wide v2, p1, Lcom/tencent/liteav/basic/structs/a;->e:J

    cmp-long v0, v2, v0

    if-ltz v0, :cond_1

    .line 160
    iput-wide v2, p0, Lcom/tencent/liteav/network/d$b;->h:J

    return-void

    .line 161
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    if-eqz p0, :cond_2

    .line 162
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public a(J)V
    .locals 1

    const/4 v0, 0x0

    .line 450
    iput v0, p0, Lcom/tencent/liteav/network/d$b;->d:I

    .line 451
    iput-wide p1, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 452
    iget-object p1, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setListener(Lcom/tencent/liteav/network/f;)V

    .line 453
    iget-object p1, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/network/f;)V
    .locals 0

    .line 445
    iput-object p1, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    return-void
.end method

.method public b(J)V
    .locals 3

    const-wide/16 v0, 0x0

    .line 163
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 164
    iput-wide p1, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 165
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->h:J

    .line 166
    iput-wide v0, p0, Lcom/tencent/liteav/network/d$b;->g:J

    .line 167
    iget-object v2, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    if-eqz v2, :cond_0

    cmp-long p1, p1, v0

    if-nez p1, :cond_0

    .line 168
    invoke-virtual {v2}, Lcom/tencent/liteav/network/TXIStreamDownloader;->stopDownload()V

    const/4 p1, 0x0

    .line 169
    iput-object p1, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    :cond_0
    return-void
.end method

.method public onNotifyEvent(ILandroid/os/Bundle;)V
    .locals 1

    .line 1
    const/16 p2, -0x8fd

    .line 2
    .line 3
    if-eq p1, p2, :cond_1

    .line 4
    .line 5
    const/16 p2, 0xbc2

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/network/d$b;->l:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/tencent/liteav/network/d;

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget-object p2, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, p2, v0}, Lcom/tencent/liteav/network/d;->a(Lcom/tencent/liteav/network/TXIStreamDownloader;Z)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->k:Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/d$b;->a(Lcom/tencent/liteav/basic/structs/a;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-wide v0, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/d$b;->b(Lcom/tencent/liteav/basic/structs/a;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-wide v0, p0, Lcom/tencent/liteav/network/d$b;->b:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/d$b;->a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-wide v0, p0, Lcom/tencent/liteav/network/d$b;->f:J

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-lez v0, :cond_2

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/d$b;->b(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/network/d$b;->m:Lcom/tencent/liteav/network/f;

    .line 27
    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    :goto_0
    return-void
.end method
