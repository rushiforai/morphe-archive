.class public Ll/zrx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zrx$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private d:Landroid/media/MediaCodec;

.field private e:Ll/g220;

.field private f:Ll/dyx;

.field private g:Landroid/view/Surface;

.field private h:Ljava/lang/String;

.field private i:[Ljava/nio/ByteBuffer;

.field private j:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private k:I

.field private l:I

.field private volatile m:Z

.field private n:Ljava/lang/Thread;

.field private o:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ll/g220;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Mp4MuxerWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Ll/zrx;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "video"

    .line 9
    .line 10
    iput-object v0, p0, Ll/zrx;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "audio"

    .line 13
    .line 14
    iput-object v0, p0, Ll/zrx;->c:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 18
    .line 19
    iput-object v0, p0, Ll/zrx;->e:Ll/g220;

    .line 20
    .line 21
    iput-object v0, p0, Ll/zrx;->f:Ll/dyx;

    .line 22
    .line 23
    iput-object v0, p0, Ll/zrx;->g:Landroid/view/Surface;

    .line 24
    .line 25
    iput-object v0, p0, Ll/zrx;->h:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/zrx;->j:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    iput v1, p0, Ll/zrx;->k:I

    .line 36
    .line 37
    iput v1, p0, Ll/zrx;->l:I

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    iput-boolean v1, p0, Ll/zrx;->m:Z

    .line 41
    .line 42
    iput-object v0, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/Object;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/zrx;->o:Ljava/lang/Object;

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    iput-object p1, p0, Ll/zrx;->e:Ll/g220;

    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 57
    .line 58
    const-string p1, "mp4MuxerWrapper format is null"

    .line 59
    .line 60
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0
.end method

.method public static synthetic a(Ll/zrx;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zrx;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/zrx;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zrx;->j:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/zrx;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/zrx;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zrx;->i:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method private i(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 6

    .line 1
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    if-ge v1, p0, :cond_3

    .line 8
    .line 9
    invoke-static {v1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    move v4, v0

    .line 25
    :goto_1
    array-length v5, v3

    .line 26
    if-ge v4, v5, :cond_2

    .line 27
    .line 28
    aget-object v5, v3, v4

    .line 29
    .line 30
    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    return-object v2

    .line 37
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method


# virtual methods
.method public e(Landroid/media/MediaFormat;)Z
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "createMediaCodec "

    .line 6
    .line 7
    const-string v3, "CreateMediaCodec Error ["

    .line 8
    .line 9
    const-string v4, "createMediaCodec "

    .line 10
    .line 11
    const-string v5, "CreateMediaCodec error:"

    .line 12
    .line 13
    const-string v6, "createMediaCodec  line 151"

    .line 14
    .line 15
    const-string v7, "CreateMediaCodec Can\'t find mediacode names = "

    .line 16
    .line 17
    iget-object v8, v1, Ll/zrx;->o:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v8

    .line 20
    const/4 v9, 0x0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "Mp4MuxerWrapper"

    .line 28
    .line 29
    const-string v2, "Media format is null"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    return v9

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto/16 :goto_2

    .line 38
    .line 39
    :cond_0
    const/4 v10, 0x2

    .line 40
    const/4 v11, 0x0

    .line 41
    :try_start_1
    const-string v12, "mime"

    .line 42
    .line 43
    invoke-virtual {v0, v12}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v12

    .line 47
    iput-object v12, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 48
    .line 49
    if-nez v12, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v5, "Mp4MuxerWrapper"

    .line 56
    .line 57
    const-string v6, "Media codec name is null"

    .line 58
    .line 59
    invoke-virtual {v0, v5, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    .line 61
    .line 62
    :try_start_2
    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    return v9

    .line 64
    :catch_0
    move-exception v0

    .line 65
    goto/16 :goto_1

    .line 66
    .line 67
    :cond_1
    :try_start_3
    iget-object v12, v1, Ll/zrx;->f:Ll/dyx;

    .line 68
    .line 69
    if-eqz v12, :cond_2

    .line 70
    .line 71
    invoke-virtual {v12}, Ll/dyx;->b()V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object v12, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 75
    .line 76
    if-eqz v12, :cond_3

    .line 77
    .line 78
    invoke-virtual {v12}, Landroid/media/MediaCodec;->stop()V

    .line 79
    .line 80
    .line 81
    iget-object v12, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 82
    .line 83
    invoke-virtual {v12}, Landroid/media/MediaCodec;->release()V

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-object v12, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 87
    .line 88
    const-string v13, "video"

    .line 89
    .line 90
    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v12
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 94
    iget-object v13, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 95
    .line 96
    const/4 v14, 0x1

    .line 97
    if-eqz v12, :cond_5

    .line 98
    .line 99
    :try_start_4
    invoke-direct {v1, v13}, Ll/zrx;->i(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 100
    .line 101
    .line 102
    move-result-object v12

    .line 103
    if-eqz v12, :cond_4

    .line 104
    .line 105
    invoke-virtual {v12}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    invoke-static {v7}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    iput-object v7, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 114
    .line 115
    iput v10, v1, Ll/zrx;->k:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v5, "Mp4MuxerWrapper"

    .line 123
    .line 124
    new-instance v6, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v7, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    invoke-virtual {v0, v5, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 139
    .line 140
    .line 141
    :try_start_5
    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 142
    return v9

    .line 143
    :cond_5
    :try_start_6
    const-string v7, "audio"

    .line 144
    .line 145
    invoke-virtual {v13, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    move-result v7

    .line 149
    if-eqz v7, :cond_6

    .line 150
    .line 151
    iget-object v7, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v7}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    iput-object v7, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 158
    .line 159
    iput v14, v1, Ll/zrx;->k:I

    .line 160
    .line 161
    :cond_6
    :goto_0
    iget-object v7, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 162
    .line 163
    if-eqz v7, :cond_8

    .line 164
    .line 165
    invoke-virtual {v7, v0, v11, v11, v14}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 166
    .line 167
    .line 168
    iget-object v5, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 169
    .line 170
    const-string v6, "video"

    .line 171
    .line 172
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    if-eqz v5, :cond_7

    .line 177
    .line 178
    const-string v5, "color-format"

    .line 179
    .line 180
    invoke-virtual {v0, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    const v5, 0x7f000789

    .line 185
    .line 186
    .line 187
    if-ne v0, v5, :cond_7

    .line 188
    .line 189
    iget-object v0, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 190
    .line 191
    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, v1, Ll/zrx;->g:Landroid/view/Surface;

    .line 196
    .line 197
    :cond_7
    iget-object v0, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 198
    .line 199
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 200
    .line 201
    .line 202
    iget-object v0, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, v1, Ll/zrx;->i:[Ljava/nio/ByteBuffer;

    .line 209
    .line 210
    new-instance v15, Ll/dyx;

    .line 211
    .line 212
    const-string v16, "live-media-Muxer"

    .line 213
    .line 214
    iget-object v0, v1, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 215
    .line 216
    iget-object v5, v1, Ll/zrx;->e:Ll/g220;

    .line 217
    .line 218
    iget v6, v1, Ll/zrx;->k:I

    .line 219
    .line 220
    iget v7, v1, Ll/zrx;->l:I

    .line 221
    .line 222
    move-object/from16 v17, v0

    .line 223
    .line 224
    move-object/from16 v18, v5

    .line 225
    .line 226
    move/from16 v19, v6

    .line 227
    .line 228
    move/from16 v20, v7

    .line 229
    .line 230
    invoke-direct/range {v15 .. v20}, Ll/dyx;-><init>(Ljava/lang/String;Landroid/media/MediaCodec;Ll/g220;II)V

    .line 231
    .line 232
    .line 233
    iput-object v15, v1, Ll/zrx;->f:Ll/dyx;

    .line 234
    .line 235
    invoke-virtual {v15}, Ljava/lang/Thread;->start()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 236
    .line 237
    .line 238
    :try_start_7
    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 239
    return v14

    .line 240
    :cond_8
    :try_start_8
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    new-instance v7, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget-object v6, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v6

    .line 258
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    invoke-virtual {v0, v6}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    const-string v6, "Mp4MuxerWrapper"

    .line 270
    .line 271
    new-instance v7, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v5, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-virtual {v0, v6, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 286
    .line 287
    .line 288
    :try_start_9
    monitor-exit v8

    .line 289
    return v9

    .line 290
    :goto_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 291
    .line 292
    .line 293
    move-result-object v5

    .line 294
    new-instance v6, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    iget-object v4, v1, Ll/zrx;->h:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    const-string v4, ","

    .line 305
    .line 306
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v4

    .line 320
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v4

    .line 324
    invoke-virtual {v5, v4}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 325
    .line 326
    .line 327
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    const-string v5, "Mp4MuxerWrapper"

    .line 332
    .line 333
    new-instance v6, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    const-string v3, "]"

    .line 346
    .line 347
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v3

    .line 354
    invoke-virtual {v4, v5, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    const/16 v3, 0x1001

    .line 358
    .line 359
    invoke-static {v3}, Ll/p4f;->a(I)V

    .line 360
    .line 361
    .line 362
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 363
    .line 364
    .line 365
    move-result-object v12

    .line 366
    const-string v13, "encoder"

    .line 367
    .line 368
    const-string v14, "create_mediacodec"

    .line 369
    .line 370
    new-instance v3, Ljava/lang/StringBuilder;

    .line 371
    .line 372
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v16

    .line 386
    sget-object v0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 387
    .line 388
    invoke-virtual {v0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 389
    .line 390
    .line 391
    move-result v17

    .line 392
    const/4 v15, 0x1

    .line 393
    invoke-virtual/range {v12 .. v17}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 394
    .line 395
    .line 396
    iget v0, v1, Ll/zrx;->k:I

    .line 397
    .line 398
    const/16 v1, 0x5100

    .line 399
    .line 400
    invoke-static {v1, v0, v10, v11}, Ll/b410;->a(IIILjava/lang/Object;)V

    .line 401
    .line 402
    .line 403
    monitor-exit v8

    .line 404
    return v9

    .line 405
    :goto_2
    monitor-exit v8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 406
    throw v0
.end method

.method public f(Ll/oxd0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/zrx;->j:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Mp4MuxerWrapper"

    .line 10
    .line 11
    const-string p1, "feeding mediacodec null data !"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public g()Landroid/view/Surface;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zrx;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/zrx;->h:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const-string v2, "video"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/zrx;->g:Landroid/view/Surface;

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    monitor-exit v0

    .line 24
    return-object p0

    .line 25
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zrx;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/zrx;->l()V

    .line 10
    .line 11
    .line 12
    iput-object v2, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/zrx;->f:Ll/dyx;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/dyx;->b()V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Ll/zrx;->f:Ll/dyx;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Ll/zrx;->d:Landroid/media/MediaCodec;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    :try_start_1
    invoke-virtual {v1}, Landroid/media/MediaCodec;->signalEndOfInputStream()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    .line 33
    :catch_0
    :try_start_2
    iget-object v1, p0, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/media/MediaCodec;->stop()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    .line 37
    .line 38
    :catch_1
    :try_start_3
    iget-object v1, p0, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 41
    .line 42
    .line 43
    :catch_2
    :try_start_4
    iput-object v2, p0, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 44
    .line 45
    :cond_2
    iput-object v2, p0, Ll/zrx;->e:Ll/g220;

    .line 46
    .line 47
    iput-object v2, p0, Ll/zrx;->h:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 48
    .line 49
    :try_start_5
    iget-object v1, p0, Ll/zrx;->g:Landroid/view/Surface;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/view/Surface;->release()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 54
    .line 55
    .line 56
    :catch_3
    :cond_3
    :try_start_6
    iput-object v2, p0, Ll/zrx;->g:Landroid/view/Surface;

    .line 57
    .line 58
    const/4 v1, -0x1

    .line 59
    iput v1, p0, Ll/zrx;->k:I

    .line 60
    .line 61
    iput v1, p0, Ll/zrx;->l:I

    .line 62
    .line 63
    monitor-exit v0

    .line 64
    return-void

    .line 65
    :goto_1
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 66
    throw p0
.end method

.method public j(I)Z
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRates: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Mp4MuxerWrapper"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    :try_start_0
    new-instance v2, Landroid/os/Bundle;

    .line 22
    .line 23
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v3, "video-bitrate"

    .line 27
    .line 28
    invoke-virtual {v2, v3, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/zrx;->d:Landroid/media/MediaCodec;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :catch_1
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :goto_1
    const-string p1, "setRates failed not susport"

    .line 46
    .line 47
    invoke-static {v1, p1, p0}, Ll/t9c;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    .line 49
    .line 50
    return v0

    .line 51
    :goto_2
    const-string p1, "setRates failed"

    .line 52
    .line 53
    invoke-static {v1, p1, p0}, Ll/t9c;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    .line 55
    .line 56
    return v0
.end method

.method public k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zrx;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Ll/zrx;->m:Z

    .line 10
    .line 11
    new-instance v1, Ljava/lang/Thread;

    .line 12
    .line 13
    new-instance v2, Ll/zrx$a;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/zrx$a;-><init>(Ll/zrx;)V

    .line 16
    .line 17
    .line 18
    const-string v3, "live-media-MCDrain"

    .line 19
    .line 20
    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zrx;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Ll/zrx;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    :try_start_1
    iget-object p0, p0, Ll/zrx;->n:Ljava/lang/Thread;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :catch_0
    move-exception p0

    .line 20
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 26
    throw p0
.end method
