.class Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HeadsetPlugReceiver"
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catchall_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    .line 1
    const-string p1, "state"

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_b

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, "audio"

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    const-string v4, "HeadsetPlugReceiver ;mIsWiredHeadsetOn"

    .line 18
    .line 19
    const-string v5, "streamerCameraProducer"

    .line 20
    .line 21
    const/4 v6, 0x1

    .line 22
    if-nez v1, :cond_5

    .line 23
    .line 24
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 25
    .line 26
    iget-object p2, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 37
    .line 38
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 45
    .line 46
    invoke-static {p1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 50
    .line 51
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 58
    .line 59
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 64
    .line 65
    iget-object p2, p2, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 66
    .line 67
    invoke-interface {p1, p2, v6, v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 71
    .line 72
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b()V

    .line 73
    .line 74
    .line 75
    new-instance p1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 81
    .line 82
    invoke-static {p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {v5, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 97
    .line 98
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 99
    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getStreamerType()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-ne p1, v3, :cond_2

    .line 107
    .line 108
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 109
    .line 110
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 111
    .line 112
    if-eqz p1, :cond_2

    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Landroid/media/AudioManager;

    .line 123
    .line 124
    invoke-virtual {p1, v6}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 128
    .line 129
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    if-eqz p1, :cond_3

    .line 134
    .line 135
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 136
    .line 137
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 142
    .line 143
    .line 144
    :cond_3
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 145
    .line 146
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    if-eqz p1, :cond_4

    .line 151
    .line 152
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 153
    .line 154
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 159
    .line 160
    .line 161
    :cond_4
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 162
    .line 163
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_5
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-ne p1, v6, :cond_b

    .line 172
    .line 173
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 174
    .line 175
    iget-object p2, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 176
    .line 177
    if-eqz p2, :cond_6

    .line 178
    .line 179
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p2, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 184
    .line 185
    .line 186
    :cond_6
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 187
    .line 188
    invoke-static {p1, v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 192
    .line 193
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    if-eqz p1, :cond_7

    .line 198
    .line 199
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 200
    .line 201
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 206
    .line 207
    iget-object p2, p2, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 208
    .line 209
    invoke-interface {p1, p2, v6, v6}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 210
    .line 211
    .line 212
    :cond_7
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 213
    .line 214
    iget-object p2, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 215
    .line 216
    if-eqz p2, :cond_8

    .line 217
    .line 218
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 219
    .line 220
    if-eqz p1, :cond_8

    .line 221
    .line 222
    invoke-virtual {p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getStreamerType()I

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-ne p1, v3, :cond_8

    .line 227
    .line 228
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 229
    .line 230
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 231
    .line 232
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    check-cast p1, Landroid/media/AudioManager;

    .line 241
    .line 242
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 243
    .line 244
    .line 245
    :cond_8
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 246
    .line 247
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    if-eqz p1, :cond_9

    .line 252
    .line 253
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 254
    .line 255
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {p1, v6}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 260
    .line 261
    .line 262
    :cond_9
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 263
    .line 264
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    if-eqz p1, :cond_a

    .line 269
    .line 270
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 271
    .line 272
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    invoke-virtual {p1, v6}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 277
    .line 278
    .line 279
    :cond_a
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 280
    .line 281
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 282
    .line 283
    .line 284
    new-instance p1, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 290
    .line 291
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    invoke-static {v5, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    .line 304
    .line 305
    :cond_b
    return-void
.end method
