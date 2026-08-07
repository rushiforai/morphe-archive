.class Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;
.super Lio/agora/rtc2/IRtcEngineEventHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Lio/agora/rtc2/IRtcEngineEventHandler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioMixingFinished()V
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onAudioMixingFinished()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public onAudioQuality(IISS)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    int-to-long p1, p1

    .line 8
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/iny;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p3, p4}, Ll/iny;->j(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onAudioVolumeIndication([Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;I)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onAudioVolumeIndication:speakers.length="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    array-length v1, p1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string v1, ";totalVolume="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ",getMuteStatus="

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 26
    .line 27
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->getMuteStatus()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, ";getUserID="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 44
    .line 45
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 50
    .line 51
    .line 52
    move-result-wide v1

    .line 53
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, ";"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    aget-object v2, p1, v1

    .line 63
    .line 64
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v2, ":"

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    aget-object v2, p1, v1

    .line 75
    .line 76
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v2, "test"

    .line 86
    .line 87
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    aget-object v0, p1, v1

    .line 91
    .line 92
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    const/high16 v3, 0x437f0000    # 255.0f

    .line 96
    .line 97
    const/high16 v4, 0x3f800000    # 1.0f

    .line 98
    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    int-to-long v5, v0

    .line 102
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 103
    .line 104
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 109
    .line 110
    .line 111
    move-result-wide v7

    .line 112
    cmp-long v0, v5, v7

    .line 113
    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    array-length v0, p1

    .line 117
    if-lez v0, :cond_2

    .line 118
    .line 119
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 120
    .line 121
    invoke-static {v0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->h(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 125
    .line 126
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->i(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    if-eqz v0, :cond_1

    .line 131
    .line 132
    array-length v0, p1

    .line 133
    new-array v0, v0, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 134
    .line 135
    move v5, v1

    .line 136
    :goto_0
    array-length v6, p1

    .line 137
    if-ge v5, v6, :cond_0

    .line 138
    .line 139
    new-instance v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 140
    .line 141
    invoke-direct {v6}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 142
    .line 143
    .line 144
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 145
    .line 146
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    aget-object v7, v7, v5

    .line 151
    .line 152
    iget v7, v7, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 153
    .line 154
    iput v7, v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 155
    .line 156
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 157
    .line 158
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    aget-object v7, v7, v5

    .line 163
    .line 164
    iget v7, v7, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 165
    .line 166
    int-to-float v7, v7

    .line 167
    mul-float/2addr v7, v4

    .line 168
    div-float/2addr v7, v3

    .line 169
    iput v7, v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 170
    .line 171
    aput-object v6, v0, v5

    .line 172
    .line 173
    add-int/lit8 v5, v5, 0x1

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_0
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 177
    .line 178
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->i(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    invoke-interface {v5, v0, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 183
    .line 184
    .line 185
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 186
    .line 187
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->getMuteStatus()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-nez v0, :cond_4

    .line 196
    .line 197
    goto/16 :goto_5

    .line 198
    .line 199
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 200
    .line 201
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->i(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    if-eqz v0, :cond_4

    .line 206
    .line 207
    new-instance v0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 208
    .line 209
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 210
    .line 211
    .line 212
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 213
    .line 214
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    invoke-virtual {v5}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 219
    .line 220
    .line 221
    move-result-wide v5

    .line 222
    long-to-int v5, v5

    .line 223
    iput v5, v0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 224
    .line 225
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 226
    .line 227
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-virtual {v5}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->getMuteStatus()Z

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    if-nez v5, :cond_3

    .line 236
    .line 237
    aget-object v5, p1, v1

    .line 238
    .line 239
    iget v5, v5, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 240
    .line 241
    int-to-float v5, v5

    .line 242
    mul-float/2addr v5, v4

    .line 243
    div-float/2addr v5, v3

    .line 244
    iput v5, v0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 245
    .line 246
    goto :goto_1

    .line 247
    :cond_3
    iput v2, v0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 248
    .line 249
    :goto_1
    filled-new-array {v0}, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 254
    .line 255
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->i(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    invoke-interface {v5, v0, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 260
    .line 261
    .line 262
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 263
    .line 264
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    const/4 v5, 0x1

    .line 269
    if-eqz v0, :cond_5

    .line 270
    .line 271
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 272
    .line 273
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    array-length v0, v0

    .line 278
    add-int/2addr v0, v5

    .line 279
    goto :goto_2

    .line 280
    :cond_5
    move v0, v5

    .line 281
    :goto_2
    new-array v6, v0, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 282
    .line 283
    new-instance v7, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 284
    .line 285
    invoke-direct {v7}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 286
    .line 287
    .line 288
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 289
    .line 290
    invoke-static {v8}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 291
    .line 292
    .line 293
    move-result-object v8

    .line 294
    invoke-virtual {v8}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 295
    .line 296
    .line 297
    move-result-wide v8

    .line 298
    long-to-int v8, v8

    .line 299
    iput v8, v7, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 300
    .line 301
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 302
    .line 303
    invoke-static {v8}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 304
    .line 305
    .line 306
    move-result-object v8

    .line 307
    invoke-virtual {v8}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->getMuteStatus()Z

    .line 308
    .line 309
    .line 310
    move-result v8

    .line 311
    if-ne v8, v5, :cond_6

    .line 312
    .line 313
    iput v2, v7, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 314
    .line 315
    goto :goto_3

    .line 316
    :cond_6
    aget-object p1, p1, v1

    .line 317
    .line 318
    iget p1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 319
    .line 320
    int-to-float p1, p1

    .line 321
    mul-float/2addr p1, v4

    .line 322
    div-float/2addr p1, v3

    .line 323
    iput p1, v7, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 324
    .line 325
    :goto_3
    aput-object v7, v6, v1

    .line 326
    .line 327
    :goto_4
    add-int/lit8 p1, v0, -0x1

    .line 328
    .line 329
    if-ge v1, p1, :cond_7

    .line 330
    .line 331
    new-instance p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 332
    .line 333
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 334
    .line 335
    .line 336
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 337
    .line 338
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    aget-object v2, v2, v1

    .line 343
    .line 344
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 345
    .line 346
    iput v2, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 347
    .line 348
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 349
    .line 350
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    aget-object v2, v2, v1

    .line 355
    .line 356
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 357
    .line 358
    int-to-float v2, v2

    .line 359
    mul-float/2addr v2, v4

    .line 360
    div-float/2addr v2, v3

    .line 361
    iput v2, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 362
    .line 363
    add-int/lit8 v1, v1, 0x1

    .line 364
    .line 365
    aput-object p1, v6, v1

    .line 366
    .line 367
    goto :goto_4

    .line 368
    :cond_7
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 369
    .line 370
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->j(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    if-eqz p1, :cond_8

    .line 375
    .line 376
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 377
    .line 378
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->j(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    invoke-interface {p0, v6, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 383
    .line 384
    .line 385
    :cond_8
    :goto_5
    return-void
.end method

.method public onConnectionInterrupted()V
    .locals 0

    return-void
.end method

.method public onConnectionLost()V
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onConnectionLost()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public onError(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onError"

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
    const-string v1, "RtcEventHander"

    .line 16
    .line 17
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x11

    .line 21
    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/16 v0, 0x12

    .line 25
    .line 26
    if-eq p1, v0, :cond_1

    .line 27
    .line 28
    const/16 v0, 0x643

    .line 29
    .line 30
    if-eq p1, v0, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    if-eq p1, v0, :cond_1

    .line 34
    .line 35
    const/16 v0, 0x6d

    .line 36
    .line 37
    if-eq p1, v0, :cond_1

    .line 38
    .line 39
    const/16 v0, 0x6e

    .line 40
    .line 41
    if-ne p1, v0, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 45
    .line 46
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 69
    .line 70
    invoke-interface {v0, p1}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onError(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    :goto_1
    return-void
.end method

.method public onFirstRemoteVideoDecoded(IIII)V
    .locals 7

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v1, v0

    .line 26
    check-cast v1, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 27
    .line 28
    int-to-long v2, p1

    .line 29
    move v4, p2

    .line 30
    move v5, p3

    .line 31
    move v6, p4

    .line 32
    invoke-interface/range {v1 .. v6}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onFirstRemoteVideoDecoded(JIII)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method public onJoinChannelSuccess(Ljava/lang/String;II)V
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 26
    .line 27
    int-to-long v1, p2

    .line 28
    invoke-interface {v0, p1, v1, v2, p3}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public onLastmileQuality(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->e(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/16 v2, 0x6c

    .line 10
    .line 11
    invoke-virtual {p0, v2, p1, v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onLeaveChannel(Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)V
    .locals 0

    return-void
.end method

.method public onMediaEngineLoadSuccess()V
    .locals 2

    .line 1
    const-string v0, "myEngineEventHandler"

    .line 2
    .line 3
    const-string v1, "onMediaEngineLoadSuccess"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 9
    .line 10
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->D()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onRejoinChannelSuccess(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoStats(Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->c(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 7
    .line 8
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->uid:I

    .line 13
    .line 14
    int-to-long v0, v0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/iny;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->receivedBitrate:I

    .line 28
    .line 29
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rendererOutputFrameRate:I

    .line 30
    .line 31
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->width:I

    .line 32
    .line 33
    iget p1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->height:I

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/iny;->k(IIII)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onRequestToken()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->d(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 10
    .line 11
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->d(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onRequestChannelKey()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onRtcStats(Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->l(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 7
    .line 8
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->m(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 13
    .line 14
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->k(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget v3, v3, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txVideoKBitRate:I

    .line 19
    .line 20
    mul-int/lit8 v3, v3, 0x2

    .line 21
    .line 22
    div-int/lit8 v3, v3, 0x8

    .line 23
    .line 24
    int-to-long v3, v3

    .line 25
    add-long/2addr v1, v3

    .line 26
    invoke-static {v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->n(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;J)J

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 30
    .line 31
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->o(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 36
    .line 37
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->k(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget v3, v3, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txAudioKBitRate:I

    .line 42
    .line 43
    mul-int/lit8 v3, v3, 0x2

    .line 44
    .line 45
    div-int/lit8 v3, v3, 0x8

    .line 46
    .line 47
    int-to-long v3, v3

    .line 48
    add-long/2addr v1, v3

    .line 49
    invoke-static {v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->p(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;J)J

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 53
    .line 54
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->e(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/16 v0, 0x6d

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-virtual {p0, v0, v1, v1, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onUserJoined(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    int-to-long v1, p1

    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v3, Ll/iny;

    .line 13
    .line 14
    invoke-direct {v3, v1, v2}, Ll/iny;-><init>(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 21
    .line 22
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 45
    .line 46
    const-string v0, ""

    .line 47
    .line 48
    invoke-interface {p1, v0, v1, v2, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return-void
.end method

.method public onUserMuteAudio(IZ)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteAudio(IZ)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public onUserMuteVideo(IZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    int-to-long v1, p1

    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/iny;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ll/iny;->h(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 24
    .line 25
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 48
    .line 49
    invoke-interface {v0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteVideo(IZ)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public onUserOffline(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 10
    .line 11
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    int-to-long v1, p1

    .line 16
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 27
    .line 28
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;->a:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 40
    .line 41
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 64
    .line 65
    int-to-long v1, p1

    .line 66
    invoke-interface {v0, v1, v2, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserOffline(JI)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-void
.end method
