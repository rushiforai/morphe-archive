.class public Ltv/danmaku/ijk/media/player/PullWatchInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final TAG:Ljava/lang/String; = "PullWatchInfo"


# instance fields
.field public audioBitRate:J

.field public audioBuffer:I

.field private audioFistRender:I

.field public audioSampleRate:I

.field private baseMark:I

.field private bufferCurrent:I

.field private bufferFirst:I

.field private bufferInternal:I

.field private bufferLast:I

.field private bufferNext:I

.field public cpuAndMem:Ljava/lang/String;

.field private currentTimeMs:J

.field public delay:I

.field private dns:Ljava/lang/String;

.field private dropMark:I

.field private droping:Z

.field private dropingCount:I

.field public dstip:Ljava/lang/String;

.field private enable:I

.field public fps:I

.field public height:I

.field public isH265:I

.field private mShowupDebugInfoIndex:J

.field private mUpdateMaxBuffer:I

.field private playerType:Ljava/lang/String;

.field private pre_AudioSize:J

.field private pre_VideoOutputFrames:J

.field private pre_VideoSize:J

.field private pullDetects:Ljava/lang/String;

.field private speedRate:F

.field private speedupMark:I

.field public url:Ljava/lang/String;

.field public videoBitRate:J

.field public videoBuffer:I

