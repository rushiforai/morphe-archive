.class public Lcom/ss/bytertc/engine/type/LocalAudioStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioDeviceLoopDelay:I

.field public audioLossRate:F

.field public encodeFrameRate:D

.field public jitter:I

.field public numChannels:I

.field public recordSampleRate:I

.field public rtt:I

.field public sendKBitrate:F

.field public sentSampleRate:I

.field public statsInterval:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalLocalAudioStats;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->audioLossRate:F

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->audioLossRate:F

    .line 7
    .line 8
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->sendKBitrate:I

    .line 9
    .line 10
    int-to-float v0, v0

    .line 11
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->sendKBitrate:F

    .line 12
    .line 13
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->recordSampleRate:I

    .line 14
    .line 15
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->recordSampleRate:I

    .line 16
    .line 17
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->statsInterval:I

    .line 18
    .line 19
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->statsInterval:I

    .line 20
    .line 21
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->rtt:I

    .line 22
    .line 23
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->rtt:I

    .line 24
    .line 25
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->numChannels:I

    .line 26
    .line 27
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->numChannels:I

    .line 28
    .line 29
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->sentSampleRate:I

    .line 30
    .line 31
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->sentSampleRate:I

    .line 32
    .line 33
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->jitter:I

    .line 34
    .line 35
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->jitter:I

    .line 36
    .line 37
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->audioDeviceLoopDelay:I

    .line 38
    .line 39
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->audioDeviceLoopDelay:I

    .line 40
    .line 41
    iget-wide v0, p1, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->encodeFrameRate:D

    .line 42
    .line 43
    iput-wide v0, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->encodeFrameRate:D

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LocalAudioStats{audioLossRate=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->audioLossRate:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', sendKBitrate=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->sendKBitrate:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', recordSampleRate=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->recordSampleRate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', statsInterval=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->statsInterval:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', rtt=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->rtt:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', numChannels=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->numChannels:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', sentSampleRate=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->sentSampleRate:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', jitter=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->jitter:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', audioDeviceLoopDelay=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->audioDeviceLoopDelay:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', encodeFrameRate=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-wide v1, p0, Lcom/ss/bytertc/engine/type/LocalAudioStats;->encodeFrameRate:D

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p0, "\'}"

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
