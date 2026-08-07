.class Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;
.super Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;-><init>(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    const-string v0, "create audio track, samplerate:"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$100(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x1

    .line 11
    const/4 v4, 0x2

    .line 12
    if-ne v1, v3, :cond_0

    .line 13
    .line 14
    move v8, v4

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v8, v2

    .line 17
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$200(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/16 v5, 0x8

    .line 24
    .line 25
    if-ne v1, v5, :cond_1

    .line 26
    .line 27
    move v9, v2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v9, v4

    .line 30
    :goto_1
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$300(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-static {v1, v8, v9}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 37
    .line 38
    .line 39
    move-result v10

    .line 40
    new-instance v5, Landroid/media/AudioTrack;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$300(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    const/4 v11, 0x1

    .line 49
    const/4 v6, 0x3

    .line 50
    invoke-direct/range {v5 .. v11}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$400()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$300(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v0, ", channels:"

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$100(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v0, ", bits:"

    .line 86
    .line 87
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$200(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v0, " mMinBufferLength:"

    .line 100
    .line 101
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 112
    .line 113
    .line 114
    :try_start_1
    invoke-virtual {v5}, Landroid/media/AudioTrack;->play()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 118
    .line 119
    invoke-static {v0, v3}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$502(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;Z)Z

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 123
    .line 124
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$600(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iget-object v2, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 129
    .line 130
    invoke-static {v2}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$700(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->setAudioMode(Landroid/content/Context;I)V

    .line 135
    .line 136
    .line 137
    const/4 v0, 0x0

    .line 138
    const/16 v1, 0x64

    .line 139
    .line 140
    move v2, v0

    .line 141
    :catch_0
    :goto_2
    iget-boolean v3, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;->mIsLooping:Z

    .line 142
    .line 143
    if-eqz v3, :cond_6

    .line 144
    .line 145
    iget-object v3, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 146
    .line 147
    invoke-static {v3}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$800(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)[B

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    if-eqz v3, :cond_5

    .line 152
    .line 153
    array-length v6, v3

    .line 154
    if-lez v6, :cond_5

    .line 155
    .line 156
    iget-object v6, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 157
    .line 158
    invoke-static {v6}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$300(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    iget-object v7, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 163
    .line 164
    invoke-static {v7}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$100(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    const-wide/16 v8, 0x0

    .line 169
    .line 170
    invoke-static {v3, v8, v9, v6, v7}, Lcom/tencent/liteav/audio/TXCAudioEngine;->onCorePlayPcmData([BJII)V

    .line 171
    .line 172
    .line 173
    iget-object v6, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 174
    .line 175
    invoke-static {v6}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$900(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)Z

    .line 176
    .line 177
    .line 178
    move-result v6

    .line 179
    if-eqz v6, :cond_2

    .line 180
    .line 181
    invoke-static {v3, v0}, Ljava/util/Arrays;->fill([BB)V

    .line 182
    .line 183
    .line 184
    :cond_2
    if-eqz v1, :cond_4

    .line 185
    .line 186
    const/16 v6, 0x320

    .line 187
    .line 188
    if-ge v2, v6, :cond_4

    .line 189
    .line 190
    array-length v7, v3

    .line 191
    div-int/2addr v7, v4

    .line 192
    new-array v8, v7, [S

    .line 193
    .line 194
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    sget-object v10, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 199
    .line 200
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 201
    .line 202
    .line 203
    move-result-object v9

    .line 204
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    invoke-virtual {v9, v8}, Ljava/nio/ShortBuffer;->get([S)Ljava/nio/ShortBuffer;

    .line 209
    .line 210
    .line 211
    move v9, v0

    .line 212
    :goto_3
    if-ge v9, v7, :cond_3

    .line 213
    .line 214
    aget-short v10, v8, v9

    .line 215
    .line 216
    div-int/2addr v10, v1

    .line 217
    int-to-short v10, v10

    .line 218
    aput-short v10, v8, v9

    .line 219
    .line 220
    add-int/lit8 v9, v9, 0x1

    .line 221
    .line 222
    goto :goto_3

    .line 223
    :cond_3
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 224
    .line 225
    .line 226
    move-result-object v7

    .line 227
    sget-object v9, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 228
    .line 229
    invoke-virtual {v7, v9}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 230
    .line 231
    .line 232
    move-result-object v7

    .line 233
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 234
    .line 235
    .line 236
    move-result-object v7

    .line 237
    invoke-virtual {v7, v8}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 238
    .line 239
    .line 240
    array-length v7, v3

    .line 241
    iget-object v8, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;->this$0:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 242
    .line 243
    invoke-static {v8}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$300(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I

    .line 244
    .line 245
    .line 246
    move-result v8

    .line 247
    mul-int/2addr v8, v4

    .line 248
    div-int/lit16 v8, v8, 0x3e8

    .line 249
    .line 250
    div-int/2addr v7, v8

    .line 251
    add-int/2addr v2, v7

    .line 252
    rsub-int v7, v2, 0x320

    .line 253
    .line 254
    mul-int/2addr v1, v7

    .line 255
    div-int/2addr v1, v6

    .line 256
    :cond_4
    array-length v6, v3

    .line 257
    invoke-virtual {v5, v3, v0, v6}, Landroid/media/AudioTrack;->write([BII)I

    .line 258
    .line 259
    .line 260
    goto :goto_2

    .line 261
    :cond_5
    const-wide/16 v6, 0x5

    .line 262
    .line 263
    :try_start_2
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 264
    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_6
    :try_start_3
    invoke-virtual {v5}, Landroid/media/AudioTrack;->pause()V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v5}, Landroid/media/AudioTrack;->flush()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v5}, Landroid/media/AudioTrack;->stop()V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v5}, Landroid/media/AudioTrack;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 277
    .line 278
    .line 279
    goto :goto_4

    .line 280
    :catch_1
    move-exception v0

    .line 281
    move-object p0, v0

    .line 282
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$400()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    const-string v1, "stop AudioTrack failed."

    .line 287
    .line 288
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 289
    .line 290
    .line 291
    :goto_4
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$400()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    const-string v0, "mult-player thread stop finish!"

    .line 296
    .line 297
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :catch_2
    move-exception v0

    .line 302
    move-object p0, v0

    .line 303
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$400()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    const-string v1, "start play failed."

    .line 308
    .line 309
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :catch_3
    move-exception v0

    .line 314
    move-object p0, v0

    .line 315
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->access$400()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    const-string v1, "create AudioTrack failed."

    .line 320
    .line 321
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 322
    .line 323
    .line 324
    return-void
.end method