.field private videoFirstRender:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->enable:I

    .line 6
    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->baseMark:I

    .line 8
    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->speedupMark:I

    .line 10
    .line 11
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropMark:I

    .line 12
    .line 13
    const/high16 v1, -0x40800000    # -1.0f

    .line 14
    .line 15
    iput v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->speedRate:F

    .line 16
    .line 17
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoFirstRender:I

    .line 18
    .line 19
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioFistRender:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->droping:Z

    .line 23
    .line 24
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropingCount:I

    .line 25
    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mShowupDebugInfoIndex:J

    .line 29
    .line 30
    const-string v3, ""

    .line 31
    .line 32
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dns:Ljava/lang/String;

    .line 33
    .line 34
    const-wide/16 v3, -0x1

    .line 35
    .line 36
    iput-wide v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->currentTimeMs:J

    .line 37
    .line 38
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoOutputFrames:J

    .line 39
    .line 40
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_AudioSize:J

    .line 41
    .line 42
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoSize:J

    .line 43
    .line 44
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->width:I

    .line 45
    .line 46
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->height:I

    .line 47
    .line 48
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->isH265:I

    .line 49
    .line 50
    iput v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mUpdateMaxBuffer:I

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public dropFrameMessage(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->droping:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropingCount:I

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropingCount:I

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 5

    .line 1
    const-string v0, "PullWatchInfo"

    .line 2
    .line 3
    const-string v1, "reset"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mShowupDebugInfoIndex:J

    .line 11
    .line 12
    const/4 v2, -0x1

    .line 13
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->enable:I

    .line 14
    .line 15
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->baseMark:I

    .line 16
    .line 17
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->speedupMark:I

    .line 18
    .line 19
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropMark:I

    .line 20
    .line 21
    const/high16 v2, -0x40800000    # -1.0f

    .line 22
    .line 23
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->speedRate:F

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->droping:Z

    .line 27
    .line 28
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropingCount:I

    .line 29
    .line 30
    const-string v3, ""

    .line 31
    .line 32
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pullDetects:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->url:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->cpuAndMem:Ljava/lang/String;

    .line 37
    .line 38
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->fps:I

    .line 39
    .line 40
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBuffer:I

    .line 41
    .line 42
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBuffer:I

    .line 43
    .line 44
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->delay:I

    .line 45
    .line 46
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoFirstRender:I

    .line 47
    .line 48
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioFistRender:I

    .line 49
    .line 50
    const-wide/16 v3, -0x1

    .line 51
    .line 52
    iput-wide v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->currentTimeMs:J

    .line 53
    .line 54
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBitRate:J

    .line 55
    .line 56
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBitRate:J

    .line 57
    .line 58
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoOutputFrames:J

    .line 59
    .line 60
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_AudioSize:J

    .line 61
    .line 62
    iput-wide v0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoSize:J

    .line 63
    .line 64
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->width:I

    .line 65
    .line 66
    iput v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->height:I

    .line 67
    .line 68
    return-void
.end method

.method public setAudioSampleRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioSampleRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setBufferParms(IIIII)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->bufferFirst:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->bufferCurrent:I

    .line 4
    .line 5
    iput p3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->bufferNext:I

    .line 6
    .line 7
    iput p4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->bufferLast:I

    .line 8
    .line 9
    iput p5, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->bufferInternal:I

    .line 10
    .line 11
    return-void
.end method

.method public setDstIp(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dstip:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlayerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->playerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPullDebugInfoParms(JJJIIIIILjava/lang/String;Ljava/lang/String;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p3

    .line 6
    .line 7
    move-wide/from16 v5, p5

    .line 8
    .line 9
    iget-wide v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->currentTimeMs:J

    .line 10
    .line 11
    const-wide/16 v9, -0x1

    .line 12
    .line 13
    cmp-long v7, v7, v9

    .line 14
    .line 15
    const-wide/16 v8, 0x0

    .line 16
    .line 17
    if-nez v7, :cond_0

    .line 18
    .line 19
    const/4 v7, 0x0

    .line 20
    iput v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->fps:I

    .line 21
    .line 22
    iput-wide v8, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBitRate:J

    .line 23
    .line 24
    iput-wide v8, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBitRate:J

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 29
    .line 30
    .line 31
    move-result-wide v10

    .line 32
    iget-wide v12, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->currentTimeMs:J

    .line 33
    .line 34
    sub-long/2addr v10, v12

    .line 35
    const-wide/16 v12, 0x3e8

    .line 36
    .line 37
    div-long/2addr v10, v12

    .line 38
    cmp-long v7, v10, v8

    .line 39
    .line 40
    if-eqz v7, :cond_1

    .line 41
    .line 42
    iget-wide v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoOutputFrames:J

    .line 43
    .line 44
    sub-long v7, v5, v7

    .line 45
    .line 46
    div-long/2addr v7, v10

    .line 47
    long-to-int v7, v7

    .line 48
    iput v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->fps:I

    .line 49
    .line 50
    iget-wide v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_AudioSize:J

    .line 51
    .line 52
    sub-long v7, v1, v7

    .line 53
    .line 54
    const-wide/16 v12, 0x8

    .line 55
    .line 56
    mul-long/2addr v7, v12

    .line 57
    const-wide/16 v14, 0x400

    .line 58
    .line 59
    mul-long/2addr v10, v14

    .line 60
    div-long/2addr v7, v10

    .line 61
    iput-wide v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBitRate:J

    .line 62
    .line 63
    iget-wide v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoSize:J

    .line 64
    .line 65
    sub-long v7, v3, v7

    .line 66
    .line 67
    mul-long/2addr v7, v12

    .line 68
    div-long/2addr v7, v10

    .line 69
    iput-wide v7, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBitRate:J

    .line 70
    .line 71
    new-instance v7, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v8, "fps "

    .line 74
    .line 75
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-wide v8, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoOutputFrames:J

    .line 79
    .line 80
    sub-long v8, v5, v8

    .line 81
    .line 82
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v8, "   "

    .line 86
    .line 87
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget v9, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->fps:I

    .line 91
    .line 92
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    const-string v9, "PullWatchInfo"

    .line 100
    .line 101
    invoke-static {v9, v7}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    new-instance v7, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v10, "audioBitRate "

    .line 107
    .line 108
    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-wide v10, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_AudioSize:J

    .line 112
    .line 113
    sub-long v10, v1, v10

    .line 114
    .line 115
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-wide v10, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBitRate:J

    .line 122
    .line 123
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    invoke-static {v9, v7}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    new-instance v7, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v10, "videoBitRate "

    .line 136
    .line 137
    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-wide v10, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoSize:J

    .line 141
    .line 142
    sub-long v10, v3, v10

    .line 143
    .line 144
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget-wide v10, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBitRate:J

    .line 151
    .line 152
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-static {v9, v7}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    :cond_1
    :goto_0
    iput-wide v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_AudioSize:J

    .line 163
    .line 164
    iput-wide v3, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoSize:J

    .line 165
    .line 166
    iput-wide v5, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pre_VideoOutputFrames:J

    .line 167
    .line 168
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 169
    .line 170
    .line 171
    move-result-wide v1

    .line 172
    iput-wide v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->currentTimeMs:J

    .line 173
    .line 174
    move/from16 v1, p9

    .line 175
    .line 176
    iput v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBuffer:I

    .line 177
    .line 178
    move/from16 v1, p10

    .line 179
    .line 180
    iput v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBuffer:I

    .line 181
    .line 182
    move/from16 v1, p11

    .line 183
    .line 184
    iput v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->delay:I

    .line 185
    .line 186
    move-object/from16 v1, p12

    .line 187
    .line 188
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->cpuAndMem:Ljava/lang/String;

    .line 189
    .line 190
    move-object/from16 v1, p13

    .line 191
    .line 192
    iput-object v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->pullDetects:Ljava/lang/String;

    .line 193
    .line 194
    move/from16 v1, p8

    .line 195
    .line 196
    iput v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoFirstRender:I

    .line 197
    .line 198
    move/from16 v1, p7

    .line 199
    .line 200
    iput v1, v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioFistRender:I

    .line 201
    .line 202
    return-void
.end method

.method public setPullDebugInfoWH(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->width:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->height:I

    .line 4
    .line 5
    return-void
.end method

.method public setSpeedupParms(IIIIF)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->enable:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->baseMark:I

    .line 4
    .line 5
    iput p3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->speedupMark:I

    .line 6
    .line 7
    iput p4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dropMark:I

    .line 8
    .line 9
    iput p5, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->speedRate:F

    .line 10
    .line 11
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoIsH265(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->isH265:I

    .line 2
    .line 3
    return-void
.end method

.method public showPullInfos()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mShowupDebugInfoIndex:J

    .line 7
    .line 8
    const-wide/16 v3, 0x1

    .line 9
    .line 10
    add-long/2addr v1, v3

    .line 11
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mShowupDebugInfoIndex:J

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "player: "

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->playerType:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "\n"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "i: "

    .line 40
    .line 41
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-wide v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mShowupDebugInfoIndex:J

    .line 45
    .line 46
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v3, "fps: "

    .line 62
    .line 63
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->fps:I

    .line 67
    .line 68
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v3, "/"

    .line 72
    .line 73
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget v4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->width:I

    .line 77
    .line 78
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget v4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->height:I

    .line 85
    .line 86
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    new-instance v1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    const-string v4, "delay: "

    .line 102
    .line 103
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget v4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->delay:I

    .line 107
    .line 108
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v4, "audioSampleRate: "

    .line 124
    .line 125
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget v4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioSampleRate:I

    .line 129
    .line 130
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v4, "v buffer: "

    .line 146
    .line 147
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget v4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBuffer:I

    .line 151
    .line 152
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v4, " Ms\n"

    .line 156
    .line 157
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v5, "a buffer: "

    .line 170
    .line 171
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget v5, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBuffer:I

    .line 175
    .line 176
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    new-instance v1, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    const-string v4, "bitrate/v/a: "

    .line 192
    .line 193
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    iget-wide v4, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->videoBitRate:J

    .line 197
    .line 198
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget-wide v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->audioBitRate:J

    .line 205
    .line 206
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v3, " kbps\n"

    .line 210
    .line 211
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    new-instance v1, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    const-string v3, "cpu/mem : "

    .line 224
    .line 225
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->cpuAndMem:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v3, " MB\n"

    .line 234
    .line 235
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    new-instance v1, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    const-string v3, "ip : "

    .line 248
    .line 249
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->dstip:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    new-instance v1, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v3, "url\uff1a"

    .line 270
    .line 271
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->url:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    new-instance v1, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    const-string v3, "isH265:"

    .line 292
    .line 293
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iget p0, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->isH265:I

    .line 297
    .line 298
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    return-object p0
.end method

.method public updateMaxBufferLog(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/PullWatchInfo;->mUpdateMaxBuffer:I

    .line 2
    .line 3
    return-void
.end method
