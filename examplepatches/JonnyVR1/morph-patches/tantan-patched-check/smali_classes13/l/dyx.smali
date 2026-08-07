.class public Ll/dyx;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dyx$a;
    }
.end annotation


# instance fields
.field private a:Landroid/media/MediaCodec$BufferInfo;

.field private b:Landroid/media/MediaCodec;

.field private c:Ll/g220;

.field private d:I

.field private e:Z

.field private f:I

.field private g:J

.field private h:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/dyx$a;",
            ">;"
        }
    .end annotation
.end field

.field private i:J

.field private j:I

.field private k:Z

.field private l:Z

.field private m:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/media/MediaCodec;Ll/g220;II)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/dyx;->c:Ll/g220;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Ll/dyx;->d:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Ll/dyx;->e:Z

    .line 12
    .line 13
    iput v1, p0, Ll/dyx;->f:I

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    iput-wide v2, p0, Ll/dyx;->g:J

    .line 18
    .line 19
    iput-object p1, p0, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 20
    .line 21
    iput-wide v2, p0, Ll/dyx;->i:J

    .line 22
    .line 23
    iput v1, p0, Ll/dyx;->j:I

    .line 24
    .line 25
    iput-boolean v1, p0, Ll/dyx;->k:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Ll/dyx;->l:Z

    .line 28
    .line 29
    iput v1, p0, Ll/dyx;->m:I

    .line 30
    .line 31
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 32
    .line 33
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/dyx;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 37
    .line 38
    if-eqz p2, :cond_0

    .line 39
    .line 40
    if-eqz p3, :cond_0

    .line 41
    .line 42
    const/4 p1, 0x2

    .line 43
    if-gt p4, p1, :cond_0

    .line 44
    .line 45
    if-lt p4, v0, :cond_0

    .line 46
    .line 47
    iput-object p2, p0, Ll/dyx;->b:Landroid/media/MediaCodec;

    .line 48
    .line 49
    iput-object p3, p0, Ll/dyx;->c:Ll/g220;

    .line 50
    .line 51
    iput p4, p0, Ll/dyx;->d:I

    .line 52
    .line 53
    iput p5, p0, Ll/dyx;->f:I

    .line 54
    .line 55
    new-instance p1, Ljava/util/LinkedList;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 64
    .line 65
    const-string p1, "encoder parameter is null"

    .line 66
    .line 67
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0
.end method

