.class Ll/xmp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/IMediaPlayerEventHandler;


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
    iput-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMediaPlayerEvent(ILcom/ss/bytertc/engine/data/PlayerEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onMediaPlayerPlayingProgress(IJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public onMediaPlayerStateChanged(ILcom/ss/bytertc/engine/data/PlayerState;Lcom/ss/bytertc/engine/data/PlayerError;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {p3}, Ll/xmp0;->F3(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "playerId:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", state:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/PlayerState;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "onMediaPlayerStateChanged"

    .line 34
    .line 35
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p3, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p3, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 43
    .line 44
    invoke-static {p3}, Ll/xmp0;->G3(Ll/xmp0;)I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    if-ne p1, p3, :cond_5

    .line 49
    .line 50
    sget-object p1, Lcom/ss/bytertc/engine/data/PlayerState;->FINISHED:Lcom/ss/bytertc/engine/data/PlayerState;

    .line 51
    .line 52
    if-eq p2, p1, :cond_4

    .line 53
    .line 54
    sget-object p1, Lcom/ss/bytertc/engine/data/PlayerState;->LOOP_FINISHED:Lcom/ss/bytertc/engine/data/PlayerState;

    .line 55
    .line 56
    if-ne p2, p1, :cond_0

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :cond_0
    sget-object p1, Lcom/ss/bytertc/engine/data/PlayerState;->PLAYING:Lcom/ss/bytertc/engine/data/PlayerState;

    .line 61
    .line 62
    if-ne p2, p1, :cond_1

    .line 63
    .line 64
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 65
    .line 66
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    if-eqz p1, :cond_5

    .line 71
    .line 72
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 73
    .line 74
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ll/kod0;->c()V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 82
    .line 83
    invoke-static {p0}, Ll/xmp0;->L3(Ll/xmp0;)Ll/evx;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "onAudioMixingPlay"

    .line 88
    .line 89
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    sget-object p1, Lcom/ss/bytertc/engine/data/PlayerState;->PAUSED:Lcom/ss/bytertc/engine/data/PlayerState;

    .line 98
    .line 99
    if-ne p2, p1, :cond_2

    .line 100
    .line 101
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 102
    .line 103
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 110
    .line 111
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/kod0;->b()V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 119
    .line 120
    invoke-static {p0}, Ll/xmp0;->M3(Ll/xmp0;)Ll/evx;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string p1, "onAudioMixingPaused"

    .line 125
    .line 126
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_2
    sget-object p1, Lcom/ss/bytertc/engine/data/PlayerState;->STOPPED:Lcom/ss/bytertc/engine/data/PlayerState;

    .line 135
    .line 136
    if-ne p2, p1, :cond_3

    .line 137
    .line 138
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 139
    .line 140
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    if-eqz p1, :cond_5

    .line 145
    .line 146
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 147
    .line 148
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Ll/kod0;->d()V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 156
    .line 157
    invoke-static {p0}, Ll/xmp0;->N3(Ll/xmp0;)Ll/evx;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    const-string p1, "onAudioMixingStoped"

    .line 162
    .line 163
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_3
    sget-object p1, Lcom/ss/bytertc/engine/data/PlayerState;->FAILED:Lcom/ss/bytertc/engine/data/PlayerState;

    .line 172
    .line 173
    if-ne p2, p1, :cond_5

    .line 174
    .line 175
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 176
    .line 177
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    if-eqz p1, :cond_5

    .line 182
    .line 183
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 184
    .line 185
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Ll/kod0;->a()V

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 193
    .line 194
    invoke-static {p0}, Ll/xmp0;->O3(Ll/xmp0;)Ll/evx;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    const-string p1, "onAudioMixingFailed"

    .line 199
    .line 200
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_4
    :goto_0
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 209
    .line 210
    const/4 p2, 0x0

    .line 211
    invoke-static {p1, p2}, Ll/xmp0;->H3(Ll/xmp0;Z)Z

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 215
    .line 216
    const/4 p3, 0x0

    .line 217
    const/4 v0, 0x2

    .line 218
    invoke-static {p1, p3, v0, p2}, Ll/xmp0;->I3(Ll/xmp0;Ljava/lang/Object;II)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 222
    .line 223
    invoke-static {p1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    if-eqz p1, :cond_5

    .line 228
    .line 229
    iget-object p1, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 230
    .line 231
    invoke-static {p1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-interface {p1}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onAudioMixingFinished()V

    .line 236
    .line 237
    .line 238
    iget-object p0, p0, Ll/xmp0$a;->a:Ll/xmp0;

    .line 239
    .line 240
    invoke-static {p0}, Ll/xmp0;->J3(Ll/xmp0;)Ll/evx;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    const-string p1, "onAudioMixingFinished"

    .line 245
    .line 246
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    :cond_5
    return-void
.end method
