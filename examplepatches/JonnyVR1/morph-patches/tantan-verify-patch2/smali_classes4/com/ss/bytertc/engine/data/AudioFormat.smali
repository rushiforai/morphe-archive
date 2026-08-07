.class public Lcom/ss/bytertc/engine/data/AudioFormat;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public channel:Lcom/ss/bytertc/engine/data/AudioChannel;

.field public sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public samplesPerCall:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->samplesPerCall:I

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;I)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 14
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 15
    iput p3, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->samplesPerCall:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioFormat{sampleRate=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', channel=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', samplesPerCall="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioFormat;->samplesPerCall:I

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x7d

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
