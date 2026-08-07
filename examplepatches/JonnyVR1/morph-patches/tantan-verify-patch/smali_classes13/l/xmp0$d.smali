.class Ll/xmp0$d;
.super Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;
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
    iput-object p1, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLocalStreamStats(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/type/LocalStreamStats;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;->onLocalStreamStats(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/type/LocalStreamStats;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_MAIN:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 5
    .line 6
    if-ne p1, v0, :cond_1

    .line 7
    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 11
    .line 12
    invoke-static {p1}, Ll/xmp0;->q2(Ll/xmp0;)Ll/wvx;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/xmp0;->r2(Ll/xmp0;)Ll/uow;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-boolean v0, v0, Ll/uow;->H0:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-wide/16 v0, 0x2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-wide/16 v0, 0x0

    .line 30
    .line 31
    :goto_0
    iput-wide v0, p1, Ll/wvx;->g:J

    .line 32
    .line 33
    iget-object p1, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 34
    .line 35
    invoke-static {p1}, Ll/xmp0;->S3(Ll/xmp0;)Ll/wvx;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v0, p2, Lcom/ss/bytertc/engine/type/LocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 40
    .line 41
    iget v0, v0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameCount:I

    .line 42
    .line 43
    int-to-long v0, v0

    .line 44
    iput-wide v0, p1, Ll/wvx;->H:J

    .line 45
    .line 46
    iget-object p1, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 47
    .line 48
    invoke-static {p1}, Ll/xmp0;->d4(Ll/xmp0;)Ll/wvx;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p2, p2, Lcom/ss/bytertc/engine/type/LocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 53
    .line 54
    iget p2, p2, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encoderOutputFrameRate:I

    .line 55
    .line 56
    int-to-long v0, p2

    .line 57
    iput-wide v0, p1, Ll/wvx;->Q:J

    .line 58
    .line 59
    :cond_1
    iget-object p0, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 60
    .line 61
    invoke-static {p0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onRemoteStreamStats(Lcom/ss/bytertc/engine/data/StreamKey;Lcom/ss/bytertc/engine/type/RemoteStreamStats;)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandlerEx;->onRemoteStreamStats(Lcom/ss/bytertc/engine/data/StreamKey;Lcom/ss/bytertc/engine/type/RemoteStreamStats;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_MAIN:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 9
    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    iget-object p0, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p1, p2, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->uid:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/iny;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    iget-object p1, p2, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->audioStats:Lcom/ss/bytertc/engine/type/RemoteAudioStats;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget v0, p1, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->receivedKBitrate:F

    .line 39
    .line 40
    float-to-long v1, v0

    .line 41
    iput-wide v1, p0, Ll/iny;->a:J

    .line 42
    .line 43
    iget v1, p0, Ll/iny;->t:I

    .line 44
    .line 45
    iget v2, p1, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->concealmentEvent:I

    .line 46
    .line 47
    add-int/2addr v1, v2

    .line 48
    iput v1, p0, Ll/iny;->t:I

    .line 49
    .line 50
    iget v1, p0, Ll/iny;->u:I

    .line 51
    .line 52
    add-int/2addr v1, v2

    .line 53
    iput v1, p0, Ll/iny;->u:I

    .line 54
    .line 55
    iget v1, p0, Ll/iny;->z:I

    .line 56
    .line 57
    int-to-float v1, v1

    .line 58
    iget v2, p1, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->audioLossRate:F

    .line 59
    .line 60
    const/high16 v3, 0x41200000    # 10.0f

    .line 61
    .line 62
    mul-float/2addr v3, v2

    .line 63
    add-float/2addr v1, v3

    .line 64
    float-to-int v1, v1

    .line 65
    iput v1, p0, Ll/iny;->z:I

    .line 66
    .line 67
    iget v1, p0, Ll/iny;->A:I

    .line 68
    .line 69
    iput v1, p0, Ll/iny;->A:I

    .line 70
    .line 71
    float-to-int v1, v2

    .line 72
    mul-int/lit8 v1, v1, 0x64

    .line 73
    .line 74
    iput v1, p0, Ll/iny;->k:I

    .line 75
    .line 76
    iget v1, p0, Ll/iny;->j:I

    .line 77
    .line 78
    int-to-long v1, v1

    .line 79
    iget-wide v3, p1, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->e2eDelay:J

    .line 80
    .line 81
    add-long/2addr v1, v3

    .line 82
    long-to-int v1, v1

    .line 83
    iput v1, p0, Ll/iny;->j:I

    .line 84
    .line 85
    iget v1, p0, Ll/iny;->B:I

    .line 86
    .line 87
    add-int/lit8 v1, v1, 0x1

    .line 88
    .line 89
    iput v1, p0, Ll/iny;->B:I

    .line 90
    .line 91
    iget-wide v1, p0, Ll/iny;->f:J

    .line 92
    .line 93
    float-to-int v0, v0

    .line 94
    div-int/lit8 v0, v0, 0x8

    .line 95
    .line 96
    mul-int/lit16 v0, v0, 0x7d0

    .line 97
    .line 98
    int-to-long v3, v0

    .line 99
    add-long/2addr v1, v3

    .line 100
    iput-wide v1, p0, Ll/iny;->f:J

    .line 101
    .line 102
    iget v0, p0, Ll/iny;->F:I

    .line 103
    .line 104
    iget p1, p1, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->stallDuration:I

    .line 105
    .line 106
    add-int/2addr v0, p1

    .line 107
    iput v0, p0, Ll/iny;->F:I

    .line 108
    .line 109
    :cond_0
    iget-object p1, p2, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 110
    .line 111
    if-eqz p1, :cond_2

    .line 112
    .line 113
    iget v0, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->receivedKBitrate:F

    .line 114
    .line 115
    float-to-int v0, v0

    .line 116
    iget v1, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->rendererOutputFrameRate:I

    .line 117
    .line 118
    iget v2, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->width:I

    .line 119
    .line 120
    iget p1, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->height:I

    .line 121
    .line 122
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/iny;->k(IIII)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p2, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 126
    .line 127
    iget p2, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->videoLossRate:F

    .line 128
    .line 129
    float-to-int p2, p2

    .line 130
    mul-int/lit8 p2, p2, 0x64

    .line 131
    .line 132
    iput p2, p0, Ll/iny;->m:I

    .line 133
    .line 134
    iget-wide v0, p0, Ll/iny;->e:J

    .line 135
    .line 136
    iget p2, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->receivedKBitrate:F

    .line 137
    .line 138
    float-to-int p2, p2

    .line 139
    div-int/lit8 p2, p2, 0x8

    .line 140
    .line 141
    mul-int/lit16 p2, p2, 0x7d0

    .line 142
    .line 143
    int-to-long v2, p2

    .line 144
    add-long/2addr v0, v2

    .line 145
    iput-wide v0, p0, Ll/iny;->e:J

    .line 146
    .line 147
    iget-wide v0, p0, Ll/iny;->c:J

    .line 148
    .line 149
    iget p2, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->decoderOutputFrameRate:I

    .line 150
    .line 151
    int-to-long v2, p2

    .line 152
    add-long/2addr v0, v2

    .line 153
    iput-wide v0, p0, Ll/iny;->c:J

    .line 154
    .line 155
    iget p2, p0, Ll/iny;->C:I

    .line 156
    .line 157
    add-int/lit8 p2, p2, 0x1

    .line 158
    .line 159
    iput p2, p0, Ll/iny;->C:I

    .line 160
    .line 161
    iget-wide v0, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->e2eDelay:J

    .line 162
    .line 163
    long-to-int p2, v0

    .line 164
    iput p2, p0, Ll/iny;->l:I

    .line 165
    .line 166
    iget p2, p0, Ll/iny;->G:I

    .line 167
    .line 168
    iget p1, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->stallDuration:I

    .line 169
    .line 170
    add-int/2addr p2, p1

    .line 171
    iput p2, p0, Ll/iny;->G:I

    .line 172
    .line 173
    return-void

    .line 174
    :cond_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    sget-object p2, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_3RD:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 179
    .line 180
    if-ne p1, p2, :cond_2

    .line 181
    .line 182
    iget-object p0, p0, Ll/xmp0$d;->a:Ll/xmp0;

    .line 183
    .line 184
    invoke-static {p0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 185
    .line 186
    .line 187
    :cond_2
    return-void
.end method
