.class Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioTrackThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method

.method private writeBytes(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
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
    const/4 p0, 0x0

    .line 6
    invoke-virtual {p1, p2, p3, p0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "WebRtcAudioTrack"

    .line 11
    .line 12
    const-string v2, "null audio track instance"

    .line 13
    .line 14
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "WebRtcAudioTrack"

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v3, "AudioTrackThread"

    .line 25
    .line 26
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "WebRtcAudioTrack"

    .line 44
    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v3, "AudioTrack state: "

    .line 48
    .line 49
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Landroid/media/AudioTrack;->getPlayState()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    const/16 v0, -0x13

    .line 73
    .line 74
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    :goto_1
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 88
    .line 89
    if-eqz v2, :cond_4

    .line 90
    .line 91
    monitor-enter p0

    .line 92
    :try_start_0
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 93
    .line 94
    if-eqz v2, :cond_1

    .line 95
    .line 96
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 97
    .line 98
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v3

    .line 102
    invoke-static {v2, v0, v3, v4}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$300(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;IJ)V

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :catchall_0
    move-exception v0

    .line 107
    goto/16 :goto_4

    .line 108
    .line 109
    :cond_1
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$400()Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_2

    .line 115
    .line 116
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 117
    .line 118
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 126
    .line 127
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 132
    .line 133
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)[B

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    .line 140
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 141
    .line 142
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 147
    .line 148
    .line 149
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 150
    .line 151
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 156
    .line 157
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-direct {p0, v2, v3, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->writeBytes(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 162
    .line 163
    .line 164
    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 165
    goto :goto_3

    .line 166
    :catch_0
    move-exception v2

    .line 167
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 168
    .line 169
    const-string v3, "WebRtcAudioTrack"

    .line 170
    .line 171
    new-instance v4, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v5, "AudioTrack.write error, Exception: "

    .line 174
    .line 175
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    invoke-static {v3, v4}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 193
    .line 194
    new-instance v4, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    const-string v5, "AudioTrack.write error, Exception: "

    .line 197
    .line 198
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-static {v3, v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    const/4 v2, -0x1

    .line 216
    :goto_3
    if-eq v2, v0, :cond_3

    .line 217
    .line 218
    if-gez v2, :cond_3

    .line 219
    .line 220
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 221
    .line 222
    const-string v3, "WebRtcAudioTrack"

    .line 223
    .line 224
    new-instance v4, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v5, "AudioTrack.write played invalid number of bytes: "

    .line 227
    .line 228
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    invoke-static {v3, v4}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 242
    .line 243
    new-instance v4, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    const-string v5, "AudioTrack.write failed: "

    .line 246
    .line 247
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-static {v3, v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    :cond_3
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 261
    .line 262
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 267
    .line 268
    .line 269
    goto/16 :goto_1

    .line 270
    .line 271
    :goto_4
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 272
    throw v0

    .line 273
    :cond_4
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 274
    .line 275
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    if-eqz v0, :cond_5

    .line 280
    .line 281
    const-string v0, "WebRtcAudioTrack"

    .line 282
    .line 283
    const-string v1, "Calling AudioTrack.stop..."

    .line 284
    .line 285
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    :try_start_3
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 289
    .line 290
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 295
    .line 296
    .line 297
    const-string p0, "WebRtcAudioTrack"

    .line 298
    .line 299
    const-string v0, "AudioTrack.stop is done."

    .line 300
    .line 301
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 302
    .line 303
    .line 304
    goto :goto_5

    .line 305
    :catch_1
    move-exception p0

    .line 306
    const-string v0, "WebRtcAudioTrack"

    .line 307
    .line 308
    new-instance v1, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    const-string v2, "AudioTrack.stop failed: "

    .line 311
    .line 312
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    :cond_5
    :goto_5
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "WebRtcAudioTrack"

    .line 3
    .line 4
    const-string v1, "stopThread"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw v0
.end method
