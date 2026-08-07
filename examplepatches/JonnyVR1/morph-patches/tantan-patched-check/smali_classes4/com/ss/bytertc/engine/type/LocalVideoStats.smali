.class public Lcom/ss/bytertc/engine/type/LocalVideoStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public codecType:I

.field public encodedBitrate:I

.field public encodedFrameCount:I

.field public encodedFrameHeight:I

.field public encodedFrameWidth:I

.field public encoderOutputFrameRate:I

.field public inputFrameRate:I

.field public isScreen:Z

.field public jitter:I

.field public rendererOutputFrameRate:I

.field public rtt:I

.field public sentFrameRate:I

.field public sentKBitrate:F

.field public statsInterval:I

.field public videoDenoiseMode:I

.field public videoLossRate:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalLocalVideoStats;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->sentKBitrate:F

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->sentKBitrate:F

    .line 7
    .line 8
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->inputFrameRate:I

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->inputFrameRate:I

    .line 11
    .line 12
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->sentFrameRate:I

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->sentFrameRate:I

    .line 15
    .line 16
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encoderOutputFrameRate:I

    .line 17
    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encoderOutputFrameRate:I

    .line 19
    .line 20
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->rendererOutputFrameRate:I

    .line 21
    .line 22
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->rendererOutputFrameRate:I

    .line 23
    .line 24
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->statsInterval:I

    .line 25
    .line 26
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->statsInterval:I

    .line 27
    .line 28
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->videoLossRate:F

    .line 29
    .line 30
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->videoLossRate:F

    .line 31
    .line 32
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->rtt:I

    .line 33
    .line 34
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->rtt:I

    .line 35
    .line 36
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedBitrate:I

    .line 37
    .line 38
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedBitrate:I

    .line 39
    .line 40
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedFrameWidth:I

    .line 41
    .line 42
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameWidth:I

    .line 43
    .line 44
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedFrameHeight:I

    .line 45
    .line 46
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameHeight:I

    .line 47
    .line 48
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedFrameCount:I

    .line 49
    .line 50
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameCount:I

    .line 51
    .line 52
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->codecType:I

    .line 53
    .line 54
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->codecType:I

    .line 55
    .line 56
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->isScreen:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->isScreen:Z

    .line 59
    .line 60
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->jitter:I

    .line 61
    .line 62
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->jitter:I

    .line 63
    .line 64
    iget p1, p1, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->videoDenoiseMode:I

    .line 65
    .line 66
    iput p1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->videoDenoiseMode:I

    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LocalVideoStats{sentKBitrate=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->sentKBitrate:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', inputFrameRate=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->inputFrameRate:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', sentFrameRate=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->sentFrameRate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', encoderOutputFrameRate=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encoderOutputFrameRate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', rendererOutputFrameRate=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->rendererOutputFrameRate:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', videoLossRate=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->videoLossRate:F

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

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
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->rtt:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', statsInterval=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->statsInterval:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', encodedBitrate=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedBitrate:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', encodedFrameWidth=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameWidth:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', encodedFrameHeight=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameHeight:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, "\', encodedFrameCount=\'"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameCount:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', codecType=\'"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->codecType:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\', isScreen=\'"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->isScreen:Z

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "\', jitter=\'"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->jitter:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "\', videoDenoiseMode"

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget p0, p0, Lcom/ss/bytertc/engine/type/LocalVideoStats;->videoDenoiseMode:I

    .line 159
    .line 160
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string p0, "\'}"

    .line 164
    .line 165
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0
.end method
