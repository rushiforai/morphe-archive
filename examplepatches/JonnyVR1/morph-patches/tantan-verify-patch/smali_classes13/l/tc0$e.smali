.class Ll/tc0$e;
.super Lio/agora/rtc2/IRtcEngineEventHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->h6(Ll/uow;)Lio/agora/rtc2/RtcEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

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
    .locals 0

    .line 1
    return-void
.end method

.method public onAudioMixingStateChanged(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->W4(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "state:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ", reasonCode:"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "onAudioMixingStateChanged"

    .line 30
    .line 31
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    packed-switch p1, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    :pswitch_0
    goto :goto_0

    .line 42
    :pswitch_1
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 43
    .line 44
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 51
    .line 52
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/kod0;->a()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :pswitch_2
    const/16 p1, 0x2d3

    .line 61
    .line 62
    if-ne p2, p1, :cond_0

    .line 63
    .line 64
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 65
    .line 66
    const/4 p2, 0x0

    .line 67
    invoke-static {p1, p2}, Ll/tc0;->X4(Ll/tc0;Z)Z

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    const/4 v1, 0x2

    .line 74
    invoke-static {p1, v0, v1, p2}, Ll/tc0;->Y4(Ll/tc0;Ljava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 78
    .line 79
    invoke-static {p1}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    if-eqz p1, :cond_1

    .line 84
    .line 85
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 86
    .line 87
    invoke-static {p0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {p0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onAudioMixingFinished()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    const/16 p1, 0x2d4

    .line 96
    .line 97
    if-ne p2, p1, :cond_1

    .line 98
    .line 99
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 100
    .line 101
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    if-eqz p1, :cond_1

    .line 106
    .line 107
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 108
    .line 109
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Ll/kod0;->d()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :pswitch_3
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 118
    .line 119
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    if-eqz p1, :cond_1

    .line 124
    .line 125
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 126
    .line 127
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Ll/kod0;->b()V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :pswitch_4
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 136
    .line 137
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    if-eqz p1, :cond_1

    .line 142
    .line 143
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 144
    .line 145
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Ll/kod0;->c()V

    .line 150
    .line 151
    .line 152
    :cond_1
    :goto_0
    return-void

    .line 153
    :pswitch_data_0
    .packed-switch 0x2c6
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onAudioQuality(IISS)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

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
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

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
    invoke-virtual {v0, p3, p4}, Ll/iny;->j(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/tc0;->A4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/tc0;->A4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/coninf/MRtcQualityHandler;->onAudioQuality(IISS)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public onAudioVolumeIndication([Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;I)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x437f0000    # 255.0f

    .line 3
    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x1

    .line 8
    if-eqz p1, :cond_a

    .line 9
    .line 10
    array-length v5, p1

    .line 11
    if-lez v5, :cond_a

    .line 12
    .line 13
    aget-object v5, p1, v3

    .line 14
    .line 15
    iget v5, v5, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    if-eqz v5, :cond_2

    .line 19
    .line 20
    iget-object v7, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 21
    .line 22
    invoke-static {v7}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    iget v7, v7, Ll/uow;->B0:I

    .line 27
    .line 28
    if-eq v5, v7, :cond_2

    .line 29
    .line 30
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 31
    .line 32
    invoke-static {v5, p1}, Ll/tc0;->o5(Ll/tc0;[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 33
    .line 34
    .line 35
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 36
    .line 37
    invoke-static {v5}, Ll/tc0;->t2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    array-length v5, p1

    .line 44
    new-array v5, v5, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 45
    .line 46
    move v7, v3

    .line 47
    :goto_0
    array-length v8, p1

    .line 48
    if-ge v7, v8, :cond_0

    .line 49
    .line 50
    new-instance v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 51
    .line 52
    invoke-direct {v8}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v9, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 56
    .line 57
    invoke-static {v9}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    aget-object v9, v9, v7

    .line 62
    .line 63
    iget v9, v9, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 64
    .line 65
    iput v9, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 66
    .line 67
    iget-object v9, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 68
    .line 69
    invoke-static {v9}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    aget-object v9, v9, v7

    .line 74
    .line 75
    iget v9, v9, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 76
    .line 77
    int-to-float v9, v9

    .line 78
    mul-float/2addr v9, v2

    .line 79
    div-float/2addr v9, v1

    .line 80
    iput v9, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 81
    .line 82
    aput-object v8, v5, v7

    .line 83
    .line 84
    add-int/lit8 v7, v7, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    iget-object v7, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 88
    .line 89
    invoke-static {v7}, Ll/tc0;->t2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-interface {v7, v5, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 97
    .line 98
    invoke-static {v5}, Ll/tc0;->E2(Ll/tc0;)Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-nez v5, :cond_4

    .line 103
    .line 104
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 105
    .line 106
    invoke-static {v5}, Ll/tc0;->O2(Ll/tc0;)I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-ne v5, v4, :cond_4

    .line 111
    .line 112
    goto/16 :goto_7

    .line 113
    .line 114
    :cond_2
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 115
    .line 116
    invoke-static {v5}, Ll/tc0;->t2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    if-eqz v5, :cond_4

    .line 121
    .line 122
    new-instance v5, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 123
    .line 124
    invoke-direct {v5}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 125
    .line 126
    .line 127
    iget-object v7, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 128
    .line 129
    invoke-static {v7}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    iget v7, v7, Ll/uow;->B0:I

    .line 134
    .line 135
    iput v7, v5, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 136
    .line 137
    iget-object v7, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 138
    .line 139
    invoke-static {v7}, Ll/tc0;->E2(Ll/tc0;)Z

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    if-nez v7, :cond_3

    .line 144
    .line 145
    aget-object v7, p1, v3

    .line 146
    .line 147
    iget v7, v7, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 148
    .line 149
    int-to-float v7, v7

    .line 150
    mul-float/2addr v7, v2

    .line 151
    div-float/2addr v7, v1

    .line 152
    iput v7, v5, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_3
    iput v6, v5, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 156
    .line 157
    :goto_1
    filled-new-array {v5}, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    iget-object v7, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 162
    .line 163
    invoke-static {v7}, Ll/tc0;->t2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    invoke-interface {v7, v5, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 168
    .line 169
    .line 170
    :cond_4
    aget-object v5, p1, v3

    .line 171
    .line 172
    iget v5, v5, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 173
    .line 174
    if-eqz v5, :cond_5

    .line 175
    .line 176
    iget-object v7, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 177
    .line 178
    invoke-static {v7}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    iget v7, v7, Ll/uow;->B0:I

    .line 183
    .line 184
    if-ne v5, v7, :cond_a

    .line 185
    .line 186
    :cond_5
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 187
    .line 188
    invoke-static {v5}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    if-eqz v5, :cond_6

    .line 193
    .line 194
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 195
    .line 196
    invoke-static {v5}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    array-length v5, v5

    .line 201
    add-int/2addr v5, v4

    .line 202
    goto :goto_2

    .line 203
    :cond_6
    move v5, v4

    .line 204
    :goto_2
    new-array v7, v5, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 205
    .line 206
    new-instance v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 207
    .line 208
    invoke-direct {v8}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 209
    .line 210
    .line 211
    iget-object v9, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 212
    .line 213
    invoke-static {v9}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 214
    .line 215
    .line 216
    move-result-object v9

    .line 217
    iget v9, v9, Ll/uow;->B0:I

    .line 218
    .line 219
    iput v9, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 220
    .line 221
    iget-object v9, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 222
    .line 223
    invoke-static {v9}, Ll/tc0;->E2(Ll/tc0;)Z

    .line 224
    .line 225
    .line 226
    move-result v9

    .line 227
    if-nez v9, :cond_7

    .line 228
    .line 229
    aget-object v6, p1, v3

    .line 230
    .line 231
    iget v6, v6, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 232
    .line 233
    int-to-float v6, v6

    .line 234
    mul-float/2addr v6, v2

    .line 235
    div-float/2addr v6, v1

    .line 236
    iput v6, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 237
    .line 238
    goto :goto_3

    .line 239
    :cond_7
    iput v6, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 240
    .line 241
    :goto_3
    aget-object v6, p1, v3

    .line 242
    .line 243
    iget-wide v9, v6, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->voicePitch:D

    .line 244
    .line 245
    iput-wide v9, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->voicePitch:D

    .line 246
    .line 247
    aput-object v8, v7, v3

    .line 248
    .line 249
    aget-object p1, p1, v3

    .line 250
    .line 251
    iget p1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->vad:I

    .line 252
    .line 253
    iput p1, v8, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->vad:I

    .line 254
    .line 255
    move p1, v3

    .line 256
    :goto_4
    add-int/lit8 v6, v5, -0x1

    .line 257
    .line 258
    if-ge p1, v6, :cond_8

    .line 259
    .line 260
    new-instance v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 261
    .line 262
    invoke-direct {v6}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 263
    .line 264
    .line 265
    iget-object v8, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 266
    .line 267
    invoke-static {v8}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 268
    .line 269
    .line 270
    move-result-object v8

    .line 271
    aget-object v8, v8, p1

    .line 272
    .line 273
    iget v8, v8, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 274
    .line 275
    iput v8, v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 276
    .line 277
    iget-object v8, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 278
    .line 279
    invoke-static {v8}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 280
    .line 281
    .line 282
    move-result-object v8

    .line 283
    aget-object v8, v8, p1

    .line 284
    .line 285
    iget v8, v8, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 286
    .line 287
    int-to-float v8, v8

    .line 288
    mul-float/2addr v8, v2

    .line 289
    div-float/2addr v8, v1

    .line 290
    iput v8, v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 291
    .line 292
    iget-object v8, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 293
    .line 294
    invoke-static {v8}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 295
    .line 296
    .line 297
    move-result-object v8

    .line 298
    aget-object v8, v8, p1

    .line 299
    .line 300
    iget-wide v8, v8, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->voicePitch:D

    .line 301
    .line 302
    iput-wide v8, v6, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->voicePitch:D

    .line 303
    .line 304
    add-int/lit8 p1, p1, 0x1

    .line 305
    .line 306
    aput-object v6, v7, p1

    .line 307
    .line 308
    goto :goto_4

    .line 309
    :cond_8
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 310
    .line 311
    invoke-static {p1}, Ll/tc0;->a3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    if-eqz p1, :cond_9

    .line 316
    .line 317
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 318
    .line 319
    invoke-static {p1}, Ll/tc0;->a3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    invoke-interface {p1, v7, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 324
    .line 325
    .line 326
    :cond_9
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 327
    .line 328
    invoke-static {p1, v0}, Ll/tc0;->o5(Ll/tc0;[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 329
    .line 330
    .line 331
    goto :goto_5

    .line 332
    :cond_a
    move v5, v4

    .line 333
    :goto_5
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 334
    .line 335
    invoke-static {p1}, Ll/tc0;->O2(Ll/tc0;)I

    .line 336
    .line 337
    .line 338
    move-result p1

    .line 339
    if-eq p1, v4, :cond_d

    .line 340
    .line 341
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 342
    .line 343
    invoke-static {p1}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    if-eqz p1, :cond_d

    .line 348
    .line 349
    new-array p1, v5, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 350
    .line 351
    new-instance v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 352
    .line 353
    invoke-direct {v4}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 354
    .line 355
    .line 356
    :goto_6
    if-ge v3, v5, :cond_b

    .line 357
    .line 358
    new-instance v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 359
    .line 360
    invoke-direct {v4}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 361
    .line 362
    .line 363
    iget-object v6, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 364
    .line 365
    invoke-static {v6}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 366
    .line 367
    .line 368
    move-result-object v6

    .line 369
    aget-object v6, v6, v3

    .line 370
    .line 371
    iget v6, v6, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    .line 372
    .line 373
    iput v6, v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 374
    .line 375
    iget-object v6, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 376
    .line 377
    invoke-static {v6}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 378
    .line 379
    .line 380
    move-result-object v6

    .line 381
    aget-object v6, v6, v3

    .line 382
    .line 383
    iget v6, v6, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    .line 384
    .line 385
    int-to-float v6, v6

    .line 386
    mul-float/2addr v6, v2

    .line 387
    div-float/2addr v6, v1

    .line 388
    iput v6, v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 389
    .line 390
    iget-object v6, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 391
    .line 392
    invoke-static {v6}, Ll/tc0;->m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 393
    .line 394
    .line 395
    move-result-object v6

    .line 396
    aget-object v6, v6, v3

    .line 397
    .line 398
    iget-wide v6, v6, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->voicePitch:D

    .line 399
    .line 400
    iput-wide v6, v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->voicePitch:D

    .line 401
    .line 402
    aput-object v4, p1, v3

    .line 403
    .line 404
    add-int/lit8 v3, v3, 0x1

    .line 405
    .line 406
    goto :goto_6

    .line 407
    :cond_b
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 408
    .line 409
    invoke-static {v1}, Ll/tc0;->a3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    if-eqz v1, :cond_c

    .line 414
    .line 415
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 416
    .line 417
    invoke-static {v1}, Ll/tc0;->a3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    invoke-interface {v1, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 422
    .line 423
    .line 424
    :cond_c
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 425
    .line 426
    invoke-static {p0, v0}, Ll/tc0;->o5(Ll/tc0;[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 427
    .line 428
    .line 429
    :cond_d
    :goto_7
    return-void
.end method

.method public onChannelMediaRelayStateChanged(II)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->F2(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ", code:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "onChannelMediaRelayStateChanged:"

    .line 28
    .line 29
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "state"

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v2, ", code = "

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 63
    .line 64
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    const/4 v1, 0x2

    .line 71
    const-wide/16 v3, 0x0

    .line 72
    .line 73
    if-eq p1, v1, :cond_2

    .line 74
    .line 75
    const/4 v1, 0x3

    .line 76
    if-eq p1, v1, :cond_1

    .line 77
    .line 78
    :cond_0
    move v8, p2

    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_1
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 82
    .line 83
    invoke-static {p1, v0}, Ll/tc0;->G2(Ll/tc0;Z)Z

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 87
    .line 88
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_0

    .line 93
    .line 94
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    sget-object p1, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    const-string v6, "ConnectOtherRoom"

    .line 105
    .line 106
    const-string v7, "agora"

    .line 107
    .line 108
    const-string v9, "onChannelMediaRelayStateChanged connect_failed"

    .line 109
    .line 110
    move v8, p2

    .line 111
    invoke-virtual/range {v5 .. v10}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 115
    .line 116
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance p2, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v2, "connect_failed,code:"

    .line 123
    .line 124
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {p1, v3, v4, v1, p2}, Ll/kod0;->f(JILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_2
    move v8, p2

    .line 139
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    new-instance p2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v1, " \u6e90\u9891\u9053\u4e3b\u64ad\u6210\u529f\u52a0\u5165\u76ee\u6807\u9891\u9053 code "

    .line 146
    .line 147
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-virtual {p1, v2, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 161
    .line 162
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    if-eqz p1, :cond_5

    .line 167
    .line 168
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 169
    .line 170
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    const/4 p2, 0x1

    .line 175
    const-string v1, "connect_success"

    .line 176
    .line 177
    invoke-virtual {p1, v3, v4, p2, v1}, Ll/kod0;->f(JILjava/lang/String;)V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_3
    move v8, p2

    .line 182
    if-nez v8, :cond_4

    .line 183
    .line 184
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 185
    .line 186
    invoke-static {p1, v0}, Ll/tc0;->G2(Ll/tc0;Z)Z

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 190
    .line 191
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    if-eqz p1, :cond_4

    .line 196
    .line 197
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 198
    .line 199
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    const-string p2, "RELAY_STATE_IDLE"

    .line 204
    .line 205
    invoke-virtual {p1, v0, p2}, Ll/kod0;->i(ILjava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    new-instance p2, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    const-string v1, "\u521d\u59cb\u5316\u72b6\u6001 code"

    .line 215
    .line 216
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-virtual {p1, v2, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_5
    :goto_0
    const/16 p1, 0x8

    .line 230
    .line 231
    if-ne v8, p1, :cond_6

    .line 232
    .line 233
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 234
    .line 235
    invoke-static {p1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    const/16 p2, 0x1100

    .line 240
    .line 241
    invoke-interface {p1, p2, v8, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 242
    .line 243
    .line 244
    :cond_6
    return-void
.end method

.method public onClientRoleChanged(IILio/agora/rtc2/ClientRoleOptions;)V
    .locals 4

    .line 1
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {p3}, Ll/tc0;->f5(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "onClientRoleChanged"

    .line 16
    .line 17
    filled-new-array {v2, v0, v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p3, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 25
    .line 26
    invoke-static {p3}, Ll/tc0;->g5(Ll/tc0;)Ll/wvx;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    iget-boolean p3, p3, Ll/wvx;->b:Z

    .line 31
    .line 32
    if-eqz p3, :cond_1

    .line 33
    .line 34
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 35
    .line 36
    invoke-static {p3}, Ll/tc0;->h5(Ll/tc0;)Ll/wvx;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    iget-wide v0, p3, Ll/wvx;->c1:J

    .line 41
    .line 42
    const-wide/16 v2, 0x1

    .line 43
    .line 44
    cmp-long p3, v0, v2

    .line 45
    .line 46
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 47
    .line 48
    if-nez p3, :cond_0

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/tc0;->h2()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {v0}, Ll/tc0;->f2()V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 58
    .line 59
    invoke-static {p3}, Ll/tc0;->i5(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    if-eqz p3, :cond_2

    .line 64
    .line 65
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 66
    .line 67
    invoke-static {p3}, Ll/tc0;->i5(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-interface {p3, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;->onClientRoleChanged(II)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 75
    .line 76
    invoke-static {p3}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    if-eqz p3, :cond_3

    .line 81
    .line 82
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 83
    .line 84
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0, p1, p2}, Ll/kod0;->e(II)V

    .line 89
    .line 90
    .line 91
    :cond_3
    return-void
.end method

.method public onConnectionLost()V
    .locals 0

    .line 1
    return-void
.end method

.method public onConnectionStateChanged(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->H2(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "state:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v3, ",reason:"

    .line 18
    .line 19
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v4, "onConnectionStateChanged"

    .line 30
    .line 31
    filled-new-array {v4, v1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    const/16 v0, 0x1100

    .line 39
    .line 40
    packed-switch p2, :pswitch_data_0

    .line 41
    .line 42
    .line 43
    :pswitch_0
    goto/16 :goto_0

    .line 44
    .line 45
    :pswitch_1
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 46
    .line 47
    invoke-static {v1}, Ll/tc0;->P2(Ll/tc0;)Ll/wvx;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-wide/16 v5, 0x32b

    .line 52
    .line 53
    iput-wide v5, v1, Ll/wvx;->y0:J

    .line 54
    .line 55
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 56
    .line 57
    invoke-static {v1}, Ll/tc0;->Q2(Ll/tc0;)Ll/wvx;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput p2, v1, Ll/wvx;->k0:I

    .line 62
    .line 63
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 64
    .line 65
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 72
    .line 73
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 78
    .line 79
    invoke-static {v5}, Ll/tc0;->R2(Ll/tc0;)Ll/wvx;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    iget-wide v5, v5, Ll/wvx;->y0:J

    .line 84
    .line 85
    long-to-int v5, v5

    .line 86
    invoke-interface {v1, v0, v5, p2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :pswitch_2
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 91
    .line 92
    invoke-static {v1}, Ll/tc0;->L2(Ll/tc0;)Ll/wvx;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    add-int/lit16 v5, p2, 0x320

    .line 97
    .line 98
    int-to-long v5, v5

    .line 99
    iput-wide v5, v1, Ll/wvx;->y0:J

    .line 100
    .line 101
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 102
    .line 103
    invoke-static {v1}, Ll/tc0;->M2(Ll/tc0;)Ll/wvx;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput p2, v1, Ll/wvx;->k0:I

    .line 108
    .line 109
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 110
    .line 111
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    if-eqz v1, :cond_0

    .line 116
    .line 117
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 118
    .line 119
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 124
    .line 125
    invoke-static {v5}, Ll/tc0;->N2(Ll/tc0;)Ll/wvx;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    iget-wide v5, v5, Ll/wvx;->y0:J

    .line 130
    .line 131
    long-to-int v5, v5

    .line 132
    invoke-interface {v1, v0, v5, p2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :pswitch_3
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 137
    .line 138
    invoke-static {v1}, Ll/tc0;->I2(Ll/tc0;)Ll/wvx;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    const-wide/16 v5, 0x32a

    .line 143
    .line 144
    iput-wide v5, v1, Ll/wvx;->y0:J

    .line 145
    .line 146
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 147
    .line 148
    invoke-static {v1}, Ll/tc0;->J2(Ll/tc0;)Ll/wvx;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iput p2, v1, Ll/wvx;->k0:I

    .line 153
    .line 154
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 155
    .line 156
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    if-eqz v1, :cond_0

    .line 161
    .line 162
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 163
    .line 164
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 169
    .line 170
    invoke-static {v5}, Ll/tc0;->K2(Ll/tc0;)Ll/wvx;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    iget-wide v5, v5, Ll/wvx;->y0:J

    .line 175
    .line 176
    long-to-int v5, v5

    .line 177
    invoke-interface {v1, v0, v5, p2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    :cond_0
    :goto_0
    const/4 v0, 0x3

    .line 181
    if-eq p1, v0, :cond_4

    .line 182
    .line 183
    const/4 v1, 0x4

    .line 184
    const-string v5, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 185
    .line 186
    if-eq p1, v1, :cond_3

    .line 187
    .line 188
    const/4 v1, 0x5

    .line 189
    if-eq p1, v1, :cond_1

    .line 190
    .line 191
    goto/16 :goto_1

    .line 192
    .line 193
    :cond_1
    if-ne p2, v0, :cond_5

    .line 194
    .line 195
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    const-string v1, "onConnectionBanned"

    .line 200
    .line 201
    invoke-virtual {v0, v5, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 205
    .line 206
    invoke-static {v0}, Ll/tc0;->U2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    if-eqz v0, :cond_2

    .line 211
    .line 212
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 213
    .line 214
    invoke-static {v0}, Ll/tc0;->U2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcConnectHandler;->onReconnectTimeout()V

    .line 219
    .line 220
    .line 221
    :cond_2
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 222
    .line 223
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    if-eqz v0, :cond_5

    .line 228
    .line 229
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 230
    .line 231
    invoke-static {v0}, Ll/tc0;->V2(Ll/tc0;)Ll/evx;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    new-instance v1, Ljava/lang/StringBuilder;

    .line 236
    .line 237
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    const-string v5, "onConnectionBannedByServer"

    .line 254
    .line 255
    filled-new-array {v5, v1}, [Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 263
    .line 264
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-virtual {v0, p2}, Ll/kod0;->g(I)V

    .line 269
    .line 270
    .line 271
    goto :goto_1

    .line 272
    :cond_3
    const/4 v0, 0x2

    .line 273
    if-ne p2, v0, :cond_5

    .line 274
    .line 275
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    const-string v1, "onConnectionInterrupted"

    .line 280
    .line 281
    invoke-virtual {v0, v5, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 285
    .line 286
    invoke-static {v0}, Ll/tc0;->z4(Ll/tc0;)Ll/ypw;

    .line 287
    .line 288
    .line 289
    goto :goto_1

    .line 290
    :cond_4
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 291
    .line 292
    invoke-static {v0}, Ll/tc0;->N3(Ll/tc0;)Landroid/os/Handler;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    if-eqz v0, :cond_5

    .line 297
    .line 298
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 299
    .line 300
    invoke-static {v0}, Ll/tc0;->N3(Ll/tc0;)Landroid/os/Handler;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 305
    .line 306
    invoke-static {v1}, Ll/tc0;->S2(Ll/tc0;)Ljava/lang/Runnable;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 311
    .line 312
    .line 313
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 314
    .line 315
    const/4 v1, 0x0

    .line 316
    invoke-static {v0, v1}, Ll/tc0;->T2(Ll/tc0;I)I

    .line 317
    .line 318
    .line 319
    :cond_5
    :goto_1
    const/16 v0, 0xf

    .line 320
    .line 321
    if-ne p2, v0, :cond_6

    .line 322
    .line 323
    const/4 p1, 0x6

    .line 324
    :cond_6
    const/16 v0, 0x10

    .line 325
    .line 326
    if-ne p2, v0, :cond_7

    .line 327
    .line 328
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 329
    .line 330
    invoke-static {v0}, Ll/tc0;->W2(Ll/tc0;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-nez v0, :cond_7

    .line 335
    .line 336
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 337
    .line 338
    invoke-static {v0}, Ll/tc0;->N3(Ll/tc0;)Landroid/os/Handler;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    if-eqz v0, :cond_7

    .line 343
    .line 344
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 345
    .line 346
    invoke-static {v0}, Ll/tc0;->N3(Ll/tc0;)Landroid/os/Handler;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 351
    .line 352
    invoke-static {v1}, Ll/tc0;->S2(Ll/tc0;)Ljava/lang/Runnable;

    .line 353
    .line 354
    .line 355
    move-result-object v1

    .line 356
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 357
    .line 358
    .line 359
    :cond_7
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 360
    .line 361
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    if-eqz v0, :cond_8

    .line 366
    .line 367
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 368
    .line 369
    invoke-static {v0}, Ll/tc0;->X2(Ll/tc0;)Ll/evx;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    new-instance v1, Ljava/lang/StringBuilder;

    .line 374
    .line 375
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    filled-new-array {v4, v1}, [Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 396
    .line 397
    .line 398
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 399
    .line 400
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    invoke-virtual {p0, p1, p2}, Ll/kod0;->h(II)V

    .line 405
    .line 406
    .line 407
    :cond_8
    return-void

    .line 408
    nop

    .line 409
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onError(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tc0;->V4(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "agora onError"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onJoinChannelSuccess(Ljava/lang/String;II)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->j5(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "onJoinChannelSuccess"

    .line 16
    .line 17
    filled-new-array {v3, p1, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, " onJoinChannelSuccess "

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v2, " "

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    int-to-long v3, p2

    .line 64
    const-wide v5, 0xffffffffL

    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    and-long/2addr v5, v3

    .line 70
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 84
    .line 85
    invoke-virtual {v0, v1, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 89
    .line 90
    invoke-static {p2}, Ll/tc0;->k5(Ll/tc0;)Ll/wvx;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    const/4 v0, 0x1

    .line 95
    iput-boolean v0, p2, Ll/wvx;->b:Z

    .line 96
    .line 97
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 98
    .line 99
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_PLAY:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 100
    .line 101
    invoke-static {p2, v1}, Ll/tc0;->l5(Ll/tc0;Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 105
    .line 106
    invoke-static {p2}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    if-eqz p2, :cond_0

    .line 111
    .line 112
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 113
    .line 114
    invoke-static {p2, v0}, Ll/tc0;->n5(Ll/tc0;Z)Z

    .line 115
    .line 116
    .line 117
    :cond_0
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 118
    .line 119
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->START:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 120
    .line 121
    invoke-static {p2, v1}, Ll/tc0;->p5(Ll/tc0;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 122
    .line 123
    .line 124
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 125
    .line 126
    invoke-virtual {p2}, Ll/tc0;->c2()V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 130
    .line 131
    invoke-static {p2}, Ll/tc0;->q5(Ll/tc0;)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 135
    .line 136
    invoke-static {p2}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    const/16 v1, 0x1000

    .line 141
    .line 142
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 143
    .line 144
    const/4 v5, 0x0

    .line 145
    invoke-interface {p2, v1, v5, v5, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 149
    .line 150
    invoke-static {p2}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    const/16 v1, 0x3012

    .line 155
    .line 156
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 157
    .line 158
    invoke-interface {p2, v1, v5, v5, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 162
    .line 163
    invoke-static {p2}, Ll/tc0;->H3(Ll/tc0;)Z

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-nez p2, :cond_1

    .line 168
    .line 169
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 170
    .line 171
    invoke-static {p2}, Ll/tc0;->J3(Ll/tc0;)Z

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    if-eqz p2, :cond_2

    .line 176
    .line 177
    :cond_1
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 178
    .line 179
    invoke-static {p2}, Ll/tc0;->r5(Ll/tc0;)I

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    if-eqz p2, :cond_2

    .line 184
    .line 185
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 186
    .line 187
    invoke-static {p2}, Ll/tc0;->s5(Ll/tc0;)V

    .line 188
    .line 189
    .line 190
    :cond_2
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 191
    .line 192
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 193
    .line 194
    .line 195
    move-result-wide v1

    .line 196
    invoke-static {p2, v1, v2}, Ll/tc0;->n3(Ll/tc0;J)J

    .line 197
    .line 198
    .line 199
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 200
    .line 201
    invoke-static {p2}, Ll/tc0;->t5(Ll/tc0;)Z

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    if-ne p2, v0, :cond_3

    .line 206
    .line 207
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 208
    .line 209
    invoke-static {p2}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    if-eqz p2, :cond_3

    .line 214
    .line 215
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 216
    .line 217
    invoke-static {p2}, Ll/tc0;->v5(Ll/tc0;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-static {p2, v0}, Ll/tc0;->w5(Ll/tc0;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 225
    .line 226
    invoke-static {p2, v5}, Ll/tc0;->u5(Ll/tc0;Z)Z

    .line 227
    .line 228
    .line 229
    :cond_3
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 230
    .line 231
    invoke-static {p2}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    if-eqz p2, :cond_4

    .line 236
    .line 237
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 238
    .line 239
    invoke-static {p2}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    invoke-interface {p2, p1, v3, v4, p3}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 244
    .line 245
    .line 246
    :cond_4
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 247
    .line 248
    invoke-static {p1}, Ll/tc0;->x5(Ll/tc0;)I

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 253
    .line 254
    if-lez p1, :cond_5

    .line 255
    .line 256
    invoke-static {p2}, Ll/tc0;->x5(Ll/tc0;)I

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    :goto_0
    move v5, p1

    .line 261
    goto :goto_1

    .line 262
    :cond_5
    invoke-static {p2}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iget p1, p1, Ll/uow;->S0:I

    .line 267
    .line 268
    if-eqz p1, :cond_6

    .line 269
    .line 270
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 271
    .line 272
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    iget p1, p1, Ll/uow;->S0:I

    .line 277
    .line 278
    goto :goto_0

    .line 279
    :cond_6
    const/16 p1, 0xf

    .line 280
    .line 281
    goto :goto_0

    .line 282
    :goto_1
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 283
    .line 284
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    iget p1, p1, Ll/tow;->k:I

    .line 289
    .line 290
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 291
    .line 292
    if-lez p1, :cond_7

    .line 293
    .line 294
    invoke-static {v0}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iget-boolean v1, p1, Ll/ror;->h1:Z

    .line 299
    .line 300
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 301
    .line 302
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    iget v2, p1, Ll/tow;->k:I

    .line 307
    .line 308
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 309
    .line 310
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    iget v3, p1, Ll/tow;->l:I

    .line 315
    .line 316
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 317
    .line 318
    invoke-static {p1}, Ll/tc0;->y5(Ll/tc0;)I

    .line 319
    .line 320
    .line 321
    move-result v4

    .line 322
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 323
    .line 324
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    iget-object v6, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 329
    .line 330
    invoke-static/range {v0 .. v6}, Ll/tc0;->u2(Ll/tc0;ZIIIILjava/lang/String;)V

    .line 331
    .line 332
    .line 333
    goto :goto_2

    .line 334
    :cond_7
    invoke-static {v0}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    iget-boolean v1, p1, Ll/ror;->h1:Z

    .line 339
    .line 340
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 341
    .line 342
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iget v2, p1, Ll/tow;->s:I

    .line 347
    .line 348
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 349
    .line 350
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    iget v3, p1, Ll/tow;->t:I

    .line 355
    .line 356
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 357
    .line 358
    invoke-static {p1}, Ll/tc0;->y5(Ll/tc0;)I

    .line 359
    .line 360
    .line 361
    move-result v4

    .line 362
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 363
    .line 364
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    iget-object v6, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 369
    .line 370
    invoke-static/range {v0 .. v6}, Ll/tc0;->u2(Ll/tc0;ZIIIILjava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :goto_2
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 374
    .line 375
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 376
    .line 377
    .line 378
    move-result-object p1

    .line 379
    iget-boolean p1, p1, Ll/ror;->h1:Z

    .line 380
    .line 381
    if-eqz p1, :cond_8

    .line 382
    .line 383
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 384
    .line 385
    invoke-static {p1}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-virtual {p1}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    if-lez p1, :cond_8

    .line 398
    .line 399
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 400
    .line 401
    invoke-static {p1}, Ll/tc0;->w2(Ll/tc0;)Z

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    if-nez p1, :cond_8

    .line 406
    .line 407
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 408
    .line 409
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 410
    .line 411
    .line 412
    move-result-object p1

    .line 413
    iget-object p1, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 414
    .line 415
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 416
    .line 417
    .line 418
    move-result p1

    .line 419
    if-nez p1, :cond_8

    .line 420
    .line 421
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 422
    .line 423
    invoke-static {p0}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    iget-object p1, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 428
    .line 429
    invoke-static {p0, p1}, Ll/tc0;->x2(Ll/tc0;Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    :cond_8
    return-void
.end method

.method public onLastmileQuality(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onLastmileQuality "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 32
    .line 33
    const/16 v2, 0x1005

    .line 34
    .line 35
    invoke-interface {v0, v2, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onLeaveChannel(Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " onLeaveChannelstats:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 34
    .line 35
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 41
    .line 42
    invoke-static {v0}, Ll/tc0;->T4(Ll/tc0;)Ll/wvx;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txBytes:I

    .line 47
    .line 48
    int-to-long v1, v1

    .line 49
    iput-wide v1, v0, Ll/wvx;->B:J

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v1, ""

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txBytes:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "/"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget p1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->totalDuration:I

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "AgoraJzheng"

    .line 78
    .line 79
    invoke-static {v0, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 83
    .line 84
    invoke-static {p1}, Ll/tc0;->U4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 91
    .line 92
    invoke-static {p0}, Ll/tc0;->U4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;->onExitRoom()V

    .line 97
    .line 98
    .line 99
    :cond_1
    return-void
.end method

.method public onLocalAudioStateChanged(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2}, Ll/kod0;->k(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onLocalVideoStats(Lio/agora/rtc2/Constants$VideoSourceType;Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "onLocalVideoStatsstats:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 20
    .line 21
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 25
    .line 26
    invoke-static {p1, p2}, Ll/tc0;->K4(Ll/tc0;Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;)Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 27
    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 32
    .line 33
    invoke-static {p1}, Ll/tc0;->L4(Ll/tc0;)Ll/wvx;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 38
    .line 39
    invoke-static {v0}, Ll/tc0;->M4(Ll/tc0;)Ll/uow;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-boolean v0, v0, Ll/uow;->H0:Z

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    const-wide/16 v0, 0x2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    :goto_0
    iput-wide v0, p1, Ll/wvx;->g:J

    .line 53
    .line 54
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 55
    .line 56
    invoke-static {p1}, Ll/tc0;->N4(Ll/tc0;)Ll/wvx;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget v0, p2, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameCount:I

    .line 61
    .line 62
    int-to-long v0, v0

    .line 63
    iput-wide v0, p1, Ll/wvx;->H:J

    .line 64
    .line 65
    :cond_1
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-static {p1, v0}, Ll/tc0;->O4(Ll/tc0;Z)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    const/4 v1, 0x1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 76
    .line 77
    invoke-static {p1, v1}, Ll/tc0;->O4(Ll/tc0;Z)Z

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 81
    .line 82
    invoke-static {p1, v0}, Ll/tc0;->P4(Ll/tc0;Z)Z

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 86
    .line 87
    invoke-static {p1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const/16 v2, 0x1003

    .line 92
    .line 93
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 94
    .line 95
    invoke-interface {p1, v2, v0, v0, v3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 99
    .line 100
    invoke-static {p1}, Ll/tc0;->R4(Ll/tc0;)I

    .line 101
    .line 102
    .line 103
    :cond_2
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 104
    .line 105
    invoke-static {p1}, Ll/tc0;->H4(Ll/tc0;)Ll/wpw;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 112
    .line 113
    invoke-static {p1}, Ll/tc0;->S4(Ll/tc0;)Ll/imw;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 118
    .line 119
    invoke-static {v2}, Ll/tc0;->J4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentBitrate:I

    .line 124
    .line 125
    iput v2, p1, Ll/imw;->a:I

    .line 126
    .line 127
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 128
    .line 129
    invoke-static {p1}, Ll/tc0;->S4(Ll/tc0;)Ll/imw;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 134
    .line 135
    invoke-static {v2}, Ll/tc0;->J4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentFrameRate:I

    .line 140
    .line 141
    iput v2, p1, Ll/imw;->b:I

    .line 142
    .line 143
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 144
    .line 145
    invoke-static {p1}, Ll/tc0;->H4(Ll/tc0;)Ll/wpw;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 150
    .line 151
    invoke-static {v2}, Ll/tc0;->S4(Ll/tc0;)Ll/imw;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-interface {p1, v2}, Ll/wpw;->b(Ll/imw;)V

    .line 156
    .line 157
    .line 158
    :cond_3
    iget p1, p2, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->targetBitrate:I

    .line 159
    .line 160
    mul-int/lit16 p1, p1, 0x3e8

    .line 161
    .line 162
    iget p2, p2, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->targetFrameRate:I

    .line 163
    .line 164
    if-eqz p1, :cond_7

    .line 165
    .line 166
    if-eqz p2, :cond_7

    .line 167
    .line 168
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 169
    .line 170
    invoke-static {v2}, Ll/tc0;->I3(Ll/tc0;)I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-ne v2, p1, :cond_4

    .line 175
    .line 176
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 177
    .line 178
    invoke-static {v2}, Ll/tc0;->U3(Ll/tc0;)I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eq v2, p2, :cond_7

    .line 183
    .line 184
    :cond_4
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 185
    .line 186
    invoke-static {v2}, Ll/tc0;->I3(Ll/tc0;)I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    const/16 v3, 0x2005

    .line 191
    .line 192
    if-gt v2, p1, :cond_6

    .line 193
    .line 194
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 195
    .line 196
    invoke-static {v2}, Ll/tc0;->U3(Ll/tc0;)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-le v2, p2, :cond_5

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_5
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 204
    .line 205
    invoke-static {v1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-interface {v1, v3, v0, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_6
    :goto_1
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 214
    .line 215
    invoke-static {v2}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-interface {v2, v3, v1, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 220
    .line 221
    .line 222
    :goto_2
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 223
    .line 224
    invoke-static {v0, p1}, Ll/tc0;->K3(Ll/tc0;I)I

    .line 225
    .line 226
    .line 227
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 228
    .line 229
    invoke-static {p0, p2}, Ll/tc0;->W3(Ll/tc0;I)I

    .line 230
    .line 231
    .line 232
    :cond_7
    return-void
.end method

.method public onMediaEngineLoadSuccess()V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 6
    .line 7
    const-string v1, "onMediaEngineLoadSuccess"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onNetworkQuality(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->A4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/tc0;->A4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1, p2, p3}, Lcom/immomo/mediacore/coninf/MRtcQualityHandler;->onNetworkQuality(III)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget p1, p1, Ll/uow;->B0:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 37
    .line 38
    invoke-static {v0}, Ll/tc0;->C4(Ll/tc0;)Ll/wvx;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput p2, v0, Ll/wvx;->q0:I

    .line 43
    .line 44
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 45
    .line 46
    invoke-static {v0}, Ll/tc0;->E4(Ll/tc0;)Ll/wvx;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput p3, v0, Ll/wvx;->r0:I

    .line 51
    .line 52
    :cond_1
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 53
    .line 54
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p1, p2, p3}, Ll/kod0;->l(III)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public onRejoinChannelSuccess(Ljava/lang/String;II)V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "onRejoinChannelSuccess "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, " "

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "MyEngineEventHandler"

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onRemoteAudioStateChanged(IIII)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->d5(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "onRemoteAudioStateChanged"

    .line 20
    .line 21
    filled-new-array {v4, v1, v2, v3}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-ne p2, v0, :cond_0

    .line 30
    .line 31
    invoke-super {p0, p1, p2, p3, p4}, Lio/agora/rtc2/IRtcEngineEventHandler;->onRemoteAudioStateChanged(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 35
    .line 36
    invoke-static {p2}, Ll/tc0;->x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    int-to-long v3, p1

    .line 41
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p2, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ll/xhy;

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/xhy;->e()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-nez p2, :cond_0

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/xhy;->h(Z)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide p2

    .line 66
    invoke-virtual {p1}, Ll/xhy;->b()J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    sub-long v9, p2, v0

    .line 71
    .line 72
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 73
    .line 74
    invoke-static {p2}, Ll/tc0;->e5(Ll/tc0;)Ll/evx;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1}, Ll/xhy;->c()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 83
    .line 84
    invoke-static {p0}, Ll/tc0;->E3(Ll/tc0;)J

    .line 85
    .line 86
    .line 87
    move-result-wide v5

    .line 88
    invoke-virtual {p1}, Ll/xhy;->a()J

    .line 89
    .line 90
    .line 91
    move-result-wide v7

    .line 92
    invoke-virtual/range {v1 .. v10}, Ll/evx;->b(IJJJJ)V

    .line 93
    .line 94
    .line 95
    :cond_0
    return-void
.end method

.method public onRemoteAudioStats(Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->uid:I

    .line 10
    .line 11
    int-to-long v0, v0

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/iny;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    iget v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->receivedBitrate:I

    .line 25
    .line 26
    int-to-long v0, v0

    .line 27
    iput-wide v0, p0, Ll/iny;->a:J

    .line 28
    .line 29
    iget v0, p0, Ll/iny;->t:I

    .line 30
    .line 31
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->plcCount:I

    .line 32
    .line 33
    add-int/2addr v0, v1

    .line 34
    iput v0, p0, Ll/iny;->t:I

    .line 35
    .line 36
    iget v0, p0, Ll/iny;->u:I

    .line 37
    .line 38
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenRateByCustomPlcCount:I

    .line 39
    .line 40
    add-int/2addr v0, v2

    .line 41
    iput v0, p0, Ll/iny;->u:I

    .line 42
    .line 43
    iget v0, p0, Ll/iny;->z:I

    .line 44
    .line 45
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->audioLossRate:I

    .line 46
    .line 47
    mul-int/lit8 v2, v2, 0xa

    .line 48
    .line 49
    add-int/2addr v0, v2

    .line 50
    iput v0, p0, Ll/iny;->z:I

    .line 51
    .line 52
    iget v0, p0, Ll/iny;->A:I

    .line 53
    .line 54
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->networkTransportDelay:I

    .line 55
    .line 56
    add-int/2addr v0, v2

    .line 57
    iput v0, p0, Ll/iny;->A:I

    .line 58
    .line 59
    iget v0, p0, Ll/iny;->j:I

    .line 60
    .line 61
    iget v3, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->jitterBufferDelay:I

    .line 62
    .line 63
    add-int/2addr v3, v2

    .line 64
    add-int/2addr v0, v3

    .line 65
    iput v0, p0, Ll/iny;->j:I

    .line 66
    .line 67
    iget v0, p0, Ll/iny;->B:I

    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    iput v0, p0, Ll/iny;->B:I

    .line 72
    .line 73
    iget v0, p0, Ll/iny;->F:I

    .line 74
    .line 75
    mul-int/lit8 v1, v1, 0xa

    .line 76
    .line 77
    add-int/2addr v0, v1

    .line 78
    iput v0, p0, Ll/iny;->F:I

    .line 79
    .line 80
    iget p1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->rxAudioBytes:I

    .line 81
    .line 82
    int-to-long v0, p1

    .line 83
    iput-wide v0, p0, Ll/iny;->f:J

    .line 84
    .line 85
    :cond_0
    return-void
.end method

.method public onRemoteVideoStateChanged(IIII)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->Z4(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "uid:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ", state:"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ", reason:"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "onRemoteVideoStateChanged"

    .line 38
    .line 39
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    if-eq p2, v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p2, 0x6

    .line 51
    if-ne p3, p2, :cond_3

    .line 52
    .line 53
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 54
    .line 55
    iput p1, p2, Ll/tc0;->X2:I

    .line 56
    .line 57
    invoke-static {p2}, Ll/tc0;->d4(Ll/tc0;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iget-object p3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 70
    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    invoke-static {p3}, Ll/tc0;->a5(Ll/tc0;)Ll/evx;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    if-eqz p2, :cond_1

    .line 78
    .line 79
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 80
    .line 81
    invoke-static {p2}, Ll/tc0;->c5(Ll/tc0;)Ll/evx;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    new-instance p3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string p4, "onRemoteVideoStateChanged remoteUid "

    .line 88
    .line 89
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p4, ",text"

    .line 96
    .line 97
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    invoke-virtual {p2, p3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ll/tc0;->j8(I)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    invoke-virtual {p3, p1, p4}, Ll/tc0;->O6(II)V

    .line 118
    .line 119
    .line 120
    :cond_3
    :goto_0
    return-void
.end method

.method public onRemoteVideoStats(Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, " onRemoteVideoStatsstats:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, "w "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->width:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, " h "

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->height:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, " bits "

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->receivedBitrate:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, " fps "

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rendererOutputFrameRate:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 60
    .line 61
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 65
    .line 66
    invoke-static {v0}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->uid:I

    .line 71
    .line 72
    int-to-long v1, v1

    .line 73
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/iny;

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->receivedBitrate:I

    .line 86
    .line 87
    iget v2, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rendererOutputFrameRate:I

    .line 88
    .line 89
    iget v3, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->width:I

    .line 90
    .line 91
    iget v4, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->height:I

    .line 92
    .line 93
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/iny;->k(IIII)V

    .line 94
    .line 95
    .line 96
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->packetLossRate:I

    .line 97
    .line 98
    iput v1, v0, Ll/iny;->m:I

    .line 99
    .line 100
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rxVideoBytes:I

    .line 101
    .line 102
    int-to-long v1, v1

    .line 103
    iput-wide v1, v0, Ll/iny;->e:J

    .line 104
    .line 105
    iget-wide v1, v0, Ll/iny;->c:J

    .line 106
    .line 107
    iget v3, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->decoderOutputFrameRate:I

    .line 108
    .line 109
    int-to-long v3, v3

    .line 110
    add-long/2addr v1, v3

    .line 111
    iput-wide v1, v0, Ll/iny;->c:J

    .line 112
    .line 113
    iget v1, v0, Ll/iny;->C:I

    .line 114
    .line 115
    add-int/lit8 v1, v1, 0x1

    .line 116
    .line 117
    iput v1, v0, Ll/iny;->C:I

    .line 118
    .line 119
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->e2eDelay:I

    .line 120
    .line 121
    iput v1, v0, Ll/iny;->l:I

    .line 122
    .line 123
    iget v1, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->totalFrozenTime:I

    .line 124
    .line 125
    iget v2, v0, Ll/iny;->H:I

    .line 126
    .line 127
    sub-int v3, v1, v2

    .line 128
    .line 129
    if-lez v3, :cond_0

    .line 130
    .line 131
    iget v3, v0, Ll/iny;->G:I

    .line 132
    .line 133
    sub-int v2, v1, v2

    .line 134
    .line 135
    add-int/2addr v3, v2

    .line 136
    iput v3, v0, Ll/iny;->G:I

    .line 137
    .line 138
    :cond_0
    iput v1, v0, Ll/iny;->H:I

    .line 139
    .line 140
    :cond_1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 141
    .line 142
    invoke-static {v0, p1}, Ll/tc0;->G4(Ll/tc0;Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 146
    .line 147
    invoke-static {p1}, Ll/tc0;->H4(Ll/tc0;)Ll/wpw;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    if-eqz p1, :cond_2

    .line 152
    .line 153
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 154
    .line 155
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 160
    .line 161
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->delay:I

    .line 166
    .line 167
    iput v0, p1, Ll/tpw;->b:I

    .line 168
    .line 169
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 170
    .line 171
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 176
    .line 177
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->height:I

    .line 182
    .line 183
    iput v0, p1, Ll/tpw;->d:I

    .line 184
    .line 185
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 186
    .line 187
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 192
    .line 193
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->delay:I

    .line 198
    .line 199
    iput v0, p1, Ll/tpw;->b:I

    .line 200
    .line 201
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 202
    .line 203
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 208
    .line 209
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->receivedBitrate:I

    .line 214
    .line 215
    iput v0, p1, Ll/tpw;->e:I

    .line 216
    .line 217
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 218
    .line 219
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 224
    .line 225
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rendererOutputFrameRate:I

    .line 230
    .line 231
    iput v0, p1, Ll/tpw;->f:I

    .line 232
    .line 233
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 234
    .line 235
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 240
    .line 241
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rxStreamType:I

    .line 246
    .line 247
    iput v0, p1, Ll/tpw;->g:I

    .line 248
    .line 249
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 250
    .line 251
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 256
    .line 257
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->uid:I

    .line 262
    .line 263
    iput v0, p1, Ll/tpw;->a:I

    .line 264
    .line 265
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 266
    .line 267
    invoke-static {p1}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 272
    .line 273
    invoke-static {v0}, Ll/tc0;->F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->width:I

    .line 278
    .line 279
    iput v0, p1, Ll/tpw;->c:I

    .line 280
    .line 281
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 282
    .line 283
    invoke-static {p1}, Ll/tc0;->H4(Ll/tc0;)Ll/wpw;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 288
    .line 289
    invoke-static {p0}, Ll/tc0;->I4(Ll/tc0;)Ll/tpw;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    invoke-interface {p1, p0}, Ll/wpw;->a(Ll/tpw;)V

    .line 294
    .line 295
    .line 296
    :cond_2
    return-void
.end method

.method public onRemoteVideoTransportStats(IIII)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 10
    .line 11
    invoke-static {p2}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    int-to-long v0, p1

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p2, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 27
    .line 28
    invoke-static {p0}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/iny;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    int-to-long p1, p4

    .line 45
    iput-wide p1, p0, Ll/iny;->b:J

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public onRequestToken()V
    .locals 0

    .line 1
    return-void
.end method

.method public onRtcStats(Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onRtcStatsstats:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/tc0;->l4(Ll/tc0;Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 30
    .line 31
    invoke-static {p1}, Ll/tc0;->m4(Ll/tc0;)Ll/wvx;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 36
    .line 37
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txBytes:I

    .line 42
    .line 43
    int-to-long v0, v0

    .line 44
    iput-wide v0, p1, Ll/wvx;->B:J

    .line 45
    .line 46
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 47
    .line 48
    invoke-static {p1}, Ll/tc0;->n4(Ll/tc0;)Ll/wvx;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 53
    .line 54
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxAudioKBitRate:I

    .line 59
    .line 60
    int-to-long v0, v0

    .line 61
    iput-wide v0, p1, Ll/wvx;->O:J

    .line 62
    .line 63
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 64
    .line 65
    invoke-static {p1}, Ll/tc0;->o4(Ll/tc0;)Ll/wvx;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 70
    .line 71
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxBytes:I

    .line 76
    .line 77
    int-to-long v0, v0

    .line 78
    iput-wide v0, p1, Ll/wvx;->j:J

    .line 79
    .line 80
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 81
    .line 82
    invoke-static {p1}, Ll/tc0;->p4(Ll/tc0;)Ll/wvx;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 87
    .line 88
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxVideoBytes:I

    .line 93
    .line 94
    int-to-long v0, v0

    .line 95
    iput-wide v0, p1, Ll/wvx;->k:J

    .line 96
    .line 97
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 98
    .line 99
    invoke-static {p1}, Ll/tc0;->q4(Ll/tc0;)Ll/wvx;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 104
    .line 105
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxAudioBytes:I

    .line 110
    .line 111
    int-to-long v0, v0

    .line 112
    iput-wide v0, p1, Ll/wvx;->l:J

    .line 113
    .line 114
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 115
    .line 116
    invoke-static {p1}, Ll/tc0;->r4(Ll/tc0;)Ll/wvx;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 121
    .line 122
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txVideoBytes:I

    .line 127
    .line 128
    int-to-long v0, v0

    .line 129
    iput-wide v0, p1, Ll/wvx;->J0:J

    .line 130
    .line 131
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 132
    .line 133
    invoke-static {p1}, Ll/tc0;->s4(Ll/tc0;)Ll/wvx;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 138
    .line 139
    invoke-static {v0}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txAudioBytes:I

    .line 144
    .line 145
    int-to-long v0, v0

    .line 146
    iput-wide v0, p1, Ll/wvx;->I0:J

    .line 147
    .line 148
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 149
    .line 150
    invoke-static {p1}, Ll/tc0;->t4(Ll/tc0;)J

    .line 151
    .line 152
    .line 153
    move-result-wide v0

    .line 154
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 155
    .line 156
    invoke-static {v2}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txVideoKBitRate:I

    .line 161
    .line 162
    mul-int/lit16 v2, v2, 0x3e8

    .line 163
    .line 164
    div-int/lit8 v2, v2, 0x8

    .line 165
    .line 166
    int-to-long v2, v2

    .line 167
    add-long/2addr v0, v2

    .line 168
    invoke-static {p1, v0, v1}, Ll/tc0;->u4(Ll/tc0;J)J

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 172
    .line 173
    invoke-static {p1}, Ll/tc0;->v4(Ll/tc0;)J

    .line 174
    .line 175
    .line 176
    move-result-wide v0

    .line 177
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 178
    .line 179
    invoke-static {v2}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    iget v2, v2, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txAudioKBitRate:I

    .line 184
    .line 185
    mul-int/lit16 v2, v2, 0x3e8

    .line 186
    .line 187
    div-int/lit8 v2, v2, 0x8

    .line 188
    .line 189
    int-to-long v2, v2

    .line 190
    add-long/2addr v0, v2

    .line 191
    invoke-static {p1, v0, v1}, Ll/tc0;->w4(Ll/tc0;J)J

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 195
    .line 196
    invoke-static {p1}, Ll/tc0;->x4(Ll/tc0;)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 201
    .line 202
    invoke-static {v1}, Ll/tc0;->k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    iget v1, v1, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxVideoKBitRate:I

    .line 207
    .line 208
    mul-int/lit16 v1, v1, 0x3e8

    .line 209
    .line 210
    div-int/lit8 v1, v1, 0x8

    .line 211
    .line 212
    add-int/2addr v0, v1

    .line 213
    invoke-static {p1, v0}, Ll/tc0;->y4(Ll/tc0;I)I

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 217
    .line 218
    invoke-static {p1}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    const/4 v0, 0x0

    .line 223
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 224
    .line 225
    const/16 v2, 0x1002

    .line 226
    .line 227
    invoke-interface {p1, v2, v0, v0, v1}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 231
    .line 232
    invoke-static {p0}, Ll/tc0;->z4(Ll/tc0;)Ll/ypw;

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public onRtmpStreamingStateChanged(Ljava/lang/String;II)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->y2(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "onRtmpStreamingStateChanged "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ",state:"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ",code:"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 45
    .line 46
    invoke-static {v0}, Ll/tc0;->z2(Ll/tc0;)Ll/evx;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, ""

    .line 53
    .line 54
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v2, ":"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v2, "AgoraRtmpState"

    .line 73
    .line 74
    invoke-virtual {v0, v2, v1}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    const/4 v1, 0x1

    .line 79
    const/4 v2, 0x2

    .line 80
    if-ne v2, p2, :cond_1

    .line 81
    .line 82
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 83
    .line 84
    invoke-static {v3, v1}, Ll/tc0;->A2(Ll/tc0;Z)Z

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 88
    .line 89
    invoke-static {v3}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    if-eqz v3, :cond_0

    .line 94
    .line 95
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 96
    .line 97
    invoke-static {v3}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v3}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-lez v3, :cond_0

    .line 110
    .line 111
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 112
    .line 113
    invoke-static {v3}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    if-eqz v3, :cond_0

    .line 118
    .line 119
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 120
    .line 121
    invoke-static {v3}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget-object v4, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 126
    .line 127
    invoke-static {v4}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v3, v4}, Lio/agora/rtc2/RtcEngine;->updateRtmpTranscoding(Lio/agora/rtc2/live/LiveTranscoding;)I

    .line 132
    .line 133
    .line 134
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 135
    .line 136
    invoke-virtual {v3}, Ll/tc0;->D6()V

    .line 137
    .line 138
    .line 139
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 140
    .line 141
    invoke-static {v3}, Ll/tc0;->B2(Ll/tc0;)Ll/evx;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    const-string v4, "onRtmpStreamingStateChanged"

    .line 146
    .line 147
    const-string v5, "rtmpState updateRtmpTranscoding"

    .line 148
    .line 149
    filled-new-array {v4, v5}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-virtual {v3, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    :cond_0
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 157
    .line 158
    invoke-static {v3}, Ll/tc0;->C2(Ll/tc0;)Ll/wvx;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    iput-object p1, v3, Ll/wvx;->x:Ljava/lang/String;

    .line 163
    .line 164
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 165
    .line 166
    invoke-static {v3, v1}, Ll/tc0;->D2(Ll/tc0;Z)Z

    .line 167
    .line 168
    .line 169
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 170
    .line 171
    invoke-static {v3}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    const/16 v4, 0x1008

    .line 176
    .line 177
    iget-object v5, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 178
    .line 179
    invoke-interface {v3, v4, v0, v0, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    :cond_1
    const/4 v3, 0x4

    .line 183
    if-ne v3, p2, :cond_3

    .line 184
    .line 185
    if-eq p3, v1, :cond_2

    .line 186
    .line 187
    const/4 v1, 0x3

    .line 188
    if-eq p3, v1, :cond_2

    .line 189
    .line 190
    if-eq p3, v2, :cond_2

    .line 191
    .line 192
    if-eq p3, v3, :cond_2

    .line 193
    .line 194
    const/4 v1, 0x5

    .line 195
    if-eq p3, v1, :cond_2

    .line 196
    .line 197
    const/4 v1, 0x7

    .line 198
    if-eq p3, v1, :cond_2

    .line 199
    .line 200
    const/16 v1, 0x8

    .line 201
    .line 202
    if-eq p3, v1, :cond_2

    .line 203
    .line 204
    const/16 v1, 0x9

    .line 205
    .line 206
    if-eq p3, v1, :cond_2

    .line 207
    .line 208
    const/16 v1, 0xb

    .line 209
    .line 210
    if-eq p3, v1, :cond_2

    .line 211
    .line 212
    const/16 v1, 0xd

    .line 213
    .line 214
    if-eq p3, v1, :cond_2

    .line 215
    .line 216
    const/16 v1, 0xe

    .line 217
    .line 218
    if-eq p3, v1, :cond_2

    .line 219
    .line 220
    const/16 v1, 0xf

    .line 221
    .line 222
    if-ne p3, v1, :cond_3

    .line 223
    .line 224
    :cond_2
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 225
    .line 226
    invoke-static {v1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    if-eqz v1, :cond_3

    .line 231
    .line 232
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 233
    .line 234
    invoke-static {v1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v1, p1, p3}, Ll/kod0;->p(Ljava/lang/String;I)V

    .line 239
    .line 240
    .line 241
    :cond_3
    if-eqz p2, :cond_4

    .line 242
    .line 243
    if-ne v3, p2, :cond_5

    .line 244
    .line 245
    :cond_4
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 246
    .line 247
    invoke-static {v1, v0}, Ll/tc0;->A2(Ll/tc0;Z)Z

    .line 248
    .line 249
    .line 250
    :cond_5
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 251
    .line 252
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    if-eqz v0, :cond_6

    .line 257
    .line 258
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 259
    .line 260
    invoke-static {v0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 265
    .line 266
    invoke-static {v0}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iget-object v6, v0, Ll/ror;->g1:Ljava/lang/String;

    .line 271
    .line 272
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 273
    .line 274
    invoke-static {p0}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    iget v7, p0, Ll/uow;->B0:I

    .line 279
    .line 280
    const-string v5, "agora"

    .line 281
    .line 282
    move-object v2, p1

    .line 283
    move v3, p2

    .line 284
    move v4, p3

    .line 285
    invoke-virtual/range {v1 .. v7}, Ll/kod0;->q(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;I)V

    .line 286
    .line 287
    .line 288
    :cond_6
    return-void
.end method

.method public onStreamMessage(II[B)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tc0;->Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2, p3}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onStreamMessage(II[B)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onStreamMessageError(IIIII)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tc0;->Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    move v1, p1

    .line 16
    move v2, p2

    .line 17
    move v3, p3

    .line 18
    move v4, p4

    .line 19
    move v5, p5

    .line 20
    invoke-interface/range {v0 .. v5}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onStreamMessageError(IIIII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onTokenPrivilegeWillExpire(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->D4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/tc0;->D4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;->onTokenPrivilegeWillExpire(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 19
    .line 20
    invoke-static {p1}, Ll/tc0;->Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 27
    .line 28
    invoke-static {p0}, Ll/tc0;->Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onRequestChannelKey()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public onUserJoined(II)V
    .locals 12

    .line 1
    new-instance v0, Ll/xhy;

    .line 2
    .line 3
    int-to-long v4, p1

    .line 4
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 5
    .line 6
    invoke-virtual {v1}, Ll/tc0;->w1()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "S"

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v10, 0x1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v10

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v1, 0x2

    .line 22
    :goto_0
    invoke-direct {v0, v4, v5, v1}, Ll/xhy;-><init>(JI)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 26
    .line 27
    invoke-static {v1}, Ll/tc0;->l3(Ll/tc0;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    const-wide/16 v6, -0x1

    .line 32
    .line 33
    cmp-long v1, v1, v6

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-virtual {v0, v1, v2}, Ll/xhy;->j(J)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    iget-object v3, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 49
    .line 50
    invoke-static {v3}, Ll/tc0;->l3(Ll/tc0;)J

    .line 51
    .line 52
    .line 53
    move-result-wide v6

    .line 54
    sub-long/2addr v1, v6

    .line 55
    invoke-virtual {v0, v1, v2}, Ll/xhy;->i(J)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 59
    .line 60
    invoke-static {v1}, Ll/tc0;->x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v1, v2, v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 72
    .line 73
    invoke-static {v1}, Ll/tc0;->F3(Ll/tc0;)Ll/evx;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0}, Ll/xhy;->c()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 82
    .line 83
    invoke-static {v2}, Ll/tc0;->E3(Ll/tc0;)J

    .line 84
    .line 85
    .line 86
    move-result-wide v6

    .line 87
    invoke-virtual {v0}, Ll/xhy;->a()J

    .line 88
    .line 89
    .line 90
    move-result-wide v8

    .line 91
    const/4 v2, 0x1

    .line 92
    invoke-virtual/range {v1 .. v9}, Ll/evx;->e(ZIJJJ)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 96
    .line 97
    invoke-static {v1}, Ll/tc0;->G3(Ll/tc0;)Ll/evx;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v3, "uid:"

    .line 104
    .line 105
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    const-string v3, "onUserJoined"

    .line 116
    .line 117
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    new-instance v2, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v3, " onUserJoined:uid:"

    .line 145
    .line 146
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v3, ",elapsed:"

    .line 153
    .line 154
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    const-string v3, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 165
    .line 166
    invoke-virtual {v1, v3, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 170
    .line 171
    invoke-static {v1}, Ll/tc0;->H3(Ll/tc0;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-nez v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 178
    .line 179
    invoke-static {v1}, Ll/tc0;->J3(Ll/tc0;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_3

    .line 184
    .line 185
    :cond_2
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 186
    .line 187
    invoke-static {v1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    iget v1, v1, Ll/ror;->i1:I

    .line 192
    .line 193
    if-eq v1, p1, :cond_3

    .line 194
    .line 195
    invoke-virtual {v0, v10}, Ll/xhy;->f(Z)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, v10}, Ll/xhy;->g(Z)V

    .line 199
    .line 200
    .line 201
    iget-object v1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 202
    .line 203
    invoke-static {v1}, Ll/tc0;->L3(Ll/tc0;)Ll/evx;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v0}, Ll/xhy;->c()I

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 212
    .line 213
    invoke-static {v2}, Ll/tc0;->E3(Ll/tc0;)J

    .line 214
    .line 215
    .line 216
    move-result-wide v6

    .line 217
    invoke-virtual {v0}, Ll/xhy;->a()J

    .line 218
    .line 219
    .line 220
    move-result-wide v8

    .line 221
    const-wide/16 v10, -0x1

    .line 222
    .line 223
    const/4 v2, 0x1

    .line 224
    invoke-virtual/range {v1 .. v11}, Ll/evx;->c(ZIJJJJ)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 228
    .line 229
    invoke-static {v0}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    const/4 v1, 0x0

    .line 234
    iget-object v2, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 235
    .line 236
    const/16 v3, 0x2006

    .line 237
    .line 238
    invoke-interface {v0, v3, p1, v1, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 242
    .line 243
    invoke-static {v0}, Ll/tc0;->N3(Ll/tc0;)Landroid/os/Handler;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    new-instance v1, Ll/tc0$e$a;

    .line 248
    .line 249
    invoke-direct {v1, p0, p1}, Ll/tc0$e$a;-><init>(Ll/tc0$e;I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 253
    .line 254
    .line 255
    :cond_3
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 256
    .line 257
    invoke-static {p1}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    new-instance v1, Ll/iny;

    .line 266
    .line 267
    invoke-direct {v1, v4, v5}, Ll/iny;-><init>(J)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p1, v0, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 274
    .line 275
    invoke-static {p1}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    if-eqz p1, :cond_4

    .line 280
    .line 281
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 282
    .line 283
    invoke-static {p0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    const-string p1, ""

    .line 288
    .line 289
    invoke-interface {p0, p1, v4, v5, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 290
    .line 291
    .line 292
    :cond_4
    return-void
.end method

.method public onUserMuteAudio(IZ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onUserMuteAudiouid:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ",muted:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 33
    .line 34
    invoke-static {v0}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    int-to-long v1, p1

    .line 39
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/iny;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0, p2}, Ll/iny;->g(Z)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 55
    .line 56
    invoke-static {v0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 63
    .line 64
    invoke-static {p0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteAudio(IZ)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public onUserMuteVideo(IZ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onUserMuteVideouid:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ",muted:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 33
    .line 34
    invoke-static {v0}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    int-to-long v1, p1

    .line 39
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/iny;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0, p2}, Ll/iny;->h(Z)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 55
    .line 56
    invoke-static {v0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 63
    .line 64
    invoke-static {p0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteVideo(IZ)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public onUserOffline(II)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v7, p2

    .line 6
    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v4, "onUserOffline:uid:"

    .line 14
    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v12, ",reason:"

    .line 22
    .line 23
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string v13, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 34
    .line 35
    invoke-virtual {v2, v13, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 39
    .line 40
    invoke-static {v2}, Ll/tc0;->P3(Ll/tc0;)Ll/evx;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v4, "onUserOffline uid:"

    .line 47
    .line 48
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v2, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 72
    .line 73
    invoke-static {v2}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const-wide/16 v3, 0x0

    .line 78
    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 82
    .line 83
    invoke-static {v2}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    int-to-long v5, v1

    .line 88
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {v2, v8}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_1

    .line 97
    .line 98
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 99
    .line 100
    invoke-static {v2}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-virtual {v2, v8}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Ll/iny;

    .line 113
    .line 114
    if-eqz v2, :cond_0

    .line 115
    .line 116
    iget-wide v3, v2, Ll/iny;->d:J

    .line 117
    .line 118
    :cond_0
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 119
    .line 120
    invoke-static {v2}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v2, v5}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    :cond_1
    move-wide v8, v3

    .line 132
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 133
    .line 134
    invoke-static {v2}, Ll/tc0;->x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    if-eqz v2, :cond_3

    .line 139
    .line 140
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 141
    .line 142
    invoke-static {v2}, Ll/tc0;->x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    int-to-long v5, v1

    .line 147
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v2, v3}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-eqz v2, :cond_3

    .line 156
    .line 157
    new-instance v2, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string v3, "onMemberExit userid "

    .line 160
    .line 161
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v3, " reason "

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    const-string v3, "zhengjijian"

    .line 180
    .line 181
    invoke-static {v3, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 185
    .line 186
    invoke-static {v2}, Ll/tc0;->Q3(Ll/tc0;)Ll/wvx;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    iget-wide v2, v2, Ll/wvx;->c1:J

    .line 191
    .line 192
    const-wide/16 v10, 0x1

    .line 193
    .line 194
    cmp-long v2, v2, v10

    .line 195
    .line 196
    if-nez v2, :cond_2

    .line 197
    .line 198
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 199
    .line 200
    invoke-static {v2}, Ll/tc0;->R3(Ll/tc0;)Ll/evx;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    iget-object v3, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 205
    .line 206
    invoke-static {v3}, Ll/tc0;->x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    invoke-virtual {v3, v4}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    check-cast v3, Ll/xhy;

    .line 219
    .line 220
    invoke-virtual {v3}, Ll/xhy;->c()I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    const/4 v3, 0x1

    .line 225
    invoke-virtual/range {v2 .. v7}, Ll/evx;->d(ZIJI)V

    .line 226
    .line 227
    .line 228
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 229
    .line 230
    invoke-static {v2}, Ll/tc0;->S3(Ll/tc0;)Ll/evx;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iget-object v3, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 235
    .line 236
    invoke-static {v3}, Ll/tc0;->x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    invoke-virtual {v3, v4}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    check-cast v3, Ll/xhy;

    .line 249
    .line 250
    invoke-virtual {v3}, Ll/xhy;->c()I

    .line 251
    .line 252
    .line 253
    move-result v4

    .line 254
    move-wide v14, v8

    .line 255
    move-wide v9, v5

    .line 256
    move-wide v5, v14

    .line 257
    const-wide/16 v7, 0x0

    .line 258
    .line 259
    const/4 v3, 0x1

    .line 260
    move/from16 v11, p2

    .line 261
    .line 262
    invoke-virtual/range {v2 .. v11}, Ll/evx;->f(ZIJJJI)V

    .line 263
    .line 264
    .line 265
    move v7, v11

    .line 266
    :cond_2
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 267
    .line 268
    invoke-static {v2}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    const/4 v3, 0x0

    .line 273
    iget-object v4, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 274
    .line 275
    const/16 v5, 0x2007

    .line 276
    .line 277
    invoke-interface {v2, v5, v1, v3, v4}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    :cond_3
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 281
    .line 282
    invoke-static {v2}, Ll/tc0;->M3(Ll/tc0;)Ll/ebl0;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    const/4 v3, 0x0

    .line 287
    if-eqz v2, :cond_6

    .line 288
    .line 289
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 290
    .line 291
    invoke-static {v2}, Ll/tc0;->T3(Ll/tc0;)Z

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    if-eqz v2, :cond_4

    .line 296
    .line 297
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 298
    .line 299
    invoke-static {v2}, Ll/tc0;->H3(Ll/tc0;)Z

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    if-nez v2, :cond_4

    .line 304
    .line 305
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 306
    .line 307
    invoke-static {v2}, Ll/tc0;->J3(Ll/tc0;)Z

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    if-eqz v2, :cond_6

    .line 312
    .line 313
    :cond_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    new-instance v4, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v5

    .line 330
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    const-string v5, "----onVideoChannelRemove userID="

    .line 334
    .line 335
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    invoke-virtual {v2, v13, v4}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 349
    .line 350
    invoke-static {v2}, Ll/tc0;->V3(Ll/tc0;)Ljava/util/ArrayList;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    if-eqz v2, :cond_5

    .line 363
    .line 364
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 365
    .line 366
    invoke-static {v2}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    if-eqz v2, :cond_5

    .line 371
    .line 372
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 373
    .line 374
    invoke-virtual {v2, v1, v3}, Ll/tc0;->Z7(ILandroid/view/View;)V

    .line 375
    .line 376
    .line 377
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 378
    .line 379
    invoke-static {v2}, Ll/tc0;->V3(Ll/tc0;)Ljava/util/ArrayList;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 384
    .line 385
    .line 386
    move-result-object v4

    .line 387
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    :cond_5
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 391
    .line 392
    invoke-static {v2}, Ll/tc0;->M3(Ll/tc0;)Ll/ebl0;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    int-to-long v4, v1

    .line 397
    invoke-interface {v2, v4, v5, v7}, Ll/ebl0;->b(JI)V

    .line 398
    .line 399
    .line 400
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 401
    .line 402
    invoke-static {v2}, Ll/tc0;->Y3(Ll/tc0;)Ll/evx;

    .line 403
    .line 404
    .line 405
    move-result-object v2

    .line 406
    new-instance v4, Ljava/lang/StringBuilder;

    .line 407
    .line 408
    const-string v5, "onVideoChannelRemove uid:"

    .line 409
    .line 410
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v4

    .line 426
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v4

    .line 430
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    :cond_6
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 434
    .line 435
    invoke-static {v2}, Ll/tc0;->Z3(Ll/tc0;)Ll/evx;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    iget-object v4, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 440
    .line 441
    invoke-static {v4}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 442
    .line 443
    .line 444
    move-result-object v4

    .line 445
    iget-boolean v4, v4, Ll/uow;->Z0:Z

    .line 446
    .line 447
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 448
    .line 449
    .line 450
    move-result-object v4

    .line 451
    const-string v5, "isUseTextureView"

    .line 452
    .line 453
    filled-new-array {v5, v4}, [Ljava/lang/Object;

    .line 454
    .line 455
    .line 456
    move-result-object v4

    .line 457
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 458
    .line 459
    .line 460
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 461
    .line 462
    invoke-static {v2}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 463
    .line 464
    .line 465
    move-result-object v2

    .line 466
    iget-boolean v2, v2, Ll/uow;->Z0:Z

    .line 467
    .line 468
    if-eqz v2, :cond_7

    .line 469
    .line 470
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 471
    .line 472
    invoke-static {v2}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 473
    .line 474
    .line 475
    move-result-object v2

    .line 476
    if-eqz v2, :cond_7

    .line 477
    .line 478
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 479
    .line 480
    invoke-static {v2}, Ll/tc0;->a4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 481
    .line 482
    .line 483
    move-result-object v2

    .line 484
    if-eqz v2, :cond_7

    .line 485
    .line 486
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 487
    .line 488
    invoke-static {v2}, Ll/tc0;->a4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 489
    .line 490
    .line 491
    move-result-object v2

    .line 492
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 493
    .line 494
    .line 495
    move-result-object v4

    .line 496
    invoke-virtual {v2, v4}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    move-result v2

    .line 500
    if-eqz v2, :cond_7

    .line 501
    .line 502
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 503
    .line 504
    invoke-static {v2}, Ll/tc0;->b4(Ll/tc0;)Ll/evx;

    .line 505
    .line 506
    .line 507
    move-result-object v2

    .line 508
    const-string v4, "setupRemoteVideoview null"

    .line 509
    .line 510
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v4

    .line 514
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 515
    .line 516
    .line 517
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 518
    .line 519
    invoke-virtual {v2, v1, v3}, Ll/tc0;->Z7(ILandroid/view/View;)V

    .line 520
    .line 521
    .line 522
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 523
    .line 524
    invoke-static {v2}, Ll/tc0;->a4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 525
    .line 526
    .line 527
    move-result-object v2

    .line 528
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 529
    .line 530
    .line 531
    move-result-object v4

    .line 532
    invoke-virtual {v2, v4}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    .line 534
    .line 535
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 536
    .line 537
    invoke-static {v2}, Ll/tc0;->c4(Ll/tc0;)Ll/gbl0;

    .line 538
    .line 539
    .line 540
    move-result-object v2

    .line 541
    if-eqz v2, :cond_7

    .line 542
    .line 543
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 544
    .line 545
    invoke-static {v2}, Ll/tc0;->c4(Ll/tc0;)Ll/gbl0;

    .line 546
    .line 547
    .line 548
    move-result-object v2

    .line 549
    int-to-long v4, v1

    .line 550
    invoke-interface {v2, v4, v5, v7}, Ll/gbl0;->b(JI)V

    .line 551
    .line 552
    .line 553
    :cond_7
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 554
    .line 555
    invoke-static {v2}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 556
    .line 557
    .line 558
    move-result-object v2

    .line 559
    if-eqz v2, :cond_8

    .line 560
    .line 561
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 562
    .line 563
    invoke-static {v2}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 564
    .line 565
    .line 566
    move-result-object v2

    .line 567
    int-to-long v4, v1

    .line 568
    invoke-interface {v2, v4, v5, v7}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserOffline(JI)V

    .line 569
    .line 570
    .line 571
    :cond_8
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 572
    .line 573
    invoke-static {v2}, Ll/tc0;->d4(Ll/tc0;)Ljava/util/ArrayList;

    .line 574
    .line 575
    .line 576
    move-result-object v2

    .line 577
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 578
    .line 579
    .line 580
    move-result-object v4

    .line 581
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 582
    .line 583
    .line 584
    move-result v2

    .line 585
    if-eqz v2, :cond_9

    .line 586
    .line 587
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 588
    .line 589
    invoke-static {v2}, Ll/tc0;->e4(Ll/tc0;)Ll/gkl0;

    .line 590
    .line 591
    .line 592
    move-result-object v2

    .line 593
    if-eqz v2, :cond_9

    .line 594
    .line 595
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 596
    .line 597
    invoke-static {v2}, Ll/tc0;->f4(Ll/tc0;)Ll/evx;

    .line 598
    .line 599
    .line 600
    move-result-object v2

    .line 601
    new-instance v4, Ljava/lang/StringBuilder;

    .line 602
    .line 603
    const-string v5, "remoteUidList removeid"

    .line 604
    .line 605
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 606
    .line 607
    .line 608
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 609
    .line 610
    .line 611
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v4

    .line 615
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v4

    .line 619
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 620
    .line 621
    .line 622
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 623
    .line 624
    invoke-static {v2}, Ll/tc0;->e4(Ll/tc0;)Ll/gkl0;

    .line 625
    .line 626
    .line 627
    move-result-object v2

    .line 628
    int-to-long v4, v1

    .line 629
    invoke-interface {v2, v4, v5, v7}, Ll/gkl0;->b(JI)V

    .line 630
    .line 631
    .line 632
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 633
    .line 634
    invoke-static {v2}, Ll/tc0;->d4(Ll/tc0;)Ljava/util/ArrayList;

    .line 635
    .line 636
    .line 637
    move-result-object v2

    .line 638
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 639
    .line 640
    .line 641
    :cond_9
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 642
    .line 643
    invoke-static {v2}, Ll/tc0;->h4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 644
    .line 645
    .line 646
    move-result-object v2

    .line 647
    if-eqz v2, :cond_d

    .line 648
    .line 649
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 650
    .line 651
    invoke-static {v2}, Ll/tc0;->h4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 652
    .line 653
    .line 654
    move-result-object v2

    .line 655
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 656
    .line 657
    .line 658
    move-result-object v4

    .line 659
    invoke-virtual {v2, v4}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 660
    .line 661
    .line 662
    move-result v2

    .line 663
    if-nez v2, :cond_a

    .line 664
    .line 665
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 666
    .line 667
    invoke-static {v2}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 668
    .line 669
    .line 670
    move-result-object v2

    .line 671
    iget v2, v2, Ll/uow;->B0:I

    .line 672
    .line 673
    if-ne v1, v2, :cond_d

    .line 674
    .line 675
    :cond_a
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 676
    .line 677
    invoke-static {v2}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 678
    .line 679
    .line 680
    move-result-object v2

    .line 681
    iget v2, v2, Ll/uow;->B0:I

    .line 682
    .line 683
    if-eq v1, v2, :cond_b

    .line 684
    .line 685
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 686
    .line 687
    invoke-static {v2}, Ll/tc0;->h4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 688
    .line 689
    .line 690
    move-result-object v2

    .line 691
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 692
    .line 693
    .line 694
    move-result-object v4

    .line 695
    invoke-virtual {v2, v4}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    .line 697
    .line 698
    :cond_b
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 699
    .line 700
    invoke-static {v2}, Ll/tc0;->T3(Ll/tc0;)Z

    .line 701
    .line 702
    .line 703
    move-result v2

    .line 704
    iget-object v4, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 705
    .line 706
    if-eqz v2, :cond_c

    .line 707
    .line 708
    invoke-static {v4}, Ll/tc0;->i4(Ll/tc0;)Ll/fbl0;

    .line 709
    .line 710
    .line 711
    move-result-object v2

    .line 712
    if-eqz v2, :cond_d

    .line 713
    .line 714
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 715
    .line 716
    .line 717
    move-result-object v2

    .line 718
    new-instance v3, Ljava/lang/StringBuilder;

    .line 719
    .line 720
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 721
    .line 722
    .line 723
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 724
    .line 725
    .line 726
    move-result-object v4

    .line 727
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 728
    .line 729
    .line 730
    move-result-object v4

    .line 731
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    .line 733
    .line 734
    const-string v4, "----onVideoChannelRemoveExt userID="

    .line 735
    .line 736
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 737
    .line 738
    .line 739
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 740
    .line 741
    .line 742
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 743
    .line 744
    .line 745
    move-result-object v3

    .line 746
    invoke-virtual {v2, v13, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    .line 748
    .line 749
    iget-object v0, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 750
    .line 751
    invoke-static {v0}, Ll/tc0;->i4(Ll/tc0;)Ll/fbl0;

    .line 752
    .line 753
    .line 754
    move-result-object v0

    .line 755
    int-to-long v1, v1

    .line 756
    invoke-interface {v0, v1, v2, v7}, Ll/fbl0;->b(JI)V

    .line 757
    .line 758
    .line 759
    return-void

    .line 760
    :cond_c
    invoke-static {v4}, Ll/tc0;->e4(Ll/tc0;)Ll/gkl0;

    .line 761
    .line 762
    .line 763
    move-result-object v2

    .line 764
    if-eqz v2, :cond_d

    .line 765
    .line 766
    iget-object v2, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 767
    .line 768
    invoke-static {v2}, Ll/tc0;->e4(Ll/tc0;)Ll/gkl0;

    .line 769
    .line 770
    .line 771
    move-result-object v2

    .line 772
    int-to-long v4, v1

    .line 773
    invoke-interface {v2, v4, v5, v7}, Ll/gkl0;->b(JI)V

    .line 774
    .line 775
    .line 776
    iget-object v0, v0, Ll/tc0$e;->a:Ll/tc0;

    .line 777
    .line 778
    invoke-static {v0}, Ll/tc0;->j4(Ll/tc0;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 779
    .line 780
    .line 781
    move-result-object v0

    .line 782
    invoke-virtual {v0, v4, v5, v3}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 783
    .line 784
    .line 785
    :cond_d
    return-void
.end method

.method public onVideoSizeChanged(Lio/agora/rtc2/Constants$VideoSourceType;IIII)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p5, "onVideoSizeChanged uid"

    .line 4
    .line 5
    invoke-direct {p1, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p5, ",width "

    .line 12
    .line 13
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p5, ", height"

    .line 20
    .line 21
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p5, "lqdebug"

    .line 32
    .line 33
    invoke-static {p5, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 37
    .line 38
    invoke-static {p1}, Ll/tc0;->e3(Ll/tc0;)Ll/evx;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p5, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v0, "onVideoSizeChanged uid:"

    .line 45
    .line 46
    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ", width:"

    .line 53
    .line 54
    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, ", height:"

    .line 61
    .line 62
    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p5

    .line 72
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p5

    .line 76
    invoke-virtual {p1, p5}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 80
    .line 81
    invoke-static {p1}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_0

    .line 86
    .line 87
    if-eqz p2, :cond_0

    .line 88
    .line 89
    iget-object p0, p0, Ll/tc0$e;->a:Ll/tc0;

    .line 90
    .line 91
    invoke-static {p0}, Ll/tc0;->B4(Ll/tc0;)Ll/kod0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, p2, p3, p4}, Ll/kod0;->r(III)V

    .line 96
    .line 97
    .line 98
    :cond_0
    return-void
.end method
