.class public Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public pitch:I

.field public playCount:I

.field public startPos:I

.field public type:Lcom/ss/bytertc/engine/data/AudioMixingType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioMixingType;->AUDIO_MIXING_TYPE_PLAYOUT_AND_PUBLISH:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->playCount:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->startPos:I

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->pitch:I

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/data/AudioMixingType;III)V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioMixingType;->AUDIO_MIXING_TYPE_PLAYOUT:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 19
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 20
    iput p2, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->playCount:I

    .line 21
    iput p3, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->startPos:I

    .line 22
    iput p4, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->pitch:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioEffectPlayerConfig{type=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', playCount=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->playCount:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', startPos=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->startPos:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', pitch=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->pitch:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "\'}"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
