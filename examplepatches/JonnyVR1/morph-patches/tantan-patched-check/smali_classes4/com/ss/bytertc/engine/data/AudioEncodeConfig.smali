.class public Lcom/ss/bytertc/engine/data/AudioEncodeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public channelNum:I

.field public codecType:I

.field public encBitrate:I

.field public encMode:I

.field public packetSize:I

.field public sampleRate:I

.field public useDtx:I

.field public useInbandfec:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->codecType:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encMode:I

    .line 8
    .line 9
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->channelNum:I

    .line 10
    .line 11
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encBitrate:I

    .line 12
    .line 13
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useDtx:I

    .line 14
    .line 15
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useInbandfec:I

    .line 16
    .line 17
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->sampleRate:I

    .line 18
    .line 19
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->packetSize:I

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(IIIIIIII)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->codecType:I

    .line 24
    iput p2, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encMode:I

    .line 25
    iput p3, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->channelNum:I

    .line 26
    iput p4, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encBitrate:I

    .line 27
    iput p5, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useDtx:I

    .line 28
    iput p6, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useInbandfec:I

    .line 29
    iput p7, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->sampleRate:I

    .line 30
    iput p8, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->packetSize:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioEncodeConfig{codecType=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->codecType:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\'encMode=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encMode:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', channelNum=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->channelNum:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', encBitrate=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->encBitrate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', useDtx=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useDtx:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', useInbandfec=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->useInbandfec:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', sampleRate=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->sampleRate:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', packetSize=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioEncodeConfig;->packetSize:I

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p0, "\'}"

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method
