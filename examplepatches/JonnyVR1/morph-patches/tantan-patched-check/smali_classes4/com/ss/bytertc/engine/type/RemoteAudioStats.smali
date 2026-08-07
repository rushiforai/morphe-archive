.class public Lcom/ss/bytertc/engine/type/RemoteAudioStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioLossRate:F

.field public concealedSamples:I

.field public concealmentEvent:I

.field public decDuration:I

.field public decSampleRate:I

.field public decodeFrameRate:D

.field public e2eDelay:J

.field public frozenRate:I

.field public jitter:I

.field public jitterBufferDelay:I

.field public numChannels:I

.field public playoutSampleRate:I

.field public quality:I

.field public receivedKBitrate:F

.field public receivedSampleRate:I

.field public rtt:I

.field public stallCount:I

.field public stallDuration:I

.field public statsInterval:I

.field public totalRtt:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalRemoteAudioStats;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->audioLossRate:F

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->audioLossRate:F

    .line 7
    .line 8
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->receivedKBitrate:I

    .line 9
    .line 10
    int-to-float v0, v0

    .line 11
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->receivedKBitrate:F

    .line 12
    .line 13
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->stallCount:I

    .line 14
    .line 15
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->stallCount:I

    .line 16
    .line 17
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->stallDuration:I

    .line 18
    .line 19
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->stallDuration:I

    .line 20
    .line 21
    iget-wide v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->e2eDelay:J

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->e2eDelay:J

    .line 24
    .line 25
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->playoutSampleRate:I

    .line 26
    .line 27
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->playoutSampleRate:I

    .line 28
    .line 29
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->statsInterval:I

    .line 30
    .line 31
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->statsInterval:I

    .line 32
    .line 33
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->rtt:I

    .line 34
    .line 35
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->rtt:I

    .line 36
    .line 37
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->totalRtt:I

    .line 38
    .line 39
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->totalRtt:I

    .line 40
    .line 41
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->quality:I

    .line 42
    .line 43
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->quality:I

    .line 44
    .line 45
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->jitterBufferDelay:I

    .line 46
    .line 47
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->jitterBufferDelay:I

    .line 48
    .line 49
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->numChannels:I

    .line 50
    .line 51
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->numChannels:I

    .line 52
    .line 53
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->receivedSampleRate:I

    .line 54
    .line 55
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->receivedSampleRate:I

    .line 56
    .line 57
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->frozenRate:I

    .line 58
    .line 59
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->frozenRate:I

    .line 60
    .line 61
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->concealedSamples:I

    .line 62
    .line 63
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->concealedSamples:I

    .line 64
    .line 65
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->concealmentEvent:I

    .line 66
    .line 67
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->concealmentEvent:I

    .line 68
    .line 69
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->decSampleRate:I

    .line 70
    .line 71
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->decSampleRate:I

    .line 72
    .line 73
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->decDuration:I

    .line 74
    .line 75
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->decDuration:I

    .line 76
    .line 77
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->jitter:I

    .line 78
    .line 79
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->jitter:I

    .line 80
    .line 81
    iget-wide v0, p1, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->decodeFrameRate:D

    .line 82
    .line 83
    iput-wide v0, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->decodeFrameRate:D

    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RemoteAudioStats{audioLossRate=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->audioLossRate:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', receivedKBitrate=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->receivedKBitrate:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', stallCount=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->stallCount:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', stallDuration=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->stallDuration:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', playoutSampleRate=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->playoutSampleRate:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', e2eDelay=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->e2eDelay:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', rtt=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->rtt:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', quality=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->quality:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', jitterBufferDelay=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->jitterBufferDelay:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', numChannels=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->numChannels:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', receivedSampleRate=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->receivedSampleRate:I

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
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->frozenRate:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', concealedSamples=\'"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->concealedSamples:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\', concealmentEvent=\'"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->concealmentEvent:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "\', decSampleRate=\'"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->decSampleRate:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "\', decDuration=\'"

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->decDuration:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, "\', total_rtt=\'"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->totalRtt:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, "\', jitter=\'"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->jitter:I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "\', decodeFrameRate=\'"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-wide v1, p0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->decodeFrameRate:D

    .line 189
    .line 190
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

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
