.class public Lcom/tencent/liteav/videodecoder/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/videodecoder/b;


# instance fields
.field private a:Landroid/media/MediaCodec$BufferInfo;

.field private b:Landroid/media/MediaCodec;

.field private c:Ljava/lang/String;

.field private d:I

.field private e:I

.field private f:J

.field private g:J

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Landroid/view/Surface;

.field private l:I

.field private m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/basic/structs/TXSNALPacket;",
            ">;"
        }
    .end annotation
.end field

.field private n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private o:J

.field private p:I

.field private q:Lorg/json/JSONArray;

.field private r:Lcom/tencent/liteav/videodecoder/f;

.field private s:Lcom/tencent/liteav/videodecoder/d;

.field private t:Z

.field private u:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 13
    .line 14
    const-string v1, "video/avc"

    .line 15
    .line 16
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/e;->c:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v1, 0x21c

    .line 19
    .line 20
    iput v1, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    .line 21
    .line 22
    const/16 v1, 0x3c0

    .line 23
    .line 24
    iput v1, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    .line 25
    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    iput-wide v1, p0, Lcom/tencent/liteav/videodecoder/e;->f:J

    .line 29
    .line 30
    iput-wide v1, p0, Lcom/tencent/liteav/videodecoder/e;->g:J

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    iput-boolean v3, p0, Lcom/tencent/liteav/videodecoder/e;->h:Z

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    iput-boolean v3, p0, Lcom/tencent/liteav/videodecoder/e;->i:Z

    .line 37
    .line 38
    iput-boolean v3, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 39
    .line 40
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->k:Landroid/view/Surface;

    .line 41
    .line 42
    iput v3, p0, Lcom/tencent/liteav/videodecoder/e;->l:I

    .line 43
    .line 44
    new-instance v4, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v4, p0, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 50
    .line 51
    new-instance v4, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v4, p0, Lcom/tencent/liteav/videodecoder/e;->n:Ljava/util/ArrayList;

    .line 57
    .line 58
    iput-wide v1, p0, Lcom/tencent/liteav/videodecoder/e;->o:J

    .line 59
    .line 60
    iput v3, p0, Lcom/tencent/liteav/videodecoder/e;->p:I

    .line 61
    .line 62
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->q:Lorg/json/JSONArray;

    .line 63
    .line 64
    new-instance v0, Lcom/tencent/liteav/videodecoder/d;

    .line 65
    .line 66
    invoke-direct {v0}, Lcom/tencent/liteav/videodecoder/d;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->s:Lcom/tencent/liteav/videodecoder/d;

    .line 70
    .line 71
    iput-boolean v3, p0, Lcom/tencent/liteav/videodecoder/e;->t:Z

    .line 72
    .line 73
    return-void
.end method