.method private a()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Ll/dyx;->g:J

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-gez p0, :cond_0

    .line 13
    .line 14
    sub-long/2addr v2, v0

    .line 15
    add-long/2addr v2, v0

    .line 16
    return-wide v2

    .line 17
    :cond_0
    return-wide v0
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/dyx;->e:Z

    .line 3
    .line 4
    const-wide/16 v0, 0xbb8

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception v0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public run()V
    .locals 18
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "INFO_OUTPUT_FORMAT_CHANGED "

    .line 4
    .line 5
    const-string v3, "Mp4MuxerWrapper"

    .line 6
    .line 7
    const-string v4, "MediaMuxerThread"

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_6

    .line 18
    .line 19
    iget-boolean v0, v1, Ll/dyx;->e:Z

    .line 20
    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    iget-object v0, v1, Ll/dyx;->b:Landroid/media/MediaCodec;

    .line 24
    .line 25
    if-eqz v0, :cond_6

    .line 26
    .line 27
    const/16 v0, -0x13

    .line 28
    .line 29
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    const/4 v7, 0x1

    .line 34
    :try_start_0
    iget-object v8, v1, Ll/dyx;->b:Landroid/media/MediaCodec;

    .line 35
    .line 36
    iget-object v9, v1, Ll/dyx;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 37
    .line 38
    const-wide/16 v10, 0x2710

    .line 39
    .line 40
    invoke-virtual {v8, v9, v10, v11}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    const/4 v9, -0x3

    .line 45
    if-eq v8, v9, :cond_0

    .line 46
    .line 47
    const/4 v9, -0x2

    .line 48
    if-eq v8, v9, :cond_5

    .line 49
    .line 50
    const/4 v9, -0x1

    .line 51
    if-eq v8, v9, :cond_4

    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v9

    .line 57
    iget-wide v11, v1, Ll/dyx;->i:J

    .line 58
    .line 59
    sub-long/2addr v9, v5

    .line 60
    add-long/2addr v11, v9

    .line 61
    iput-wide v11, v1, Ll/dyx;->i:J

    .line 62
    .line 63
    iget v9, v1, Ll/dyx;->j:I

    .line 64
    .line 65
    add-int/2addr v9, v7

    .line 66
    iput v9, v1, Ll/dyx;->j:I

    .line 67
    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 69
    .line 70
    .line 71
    move-result-wide v5

    .line 72
    iget-object v9, v1, Ll/dyx;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 73
    .line 74
    iget v10, v9, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 75
    .line 76
    if-eq v10, v0, :cond_3

    .line 77
    .line 78
    iget v10, v9, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 79
    .line 80
    if-eqz v10, :cond_3

    .line 81
    .line 82
    invoke-direct {v1}, Ll/dyx;->a()J

    .line 83
    .line 84
    .line 85
    move-result-wide v10

    .line 86
    iput-wide v10, v9, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 87
    .line 88
    iget-object v9, v1, Ll/dyx;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 89
    .line 90
    iget-wide v9, v9, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 91
    .line 92
    iput-wide v9, v1, Ll/dyx;->g:J

    .line 93
    .line 94
    iget-object v9, v1, Ll/dyx;->b:Landroid/media/MediaCodec;

    .line 95
    .line 96
    invoke-virtual {v9}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    aget-object v9, v9, v8

    .line 101
    .line 102
    iget-object v10, v1, Ll/dyx;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 103
    .line 104
    iput-boolean v7, v1, Ll/dyx;->l:Z

    .line 105
    .line 106
    iget-object v11, v1, Ll/dyx;->c:Ll/g220;

    .line 107
    .line 108
    invoke-interface {v11}, Ll/g220;->isStarting()Z

    .line 109
    .line 110
    .line 111
    move-result v11

    .line 112
    if-eqz v11, :cond_2

    .line 113
    .line 114
    iget-object v11, v1, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 115
    .line 116
    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    .line 117
    .line 118
    .line 119
    move-result v11

    .line 120
    if-lez v11, :cond_1

    .line 121
    .line 122
    iget-object v11, v1, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 123
    .line 124
    new-instance v12, Ll/dyx$a;

    .line 125
    .line 126
    invoke-direct {v12, v1, v9, v10}, Ll/dyx$a;-><init>(Ll/dyx;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v11, v12}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object v9, v1, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 133
    .line 134
    invoke-virtual {v9}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v9

    .line 138
    check-cast v9, Ll/dyx$a;

    .line 139
    .line 140
    invoke-virtual {v9}, Ll/dyx$a;->a()Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v10

    .line 144
    invoke-virtual {v9}, Ll/dyx$a;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    move-object/from16 v17, v10

    .line 149
    .line 150
    move-object v10, v9

    .line 151
    move-object/from16 v9, v17

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :catch_0
    move-exception v0

    .line 155
    goto/16 :goto_3

    .line 156
    .line 157
    :cond_1
    :goto_1
    iget-object v11, v1, Ll/dyx;->c:Ll/g220;

    .line 158
    .line 159
    iget v12, v1, Ll/dyx;->f:I

    .line 160
    .line 161
    invoke-interface {v11, v12, v9, v10}, Ll/g220;->B1(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_2
    new-instance v11, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    const-string v12, "media muxer is not starting ! cache data ! Muxer thrad name:"

    .line 171
    .line 172
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v12

    .line 179
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v11

    .line 186
    invoke-static {v4, v11}, Lcom/core/glcore/util/Log4Cam;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    iget-object v11, v1, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 190
    .line 191
    new-instance v12, Ll/dyx$a;

    .line 192
    .line 193
    invoke-direct {v12, v1, v9, v10}, Ll/dyx$a;-><init>(Ll/dyx;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v11, v12}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    :cond_3
    :goto_2
    iget-object v9, v1, Ll/dyx;->b:Landroid/media/MediaCodec;

    .line 200
    .line 201
    const/4 v10, 0x0

    .line 202
    invoke-virtual {v9, v8, v10}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_4
    iget-object v8, v1, Ll/dyx;->c:Ll/g220;

    .line 208
    .line 209
    invoke-interface {v8}, Ll/g220;->isStarting()Z

    .line 210
    .line 211
    .line 212
    move-result v8

    .line 213
    if-eqz v8, :cond_0

    .line 214
    .line 215
    iget-object v8, v1, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 216
    .line 217
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    .line 218
    .line 219
    .line 220
    move-result v8

    .line 221
    if-lez v8, :cond_0

    .line 222
    .line 223
    iget-object v8, v1, Ll/dyx;->h:Ljava/util/LinkedList;

    .line 224
    .line 225
    invoke-virtual {v8}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v8

    .line 229
    check-cast v8, Ll/dyx$a;

    .line 230
    .line 231
    invoke-virtual {v8}, Ll/dyx$a;->a()Ljava/nio/ByteBuffer;

    .line 232
    .line 233
    .line 234
    move-result-object v9

    .line 235
    invoke-virtual {v8}, Ll/dyx$a;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    iget-object v10, v1, Ll/dyx;->c:Ll/g220;

    .line 240
    .line 241
    iget v11, v1, Ll/dyx;->f:I

    .line 242
    .line 243
    invoke-interface {v10, v11, v9, v8}, Ll/g220;->B1(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 244
    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_5
    new-instance v8, Ljava/lang/StringBuilder;

    .line 249
    .line 250
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    iget v9, v1, Ll/dyx;->f:I

    .line 257
    .line 258
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    const-string v9, " start"

    .line 262
    .line 263
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v8

    .line 270
    invoke-static {v3, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    iget v8, v1, Ll/dyx;->f:I

    .line 274
    .line 275
    if-gez v8, :cond_0

    .line 276
    .line 277
    iget-object v8, v1, Ll/dyx;->c:Ll/g220;

    .line 278
    .line 279
    iget-object v9, v1, Ll/dyx;->b:Landroid/media/MediaCodec;

    .line 280
    .line 281
    invoke-virtual {v9}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 282
    .line 283
    .line 284
    move-result-object v9

    .line 285
    iget v10, v1, Ll/dyx;->d:I

    .line 286
    .line 287
    invoke-interface {v8, v9, v10}, Ll/g220;->x0(Landroid/media/MediaFormat;I)I

    .line 288
    .line 289
    .line 290
    move-result v8

    .line 291
    iput v8, v1, Ll/dyx;->f:I

    .line 292
    .line 293
    new-instance v8, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    iget v9, v1, Ll/dyx;->f:I

    .line 302
    .line 303
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    const-string v9, " end"

    .line 307
    .line 308
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v8

    .line 315
    invoke-static {v3, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    iget-object v8, v1, Ll/dyx;->c:Ll/g220;

    .line 319
    .line 320
    invoke-interface {v8}, Ll/g220;->O1()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    .line 322
    .line 323
    goto/16 :goto_0

    .line 324
    .line 325
    :goto_3
    new-instance v7, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    const-string v8, "CreateMediaCodec Error ["

    .line 328
    .line 329
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    const-string v0, "]"

    .line 340
    .line 341
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-static {}, Ll/jq70;->d()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    .line 357
    .line 358
    goto/16 :goto_0

    .line 359
    .line 360
    :catch_1
    iget v8, v1, Ll/dyx;->m:I

    .line 361
    .line 362
    add-int/2addr v8, v7

    .line 363
    iput v8, v1, Ll/dyx;->m:I

    .line 364
    .line 365
    const/4 v9, 0x5

    .line 366
    if-le v8, v9, :cond_0

    .line 367
    .line 368
    iget-boolean v8, v1, Ll/dyx;->l:Z

    .line 369
    .line 370
    if-nez v8, :cond_0

    .line 371
    .line 372
    iget-boolean v8, v1, Ll/dyx;->k:Z

    .line 373
    .line 374
    if-nez v8, :cond_0

    .line 375
    .line 376
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 377
    .line 378
    .line 379
    move-result-object v8

    .line 380
    const-string v9, "MediaMuxerThread IllegalStateException"

    .line 381
    .line 382
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v9

    .line 386
    invoke-virtual {v8, v9}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 387
    .line 388
    .line 389
    const/16 v8, 0x1001

    .line 390
    .line 391
    invoke-static {v8}, Ll/p4f;->a(I)V

    .line 392
    .line 393
    .line 394
    iget v8, v1, Ll/dyx;->d:I

    .line 395
    .line 396
    const/4 v9, 0x0

    .line 397
    const/16 v10, 0x5100

    .line 398
    .line 399
    invoke-static {v10, v8, v0, v9}, Ll/b410;->a(IIILjava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 403
    .line 404
    .line 405
    move-result-object v11

    .line 406
    sget-object v0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 407
    .line 408
    invoke-virtual {v0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 409
    .line 410
    .line 411
    move-result v16

    .line 412
    const-string v12, "encoder"

    .line 413
    .line 414
    const-string v13, "encoder_error"

    .line 415
    .line 416
    const/4 v14, 0x1

    .line 417
    const-string v15, "MediaMuxerThread IllegalStateException"

    .line 418
    .line 419
    invoke-virtual/range {v11 .. v16}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 420
    .line 421
    .line 422
    iput-boolean v7, v1, Ll/dyx;->k:Z

    .line 423
    .line 424
    goto/16 :goto_0

    .line 425
    .line 426
    :cond_6
    return-void
.end method
