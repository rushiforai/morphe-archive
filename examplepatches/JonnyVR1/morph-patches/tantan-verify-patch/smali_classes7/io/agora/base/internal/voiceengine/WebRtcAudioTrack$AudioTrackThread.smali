.class Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioTrackThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method

.method private writeOnLollipop(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p2, p3, p0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method private writePreLollipop(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p1, p0, p2, p3}, Landroid/media/AudioTrack;->write([BII)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "AudioTrackThread"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "WebRtcAudioTrack [JavaAdm]"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 30
    .line 31
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v2, 0x3

    .line 40
    const/4 v3, 0x1

    .line 41
    const/4 v4, 0x0

    .line 42
    if-ne v0, v2, :cond_0

    .line 43
    .line 44
    move v0, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v0, v4

    .line 47
    :goto_0
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$100(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 51
    .line 52
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    :goto_1
    iget-boolean v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 61
    .line 62
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 63
    .line 64
    if-eqz v2, :cond_7

    .line 65
    .line 66
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$300(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget-object v6, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 71
    .line 72
    invoke-static {v6}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$400(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)J

    .line 73
    .line 74
    .line 75
    move-result-wide v6

    .line 76
    invoke-static {v5, v0, v2, v6, v7}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$500(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;IIJ)V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 80
    .line 81
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-gt v0, v2, :cond_1

    .line 90
    .line 91
    move v2, v3

    .line 92
    goto :goto_2

    .line 93
    :cond_1
    move v2, v4

    .line 94
    :goto_2
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$100(Z)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$600()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_2

    .line 102
    .line 103
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 104
    .line 105
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 113
    .line 114
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 119
    .line 120
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$700(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)[B

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 128
    .line 129
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 134
    .line 135
    .line 136
    :cond_2
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioUtils;->runningOnLollipopOrHigher()Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 141
    .line 142
    if-eqz v2, :cond_3

    .line 143
    .line 144
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 149
    .line 150
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-direct {p0, v2, v5, v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->writeOnLollipop(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    goto :goto_3

    .line 159
    :cond_3
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 164
    .line 165
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-direct {p0, v2, v5, v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->writePreLollipop(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    :goto_3
    if-eq v2, v0, :cond_4

    .line 174
    .line 175
    new-instance v5, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    const-string v6, "AudioTrack.write played invalid number of bytes: "

    .line 178
    .line 179
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-static {v1, v5}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    if-gez v2, :cond_4

    .line 193
    .line 194
    iput-boolean v4, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 195
    .line 196
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 197
    .line 198
    new-instance v6, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string v7, "AudioTrack.write failed: "

    .line 201
    .line 202
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    invoke-static {v5, v6}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$800(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    :cond_4
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 216
    .line 217
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$900(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)J

    .line 218
    .line 219
    .line 220
    move-result-wide v5

    .line 221
    const-wide/16 v7, 0x0

    .line 222
    .line 223
    cmp-long v5, v5, v7

    .line 224
    .line 225
    if-nez v5, :cond_5

    .line 226
    .line 227
    new-instance v5, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    const-string v6, "AudioTrackThread write first frame : "

    .line 230
    .line 231
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string v6, " finished."

    .line 238
    .line 239
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    invoke-static {v1, v5}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    :cond_5
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 250
    .line 251
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$1000(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)I

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    div-int/2addr v2, v6

    .line 256
    int-to-long v6, v2

    .line 257
    invoke-static {v5, v6, v7}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$914(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;J)J

    .line 258
    .line 259
    .line 260
    :try_start_0
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 261
    .line 262
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$1100(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    rem-int/lit8 v2, v2, 0x28

    .line 267
    .line 268
    if-nez v2, :cond_6

    .line 269
    .line 270
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 271
    .line 272
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$1200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)I

    .line 273
    .line 274
    .line 275
    goto :goto_4

    .line 276
    :catchall_0
    move-exception v2

    .line 277
    goto :goto_5

    .line 278
    :cond_6
    :goto_4
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 279
    .line 280
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$1100(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)I

    .line 281
    .line 282
    .line 283
    move-result v5

    .line 284
    add-int/2addr v5, v3

    .line 285
    rem-int/lit8 v5, v5, 0x28

    .line 286
    .line 287
    invoke-static {v2, v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$1102(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 288
    .line 289
    .line 290
    goto :goto_6

    .line 291
    :goto_5
    new-instance v5, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    const-string v6, "calculateLatencyMillis failed: "

    .line 294
    .line 295
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    :goto_6
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 313
    .line 314
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 319
    .line 320
    .line 321
    goto/16 :goto_1

    .line 322
    .line 323
    :cond_7
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    if-eqz v0, :cond_8

    .line 328
    .line 329
    const-string v0, "Calling AudioTrack.stop..."

    .line 330
    .line 331
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    :try_start_1
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;

    .line 335
    .line 336
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 341
    .line 342
    .line 343
    const-string p0, "AudioTrack.stop is done."

    .line 344
    .line 345
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 346
    .line 347
    .line 348
    goto :goto_7

    .line 349
    :catch_0
    move-exception p0

    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    const-string v2, "AudioTrack.stop failed: "

    .line 353
    .line 354
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    :cond_8
    :goto_7
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioTrack [JavaAdm]"

    .line 2
    .line 3
    const-string v1, "stopThread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 10
    .line 11
    return-void
.end method
