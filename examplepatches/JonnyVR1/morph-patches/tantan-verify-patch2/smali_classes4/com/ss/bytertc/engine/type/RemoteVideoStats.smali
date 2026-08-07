.class public Lcom/ss/bytertc/engine/type/RemoteVideoStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public avSyncDiffMs:I

.field public capToRenderDelay:I

.field public codecElapsePerFrame:I

.field public codecType:I

.field public decoderOutputFrameRate:I

.field public e2eDelay:J

.field public frozenRate:I

.field public height:I

.field public isScreen:Z

.field public jitter:I

.field public receivedKBitrate:F

.field public rendererOutputFrameRate:I

.field public rtt:I

.field public stallCount:I

.field public stallDuration:I

.field public statsInterval:I

.field public superResolutionMode:I

.field public videoIndex:I

.field public videoLossRate:F

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalRemoteVideoStats;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->width:I

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->width:I

    .line 7
    .line 8
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->height:I

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->height:I

    .line 11
    .line 12
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->videoLossRate:F

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->videoLossRate:F

    .line 15
    .line 16
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->receivedKBitrate:F

    .line 17
    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->receivedKBitrate:F

    .line 19
    .line 20
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->decoderOutputFrameRate:I

    .line 21
    .line 22
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->decoderOutputFrameRate:I

    .line 23
    .line 24
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->rendererOutputFrameRate:I

    .line 25
    .line 26
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->rendererOutputFrameRate:I

    .line 27
    .line 28
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->stallCount:I

    .line 29
    .line 30
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->stallCount:I

    .line 31
    .line 32
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->stallDuration:I

    .line 33
    .line 34
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->stallDuration:I

    .line 35
    .line 36
    iget-wide v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->e2eDelay:J

    .line 37
    .line 38
    iput-wide v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->e2eDelay:J

    .line 39
    .line 40
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->isScreen:Z

    .line 41
    .line 42
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->isScreen:Z

    .line 43
    .line 44
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->statsInterval:I

    .line 45
    .line 46
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->statsInterval:I

    .line 47
    .line 48
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->rtt:I

    .line 49
    .line 50
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->rtt:I

    .line 51
    .line 52
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->frozenRate:I

    .line 53
    .line 54
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->frozenRate:I

    .line 55
    .line 56
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->codecType:I

    .line 57
    .line 58
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->codecType:I

    .line 59
    .line 60
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->videoIndex:I

    .line 61
    .line 62
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->videoIndex:I

    .line 63
    .line 64
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->jitter:I

    .line 65
    .line 66
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->jitter:I

    .line 67
    .line 68
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->superResolutionMode:I

    .line 69
    .line 70
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->superResolutionMode:I

    .line 71
    .line 72
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->capToRenderDelay:I

    .line 73
    .line 74
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->capToRenderDelay:I

    .line 75
    .line 76
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->avSyncDiffMs:I

    .line 77
    .line 78
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->avSyncDiffMs:I

    .line 79
    .line 80
    iget p1, p1, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->codecElapsePerFrame:I

    .line 81
    .line 82
    iput p1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->codecElapsePerFrame:I

    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RemoteVideoStats{width=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->width:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', height=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->height:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', videoLossRate=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->videoLossRate:F

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', receivedKBitrate=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->receivedKBitrate:F

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', decoderOutputFrameRate=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->decoderOutputFrameRate:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', rendererOutputFrameRate=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->rendererOutputFrameRate:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', stallCount=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->stallCount:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', stallDuration=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->stallDuration:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', e2eDelay=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-wide v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->e2eDelay:J

    .line 89
    .line 90
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', isScreen=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->isScreen:Z

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', rtt=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->rtt:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, "\', frozenRate=\'"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->frozenRate:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', videoIndex=\'"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->videoIndex:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\', jitter=\'"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->jitter:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "\', codecType=\'"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->codecType:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "\', superResolutionMode=\'"

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->superResolutionMode:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, "\', capToRenderDelay=\'"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->capToRenderDelay:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, "\', avSyncDiffMs=\'"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->avSyncDiffMs:I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "\', codecElapsePerFrame=\'"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget p0, p0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->codecElapsePerFrame:I

    .line 189
    .line 190
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string p0, "\'}"

    .line 194
    .line 195
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    return-object p0
.end method
