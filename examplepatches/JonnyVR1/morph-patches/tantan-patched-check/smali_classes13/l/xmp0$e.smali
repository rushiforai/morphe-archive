.class Ll/xmp0$e;
.super Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xmp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0;


# direct methods
.method public constructor <init>(Ll/xmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioDeviceStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/AudioDeviceType;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onAudioDeviceStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/AudioDeviceType;II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/xmp0;->X4(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string p3, "device_type:"

    .line 13
    .line 14
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p2, ",error:"

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p2, "onAudioDeviceStateChanged"

    .line 33
    .line 34
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/ss/bytertc/engine/type/AudioDeviceType;->AUDIO_DEVICE_TYPE_UNKNOWN:Lcom/ss/bytertc/engine/type/AudioDeviceType;

    .line 42
    .line 43
    return-void
.end method

.method public onAudioMixingPlayingProgress(IJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onAudioMixingPlayingProgress(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onConnectionStateChanged(II)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onConnectionStateChanged(II)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xmp0;->i4(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "state:"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v3, ",reason:"

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v4, "onConnectionStateChanged"

    .line 33
    .line 34
    filled-new-array {v4, v1}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    if-eq p1, v0, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x2

    .line 45
    if-eq p1, v0, :cond_1

    .line 46
    .line 47
    const/4 v0, 0x3

    .line 48
    if-eq p1, v0, :cond_1

    .line 49
    .line 50
    const/4 v0, 0x4

    .line 51
    if-eq p1, v0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    if-eq p1, v0, :cond_2

    .line 55
    .line 56
    const/4 v1, 0x7

    .line 57
    if-eq p1, v1, :cond_0

    .line 58
    .line 59
    goto/16 :goto_1

    .line 60
    .line 61
    :cond_0
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 62
    .line 63
    invoke-static {p1}, Ll/xmp0;->p4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 70
    .line 71
    invoke-static {p1}, Ll/xmp0;->p4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {p1}, Lcom/immomo/mediacore/coninf/MRtcConnectHandler;->onReconnectTimeout()V

    .line 76
    .line 77
    .line 78
    :cond_1
    :goto_0
    move p1, v0

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 81
    .line 82
    invoke-static {p1}, Ll/xmp0;->g4(Ll/xmp0;)Landroid/os/Handler;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 89
    .line 90
    invoke-static {p1}, Ll/xmp0;->m4(Ll/xmp0;)Ll/evx;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string v0, "CONNECTION_STATE_RECONNECTED"

    .line 95
    .line 96
    filled-new-array {v4, v0}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 104
    .line 105
    invoke-static {p1}, Ll/xmp0;->g4(Ll/xmp0;)Landroid/os/Handler;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 110
    .line 111
    invoke-static {v0}, Ll/xmp0;->l4(Ll/xmp0;)Ljava/lang/Runnable;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 119
    .line 120
    const/4 v0, 0x0

    .line 121
    invoke-static {p1, v0}, Ll/xmp0;->n4(Ll/xmp0;I)I

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 125
    .line 126
    invoke-static {p1}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 127
    .line 128
    .line 129
    :cond_3
    const/4 p1, 0x6

    .line 130
    goto :goto_1

    .line 131
    :cond_4
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 132
    .line 133
    invoke-static {p1}, Ll/xmp0;->g4(Ll/xmp0;)Landroid/os/Handler;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    if-eqz p1, :cond_1

    .line 138
    .line 139
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 140
    .line 141
    invoke-static {p1}, Ll/xmp0;->j4(Ll/xmp0;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_1

    .line 146
    .line 147
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 148
    .line 149
    invoke-static {p1}, Ll/xmp0;->k4(Ll/xmp0;)Ll/evx;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const-string v1, "CONNECTION_STATE_RECONNECTING"

    .line 154
    .line 155
    filled-new-array {v4, v1}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {p1, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 163
    .line 164
    invoke-static {p1}, Ll/xmp0;->g4(Ll/xmp0;)Landroid/os/Handler;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iget-object v1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 169
    .line 170
    invoke-static {v1}, Ll/xmp0;->l4(Ll/xmp0;)Ljava/lang/Runnable;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 175
    .line 176
    .line 177
    goto :goto_0

    .line 178
    :goto_1
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 179
    .line 180
    invoke-static {v0}, Ll/xmp0;->q4(Ll/xmp0;)Ll/evx;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    new-instance v1, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    const-string v2, "volc onConnectionStateChanged callback"

    .line 203
    .line 204
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 212
    .line 213
    invoke-static {v0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    if-eqz v0, :cond_5

    .line 218
    .line 219
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 220
    .line 221
    invoke-static {p0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {p0, p1, p2}, Ll/kod0;->h(II)V

    .line 226
    .line 227
    .line 228
    :cond_5
    return-void
.end method

.method public onError(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onError(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/xmp0;->M4(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "err:"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "RTCVideo onError"

    .line 25
    .line 26
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onFirstLocalVideoFrameCaptured(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onFirstLocalVideoFrameCaptured(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFirstRemoteAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onFirstRemoteAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ll/xhy;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/xhy;->e()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Ll/xhy;->h(Z)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    invoke-virtual {p1}, Ll/xhy;->b()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    sub-long v8, v0, v4

    .line 49
    .line 50
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 51
    .line 52
    invoke-static {v0}, Ll/xmp0;->h4(Ll/xmp0;)Ll/evx;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1}, Ll/xhy;->c()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 61
    .line 62
    invoke-static {p0}, Ll/xmp0;->s2(Ll/xmp0;)J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    invoke-virtual {p1}, Ll/xhy;->a()J

    .line 67
    .line 68
    .line 69
    move-result-wide v6

    .line 70
    invoke-virtual/range {v0 .. v9}, Ll/evx;->b(IJJJJ)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public onFirstRemoteVideoFrameDecoded(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onFirstRemoteVideoFrameDecoded(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/xmp0;->j5(Ll/xmp0;)Ll/evx;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "onFirstRemoteVideoFrameDecoded"

    .line 21
    .line 22
    const-string v2, "context is null"

    .line 23
    .line 24
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-virtual/range {p2 .. p2}, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    invoke-virtual/range {p1 .. p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    iget-object v4, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 53
    .line 54
    invoke-static {v4}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v4, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ll/xhy;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/xhy;->d()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-nez v4, :cond_1

    .line 71
    .line 72
    const-string v4, "zhengjijian"

    .line 73
    .line 74
    const-string v7, "agora get first idr"

    .line 75
    .line 76
    invoke-static {v4, v7}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    const/4 v4, 0x1

    .line 80
    invoke-virtual {v0, v4}, Ll/xhy;->g(Z)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 84
    .line 85
    .line 86
    move-result-wide v7

    .line 87
    invoke-virtual {v0}, Ll/xhy;->b()J

    .line 88
    .line 89
    .line 90
    move-result-wide v9

    .line 91
    sub-long v16, v7, v9

    .line 92
    .line 93
    iget-object v4, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 94
    .line 95
    invoke-static {v4}, Ll/xmp0;->G2(Ll/xmp0;)Ll/evx;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    invoke-virtual {v0}, Ll/xhy;->c()I

    .line 100
    .line 101
    .line 102
    move-result v9

    .line 103
    iget-object v4, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 104
    .line 105
    invoke-static {v4}, Ll/xmp0;->s2(Ll/xmp0;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v12

    .line 109
    invoke-virtual {v0}, Ll/xhy;->a()J

    .line 110
    .line 111
    .line 112
    move-result-wide v14

    .line 113
    const/4 v8, 0x1

    .line 114
    move-wide v10, v2

    .line 115
    invoke-virtual/range {v7 .. v17}, Ll/evx;->c(ZIJJJJ)V

    .line 116
    .line 117
    .line 118
    iget-object v0, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 119
    .line 120
    invoke-static {v0}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    long-to-int v4, v2

    .line 125
    const/4 v7, 0x0

    .line 126
    iget-object v8, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 127
    .line 128
    const/16 v9, 0x2006

    .line 129
    .line 130
    invoke-interface {v0, v9, v4, v7, v8}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    iget-object v0, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 134
    .line 135
    invoke-static {v0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    if-eqz v0, :cond_2

    .line 140
    .line 141
    iget-object v0, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 142
    .line 143
    invoke-static {v0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const/4 v7, 0x0

    .line 148
    move-wide v3, v2

    .line 149
    move-object v2, v0

    .line 150
    invoke-interface/range {v2 .. v7}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onFirstRemoteVideoDecoded(JIII)V

    .line 151
    .line 152
    .line 153
    move-wide v2, v3

    .line 154
    :cond_2
    iget-object v0, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 155
    .line 156
    invoke-static {v0}, Ll/xmp0;->g4(Ll/xmp0;)Landroid/os/Handler;

    .line 157
    .line 158
    .line 159
    move-result-object v7

    .line 160
    new-instance v0, Ll/xmp0$e$a;

    .line 161
    .line 162
    move-object/from16 v4, p1

    .line 163
    .line 164
    invoke-direct/range {v0 .. v6}, Ll/xmp0$e$a;-><init>(Ll/xmp0$e;JLcom/ss/bytertc/engine/data/RemoteStreamKey;II)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v7, v0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public onFirstRemoteVideoFrameRendered(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onFirstRemoteVideoFrameRendered(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLocalAudioPropertiesReport([Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLocalAudioPropertiesReport([Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xmp0;->t4(Ll/xmp0;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/xmp0;->t4(Ll/xmp0;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    array-length v0, v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 23
    .line 24
    invoke-static {v0}, Ll/xmp0;->t4(Ll/xmp0;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    array-length v0, v0

    .line 29
    add-int/2addr v0, v1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v0, v1

    .line 32
    :goto_0
    new-array v2, v0, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 33
    .line 34
    new-instance v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 35
    .line 36
    invoke-direct {v3}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 37
    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    aput-object v3, v2, v4

    .line 41
    .line 42
    iget-object v3, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 43
    .line 44
    invoke-static {v3}, Ll/xmp0;->v4(Ll/xmp0;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/high16 v5, 0x42c80000    # 100.0f

    .line 49
    .line 50
    const/high16 v6, 0x3f800000    # 1.0f

    .line 51
    .line 52
    if-nez v3, :cond_1

    .line 53
    .line 54
    aget-object v3, v2, v4

    .line 55
    .line 56
    aget-object v7, p1, v4

    .line 57
    .line 58
    iget-object v7, v7, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 59
    .line 60
    iget v7, v7, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->linearVolume:I

    .line 61
    .line 62
    int-to-float v7, v7

    .line 63
    mul-float/2addr v7, v6

    .line 64
    div-float/2addr v7, v5

    .line 65
    iput v7, v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    aget-object v3, v2, v4

    .line 69
    .line 70
    const/4 v7, 0x0

    .line 71
    iput v7, v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 72
    .line 73
    :goto_1
    aget-object v3, v2, v4

    .line 74
    .line 75
    iget-object v7, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 76
    .line 77
    invoke-static {v7}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    iget v7, v7, Ll/uow;->B0:I

    .line 82
    .line 83
    iput v7, v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 84
    .line 85
    aget-object v3, v2, v4

    .line 86
    .line 87
    aget-object p1, p1, v4

    .line 88
    .line 89
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 90
    .line 91
    iget-wide v7, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->voicePitch:D

    .line 92
    .line 93
    iput-wide v7, v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->voicePitch:D

    .line 94
    .line 95
    iget p1, p1, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->vad:I

    .line 96
    .line 97
    iput p1, v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->vad:I

    .line 98
    .line 99
    if-gtz p1, :cond_2

    .line 100
    .line 101
    iput v4, v3, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->vad:I

    .line 102
    .line 103
    :cond_2
    :goto_2
    add-int/lit8 p1, v0, -0x1

    .line 104
    .line 105
    if-ge v4, p1, :cond_3

    .line 106
    .line 107
    new-instance p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 108
    .line 109
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 110
    .line 111
    .line 112
    iget-object v3, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 113
    .line 114
    invoke-static {v3}, Ll/xmp0;->t4(Ll/xmp0;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    aget-object v3, v3, v4

    .line 119
    .line 120
    iget-object v3, v3, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    iput v3, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 135
    .line 136
    iget-object v3, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 137
    .line 138
    invoke-static {v3}, Ll/xmp0;->t4(Ll/xmp0;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    aget-object v3, v3, v4

    .line 143
    .line 144
    iget-object v3, v3, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 145
    .line 146
    iget v3, v3, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->linearVolume:I

    .line 147
    .line 148
    int-to-float v3, v3

    .line 149
    mul-float/2addr v3, v6

    .line 150
    div-float/2addr v3, v5

    .line 151
    iput v3, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 152
    .line 153
    iget-object v3, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 154
    .line 155
    invoke-static {v3}, Ll/xmp0;->t4(Ll/xmp0;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    aget-object v3, v3, v4

    .line 160
    .line 161
    iget-object v3, v3, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 162
    .line 163
    iget-wide v7, v3, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->voicePitch:D

    .line 164
    .line 165
    iput-wide v7, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->voicePitch:D

    .line 166
    .line 167
    add-int/lit8 v4, v4, 0x1

    .line 168
    .line 169
    aput-object p1, v2, v4

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_3
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 173
    .line 174
    invoke-static {p1}, Ll/xmp0;->w4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    if-eqz p1, :cond_4

    .line 179
    .line 180
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 181
    .line 182
    invoke-static {p0}, Ll/xmp0;->w4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    const/16 p1, 0x64

    .line 187
    .line 188
    invoke-interface {p0, v2, p1}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 189
    .line 190
    .line 191
    :cond_4
    return-void
.end method

.method public onLocalAudioStateChanged(Lcom/ss/bytertc/engine/data/LocalAudioStreamState;Lcom/ss/bytertc/engine/data/LocalAudioStreamError;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLocalAudioStateChanged(Lcom/ss/bytertc/engine/data/LocalAudioStreamState;Lcom/ss/bytertc/engine/data/LocalAudioStreamError;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLocalVideoSizeChanged(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLocalVideoSizeChanged(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLocalVideoStateChanged(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/type/LocalVideoStreamState;Lcom/ss/bytertc/engine/type/LocalVideoStreamError;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLocalVideoStateChanged(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/type/LocalVideoStreamState;Lcom/ss/bytertc/engine/type/LocalVideoStreamError;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLogReport(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLogReport(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLoginResult(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLoginResult(Ljava/lang/String;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLogout(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onLogout(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMixedStreamEvent(Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onMixedStreamEvent(Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/xmp0;->y4(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "event:"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;->value()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ",error:"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;->value()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "onMixedStreamEvent"

    .line 41
    .line 42
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;->START_SUCCESS:Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;

    .line 50
    .line 51
    if-ne p2, p1, :cond_2

    .line 52
    .line 53
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    invoke-static {p1, v0}, Ll/xmp0;->z4(Ll/xmp0;Z)Z

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 60
    .line 61
    iget-object v2, p1, Ll/xmp0;->Y1:Lcom/ss/bytertc/engine/live/MixedStreamConfig;

    .line 62
    .line 63
    iget-object v3, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->regions:[Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    array-length v3, v3

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    move v3, v4

    .line 71
    :goto_0
    if-eqz v2, :cond_1

    .line 72
    .line 73
    if-lez v3, :cond_1

    .line 74
    .line 75
    iget-object v2, p1, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 76
    .line 77
    invoke-static {p1}, Ll/xmp0;->B4(Ll/xmp0;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v5, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 82
    .line 83
    iget-object v6, v5, Ll/xmp0;->Z1:Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;

    .line 84
    .line 85
    iget-object v5, v5, Ll/xmp0;->Y1:Lcom/ss/bytertc/engine/live/MixedStreamConfig;

    .line 86
    .line 87
    invoke-virtual {v2, p1, v6, v5}, Lcom/ss/bytertc/engine/RTCEngine;->updatePushMixedStream(Ljava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 91
    .line 92
    invoke-static {p1}, Ll/xmp0;->C4(Ll/xmp0;)Ll/evx;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance v2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v5, "rtmpState updateRtmpTranscoding regilen "

    .line 99
    .line 100
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {p1, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 118
    .line 119
    invoke-static {p1}, Ll/xmp0;->D4(Ll/xmp0;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-nez p1, :cond_3

    .line 124
    .line 125
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 126
    .line 127
    invoke-static {p1, v0}, Ll/xmp0;->E4(Ll/xmp0;Z)Z

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 131
    .line 132
    invoke-static {p1}, Ll/xmp0;->F4(Ll/xmp0;)Ll/evx;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    const-string v0, "notifyPublished"

    .line 137
    .line 138
    const-string v1, "onStreamMixingEvent  notifyPublished"

    .line 139
    .line 140
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 148
    .line 149
    invoke-static {p1}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const/16 v0, 0x1008

    .line 154
    .line 155
    iget-object v1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 156
    .line 157
    invoke-interface {p1, v0, v4, v4, v1}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    sget-object p1, Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;->START_FAILED:Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;

    .line 162
    .line 163
    if-ne p2, p1, :cond_3

    .line 164
    .line 165
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 166
    .line 167
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    if-eqz p1, :cond_3

    .line 172
    .line 173
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 174
    .line 175
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    const-string v0, ""

    .line 180
    .line 181
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;->value()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    invoke-virtual {p1, v0, v1}, Ll/kod0;->p(Ljava/lang/String;I)V

    .line 186
    .line 187
    .line 188
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 189
    .line 190
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    if-eqz p1, :cond_4

    .line 195
    .line 196
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 197
    .line 198
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;->value()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;->value()I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 211
    .line 212
    invoke-static {p1}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iget-object v5, p1, Ll/ror;->g1:Ljava/lang/String;

    .line 217
    .line 218
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 219
    .line 220
    invoke-static {p0}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    iget v6, p0, Ll/uow;->B0:I

    .line 225
    .line 226
    const-string v1, ""

    .line 227
    .line 228
    const-string v4, "volc"

    .line 229
    .line 230
    invoke-virtual/range {v0 .. v6}, Ll/kod0;->q(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;I)V

    .line 231
    .line 232
    .line 233
    :cond_4
    return-void
.end method

.method public onNetworkTimeSynchronized()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onNetworkTimeSynchronized()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRemoteAudioPropertiesReport([Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;I)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onRemoteAudioPropertiesReport([Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;I)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p2}, Ll/xmp0;->x4(Ll/xmp0;)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p2, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/xmp0;->u4(Ll/xmp0;[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;)[Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    array-length p2, p1

    .line 20
    new-array v0, p2, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 21
    .line 22
    new-instance v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    :goto_0
    if-ge v1, p2, :cond_1

    .line 29
    .line 30
    new-instance v2, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 31
    .line 32
    invoke-direct {v2}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 33
    .line 34
    .line 35
    aget-object v3, p1, v1

    .line 36
    .line 37
    iget-object v3, v3, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    iput v3, v2, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 52
    .line 53
    aget-object v3, p1, v1

    .line 54
    .line 55
    iget-object v3, v3, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 56
    .line 57
    iget v4, v3, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->linearVolume:I

    .line 58
    .line 59
    int-to-float v4, v4

    .line 60
    const/high16 v5, 0x3f800000    # 1.0f

    .line 61
    .line 62
    mul-float/2addr v4, v5

    .line 63
    const/high16 v5, 0x42c80000    # 100.0f

    .line 64
    .line 65
    div-float/2addr v4, v5

    .line 66
    iput v4, v2, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 67
    .line 68
    iget-wide v3, v3, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->voicePitch:D

    .line 69
    .line 70
    iput-wide v3, v2, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->voicePitch:D

    .line 71
    .line 72
    aput-object v2, v0, v1

    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iget-object p1, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 78
    .line 79
    invoke-static {p1}, Ll/xmp0;->w4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 86
    .line 87
    invoke-static {p0}, Ll/xmp0;->w4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/16 p1, 0x64

    .line 92
    .line 93
    invoke-interface {p0, v0, p1}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method

.method public onRemoteAudioStateChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/RemoteAudioState;Lcom/ss/bytertc/engine/data/RemoteAudioStateChangeReason;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onRemoteAudioStateChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/RemoteAudioState;Lcom/ss/bytertc/engine/data/RemoteAudioStateChangeReason;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRemoteVideoSizeChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onRemoteVideoSizeChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRemoteVideoStateChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/RemoteVideoState;Lcom/ss/bytertc/engine/type/RemoteVideoStateChangeReason;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onRemoteVideoStateChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/RemoteVideoState;Lcom/ss/bytertc/engine/type/RemoteVideoStateChangeReason;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onSEIMessageReceived(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 1
    const-string v0, "bType"

    .line 2
    .line 3
    const-string v1, "onReceiveSEI getbType: "

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onSEIMessageReceived(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Ljava/nio/ByteBuffer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    new-array p1, p1, [B

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    .line 18
    .line 19
    new-instance v2, Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v2, p1}, Ljava/lang/String;-><init>([B)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p2, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p2, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 38
    .line 39
    invoke-static {p2}, Ll/xmp0;->s4(Ll/xmp0;)Ll/wvx;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    int-to-long v2, p1

    .line 44
    iput-wide v2, p2, Ll/wvx;->s:J

    .line 45
    .line 46
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 47
    .line 48
    invoke-static {p0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 49
    .line 50
    .line 51
    const-string p0, "Pipeline_Normal_pip->PIPLINE->VOLC"

    .line 52
    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p0, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void

    .line 69
    :catch_0
    move-exception p0

    .line 70
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onSEIStreamUpdate(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/SEIStreamUpdateEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onSEIStreamUpdate(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/SEIStreamUpdateEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStreamSyncInfoReceived(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;->onStreamSyncInfoReceived(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 7
    .line 8
    .line 9
    return-void
.end method
