.class Lcom/idv/identity/face/photinus/VideoWriter$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/photinus/VideoWriter;-><init>(Lcom/idv/identity/face/photinus/VideoWriter$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/photinus/VideoWriter;

.field final synthetic b:Lcom/idv/identity/face/photinus/VideoWriter;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/photinus/VideoWriter;Lcom/idv/identity/face/photinus/VideoWriter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->a:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    :catch_0
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->a(Lcom/idv/identity/face/photinus/VideoWriter;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->c(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-wide/16 v0, 0xa

    .line 18
    .line 19
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object v1, Lcom/idv/identity/face/photinus/VideoWriter$b;->a:[I

    .line 24
    .line 25
    iget-object v2, v0, Lcom/idv/identity/face/photinus/VideoWriter$d;->a:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    aget v1, v1, v2

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    const/4 v3, 0x0

    .line 35
    if-eq v1, v2, :cond_8

    .line 36
    .line 37
    const/4 v2, 0x2

    .line 38
    const-string v4, "DTF"

    .line 39
    .line 40
    if-eq v1, v2, :cond_7

    .line 41
    .line 42
    const/4 v0, 0x3

    .line 43
    if-eq v1, v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->n(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-static {v0, v1, v2}, Lcom/idv/identity/face/photinus/VideoWriter;->t(Lcom/idv/identity/face/photinus/VideoWriter;ILl/f6j;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->e(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaCodec;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->e(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaCodec;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 74
    .line 75
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->e(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaCodec;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 83
    .line 84
    invoke-static {v0, v2}, Lcom/idv/identity/face/photinus/VideoWriter;->f(Lcom/idv/identity/face/photinus/VideoWriter;Landroid/media/MediaCodec;)Landroid/media/MediaCodec;

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :catchall_0
    move-exception v0

    .line 89
    goto :goto_3

    .line 90
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->g(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaMuxer;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 99
    .line 100
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->g(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaMuxer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->stop()V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->g(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaMuxer;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 117
    .line 118
    invoke-static {v0, v2}, Lcom/idv/identity/face/photinus/VideoWriter;->h(Lcom/idv/identity/face/photinus/VideoWriter;Landroid/media/MediaMuxer;)Landroid/media/MediaMuxer;

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 122
    .line 123
    invoke-static {v0, v3}, Lcom/idv/identity/face/photinus/VideoWriter;->i(Lcom/idv/identity/face/photinus/VideoWriter;Z)Z

    .line 124
    .line 125
    .line 126
    :cond_4
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 127
    .line 128
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    if-eqz v0, :cond_5

    .line 133
    .line 134
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->a:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 141
    .line 142
    invoke-interface {v0, v1}, Lcom/idv/identity/face/photinus/VideoWriter$c;->a(Lcom/idv/identity/face/photinus/VideoWriter;)V

    .line 143
    .line 144
    .line 145
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string v1, "rCloseMoveFile, took "

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 156
    .line 157
    .line 158
    move-result-wide v1

    .line 159
    iget-object v5, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 160
    .line 161
    invoke-static {v5}, Lcom/idv/identity/face/photinus/VideoWriter;->j(Lcom/idv/identity/face/photinus/VideoWriter;)J

    .line 162
    .line 163
    .line 164
    move-result-wide v5

    .line 165
    sub-long/2addr v1, v5

    .line 166
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v1, "ms"

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v4, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    .line 180
    .line 181
    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 182
    .line 183
    invoke-static {v0, v3}, Lcom/idv/identity/face/photinus/VideoWriter;->b(Lcom/idv/identity/face/photinus/VideoWriter;Z)Z

    .line 184
    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :goto_3
    :try_start_2
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 189
    .line 190
    invoke-static {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    if-eqz v1, :cond_6

    .line 195
    .line 196
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 197
    .line 198
    invoke-static {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-interface {v1, v0}, Lcom/idv/identity/face/photinus/VideoWriter$c;->onException(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 203
    .line 204
    .line 205
    goto :goto_2

    .line 206
    :catchall_1
    move-exception v0

    .line 207
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 208
    .line 209
    invoke-static {p0, v3}, Lcom/idv/identity/face/photinus/VideoWriter;->b(Lcom/idv/identity/face/photinus/VideoWriter;Z)Z

    .line 210
    .line 211
    .line 212
    throw v0

    .line 213
    :cond_7
    :try_start_3
    iget-object v1, v0, Lcom/idv/identity/face/photinus/VideoWriter$d;->c:Ll/f6j;

    .line 214
    .line 215
    iget-object v2, v1, Ll/f6j;->a:[B

    .line 216
    .line 217
    iget-object v3, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 218
    .line 219
    invoke-static {v3}, Lcom/idv/identity/face/photinus/VideoWriter;->q(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    iget-object v5, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 224
    .line 225
    invoke-static {v5}, Lcom/idv/identity/face/photinus/VideoWriter;->r(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    iget-object v6, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 230
    .line 231
    invoke-static {v6}, Lcom/idv/identity/face/photinus/VideoWriter;->s(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 232
    .line 233
    .line 234
    move-result v6

    .line 235
    invoke-static {v2, v3, v5, v6}, Lcom/idv/identity/face/photinus/VideoWriter;->F([BIII)[B

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    iput-object v2, v1, Ll/f6j;->a:[B

    .line 240
    .line 241
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 242
    .line 243
    invoke-static {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->n(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    iget-object v0, v0, Lcom/idv/identity/face/photinus/VideoWriter$d;->c:Ll/f6j;

    .line 248
    .line 249
    invoke-static {v1, v2, v0}, Lcom/idv/identity/face/photinus/VideoWriter;->t(Lcom/idv/identity/face/photinus/VideoWriter;ILl/f6j;)V

    .line 250
    .line 251
    .line 252
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 253
    .line 254
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->p(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 255
    .line 256
    .line 257
    new-instance v0, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .line 261
    .line 262
    const-string v1, "VideoWriter encoded frame "

    .line 263
    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 268
    .line 269
    invoke-static {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->n(Lcom/idv/identity/face/photinus/VideoWriter;)I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-static {v4, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 281
    .line 282
    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :catch_1
    move-exception v0

    .line 286
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 287
    .line 288
    invoke-static {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    if-eqz v1, :cond_0

    .line 293
    .line 294
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 295
    .line 296
    invoke-static {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    invoke-interface {v1, v0}, Lcom/idv/identity/face/photinus/VideoWriter$c;->onException(Ljava/lang/Throwable;)V

    .line 301
    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_8
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 306
    .line 307
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 308
    .line 309
    .line 310
    move-result-wide v4

    .line 311
    invoke-static {v1, v4, v5}, Lcom/idv/identity/face/photinus/VideoWriter;->k(Lcom/idv/identity/face/photinus/VideoWriter;J)J

    .line 312
    .line 313
    .line 314
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 315
    .line 316
    new-instance v2, Ljava/io/File;

    .line 317
    .line 318
    iget-object v0, v0, Lcom/idv/identity/face/photinus/VideoWriter$d;->b:Landroid/net/Uri;

    .line 319
    .line 320
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    invoke-static {v1, v2}, Lcom/idv/identity/face/photinus/VideoWriter;->l(Lcom/idv/identity/face/photinus/VideoWriter;Ljava/io/File;)Ljava/io/File;

    .line 328
    .line 329
    .line 330
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 331
    .line 332
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->m(Lcom/idv/identity/face/photinus/VideoWriter;)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter$a;->b:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 336
    .line 337
    invoke-static {v0, v3}, Lcom/idv/identity/face/photinus/VideoWriter;->o(Lcom/idv/identity/face/photinus/VideoWriter;I)I

    .line 338
    .line 339
    .line 340
    goto/16 :goto_0

    .line 341
    .line 342
    :cond_9
    return-void
.end method