.method private a(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Z)I
    .locals 7

    .line 1
    const-string v0, "MediaCodecDecoder"

    .line 2
    .line 3
    const-string v1, "decode: init decoder error, can not init for decoder="

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, -0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    :try_start_0
    iget-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 9
    .line 10
    if-nez v5, :cond_5

    .line 11
    .line 12
    iget-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->k:Landroid/view/Surface;

    .line 13
    .line 14
    if-nez v5, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iput-boolean p3, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 19
    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    const-string p3, "video/hevc"

    .line 23
    .line 24
    iput-object p3, p0, Lcom/tencent/liteav/videodecoder/e;->c:Ljava/lang/String;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p1

    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_1
    const-string p3, "video/avc"

    .line 31
    .line 32
    iput-object p3, p0, Lcom/tencent/liteav/videodecoder/e;->c:Ljava/lang/String;

    .line 33
    .line 34
    :goto_0
    iget-object p3, p0, Lcom/tencent/liteav/videodecoder/e;->c:Ljava/lang/String;

    .line 35
    .line 36
    iget v1, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    .line 37
    .line 38
    iget v5, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    .line 39
    .line 40
    invoke-static {p3, v1, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    const-string v1, "csd-0"

    .line 47
    .line 48
    invoke-virtual {p3, v1, p1}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    if-eqz p2, :cond_3

    .line 52
    .line 53
    const-string p1, "csd-1"

    .line 54
    .line 55
    invoke-virtual {p3, p1, p2}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->q:Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    if-eqz p1, :cond_4

    .line 61
    .line 62
    move p2, v4

    .line 63
    :goto_1
    :try_start_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-ge p2, v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-string v5, "key"

    .line 74
    .line 75
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    const-string v6, "value"

    .line 80
    .line 81
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {p3, v5, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 86
    .line 87
    .line 88
    add-int/lit8 p2, p2, 0x1

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catch_1
    move-exception p1

    .line 92
    :try_start_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v1, "config custom format error "

    .line 98
    .line 99
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->c:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 123
    .line 124
    const/4 p2, 0x1

    .line 125
    :try_start_3
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/e;->k:Landroid/view/Surface;

    .line 126
    .line 127
    invoke-virtual {p1, p3, v1, v2, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 128
    .line 129
    .line 130
    const/4 p1, 0x2

    .line 131
    :try_start_4
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 132
    .line 133
    invoke-virtual {v1, p2}, Landroid/media/MediaCodec;->setVideoScalingMode(I)V

    .line 134
    .line 135
    .line 136
    const/4 p1, 0x3

    .line 137
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 138
    .line 139
    invoke-virtual {p2}, Landroid/media/MediaCodec;->start()V

    .line 140
    .line 141
    .line 142
    const/4 p1, 0x4

    .line 143
    new-instance p2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v1, "decode: start decoder success, is hevc: "

    .line 149
    .line 150
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget-boolean v1, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 154
    .line 155
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v1, " w = "

    .line 159
    .line 160
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget v1, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    .line 164
    .line 165
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v1, " h = "

    .line 169
    .line 170
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget v1, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    .line 174
    .line 175
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v1, ", format = "

    .line 179
    .line 180
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p3}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p3

    .line 187
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 195
    .line 196
    .line 197
    :try_start_5
    iput v4, p0, Lcom/tencent/liteav/videodecoder/e;->l:I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 198
    .line 199
    goto/16 :goto_8

    .line 200
    .line 201
    :catch_2
    move-exception p2

    .line 202
    move v3, v4

    .line 203
    :goto_2
    move v4, p1

    .line 204
    move-object p1, p2

    .line 205
    goto :goto_4

    .line 206
    :catch_3
    move-exception p2

    .line 207
    goto :goto_2

    .line 208
    :catch_4
    move-exception p1

    .line 209
    move v4, p2

    .line 210
    goto :goto_4

    .line 211
    :cond_5
    :goto_3
    :try_start_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 217
    .line 218
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string p2, ",surface="

    .line 222
    .line 223
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/e;->k:Landroid/view/Surface;

    .line 227
    .line 228
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 236
    .line 237
    .line 238
    return v3

    .line 239
    :goto_4
    iget-object p2, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 240
    .line 241
    if-eqz p2, :cond_6

    .line 242
    .line 243
    :try_start_7
    invoke-virtual {p2}, Landroid/media/MediaCodec;->release()V

    .line 244
    .line 245
    .line 246
    const-string p2, "decode: , decoder release success"

    .line 247
    .line 248
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 249
    .line 250
    .line 251
    :goto_5
    iput-object v2, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 252
    .line 253
    goto :goto_7

    .line 254
    :catchall_0
    move-exception p1

    .line 255
    goto :goto_6

    .line 256
    :catch_5
    :try_start_8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 259
    .line 260
    .line 261
    const-string p3, "decode: , decoder release exception: "

    .line 262
    .line 263
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p3

    .line 270
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p2

    .line 277
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 278
    .line 279
    .line 280
    goto :goto_5

    .line 281
    :goto_6
    iput-object v2, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 282
    .line 283
    throw p1

    .line 284
    :cond_6
    :goto_7
    new-instance p2, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    const-string p3, "decode: init decoder "

    .line 287
    .line 288
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string p3, " step exception: "

    .line 295
    .line 296
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p3

    .line 303
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 314
    .line 315
    .line 316
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->f()V

    .line 317
    .line 318
    .line 319
    move v4, v3

    .line 320
    :goto_8
    return v4
.end method

.method private a()V
    .locals 7

    .line 325
    const-string v0, "decode: release decoder sucess"

    const-string v1, "MediaCodecDecoder"

    const-string v2, "decode: release decoder exception: "

    const-string v3, "decode: stop decoder Exception: "

    iget-object v4, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    if-eqz v4, :cond_0

    const/4 v5, 0x0

    .line 326
    :try_start_0
    invoke-virtual {v4}, Landroid/media/MediaCodec;->stop()V

    .line 327
    const-string v4, "decode: stop decoder sucess"

    invoke-static {v1, v4}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 328
    :try_start_1
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 329
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 330
    :goto_0
    iput-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 331
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 332
    :goto_1
    iput-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 333
    throw v0

    :catchall_1
    move-exception v3

    goto :goto_4

    :catch_1
    move-exception v4

    .line 334
    :try_start_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 335
    :try_start_4
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 336
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    .line 337
    :try_start_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_0

    .line 338
    :goto_2
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const-wide/16 v0, 0x0

    .line 339
    iput-wide v0, p0, Lcom/tencent/liteav/videodecoder/e;->f:J

    const/4 v0, 0x1

    .line 340
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->h:Z

    return-void

    .line 341
    :goto_3
    iput-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 342
    throw v0

    .line 343
    :goto_4
    :try_start_6
    iget-object v4, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    invoke-virtual {v4}, Landroid/media/MediaCodec;->release()V

    .line 344
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 345
    :goto_5
    iput-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    goto :goto_6

    :catchall_3
    move-exception v0

    goto :goto_7

    :catch_3
    move-exception v0

    .line 346
    :try_start_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_5

    .line 347
    :goto_6
    throw v3

    .line 348
    :goto_7
    iput-object v5, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 349
    throw v0

    :cond_0
    return-void
.end method

.method private a(IJJI)V
    .locals 11

    .line 350
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 351
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->a:Landroid/media/MediaCodec$BufferInfo;

    iget p1, p1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 p1, p1, 0x4

    const-string v1, "MediaCodecDecoder"

    if-eqz p1, :cond_0

    .line 352
    const-string p1, "output EOS"

    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/videodecoder/e;->r:Lcom/tencent/liteav/videodecoder/f;

    if-eqz v2, :cond_1

    .line 354
    iget v4, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    iget v5, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    const/4 v3, 0x0

    move-wide v6, p2

    move-wide v8, p4

    move/from16 v10, p6

    invoke-interface/range {v2 .. v10}, Lcom/tencent/liteav/videodecoder/f;->onDecodeFrame(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;IIJJI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 355
    const-string p2, "onDecodeFrame failed."

    invoke-static {v1, p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 356
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->d()V

    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 8

    .line 365
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->t:Z

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 366
    :cond_0
    iget v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    if-nez v0, :cond_9

    const/4 v0, 0x0

    move v1, v0

    .line 367
    :goto_0
    :try_start_0
    iget-object v2, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    array-length v3, v2

    const/4 v4, 0x1

    if-ge v1, v3, :cond_3

    .line 368
    aget-byte v3, v2, v1

    const/4 v5, 0x7

    if-nez v3, :cond_1

    add-int/lit8 v6, v1, 0x1

    aget-byte v6, v2, v6

    if-nez v6, :cond_1

    add-int/lit8 v6, v1, 0x2

    aget-byte v6, v2, v6

    if-nez v6, :cond_1

    add-int/lit8 v6, v1, 0x3

    aget-byte v6, v2, v6

    if-ne v6, v4, :cond_1

    add-int/lit8 v6, v1, 0x4

    aget-byte v7, v2, v6

    and-int/lit8 v7, v7, 0x1f

    if-ne v7, v5, :cond_1

    goto :goto_1

    :cond_1
    if-nez v3, :cond_2

    add-int/lit8 v3, v1, 0x1

    .line 369
    aget-byte v3, v2, v3

    if-nez v3, :cond_2

    add-int/lit8 v3, v1, 0x2

    aget-byte v3, v2, v3

    if-nez v3, :cond_2

    add-int/lit8 v6, v1, 0x3

    aget-byte v3, v2, v6

    and-int/lit8 v3, v3, 0x1f

    if-ne v3, v5, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_3
    const/4 v6, -0x1

    :goto_1
    if-ltz v6, :cond_9

    .line 370
    array-length v1, v2

    sub-int/2addr v1, v6

    move v2, v6

    .line 371
    :goto_2
    iget-object v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    array-length v5, v3

    if-ge v2, v5, :cond_7

    .line 372
    aget-byte v5, v3, v2

    if-nez v5, :cond_4

    add-int/lit8 v7, v2, 0x1

    aget-byte v7, v3, v7

    if-nez v7, :cond_4

    add-int/lit8 v7, v2, 0x2

    aget-byte v7, v3, v7

    if-eq v7, v4, :cond_5

    :cond_4
    if-nez v5, :cond_6

    add-int/lit8 v5, v2, 0x1

    aget-byte v5, v3, v5

    if-nez v5, :cond_6

    add-int/lit8 v5, v2, 0x2

    aget-byte v5, v3, v5

    if-nez v5, :cond_6

    add-int/lit8 v5, v2, 0x3

    aget-byte v5, v3, v5

    if-ne v5, v4, :cond_6

    :cond_5
    sub-int v1, v2, v6

    goto :goto_3

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 373
    :cond_7
    :goto_3
    new-array v2, v1, [B

    .line 374
    invoke-static {v3, v6, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 375
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/e;->s:Lcom/tencent/liteav/videodecoder/d;

    invoke-virtual {p0, v2}, Lcom/tencent/liteav/videodecoder/d;->a([B)[B

    move-result-object p0

    if-eqz p0, :cond_9

    .line 376
    iget-object v2, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    array-length v3, v2

    array-length v4, p0

    add-int/2addr v3, v4

    sub-int/2addr v3, v1

    new-array v3, v3, [B

    if-lez v6, :cond_8

    .line 377
    invoke-static {v2, v0, v3, v0, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 378
    :cond_8
    array-length v2, p0

    invoke-static {p0, v0, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 379
    iget-object v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    add-int v2, v6, v1

    array-length p0, p0

    add-int/2addr p0, v6

    array-length v4, v0

    sub-int/2addr v4, v1

    sub-int/2addr v4, v6

    invoke-static {v0, v2, v3, p0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 380
    iput-object v3, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 381
    const-string p1, "MediaCodecDecoder"

    const-string v0, "modify dec buffer error "

    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    :goto_4
    return-void
.end method

.method private a(Z)V
    .locals 1

    .line 357
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    if-eq v0, p1, :cond_2

    .line 358
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 359
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->i:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 360
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->e()Z

    move-result p1

    if-nez p1, :cond_1

    .line 361
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->a()V

    .line 362
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->f()V

    return-void

    .line 363
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->a()V

    .line 364
    iget-boolean p1, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, p1}, Lcom/tencent/liteav/videodecoder/e;->a(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Z)I

    :cond_2
    :goto_0
    return-void
.end method

.method private b()V
    .locals 22
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 4
    .line 5
    const-string v2, "MediaCodecDecoder"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "null decoder"

    .line 10
    .line 11
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    move-object v3, v0

    .line 23
    check-cast v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 24
    .line 25
    if-eqz v3, :cond_e

    .line 26
    .line 27
    iget-object v0, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 28
    .line 29
    array-length v0, v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto/16 :goto_a

    .line 33
    .line 34
    :cond_1
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 35
    .line 36
    .line 37
    move-result-wide v9

    .line 38
    iget-wide v4, v1, Lcom/tencent/liteav/videodecoder/e;->o:J

    .line 39
    .line 40
    const-wide/16 v11, 0x0

    .line 41
    .line 42
    cmp-long v0, v4, v11

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iput-wide v9, v1, Lcom/tencent/liteav/videodecoder/e;->o:J

    .line 47
    .line 48
    :cond_2
    :try_start_0
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_0
    move-object v4, v0

    .line 55
    goto :goto_1

    .line 56
    :catch_0
    move-exception v0

    .line 57
    new-instance v4, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v5, "decode: getInputBuffers Exception!! "

    .line 60
    .line 61
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    goto :goto_0

    .line 80
    :goto_1
    if-eqz v4, :cond_d

    .line 81
    .line 82
    array-length v0, v4

    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    goto/16 :goto_9

    .line 86
    .line 87
    :cond_3
    const-wide/16 v5, 0x2710

    .line 88
    .line 89
    const/16 v7, -0x2710

    .line 90
    .line 91
    :try_start_1
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 92
    .line 93
    invoke-virtual {v0, v5, v6}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 94
    .line 95
    .line 96
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 97
    move v14, v0

    .line 98
    goto :goto_2

    .line 99
    :catch_1
    move-exception v0

    .line 100
    new-instance v13, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v14, "decode: dequeueInputBuffer Exception!! "

    .line 103
    .line 104
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    move v14, v7

    .line 122
    :goto_2
    if-ltz v14, :cond_4

    .line 123
    .line 124
    aget-object v0, v4, v14

    .line 125
    .line 126
    iget-object v4, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 127
    .line 128
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    :try_start_2
    iget-object v13, v1, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 132
    .line 133
    iget-object v0, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 134
    .line 135
    array-length v0, v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 136
    move-wide/from16 v20, v11

    .line 137
    .line 138
    :try_start_3
    iget-wide v11, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 139
    .line 140
    const/16 v19, 0x0

    .line 141
    .line 142
    const/4 v15, 0x0

    .line 143
    move/from16 v16, v0

    .line 144
    .line 145
    move-wide/from16 v17, v11

    .line 146
    .line 147
    invoke-virtual/range {v13 .. v19}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 148
    .line 149
    .line 150
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 153
    .line 154
    .line 155
    goto :goto_3

    .line 156
    :catch_2
    move-wide/from16 v20, v11

    .line 157
    .line 158
    :catch_3
    invoke-direct {v1}, Lcom/tencent/liteav/videodecoder/e;->g()V

    .line 159
    .line 160
    .line 161
    :goto_3
    iget-wide v11, v1, Lcom/tencent/liteav/videodecoder/e;->f:J

    .line 162
    .line 163
    cmp-long v0, v11, v20

    .line 164
    .line 165
    if-nez v0, :cond_5

    .line 166
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v4, "decode: input buffer available, dequeueInputBuffer index: "

    .line 170
    .line 171
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_4
    move-wide/from16 v20, v11

    .line 186
    .line 187
    const-string v0, "decode: input buffer not available, dequeueInputBuffer failed"

    .line 188
    .line 189
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_5
    :goto_4
    :try_start_4
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 193
    .line 194
    iget-object v4, v1, Lcom/tencent/liteav/videodecoder/e;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 195
    .line 196
    invoke-virtual {v0, v4, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 197
    .line 198
    .line 199
    move-result v7
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 200
    goto :goto_5

    .line 201
    :catch_4
    move-exception v0

    .line 202
    invoke-direct {v1}, Lcom/tencent/liteav/videodecoder/e;->g()V

    .line 203
    .line 204
    .line 205
    new-instance v4, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    const-string v5, "decode: dequeueOutputBuffer exception!!"

    .line 208
    .line 209
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :goto_5
    if-ltz v7, :cond_6

    .line 223
    .line 224
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 225
    .line 226
    iget-wide v4, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 227
    .line 228
    iget v0, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->rotation:I

    .line 229
    .line 230
    move-wide v3, v4

    .line 231
    move-wide v5, v3

    .line 232
    move v2, v7

    .line 233
    move v7, v0

    .line 234
    invoke-direct/range {v1 .. v7}, Lcom/tencent/liteav/videodecoder/e;->a(IJJI)V

    .line 235
    .line 236
    .line 237
    iput v8, v1, Lcom/tencent/liteav/videodecoder/e;->l:I

    .line 238
    .line 239
    goto :goto_7

    .line 240
    :cond_6
    const/4 v0, -0x1

    .line 241
    if-ne v7, v0, :cond_7

    .line 242
    .line 243
    const-wide/16 v3, 0xa

    .line 244
    .line 245
    :try_start_5
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_5

    .line 246
    .line 247
    .line 248
    goto :goto_6

    .line 249
    :catch_5
    move-exception v0

    .line 250
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 251
    .line 252
    .line 253
    :goto_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v3, "decode: no output from decoder available when timeout fail count "

    .line 256
    .line 257
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    iget v3, v1, Lcom/tencent/liteav/videodecoder/e;->l:I

    .line 261
    .line 262
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-direct {v1}, Lcom/tencent/liteav/videodecoder/e;->g()V

    .line 273
    .line 274
    .line 275
    goto :goto_7

    .line 276
    :cond_7
    const/4 v0, -0x3

    .line 277
    if-ne v7, v0, :cond_8

    .line 278
    .line 279
    const-string v0, "decode: output buffers changed"

    .line 280
    .line 281
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    goto :goto_7

    .line 285
    :cond_8
    const/4 v0, -0x2

    .line 286
    if-ne v7, v0, :cond_9

    .line 287
    .line 288
    invoke-direct {v1}, Lcom/tencent/liteav/videodecoder/e;->c()V

    .line 289
    .line 290
    .line 291
    goto :goto_7

    .line 292
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const-string v3, "decode: unexpected result from decoder.dequeueOutputBuffer: "

    .line 295
    .line 296
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :goto_7
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 310
    .line 311
    .line 312
    move-result-wide v2

    .line 313
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->n:Ljava/util/ArrayList;

    .line 314
    .line 315
    sub-long v4, v2, v9

    .line 316
    .line 317
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    iget-wide v4, v1, Lcom/tencent/liteav/videodecoder/e;->o:J

    .line 325
    .line 326
    const-wide/16 v6, 0x3e8

    .line 327
    .line 328
    add-long/2addr v4, v6

    .line 329
    cmp-long v0, v2, v4

    .line 330
    .line 331
    if-lez v0, :cond_c

    .line 332
    .line 333
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->n:Ljava/util/ArrayList;

    .line 334
    .line 335
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    move-wide/from16 v11, v20

    .line 340
    .line 341
    :cond_a
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 342
    .line 343
    .line 344
    move-result v4

    .line 345
    if-eqz v4, :cond_b

    .line 346
    .line 347
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v4

    .line 351
    check-cast v4, Ljava/lang/Long;

    .line 352
    .line 353
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 354
    .line 355
    .line 356
    move-result-wide v5

    .line 357
    cmp-long v5, v5, v11

    .line 358
    .line 359
    if-lez v5, :cond_a

    .line 360
    .line 361
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 362
    .line 363
    .line 364
    move-result-wide v4

    .line 365
    move-wide v11, v4

    .line 366
    goto :goto_8

    .line 367
    :cond_b
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->n:Ljava/util/ArrayList;

    .line 368
    .line 369
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 370
    .line 371
    .line 372
    iput-wide v2, v1, Lcom/tencent/liteav/videodecoder/e;->o:J

    .line 373
    .line 374
    const-wide/16 v2, 0x3

    .line 375
    .line 376
    mul-long/2addr v11, v2

    .line 377
    long-to-int v0, v11

    .line 378
    iput v0, v1, Lcom/tencent/liteav/videodecoder/e;->p:I

    .line 379
    .line 380
    :cond_c
    return-void

    .line 381
    :cond_d
    :goto_9
    const-string v0, "decode: getInputBuffers failed"

    .line 382
    .line 383
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    return-void

    .line 387
    :cond_e
    :goto_a
    const-string v0, "decode: empty buffer"

    .line 388
    .line 389
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    iget-object v0, v1, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 393
    .line 394
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    return-void
.end method

.method private c()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->b:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "decode output format changed: "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "MediaCodecDecoder"

    .line 22
    .line 23
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v1, "crop-right"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const-string v3, "crop-left"

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    sub-int/2addr v1, v3

    .line 39
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    const-string v3, "crop-bottom"

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const-string v4, "crop-top"

    .line 52
    .line 53
    invoke-virtual {v0, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    sub-int/2addr v3, v4

    .line 58
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    const-string v4, "width"

    .line 65
    .line 66
    invoke-virtual {v0, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const-string v5, "height"

    .line 71
    .line 72
    invoke-virtual {v0, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget v3, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    .line 85
    .line 86
    if-ne v1, v3, :cond_2

    .line 87
    .line 88
    iget v4, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    .line 89
    .line 90
    if-eq v0, v4, :cond_0

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->h:Z

    .line 94
    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->h:Z

    .line 99
    .line 100
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/e;->r:Lcom/tencent/liteav/videodecoder/f;

    .line 101
    .line 102
    if-eqz p0, :cond_1

    .line 103
    .line 104
    invoke-interface {p0, v3, v4}, Lcom/tencent/liteav/videodecoder/f;->onVideoSizeChange(II)V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void

    .line 108
    :cond_2
    :goto_0
    iput v1, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    .line 109
    .line 110
    iput v0, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    .line 111
    .line 112
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/e;->r:Lcom/tencent/liteav/videodecoder/f;

    .line 113
    .line 114
    if-eqz p0, :cond_3

    .line 115
    .line 116
    invoke-interface {p0, v1, v0}, Lcom/tencent/liteav/videodecoder/f;->onVideoSizeChange(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :catch_0
    move-exception p0

    .line 121
    const-string v3, "onVideoSizeChange failed."

    .line 122
    .line 123
    invoke-static {v2, v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    :cond_3
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v3, "decode: video size change to w:"

    .line 129
    .line 130
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v1, ",h:"

    .line 137
    .line 138
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method private d()V
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/e;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const-string v1, "MediaCodecDecoder"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "decode first frame sucess"

    .line 12
    .line 13
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    iget-wide v6, p0, Lcom/tencent/liteav/videodecoder/e;->f:J

    .line 21
    .line 22
    cmp-long v0, v6, v2

    .line 23
    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    const-wide/16 v8, 0x3e8

    .line 27
    .line 28
    add-long/2addr v6, v8

    .line 29
    cmp-long v0, v4, v6

    .line 30
    .line 31
    if-lez v0, :cond_1

    .line 32
    .line 33
    iget-wide v6, p0, Lcom/tencent/liteav/videodecoder/e;->g:J

    .line 34
    .line 35
    const-wide/16 v8, 0x7d0

    .line 36
    .line 37
    add-long/2addr v8, v6

    .line 38
    cmp-long v0, v4, v8

    .line 39
    .line 40
    if-lez v0, :cond_1

    .line 41
    .line 42
    cmp-long v0, v6, v2

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v6, "frame interval["

    .line 49
    .line 50
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-wide v6, p0, Lcom/tencent/liteav/videodecoder/e;->f:J

    .line 54
    .line 55
    sub-long v6, v4, v6

    .line 56
    .line 57
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v6, "] > 1000"

    .line 61
    .line 62
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iput-wide v4, p0, Lcom/tencent/liteav/videodecoder/e;->g:J

    .line 73
    .line 74
    :cond_1
    iget-wide v0, p0, Lcom/tencent/liteav/videodecoder/e;->g:J

    .line 75
    .line 76
    cmp-long v0, v0, v2

    .line 77
    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    iput-wide v4, p0, Lcom/tencent/liteav/videodecoder/e;->g:J

    .line 81
    .line 82
    :cond_2
    iput-wide v4, p0, Lcom/tencent/liteav/videodecoder/e;->f:J

    .line 83
    .line 84
    return-void
.end method

.method private e()Z
    .locals 10

    .line 1
    new-instance p0, Landroid/media/MediaCodecList;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, v0}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    array-length v1, p0

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    :goto_0
    if-ge v3, v1, :cond_2

    .line 15
    .line 16
    aget-object v4, p0, v3

    .line 17
    .line 18
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    array-length v6, v5

    .line 23
    move v7, v2

    .line 24
    :goto_1
    if-ge v7, v6, :cond_1

    .line 25
    .line 26
    aget-object v8, v5, v7

    .line 27
    .line 28
    const-string v9, "video/hevc"

    .line 29
    .line 30
    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    if-eqz v8, :cond_0

    .line 35
    .line 36
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "decode: video/hevc MediaCodecInfo: "

    .line 39
    .line 40
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, ",encoder:"

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v1, "MediaCodecDecoder"

    .line 67
    .line 68
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return v0

    .line 72
    :cond_0
    add-int/lit8 v7, v7, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    return v2
.end method

.method private f()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "decode: hw decode error, hevc: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "MediaCodecDecoder"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 27
    .line 28
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/e;->u:Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const/16 v0, -0x900

    .line 33
    .line 34
    const-string v2, "h265 Decoding failed"

    .line 35
    .line 36
    invoke-static {v1, v0, v2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/16 v0, 0x83a

    .line 41
    .line 42
    const-string v2, "Failed to enable hardware decoding\uff0cuse software decoding."

    .line 43
    .line 44
    invoke-static {v1, v0, v2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/tencent/liteav/videodecoder/e;->i:Z

    .line 49
    .line 50
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/e;->r:Lcom/tencent/liteav/videodecoder/f;

    .line 51
    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    const/4 v0, -0x1

    .line 55
    invoke-interface {p0, v0}, Lcom/tencent/liteav/videodecoder/f;->onDecodeFailed(I)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method private g()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/videodecoder/e;->l:I

    .line 2
    .line 3
    const/16 v1, 0x28

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->f()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/tencent/liteav/videodecoder/e;->l:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/liteav/videodecoder/e;->l:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public GetDecodeCost()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videodecoder/e;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public a(II)V
    .locals 0

    if-lez p1, :cond_0

    if-lez p2, :cond_0

    .line 321
    iput p1, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    .line 322
    iput p2, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    .line 323
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "decode: init with video size: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, p0, Lcom/tencent/liteav/videodecoder/e;->d:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/tencent/liteav/videodecoder/e;->e:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "MediaCodecDecoder"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public a(Lorg/json/JSONArray;)V
    .locals 0

    .line 324
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->q:Lorg/json/JSONArray;

    return-void
.end method

.method public config(Landroid/view/Surface;)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->k:Landroid/view/Surface;

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public decode(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    invoke-direct {p0, v1}, Lcom/tencent/liteav/videodecoder/e;->a(Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/tencent/liteav/videodecoder/e;->a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    :try_start_0
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->b()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catch_0
    move-exception v0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "decode: doDecode Exception!! "

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "MediaCodecDecoder"

    .line 57
    .line 58
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/e;->m:Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-ne p1, v0, :cond_1

    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public enableLimitDecCache(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/e;->t:Z

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "decode: enable limit dec cache: "

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "MediaCodecDecoder"

    .line 18
    .line 19
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public isHevc()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/videodecoder/e;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public setListener(Lcom/tencent/liteav/videodecoder/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->r:Lcom/tencent/liteav/videodecoder/f;

    .line 2
    .line 3
    return-void
.end method

.method public setNotifyListener(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/e;->u:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-void
.end method

.method public start(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ZZ)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p4}, Lcom/tencent/liteav/videodecoder/e;->a(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public stop()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/e;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
